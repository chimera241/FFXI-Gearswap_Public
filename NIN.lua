function get_sets()

  maps()

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- TOGGLES ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  AccFlag            = 1
  HasteFlag          = 0
  HybridTPFlag       = false
  CritTPFlag         = false
  MagicBurstFlag     = false
  UtsuEnmityFlag     = false



  -- ! == alt
  -- ^ == ctrl
  --
  -- F# commands
  send_command('bind f9 gs c cycle TP mode')
  send_command('bind f10 gs c cycle Haste')
  send_command('bind f11 gs c Equip Movement')
  send_command('bind f12 gs c Equip DT')

  -- Ctrl+F# commands
  send_command('bind ^f9 gs c Equip Treasure Hunter')
  send_command('bind ^f10 gs c Tauret')
  send_command('bind ^f11 gs c Kannagi')
  send_command('bind ^f12 gs c Equip MEva')

  -- Alt+F# commands
  send_command('bind !f9 gs c Naegling')
  send_command('bind !f10 gs c Kikoku')
  send_command('bind !f11 gs c Heishi')
  send_command('bind !f12 gs c toggle HybridTP')

  -- Ctrl+Alt+F# commands
  send_command('bind @f9 gs c toggle CritTP')
  send_command('bind @f10 gs c Free spot') -- Free spot
  send_command('bind @f11 gs c toggle MagicBurst')
  send_command('bind @f12 gs c toggle UtsuEnmity')


  function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^f9')
    send_command('unbind ^f10')
    send_command('unbind ^f11')
    send_command('unbind ^f12')
    send_command('unbind !f9')
    send_command('unbind !f10')
    send_command('unbind !f11')
    send_command('unbind !f12')
    send_command('unbind ^!f9')
    send_command('unbind ^!f10')
    send_command('unbind ^!f11')
    send_command('unbind ^!f12')
  end


  function self_command(command)
    function check_param()
        print('-------------------------')
        if AccFlag == 0 then
          print('Accuracy Mode:...1150 Eva')
        elseif AccFlag == 1 then
           print('Accuracy Mode:...1200 Eva')
        elseif AccFlag == 2 then
          print('Accuracy Mode:...1350 Eva')
        elseif AccFlag == 3 then
          print('Accuracy Mode:...1500 Eva')
        end
        if HasteFlag == 0 then
          print('Haste Level:...........0%')
        elseif HasteFlag == 1 then
          print('Haste Level:..........15%')
        elseif HasteFlag == 2 then
          print('Haste Level:..........30%')
        elseif HasteFlag == 3 then
          print('Haste Level:..........Cap')
        end
        if HybridTPFlag == false then
          print('Hybrid TP:............OFF')
        elseif HybridTPFlag == true then
          print('Hybrid TP:.............ON')
        end
        if CritTPFlag == false then
          print('Crit TP:..............OFF')
        elseif CritTPFlag == true then
          print('Crit TP:...............ON')
        end
        if MagicBurstFlag == false then
          print('Magic Burst:..........OFF')
        elseif MagicBurstFlag == true then
          print('Magic Burst:...........ON')
        end
        if UtsuEnmityFlag == false then
          print('Utsu: Enmity:.........OFF')
        elseif UtsuEnmityFlag == true then
          print('Utsu: Enmity:..........ON')
        end
        print('-------------------------')
    end

    if command == 'toggle MagicBurst' then
      if MagicBurstFlag == false then
        MagicBurstFlag = true
        send_command('@input /echo Magic Burst: ON')
      elseif MagicBurstFlag == true then
        MagicBurstFlag = false
        send_command('@input /echo Magic Burst: OFF')
      end
      check_param()
    end

    if command == 'toggle UtsuEnmity' then
      if UtsuEnmityFlag == false then
        UtsuEnmityFlag = true
        send_command('@input /echo Utsu Enmity: ON')
      elseif UtsuEnmityFlag == true then
        UtsuEnmityFlag = false
        send_command('@input /echo Utsu Enmity: OFF')
      end
      check_param()
    end


    if command == 'Equip Treasure Hunter' then
      equip(sets.Treasure)
      send_command('@input /echo Treasure Hunter +4 equipped')
    end



    if command == 'cycle Haste' then
      if HasteFlag == 0 then
        HasteFlag = 1
        send_command('@input /echo Haste Level: 15%')
      elseif HasteFlag == 1 then
        HasteFlag = 2
        send_command('@input /echo Haste Level: 30%')
      elseif HasteFlag == 2 then
        HasteFlag = 3
        send_command('@input /echo Haste Level: Capped')
      elseif HasteFlag == 3 then
        HasteFlag = 0
        send_command('@input /echo Haste Level: 0%')
      end
      check_param()
    end

    if command == 'cycle TP mode' then
      if AccFlag == 0 then
        AccFlag = 1
        send_command('@input /echo Accuracy mode: 1200 Eva')
      elseif AccFlag == 1 then
        AccFlag = 2
        send_command('@input /echo Accuracy mode: 1350 Eva')
      elseif AccFlag == 2 then
        AccFlag = 3
        send_command('@input /echo Accuracy mode: 1500 Eva')
      elseif AccFlag == 3 then
        AccFlag = 0
        send_command('@input /echo Accuracy mode: 1150 Eva')
      end
      check_param()
    end

    if command == 'toggle HybridTP' then
      if HybridTPFlag == true then
        HybridTPFlag = false
        send_command('@input /echo Hybrid DT + Melee toggled OFF')
      elseif HybridTPFlag == false then
        HybridTPFlag = true
        send_command('@input /echo Hybrid DT + Melee toggled ON')
      end
      check_param()
    end

    if command == 'toggle CritTP' then
      if CritTPFlag == true then
        CritTPFlag = false
        send_command('@input /echo Kannagi AM3 Crit TP toggled OFF')
      elseif CritTPFlag == false then
        CritTPFlag = true
        send_command('@input /echo Kannagi AM3 Crit TP toggled ON')
      end
      check_param()
    end

    if command == 'Equip DT' then
      equip(sets.status.Idle.DT)
      send_command('@input /echo Damage Taken set equipped.')
    end
    if command == 'Equip MEva' then
      equip(sets.status.Idle.Eva)
      send_command('@input /echo Idle Evasion set equipped.')
    end



    if command == 'Equip Nagi' then
      equip(sets.WeaponSet.NagiTsuru)
      send_command('@input /echo Nagi + Tsuru equipped.')
    end
    if command == 'Kannagi' then
      equip({main="Kannagi", sub="Gleti's Knife"})
      send_command('@input /echo Kannagi equipped.')
      -- send_command('@input /lockstyleset 14')
    end
    if command == 'Tauret' then
      equip(sets.WeaponSet.Tauret)
      send_command('@input /echo Tauret equipped.')
      --send_command('@input /lockstyleset 14')
    end
    if command == 'Heishi' then
      equip(sets.WeaponSet.Heishi)
      send_command('@input /echo Heishi equipped.')
      --send_command('@input /lockstyleset 13')
    end
    if command == 'Naegling' then
      equip(sets.WeaponSet.Naegling)
      send_command('@input /echo Naegling + Hitaki equipped.')
      -- send_command('@input /lockstyleset 15')
    end
    if command == 'Kikoku' then
      equip(sets.WeaponSet.Kikoku)
      send_command('@input /echo Kikoku equipped.')
      --send_command('@input /lockstyleset 13')
    end

    if command == 'Equip Movement' then
      if world.time/60. > 17 or world.time/60. < 7 then
        equip({feet = gear.AF.feet})
        send_command('@input /echo Hachiya Kyahan +3 equipped.')
      else
        equip(gear.Danzo)
        send_command('@input /echo Danzo Sune-Ate equipped.')
      end
    end

  end


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}
    gear.Moonshade                     = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}
    gear.Obi                           = { waist="Hachirin-no-Obi"}
    gear.Danzo                         = { feet="Danzo Sune-Ate"}
    gear.Donar                         = { ranged="Donar Gun",}

    gear.Empy = {}
    gear.Empy.head                     = { name="Hattori Zukin +1"}
    gear.Empy.body                     = { name="Hattori Ningi +1"}
    gear.Empy.hands                    = { name="Hattori Tekko +1"}
    gear.Empy.legs                     = { name="Hattori Hakama +1"}
    gear.Empy.feet                     = { name="Hattori Kyahan +1"}

    gear.Katana = {}
    gear.Katana.Kanaria = {}
    gear.Katana.Kanaria.TH             = { name="Kanaria", augments={'Mag. Acc.+25','Pet: DEX+9','"Treasure Hunter"+2','DMG:+13',}}
    gear.Katana.Kanaria.TA             = { name="Kanaria", augments={'"Triple Atk."+3','DEX+14','Accuracy+16','Attack+20',}}
    gear.Katana.Kanaria.QA             = { name="Kanaria", augments={'Attack+24','Pet: Mag. Acc.+24','Quadruple Attack +3','DMG:+15',}}
    gear.Katana.Ochu2                  = { name="Ochu", augments={'STR+5','DEX+5','Ninjutsu skill +8','DMG:+11',}}
    gear.Katana.Ochu1                  = { name="Ochu", augments={'STR+9','DEX+9','Ninjutsu skill +9','DMG:+13',}}

    gear.Dagger = {}
    gear.Dagger.Tauret                 = { name="Tauret"}
    gear.Dagger.Ternion                = { name="Ternion Dagger +1", augments={'Path: A',}}

    gear.Shuriken = {}
    gear.Shuriken.Happo                = { ammo="Happo Shuriken",}
    gear.Shuriken.Seki                 = { ammo="Seki Shuriken",}
    gear.Shuriken.Togakushi            = { ammo="Togakushi Shuriken",}
    gear.Shuriken.Date                 = { ammo="Date Shuriken",}

    gear.Ryuo = {}
    gear.Ryuo.head = {}
    gear.Ryuo.head.Accuracy            = { name="Ryuo Somen +1", augments={'STR+12','DEX+12','Accuracy+20',}}
    gear.Ryuo.head.STP                 = { name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}}

    gear.Adhemar = {}

    gear.Adhemar.head = {}
    gear.Adhemar.head.Accuracy         = { name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}}

    gear.Adhemar.body = {}
    gear.Adhemar.body.Attack           = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}

    gear.Adhemar.hands = {}
--  gear.Adhemar.hands.Accuracy        = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
    gear.Adhemar.hands.Attack          = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}}

    gear.AmbuCape = {}

	gear.AmbuCape.WSDagi               = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
    gear.AmbuCape.DAdex                = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
    gear.AmbuCape.DW                   = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
    gear.AmbuCape.Crit                 = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10',}}
    gear.AmbuCape.Evasion              = { name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
    gear.AmbuCape.Nuke                 = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

    gear.AmbuCape.SIRD                 = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Spell interruption rate down-10%',}}
    gear.AmbuCape.STP                  = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
    gear.AmbuCape.WSDdex               = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

	gear.AmbuCape.TP                   = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    gear.AmbuCape.WSDstr               = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    gear.AF = {}
    gear.AF.head                       = { name="Hachiya Hatsu. +2" }
--    gear.AF.body                       = { name="Hachiya Chainmail +3"}
--    gear.AF.hands                      = {}
--    gear.AF.legs                       = {}
--    gear.AF.feet                       = {name="Hachiya Kyahan +3" }

    gear.Herc = {}
    gear.Herc.head = {}
    gear.Herc.head.FC                  = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}}
	gear.Herc.head.wsd                 = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+20','Pet: DEX+9','Weapon skill damage +5%','Accuracy+11 Attack+11',}}

    gear.Herc.hands = {}
	gear.Herc.hands.wsd                = { name="Herculean Gloves", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Accuracy+13','Attack+4',}}

    gear.Herc.body = {}
	gear.Herc.body.wsd                 = { name="Herculean Vest", augments={'Weapon skill damage +4%','STR+9','Accuracy+14',}}

    gear.Herc.legs = {}

    gear.Herc.feet = {}
	gear.Herc.feet.wsd                 = { name="Herculean Boots", augments={'Weapon skill damage +4%','AGI+3','Accuracy+15','Attack+12',}}
    gear.Herc.feet.QA                  = { name="Herculean Boots", augments={'Accuracy+17','Pet: STR+1','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}

    gear.Relic = {}
    gear.Relic.head                    = { name="Mochi. Hatsuburi +3", augments={'Increases elem. ninjutsu III damage',}}
    gear.Relic.body                    = { name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}}
--  gear.Relic.hands                   = { name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}}
    gear.Relic.legs                    = { name="Mochi. Hakama +3", augments={'Enhances "Mijin Gakure" effect',}}
    gear.Relic.feet                    = { name="Mochi. Kyahan +3", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}}

    gear.Taeon = {}
    gear.Taeon.head = {}
    gear.Taeon.head.sird               = { name="Taeon Chapeau", augments={'Evasion+25','Spell interruption rate down -10%','HP+49',}}

    gear.Taeon.body = {}
    gear.Taeon.body.sird               = { name="Taeon Tabard", augments={'Evasion+25','Spell interruption rate down -10%','HP+47',}}
	gear.Taeon.body.phalanx            = { name="Taeon Tabard", augments={'"Fast Cast"+4','Phalanx +3',}}

    gear.Taeon.hands = {}
	gear.Taeon.hands.phalanx           = { name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}}

    gear.Taeon.legs = {}
    gear.Taeon.legs.sird               = { name="Taeon Tights", augments={'Evasion+25','Spell interruption rate down -10%','HP+50',}}

    gear.Taeon.feet = {}
    gear.Taeon.feet.sird               = { name="Taeon Boots", augments={'Evasion+24','Spell interruption rate down -10%','HP+45',}}
	gear.Taeon.feet.phalanx            = { name="Taeon Boots", augments={'"Cure" potency +5%','Phalanx +3',}}


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  sets.items = {}
  sets.items.HolyWater = {
    neck="Nicander's Necklace",
    right_ring="Purity Ring",
  }

  sets.status = {}
  sets.status.Idle = {}
  sets.status.Idle.DT = { --43% DT, 7% PDT, 
    ammo="Staunch Tathlum +1", --DT-3%
    head="Malignance Chapeau", -- DT -6%, MEva 123
    body="Malignance Tabard", -- DT -9% MEva 139
    hands="Malignance Gloves", -- DT -5% MEva 112
    legs="Nyame Flanchard", -- MEVA 139
    feet="Malignance Boots", -- DT -4% MEva 150
    neck="Loricate Torque +1", --DT -6%
    waist="Flume Belt", -- PDT -4%
    left_ear="Etiolation Earring", -- MDT -3%
    right_ear="Eabani Earring", -- MEva 8
    left_ring="Defending Ring", -- DT -10%
    right_ring="Shneddick Ring", -- PDT -3%
    back=gear.AmbuCape.TP,
  }
  sets.status.Idle.Eva = {
    -- 1369 Evasion without food or buffs @ML26 NIN
    -- Salt Ramen provides +90 Evasion. https://www.bg-wiki.com/ffxi/Salt_Ramen
    -- Yonin presumably provides +50~70 Evasion
    main="Raicho +1",
    sub={ name="Tsuru", augments={'Path: A',}},
    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Shigure Tekko +1",
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck="Bathy Choker +1",
    waist="Flume Belt",
    left_ear="Infused Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Warden's Ring",
    back = gear.AmbuCape.Evasion,
  }

  sets.WeaponSet = {}

  sets.WeaponSet.Heishi = {
    main="Heishi Shorinken",
    sub={ name="Kunimitsu", augments={'Path: A',}},
  }
  sets.WeaponSet.Naegling = {
    main="Naegling",
    sub={ name="Uzura +3"},
	}
  sets.WeaponSet.Kikoku = {
    main="Kikoku",
    sub={ name="Kunimitsu", augments={'Path: A',}},
  }
  sets.WeaponSet.KannagiQA = {
    main="Kannagi",
    sub={ name="Kunimitsu", augments={'Path: A',}},
  }
  sets.WeaponSet.Tauret = {
    main="Tauret",
    sub="Gleti's Knife",
  }
  sets.WeaponSet.NagiTsuru = {
    main="Nagi",
    sub="Tsuru",
  }

  sets.Melee = {}

  sets.Melee.NoAccuracy = {}
  sets.Melee.NoAccuracy.Haste0 = {
    -- Very low accuracy vs 1150 evasion (vs old content)
    -- Assumes Grape Daifuku food & R15 Heishi + R20 Kunimitsu
    ammo="Seki Shuriken",
    head = gear.Ryuo.head.STP,
    body = gear.Relic.body,
    hands = gear.Adhemar.hands.Attack,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Eabani Earring",
    right_ear="Dedition Earring",
    left_ring="Regal Ring",
    right_ring="Chirich Ring +1",
    back = gear.AmbuCape.TP
  }
  sets.Melee.NoAccuracy.Haste15 = {
    -- Very low accuracy vs 1150 evasion (vs old content)
    -- Assumes Grape Daifuku food & R15 Heishi + R20 Kunimitsu
    -- Haste=15% (Ulmia/Joachim Victory March, or a Haste1)
    ammo="Seki Shuriken",
    head = "Adhemar Bonnet +1",
    body = gear.Adhemar.body.Attack,
    hands = gear.Adhemar.hands.Attack,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.TP
  }
  sets.Melee.NoAccuracy.Haste30 = {
    -- Very low accuracy vs 1150 evasion (vs old content)
    -- Assumes Grape Daifuku food & R15 Heishi + R20 Kunimitsu
    ammo="Seki Shuriken",
    head = "Adhemar Bonnet +1",
    body = gear.Adhemar.body.Attack,
    hands = gear.Adhemar.hands.Attack,
    legs="Ken. Hakama +1",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.TP,
  }
  sets.Melee.NoAccuracy.HasteCap = {
    -- very low accuracy vs 1150 evasion (vs old content)
    -- Assumes Grape Daifuku food & R15 Heishi + R20 Kunimitsu
    ammo="Seki Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands = gear.Adhemar.hands.Attack,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.TP,
  }

  sets.Melee.LowAccuracy = {}
  sets.Melee.LowAccuracy.Haste0 = {
    -- Low accuracy vs 1200 evasion (vs Omen and Dynamis Wave 1 Fodder.)
    -- Assumes Grape Daifuku food & R15 Heishi + R20 Kunimitsu
    ammo="Seki Shuriken",
    head ="Adhemar Bonnet +1",
    body = "Ken. Samue +1",
    hands = gear.Adhemar.hands.Attack,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Suppanomimi",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Chirich Ring +1",
    back = gear.AmbuCape.DW,
  }
  sets.Melee.LowAccuracy.Haste15 = {
    -- Low accuracy vs 1200 evasion (vs Omen and Dynamis Wave 1 Fodder.)
    -- Assumes Grape Daifuku food & R15 Heishi + R20 Kunimitsu
    -- Haste=15% (Ulmia/Joachim Victory March, or a Haste1)
    ammo="Seki Shuriken",
    head ="Malignance Chapeau",
    body = gear.Adhemar.body.Attack,
    hands = gear.Adhemar.hands.Attack,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.DW
  }
  sets.Melee.LowAccuracy.Haste30 = {
    -- Low accuracy vs 1200 evasion (vs Omen and Dynamis Wave 1 Fodder.)
    -- Assumes Grape Daifuku food & R15 Heishi + R20 Kunimitsu
    ammo="Seki Shuriken",
    head ="Malignance Chapeau",
    body = gear.Adhemar.body.Attack,
    hands = gear.Adhemar.hands.Attack,
    legs="Ken. Hakama +1",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Eabani Earring",
    right_ear="Dedition Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.STP
  }
  sets.Melee.LowAccuracy.HasteCap = {
    -- Low accuracy vs 1200 evasion (vs Omen and Dynamis Wave 1 Fodder.)
    -- Assumes Grape Daifuku food & R15 Heishi + R20 Kunimitsu
    ammo="Seki Shuriken",
    head="Malignance Chapeau",
    body="Ken. Samue +1",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.STP,
  }

  sets.Melee.MidAccuracy = {}
  sets.Melee.MidAccuracy.Haste0 = {
    -- Mid accuracy vs 1350 evasion (vs Kei solo)
    -- Assumes Sublime Sushi food & R15 Heishi + R20 Kunimitsu
    ammo="Date Shuriken",
    head = "Kendatsuba Jinpachi +1", -- Should be Path A for accuracy. 0.2s difference between that and this.
    body = gear.Relic.body,
    hands = gear.Adhemar.hands.Attack,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Suppanomimi",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Chirich Ring +1",
    back = gear.AmbuCape.DW,
  }
  sets.Melee.MidAccuracy.Haste15 = {
    -- Mid accuracy vs 1350 evasion (vs Kei solo)
    -- Assumes Sublime Sushi food & R15 Heishi + R20 Kunimitsu
    -- Haste=15% (Ulmia/Joachim Victory March, or a Haste1)
    ammo="Date Shuriken",
    head="Kendatsuba Jinpachi +1", -- Should be Path A Ryuo, but I don't have pathA. 0.03s difference
    body = "Ken. Samue +1",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Suppanomimi",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Chirich Ring +1",
    back = gear.AmbuCape.DW,
  }
  sets.Melee.MidAccuracy.Haste30 = {
    -- Mid accuracy vs 1350 evasion (vs Kei solo)
    -- Assumes Sublime Sushi food & R15 Heishi + R20 Kunimitsu
    ammo="Date Shuriken",
    head="Malignance Chapeau", -- Ryuo Somen +1 A is better, but I have path C
    body = "Ken. Samue +1", -- Adhemar Jacket +1 A paired with Ryuo Somen +1 A is better, but I have jacket +1 B
    hands="Malignance Gloves",
    legs="Ken. Hakama +1",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Eabani Earring", -- Suppanomimi is negligibly worse in terms of TP time despite capping delay (-80% vs -79.75%) but this gives EVA+ and AGI+ too so Eabani is better
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Chirich Ring +1",
    back = gear.AmbuCape.TP,
  }
  sets.Melee.MidAccuracy.HasteCap = {
    -- Mid accuracy vs 1350 evasion (vs Kei solo)
    -- Assumes Sublime Sushi food & R15 Heishi + R20 Kunimitsu
    ammo="Date Shuriken",
    head="Malignance Chapeau", -- Ryuo Somen +1 A is better, but I have path C
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Ken. Hakama +1",
    feet="Malignance Boots",
    neck="Ninja Nodowa +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.TP,
  }

  sets.Melee.Fullers = {
    main={ name="Nagi", augments={'Path: A',}},
    sub={ name="Tsuru", augments={'Path: A',}},
    ammo="Date Shuriken",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
  }
  sets.Melee.Crit = {
    -- Gear: +57% Crit Rate
    -- Merit: +5% Crit Rate
    -- Base: +5% Crit Rate
    -- Innin: +10-30% Crit Rate (behind enemy)
    -- dDEX: +0-15% Crit Rate
    -- sub={ name="Gleti's Knife", augments={'Path: A',}}, -- 5
    ammo="Date Shuriken", -- 1
    head={ name="Blistering Sallet +1", augments={'Path: A',}}, -- 10
    body="Ken. Samue +1", -- 9
    hands="Ken. Tekko +1", -- 5
    legs="Ken. Hakama +1", -- 7
    feet="Ken. Sune-Ate +1", -- 5
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}}, -- 0
    waist={ name="Kentarch Belt +1", augments={'Path: A',}}, -- 0 (Gerdr Belt +3% (+4%))
    left_ear="Odr Earring", -- 5
    right_ear="Telos Earring", -- 0
    left_ring="Regal Ring", -- 0
    right_ring="Epona's Ring", -- 0
    back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10',}}, -- 10
  }
  sets.Melee.HighAccuracy = {
    -- High accuracy vs 1500 evasion (vs Dynamis Wave 3)
    -- Assumes Sublime Sushi food & R15 Heishi + R20 Kunimitsu
    -- You will likely require at least one Madrigal to hit these targets consistently.
    -- Assuming you have a BRD using HM+VM+Madrigal+Minuet5 since you're likely fighting end-game content.
    -- Assuming that the buffs received are Rolls+7, Songs+7, HM+4, and no JA boosts to your buffs. With buffed madrigals you may swap to the MidAccuracy sets.
    ammo="Date Shuriken",
    head="Kendatsuba Jinpachi +1",
    body="Kendatsuba Samue +1",
    hands="Malignance Gloves",
    legs="Ken. Hakama +1",
    feet="Malignance Boots",
    neck="Ninja Nodowa +2",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.STP,
  }

  sets.Melee.Hybrid = {
    -- Hybrid Melee set
    -- Assumes Sublime Sushi food & R15 Heishi + R20 Kunimitsu
    -- Engraved Belt is part of this set to counter Kei's slow spikes during wind mode
    ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Ken. Hakama +1",
    feet="Malignance Boots",
    neck="Ninja Nodowa +2",
    waist="Windbuffet Belt +1",
    waist="Engraved Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.STP,
  }
  sets.Melee.SubtleBlow = {
    -- Subtle Blow Melee set
    -- Ninja get +27 Subtle Blow from traits; only 23 needed from gear.
    ammo="Seki Shuriken",
    head = gear.Adhemar.head.Accuracy,  -- +8
    body="Kendatsuba Samue +1", -- +12
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Ninja Nodowa +2",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.STP,
  }

  sets.Treasure = {
    ammo="Per. Lucky Egg",
	head="Herculean Helm",
    feet="Volte Boots",
    waist="Chaac Belt",
  }

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  sets.precast = {}
  sets.precast.FastCast = {
  -- +56% Fast Cast, +7% Quick Magic
    ammo="Impatiens",
    head = gear.Herc.head.FC,
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Gyve Trousers",
    feet = gear.Relic.feet,
    neck="Voltsurge Torque",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.Evasion,
  }

  sets.precast.Utsusemi = set_combine(sets.precast.FastCast, {
    neck="Magoraga bead necklace",
  })

  sets.precast.Provoke = {
  -- +78 Enmity
  -- Yonin +30 to +10 (+18 for a simple number)
  -- Gekka +30
  -- Nagi +40
  -- Tsuru +15
  -- Total: +193 (cap of +200)
    ammo="Sapience Orb", -- +2
    head="Versa Celata", -- +5
    body="Emet Harness +1",  -- +10
    hands="Kurys Gloves",  -- +9
    legs="Zoar Subligar +1", -- +6
    feet = gear.Relic.feet, -- +8
    neck="Unmoving Collar +1", -- +10
    left_ear="Trux Earring",  -- +5
    right_ear="Cryptic Earring",  -- +4
    left_ring="Petrov Ring",  -- +4
    right_ring="Eihwaz Ring",  -- +5
    back = gear.AmbuCape.SIRD, -- +10
  }

  sets.precast.Mijin = {
    main="Nagi",
    legs = gear.Relic.legs,
  }

  sets.WeaponSkill = {}
  sets.WeaponSkill_Cap = {}
  sets.WeaponSkill["Blade: Ten"] = {
    -- 30% STR, 30% DEX
    -- FTP = [4.5, 11.5, 15.5]
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Blade: Shun"] = {
    -- 73%/76%/79%/82%/85% DEX
    -- Attack *= [1.0, 2.0, 3.0]
    -- FTP = 1.0 Replicating
    ammo="Aurgelmir Orb",
    head="Kendatsuba Jinpachi +1",
    body = gear.Adhemar.body.Attack,
    hands = "Malignance Gloves",
    legs={ name="Rao Haidate +1", augments={'STR+12','DEX+12','Attack+20',}},
    feet = gear.Relic.feet,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.DAdex,
  }
  sets.WeaponSkill["Blade: Metsu"] = {
    -- 80% DEX
    -- FTP = 5.0
    ammo="Aurgelmir Orb",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Mache Earring +1",
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDdex,
  }
  sets.WeaponSkill["Blade: Hi"] = {
    -- 80% AGI
    -- CritRate += [0.15, 0.20, 0.25]
    ammo="Yetshila +1",
    head="Blistering Sallet +1",
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Odr Earring",
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.Crit,
  }
  sets.WeaponSkill["Blade: Kamu"] = {
    -- 60% STR, 60% INT
    -- FTP = 1.0
    -- Attack *= 2.25, EnemyDef *= 0.75
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Mpaca's Hose",
    feet="Nyame Sollerets",
    neck="Ninja Nodowa +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Blade: Ku"] = {
    -- 30% STR, 30% DEX
    -- FTP = 1.25 replicating
    ammo="Seething Bomblet +1",
    head="Blistering Sallet +1",
    body = gear.Adhemar.body.Attack,
    hands = gear.Relic.hands,
    legs={ name="Rao Haidate +1", augments={'STR+12','DEX+12','Attack+20',}},
    feet = gear.Relic.feet,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Blade: Chi"] = {
    -- 30% STR, 30% INT
    -- FTP = [0.5, 1.375, 2.25]
    -- Earth-based Hybrid
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head = gear.Relic.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs= gear.Relic.legs,
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Blade: To"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head = gear.Relic.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs= gear.Relic.legs,
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Blade: Teki"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head = gear.Relic.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs= gear.Relic.legs,
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Blade: Ei"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head = gear.Relic.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs= gear.Relic.legs,
    feet="Nyame Sollerets",
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Archon Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Aeolian Edge"] = {
    ammo="Pemphredo Tathlum",
    head = gear.Relic.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Shiva Ring +1",
    right_ring="Metamorph Ring +1",
    back = gear.AmbuCape.Nuke,
  }
  sets.WeaponSkill["Evisceration"] = {
    -- 50% DEX
    -- CritRate += [0.1, 0.25, 0.50]
    -- FTP = 1.25 replicating
    ammo="Yetshila +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ken. Samue +1",
    hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
    legs="Jokushu Haidate",
    feet="Ken. Sune-Ate +1",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Savage Blade"] = {
    -- 50% STR, 50% MND
    -- FTP = [4.0, 10.25, 13.75]
    ammo="Seeth. Bomblet +1",
    head = gear.Relic.head,
    body= gear.Herc.body.wsd,
    hands= gear.Herc.hands.wsd,
    legs= gear.Relic.legs,
    feet= gear.Herc.feet.wsd,
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Tachi: Ageha"] = {
    ammo="Pemphredo Tathlum",
    head = gear.AF.head,
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet = gear.AF.feet,
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Crepuscular Earring",
    right_ear="Digni. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Sangoma Ring",
    back = gear.AmbuCape.Nuke,
  }
  sets.WeaponSkill["Tachi: Kagero"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head = gear.Herc.head.wsd,
    body= gear.Herc.body.wsd,
    hands= gear.Herc.hands.wsd,
    legs= gear.Relic.legs,
    feet= gear.Herc.feet.wsd,
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Tachi: Goten"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head = gear.Herc.head.wsd,
    body= gear.Herc.body.wsd,
    hands= gear.Herc.hands.wsd,
    legs= gear.Relic.legs,
    feet= gear.Herc.feet.wsd,
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Tachi: Jinpu"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head = gear.Herc.head.wsd,
    body= gear.Herc.body.wsd,
    hands= gear.Herc.hands.wsd,
    legs= gear.Relic.legs,
    feet= gear.Herc.feet.wsd,
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Tachi: Koki"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head = gear.Herc.head.wsd,
    body= gear.Herc.body.wsd,
    hands= gear.Herc.hands.wsd,
    legs= gear.Relic.legs,
    feet= gear.Herc.feet.wsd,
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Weather. Ring +1",
    back = gear.AmbuCape.WSDstr,
  }

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.midcast = {}

  sets.midcast.Nuke = {
    ammo="Ghastly Tathlum +1",
    head = gear.Relic.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet = gear.Relic.feet,
    neck="Sybil Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Shiva Ring +1",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.MagicBurst = {
   -- main="Gokotai",
   -- sub="Kunimitsu",
    body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    feet = gear.Relic.feet,
    left_ear="Static Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
  }
  sets.midcast.MagicAccuracy = {
    ranged="Ullr",
    head = gear.AF.head,
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
--    feet = gear.AF.feet,
    feet = gear.Relic.feet,
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Crepuscular Earring",
    right_ear="Digni. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Sangoma Ring",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.Utsusemi = {
    feet = gear.Empy.feet,
    back = gear.AmbuCape.SIRD,
  }
  sets.midcast.SpellInterruption = {
  -- -95% Spell Interruption from gear (950/1024) for Utsu
  -- -105% for non-utsu (still only 1024/1024)
  -- -10% more from merits for capped 1030/1024
    ammo="Impatiens",             -- -10%
    head = gear.Taeon.head.sird,  -- -10%
    body = gear.Taeon.body.sird,  -- -10%
    hands={ name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20',}}, -- -15%
    legs = gear.Taeon.legs.sird,  -- -10%
    feet = gear.Taeon.feet.sird,  -- -10% NOT EQUIPPED DURING UTSU. EMPY FEET+1
    neck="Moonbeam Necklace",     -- -10%
    waist="Audumbla Sash",        -- -10%
    right_ear="Halasz Earring",    -- -5%
    left_ring="Defending Ring",
    right_ring="Evanescence Ring", -- -5%
    back = gear.AmbuCape.SIRD     -- -10%
  }
  sets.midcast.Migawari = {
    ammo="Sapience Orb",
    head = gear.Herc.head.FC,
    -- body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Gyve Trousers",
    feet = gear.Relic.feet,
    neck="Orunmila's Torque",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.Evasion,
  }
end




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- SPELL/ABILITY LISTS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function maps() -- For some reason this is required if you want to use List:contains(spell.english). You have to have this "function maps()" and "end" lines surrounding your lists.
-- You also need the maps() line in your get_sets() function if you want these to work.
-- Otherwise you will get an error for all lines that use the "contains(spell.english)" function that says something along the lines of "attempt to index global 'TreasureHunter' (a Nil value)"
-- In addition to the above 3 lines, you'll also need to have the random S infront of your lists.

  Utsu           = S {"Utsusemi: Ichi", "Utsusemi: Ni", "Utsusemi: San"}
  Nukes          = S {"Katon: Ichi", "Katon: Ni", "Katon: San",
                      "Suiton: Ichi", "Suiton: Ni", "Suiton: San",
                      "Raiton: Ichi", "Raiton: Ni", "Raiton: San",
                      "Doton: Ichi", "Doton: Ni", "Doton: San",
                      "Huton: Ichi", "Huton: Ni", "Huton: San",
                      "Hyoton: Ichi", "Hyoton: Ni", "Hyoton: San"}
  Enfeebles      = S {"Hojo: Ichi", "Hojo: Ni", "Kurayami: Ichi", "Kurayami: Ni",
                      "Jubaku: Ichi", "Dokumori: Ichi", "Aisha: Ichi", "Yurin: Ichi"}
  Enhancing      = S {"Tonko: Ichi", "Tonki: Ni", "Monomi: Ichi", "Myoshu: Ichi",
                      "Kakka: Ichi", "Migawari: Ichi", "Gekka: Ichi", "Yain: Ichi"}
  KatanaWS       = S {"Blade: Rin", "Blade: Retsu", "Blade: Teki", "Blade: To",
                      "Blade: Chi", "Blade: Ei", "Blade: Jin", "Blade: Ten",
                      "Blade: Ku", "Blade: Kamu", "Blade: Yu", "Blade: Hi",
                      "Blade: Shun", "Blade: Metsu"}
  Waltz          = S {"Curing Waltz", "Curing Waltz II", "Curing Waltz III", "Divine Waltz"}
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)

  attack = player.attack
  if attack < 1500 then
    AtkFlag = 0 -- Low attack TP sets (trusts)
  elseif attack < 3000 then
    AtkFlag = 1 -- Mid Attack TP set (normal buffs)
  else
    AtkFlag = 2 -- Max Attack TP set (2h buffs, SV, crooked chaos, etc)
  end



  self = windower.ffxi.get_mob_by_target('me')
  target = windower.ffxi.get_mob_by_target('t') or windower.ffxi.get_mob_by_target('st') or self
  distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
  weather_intensity = gearswap.res.weather[world.weather_id].intensity


  if sets.WeaponSkill[spell.name] then
    if distance > 7 then
      send_command('@input /echo Target too far away.')
      cancel_spell()
    end
      equip(sets.WeaponSkill[spell.name])
  elseif Utsu:contains(spell.name) then
    equip(set_combine(sets.precast.FastCast, sets.precast.Utsusemi))

  elseif spell.name == "Provoke" or spell.name == "Animated Flourish" or spell.name == "Flash" then
    equip(set_combine(sets.precast.Provoke))
  elseif spell.type=="WeaponSkill" then
    if distance > 7 then
      send_command('@input /echo Target too far away.')
      cancel_spell()
    end
    equip(sets.WeaponSkill["Blade: Ten"])
  elseif Waltz:contains(spell.name) then
    equip(sets.precast.Waltz)
  elseif spell.name == "Mijin Gakure" then
    equip(sets.precast.Mijin)
  elseif spell.name:contains("Step") or spell.name:contains("step") or spell.name:contains('Jump') then
    equip(sets.Melee.HighAccuracy)
  elseif spell.name == 'Violent Flourish' then
    equip(sets.midcast.MagicAccuracy)
  elseif spell.name == 'Spectral Jig' and buffactive['Sneak'] then
    -- If using Spectral Jig, automatically remove Sneak so the spell does not fail.
    windower.ffxi.cancel_buff(71)
  elseif spell.name == "Holy Water" then
    equip(set_combine(sets.status.Idle.DT,sets.items.HolyWater))
  else
    equip(sets.precast.FastCast)
  end


end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)

  if spell.name == "Sange" then
    equip(gear.Shuriken.Happo) -- Equip Shuriken as Sange is being used to prevent wasting Seki
  elseif spell.skill == "Ninjutsu" then
    if spell.name == "Migawari: Ichi" then
      equip(set_combine(sets.status.Idle.DT, sets.precast.FastCast, sets.midcast.Migawari))
    elseif Utsu:contains(spell.name) then
      if buffactive['Yonin'] then
        if UtsuEnmityFlag==true then
          equip(set_combine(sets.status.Idle.DT, sets.precast.Provoke, sets.midcast.Utsusemi))
        end
      else
        equip(set_combine(sets.status.Idle.DT, sets.midcast.SpellInterruption, sets.midcast.Utsusemi))
      end

      -- Cancel high tiers of Utsusemi when casting lower tiers:
      if not buffactive['Copy Image (4+)'] and not buffactive['Copy Image (3)'] and not buffactive['Copy Image (2)'] and not buffactive['Copy Image'] or current_utsusemi == nil then
        -- If there is no Copy Image buff up, then set current Utsusemi priority = 0
        -- Cancel any pre-existing Utsusemi during this mid-cast.
        --   This is for the edge-case that occurs when you load this gearswap with shadows already up.
        --   It prevents it from throwing an error for the first cast before a priority is set.
        windower.ffxi.cancel_buff(446)  -- Copy Image (4+)
        windower.ffxi.cancel_buff(445)  -- Copy Image (3)
        windower.ffxi.cancel_buff(444)  -- Copy Image (2)
        windower.ffxi.cancel_buff(66)   -- Copy Image
        current_utsusemi = 0
      else
        -- If Utsusemi is already up, determine the priority of the Utsusemi being casted.
        if spell.name == 'Utsusemi: Ichi' then
          try_utsusemi = 1
        elseif spell.name == 'Utsusemi: Ni' then
          try_utsusemi = 2
        elseif spell.name == 'Utsusemi: San' then
          try_utsusemi = 3
        end
        if try_utsusemi < current_utsusemi then
          -- This will still remove the existing Copy Image if you get interrupted.
          -- using 'if not spell.interrupted' does not work for midcast
          -- cancelling Copy Image and getting interrupted isn't optimal, but it's better than casting Utsu and not getting any shadows.
          -- plus, if you got interrupted, then you probably don't have shadows anyway. So this is fine as is.
          windower.ffxi.cancel_buff(446)  -- Copy Image (4+)
          windower.ffxi.cancel_buff(445)  -- Copy Image (3)
          windower.ffxi.cancel_buff(444)  -- Copy Image (2)
          windower.ffxi.cancel_buff(66)   -- Copy Image
        end
      end


    elseif Nukes:contains(spell.name) then
      equip(set_combine(sets.status.Idle.DT, sets.midcast.SpellInterruption, sets.midcast.MagicAccuracy, sets.midcast.Nuke))
      if MagicBurstFlag == true then
        equip(sets.midcast.MagicBurst)
      end
      if buffactive["Futae"] then
        equip(gear.Empy.hands)
      end
      if world.weather_element == spell.element or world.day_element == spell.element then
        equip(gear.Obi)
      end
      if spell.element == 'Lightning' then
        equip({ranged="Donar Gun", ammo=empty})
      end
    elseif Enfeebles:contains(spell.name) then
      equip(set_combine(sets.midcast.SpellInterruption, sets.midcast.MagicAccuracy))
    elseif Enhancing:contains(spell.name) then
      equip(sets.status.Idle.DT, sets.midcast.SpellInterruption)
    elseif spell.name == "Flash" then
      equip(set_combine(sets.midcast.MagicAccuracy,sets.precast.Provoke))
    end
  end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AFTERCAST FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)
  if player.status == 'Idle' then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    if HybridTPFlag then
      equip(sets.Melee.Hybrid)
    elseif CritTPFlag then
        equip(sets.Melee.Crit)
    elseif AccFlag == 0 then
      if HasteFlag == 0 then
        equip(sets.Melee.NoAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.Melee.NoAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.Melee.NoAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.Melee.NoAccuracy.HasteCap)
      end
    elseif AccFlag == 1 then
      if HasteFlag == 0 then
        equip(sets.Melee.LowAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.Melee.LowAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.Melee.LowAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.Melee.LowAccuracy.HasteCap)
      end
    elseif AccFlag == 2 then
      if HasteFlag == 0 then
        equip(sets.Melee.MidAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.Melee.MidAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.Melee.MidAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.Melee.MidAccuracy.HasteCap)
      end
    elseif AccFlag == 3 then
      equip(sets.Melee.HighAccuracy)
    end
  end

  if Utsu:contains(spell.name) then
    if not spell.interrupted then
      -- If the spell is not interrupted, then set the current Utsusemi spell's priority.
      -- In other words: don't set a priority if the spell got interrupted for some reason.
      -- This current priority is compared to any future  Utsusemi being casted.
      -- The higher priority loses and is removed to allow lower priority to take effect.
      -- This way you avoid "Utsusemi: Ichi fails to take effect." when casting Ichi with Ni/San shadows up still.
      if spell.name == 'Utsusemi: Ichi' then
        current_utsusemi = 1
      elseif spell.name == 'Utsusemi: Ni' then
        current_utsusemi = 2
      elseif spell.name == 'Utsusemi: San' then
        current_utsusemi = 3
      end
    end
  end
  if buffactive['Sange'] then
    equip(gear.Shuriken.Happo)
  end
  if spell.name == "Sange" then
    equip(gear.Shuriken.Happo) -- Equip Shuriken as Sange is being used to prevent wasting Seki
  end
end


function status_change(new,old)

  if new == "Idle" then
    equip(sets.status.Idle.DT)
  elseif new == "Engaged" then
    if HybridTPFlag then
      equip(sets.Melee.Hybrid)
    elseif CritTPFlag then
        equip(sets.Melee.Crit)
    elseif AccFlag == 0 then
      if HasteFlag == 0 then
        equip(sets.Melee.NoAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.Melee.NoAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.Melee.NoAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.Melee.NoAccuracy.HasteCap)
      end
    elseif AccFlag == 1 then
      if HasteFlag == 0 then
        equip(sets.Melee.LowAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.Melee.LowAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.Melee.LowAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.Melee.LowAccuracy.HasteCap)
      end
    elseif AccFlag == 2 then
      if HasteFlag == 0 then
        equip(sets.Melee.MidAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.Melee.MidAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.Melee.MidAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.Melee.MidAccuracy.HasteCap)
      end
    elseif AccFlag == 3 then
      equip(sets.Melee.HighAccuracy)
    end

  elseif sets.status[new] then
    equip(sets.status[new])
  end
  if buffactive['Sange'] then
    equip(gear.Shuriken.Happo)
  end

end
