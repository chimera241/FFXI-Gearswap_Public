IdleSetIndex = 1
IdleSet = {"Refresh", "DT", "Death"}

WeaponSetIndex = 1
WeaponSet = {"Mpaca's Staff", "Marin Staff +1", "Any"}

burstmode = true

MACCmode = true

occultmode = true

ObiOn = true

EatTp = false

Kiting = false

AFBodyOn = false

send_command('bind f9 gs c Toggleburstmode')
send_command('bind !f9 gs c Toggleoccultmode')
send_command('bind @f9 gs c ToggleAFBody')
send_command('bind ^f9 gs c CycleWeaponSet')
send_command('bind f11 gs c CycleIdleSet')
send_command('bind @f11 gs c EatTp')
send_command('bind ^f11 gs c ToggleMACCmode')
send_command('bind !f11 gs c ToggleObi')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind @f9')
    send_command('unbind f10')
    send_command('unbind @f11')
    send_command('unbind ^f11')
    send_command('unbind f12')
    send_command('unbind ^k')

    enable('main', 'sub')
end

--- ^ Ctrl, ! Alt, @ Win, ~ Shift---

function help()
	add_to_chat(122, 'Keyboard Bindings:')
	add_to_chat(122, 'F9: Burst Mode Toggle - default on')
	add_to_chat(122, 'Ctrl + F9: Cycle Weapon (Any > Mpacas Staff > Marin Staff +1)')
	add_to_chat(122, 'Alt + F9: Occult Acumen Mode - Default on')
	add_to_chat(122, 'Win + F9: Lock AF Body and Burst set for all nukes - default off')
	add_to_chat(122, 'F11: Cycle Idle Sets (Refresh > DT > Death)')
	add_to_chat(122, 'Win + F11: Eat TP Mode')
	add_to_chat(122, 'Ctrl + F11: Burst MACC Mode - default on')
	add_to_chat(122, 'Alt + F11: Toggle Obi - Not functioning until I rebuy my OShash!')
	add_to_chat(122, 'Ctrl + k: Toggle kiting')
end

help()

function self_command(command)
    -- print(command)
	if command == "CycleWeaponSet" then
        WeaponSetIndex = WeaponSetIndex % #WeaponSet + 1

        local weapon_set = WeaponSet[WeaponSetIndex]
        if weapon_set == 'Any' then
            enable('main', 'sub')
        else
            enable('main', 'sub')
            equip(sets.WeaponSet[weapon_set])
            disable('main', 'sub')
        end

        add_to_chat(122, 'Weapon Set: ' .. weapon_set)
    elseif command == 'CycleIdleSet' then
        IdleSetIndex = IdleSetIndex % #IdleSet + 1

        local idle_set = IdleSet[IdleSetIndex]
        add_to_chat(122, 'Idle Set: ' .. idle_set)
    elseif command == 'toggle kiting' then
        Kiting = not Kiting
        if Kiting then
            send_command('@input /echo ----- Kiting Set On -----')
        else
            send_command('@input /echo ----- Kiting Set Off -----')
        end
        equip_set(player.status)
    elseif command == 'EatTp' then
        EatTp = not EatTp
        if EatTp then
            send_command('@input /echo ----- Eat Tp On -----')
        else
            send_command('@input /echo ----- Eat Tp Off -----')
        end
        equip_set(player.status)
    elseif command == 'ToggleObi' then
        ObiOn = not ObiOn
        if ObiOn then
            send_command('@input /echo ----- Obi On -----')
        else
            send_command('@input /echo ----- Obi Off -----')
        end
        equip_set(player.status)
    elseif command == 'ToggleAFBody' then
        AFBodyOn = not AFBodyOn
        if AFBodyOn then
            send_command('@input /echo ----- AF Body Locked On -----')
        else
            send_command('@input /echo ----- Body Slot Unlocked Off -----')
        end
        equip_set(player.status)
    elseif command == 'Toggleburstmode' then
        burstmode = not burstmode
        if burstmode then
            send_command('@input /echo ----- Magic Burst Mode On -----')
        else
            send_command('@input /echo ----- Magic Burst Mode Off -----')
        end
        equip_set(player.status)
    elseif command == 'ToggleMACCmode' then
        MACCmode = not MACCmode
        if MACCmode then
            send_command('@input /echo ----- High MACC mode -----')
        else
            send_command('@input /echo ----- Normal MACC mode -----')
        end
        equip_set(player.status)
    elseif command == 'Toggleoccultmode' then
        occultmode = not occultmode
        if occultmode then
            send_command('@input /echo ----- Occult Acumen on (if not in burst mode) -----')
        else
            send_command('@input /echo ----- Occult Acumen Off -----')
        end
        equip_set(player.status)
    end
end

function get_sets()
	Cape = {}
		Cape.TP = { name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Damage taken-5%',}}
		Cape.Nuke = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
		Cape.WSD = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}}
		Cape.Death = { name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}}
		
	Mhead = {}
		Mhead.Phalanx = { name="Merlinic Hood", augments={'Attack+11','"Mag.Atk.Bns."+8','Phalanx +4','Accuracy+5 Attack+5',}}
		Mhead.FC = { name="Merlinic Hood", augments={'"Mag.Atk.Bns."+22','"Fast Cast"+7','INT+9',}}
	Mbody = {}	
		Mbody.Phalanx = { name="Merlinic Jubbah", augments={'VIT+8','Accuracy+15','Phalanx +5','Accuracy+13 Attack+13','Mag. Acc.+8 "Mag.Atk.Bns."+8',}}
	Mhands = {}
		Mhands.Phalanx = { name="Merlinic Dastanas", augments={'Attack+21','MND+6','Phalanx +3','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
		Mhands.Occult = { name="Merlinic Dastanas", augments={'Mag. Acc.+26','"Occult Acumen"+10','CHR+5',}}
	Mlegs = {}	
		Mlegs.Refresh = { name="Merlinic Shalwar", augments={'"Fast Cast"+2','Pet: "Dbl. Atk."+1','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
		Mlegs.Phalanx = { name="Merlinic Shalwar", augments={'CHR+9','Phys. dmg. taken -1%','Phalanx +2','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	Mfeet= {}
		Mfeet.FC = { name="Merlinic Crackows", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+7','Mag. Acc.+6','"Mag.Atk.Bns."+8',}}
		Mfeet.Occult = { name="Merlinic Crackows", augments={'Mag. Acc.+17','"Occult Acumen"+11',}}
		Mfeet.Phalanx = { name="Merlinic Crackows", augments={'"Dbl.Atk."+3','INT+8','Phalanx +2',}}


    sets.WeaponSet = {}
    sets.WeaponSet["Mpaca's Staff"] = {main="Mpaca's Staff", sub="Khonsu"}
    sets.WeaponSet["Marin Staff +1"] = {main="Marin Staff +1", sub="Khonsu"}

    sets.idle = {}
    
    sets.idle["DT"] = {
        ammo="Staunch tathlum +1",
        head="Nyame Helm",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Shamash Robe",
        hands="Nyame Gauntlets",
        ring1="Shneddick ring",
        ring2="Defending ring",
        back=Cape.Death,
        waist="Slipor sash",
        legs="Nyame Flanchard",
        feet="Archmage's sabots +2"
    }

    sets.idle["Refresh"] = set_combine(sets.idle["DT"], {
        ammo="Staunch tathlum +1",
        head="Befouled crown",
		hands="Volte Gloves",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
		legs=Mlegs.Refresh
    })

    sets.idle["Death"] = deathSet

    sets.kiting = {
        ring2="Shneddick ring"
    }

    sets.engaged = {
        ammo="Staunch Tathlum +1",
		head="Nyame helm",
        neck="Sanctity necklace",
        ear1="Telos earring",
        ear2="Dignitary's earring",
        body="Nyame mail",
        hands="Gazu bracelets +1",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        back=Cape.TP,
        waist="Grunfeld rope",
        legs="Archmage's tonban +3",
        feet="Nyame sollerets"
		}

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.precast = {}

	sets.precast.ja = {}
    sets.precast.ja['Manafont'] = { body = "Archmage's coat +3"}
    sets.precast.ja['Elemental Seal'] = {}
    sets.precast.ja['Mana Wall'] = { main="Archmage's staff", feet = "Wicce sabots +2" }
    sets.precast.ja['Enmity Douse'] = {}
    sets.precast.ja['Manawell'] = {}
    sets.precast.ja['Subtle Sorcery'] = {}
    sets.precast.ja['Cascade'] = {}

   --79% fc (Merlinic Augments Dependent)
    sets.precast.fc = {
		head=Mhead.FC, --15%
		neck="Voltsurge Torque", --fast cast 4%
		ear1="Malignance earring", --fast cast 4%
		ear2="Loquacious Earring", --fast cast 2%
		body="Agwu's robe", --fast cast 8%
		hands="Agwu's gages", --fast cast 6%
		ring1="Kishar ring", --fast cast 4%
		ring2="Prolix Ring", --fast cast 2%
		back=Cape.Death, --10%
		waist="Embla sash", --fast cast 5%
		legs="Agwu's Slops", --7%
		feet=Mfeet.FC --fast cast 12%
	}
    
    sets.precast['Impact'] = set_combine(sets.precast.fc, {
        head=empty,
        body='Twilight cloak'
    })
	
    sets.precast.fc.elemental = set_combine(sets.precast.fc, {
        ear2="Barkarole earring",
    })

    sets.precast.fc.enhancing = set_combine(sets.precast.fc, {})

    sets.precast.fc.cure =set_combine(sets.precast.fc, {
        -- back="Pahtli cape" -- cure spellcasting time -8%
    })


    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast = {}

    sets.midcast.fast_recast = sets.precast.fc

    sets.midcast.elemental = {}
    sets.midcast.elemental["Magic Attack Bonus"] = {
        ammo="Pemphredo tathlum",
        head="Agwu's Cap",
        neck="Sibyl Scarf",
        ear1="Malignance earring",
        ear2="Regal earring", 
        body="Amalric Doublet +1",
        hands="Amalric Gages +1",       
        ring1="Metamorph ring +1",
        ring2="Freke ring",       
        back=Cape.Nuke,
        waist="Acuity belt +1", 
        legs="Archmage's Tonban +3",
        feet="Agwu's Pigaches"
    }

    sets.midcast.elemental["Occult Acumen"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        ammo="Seraphic Ampulla", --7 Occult
        head="Mallquis Chapeau +2", --11 Occult
        neck="Combatant's torque",
        ear1="Dedition earring",
        ear2="Crepuscular earring", --5 Store TP
        body="Spaekona's Coat +2",
        hands=Mhands.occult, --10
        ring1="Chirich Ring +1", --6 Store TP
        ring2="Crepuscular Ring", --6 Store TP
        waist="Oneiros rope",  --20 TP/MP
        legs="Perdition slops", --30 Occult
        feet=Mfeet.occult, --11 Occult -----139 TP/100 MP
    })

    local deathSet = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Pixie hairpin +1",
		neck="Sanctity Necklace", 
		ear1="Barkarole Earring",
		ear2="Etiolation Earring",
		body="Amalric Doublet +1",
		hands="Agwu's Gages",
		ring1="Mephitas's Ring +1", 
		ring2="Archon ring",
		back=Cape.Death,
		waist="Acuity Belt +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1"
    })

    sets.precast['Death'] = deathSet
    sets.midcast['Death'] = deathSet

    sets.midcast['Comet'] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
        head="Pixie hairpin +1",
        ring2="Archon ring",
    })

    --MB1 Total: 45
    --MB2 Total: 34
    --MB Total: 78
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], { --42 MBD, 18 MBDII
        ammo="Ghastly Tathlum +1",
		head="Agwu's Cap",  
        neck="Sorcerer's Stole +1", --MB: 6 
        ear1="Malignance earring",
        ear2="Regal earring",        
        body="Wicce Coat +3", --MB: 9 MB2:9
        hands="Agwu's Gages", --MB2: 3 
        left_ring="Metamorph ring +1",
        right_ring="Freke ring",    
        back=Cape.Nuke, --MB 5 
        waist="Acuity belt +1",
		legs="Wicce Chausses +3", --MB: 15
        feet="Agwu's Pigaches" --MB: 6
    })

    sets.midcast.elemental["MACC Burst"] = set_combine(sets.midcast.elemental["Magic Burst"], { --42 MBD, 18 MBDII
		head="Wicce Petasos +2"
    })
	
	sets.midcast.elemental.FreeBurst = set_combine(sets.midcast.elemental["Magic Burst"], {
		body="Spaekona's Coat +2"
	})
		
    sets.midcast.elemental.AncientMagic = set_combine(sets.midcast.elemental["Magic Attack Bonus"], {
         head = "Archmage's petasos +3"
    })

    sets.midcast.elemental.debuff = {
        ammo="Pemphredo tathlum",
        head="Spae. Petasos +2",
        neck="Src. Stole +1",
        left_ear="Regal Earring",
        right_ear="Malignance earring",
        body="Spaekona's Coat +2",
        hands="Spae. Gloves +2",
        left_ring="Freke Ring",
        right_ring="Metamorph ring +1",
        back=Cape.Nuke,
        waist="Acuity belt +1",
        legs="Arch. Tonban +3",
        feet="Arch. Sabots +3"
    }

    sets.midcast.enfeebling = set_combine(sets.midcast.fast_recast, {
        ammo="Pemphredo tathlum",
        head = "Spaekona's petasos +2",
        neck = "Sorcerer's stole +1",
        left_ear = "Regal earring",
        right_ear="Malignance earring",
        body = "Spaekona's coat +2",
        hands= "Regal Cuffs",
        ring1="Stikini Ring +1",
        ring2="Metamorph Ring +1",
        back=Cape.WSD,
        waist="Acuity Belt +1",
        legs="Spaekona's tonban +2",
        feet="Spaekona's sabots +2"
    })

    sets.midcast['Impact'] = set_combine(sets.midcast.enfeebling, {
        head=empty,
        body='Twilight cloak',
        ring2="Archon ring",
		feet="Archmage's Sabots +3"
    })

    sets.midcast.cure = set_combine(sets.midcast.fast_recast, {
		main="Raetic Rod +1", 
		sub="Genmei Shield",
		head="Vanya Hood",
		neck="Aife's medal",
		ear1="Loquac. earring",
		ear2="Mendi. earring", --5 Cure Pot, 2 Conserve MP
		body="Shamash Robe", -- 10 Conserve MP
		hands="Telchine Gloves", --10% Cure Pot
		ring1="Mephitas's Ring +1", --8 Healing Magic
		ring2="Menelaus's Ring", --3% Cure Pot
		back="Fi Follet Cape +1", --5 Conserve MP
		waist="Luminary Sash",
		legs="Vanya Slops", --18 Healing Magic
		feet="Vanya Clogs" --8 Conserve MP
    })

    sets.midcast.regen = set_combine(sets.midcast.fast_recast, {
        body="Telchine chasuble"
    })
	
	sets.midcast.phalanx = { --14
		head = Mhead.Phalanx, --4
		ear1="Loquac. earring",
		ear2="Mendi. earring", --5 Cure Pot, 2 Conserve MP
		body = Mbody.Phalanx, --5
		hands = Mhands.Phalanx, --3
		ring1 ="Stikini Ring +1",
		ring2 ="Stikini Ring +1",
		legs= Mlegs.Phalanx, --2
		feet = Mfeet.Phalanx --2
		}

    sets.midcast.drain = set_combine(sets.midcast.fast_recast, {
		head="Pixie Hairpin +1",
		neck="Erra pendant",
		ear1="Hirudinea Earring",
		ear2="Malignance earring",
		ring1="Stikini Ring +1",
		ring2="Evanescence Ring",
		waist="Fucho-no-obi",
        legs="Spaekona's tonban +2",
		feet="Agwu's Pigaches"
    })

    sets.midcast.aspir = set_combine(sets.midcast.drain, {
		head="Pixie Hairpin +1",
		neck="Erra pendant",
		ear1="Hirudinea Earring",
		ear2="Malignance earring",
		ring1="Stikini Ring +1",
		ring2="Evanescence Ring",
		waist="Fucho-no-obi",
        legs="Spaekona's tonban +2",
		feet="Agwu's Pigaches"
    })

    sets.midcast.enhancing_magic = set_combine(sets.midcast.conserve_mp, {
        head="Amalric Coif +1",
        neck="Incanter's torque",
        ear1="Andoaa earring",
        ear2="Mimir earring",
        body="Telchine chasuble",
        hands="Regal Cuffs",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        waist="Embla sash",
        legs="Telchine braconi",
        feet="Telchine pigaches"
    })

----Weapon Skills----

    local physical_int_ws = {
        head="Archmage's petasos +3",
        neck="Sorcerer's stole +2",
        ear1="Regal earring",
        ear2="Ishvara earring",
        body="Archmage's coat +3",
        hands="Jhakri cuffs +2",
        ring1="Metamorph ring +1",
        ring2="Freke ring",
        back=Cape.WSD,
        waist="Fotia belt",
        legs="Archmage's tonban +3",
        feet=ws_boots
    }

    local magical_int_ws = {
        head="Nyame Helm",
        neck="Sorcerer's stole +2",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Archmage's Coat +3",
        hands="Jhakri cuffs +2",
        ring1="Metamorph ring +1",
        ring2="Freke ring",
        back=Cape.WSD,
        waist="Acuity Belt +1",
        legs="Archmage's tonban +3",
        feet="Nyame Sollerets"
    }

    local dark_magic_affinity = {head="Pixie hairpin +1", ring1="Archon ring"}
    local dark_magic_int_ws = set_combine(magical_int_ws, dark_magic_affinity)

    sets.ws = {}

    -- STR 40% | Physical
    sets.ws["Heavy Swing"] = physical_int_ws
    
    -- STR 40% INT 40% | Magical
    sets.ws["Rock Crusher"] = set_combine(magical_int_ws, {
        neck="Quanpur necklace"
    })
    
    -- STR 40% INT 40% | Magical
    sets.ws["Earth Crusher"] = set_combine(magical_int_ws, {
        neck="Quanpur necklace"
    })
    
    -- STR 40% MND 40% | Magical
    sets.ws["Starburst"] = dark_magic_int_ws
    
    -- STR 40% MND 40% | Magical
    sets.ws["Sunburst"] = dark_magic_int_ws
    
    -- STR 100% | Physical
    sets.ws["Shell Crusher"] = physical_int_ws
    
    -- STR 50% | Physical
    sets.ws["Full Swing"] = physical_int_ws
    
    -- INT 50% MND 50% | Physical
    sets.ws["Spirit Taker"] = physical_int_ws
    
    -- STR 30% MND 50% | Physical
    sets.ws["Retribution"] = physical_int_ws
    
    -- INT 85% | Physical
    sets.ws["Shattersoul"] = physical_int_ws

    -- STR 30% INT 30% | Magical
    sets.ws["Cataclysm"] = {
		head="Pixie hairpin +1",
		neck="Sorcerer's stole +1",
		ear1="Regal earring",
		ear2="Malignance earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		---ring1="Archon ring",
		ring2="Freke ring",
		back=Cape.WSD,
		---waist="Orpheus's sash",
		legs="Archmage's tonban +3",
		feet="Nyame Sollerets"
		}

    -- INT 80%  | Magical
    sets.ws["Vidohunir"] = dark_magic_int_ws

    -- MAX MP
    sets.ws["Myrkr"] = {
		ammo="Hydrocera",
		head="Amalric Coif +1",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		neck="Sanctity necklace",
		body="Spaekona's coat +2",
		hands="Spaekona's gloves +3",
		ring1="Mephitas's ring +1",
		ring2="Metamorph ring +1",
		back=Cape.Death,
		waist="Luminary sash",
		legs="Spaekona's tonban +2",
		feet="Spaekona's sabots +2"
    }

    coroutine.schedule(lockstyle,8)

end

ElementalDebuffs = S{"Burn", "Frost", "Choke", "Rasp", "Shock", "Drown"}
AncientMagic = S{"Flare", "Flare II", "Freeze", "Freeze II", "Tornado", "Tornado II", "Quake", "Quake II", "Burst", "Burst II", "Flood", "Flood II"}

---- .::Precast Functions::. ---->
function precast(spell)
    -- print_set(spell)
    if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif spell.action_type == 'Magic' then
        -- Everything that have a specific name set -- 
        if sets.precast[spell.english] then
            equip(sets.precast[spell.english]) 
        -- Healing Magic --
        elseif string.find(spell.english, 'Cure') or string.find(spell.english, 'Cura') then
            equip(sets.precast.fc.cure)
        -- Enhancing Magic --  
        elseif spell.skill == 'Enhancing Magic' then
            equip(sets.precast.fc.enhancing)
        -- Elemental Magic --  
        elseif spell.skill == 'Elemental Magic' then
            equip(sets.precast.fc.elemental)
        else
            equip(sets.precast.fc)
        end
    -- Job Abilities --
    elseif spell.type == 'JobAbility' then
        if sets.precast.ja[spell.english] then
            equip(sets.precast.ja[spell.english])  
        end
    -- Weaponskills --
    elseif spell.type == 'WeaponSkill' then
        if sets.ws[spell.english] then 
            equip(sets.ws[spell.english])
        else
            equip(sets.ws)
        end
    end    
end

---- .::Midcast Functions::. ---->
function midcast(spell)
    -- print_set(spell.target)
    if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
    elseif spell.action_type == 'Magic' then
        -- Healing Magic --
        if string.find(spell.english, 'Cure') or string.find(spell.english, 'Cura') or string.find(spell.english, "Curaga") then
            equip(sets.midcast.cure)
        -- Enhancing Magic --
        elseif spell.skill == 'Enhancing Magic' then
            if string.find(spell.english, 'Regen') then
                equip(sets.midcast.regen)
            elseif spell.english == 'Phalanx' then
				equip(sets.midcast.phalanx)
			else	
                equip(sets.midcast.enhancing_magic)   
            end    
        -- Enfeebling Magic --         
        elseif spell.skill == 'Enfeebling Magic' then
            equip(sets.midcast.enfeebling) 
        elseif string.find(spell.english, 'Aspir') then
            equip(sets.midcast.aspir)
        elseif string.find(spell.english, 'Drain') then
            equip(sets.midcast.drain)
        -- Elemental Magic --      
        elseif spell.skill == 'Elemental Magic' then
            if ElementalDebuffs[spell.english] then
                equip(sets.midcast.elemental.debuff)
            else
                if burstmode then
					if MACCmode then 
						equip(sets.midcast.elemental["MACC Burst"])
						else 
						equip(sets.midcast.elemental["Magic Burst"])
						end
					elseif not burstmode then
						if occultmode then
						equip(sets.midcast.elemental["Occult Acumen"])
						else
						 equip(sets.midcast.elemental["Magic Attack Bonus"])
						end	
				end
                if AncientMagic[spell.english] then
                    equip(sets.midcast.elemental.AncientMagic)
                end
                if player.mp < 400 then
                    equip({body="Spaekona's Coat +2"})
                end
            end
		if (world.day_element == spell.element or world.weather_element == spell.element) and ObiOn then
				equip({waist = "Hachirin-no-Obi"})
			end
		if AFBodyOn then
			equip(sets.midcast.elemental.FreeBurst)
        end
		end
    end
end

function equip_set(status)
    if status == "Engaged" then
        equip(sets.engaged)
    else
        local idleSet = IdleSet[IdleSetIndex]
    -- print(idleSet)
        equip(sets.idle[idleSet])
    end

    local weapon_set_mode = WeaponSet[WeaponSetIndex]
    if weapon_set_mode ~= "Any" then
        equip(sets.WeaponSet[weapon_set_mode])
    end

    if buffactive['Mana Wall'] then
        equip(sets.precast.ja['Mana Wall'])
    end

    if Kiting then
        equip(sets.kiting)
    end

    if EatTp then
        equip({neck='Chrysopoeia torque'})
    end
end

function aftercast(spell)
    --This function performs after the action has taken place
    equip_set(player.status)
end

function status_change(new,old)
    --This will catch when the player engages and disengages
    -- print(new)
    equip_set(new)
end

function buff_change(buff,gain)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") then
        equip_set(player.status)
    end
end

function lockstyle()
    if player.main_job == 'BLM' then send_command('@input /lockstyleset 23') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,8)
end