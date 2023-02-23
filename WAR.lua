-- Get Sets: Everything in this section is run as soon as you change jobs.
Engaged_Modes = {"TP", "More ACC", "Hybrid", "MEva", "DT", "Subtle Blow", "TH"}
Engaged_Modes_Index = 1
Weapon_Sets = {"Naegling", "Loxotic", "Shining One"} --"Soboro"
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
send_command('bind !h input /item "Holy Water" <me>')

function get_sets()

Cape = {}
	Cape_TP = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Cape_ws = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Cape_Magicws = { name="Smertrios's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}}

	sets = {}
	petcast = false
	-- Regular Sets --
	sets.Idle = { 
		ammo="Coiste Bodhar",
		--ammo="Horn Arrow",
		head="Nyame Helm", --
		neck="Warrior Beads +2",
		ear1="Schere Earring",		
		ear2="Boii Earring +2",		
		body="Nyame Mail",
		hands="Sakpata's Gauntlets",
		ring1="Shneddick Ring +1",
		ring2="Petrov Ring",
		back=Cape_TP,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Flamma Gamberas +2",
		}

	sets.Precast = {}
	sets.Precast['Ranged Attack'] = { 
		ammo="Horn Arrow"
		}

	--Weapons

	sets.weapons = {}
	sets.weapons["Naegling"] = {main = "Naegling", sub="Blurred Shield +1"}
	sets.weapons["Shining One"]  = {main = "Shining One"}
	sets.weapons["Loxotic"]  = {main = "Loxotic Mace +1", sub="Blurred Shield +1"}
	sets.weapons["Soboro"]  = {main = "Soboro Sukehiro"}	
	
	--TP Sets
	
	sets.tp = {}		  
			  
	sets.tp["TP"] = {   
		ammo="Coiste Bodhar",
		--ammo="Horn Arrow",
		head="Flam. Zucchetto", --"Boii Mask +2"
		neck="War. Beads +2",	
		ear1="Schere Earring",	
		ear2="Boii Earring +2",		
		body="Nyame Mail",
		hands="Sakpata's Gauntlets",
		ring1="Niqmaddu Ring",
		ring2="Defending Ring",
		back="Mecisto. Mantle",
		waist="Sailfi Belt +1",
		legs="Boii Cuisses +3",
		feet="Flamma Gambieras +2",
		}
	
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
		head="Agoge Mask +3",
		neck="Warrior Beads +2", 
		ear1="Thrud Earring", 
		ear2={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},  
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Sroda Ring",
		ring2="Regal Ring",
		back=Cape_ws,
		waist="Sailfi Belt +1",
		legs="Boii Cuisses +3",
		feet="Nyame Sollerets"
		}

	sets.ws["Magic"] = set_combine(sets.ws["wsd"], {
		head="Nyame Helm",
		ear2="Schere Earring",
		back=Cape_Magicws,
		waist="Orpheus's Sash"
		})	
		
	sets.ws["Impulse Drive"] = set_combine(sets.ws["wsd"], {
		})

    sets.ws["Savage Blade"] = sets.ws["wsd"]
	sets.ws["Judgement"] = sets.ws["wsd"]

    wsd = set_combine(sets.ws)

    -- Job Ability Sets --
	sets.ja = {}
	
	sets.ja['Warcry'] = {head="Agoge Mask +3"}	
	sets.ja['Aggressor'] = {head="Agoge Lorica +2"}
	sets.ja['Blood Rage'] = {head="Boii Lorica +2"}
end


	sets.utility = {}
	sets.utility.doom = {
		neck="Nicander's Necklace",
		ring1="Purity Ring",
		waist="Gishbubar Sash"
	}

---- .::Precast Functions::. ---->
	--function buff_change
		--if buff.name == "doom" then
			--	if gain then
				--	ChangeGear(sets.utility.doom)
				--	send_command('@input /p Doomed - Curse removal set equipped!!!!!')
				--	disable('neck','ring1','ring2','waist')
				--else
					--if player.status == 'Engaged' then
						--	send_command('@input /p Doom is off {^_^}')
							--enable('neck','ring1','ring2','waist')
				--end
	--end
		
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
    elseif spell.action_type == 'Ranged Attack' then
        equip(sets.Precast['Ranged Attack'])
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