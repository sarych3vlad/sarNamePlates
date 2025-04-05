SetCVar("nameplateDistance", 42)

local removedPlates = {}

local frame = CreateFrame("Frame")
frame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
frame:RegisterEvent("NAME_PLATE_UNIT_REMOVED")

local namePlates = {}

frame:SetScript("OnEvent", function(self, event, unit)
    if event == "NAME_PLATE_UNIT_ADDED" then
        local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
        if namePlate then
            namePlates[unit] = namePlate
        end
    elseif event == "NAME_PLATE_UNIT_REMOVED" then
        namePlates[unit] = nil
    end
end)

local ICON_SIZE_MAIN = ICON_SIZE_MAIN
local ICON_SIZE_SECONDARY = ICON_SIZE_SECONDARY
local ICON_SIZE_OTHER = ICON_SIZE_OTHER
local MAX_OTHER_AURAS = MAX_OTHER_AURAS
local MAX_AURAS = MAX_AURAS
local SPELL_DATA = SPELL_DATA
local CentrY = CentrY
local RightX = RightX
local RightY = RightY

local PRIORITY_ORDER = {
    immunities = 65,
    cc = 70,
    silence = 60,
    interrupts = 55,
    roots = 50,
    disarm = 45,
    buffs_defensive = 40,
    buffs_offensive = 35,
    buffs_other = 30,
    snare = 25,
    other = 20
}

local CENTER_AURA_TYPES = { "cc", "silence", "interrupts", "snare", "roots" }
local RIGHT_AURA_TYPES = { "immunities", "buffs_defensive", "buffs_offensive", "buffs_other","disarm" }
local OTHER_AURA_TYPES = { "other" }

local guidToUnitIdMap = {}

local function CreateAuraIcon(frame, size)
    local icon = frame:CreateTexture(nil, "OVERLAY")
    icon:SetSize(size, size)
    icon:SetPoint("CENTER", frame, "CENTER")

    if not frame.cooldownText then
        local cooldownText = frame:CreateFontString(nil, "OVERLAY")
        cooldownText:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
        cooldownText:SetPoint("CENTER", frame, "CENTER")
        cooldownText:SetTextColor(1, 1, 1, 1)
        frame.cooldownText = cooldownText
    end

    if not frame.glow and type(CheeseActionButton_GetOverlayGlow) == "function" then
        frame.glow = CheeseActionButton_GetOverlayGlow()
        if frame.glow then
            frame.glow:SetParent(frame)
            frame.glow:ClearAllPoints()
            frame.glow:SetSize(size * 1.8, size * 1.8)
            frame.glow:SetPoint("CENTER", frame, "CENTER")
            frame.glow:Hide()
            frame.glow.isPlaying = false
        end
    end

    if not frame.border then
        frame.border = frame:CreateTexture(nil, "OVERLAY")
        frame.border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
        frame.border:SetBlendMode("ADD")
        frame.border:SetAlpha(0)
        frame.border:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        frame.border:SetPoint("CENTER", icon, "CENTER", .4, .5)
    end

    local function UpdateBorderSize()
        local iconWidth, iconHeight = icon:GetSize()
        local borderSize = iconWidth * 1.5

        if size == ICON_SIZE_MAIN then
            borderSize = iconWidth * 1.67
        elseif size == ICON_SIZE_SECONDARY then
            borderSize = iconWidth * 1.67
        elseif size == ICON_SIZE_OTHER then
            borderSize = iconWidth * 1.67
        end

        frame.border:SetSize(borderSize, borderSize)
    end

    local function ShowGlowEffect(spellId)
        if not frame.glow or not frame.glow.Show then return end
        if frame.glow.isPlaying then return end
    
        frame.glow:Show()
        frame.glow.isPlaying = true
    
        local color = {1, 0.9, 0.5, 1} -- Жёлтый
        if SPELL_DATA[spellId] then
            if SPELL_DATA[spellId].highlight == 2 then
                color = {0.3, 0.2, 0.6, 0.7} -- фиолетовый
            end
        end

        if frame.glow.outerGlow then frame.glow.outerGlow:SetVertexColor(unpack(color)) end
        if frame.glow.outerGlowOver then frame.glow.outerGlowOver:SetVertexColor(unpack(color)) end
        if frame.glow.innerGlow then frame.glow.innerGlow:SetVertexColor(unpack(color)) end
        if frame.glow.innerGlowOver then frame.glow.innerGlowOver:SetVertexColor(unpack(color)) end
        if frame.glow.ants then frame.glow.ants:SetVertexColor(unpack(color)) end

        if frame.glow.animIn then
            frame.glow.animIn:Play()
            frame.glow.animIn:SetScript("OnFinished", function()
                frame.glow.isPlaying = false
            end)
        end
    end    

    local function ShowBorderEffect(spellId)
        if not frame.border then return end
    
        frame.border:Show()
    
        local color = {1, 0.6, 0, 1}  -- Оранжевый
    
        if SPELL_DATA[spellId] then
            if SPELL_DATA[spellId].highlight == 4 then
                color = {0.7, 0.2, 1, 1} -- фиолетовый
            elseif SPELL_DATA[spellId].highlight == 5 then
                color = {0, .2, .5, 1} -- синий
            end
        end
    
        frame.border:SetVertexColor(unpack(color))
    end    

    local function HideGlowEffect()
        if frame.glow and frame.glow.Hide then
            frame.glow:Hide()
            frame.glow.isPlaying = false
        end
    end

    local function HideBorderEffect()
        if frame.border then
            frame.border:SetAlpha(0)
        end
    end

    frame.ShowGlowEffect = ShowGlowEffect
    frame.HideGlowEffect = HideGlowEffect
    frame.ShowBorderEffect = ShowBorderEffect
    frame.HideBorderEffect = HideBorderEffect
    frame.UpdateBorderSize = UpdateBorderSize
    frame.auraIcon = icon

    UpdateBorderSize()

    return icon
end

local function FormatTimeLeft(timeLeft)
    if timeLeft < 1 then
        return string.format(" %.1f ", timeLeft)
    elseif timeLeft < 60 then
        return string.format(" %.0f ", timeLeft)
    else
        local minutes = math.floor(timeLeft / 60)
        local seconds = timeLeft % 60
        return string.format(" %d:%02d ", minutes, seconds)
    end
end

local function UpdateCooldownText(frame, expirationTime, duration)
    if not frame.cooldownText then return end

    if not expirationTime or expirationTime == 0 or duration == 0 then
        frame.cooldownText:SetText("")
        frame:SetScript("OnUpdate", nil)
        return
    end

    local function OnUpdate(self, elapsed)
        if not frame.auraIcon or not frame.auraIcon:IsShown() then
            frame.cooldownText:SetText("")
            frame:SetScript("OnUpdate", nil)
            return
        end

        local timeLeft = expirationTime - GetTime()
        if timeLeft > 0 then
            frame.cooldownText:SetText(FormatTimeLeft(timeLeft))
        else
            frame.cooldownText:SetText("")
            frame.auraIcon:Hide()
            frame.HideGlowEffect()
            frame.HideBorderEffect()
            frame:SetScript("OnUpdate", nil)
        end
    end

    frame:SetScript("OnUpdate", OnUpdate)
end

local function CreateOtherAuraIcons(frame, size)
    frame.auraIcons = {}

    for i = 1, MAX_OTHER_AURAS do
        local auraFrame = CreateFrame("Frame", nil, frame)
        auraFrame:SetSize(size, size)

        local offsetX
        if i == 1 then
            offsetX = 0
        elseif i % 2 == 0 then
            offsetX = (i / 2) * (size + 2)
        else
            offsetX = -math.ceil(i / 2) * (size + 2)
        end

        auraFrame:SetPoint("CENTER", frame, "CENTER", offsetX, 0)

        local icon = CreateAuraIcon(auraFrame, size)
        auraFrame.icon = icon
        frame.auraIcons[i] = auraFrame
    end
end

local function GetAuraPriority(spellId, desiredTypes)
    local spellInfo = SPELL_DATA[spellId]
    if spellInfo then
        for _, auraType in ipairs(desiredTypes) do
            if spellInfo.type == auraType then
                return PRIORITY_ORDER[auraType], spellInfo.priority or 100, auraType
            end
        end
    end
    return nil, nil, nil
end

local function FindBestAura(unitId, auraTypes)
    local bestAura = nil
    local bestSpellId = nil
    local highestGroupPriority = 0
    local bestSpellPriority = 100

    for spellId, spellData in pairs(SPELL_DATA) do
        local groupPriority, spellPriority, auraType = GetAuraPriority(spellId, auraTypes)
        if groupPriority then
            for i = 1, 40 do
                local _, _, iconTexture, _, _, duration, expirationTime, _, _, _, buffSpellId = UnitBuff(unitId, i)
                if buffSpellId == spellId then
                    if (groupPriority > highestGroupPriority) or (groupPriority == highestGroupPriority and spellPriority < bestSpellPriority) then
                        highestGroupPriority = groupPriority
                        bestSpellPriority = spellPriority
                        bestAura = { iconTexture = iconTexture, duration = duration, expirationTime = expirationTime }
                        bestSpellId = spellId
                    end
                end
            end

            for i = 1, 40 do
                local _, _, iconTexture, _, _, duration, expirationTime, _, _, _, debuffSpellId = UnitDebuff(unitId, i)
                if debuffSpellId == spellId then
                    if (groupPriority > highestGroupPriority) or (groupPriority == highestGroupPriority and spellPriority < bestSpellPriority) then
                        highestGroupPriority = groupPriority
                        bestSpellPriority = spellPriority
                        bestAura = { iconTexture = iconTexture, duration = duration, expirationTime = expirationTime }
                        bestSpellId = spellId
                    end
                end
            end
        end
    end

    return bestAura, bestSpellId
end

local function FindOtherAuras(unitId)
    local foundAuras = {}

    for spellId, spellData in pairs(SPELL_DATA) do
        if spellData.type == "other" then
            for i = 1, 40 do
                local _, _, iconTexture, _, _, duration, expirationTime, caster, _, _, buffSpellId = UnitBuff(unitId, i)
                if buffSpellId == spellId and caster == "player" then
                    table.insert(foundAuras, { 
                        iconTexture = iconTexture, 
                        duration = duration, 
                        expirationTime = expirationTime, 
                        spellId = spellId,
                        priority = spellData.priority or 100
                    })
                end
            end
            for i = 1, 40 do
                local _, _, iconTexture, _, _, duration, expirationTime, caster, _, _, debuffSpellId = UnitDebuff(unitId, i)
                if debuffSpellId == spellId and caster == "player" then
                    table.insert(foundAuras, { 
                        iconTexture = iconTexture, 
                        duration = duration, 
                        expirationTime = expirationTime, 
                        spellId = spellId,
                        priority = spellData.priority or 100
                    })
                end
            end
        end
    end

    table.sort(foundAuras, function(a, b)
        return a.priority < b.priority
    end)

    return foundAuras
end

local function UpdateAuraFrame(namePlate, frame, size, unitId, auraTypes)
	if not frame or not frame.auraIcon then return end
	frame.auraIcon:Hide()
	
	if frame.HideGlowEffect then
		 frame.HideGlowEffect()
	end
	
	if frame.HideBorderEffect then
		 frame.HideBorderEffect()
	end
	
	frame.cooldownText:SetText("")
	frame:SetScript("OnUpdate", nil)
	
    local bestAura, bestSpellId = FindBestAura(unitId, auraTypes)

    if bestAura then
        frame.auraIcon:SetTexture(bestAura.iconTexture)
        frame.auraIcon:Show()

        if SPELL_DATA[bestSpellId] then
            if SPELL_DATA[bestSpellId].highlight == 3 or SPELL_DATA[bestSpellId].highlight == 4 or SPELL_DATA[bestSpellId].highlight == 5 then
                frame.ShowBorderEffect(bestSpellId)
            elseif SPELL_DATA[bestSpellId].highlight then
                frame.ShowGlowEffect(bestSpellId)
            end
        end        
        
        if frame.cooldownText then
            if bestAura.duration and bestAura.duration > 0 and bestAura.expirationTime then
                UpdateCooldownText(frame, bestAura.expirationTime, bestAura.duration)
            else
                frame.cooldownText:SetText("")
                frame:SetScript("OnUpdate", nil)
            end
        end
    end
end

local function UpdateOtherAuras(namePlate, unitId)
    local foundAuras = FindOtherAuras(unitId)
    local activeAuraCount = #foundAuras

    if not namePlate.otherFrame or not namePlate.otherFrame.auraIcons then
        return
    end
  
    for i = 1, MAX_OTHER_AURAS do
        local auraFrame = namePlate.otherFrame.auraIcons[i]
        if auraFrame then
            auraFrame.icon:Hide()
            auraFrame.cooldownText:SetText("")
            auraFrame:SetScript("OnUpdate", nil)
            auraFrame.HideGlowEffect()
            auraFrame.HideBorderEffect()
        end
    end	

    if activeAuraCount == 0 then
        namePlate.otherFrame:ClearAllPoints()
        namePlate.otherFrame:SetPoint("TOP", namePlate.mainFrame, "BOTTOM", 0, -5)
        return
    end

    local totalWidth = (activeAuraCount - 1) * (ICON_SIZE_OTHER + 2)
    local startX = -totalWidth / 2

    for i = 1, activeAuraCount do
        local aura = foundAuras[i]
        local auraFrame = namePlate.otherFrame.auraIcons[i]
        local offsetX = startX + (i - 1) * (ICON_SIZE_OTHER + 2)
        auraFrame:ClearAllPoints()  -- Добавляем сброс предыдущих привязок
        auraFrame:SetPoint("CENTER", namePlate.otherFrame, "CENTER", offsetX, 0)
        auraFrame.icon:SetTexture(aura.iconTexture)
        auraFrame.icon:Show()

        if SPELL_DATA[aura.spellId] then
            if SPELL_DATA[aura.spellId].highlight == 3 or SPELL_DATA[aura.spellId].highlight == 4 then
                auraFrame.ShowBorderEffect(aura.spellId)
            elseif SPELL_DATA[aura.spellId].highlight then
                auraFrame.ShowGlowEffect(aura.spellId)
            end
        end

        if aura.duration and aura.duration > 0 and aura.expirationTime then
            UpdateCooldownText(auraFrame, aura.expirationTime, aura.duration)
        else
            auraFrame.cooldownText:SetText("")
        end
    end

    local hasVisibleIcons = false
    if namePlate.otherFrame and namePlate.otherFrame.auraIcons then
        for _, auraFrame in ipairs(namePlate.otherFrame.auraIcons) do
            if auraFrame.icon and auraFrame.icon:IsShown() then
                hasVisibleIcons = true
                break
            end
        end
    end

    -- Унифицируем смещение: если иконки отсутствуют – mainFrame ставится на 25, если есть – на 55
    local yOffset = hasVisibleIcons and CentrY or CentrY-30
    namePlate.mainFrame:ClearAllPoints()
    namePlate.mainFrame:SetPoint("CENTER", namePlate, "TOP", 0, yOffset)
end

local lastUnitAuraUpdate = {}

local function ShouldUpdateAura(unitId)
    local lastUpdateTime = lastUnitAuraUpdate[unitId] or 0
    if (GetTime() - lastUpdateTime) < 0.5 then
        return false
    end
    lastUnitAuraUpdate[unitId] = GetTime()
    return true
end

local function UpdateAuras(namePlate, unitId)

    if not namePlate.mainFrame then
        namePlate.mainFrame = CreateFrame("Frame", nil, namePlate)
        namePlate.mainFrame:SetSize(ICON_SIZE_MAIN, ICON_SIZE_MAIN)
        namePlate.mainFrame:SetPoint("CENTER", namePlate, "TOP", 0, CentrY)
    end

    if not namePlate.mainFrame.auraIcon then
        namePlate.mainFrame.auraIcon = CreateAuraIcon(namePlate.mainFrame, ICON_SIZE_MAIN)
    end

    local hasVisibleIcons = false

    if namePlate.otherFrame and namePlate.otherFrame:IsShown() then
        for _, auraFrame in ipairs(namePlate.otherFrame.auraIcons or {}) do
            if auraFrame.icon and auraFrame.icon:IsShown() then
                hasVisibleIcons = true
                break
            end
        end
    end

    local yOffset = hasVisibleIcons and CentrY or CentrY-30

    namePlate.mainFrame:ClearAllPoints()
    namePlate.mainFrame:SetPoint("CENTER", namePlate, "TOP", 0, yOffset)

    if not namePlate.secondaryFrame then
        namePlate.secondaryFrame = CreateFrame("Frame", nil, namePlate)
        namePlate.secondaryFrame:SetSize(ICON_SIZE_SECONDARY, ICON_SIZE_SECONDARY)
        namePlate.secondaryFrame:SetPoint("LEFT", namePlate, "RIGHT", RightX, RightY)
        namePlate.secondaryFrame.auraIcon = CreateAuraIcon(namePlate.secondaryFrame, ICON_SIZE_SECONDARY)
    end

    if not namePlate.otherFrame then
        namePlate.otherFrame = CreateFrame("Frame", nil, namePlate)
        namePlate.otherFrame:SetSize(ICON_SIZE_OTHER * MAX_OTHER_AURAS, ICON_SIZE_OTHER)
        namePlate.otherFrame:SetPoint("TOP", namePlate.mainFrame, "BOTTOM", 0, -5)
        CreateOtherAuraIcons(namePlate.otherFrame, ICON_SIZE_OTHER)
    end

    UpdateAuraFrame(namePlate, namePlate.mainFrame, ICON_SIZE_MAIN, unitId, CENTER_AURA_TYPES)
    UpdateAuraFrame(namePlate, namePlate.secondaryFrame, ICON_SIZE_SECONDARY, unitId, RIGHT_AURA_TYPES)

    UpdateOtherAuras(namePlate, unitId)  
end

local function OnNamePlateAdded_Auras(unitId)
	local unitGUID = UnitGUID(unitId)
	if not unitGUID then return end

	if removedPlates[unitGUID] then
		 removedPlates[unitGUID] = nil
	end

	guidToUnitIdMap[unitGUID] = unitId
	if unitId then
        local namePlate = C_NamePlate.GetNamePlateForUnit(unitId)
        if namePlate then
            UpdateAuras(namePlate, unitId)
        end
    end    
end

local function OnUnitAura(unitId)
    local namePlate = C_NamePlate.GetNamePlateForUnit(unitId)
    if namePlate then
        local unitGUID = UnitGUID(unitId)
        if guidToUnitIdMap[unitGUID] == unitId then
            UpdateAuras(namePlate, unitId)
        end
    end
end

local function OnNamePlateRemoved(unitId)
	local unitGUID = UnitGUID(unitId)
	if not unitGUID then return end

	removedPlates[unitGUID] = GetTime()

	if _G["ActiveNameplates"] then
		_G["ActiveNameplates"][unitId] = nil
	end
end

local function CleanupOldPlates()
	local currentTime = GetTime()
	local removedCount = 0

	for guid, disappearTime in pairs(removedPlates) do
        if (currentTime - disappearTime) > 10 then
            local unitId = guidToUnitIdMap[guid]
            if unitId and not C_NamePlate.GetNamePlateForUnit(unitId) then
                if _G["ActiveNameplates"] then
                    _G["ActiveNameplates"][unitId] = nil
                end
                namePlates[unitId] = nil
                guidToUnitIdMap[guid] = nil
                removedPlates[guid] = nil
            end
        end
    end    
end

local cleanupFrame = CreateFrame("Frame")
cleanupFrame:SetScript("OnUpdate", function(self, elapsed)
    if not self.lastCleanup then self.lastCleanup = GetTime() end
    if (GetTime() - self.lastCleanup) > 5 then -- Очистка каждые 5 секунд
        CleanupOldPlates()
        self.lastCleanup = GetTime()
    end
end)

local f = CreateFrame("Frame")
f:RegisterEvent("NAME_PLATE_UNIT_ADDED")
f:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
f:RegisterEvent("UNIT_AURA")

f:SetScript("OnEvent", function(self, event, unitId)
    if event == "NAME_PLATE_UNIT_ADDED" then
        OnNamePlateAdded_Auras(unitId)
    elseif event == "UNIT_AURA" then
        OnUnitAura(unitId)
    elseif event == "NAME_PLATE_UNIT_REMOVED" then
        OnNamePlateRemoved(unitId)
    end
end)
