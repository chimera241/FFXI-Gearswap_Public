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

MFeet= {}
	MFeet_Drain = { name="Merlinic Crackows", augments={'Mag. Acc.+23','"Drain" and "Aspir" potency +7','CHR+2',}}
	MFeet_MB = { name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+9%','INT+5','Mag. Acc.+3','"Mag.Atk.Bns."+6',}}
Cape= {}
	Cape_Idle = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	Cape_Nuke = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
    sets.ja = {}
    sets.ja['Bolster'] = {body="Bagua tunic +1"}
    sets.ja['Life cycle'] = {body="Geomancy tunic +2", back="Nantosuelta's cape"}
    sets.ja['Full Circle'] = {
        head="Azimuth hood +1",
        hands="Bagua mitaines +1"
    }
    sets.ja['Concentric Pulse'] = { head="Bagua galero +3" }

    sets.fc = {
        head="Merlinic Hood",
        neck="Voltsurge torque",
        ear2="Loquacious Earring",
        ear1="Malignance earring",
        body="Merlinic Jubbah",
        ring1="Prolix ring",
        ring2="Kishar ring",
        back=Cape_Idle,
        belt="Channeler's stone",
        legs="Geomancy pants +2",
        feet="Merlinic crackows"
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

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.ws = {ear2="Moonshade Earring"}

    sets.midcast = {}

    sets.midcast.conserve_mp = {
        head="Vanya hood",
        body="Vedic Coat",
        waist="Austerity belt",
        legs="Geomancy pants +1",
        feet="Medium's sabots"
    }

    sets.midcast.geomancy = set_combine(sets.midcast.conserve_mp, {
        main="Idris", 
        range="Dunna",
        neck="Bagua charm +1",
        head="Azimuth hood +1",
        body="Bagua tunic +1",
        hands="Geomancy mitaines +3",
        back="Lifestream Cape",
        feet="Medium's sabots",
		ring1="Stikini Ring",
		ring2="Stikini Ring"
    })

    sets.midcast.geomancy.indi = set_combine(sets.midcast.geomancy, {
        main="Idris",
        range="Dunna",
        head="Azimuth hood +1",
        body="Bagua tunic +1",
        hands="Geomancy mitaines +3",
        back="Lifestream Cape",
        legs="Bagua Pants +1",
        feet="Azimuth gaiters +1",
		ring1="Stikini Ring",
		ring2="Stikini Ring"
    })

    sets.midcast.cure = set_combine(sets.midcast.conserve_mp, {
		main="Daybreak",
		sub="Sors Shield",
		head="Vanya Hood",
		body="Vanya Robe",
		hands="Kaykaus cuffs",
		ring1="Stikini ring",
		ring2="Lebeche ring",
		legs="Chironic hose",		
		back="Solemnity Cape",		
		feet="Kaykaus boots"
    })

    sets.midcast.dark_magic = set_combine(sets.midcast.conserve_mp, {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        feet=MFeet_Drain,
        ring1="Stikini ring",
		ring2="Evanescence Ring",
		ear1="Hirudinea Earring",
		ear2="Malignance earring",
        waist="Fucho-no-obi",
		back=Cape_Nuke
    })
    
    sets.midcast.drain = set_combine(sets.midcast.dark_magic, {
        head="Pixie Hairpin +1",
        neck="Erra pendant",
        feet=MFeet_Drain,
        ring1="Stikini ring",
		ring2="Evanescence Ring",
		ear1="Hirudinea Earring",
		ear2="Malignance earring",
        waist="Fucho-no-obi",
		back=Cape_Nuke
    })

    sets.midcast.aspir = sets.midcast.drain

    sets.midcast.elemental = {}

    sets.midcast.elemental["magic-accuracy"] = {
        main="Daybreak",
		sub="Ammurapi shield",
        head="Merlinic Hood",
        neck="Erra pendant",
        ear1="Barkarole earring",
        ear2="Malignance earring",
        body="Geomancy tunic +2",
        hands="Geomancy mitaines +3",
        ring1="Stikini ring",
        ring2="Stikini ring",
        waist="Luminary sash",
        legs="Geomancy pants +2",
        feet="Geomancy sandals +3",
        back=Cape_Nuke, 
		}

    sets.midcast["Stun"] = sets.midcast.elemental["magic-accuracy"]

    sets.midcast.elemental["magic-atk-bonus"] = {
        main="Daybreak",
		sub="Ammurapi shield",
        head="Bagua galero +1",
        neck="Sanctity necklace",
        ear1="Barkarole earring",
        ear2="Malignance earring",
        body="Jhakri Robe +2",
        hands="Amalric gages +1",
        ring1="Freke ring",
        ring2="Shiva ring +1",
        waist="Eschan stone",
        legs="Amalric Slops +1",
        feet=merlinic_feet_mab,
        back=Cape_Nuke,
		}

    --MB: 52
    --MB2: 32
    --Total MB: 82
    sets.midcast.elemental["magic-burst"] = set_combine(sets.midcast.elemental["magic-atk-bonus"], {
        head="Ea hat", --MB: 6 MB2:6
        neck="Mizukage-no-Kubikazari", -- MB: 10
        ear2="Malignance earring", --MB: 5
        body="Ea houppelande", --MB: 8 MB2:8
        hands="Amalric gages +1", --MB2: 6
        ring1="Mujin band", --MB2: 5
        ring2="Locus ring", --MB: 5
        legs="Ea Slops", --MB: 7 MB2:7
        feet=MFeet_MB --MB: 11
    })

    sets.midcast.enfeeble = {
		main="Daybreak",
        sub="Ammurapi shield",
        ammo="Dunna",
        head="Geo. Galero +2",
        neck="Sanctity necklace",
        ear1="Gwati earring",
        ear2="Malignance earring",
        body="Geomancy tunic +2",
        hands="Geomancy mitaines +3",
        ring1="Stikini ring",
        ring2="Stikini ring",
        back=Cape_Nuke, 
        waist="Luminary sash",
        legs="Geomancy pants +2",
        feet="Geomancy sandals +3"
    }

    sets.midcast.enhancing = set_combine(sets.midcast.conserve_mp, {
        sub="Ammurapi shield",
        head="Telchine Cap",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
        ring1="Stikini ring",
        ring2="Stikini ring"
    })

    sets.idle = {
        main="Idris",
        sub="Genmei shield",
        range="Dunna",
        head="Nyame Helm",
        neck="Loricate torque +1",
        ear1="Etiolation earring",
        ear2="Hearty earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Defending Ring",
        ring2="Warden's ring",
        back=Cape_Idle,
        waist="Fucho-no-obi",
		legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    }

    sets.idle.luopan = set_combine(sets.idle, {
        main="Idris",
        range="Dunna",
        head="Nyame Helm",
        body="Nyame Mail",		
        hands="Nyame Gauntlets",
		back=Cape_Idle,
		legs="Nyame Flanchard",
        feet="Nyame Sollerets"
    })

    sets.kiting = {
        head="Befouled crown",
        body="Jhakri robe +2",
        hands="Bagua Mitaines +1",
        ring1="Stikini Ring +1",
        ring2="Stikini Ring +1",
        feet="Geomancy sandals +3"
    }
	
	sets.engaged = {}
	
	sets.engaged["tp"] = {
	}

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
        equip(sets.midcast.enhancing)
    elseif spell.skill == "Enfeebling Magic" then
        equip(sets.midcast.enfeeble)
    elseif spell.skill == "Elemental Magic" then
        local nuke_set = Nuke_Sets[Nuke_Set_Index]
        if world.day_element == spell.element or world.weather_element == spell.element then
            equip( set_combine(sets.midcast.elemental[nuke_set], {waist = "Hachirin-no-Obi"}))
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

function equip_set(status)
    if pet.isvalid and Luopan_Idle_On then
        equip(sets.idle.luopan)
    else
        equip(sets.idle)
    end

    if Kiting then
        equip(sets.kiting)
    end
end

function aftercast(spell)
    if (not spell.name:startswith('Geo-')) and spell.name ~= 'Full Circle' and spell.name ~= 'Radial Arcana' and spell.name ~= 'Mending Halation' and spell.name ~= 'Concentric Pulse' then
        equip_set(player.status)
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