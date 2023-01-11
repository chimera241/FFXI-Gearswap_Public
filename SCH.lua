NukeTypeIndex = 1
NukeSet = {"Magic Attack Bonus","Magic Burst", "Occult Acumen"} ----, "Vagary Low Dmg", "Vagary"

IdleSetIndex = 1
IdleSet = {"Refresh", "DT"}

EngagedSetIndex = 1
EngagedSet = {"None", "Accuracy"}

RegenSetIndex = 1
RegenSet = {"Potency", "Duration"}

WeaponSetIndex = 1
WeaponSet = {"Any", "Tupsimati", "Mpaca's Staff", "Marin Staff +1"}

burstmode = true

MACCmode = true

occultmode = true

Kiting = false

EatTp = false

AFBodyOn = false

send_command('bind f9 gs c Toggleburstmode')
send_command('bind !f9 gs c Toggleoccultmode')
send_command('bind @f9 gs c ToggleAFBody')
send_command('bind ^f9 gs c CycleWeaponSet')
send_command('bind f10 gs c PrimeStaff')
send_command('bind f11 gs c CycleIdleSet')
send_command('bind ^f11 gs c CycleEngagedSet')
send_command('bind @f11 gs c EatTp')
send_command('bind f12 gs c RefreshSet')
send_command('bind ^k gs c toggle kiting')
send_command('bind !h input /item "Holy Water" <me>')



function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind ^f11')
    send_command('unbind f12')
    send_command('unbind ^k')
    send_command('unbind !h')
end

function help()
	add_to_chat(122, 'Keyboard Bindings:')
	add_to_chat(122, 'F9: Burst Mode Toggle - default on')
	add_to_chat(122, 'Ctrl + F9: Cycle Weapon (Any > Mpacas Staff > Marin Staff +1)')
	add_to_chat(122, 'Alt + F9: Occult Acumen Mode - Default on')
	add_to_chat(122, 'Win + F9: Lock AF Body and Burst set for all nukes - default off')
	add_to_chat(122, 'F10: Lock Prime Weapon - Wakey Wakey')
    add_to_chat(122, 'F11: Cycle Idle Sets (Refresh > DT )')
    add_to_chat(122, 'Ctrl + F11: Cycle Engaged Sets (Accuracy > Default)')
    add_to_chat(122, 'Win + F11: Eat TP Mode')
    ---add_to_chat(122, 'Ctrl + F11: Toggle Obi - Not functioning until I rebuy my OShash!')
    add_to_chat(122, 'Ctrl + k: Toggle kiting')
end

help()

function self_command(command)
    -- print(command)
	if command == 'CycleNukeSet' then
		NukeTypeIndex = NukeTypeIndex % #NukeSet + 1
		
		local nuke_set = NukeSet[NukeTypeIndex]
		add_to_chat(122, 'Nuke Set: ' .. nuke_set)
	elseif command == "CycleWeaponSet" then
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
        equip_set(player.status)
    elseif command == 'CycleEngagedSet' then
        EngagedSetIndex = EngagedSetIndex % #EngagedSet + 1

        local engaged_set = EngagedSet[EngagedSetIndex]
        add_to_chat(122, 'Engaged Set: ' .. engaged_set)
        equip_set(player.status)
    elseif command == 'CycleRegenSet' then
        RegenSetIndex = RegenSetIndex % #RegenSet + 1

        local regen_set = RegenSet[RegenSetIndex]
        add_to_chat(122, 'Regen Set: ' .. regen_set)
    elseif command == 'RefreshSet' then

        local nuke_set = NukeSet[NukeTypeIndex]
        local idle_set = IdleSet[IdleSetIndex]
        local regen_set = RegenSet[RegenSetIndex]
        local weapon_set = WeaponSet[WeaponSetIndex]

        equip_set(player.status)
        add_to_chat(122, 'Nuke Set: ' .. nuke_set .. ' || Idle Set: ' .. idle_set .. ' || Regen Set: ' .. regen_set .. ' || Weapon Set: ' .. weapon_set)
        lockstyle()
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
    elseif command == 'PrimeStaff' then
        PrimeStaff = not PrimeStaff
        if PrimeStaff then
            enable('main', 'sub')		
            send_command('@input /echo ----- Prime Staff Equipped -----')
        else
			send_command('@input /echo ----- Prime Staff Unequipped -----')		
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

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    idle_cape = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
    nuke_cape = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}	
	fc_cape = idle_cape
    chir_macc = { name="Chironic Hose", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Drain" and "Aspir" potency +6','CHR+3','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
	chir_phalanx = { name="Chironic Hose", augments={'CHR+10','Pet: INT+3','Phalanx +3','Accuracy+16 Attack+16',}}
    int_enfeeble_cape = nuke_cape
    mnd_enfeeble_cape = healing_cape
	
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
    sets.WeaponSet["Any"] = {}
    sets.WeaponSet["Tupsimati"] = {main="Tupsimati", sub="Khonsu"}
    sets.WeaponSet["Mpaca's Staff"] = {main="Mpaca's Staff", sub="Khonsu"}
    sets.WeaponSet["Marin Staff +1"] = {main="Marin Staff +1", sub="Khonsu"}

    sets.idle = {}
	
	sets.idle["DT"] = { --50% DT, 7 Refresh
		main="Mpaca's Staff", --2 Refresh
		sub="Khonsu", --6% DT
		ammo="Homiliary", --1 Refresh
		head="Arbatel Bonnet +2", --9% DT, 126 MEVA
		neck="Sibyl Scarf", --1 Refresh
		ear1="Etiolation earring",
		ear2="Odnowa earring +1",
		body="Shamash Robe", --3 Refresh
		hands="Nyame Gauntlets", --7% DT, 112 MEVA
		ring1="Stikini Ring +1",
		ring2="Defending Ring", --10% DT
		back=idle_cape,
		waist="Flume Belt",
		legs="Arbatel Pants +2", --11%DT, 158 MEVA
		feet="Nyame Sollerets" --7% DT 150 MEVA
    }
	
    sets.idle["Refresh"] = set_combine(sets.idle["DT"], { --14 Refresh
		ammo="Homiliary", --1 Refresh
		head="Befouled Crown", --1 Refresh
		neck="Sibyl Scarf", --1 Refresh
		body="Arbatel Gown +3", --4 Refresh
		hands="Volte Gloves", --1 Refresh
		ring1="Stikini Ring +1", --1 Refresh
		ring2="Stikini Ring +1", --1 Refresh
		waist="Fucho-no-obi", -- 1 Refresh (below 50%)
		legs=Mlegs.Refresh, --2 Refresh
		feet="Chironic Slippers" --2 Refresh
	})
	
	sets.idle["Kiting"] = set_combine(idle_set, {
		ring1="Shneddick Ring +1"
	})

    sets.ja = {}
    sets.ja['Tabula Rasa'] = { legs="Pedagogy Pants +2" }
    sets.ja['Enlightenment'] = {body="Pedagogy Gown +3"}
    sets.ja['Sublimation'] = {head="Academic mortarboard +2", body="Pedagogy gown +3"}
    -- sets.precast.ja['Altruism'] = {}
    sets.ja['Focalization'] = {head="Pedagogy Mortarboard +3"}

    sets.engaged = {}
    sets.engaged["Accuracy"] = {
        head="Jhakri coronal +2",
        neck="Sanctity necklace",
        ear1="Crepuscular Earring",
        ear2="Dignitary's earring",
        body="Nyame Mail",
        hands="Gazu Bracelets +1",
        ring1="Chirich Ring +1",
        ring2="Chirich Ring +1",
        waist="Eschan stone",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    ------------
    -- Buff Sets
    ------------	
    -- Gear that needs to be worn to **actively** enhance a current player buff.
    -- Fill up following with your avaible pieces.
    sets.buff = {}
    sets.buff['Rapture'] = {head="Arbatel bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {legs="Arbatel Pants +3"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +3"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}	
    -- Ebulience set empy now as we get better damage out of a good Merlinic head
    sets.buff['Ebullience'] = {head="Arbatel bonnet +3"} 

    -- When spell school is aligned with grimoire, swap relevent pieces -- Can also use Arbatel +1 set here if you value 1% quickcast procs per piece. (2+ pieces)  
    -- Dont set_combine here, as this is the last step of the precast, it will have sorted all the needed pieces already based on type of spell.
    -- Then only swap in what under this set after everything else. 
    sets.buff.grimoire = {
		head="Peda. M.board +3",
		feet="Academic's loafers +3",
    }
    sets.precast = {}
    sets.precast.fc = {    --88% fc
		main="Musa", --9% FC
		sub="Khonsu", --4% Haste
		ammo="Incantor stone", --fast cast 2%
		head="Amalric Coif +1", --fast cast 13%
		neck="Voltsurge Torque", --fast cast 4%
		ear1="Loquacious Earring", --fast cast 2%
		ear2="Malignance earring", --fast cast 4%
		body="Agwu's robe", --fast cast 8%
		hands="Academic's bracers +3", --fast cast 9%
		ring1="Kishar ring", --fast cast 4%
		ring2="Prolix Ring", --fast cast 5%
		back=idle_cape, --fast cast 10%
		waist="Embla Sash", --fast cast 2%
		legs="Agwu's Slops", --fast cast 7%
		feet=Mfeet.FC --fast cast 12%
    }

    sets.precast['Impact'] = set_combine(sets.precast.fc, {
        head=empty,
        body='Twilight cloak'
    })

    sets.precast["Stoneskin"] = set_combine(sets.precast.fc, {
        head=""
    })

    sets.precast.fc.elemental = set_combine(sets.precast.fc, {
        left_ear="Barkarole earring"
    })

    sets.precast.fc.enhancing = set_combine(sets.precast.fc, {})
    
    sets.precast.fc.cure = set_combine(sets.precast.fc, {
        back="Pahtli cape" -- cure spellcasting time -8%
    })

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast = {}

    sets.midcast.conserve_mp = {
		ammo="Pemphredo tathlum",
		head="Vanya hood",
		hands="Academic's bracers +3",
		waist="Austerity belt",
		feet="Medium's sabots"
    }
		
    sets.midcast.elemental = {}
    sets.midcast.elemental["Magic Attack Bonus"] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Pemphredo tathlum",
		head="Peda. M.board +3",
		neck="Sanctity Necklace",
		ear1="Barkarole earring",
		ear2="Malignance earring",
		body="Arbatel Gown +3",
		hands="Agwu's Gages",
		left_ring="Metamorph Ring +1",
		right_ring="Freke Ring",
		back=nuke_cape,
		waist="Acuity Belt +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
    }

    sets.midcast.elemental["Occult Acumen"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], { --50 Tp/MP Base
		ammo="Seraphic Ampulla", --7 Occult
		head="Mallquis Chapeau +2", --11 Occult
		neck="Combatant's torque",
		ear1="Dedition earring",
		ear2="Crepuscular earring", --5 Store TP
		body="Spaekona's Coat +2",
		hands=Mhands.occult, --10
		ring1="Chirich Ring +1", --6 Store TP
		ring2="Crepuscular Ring", --6 Store TP
		back=magic_atk_cape,
		waist="Oneiros rope",  --20 TP/MP
		legs="Perdition slops", --30 Occult
		feet=Mfeet.occult, --11 Occult -----139 TP/100 MP
		})	
		
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], { --MBD 49, MBDII 11, MAB 287, MACC 190
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		head="Agwu's Cap", --MDBII 4, MAB 49, MACC 37, MB Acc +15 Int 39
        neck="Argute Stole +2",
		ear1="Regal Earring",
		ear2="Malignance earring",
		body="Arbatel Gown +3", --MBD 10, MAB 35, MACC 40, Int 47 + Aug --priority 2
		hands="Agwu's Gages", --MBD 8, MAB43, MACC 40 Int 33, MABII 2-5 (Aug) --priority 1
        left_ring="Freke Ring",
        right_ring="Metamorph Ring +1", --16 Int, 11-16 MACC
		back=nuke_cape,
        waist="Acuity Belt +1", --MACC 15, INT 16		
		legs="Agwu's Slops", -- MBD 9, MAB 35, MACC 40, Int 49 + Aug
        feet="Arbatel Loafers +3" -- MBDII 5, MAB 50, MACC 60, Int 34, Klimaform +25, Elemental Skill +33
    })

    sets.midcast.elemental["MACC Burst"] = set_combine(sets.midcast.elemental["Magic Burst"], { --42 MBD, 18 MBDII
    })
	
	sets.midcast.elemental.FreeBurst = set_combine(sets.midcast.elemental["Magic Burst"], {
		body="Sedir Coteharde"
	})
	
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.helix = set_combine(sets.midcast.elemental["Magic Burst"], {
		main="Bunzi's Rod",
		sub="Culminus",    
        neck="Argute Stole +1",  
		body="Agwu's Robe",	
		ear1="Crematio Earring",
		ear2="Malignance Earring",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3"
    })	
	
    sets.midcast.elemental["Vagary Low Dmg"] = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','VIT+5','Mag. Acc.+3','"Mag.Atk.Bns."+4','DMG:+7',}},
		ammo="Incantor Stone",
		head="Acad. Mortar. +2",
		body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		hands="Amalric Gages +1",
		legs="Acad. Pants +2",
		feet="Acad. Loafers +3",
		neck="Twilight Torque",
		waist="Luminary Sash",
		left_ear="Loquac. Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Prolix Ring",
		back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-6%',}}
	}
	
    sets.midcast.elemental["Vagary"] = {
		main="Tupsimati",
		sub="Khonsu",
		ammo="Incantor Stone",
		head="Peda. M.board +3",
		neck="Voltsurge Torque",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		body="Pedagogy Gown +3",
		hands="Amalric gages +1",		
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back=idle_cape,
		waist="Eschan stone",
		legs="Telchine Braconi",
		feet=MFeet_Drain
    }
    
    sets.midcast.enfeebling = set_combine(sets.precast.fc, {
		main="Contemplator +1", 
		sub="Khonsu",
		ammo="Hydrocera",
		head="Academic's Mortar. +2",
		neck="Argute Stole +1",
		ear1="Gwati Earring",
		ear2="Malignance earring",
		body="Acad. Gown +3",
		hands="Regal Cuffs",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
		back=nuke_cape,
		waist="Obstinate Sash",
		legs="Arbatel Pants +3",
		feet="Academic's Loafers +3"
    })

    sets.midcast.int_enfeebling = set_combine(sets.midcast.enfeebling, {
		back=nuke_cape
    })

    sets.midcast.mnd_enfeebling = set_combine(sets.midcast.enfeebling, {
		back=idle_cape
    })
	
    sets.midcast['Impact'] = set_combine(sets.midcast.enfeebling, {
		head=empty,
		body="Twilight cloak",
		hands="Academic's Bracers +3",
		ring1="Stikini Ring +1",
		feet="Arbatel Loafers +3"
	})
	
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.dark_helix = set_combine(sets.midcast.helix, {
		head="Pixie Hairpin +1"
	})


    sets.midcast.cure = set_combine(sets.precast.fc, { --74 Cure Pot, 34 Con MP, 4% Cure Pot II
		main="Raetic Rod +1", 
		sub="Genmei Shield",
		ammo="Pemphredo Tathlum", -- 4 Con MP
		head="Vanya Hood", --10 Cure Pot, 6 Con MP
		neck="Nodens Gorget", --5% Cure Pot
		body="Arbatel Gown +3",
		ear1="Mendi. earring", 	--5% Cure Pot, 2 Con MP, 2% Cure Casting
		ear2="Calamitous Earring",
		hands="Kaykaus Cuffs +1", --11%, 7 Con MP
		back="Fi Follet Cape +1", --5 Con MP
		waist="Luminary Sash", -- 4 Con MP
		ring1="Stikini Ring +1", --8 Healing Magic
		ring2="Mephitas's ring", --9 Con MP, 110 HP to MP
		legs="Academic's Pants +2", --17% Cure Pot, 7% Cure Casting, -7 Emnity
		feet="Kaykaus Boots" --15% Cure Pot, 6 Con MP
    })
	
	sets.midcast.cursna = set_combine(sets.midcast.cure, {
		body="Peda. Gown +3",
		neck="Malison Medallion",
		ring1="Menelaus's Ring",
		ring2="Haoma's Ring",
		feet="Vanya Clogs"
	})

    ------------
    -- Enhancing
    ------------

    sets.midcast.enhancement_duration = {
		main="Musa",
		sub="Kaja Grip",
		head="Telchine cap",
		body="Pedagogy Gown +3",
		hands="Telchine Gloves",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
    }

    sets.midcast["Sneak"] = sets.midcast.enhancement_duration
    sets.midcast["Invisible"] = sets.midcast.enhancement_duration

    sets.midcast.regen = {}
    sets.midcast.regen["Potency"] = set_combine(sets.midcast.enhancement_duration, {
		head="Arbatel Bonnet +3",
		body="Telchine Chas.",
		back=idle_cape
    })

    sets.midcast.regen["Duration"] = sets.midcast.enhancement_duration

    sets.midcast.drain_aspir = set_combine(sets.precast.fc, {
		head="Pixie Hairpin +1",
		neck="Erra pendant",
		ear1="Hirudinea Earring",
		ear2="Malignance earring",
		ring1="Stikini Ring +1",
		ring2="Evanescence Ring",
		waist="Fucho-no-obi",
		legs="Chironic Hose",
		feet=MFeet_Drain
    })

    sets.midcast.healing = set_combine(sets.precast.fc, {
    })

    sets.midcast.enhancing = set_combine(sets.midcast.enhancement_duration, {
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1"
    })

    sets.midcast.storm = set_combine(sets.midcast.enhancement_duration,{
		feet="Pedagogy loafers +1",
    })

    sets.midcast.refresh = set_combine(sets.midcast.enhancement_duration,{
		main="Musa",
		head="Amalric Coif +1"
    })

    sets.midcast.aquaveil = set_combine(sets.midcast.enhancement_duration, {
		head="Amalric Coif +1",
		neck="Loricate Torque +1",
		hands="Regal Cuffs"
	})
	
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancement_duration, {
		neck="Nodens Gorget",
		waist="Siegel Sash"
	})	
	
    sets.midcast.phalanx = set_combine(sets.midcast.enhancement_duration, {
		head=Mhead.Phalanx,
		body=Mbody.Phalanx,
		hands=Mhands.Phalanx,
		waist="Siegel Sash",
		legs=Mlegs.Phalanx,
		feet=Mfeet.Phalanx
	})	
	
    sets.ws = {}
    sets.ws["Shattersoul"] = {}
	
    sets.ws["Myrkr"] = {
        ammo="Hydrocera",
        head="Amalric Coif +1",
        neck="Sanctity necklace",
        ear1="Etiolation earring",
        ear2="Moonlight earring",
		body="Acad. Gown +3",
        hands="Kaykaus cuffs",
        ring1="Prolix ring",
        ring2="Mephitas's Ring +1",
        waist="Luminary sash",
        legs="Amalric Slops +1",
        feet="Arbatel Loafers +3"
    }
	
    sets.ws["Cataclysm"] = {
        ammo="Hydrocera",
        head="Pixie Hairpin +1",
        neck="Argute Stole +1",
        ear1="Regal earring",
        ear2="Malignance earring",
		body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Archon ring",
        ring2="Epaminondas's Ring",
		back=nuke_cape,
        waist="Hachirin-no-Obi",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

end

	sets.utility = {}
	sets.utility.doom = {
		neck="Nicander's Necklace",
		ring1="Purity Ring",
		waist="Gishbubar Sash"
	}

-------------------------------------------------------------------------------------------------------------------
-- Spell mappings allow defining a general category or description that each of sets of related
-- spells all fall under.
-------------------------------------------------------------------------------------------------------------------

spell_maps = {
    ['Cure']='Cure',['Cure II']='Cure',['Cure III']='Cure',['Cure IV']='Cure',['Cure V']='Cure',['Cure VI']='Cure',
    ['Full Cure']='Cure',
    ['Cura']='Curaga',['Cura II']='Curaga',['Cura III']='Curaga',
    ['Curaga']='Curaga',['Curaga II']='Curaga',['Curaga III']='Curaga',['Curaga IV']='Curaga',['Curaga V']='Curaga',
    -- Status Removal doesn't include Esuna or Sacrifice, since they work differently than the rest
    ['Poisona']='StatusRemoval',['Paralyna']='StatusRemoval',['Silena']='StatusRemoval',['Blindna']='StatusRemoval',['Cursna']='StatusRemoval',
    ['Stona']='StatusRemoval',['Viruna']='StatusRemoval',['Erase']='StatusRemoval',   
	['Cursna']='Cursna',
    ['Regen']='Regen',['Regen II']='Regen',['Regen III']='Regen',['Regen IV']='Regen',['Regen V']='Regen',
    ['Refresh']='Refresh',['Refresh II']='Refresh',['Refresh III']='Refresh',
    ['Burn']='ElementalEnfeeble',['Frost']='ElementalEnfeeble',['Choke']='ElementalEnfeeble',['Rasp']='ElementalEnfeeble',['Shock']='ElementalEnfeeble',['Drown']='ElementalEnfeeble',
    ['Pyrohelix']='Helix',['Cryohelix']='Helix',['Anemohelix']='Helix',['Geohelix']='Helix',['Ionohelix']='Helix',['Hydrohelix']='Helix',['Luminohelix']='Helix',['Noctohelix']='DarkHelix',
    ['Pyrohelix II']='Helix',['Cryohelix II']='Helix',['Anemohelix II']='Helix',['Geohelix II']='Helix',['Ionohelix II']='Helix',['Hydrohelix II']='Helix',['Luminohelix II']='Helix',['Noctohelix II']='DarkHelix',
    ['Firestorm']='Storm',['Hailstorm']='Storm',['Windstorm']='Storm',['Sandstorm']='Storm',['Thunderstorm']='Storm',['Rainstorm']='Storm',['Aurorastorm']='Storm',['Voidstorm']='Storm',
    ['Firestorm II']='Storm',['Hailstorm II']='Storm',['Windstorm II']='Storm',['Sandstorm II']='Storm',['Thunderstorm II']='Storm',['Rainstorm II']='Storm',['Aurorastorm II']='Storm',['Voidstorm II']='Storm',
}

---- .::Precast Functions::. ---->


function precast(spell)
    -- print_set(spell)
    local spellType = spell_maps[spell.name]
    if sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif spell.action_type == 'Magic' then
        if spellType == "Cure" or spellType == "Curaga" then
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

        -- extends Fast cast set with Grimoire recast aligned 
        if buffactive['addendum: black'] or buffactive['Dark Arts'] then
            if spell.type == 'BlackMagic' then
                equip(sets.buff.grimoire)
            end
        elseif buffactive['addendum: white'] or buffactive['Light Arts'] then
            if spell.type == 'WhiteMagic' then
                equip(sets.buff.grimoire)
            end
        end

    -- Job Abilities --
    elseif spell.type == 'JobAbility' then
        if sets.ja[spell.english] then
            equip(sets.ja[spell.english])  
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
    -- print_set(spell)
    local spellType = spell_maps[spell.name]
    if spell.action_type == 'Magic' then   
        -- Healing Magic --
        if spell.skill == 'Healing Magic' then 
			if spellType == "Cure" or spellType == "Curaga" then
				if (world.day_element == spell.element or world.weather_element == spell.element) or buffactive["Aurorastorm II"] then
					equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})
				else 
					equip(sets.midcast.cure)
				end
			elseif spell.skill == 'Healing Magic' and spell.name == "Cursna" then
				equip(sets.midcast.cursna)
			end
        -- Enhancing Magic --
		elseif spell.skill == 'Enhancing Magic' then
			if spellType == "Regen" then
				local regenMode = RegenSet[RegenSetIndex]
				equip(sets.midcast.regen[regenMode])
			elseif spellType == "Storm" then
				equip(sets.midcast.storm)
			elseif sets.midcast[spell.english] then
				equip(sets.midcast[spell.english])			
			elseif spellType == "Refresh" then
				equip(sets.midcast.Refresh)
			elseif spell.name == "Aquaveil" then
				equip(sets.midcast.aquaveil)
			elseif spell.name == "Stoneskin" then
				equip(sets.midcast.stoneskin)
			elseif spell.name == "Phalanx" then
				equip(sets.midcast.phalanx)
			else
				equip(sets.midcast.enhancing)   
			end    
        -- Enfeebling Magic --         
        elseif spell.skill == 'Enfeebling Magic' and spell.type == 'BlackMagic' then -- to do: better rule for this.
            equip(sets.midcast.IntEnfeebling)
        elseif spell.skill == 'Enfeebling Magic' and spell.type == 'WhiteMagic' then -- to do: better rule for this.
            equip(sets.midcast.MndEnfeebling)
		elseif string.find(spell.english, 'Aspir') or string.find(spell.english, 'Drain') then
            equip(sets.midcast.drain_aspir)
        -- Elemental Magic --      	
        elseif spell.skill == 'Elemental Magic' then
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
			elseif spellType == 'Helix' then
				if spell.english == 'Dark Helix' then
					equip(sets.midcast.dark_helix)
					else
					equip(sets.midcast.helix)
					end
				elseif spell.english == 'Impact' then	
					equip(sets.midcast['Impact'])
					end
				end

			if (world.day_element == spell.element or world.weather_element == spell.element) and ObiOn then
					equip({waist = "Hachirin-no-Obi"})
				end
			if AFBodyOn then
				equip(sets.midcast.elemental.FreeBurst)
				end
			
		if sets.midcast[spell.name] then
            equip(sets.midcast[spell.name])
        end
        if buffactive['Perpetuance'] and (spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic') then
            equip(sets.buff['Perpetuance'])
        end
        if buffactive['Rapture'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Rapture'])
        end
        if spell.skill == 'Elemental Magic' and spellType ~= 'ElementalEnfeeble' then
            if buffactive['Ebullience'] and spell.english ~= 'Impact' then
                equip(sets.buff['Ebullience'])
            end
            if buffactive['Immanence'] then
                equip(sets.buff['Immanence'])
            end
            if buffactive['Klimaform'] and spell.element == world.weather_element then
                equip(sets.buff['Klimaform'])
            end
        end
		
        if buffactive['Penury'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Penury']) 
        end
        if buffactive['Parsimony'] and spell.type == 'BlackMagic' then
            equip(sets.buff['Parsimony'])
        end
        if buffactive['Celerity'] and spell.type == 'WhiteMagic' then
            equip(sets.buff['Celerity'])
        end
        if buffactive['Alacrity'] and spell.type == 'BlackMagic' then
            equip(sets.buff['Alacrity'])
        end
    end
end

function equip_set(status)
    if status == "Engaged" and EngagedSet[EngagedSetIndex] ~= "None" then
        local engagedSet = EngagedSet[EngagedSetIndex]
        equip(sets.engaged[engagedSet])
    else
        local idleSet = IdleSet[IdleSetIndex]
    -- print(idleSet)
        equip(sets.idle[idleSet])
        lockstyle()			
    end
		
    local weapon_set_mode = WeaponSet[WeaponSetIndex]
    if weapon_set_mode ~= "Any" then
        equip(sets.WeaponSet[weapon_set_mode])
    end
    
    if Kiting then
        equip(set_combine(set_to_equip, sets.idle["Kiting"]))
    end

    if EatTp then
        equip({neck='Chrysopoeia torque'})
    end
	
	if PrimeStaff then	
		equip({main='Opashoro'})
	end
end

function aftercast(spell)
    --This function performs after the action has taken place
    equip_set(player.status)
end

function status_change(new,old)
    --This will catch when the player engages and disengages
    -- print(new)
    equip_set(player.status)
end

function lockstyle()
    if player.main_job == 'SCH' then send_command('@input /lockstyleset 12') end
end