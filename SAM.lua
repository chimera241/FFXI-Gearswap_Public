-- Get Sets: Everything in this section is run as soon as you change jobs.
Engaged_Modes = {"TP", "More ACC", "Hybrid", "MEva", "DT", "Subtle Blow", "TH"}
Engaged_Modes_Index = 1
Weapon_Sets = {"Masamune", "Dojikiri", "Shining One"} --"Soboro"
WeaponSetsIndex = 1	


send_command('bind f9 gs c set meleeTP')
send_command('bind !f9 gs c set meleeAcc')
send_command('bind ^f9 gs c set meleeHybrid')
send_command('bind ^@f9 gs c set meleeMEva')
send_command('bind @f10 gs c set meleeTH')
send_command('bind f10 gs c Weapon')
send_command('bind ^f10 gs c set meleeMEva')
send_command('bind f11 gs c set meleeDT')
send_command('bind ^f11 gs c set meleeSB')
send_command('bind @f12 gs c reset gear')

function get_sets()

Cape = {}
	Cape_TP = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Cape_ws = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Cape_Magicws = { name="Smertrios's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}}

	sets = {}
	petcast = false
	-- Regular Sets --
	sets.Idle = { 
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		body="Kasuga Domaru +2",
		hands="Nyame Gauntlets",
		ring1="Shneddick Ring",
		ring2="Defending Ring",
		legs="Kasuga Haidate +2",
		feet="Nyame Sollerets",
		waist="Flume Belt",
		ear1="Cessance Earring",
		ear2="Odnowa Earring +1",
		back=Cape_TP
		}

	--Weapons

	sets.weapons = {}
	sets.weapons["Masamune"] = {main = "Masamune"}
	sets.weapons["Shining One"]  = {main = "Shining One"}
	sets.weapons["Dojikiri"]  = {main = "Dojikiri Yasutsuna"}
	sets.weapons["Soboro"]  = {main = "Soboro Sukehiro"}	
	
	--TP Sets
	
	sets.tp = {}		  
			  
	sets.tp["TP"] = {    
		sub="Utu Grip",
		ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2", --
		neck="Sam. Nodowa +2",		
		ear1="Telos Earring",
		ear2="Schere Earring",		
		body="Ken. Samue +1",
		hands="Tatena. Gote +1",
		ring1="Niqmaddu Ring",
		ring2="Petrov Ring",
		back=Cape_TP,
		waist="Sailfi Belt +1",
		legs="Tatena. Haidate +1",
		feet="Ryuo Sune-Ate +1",
		}
	
	sets.tp["More Acc"] = set_combine(sets.tp["TP"], { --% PDT, % MDT--	
		head="Ken. Samue +1",
		hands="Tatena. Gate +1",
		ring2="Chirich Ring +1",
		legs="Tatena Haidate +1",
		feet="Tatena. Sune. +1"
		})	
	
	sets.tp["Hybrid"] = set_combine(sets.tp["TP"], { --23% DT, 10 SBII, 
		body="Kasuga Domaru +2", --13% DT
		ring2="Chirich Ring +1",
		legs="Kasuga Haidate +2", --10% DT
		})
	
	sets.tp["TH"] = set_combine(sets.tp["Hybrid"], { --23% DT, 10 SBII, 
		ammo="Per. Lucky Egg", --13% DT
		waist="Chaac Belt", --10% DT
		feet="Volte Boots"
		})	
		
	sets.tp["MEva"] = set_combine(sets.tp["TP"], { --% PDT, % MDT--
		ammo="Staunch Tathlum +1",
		head="Ken. Jinpachi +1",
		neck="Warder's Charm +1",
		body="Ken. Samue +1",
		ear2="Eabani Earring",
		legs="Mpaca's Hose",		
		feet="Nyame Sollerets"
		})		
	
	sets.tp["DT"] = set_combine(sets.tp["Hybrid"], { --39% PDT, 27% MDT, 38% DT
		head="Nyame Helm", --7% DT		
		neck="Loricate Torque +1", --6% DT
		waist="Flume Belt"		
		})	
	
	sets.tp["Subtle Blow"] = set_combine(sets.tp["Hybrid"], { --39% PDT, 27% MDT--
		head="Ken. Jinpachi +1",
		neck="Bath Choker +1",
		body="Dagon Breast.",
		ring2="Chirich Ring +1"
		})

	-- Can add a set for each ws by making a new set: sets.ws["Stardiver"] or sets.ws["Camlann's Torment"] for example
	sets.ws = {}
		
	sets.ws["wsd"] = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		neck="Samurai Nodowa +2", 
		ear1="Thrud Earring",
		ear2={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},   
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Epaminondas's Ring",
		ring2="Regal Ring",
		back=Cape_ws,
		waist="Sailfi Belt +1",
		legs="Wakido Haidate +3",
		feet="Nyame Sollerets"
		}

	sets.ws["Magic"] = set_combine(sets.ws["wsd"], {
		head="Nyame Helm",
		ear1="Friomisi Earring",
		back=Cape_Magicws,
		waist="Skrymir Cord",
		legs="Nyame Flanchard"
		})	
			
	sets.ws["Ageha"] = set_combine(sets.ws["wsd"], {
		ear1="Sanctity Earring",
		ear2={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		ring1="Stikini Ring +1",
		ring2="Metamor. Ring +1",
		waist="Eschan Stone",
		legs="Nyame Flanchard"
		})
		
	sets.ws["Stardiver"] = set_combine(sets.ws["wsd"], {
		hands="Ryuo Tekko +1",
		back=Cape_TP,	
		waist="Fotia Belt",
		feet="Valorous Greaves"
		})

    sets.ws["Tachi: Fudo"] = sets.ws["wsd"]
	sets.ws["Tachi: Shoha"] = sets.ws["wsd"]
	sets.ws["Tachi: Kasha"] = sets.ws["wsd"]	
	sets.ws["Tachi: Gekko"] = sets.ws["wsd"]
	sets.ws["Tachi: Rana"] = sets.ws["wsd"]
	
    sets.ws["Tachi: Jinpu"] = sets.ws["Magic"]	
    sets.ws["Tachi: Kagero"] = sets.ws["Magic"]	
    sets.ws["Tachi: Koki"] = sets.ws["Magic"]	
    sets.ws["Tachi: Goten"] = sets.ws["Magic"]
	
	sets.ws["Impulse Drive"] = set_combine(sets.ws["wsd"], {head="Nyame Helm"})
	sets.ws["Stardiver"] = sets.ws["Stardiver"]
	sets.ws["Leg Sweep"] = sets.ws["Ageha"]

    wsd = set_combine(sets.ws)

    -- Job Ability Sets --
	sets.ja = {}
	
	sets.ja['Meditate'] = {head="", hands="Sakonji Kote +3"}
end
		
function precast(spell)
    -- print_set(spell)
    if spell.action_type == "Magic" then
        equip(sets.fc)
    elseif spell.type == "WeaponSkill" then
        if sets.ws[spell.name] and 
			(world.day_element == spell.element or world.weather_element == spell.element) then
				equip(set_combine(sets.ws[spell.name], {waist = "Hachirin-no-Obi"})) 
			else equip(sets.ws[spell.name])
        end
    elseif spell.type == "JobAbility" then
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    end
end

function aftercast(spell)
	set_gear(player.status)
end
 
function status_change(new, old)
	set_gear(new)
end

function set_gear(status)
    if status == 'Engaged' then
        local meleeMode = Engaged_Modes[Engaged_Modes_Index]
        equip(sets.tp[meleeMode])
    else
        equip(sets.Idle)
        lockstyle()		
    end
	local weaponSet = Weapon_Sets[WeaponSetsIndex]
	enable ('main', 'sub')
	equip(sets.weapons[weaponSet])
end 


function self_command(command)
	if command == "set meleeTP" then
		Engaged_Modes_Index = 1
		send_command('@input /echo ----- Melee Mode: TP -----')
		set_gear(player.status)
	elseif command == "set meleeAcc" then
		Engaged_Modes_Index = 2
		send_command('@input /echo ----- Melee Mode: More Acc -----')
		set_gear(player.status)
	elseif command == "set meleeHybrid" then
		Engaged_Modes_Index = 3
		send_command('@input /echo ----- Melee Mode: Hybrid -----')
		set_gear(player.status)
	elseif command == "set meleeMEva" then
		Engaged_Modes_Index = 4
		send_command('@input /echo ----- Melee Mode: Magic Evasion -----')
		set_gear(player.status)		
	elseif command == "set meleeDT" then
		Engaged_Modes_Index = 5
		send_command('@input /echo ----- Melee Mode: DT -----')
		set_gear(player.status)
	elseif command == "set meleeSB" then
		Engaged_Modes_Index = 6
		send_command('@input /echo ----- Melee Mode: Subtle Blow -----')
		set_gear(player.status)		
	elseif command == "set meleeTH" then
		Engaged_Modes_Index = 7
		send_command('@input /echo ----- Melee Mode: Treasure Hunter 3 -----')
		set_gear(player.status)		
	elseif command == "Weapon" then
		WeaponSetsIndex = WeaponSetsIndex % #Weapon_Sets + 1
		add_to_chat(122,  "Weapon Set: " .. Weapon_Sets[WeaponSetsIndex])
		set_gear(player.status)	
	elseif command == "reset gear" then
		local meleeMode = Engaged_Modes[Engaged_Modes_Index]
		send_command('@input /echo ----- Melee Mode: ' .. meleeMode .. ' -----')
		set_gear(player.status)
	end
end

function lockstyle()
	if player.main_job == 'SAM' then send_command('@input /lockstyleset 22')
	end
end