-- Позиция
_G["CentrY"] = 55
_G["RightX"] = 5
_G["RightY"] = -10

-- Размеры
_G["ICON_SIZE_MAIN"] = 46 -- Основной по центру
_G["ICON_SIZE_SECONDARY"] = 30 -- Свои под основным
_G["ICON_SIZE_OTHER"] = 30 -- справа

-- Количество отображаемых аур
_G["MAX_OTHER_AURAS"] = 6
_G["MAX_AURAS"] = 1

-- 3 желтый
-- 4 фиолетовый
-- 5 синий
_G["SPELL_DATA"] = {
            -- Death Knight
    [48707] = { type = "immunities", priority = 1, highlight = 1 }, -- Anti-Magic Shell
    [49203] = { type = "cc", priority = 2 }, -- Hungering Cold
    [47476] = { type = "silence", priority = 2 }, -- Strangulate
    [47528] = { type = "interrupts", priority = 3 }, -- Mind Freeze
    [49039] = { type = "buffs_defensive", priority = 4, highlight = 2 }, -- Lichborne
    [48792] = { type = "buffs_defensive", priority = 2, highlight = 3 }, -- Icebound Fortitude
    [50461] = { type = "buffs_defensive", priority = 5 }, -- Anti-Magic Zone
    [49028] = { type = "buffs_offensive", priority = 4 }, -- Dancing Rune Weapon
    [45524] = { type = "snare", priority = 2, highlight = 5 }, -- Chains of Ice
    [55666] = { type = "snare", priority = 3, highlight = 5 }, -- Desecration
    [58617] = { type = "snare", priority = 4, highlight = 5 }, -- Glyph of Heart Strike
    [50436] = { type = "snare", priority = 5, highlight = 5 }, -- Icy Clutch (Chilblains)

    -- Death Knight Pet
    [47481] = { type = "cc", priority = 3 }, -- Gnaw (Ghoul)
    [47484] = { type = "buffs_defensive", priority = 5 }, -- Huddle (Ghoul)

    -- Druid
    [33786] = { type = "cc", priority = 1 }, -- Cyclone
    [49802] = { type = "cc", priority = 2 }, -- Maim
    [8983] = { type = "cc", priority = 3 }, -- Bash
    [18658] = { type = "cc", priority = 4 }, -- Hibernate
    [49803] = { type = "cc", priority = 5 }, -- Pounce
    [16979] = { type = "interrupts", priority = 3 }, -- Feral Charge Effect (Interrupt)
    [45334] = { type = "roots", priority = 2 }, -- Feral Charge Effect (Immobilize)
    [53308] = { type = "roots", priority = 3 }, -- Entangling Roots
    [17116] = { type = "buffs_defensive", priority = 4 }, -- Nature's Swiftness
    [61336] = { type = "buffs_defensive", priority = 2 }, -- Survival Instincts
    [22812] = { type = "buffs_defensive", priority = 3, highlight = 3 }, -- Barkskin
    [29166] = { type = "buffs_offensive", priority = 3 }, -- Innervate
    [50334] = { type = "buffs_offensive", priority = 2 }, -- Berserk
    [69369] = { type = "buffs_offensive", priority = 4 }, -- Predator's Swiftness
    [53201] = { type = "buffs_offensive", priority = 1 }, -- Starfall
    [53312] = { type = "buffs_other", priority = 2 }, -- Nature's Grasp
    [33357] = { type = "buffs_other", priority = 3 }, -- Dash
    --[768] = { type = "buffs_other", priority = 5 }, -- Cat Form
    --[9634] = { type = "buffs_other", priority = 6 }, -- Dire Bear Form
    --[783] = { type = "buffs_other", priority = 7 }, -- Travel Form
    --[24858] = { type = "buffs_other", priority = 4 }, -- Moonkin Form
    --[33891] = { type = "buffs_other", priority = 1 }, -- Tree of Life
    [58179] = { type = "snare", priority = 3, highlight = 5 }, -- Infected Wounds
    [61391] = { type = "snare", priority = 2, highlight = 5 }, -- Typhoon
    [50259] = { type = "snare", priority = 4, highlight = 5 }, -- Daze (Druid)

    -- Hunter
    [34471] = { type = "immunities", priority = 2 }, -- The Beast Within
    [19263] = { type = "immunities", priority = 1 }, -- Deterrence
    [24394] = { type = "cc", priority = 2 }, -- Intimidation (Stun)
    [49012] = { type = "cc", priority = 4 }, -- Wyvern Sting
    [19503] = { type = "cc", priority = 3 }, -- Scatter Shot
    [14309] = { type = "cc", priority = 5 }, -- Freezing Trap
    [60210] = { type = "cc", priority = 6 }, -- Freezing Arrow Effect
    [14327] = { type = "cc", priority = 7 }, -- Scare Beast
    [34490] = { type = "silence", priority = 3, highlight = 2 }, -- Silencing Shot
    [48999] = { type = "roots", priority = 2 }, -- Counterattack
    [19185] = { type = "roots", priority = 3 }, -- Entrapment
    [53359] = { type = "disarm", priority = 2, highlight = 4 }, -- Chimera Shot - Scorpid (Disarm)
    [5384] = { type = "buffs_defensive", priority = 4 }, -- Feign Death
    [54216] = { type = "buffs_defensive", priority = 3 }, -- Master's Call
    [3034] = { type = "buffs_other", priority = 5 }, -- Viper Sting
    [5118] = { type = "buffs_other", priority = 6 }, -- Aspect of the Cheetah
    [35101] = { type = "snare", priority = 3, highlight = 5 }, -- Concussive Barrage
    [5116] = { type = "snare", priority = 4, highlight = 5 }, -- Concussive Shot
    [13810] = { type = "snare", priority = 2, highlight = 5 }, -- Frost Trap Aura
    [61394] = { type = "snare", priority = 5, highlight = 5 }, -- Glyph of Freezing Trap
    [2974] = { type = "snare", priority = 6, highlight = 5 }, -- Wing Clip

    -- Hunter Pets
    [19574] = { type = "immunities", priority = 3 }, -- Bestial Wrath (Pet)
    [53562] = { type = "cc", priority = 4 }, -- Ravage (Pet)
    [50519] = { type = "cc", priority = 5 }, -- Sonic Blast (Bat)
    [26090] = { type = "interrupts", priority = 3 }, -- Pummel (Pet)
    [53548] = { type = "roots", priority = 4, highlight = 4 }, -- Pin (Pet)
    [4167] = { type = "roots", priority = 5, highlight = 4 }, -- Web (Pet)
    [54706] = { type = "roots", priority = 6, highlight = 4 }, -- Venom Web Spray (Silithid)

    -- Mage
    [45438] = { type = "immunities", priority = 1, highlight = 1 }, -- Ice Block
    [118] = { type = "cc", priority = 2 }, -- Polymorph
    [42950] = { type = "cc", priority = 3 }, -- Dragon's Breath
    [44572] = { type = "cc", priority = 1 }, -- Deep Freeze
    [12355] = { type = "cc", priority = 4 }, -- Impact
    [55021] = { type = "silence", priority = 2 }, -- Improved Counterspell
    [2139] = { type = "interrupts", priority = 1 }, -- Counterspell
    [12494] = { type = "roots", priority = 1 }, -- Frostbite
    [122] = { type = "roots", priority = 2 }, -- Frost Nova
    [55080] = { type = "roots", priority = 3 }, -- Shattered Barrier
    [64346] = { type = "disarm", priority = 1, highlight = 4 }, -- Fiery Payback (Fire Mage Disarm)
    [54748] = { type = "buffs_defensive", priority = 2 }, -- Burning Determination
    [12472] = { type = "buffs_offensive", priority = 3 }, -- Icy Veins
    [12042] = { type = "buffs_offensive", priority = 1 }, -- Arcane Power
    [44544] = { type = "buffs_offensive", priority = 4 }, -- Fingers of Frost
    [66] = { type = "buffs_offensive", priority = 2 }, -- Invisibility
    --[43039] = { type = "buffs_other", priority = 2 }, -- Ice Barrier
    [43020] = { type = "buffs_other", priority = 3 }, -- Mana Shield
    [43012] = { type = "buffs_other", priority = 4 }, -- Frost Ward
    [11113] = { type = "snare", priority = 3 }, -- Blast Wave
    [6136] = { type = "snare", priority = 4, highlight = 5 }, -- Chilled
    [120] = { type = "snare", priority = 5, highlight = 5 }, -- Cone of Cold
    [116] = { type = "snare", priority = 2, highlight = 5 }, -- Frostbolt
    [47610] = { type = "snare", priority = 3, highlight = 5 }, -- Frostfire Bolt
    [31589] = { type = "snare", priority = 1, highlight = 5 }, -- Slow
    [33395] = { type = "roots", priority = 4 }, -- Freeze (Water Elemental)

    -- Paladin
    [642] = { type = "immunities", priority = 1 }, -- Divine Shield
    [10278] = { type = "immunities", priority = 2 }, -- Hand of Protection
    [20066] = { type = "cc", priority = 3 }, -- Repentance
    [10308] = { type = "cc", priority = 1, highlight = 4 }, -- Hammer of Justice
    [10326] = { type = "cc", priority = 2 }, -- Turn Evil
    [48817] = { type = "cc", priority = 4 }, -- Holy Wrath
    [20170] = { type = "cc", priority = 5 }, -- Seal of Justice Stun
    [63529] = { type = "silence", priority = 3, highlight = 5 }, -- Silenced - Shield of the Templar
    [31821] = { type = "buffs_defensive", priority = 3 }, -- Aura Mastery
    [54428] = { type = "buffs_defensive", priority = 5, highlight = 4 }, -- Divine Plea
    --[53563] = { type = "buffs_defensive", priority = 1 }, -- Beacon of Light
    [498] = { type = "buffs_defensive", priority = 2 }, -- Divine Protection
    [6940] = { type = "buffs_defensive", priority = 5 }, -- Hand of Sacrifice
    [1044] = { type = "buffs_defensive", priority = 6, highlight = 3 }, -- Hand of Freedom
    [64205] = { type = "buffs_defensive", priority = 7 }, -- Divine Sacrifice
    [31884] = { type = "buffs_offensive", priority = 2, highlight = 1 }, -- Avenging Wrath
    [58597] = { type = "buffs_other", priority = 4 }, -- Sacred Shield Proc
    --[59578] = { type = "buffs_other", priority = 3 }, -- The Art of War
    --[20184] = { type = "snare", priority = 1, highlight = 5 }, -- Judgement of Justice (100% movement snare)
    [48827] = { type = "snare", priority = 2, highlight = 5 }, -- Shield of Vengeance

    -- Priest
    [64044] = { type = "cc", priority = 2, highlight = 4 }, -- Psychic Horror (Horrify)
    [10890] = { type = "cc", priority = 3, highlight = 4 }, -- Psychic Scream
    [605] = { type = "cc", priority = 2, highlight = 4 }, -- Mind Control
    [10955] = { type = "cc", priority = 4 }, -- Shackle Undead
    [15487] = { type = "silence", priority = 2, highlight = 4 }, -- Silence
    [64058] = { type = "disarm", priority = 5, highlight = 4 }, -- Psychic Horror (Disarm)
    [47585] = { type = "buffs_defensive", priority = 1, highlight = 2 }, -- Dispersion
    [20711] = { type = "buffs_defensive", priority = 2 }, -- Spirit of Redemption
    [47788] = { type = "buffs_defensive", priority = 3 }, -- Guardian Spirit
    [33206] = { type = "buffs_defensive", priority = 4 }, -- Pain Suppression
    [10060] = { type = "buffs_offensive", priority = 5, highlight = 5 }, -- Power Infusion
    [6346] = { type = "buffs_other", priority = 3, highlight = 2 }, -- Fear Ward
    [48066] = { type = "buffs_other", priority = 4, highlight = 5 }, -- Power Word: Shield
    [48156] = { type = "snare", priority = 5, highlight = 5 }, -- Mind Flay
    [64901] = { type = "cc", priority = 1, highlight = 1 },
    [64843] = { type = "cc", priority = 1, highlight = 1 }, 

    -- Rogue
    [51690] = { type = "immunities", priority = 1 }, -- Killing Spree
    [31224] = { type = "immunities", priority = 2 }, -- Cloak of Shadows
    [1776] = { type = "cc", priority = 3 }, -- Gouge
    [2094] = { type = "cc", priority = 1 }, -- Blind
    [8643] = { type = "cc", priority = 4, highlight = 4 }, -- Kidney Shot
    [51724] = { type = "cc", priority = 2, highlight = 4 }, -- Sap
    [1833] = { type = "cc", priority = 5, highlight = 4 }, -- Cheap Shot
    [1330] = { type = "silence", priority = 2 }, -- Garrote - Silence
    [18425] = { type = "silence", priority = 3 }, -- Silence (Improved Kick)
    [1766] = { type = "interrupts", priority = 1 }, -- Kick
    [51722] = { type = "disarm", priority = 1, highlight = 4 }, -- Dismantle
    [26669] = { type = "buffs_defensive", priority = 2 }, -- Evasion
    [51713] = { type = "buffs_offensive", priority = 3 }, -- Shadow Dance
    [11305] = { type = "buffs_other", priority = 4 }, -- Sprint
    [3409] = { type = "snare", priority = 4, highlight = 5 },
    [51693] = { type = "snare", priority = 5, highlight = 5 }, -- Ambush
    [31125] = { type = "snare", priority = 4, highlight = 5 }, -- Blade Twisting
    [51585] = { type = "snare", priority = 4, highlight = 5 }, -- Blade Twisting

    [27187] = { type = "other", priority = 1 }, -- яд
    --[57975] = { type = "cc", priority = 2 }, -- яж на - хил
    [48672] = { type = "other", priority = 1, highlight = 4 },

    -- Shaman
    [8178] = { type = "immunities", priority = 1 }, -- Grounding Totem Effect
    [51514] = { type = "cc", priority = 3 }, -- Hex
    [39796] = { type = "cc", priority = 2 }, -- Stoneclaw Stun
    [57994] = { type = "interrupts", priority = 1 }, -- Wind Shear
    [63685] = { type = "roots", priority = 3 }, -- Freeze (Enhancement)
    [64695] = { type = "roots", priority = 2 }, -- Earthgrab (Elemental)
    [30823] = { type = "buffs_defensive", priority = 2 }, -- Shamanistic Rage
    [16188] = { type = "buffs_defensive", priority = 3 }, -- Nature's Swiftness
    [16166] = { type = "buffs_offensive", priority = 2 }, -- Elemental Mastery (Instant Cast)
    [2825] = { type = "buffs_offensive", priority = 1 }, -- Bloodlust
    [32182] = { type = "buffs_offensive", priority = 1 }, -- Heroism
    [58875] = { type = "buffs_other", priority = 2 }, -- Spirit Walk (Spirit Wolf)
    [55277] = { type = "buffs_other", priority = 3 }, -- Stoneclaw Totem (Absorb)
    [3600] = { type = "snare", priority = 4, highlight = 5 }, -- Earthbind
    [8056] = { type = "snare", priority = 3, highlight = 5 }, -- Frost Shock
    [8034] = { type = "snare", priority = 4, highlight = 5 }, -- Frostbrand Attack

    -- Warlock
    [60995] = { type = "cc", priority = 3 }, -- Demon Charge (Metamorphosis)
    [47847] = { type = "cc", priority = 2 }, -- Shadowfury
    [18647] = { type = "cc", priority = 3 }, -- Banish
    [47860] = { type = "cc", priority = 1 }, -- Death Coil
    [6215] = { type = "cc", priority = 1, highlight = 4 }, -- Fear
    [17928] = { type = "cc", priority = 4, highlight = 2 }, -- Howl of Terror
    [6358] = { type = "cc", priority = 3 }, -- Seduction
    [31117] = { type = "silence", priority = 1 }, -- Unstable Affliction (Silence)
    [24259] = { type = "silence", priority = 1, highlight = 4 }, -- Spell Lock (Silence)
    [19647] = { type = "interrupts", priority = 2 }, -- Spell Lock (Interrupt)
    [18708] = { type = "buffs_defensive", priority = 2 }, -- Fel Domination
    [47241] = { type = "buffs_offensive", priority = 3 }, -- Metamorphosis
    [11719] = { type = "buffs_offensive", priority = 1 }, -- Curse of Tongues
    [47986] = { type = "buffs_other", priority = 3 }, -- Sacrifice
    [18118] = { type = "snare", priority = 2, highlight = 5 }, -- Aftermath
    [18223] = { type = "snare", priority = 1, highlight = 5 }, -- Curse of Exhaustion

    -- Warrior
    [46924] = { type = "immunities", priority = 2, highlight = 1 }, -- Bladestorm
    [23920] = { type = "immunities", priority = 3, highlight = 3 }, -- Spell Reflection
    [12809] = { type = "cc", priority = 2 }, -- Concussion Blow
    [12798] = { type = "cc", priority = 1 }, -- Revenge Stun
    [46968] = { type = "cc", priority = 2 }, -- Shockwave
    [5246] = { type = "cc", priority = 3, highlight = 2 }, -- Intimidating Shout
    [20511] = { type = "cc", priority = 3, highlight = 2 }, -- Intimidating Shout
    [7922] = { type = "cc", priority = 4, highlight = 4 }, -- Charge
    [20253] = { type = "cc", priority = 5 }, -- Intercept
    [18498] = { type = "silence", priority = 3 }, -- Silenced - Gag Order
    [6552] = { type = "interrupts", priority = 2 }, -- Pummel
    [72] = { type = "interrupts", priority = 1 }, -- Shield Bash
    [58373] = { type = "roots", priority = 2 }, -- Glyph of Hamstring
    [23694] = { type = "roots", priority = 3, highlight = 1 }, -- Improved Hamstring
    [676] = { type = "disarm", priority = 2, highlight = 4 }, -- Disarm
    [12975] = { type = "buffs_defensive", priority = 1 }, -- Last Stand
    [55694] = { type = "buffs_defensive", priority = 2 }, -- Enraged Regeneration
    [871] = { type = "buffs_defensive", priority = 3, highlight = 1 }, -- Shield Wall
    [3411] = { type = "buffs_defensive", priority = 4 }, -- Intervene
    [2565] = { type = "buffs_defensive", priority = 5 }, -- Shield Block
    [20230] = { type = "buffs_defensive", priority = 6, highlight = 1 }, -- Retaliation
    [18499] = { type = "buffs_defensive", priority = 7, highlight = 3 }, -- Berserker Rage
    [1719] = { type = "buffs_offensive", priority = 1, highlight = 3 }, -- Recklessness
    [2457] = { type = "buffs_other", priority = 2 }, -- Battle Stance
    [2458] = { type = "buffs_other", priority = 3 }, -- Berserker Stance
    [71] = { type = "buffs_other", priority = 4 }, -- Defensive Stance
    [1715] = { type = "snare", priority = 3, highlight = 5 }, -- Hamstring
    [12323] = { type = "snare", priority = 2, highlight = 5 }, -- Piercing Howl
    
    [47486] = { type = "immunities", priority = 1, highlight = 3 }, -- Смертельный удар
    -- Misc
    [6615] = { type = "immunities", priority = 2 }, -- Свободное действие
    [24364] = { type = "immunities", priority = 3 }, -- Живая свобода
    [20549] = { type = "cc", priority = 1 }, -- War Stomp
    [13181] = { type = "cc", priority = 2 }, -- Гномская шапка контроля
    [13327] = { type = "cc", priority = 3 }, -- Безрассудная атака
    [71988] = { type = "cc", priority = 1 }, -- Мерзкие духи
    [30217] = { type = "cc", priority = 2 }, -- Adamantite Grenade
    [67769] = { type = "cc", priority = 3 }, -- Cobalt Frag Bomb
    [30216] = { type = "cc", priority = 1 }, -- Fel Iron Bomb
    [50396] = { type = "cc", priority = 2 }, -- Психоз
    [20685] = { type = "cc", priority = 3 }, -- Молот бурь
    [19821] = { type = "silence", priority = 1 }, -- Чародейская бомба
    [28730] = { type = "silence", priority = 2 }, -- Arcane Torrent
    [39965] = { type = "roots", priority = 1 }, -- Frost Grenade
    [55536] = { type = "roots", priority = 2 }, -- Frostweave Net
    [13099] = { type = "roots", priority = 1 }, -- Net-o-Matic
    [14030] = { type = "roots", priority = 2 }, -- Сеть с крючьями
    [43183] = { type = "buffs_other", priority = 1, highlight = 5 }, -- Drink
    [43180] = { type = "buffs_other", priority = 2, highlight = 5 }, -- eat
    [64356] = { type = "buffs_other", priority = 1, highlight = 5 }, -- Drink
    [45548] = { type = "buffs_other", priority = 1, highlight = 5 }, -- Drink
    [57073] = { type = "buffs_other", priority = 1, highlight = 5 }, -- Drink
    [71586] = { type = "buffs_other", priority = 2 }, -- Затвердевшая кожа
    [29703] = { type = "buffs_other", priority = 3 }, -- Dazed
    [25771] = { type = "buffs_other", priority = 10 }, -- pall debuff ult

    -- parent
    -- Death Knight Pet
    [51209] = { type = "cc", priority = 2 }, -- Hungering Cold (parent: 49203)

    -- Druid
    [22570] = { type = "cc", priority = 3 }, -- Maim (parent: 49802)
    [2637] = { type = "cc", priority = 3 }, -- Hibernate (parent: 18658)
    [18657] = { type = "cc", priority = 3 }, -- Hibernate (parent: 18658)
    [9005] = { type = "cc", priority = 4 }, -- Pounce (parent: 49803)
    [9823] = { type = "cc", priority = 4 }, -- Pounce (parent: 49803)
    [9827] = { type = "cc", priority = 4 }, -- Pounce (parent: 49803)
    [27006] = { type = "cc", priority = 4 }, -- Pounce (parent: 49803)
    [339] = { type = "roots", priority = 3 }, -- Entangling Roots (parent: 53308)
    [1062] = { type = "roots", priority = 3 }, -- Entangling Roots (parent: 53308)
    [5195] = { type = "roots", priority = 3 }, -- Entangling Roots (parent: 53308)
    [5196] = { type = "roots", priority = 3 }, -- Entangling Roots (parent: 53308)
    [9852] = { type = "roots", priority = 3 }, -- Entangling Roots (parent: 53308)
    [9853] = { type = "roots", priority = 3 }, -- Entangling Roots (parent: 53308)
    [26989] = { type = "roots", priority = 3 }, -- Entangling Roots (parent: 53308)
    [53313] = { type = "roots", priority = 3, highlight = 4 }, -- Entangling Roots (parent: 53308)
    [54833] = { type = "buffs_offensive", priority = 2 }, -- Glyph Innervate (parent: 29166)

    -- Hunter
    [34692] = { type = "immunities", priority = 2 }, -- The Beast Within (parent: 34471)
    [19386] = { type = "cc", priority = 4 }, -- Wyvern Sting (parent: 49012)
    [24132] = { type = "cc", priority = 4 }, -- Wyvern Sting (parent: 49012)
    [24133] = { type = "cc", priority = 4 }, -- Wyvern Sting (parent: 49012)
    [27068] = { type = "cc", priority = 4 }, -- Wyvern Sting (parent: 49012)
    [49011] = { type = "cc", priority = 4 }, -- Wyvern Sting (parent: 49012)
    [3355] = { type = "cc", priority = 1 }, -- Freezing Trap (parent: 14309)
    [14308] = { type = "cc", priority = 1 }, -- Freezing Trap (parent: 14309)
    [53568] = { type = "cc", priority = 1 }, -- Sonic Blast (Bat) (parent: 50519)
    [53564] = { type = "cc", priority = 1 }, -- Sonic Blast (Bat) (parent: 50519)
    [53565] = { type = "cc", priority = 1 }, -- Sonic Blast (Bat) (parent: 50519)
    [53566] = { type = "cc", priority = 1 }, -- Sonic Blast (Bat) (parent: 50519)
    [53567] = { type = "cc", priority = 1 }, -- Sonic Blast (Bat) (parent: 50519)
    [19306] = { type = "roots", priority = 4 }, -- Counterattack (parent: 48999)
    [20909] = { type = "roots", priority = 4 }, -- Counterattack (parent: 48999)
    [20910] = { type = "roots", priority = 4 }, -- Counterattack (parent: 48999)
    [27067] = { type = "roots", priority = 4 }, -- Counterattack (parent: 48999)
    [48998] = { type = "roots", priority = 4 }, -- Counterattack (parent: 48999)
    [64803] = { type = "roots", priority = 2 }, -- Entrapment (parent: 19185)
    [19388] = { type = "roots", priority = 2 }, -- Entrapment (parent: 19185)
    [19184] = { type = "roots", priority = 2 }, -- Entrapment (parent: 19185)
    [19387] = { type = "roots", priority = 2 }, -- Entrapment (parent: 19185)
    [64804] = { type = "roots", priority = 2 }, -- Entrapment (parent: 19185)

    -- Mage
    [31661] = { type = "cc", priority = 4 }, -- Dragon's Breath (parent: 42950)
    [33041] = { type = "cc", priority = 4 }, -- Dragon's Breath (parent: 42950)
    [33042] = { type = "cc", priority = 4 }, -- Dragon's Breath (parent: 42950)
    [33043] = { type = "cc", priority = 4 }, -- Dragon's Breath (parent: 42950)
    [42949] = { type = "cc", priority = 4 }, -- Dragon's Breath (parent: 42950)
    [18469] = { type = "silence", priority = 2 }, -- Improved Counterspell (parent: 55021)
    [42917] = { type = "roots", priority = 1, highlight = 4 }, -- Frost Nova (parent: 122)
    [865] = { type = "roots", priority = 1 }, -- Frost Nova (parent: 122)
    [6131] = { type = "roots", priority = 1 }, -- Frost Nova (parent: 122)
    [10230] = { type = "roots", priority = 1 }, -- Frost Nova (parent: 122)
    [27088] = { type = "roots", priority = 1 }, -- Frost Nova (parent: 122)

    -- Warlock
    [6789] = { type = "cc", priority = 4 }, -- Death Coil (parent: 47860)
    [17925] = { type = "cc", priority = 4 }, -- Death Coil (parent: 47860)
    [17926] = { type = "cc", priority = 4 }, -- Death Coil (parent: 47860)
    [27223] = { type = "cc", priority = 4 }, -- Death Coil (parent: 47860)
    [47859] = { type = "cc", priority = 4 }, -- Death Coil (parent: 47860)
    [5782] = { type = "cc", priority = 1 }, -- Fear (parent: 6215)
    [6213] = { type = "cc", priority = 1 }, -- Fear (parent: 6215)
    [5484] = { type = "cc", priority = 2 }, -- Howl of Terror (parent: 17928) 

    [47502] = { type = "other", priority = 4 },
    [47465] = { type = "other", priority = 2, highlight = 3 },
    [12721] = { type = "other", priority = 4 },
    --[57970] = { type = "other", priority = 3 },

    -- Warlock
    [47813] = { type = "other", priority = 1, highlight = 3 },
    [47864] = { type = "other", priority = 2, highlight = 3 },
    [47843] = { type = "other", priority = 3 },
    [59164] = { type = "other", priority = 4 },
    -- Priest
    [48300] = { type = "other", priority = 1 },
    [48125] = { type = "other", priority = 2 },

    [43183] = { type = "buffs_other", priority = 1 },
    
}