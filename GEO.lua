Nuke_Sets = {"magic-atk-bonus", "magic-accuracy" ,"magic-burst"}
Nuke_Set_Index = 3

Luopan_Idle_On = true

Kiting = false

send_command('bind f9 gs c cycle nuke_sets')
send_command('bind f10 gs c toggle loupon_idle_On')
send_command('bind f12 gs c refresh gear')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function help()
    add_to_chat(122, 'Keyboard Bindings:')
    add_to_chat(122, 'F9: Cycle Nuke Sets')
    add_to_chat(122, 'F10: Toggle Loupon Idle Mode')
    add_to_chat(122, 'F12: Refresh gearset')
    add_to_chat(122, 'Ctrl + k: Toggle kiting')
end

help()

function get_sets()

Cape= {}
	Cape_Idle = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	Cape_Nuke = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	Cape_FC = { name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}

	Mhead = {}
		Mhead.Phalanx = { name="Merlinic Hood", augments={'Attack+11','"Mag.Atk.Bns."+8','Phalanx +4','Accuracy+5 Attack+5',}}
		Mhead.FC = { name="Merlinic Hood", augments={'"Mag.Atk.Bns."+22','"Fast Cast"+7','INT+9',}}
	Mbody = {}	
		Mbody.Phalanx = { name="Merlinic Jubbah", augments={'VIT+8','Accuracy+15','Phalanx +5','Accuracy+13 Attack+13','Mag. Acc.+8 "Mag.Atk.Bns."+8',}}
	Mhands = {}
		Mhands.Phalanx = { name="Merlinic Dastanas", augments={'Pet: Attack+14 Pet: Rng.Atk.+14','Enmity-4','Phalanx +4','Mag. Acc.+8 "Mag.Atk.Bns."+8',}}
		Mhands.Occult = { name="Merlinic Dastanas", augments={'Mag. Acc.+26','"Occult Acumen"+10','CHR+5',}}
		Mhands.Refresh = { name="Merlinic Dastanas", augments={'Accuracy+20','Potency of "Cure" effect received+5%','"Refresh"+2','Accuracy+2 Attack+2',}}	
	Mlegs = {}	
		Mlegs.Refresh = { name="Merlinic Shalwar", augments={'"Fast Cast"+2','Pet: "Dbl. Atk."+1','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
		Mlegs.Phalanx = { name="Merlinic Shalwar", augments={'CHR+9','Phys. dmg. taken -1%','Phalanx +2','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	Mfeet= {}
		Mfeet.FC = { name="Merlinic Crackows", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+7','Mag. Acc.+6','"Mag.Atk.Bns."+8',}}
		Mfeet.Occult = { name="Merlinic Crackows", augments={'Mag. Acc.+17','"Occult Acumen"+11',}}
		Mfeet.Phalanx = { name="Merlinic Crackows", augments={'"Dbl.Atk."+3','INT+8','Phalanx +2',}}

    sets.idle = {
        main="Idris",
        sub="Genmei shield",
        range="Dunna",
        head="Befouled Crown",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Jhakri Robe +2",
        hands=Mhands.Refresh,
        ring1="Shneddick ring +1",
        ring2="Stikini ring +1",
        back=Cape_Idle,
        waist="Fucho-no-obi",
		legs=Mlegs.Refresh,
        feet="Nyame Sollerets"
    }

    sets.idle.luopan = set_combine(sets.idle, { --48 DT (inc D Ring) Need Idris/Dunna/AF Hands to Cap Luopan DT
        main="Idris", --25 Pet DT
        range="Dunna", --5 Pet DT
        head="Azimuth Hood +2", --11 DT, 4 Pet Regen 
		ear1="Odnowa Earring +1", --3 DT
        body="Nyame Mail",	--9 DT	
        hands="Geomancy Mitaines +3", ---13 Pet DT
		back=Cape_Idle, --15 Pet Regen
		legs="Nyame Flanchard", --8
        feet="Bagua Sandals +3" --5 Pet Regen
    })

	sets.engaged = {}
	
	sets.engaged['tp'] = {
		main="Maxentius",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Cessance Earring",
		ear2="Brutal Earring",
		body="Nyame Mail",
		hands="Gazu Bracelets +1",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		back=Cape_WSD,
		waist="Grunfeld Rope",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	sets.ja = {}
    sets.ja['Bolster'] = {body="Bagua tunic +1"}
    sets.ja['Life cycle'] = {body="Geomancy tunic +2", back="Nantosuelta's cape"}
    sets.ja['Full Circle'] = {
        head="Azimuth hood +2",
        hands="Bagua mitaines +1"
    }
    sets.ja['Concentric Pulse'] = { head="Bagua galero +3" }

--- Magic ---

    sets.fc = { --79%
        head=Mhead.FC, ---15%
        neck="Voltsurge torque", --4%
        ear1="Malignance earring", --4%
        ear2="Loquacious Earring", --2%
        body="Agwu's Robe", --8%
		hands="Volte Gloves",
        ring1="Prolix ring", --2%
        ring2="Kishar ring", --4%
        back=Cape_FC, --10%
        waist="Embla Sash", --5%
        legs="Geomancy pants +2", --13%
        feet=Mfeet.FC --12%
    }

    sets.fc.cure = set_combine(sets.fc, {
        sub=""
    })

    sets.fc.elemental_magic = set_combine(sets.fc, {
        hands="Bagua mitaines +1"
    })

    sets.fc["Stoneskin"] = set_combine(sets.fc, {
        head="Umuthi hat"
    })
	
    sets.fc['Impact'] = set_combine(sets.fc, {
        head=empty,
        body='Twilight cloak'
    })
	

    sets.midcast = {}

    sets.midcast.conserve_mp = {
        head="Vanya hood",
        body="Vedic Coat",
        waist="Austerity belt",
        legs="Geomancy pants +2",
        feet="Medium's sabots"
    }

    sets.midcast.geomancy = set_combine(sets.midcast.conserve_mp, {
        main="Idris", 
        range="Dunna",
        neck="Bagua charm +1",
        head="Azimuth hood +2",
        hands="Geomancy mitaines +3",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        back="Lifestream Cape",
        feet="Medium's sabots"
    })

    sets.midcast.geomancy.indi = set_combine(sets.midcast.geomancy, {
        main="Idris",
        range="Dunna",
        head="Azimuth hood +2",
        body="Bagua tunic +1",
        hands="Geomancy mitaines +3",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        back="Lifestream Cape",
        legs="Bagua Pants +1",
        feet="Azimuth gaiters +3"
    })

    sets.midcast.cure = {
		main="Raetic Rod +1", 
		sub="Genmei Shield",
		head="Vanya Hood",
		body="Vanya Robe",
		hands="Telchine Gloves",
		ring1="Stikini ring +1",
		ring2="Lebeche ring",
		back="Fi Follet Cape +1",	
		legs="Vanya Slops",			
		feet="Vanya Clogs"
    }

    sets.midcast.dark_magic = {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
		ear1="Hirudinea Earring",
		ear2="Malignance earring",
		body="Geomancy Tunic +2",
		hands="Geomancy Mitaines +3",
        ring1="Stikini ring +1",
		ring2="Evanescence Ring",
		back=Cape_Nuke,
        waist="Fucho-no-obi",
		legs="Chironic Hose",
        feet="Agwu's Pgiaches"
    }
    
    sets.midcast.drain = sets.midcast.dark_magic

    sets.midcast.aspir = sets.midcast.dark_magic

    sets.midcast.elemental = {}

    sets.midcast.elemental["magic-accuracy"] = {
        main="Bunzi's Rod",
		sub="Ammurapi shield",
        head="Azimuth Hood +2",
        neck="Erra pendant",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Geomancy tunic +2",
        hands="Geomancy mitaines +3",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
        back=Cape_Nuke, 
        waist="Luminary sash",
        legs="Geomancy pants +2",
        feet="Geomancy sandals +3"
		}

    sets.midcast["Stun"] = sets.midcast.elemental["magic-accuracy"]

    sets.midcast.elemental["magic-atk-bonus"] = {
        main="Bunzi's Rod",
		sub="Ammurapi shield",
        head="Agwu's Cap",
        neck="Sanctity necklace",
        ear1="Barkarole earring",
        ear2="Malignance earring",
        body="Agwu's Robe",
        hands="Agwu's Gages",
        ring1="Freke ring",
        ring2="Shiva ring +1",
        back=Cape_Nuke,
        waist="Eschan stone",
        legs="Agwu's Slops",
        feet="Agwu's Pigaches"
		}

    sets.midcast.elemental["magic-burst"] = set_combine(sets.midcast.elemental["magic-atk-bonus"], { --MB47 MBII 27
        main="Bunzi's Rod",
		sub="Ammurapi shield",
        head="Agwu's Cap", --MB:7 MB2:7
        neck="Mizukage-no-Kubikazari", -- MB: 10
        ear2="Malignance earring", --
        body="Azimuth Coat +3", 
        hands="Agwu's Gages", --MB:8, MB2:4
        ring1="Metamorph Ring +1", --
        ring2="Freke ring", --MB: 5
        legs="Ea Slops", --MB: 7 MB2:7
        feet="Agwu's Pigaches" --MB: 6
    })

    sets.midcast.enfeeble = {
		main="Daybreak",
        sub="Ammurapi shield",
        ammo="Dunna",
        head="Geo. Galero +2",
        neck="Sanctity necklace",
        ear1="Regal earring",
        ear2="Malignance earring",
        body="Geomancy tunic +2",
        hands="Regal Cuffs",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
        back=Cape_Nuke, 
        waist="Acuity Belt +1",
        legs="Geomancy pants +2",
        feet="Geomancy sandals +3"
    }

    sets.midcast['Impact'] = set_combine(sets.midcast.enfeeble, {
        head=empty,
        ring2="Archon ring",
        body='Twilight cloak'
    })

    sets.midcast.enhancing = set_combine(sets.midcast.conserve_mp, {
        sub="Ammurapi shield",
        head="Telchine Cap",
		hands="Telchine Gloves",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
    })
	
    sets.midcast.enhancing['Phalanx'] = set_combine(sets.midcast.enhancing, {
        sub="Ammurapi shield",
        head=Mhead.Phalanx,
		body=Mbody.Phalanx,
		hands=Mhands.Phalanx,
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
		waist="Embla Sash",
		legs=Mlegs.Phalanx,
		feet= Mfeet.Phalanx
    })
	

    sets.kiting = {
        feet="Geomancy sandals +3"
    }
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	sets.ws = {}
	sets.ws["Black Halo"] = {
		ammo="Amar Cluster",
		head="Nyame Helm",
		neck="Rep. Plat. Medal",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Metamorph Ring +1",
		ring2="Petrov Ring",
		back=Cape_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

    coroutine.schedule(lockstyle,2)

end

function precast(spell)
    -- print_set(spell)
    
    if (sets.ja[spell.english]) then
        equip(sets.ja[spell.english])
    elseif spell.name:startswith("Cure") or spell.name:startswith("Curaga") or spell.name:startswith("Cura") then
        equip(sets.fc.cure)
    elseif spell.action_type == "Magic" then
        if sets.fc[spell.name] then
            equip(sets.fc[spell.name])
        elseif spell.english == 'Impact' then
            equip(sets.fc['Impact'])
		else
			equip(sets.fc)
        end
    elseif spell.type == "WeaponSkill" then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    end
end

function midcast(spell)
    -- print_set(spell)
    if(sets.midcast[spell.name]) then
        equip(sets.midcast[spell.name])
    elseif spell.name:startswith("Indi-") then
        equip(sets.midcast.geomancy.indi)
    elseif spell.name:startswith("Geo-") then
        equip(sets.midcast.geomancy)
    elseif spell.name:startswith("Cure") or spell.name:startswith("Curaga") or spell.name:startswith("Cura") then
        if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
            equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})
        else
            equip(sets.midcast.cure)
        end
    elseif spell.skill == "Enhancing Magic" then
		if spell.english == 'Phalanx' then
			equip(sets.midcast.enhancing['Phalanx']) 
		else
			equip(sets.midcast.enhancing)
		end
    elseif spell.skill == "Enfeebling Magic" then
        equip(sets.midcast.enfeeble)
    elseif spell.skill == "Elemental Magic" then
        local nuke_set = Nuke_Sets[Nuke_Set_Index]
        if world.day_element == spell.element or world.weather_element == spell.element then
            equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Hachirin-no-Obi"}))
		elseif spell.english == 'Impact' then	
			equip(sets.midcast['Impact'])
		else
            equip(sets.midcast.elemental[nuke_set])
        end
    elseif spell.skill == "Dark Magic" then
        if spell.name:startswith("Drain") then
            equip(sets.midcast.drain)
        elseif spell.name:startswith("Aspir") then
            equip(sets.midcast.aspir)
        else
            equip(sets.midcast.dark_magic)
        end
    end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.engaged['tp'])
	else
		equip_set(player.status)
    end
end

function equip_set(status)
	if player.status == 'Engaged' then
		equip(sets.engaged['tp'])
	elseif pet.isvalid and Luopan_Idle_On then
        equip(sets.idle.luopan)	
    else
        equip(sets.idle)
    end

    if Kiting then
        equip(sets.kiting)
    end
end


function pet_change(pet,gain)
    equip_set(player.status)
end

function status_change(new,old)
    equip_set(new)
end

function buff_change(buff,gain)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") then
        equip_set(player.status)
    end
end

function self_command(command)
    if command == 'cycle nuke_sets' then
        Nuke_Set_Index = Nuke_Set_Index % #Nuke_Sets + 1
        send_command('@input /echo ----- Nuke Set changed to '..Nuke_Sets[Nuke_Set_Index]..' -----')
        equip_set(player.status)
    elseif command == 'toggle kiting' then
        Kiting = not Kiting
        if Kiting then
            send_command('@input /echo ----- Kiting Set On -----')
        else
            send_command('@input /echo ----- Kiting Set Off -----')
        end
        equip_set(player.status)
    elseif command == 'toggle loupon_idle_On' then
        Luopan_Idle_On = not Luopan_Idle_On
        if Luopan_Idle_On then
            send_command('@input /echo ----- Loupon Idle Set On -----')
        else
            send_command('@input /echo ----- Loupon Idle Set Off -----')
        end
        equip_set(player.status)
    elseif command == "refresh gear" then
        lockstyle()
        equip_set(player.status)
    end
end

function lockstyle()
    if player.main_job == 'GEO' then send_command('@input /lockstyleset 16') end
end

function sub_job_change()
    coroutine.schedule(lockstyle,4)
end