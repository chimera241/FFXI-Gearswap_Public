NukeTypeIndex = 1
NukeSet = {"Magic Attack Bonus","Magic Burst", "Vagary Low Dmg", "Vagary"}

IdleSetIndex = 1
IdleSet = {"Refresh", "DT"}

EngagedSetIndex = 1
EngagedSet = {"None", "Accuracy"}

RegenSetIndex = 1
RegenSet = {"Potency", "Duration"}

WeaponSetIndex = 1
WeaponSet = {"None", "Grioavolr", "Akademos", "Gada"}

Kiting = false

send_command('bind f9 gs c CycleNukeSet')
send_command('bind ^f9 gs c CycleWeaponSet')
send_command('bind f10 gs c CycleRegenSet')
send_command('bind f11 gs c CycleIdleSet')
send_command('bind ^f11 gs c CycleEngagedSet')
send_command('bind f12 gs c RefreshSet')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind ^f11')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function self_command(command)
    -- print(command)
    if command == 'CycleNukeSet' then
        NukeTypeIndex = NukeTypeIndex % #NukeSet + 1

        local nuke_set = NukeSet[NukeTypeIndex]
        add_to_chat(122, 'Nuke Set: ' .. nuke_set)
    elseif command == "CycleWeaponSet" then
        WeaponSetIndex = WeaponSetIndex % #WeaponSet + 1
        local weapon_set = WeaponSet[WeaponSetIndex]

        equip_set(player.status)
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
    end
end

function get_sets()

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------
    idle_cape = { name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
    nuke_cape = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	MFeet_Drain = { name="Merlinic Crackows", augments={'Mag. Acc.+23','"Drain" and "Aspir" potency +7','CHR+2',}}
	MFeet_MB = { name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+9%','INT+5','Mag. Acc.+3','"Mag.Atk.Bns."+6',}}
    fc_cape = idle_cape
    int_enfeeble_cape = nuke_cape
    mnd_enfeeble_cape = healing_cape

    sets.WeaponSet = {}
    sets.WeaponSet["None"] = {}
    sets.WeaponSet["Akademos"] = {main="Akademos", sub="Enki strap"}
    sets.WeaponSet["Grioavolr"] = {main="Grioavolr", sub="Enki strap"}
    sets.WeaponSet["Gada"] = {main="Gada", sub="Ammurapi shield"}

    sets.idle = {}
	
	sets.idle["DT"] = {
		main="Malignance Pole",
		sub="Kaja Grip",
		ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        neck="Loricate Torque +1",
        ear1="Etiolation earring",
        ear2="Odnowa earring +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Shneddick ring",
		ring2="Defending Ring",
        back=idle_cape,
        waist="Flume Belt",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }
	
    sets.idle["Refresh"] = set_combine(sets.idle["DT"], {
		main="Mpaca's Staff",
		ammo="Homiliary",
		head="Befouled Crown",
		neck="Sibyl Scarf",
		body="Jhakri Robe +2",
        ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Fucho-no-obi",
        legs="Assiduity pants +1",
		feet="Chironic Slippers"
	})
	
	sets.idle["Kiting"] = set_combine(sets.idle["Refresh"], {
		ring1="Shneddick Ring"
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
        ear1="",
        ear2="Dignitary's earring",
        body="Jhakri robe +2",
        hands="Jhakri cuffs +2",
        waist="Eschan stone",
        legs="Jhakri slops +2",
        feet="Jhakri pigaches +2"
    }

    ------------
    -- Buff Sets
    ------------	
    -- Gear that needs to be worn to **actively** enhance a current player buff.
    -- Fill up following with your avaible pieces.
    sets.buff = {}
    sets.buff['Rapture'] = {head="Arbatel bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}	
    -- Ebulience set empy now as we get better damage out of a good Merlinic head
    sets.buff['Ebullience'] = {} -- I left it there still if it becomes needed so the SCH.lua file won't need modification should you want to use this set


    -- When spell school is aligned with grimoire, swap relevent pieces -- Can also use Arbatel +1 set here if you value 1% quickcast procs per piece. (2+ pieces)  
    -- Dont set_combine here, as this is the last step of the precast, it will have sorted all the needed pieces already based on type of spell.
    -- Then only swap in what under this set after everything else. 
    sets.buff.grimoire = {
		head="Peda. M.board +3",
		feet="Academic's loafers +3",
    }
    sets.precast = {}
    --37% fc
    sets.precast.fc = {
        ammo="Incantor stone", --fast cast 2%
        head="Pedagogy Mortarboard +3", --fast cast 13%
        neck="Voltsurge Torque", --fast cast 4%
        ear1="Loquacious Earring", --fast cast 2%
        ear2="Malignance earring", --fast cast 4%
        body="Merlinic Jubbah", --fast cast 6%
        hands="Academic's bracers +3", --fast cast 9%
        ring1="Kishar ring", --fast cast 4%
        ring2="Prolix Ring", --fast cast 5%
        back=idle_cape, --fast cast 10%
        waist="Embla Sash", --fast cast 2%
        legs="Artsieq Hose", --fast cast 5%
        feet="Academic's Loafers +3" --fast cast 5%
    }

    sets.precast["Stoneskin"] = set_combine(sets.precast.fc, {
        head=""
    })

    sets.precast.fc.elemental = set_combine(sets.precast.fc, {
        legs="",
        left_ring="",
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
        main="Tupsimati",
		sub="Enki Strap",
		ammo="Pemphredo tathlum",
        head="Peda. M.board +3",
        neck="Sanctity Necklace",
        ear1="Barkarole earring",
        ear2="Malignance earring",
        body="Jhakri robe +2",
        hands="Amalric gages +1",
        left_ring="Freke Ring",
        right_ring="Shiva Ring +1",
        back=nuke_cape,
        waist="Eschan stone",
        legs="Amalric Slops +1",
        feet="Amalric Nails +1",
    }
	
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental["Magic Attack Bonus"], { --MBD 49, MBDII 11, MAB 287, MACC 190
		main="Bunzi's Rod", --MBD 10, MAB35, MACC 40 + Augs
		sub="Ammurapi Shield", --MAB 38, MACC 38
		head="Merlinic Hood", --MDB 9, MAB 39, MACC 12
        neck="Argute Stole +1", --MBD 7
		body="Merlinic Jubbah", --MBD 9, MAB 48, MACC 20
		hands="Amalric Gages +1", --MBDII 6, MAB33
		legs="Merlinic Shalwar", -- MBD 9, MAB 42, MACC 35
        feet=MFeet_MB, --MBD, MAB 52, MACC 20
        waist="Luminary Sash", --MACC 10
        left_ring="Mujin band", --MBDII 5
        right_ring="Locus ring", --MBD 5
    })
	
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.helix = set_combine(sets.midcast.elemental["Magic Burst"], {
        -- Amalric Nails +1 are beating Arbatel Loafers +1 for Helix atm, YMMV
        head="Agwu's Cap",	
        body="Agwu's Robe",	
		ear1="Crematio Earring",
		ear2="Malignance Earring",
		ring2="Metamorph Ring +1",
        waist="Acuity Belt +1",
        legs="Agwu's Slops",
		feet="Amalric Nails +1"
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
        sub="Enki Strap",
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

    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.dark_helix = set_combine(sets.midcast.helix, {
		head="Pixie Hairpin +1"
    })
    

    sets.midcast.enfeebling = set_combine(sets.precast.fc, {
        ammo="Hydrocera",
        head="Academic's Mortar. +2",
        neck="Argute Stole +1",
        ear1="Gwati Earring",
        ear2="Malignance earring",
		body="Acad. Gown +3",
        hands="Regal Cuffs",
        ring1="Kishar Ring",
        ring2="Stikini Ring +1",
        waist="Luminary sash",
        legs="Chironic Hose",
        feet="Academic's Loafers +3",
        back=nuke_cape
    })

    sets.midcast.int_enfeebling = set_combine(sets.midcast.enfeebling, {
        back =nuke_cape
    })

    sets.midcast.mnd_enfeebling = set_combine(sets.midcast.enfeebling, {
        back =idle_cape
    })

    sets.midcast.cure = set_combine(sets.precast.fc, { --74 Cure Pot, 34 Con MP, 4% Cure Pot II
        main="Chatoyant Staff", --10% Cure Pot
		sub="Enki Strap",
		ammo="Pemphredo Tathlum", -- 4 Con MP
        head="Vanya Hood", --10 Cure Pot, 6 Con MP
		neck="Nodens Gorget", --5% Cure Pot
        body="Kaykaus Bliaut +1",
		ear1="Mendi. earring", 	--5% Cure Pot, 2 Con MP, 2% Cure Casting
        hands="Kaykaus Cuffs +1", --11%, 7 Con MP
        back="Fi Follet Cape +1", --5 Con MP
		waist="Luminary Sash", -- 4 Con MP
        ring1="Stikini Ring +1", --8 Healing Magic
		ring2="Mephitas's ring", --3% Cure Pot, -5 Emnity
        legs="Kaykaus Tights +1", --17% Cure Pot, 7% Cure Casting, -7 Emnity
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
		head="Arbatel Bonnet +1",
		body="Telchine Chas.",
        back=idle_cape
    })

    sets.midcast.regen["Duration"] = sets.midcast.enhancement_duration

    sets.midcast.drain_aspir = set_combine(sets.precast.fc, {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
		legs="Chironic Hose",
        feet=MFeet_Drain,
        ring1="Stikini Ring +1",
		ring2="Evanescence Ring",
		ear1="Hirudinea Earring",
		ear2="Malignance earring",
        waist="Fucho-no-obi"
    })

    sets.midcast.healing = set_combine(sets.precast.fc, {
    })

	sets.midcast.cursna = set_combine(sets.midcast.cure, {
		body="Peda. Gown +3",
		neck="Malison Medallion",
		ring1="Menelaus's Ring",
		ring2="Haoma's Ring",
		feet="Vanya Clogs"
	})

    sets.midcast.enhancing = set_combine(sets.midcast.enhancement_duration, {
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1"
    })

    sets.midcast.storm = set_combine(sets.midcast.enhancement_duration,{
		feet="Pedagogy loafers +1",
    })

    sets.midcast.refresh = set_combine(sets.midcast.enhancement_duration,{
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

    sets.ws = {}
    sets.ws["Shattersoul"] = {}
    sets.ws["Myrkr"] = {
        ammo="Hydrocera",
        head="Peda. M.Board +3",
		body="Acad. Gown +3",
        ear1="Loquacious earring",
        ear2="Etiolation earring",
        neck="Sanctity necklace",
        body="Pedagogy gown",
        hands="Kaykaus cuffs",
        ring1="Prolix ring",
        ring2="",
        waist="Luminary sash",
        legs="Amalric Slops +1",
        feet="Arbatel Loafers +1"
    }

end

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
        if buffactive['addendum: black'] or buffactive['dark arts'] then
            if spell.type == 'BlackMagic' then
                equip(sets.buff.grimoire)
            end
        elseif buffactive['addendum: white'] or buffactive['light arts'] then
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
            elseif spellType == "Refresh" then
                equip(sets.midcast.refresh)
            elseif spell.name == "Aquaveil" then
                equip(sets.midcast.aquaveil)
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
            if spellType == 'DarkHelix' then
                equip(sets.midcast.dark_helix)
            elseif spellType == 'Helix' then
                equip(sets.midcast.helix)
            else
                local nuke_set = NukeSet[NukeTypeIndex]
                if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                    equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Hachirin-no-Obi"}))
                else
                    equip(sets.midcast.elemental[nuke_set])
                end
            end
        elseif sets.midcast[spell.name] then
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
    end
    
    
    local weapon_set = WeaponSet[WeaponSetIndex]
    equip(sets.WeaponSet[weapon_set])


    if Kiting then
        equip(set_combine(set_to_equip, sets.idle["Kiting"]))
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