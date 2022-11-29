local engagedMode = "Normal"
local rangedMode = "Normal"
local incapacitated_states = T {"stun", "petrification", "terror", "sleep"}
local debugMode = true

Weapon_Sets = {"Savage", "Leaden"} --"Aeolian Edge", ,"Sword""Crocea/Thibron", , "Savage Blade""Aeolian Edge", "Crocea/Thibron", "Crocea/Daybreak", "Crocea/Gleti's", --"Maxentius","Low TP"}
WeaponSetsIndex = 1

send_command("bind f10 gs c Cycle WeaponSet")

function file_unload()
    send_command('unbind f9')
    send_command('unbind ^f9')
    send_command('unbind f10')
    send_command('unbind ^f10')
    send_command('unbind @f10')
    send_command('unbind !f10')
    send_command('unbind ^f11')
    send_command('unbind @f11')
    send_command('unbind !f11')
    send_command("unbind f12")
    send_command('unbind ^k')
end

function get_sets()

	cape = {}
		cape_tp = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
		cape_savage = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Damage taken-5%',}}
		cape_leaden = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}

    sets.Idle = {
        head = "Nyame Helm",
        neck = "Comm. Charm +1",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Carmine cuisses +1",
        feet = "Nyame Sollerets",
        waist = "Sailfi Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Dedition Earring",
        left_ring = "Defending Ring",
        right_ring = "Ilabrat Ring",
        back = "Aptitude Mantle"
    }

----Engaged----

	sets.weapons = {}
	sets.weapons["Savage"] = {main = "Naegling", sub="Gleti's Knife", range="Anarchy +2"} --sub="Rostam",
	sets.weapons["Aeolian Edge"] = {main = "Tauret", sub="Gleti's Knife", range="Doomsday"}
	--sets.weapons["Leaden"] = {main = "Tauret", sub="Rostam", range="Doomsday"}	---sub="Tauret",


    sets.Engaged = {}
    sets.Engaged.Normal = {
        head = "Malignance Chapeau",
        neck = "Iskur Gorget",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        left_ring = "Ilabrat Ring",
        right_ring = "Epona's Ring",
        back = cape_tp,
        waist = "Sailfi Belt +1",
        legs = "Samnuha Tights",
        feet = "Malignance Boots"
        }

    sets.Engaged.Turtle = {
        head = "Nyame Helm",
        neck = "Comm. Charm +2",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        back = cape_tp,
        waist = "Sailfi Belt +1",
        left_ring = "Defending Ring",
        right_ring = "Petrov Ring",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
        }

    sets.JobAbility = {}

    sets.JobAbility["Wild Card"] = {
        feet = "Lanun Bottes +3"
    }
    sets.JobAbility["Random Deal"] = {
        body = "Lanun Frac +3"
    }
    sets.JobAbility["Snake Eye"] = {
        legs = "Lanun Trews +1"
    }
    sets.JobAbility["Double-Up"] = {
        legs = "Lanun Trews +1",
        right_ring = "Luzaf's Ring"
    }

    sets.WeaponSkill = {}
    sets.WeaponSkill["Savage Blade"] = {
        head = "Nyame Helm",
        neck = "Rep. Plat. Medal",
        left_ear = "Telos Earring",
        right_ear = "Moonshade Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        left_ring = "Epona's Ring",
        right_ring = "Epaminondas Ring",
        back = cape_savage,
        waist = "Sailfi Belt +1",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
	}

    sets.WeaponSkill["Last Stand"] = {
        ammo = "Orichalcum Bullet",
        head = "Nyame Helm",
        neck = "Fotia Gorget",
        left_ear = "Telos Earring",
        right_ear = "Moonshade Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        left_ring = "Dingir Ring",
        right_ring = "Epaminondas Ring",
        back = cape_savage,
        waist = "Fotia Belt",
        legs = "Nyame Flanchard",
        feet = "Lanun Bottes +2"
    }
    sets.WeaponSkill["Detonator"] = sets.WeaponSkill["Last Stand"]
    sets.WeaponSkill["Slug Shot"] = sets.WeaponSkill["Last Stand"]
    sets.WeaponSkill["Sniper Shot"] = sets.WeaponSkill["Last Stand"]
    sets.WeaponSkill["Split Shot"] = sets.WeaponSkill["Last Stand"]
    sets.WeaponSkill["Numbing Shot"] = sets.WeaponSkill["Last Stand"]

    sets.WeaponSkill["Wildfire"] = {
        ammo = "Orichalcum Bullet",
        head = "Nyame Helm",
        neck = "Comm. Charm +2",
        left_ear = "Friomisi Earring",
        -- right_ear = "Moonshade Earring",
        body = "Lanun Frac +3",
        hands = "Nyame Gauntlets",
        left_ring = "Chirich Ring +1",
        right_ring = "Epaminondas Ring",
        waist = "Orpheus's Sash",
        back = cape_leaden, 
        legs = "Nyame Flanchard",
        feet = "Lanun Bottes +3",
    }

    sets.WeaponSkill["Leaden Salute"] = {
        ammo = "Orichalcum Bullet",
        head = "Pixie Hairpin +1",
        neck = "Comm. Charm +1",
        left_ear = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        left_ring = "Dingir Ring",
        right_ring = "Epaminondas Ring",
        ---waist = "Skrymir Cord",
        waist = "Hachirin-no-Obi",		
		back = cape_leaden, 
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.WeaponSkill["Aeolian Edge"] = {
        ammo = "Orichalcum Bullet",
        head = "Nyame Helm",
        neck = "Comm. Charm +1",
        left_ear = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        left_ring = "Dingir Ring",
        right_ring = "Epaminondas's Ring",
        waist = "Hachirin-no-Obi",
        back = cape_savage,
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.CorsairRoll = {
        equipable = true,
        main = "Rostam",
		range="Compensator",
        head = "Lanun Tricorne +2",
        neck = "Regal Necklace",
        hands = "Chasseur's Gants +1",
        right_ring = "Luzaf's Ring",
        legs = "Chas. Culottes +1",
        feet = "Chass. Bottes +1",
    }

    sets.CorsairShot = {
        head = "Ikenga's Hat",
        body = "Lanun Frac +3",
        hands = {
            name = "Carmine Fin. Ga. +1",
            augments = {
                'Rng.Atk.+20',
                '"Mag.Atk.Bns."+12',
                '"Store TP"+6'
            }
        },
        legs = "Ikenga's Trousers",
        feet = "Lanun Bottes +3",
        neck = "Comm. Charm +2",
        waist = "Orpheus's Sash",
        left_ear = "Friomisi Earring",
        right_ear = "Dedition Earring",
        left_ring = "Dingir Ring",
        right_ring = "Chirich Ring +1",
        back = {
            name = "Camulus's Mantle",
            augments = {
                'AGI+20',
                'Mag. Acc+20 /Mag. Dmg.+20',
                'AGI+10',
                'Weapon skill damage +10%'
            }
        }
    }

    sets.Precast = {}
    sets.Precast['Ranged Attack'] = {
        head = {
            name = "Taeon Chapeau",
            augments = {'"Snapshot"+5', '"Snapshot"+5'}
        },
        neck = "Comm. Charm +1",
        body = "Laksa. Frac +2",
        hands = "Lanun Gants +2",
        ring1 = "Dingir Ring",
		ring2="Crepuscular Ring",
        back = "",
        legs = "Adhemar Kecks +2",
        feet = "Meg. Jam. +2"
    }

    sets.Midcast = {}
    sets.Midcast['Ranged Attack'] = {}
    sets.Midcast['Ranged Attack']['Normal'] = {
        head = "Malignance Chapeau",
        neck = "Iskur Gorget",
        left_ear = "Telos Earring",
        right_ear = "Crepuscular Earring",
        body = "Ikenga's Vest",
        hands = "Malignance Gloves",
        left_ring = "Crepuscular Ring",
        right_ring = "Ilabrat Ring",
        back = "",
		waist="Yemaya Belt",
        legs = "",
        feet = "Malignance Boots"
    }

    sets.Midcast['Ranged Attack']['Crit'] = {
        head = "Mummu Bonnet +2",
        body = "Mummu Jacket +2",
        hands = "Mummu Wrists +2",
        legs = "Mummu Kecks +2",
        feet = "Oshosi Leggings",
        neck = {
            name = "Comm. Charm +2",
            augments = {'Path: A'}
        },
        waist = "Kwahu Kachina Belt",
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Mummu Ring",
        right_ring = "Chirich Ring +1",
        back = {
            name = "Camulus's Mantle",
            augments = {
                'AGI+20', 'AGI+10'
            }
        }
    }

    sets.Midcast['Ranged Attack']['Triple Shot'] = {
        head = "Oshosi Mask",
        body = "Oshosi Vest",
        hands = "Oshosi Gloves",
        legs = "Oshosi Trousers",
        feet = "Oshosi Leggings",
        neck = "Comm. Charm +2",
        waist = "Kwahu Kachina Belt",
        left_ear = "Dedition Earring",
        right_ear = "Telos Earring",
        left_ring = "Mummu Ring",
        right_ring = "Ilabrat Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    }
end

function precast(spell, action)
    if incapacitated() then
        return
    end

    if (spell.english == "Spectral Jig" or spell.english == "Sneak") and buffactive.Sneak then
        cast_delay(0.2)
        send_command("cancel Sneak")
    end

    debug("Pre " .. spell.action_type)

    if spell.action_type == 'Ranged Attack' then
        equip(sets.Precast['Ranged Attack'])
        return
    end

    if sets[spell.type] and sets[spell.type][spell.english] then
        equip(sets[spell.type][spell.english])

        return
    end

    if sets[spell.type] and sets[spell.type].equipable then
        equip(sets[spell.type])

        return
    end

    if is_magic(spell) then
        equip(sets.FastCast)
        return
    end

    debug("No set for " .. spell.type .. "." .. spell.english)
end

function midcast(spell, action)
    if incapacitated() then
        return
    end

    if spell.action_type == 'Ranged Attack' then
        if sets.Midcast['Ranged Attack']['Triple Shot'] then
            equip(sets.Midcast['Ranged Attack']['Triple Shot'])
            return
        end

        equip(sets.Midcast['Ranged Attack'][rangedMode])
        return
    end

    if not is_magic(spell) then
        return
    end

    notice("Midcast - " .. spell.skill .. " - " .. spell.english)

    if sets["Midcast"][spell.skill] and sets["Midcast"][spell.skill][spell.english] then
        equip(sets["Midcast"][spell.skill][spell.english])

        return
    end

    if sets["Midcast"][spell.skill] and sets["Midcast"][spell.skill].equipable then
        equip(sets["Midcast"][spell.skill])

        return
    end

    debug("No set for Midcast." .. spell.skill .. "." .. spell.english)
end

function aftercast(spell, action)
    debug("Aftercast: " .. player.status)
    status_change(player.status)
end

function status_change(new, old)
    if incapacitated() then
        debug("incapacitated")
        return
    end

    if _G["status_change_" .. new:lower()] and not _G["status_change_" .. new:lower()]() then
        return
    end

    if (sets[new]) then
        equip(sets[new])
    end
end

function buff_change(name, gain, buff_details)
    if incapacitated_states:contains(name) then
        status_change(player.status)
    end
end

function incapacitated()
    if incapacitated_states:find(function(value)
        return buffactive[value] or false
    end) then
        equip(sets.Idle)
        return true
    end
end

function self_command(argsString)
    print(T(player).status)

    args = argsString:lower():split(" ")

    if _G["self_command_" .. args[1]] then
        _G["self_command_" .. args[1]](args:slice(2))
    end

    status_change(player.status)
end

function status_change_engaged()
    equip(sets.Engaged[engagedMode])
end

function self_command_e(args)
    return self_command_engaged(args)
end

function self_command_engaged(args)
    if not args[1] then
        error("Error: No Engaged Mode Specified")
        return
    end

    local mode = args[1]:ucfirst()
    if not sets.Engaged[mode] then
        error("Error: Invalid Engaged Mode: " .. mode)
        return
    end

    engagedMode = mode
    notice("Engaged Mode Set: " .. mode)
end

function self_command_r(args)
    self_command_ranged(args)
end

function self_command_ranged(args)
    if not args[1] then
        error("Error: No Ranged Mode Specified")
        return
    end

    local mode = args[1]:ucfirst()
    if not sets.Midcast['Ranged Attack'] then
        error("Error: Invalid Ranged Mode: " .. mode)
        return
    end

    rangedMode = mode
    notice("Ranged Mode Set: " .. mode)
end

function is_magic(spell)
    return spell.type:endswith("Magic") or spell.type == "BardSong" or spell.type == "Ninjutsu" or spell.type == "Trust"
end

function notice(s)
    add_to_chat(121, s)
end

function error(s)
    add_to_chat(4, s)
end

function debug(s)
    if debugMode then
        notice(s)
    end
end


function set_gear(status)
	if status == 'Engaged' then	
		local tp_mode = tp_mode[tp_ind]
		equip(sets.tp[tp_mode])
        lockstyle()				
	else
		equip(sets.Idle)
        lockstyle()		
	end
	local weaponSet = Weapon_Sets[WeaponSetsIndex]
	enable ('main', 'sub', 'range')
	equip(sets.weapons[weaponSet])
end

function lockstyle()
    if player.main_job == 'COR' then send_command('@input /lockstyleset 24') end
end

function self_command(command)
	if command == "Cycle WeaponSet" then
        WeaponSetsIndex = WeaponSetsIndex % #Weapon_Sets + 1
        add_to_chat(122,  "Weapon Set: " .. Weapon_Sets[WeaponSetsIndex])
        set_gear(status)
	end
end