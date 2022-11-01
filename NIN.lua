
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
  send_command('bind ^f9 gs c Heishi/Kuni')
  send_command('bind ^f10 gs c Heishi/TP')
  send_command('bind ^f11 gs c Naegling')
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

    if command == 'Heishi/Kuni' then
		equip(sets.weapons["Heishi/Kuni"])
		send_command('@input /echo Heishi / Kunimitsu equipped.')
		--send_command('@input /lockstyleset 21')
	end

    if command == 'Heishi/TP' then
		equip(sets.weapons["Heishi/TP"])
		send_command('@input /echo Heishi / TP Bonus Katana equipped.')
		--send_command('@input /lockstyleset 21')
	end
    if command == 'Naegling' then
		equip(sets.weapons["Naegling"])
		send_command('@input /echo Naegling / TP Bonus Katana equipped.')
		--send_command('@input /lockstyleset 21')
	end
end

function get_sets()	
	 
	cape = {}
		cape_TP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
		cape_WSDstr = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
		--cape_DADex
		--cape_ninju
	HHead = {}
		HHead_th = {name="Herculean Helm", augments={'Mag. Acc.+20','Rng.Atk.+29','"Treasure Hunter"+1','Accuracy+8 Attack+8','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}
    HHands = {}
		HHands = { name="Herculean Gloves", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Accuracy+13','Attack+4',}}
	HFeet = {}    
        HFeet_tp = { name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','AGI+5','Attack+15',}}
		HFeet_wsd = { name="Herculean Boots", augments={'Attack+10','Weapon skill damage +4%','MND+2','Accuracy+8',}}
		HFeet_th = { name="Herculean Boots", augments={'Enmity-3','Pet: "Dbl. Atk."+1','"Treasure Hunter"+1','Accuracy+19 Attack+19','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
   

		-- Weapon Sets --
	
	Weapon_Sets = {"Heishi/Kunimitsu", "Heishi/Uzura +3", "Naegling", } ---"Tauret", "Abyssea"
	WeaponSetsIndex = 1

	sets.weapons = {}
	sets.weapons["Heishi/Kuni"] = {main = "Heishi Shorinken", sub = "Kunimitsu"}
	sets.weapons["Heishi/TP"] = {main = "Heishi Shorinken", sub = "Uzura +3"}
	sets.weapons["Naegling"]  = {main = "Naegling", sub = "Uzura +3"}
	sets.weapons["Tauret"] = {main = "Tauret", sub = "Gleti's Knife"}
	sets.weapons["Abyssea"] = {main = "Tauret", sub = "Wind Knife"}


        --idle Sets--  
	sets.idle = {}
       
		idle_mode = {'Standard', 'Eva'}
		idle_ind = 1                   
       
        sets.idle['Standard'] = { 
			ammo="Staunch Tathlum +1", 
			head="Malignance Chapeau", 
			neck="Loricate Torque +1", 
			ear1="Ethereal earring", 
			ear2="Malignance Earring",
			body="Malignance Tabard", 
			hands="Malignance Gloves", 
			ring1="Defending Ring", 
			ring2="Shneddick Ring", 
			back=cape_tp,
			waist="Flume Belt", 
			legs="Nyame Flanchard",
			feet="Malignance Boots"
		}
		
        sets.idle['Eva'] = { 
			ammo="Staunch Tathlum +1", 
			head="Malignance Chapeau", 
			neck="Bathy Choker +1", 
			ear1="Eabani Earring", 
			ear2="Infused Earring",
			body="Nyame Mail", 
			hands="Nyame Gauntlets", 
			ring1="Defending Ring", 
			ring2="Shneddick Ring", 
			back=cape_eva,
			waist="Kasiri Belt", 
			legs="Nyame Flanchard",
			feet="Nyame Sollerets"
		}		
					
        --tp Sets--
	sets.tp = {}
 

	--1=Standard, 2=Accuracy, 3=DT--
	--tp_ind = 1

--Trash Content / 1150 Acc 
		sets.tp.NoAccuracy = {}		
				
		sets.tp.NoAccuracy.Haste0 = { --39DW Needed
			ammo="Seki Shuriken",
			head="Hattori Zukin +2", --7DW
			neck="Ninja Nodowa +2",
			ear1="Eabani Earring", --4DW
			ear2="Dedition Earring",
			body="Mochizuki Chainmail +3", --9DW
			hands="Adhemar Wristbands +1",
			ring1="Regal Ring",
			ring2="Chirich Ring +1",
			back=cape_tp,
			waist="Sailfi Belt +1",
			legs="Samnuha Tights",
			feet="Tatena. Sune. +1"
  }
	   sets.tp.NoAccuracy.Haste15 = { --32DW
			ammo="Seki Shuriken",
			head="Hattori Zukin +2", --7DW
			neck="Ninja Nodowa +2",
			left_ear="Telos Earring", 
			right_ear="Dedition Earring",
			body="Mochizuki Chainmail +3", --9DW
			hands="Adhemar Wristbands +1",
			left_ring="Gere Ring",
			right_ring="Epona's Ring",
			back=cape_tp,
			waist="Sailfi Belt +1",
			legs="Samnuha Tights",
			feet="Tatena. Sune. +1"
  }
	   sets.tp.NoAccuracy.Haste30 = { --21DW
			ammo="Seki Shuriken",
			head="Adhemar Bonnet +1", --7DW
			neck="Ninja Nodowa +2",
			left_ear="Telos Earring", 
			right_ear="Dedition Earring",
			body="Adhemar Jacket +1", --9DW
			hands="Adhemar Wristbands +1",
			left_ring="Gere Ring",
			right_ring="Epona's Ring",
			back=cape_tp,
			waist="Sailfi Belt +1",
			legs="Tatena. Haidate +1",
			feet="Tatena. Sune. +1"
  }
	   sets.tp.NoAccuracy.HasteCap = { --1DW
			ammo="Seki Shuriken",
			head="Malignance Chapeau", 
			neck="Ninja Nodowa +2",
			left_ear="Telos Earring", 
			right_ear="Dedition Earring",
			body="Malignance Tabard", --9DW
			hands="Adhemar Wristbands +1",
			left_ring="Gere Ring",
			right_ring="Epona's Ring",
			back=cape_tp,
			waist="Sailfi Belt +1",
			legs="Tatena. Haidate +1",
			feet="Tatena. Sune. +1"
  }

--Slightly less trash content / 1200 acc
	sets.tp.LowAccuracy = {}
	sets.tp.LowAccuracy.Haste0 = { --39DW Needed
		ammo="Seki Shuriken",
		head="Adhemar Bonnet +1", --7DW
		neck="Ninja Nodowa +2",
		ear1="Suppanomimi", --4DW
		ear2="Telos Earring",
		body="Ken. Samue +1", --9DW
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Chirich Ring +1",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Samnuha Tights",
		feet="Malignance Boots"
	}
   sets.tp.LowAccuracy.Haste15 = { --32DW
		ammo="Seki Shuriken",
		head="Malignance Chapeau", --7DW
		neck="Ninja Nodowa +2",
		ear1="Cessance Earring", --4DW
		ear2="Telos Earring",
		body="Adhemar Jacket +1", --9DW
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Epona's Ring",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Samnuha Tights",
		feet="Malignance Boots"
	}
   sets.tp.LowAccuracy.Haste30 = { --21DW
		ammo="Seki Shuriken",
		head="Adhemar Bonnet +1", --7DW
		neck="Ninja Nodowa +2",
		left_ear="Eabani Earring", 
		right_ear="Dedition Earring",
		body="Adhemar Jacket +1", --9DW
		hands="Adhemar Wristbands +1",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Tatena. Haidate +1",
		feet="Malignance Boots"
	}
   sets.tp.LowAccuracy.HasteCap = { --1DW
		ammo="Seki Shuriken",
		head="Malignance Chapeau", 
		neck="Ninja Nodowa +2",
		left_ear="Telos Earring", 
		right_ear="Dedition Earring",
		body="Malignance Tabard", --9DW
		hands="Malignance Gloves",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Tatena. Haidate +1",
		feet="Tatena. Sune. +1"
	}

----Mid Accuracy / 1350 Eva  
	sets.tp.MidAccuracy = {}
	sets.tp.MidAccuracy.Haste0 = { --39DW Needed
		ammo="Seki Shuriken",
		head="Adhemar Bonnet +1", --7DW
		neck="Ninja Nodowa +2",
		ear1="Suppanomimi", --4DW
		ear2="Telos Earring",
		body="Ken. Samue +1", --9DW
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Chirich Ring +1",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Samnuha Tights",
		feet="Malignance Boots"
	}
   sets.tp.MidAccuracy.Haste15 = { --32DW
		ammo="Seki Shuriken",
		head="Malignance Chapeau", --7DW
		neck="Ninja Nodowa +2",
		ear1="Cessance Earring", --4DW
		ear2="Telos Earring",
		body="Adhemar Jacket +1", --9DW
		hands="Adhemar Wristbands +1",
		ring1="Gere Ring",
		ring2="Epona's Ring",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Samnuha Tights",
		feet="Malignance Boots"
	}
   sets.tp.MidAccuracy.Haste30 = { --21DW
		ammo="Seki Shuriken",
		head="Malignance Chapeau", --7DW
		neck="Ninja Nodowa +2",
		left_ear="Eabani Earring", 
		right_ear="Telos Earring",
		body="Adhemar Jacket +1", --6DW
		hands="Adhemar Wristbands +1",
		left_ring="Gere Ring",
		right_ring="Chirich Ring +1",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Tatena. Haidate +1",
		feet="Malignance Boots"
	}
   sets.tp.MidAccuracy.HasteCap = { --1DW
		ammo="Seki Shuriken",
		head="Malignance Chapeau", 
		neck="Ninja Nodowa +2",
		left_ear="Telos Earring", 
		right_ear="Brutal Earring",
		body="Malignance Tabard", --9DW
		hands="Malignance Gloves",
		left_ring="Gere Ring",
		right_ring="Epona's Ring",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Tatena. Haidate +1",
		feet="Malignance Boots"
	}
	
   sets.tp.HighAccuracy = { --1DW
		ammo="Seki Shuriken",
		head="Kendatsuba Jinpachi +1", 
		neck="Ninja Nodowa +2",
		left_ear="Telos Earring", 
		right_ear="Brutal Earring",
		body="Malignance Tabard", --9DW
		hands="Malignance Gloves",
		left_ring="Regal Ring",
		right_ring="Epona's Ring",
		back=cape_tp,
		waist="Sailfi Belt +1",
		legs="Tatena. Haidate +1",
		feet="Malignance Boots"
	}	
	
--Weaponskill Sets--
	sets.ws = {}
	sets.ws['Savage Blade'] = {
		ammo="Oshasha's Treatise",
		head="Nyame Helm",
		neck="Rep. Plat. Medal",
		ear1="Moonshade earring",
		ear2="Ishvara earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Epona's ring",
		ring2="Epaminondas's Ring",
		back=cape_WSDstr, 
		waist="Sailfi Belt +1", 
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.ws['Hybrid'] = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",
		neck="Fotia Gorget",
		ear1="Moonshade earring",
		ear2="Lugra earring +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Gere ring",
		ring2="Epaminondas's Ring",
		back=cape_WSDstr, 
		waist="Skrymir Cord", 
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}	

	sets.ws['Blade: Shun'] = {
		ammo="Seething Bomblet +1",
		head="Kendatsuba Jinpachi +1",
		neck="Ninja Nodowa +2",
		ear1="Moonshade earring",
		ear2="Ishvara earring",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		ring1="Gere ring",
		ring2="Regal Ring",
		back=cape_WSDstr, 
		waist="Fotia Belt", 
		legs="Mpaca's Hose",
		feet="Nyame Sollerets"
	}	

	sets.ws["Blade: Chi"] = sets.ws['Hybrid']
	sets.ws["Blade: Teki"] = sets.ws['Hybrid']
	sets.ws["Blade: To"] = sets.ws['Hybrid']
	sets.ws["Tachi: Kagero"] = sets.ws['Hybrid']
	sets.ws["Tachi: Goten"] = sets.ws['Hybrid']
	sets.ws["Tachi: Koki"] = sets.ws['Hybrid']
															
--Magic--

	--Precast Sets--
	sets.precast = {}
   
	sets.precast.FC = {}
   
	sets.precast.FC.Standard = { --68%, plus 20% from traits
		head="Amalric Coif +1", --11%
		neck="Voltsurge Torque", --4%
		ear1="Loquac. Earring", --5%
		ear2="Etiolation Earring", --4%
		body="Dread Jupon", --8%
		hands="Taeon Gloves", --5%
		ring1="Lebeche Ring", --2%
		ring2="Kishar Ring", --4%
		back=cape_eva, --Fi Follet +1 10% at R15 note: Not Augmented at moment
		waist="Witful Belt", --3%	
		legs="Gyve Trousers", --4%
		feet="Carmine Greaves +1" --8%
	}
   
	sets.precast.FC.Nin = set_combine(sets.precast.FC.Standard, {
	})

	--Midcast Sets--
	--Ninjutsu--

	sets.ninjutsu = {}

	sets.ninjutsu.utsu = {
		back=cape_eva, --
		feet="Hattori Kyahan +1" --
	}
	
	sets.ninjutsu.migiwari = {
		back=cape_eva, --
		feet="Hattori Kyahan +1" --
	}
	
	sets.ninjutsu.SIRD = {
	}
	
	sets.ninjutsu.MACC = {
	}
	
	
	sets.ninjutsu.freenuke = { ---23 MBD, 5 MBDII
		ammo="Ghastly Tathlum +1",
		head="Mochizuki Hatsuburi +3", --
		neck="Sibyl Scarf", --
		ear1="Crematio Earring", --
		ear2="Friomisi Earring", --
		body="Nyame Mail", -- MBD 7
		hands="Hattori Tekko +2", --10 MBD
		ring1="Metamorph Ring +1", --
		ring2="Shiva Ring +1", --5 MBDII
		back=cape_eva, --
		waist="Skrymir Cord", --
		legs="Nyame Flanchard", --MBD 6
		feet="Mochizuki Kyahan +3" --
	}
	
	sets.ninjutsu.burst = { ---23 MBD, 5 MBDII
		ammo="Ghastly Tathlum +1",
		head="Mochizuki Hatsuburi +3", --
		neck="Sibyl Scarf", --
		ear1="Crematio Earring", --
		ear2="Friomisi Earring", --
		body="Nyame Mail", -- MBD 7
		hands="Hattori Tekko +2", --10 MBD
		ring1="Metamorph Ring +1", --
		ring2="Mujin Ring", --5 MBDII
		back=cape_eva, --
		waist="Skrymir Cord", --
		legs="Nyame Flanchard", --MBD 6
		feet="Mochizuki Kyahan +3" --
	}

	--Other Magic Midcast--
	sets.Enhancing = {}
	
	sets.Enhancing['Phalanx'] = {
		head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
		neck="Loricate Torque +1",
		ear1="Loquac. earring",
		ear2="Augment. earring",
		body="Herculean Vest",
		hands={ name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Fi Follet Cape +1",
		waist="Pythia sash +1",
		legs={ name="Herculean Trousers", augments={'Attack+9','Haste+1','Phalanx +5','Accuracy+5 Attack+5','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		feet={ name="Taeon Boots", augments={'"Cure" potency +5%','Phalanx +3',}}		
	}
												 
	--Job Ability Sets--
   
	sets.JA = {}
   
	sets.JA.Futae = {hands="Hattori Tekko +1"}

end
 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- SPELL/ABILITY LISTS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

spell_maps = {
	['Utsusemi: Ichi']='Utsu', ['Utsusemi: Ni']='Utsu', ['Utsusemi: San']='Utsu',
	['Katon: Ichi']='Nukes', ['Katon: Ni']='Nukes', ['Katon: San']='Nukes',
	['Suiton: Ichi']='Nukes', ['Suiton: Ni']='Nukes', ['Suiton: San']='Nukes',
	['Raiton: Ichi']='Nukes', ['Raiton: Ni']='Nukes', ['Raiton: San']='Nukes',
	['Doton: Ichi']='Nukes', ['Doton: Ni']='Nukes', ['Doton: San']='Nukes',
	['Huton: Ichi']='Nukes', ['Huton: Ni']='Nukes', ['Huton: San']='Nukes',
	['Hyoton: Ichi']='Nukes', ['Hyoton: Ni']='Nukes', ['Hyoton: San']='Nukes',
	['Hojo: Ichi']='Enfeebles', ['Hojo: Ni']='Enfeebles', ['Kurayami: Ichi']='Enfeebles', ['Kurayami: Ni']='Enfeebles',
	['Jubaku: Ichi']='Enfeebles', ['Dokumori: Ichi']='Enfeebles', ['Aisha: Ichi']='Enfeebles', ['Yurin: Ichi']='Enfeebles',
	['Tonko: Ichi']='Enhancing', ['Tonki: Ni']='Enhancing', ['Monomi: Ichi']='Enhancing', ['Myoshu: Ichi']='Enhancing',
	['Kakka: Ichi']='Enhancing', ['Migawari: Ichi']='Enhancing', ['Gekka: Ichi']='Enhancing', ['Yain: Ichi']='Enhancing',
	['Curing Waltz']='waltz', ['Curing Waltz II']='waltz', ['Curing Waltz III']='waltz', ['Divine Waltz']='waltz'
}

-------------------------------
--           Rules           --
-------------------------------

function precast(spell)
	if spell.action_type == 'Magic' or spell.action_type == 'Ninjutsu' then
		equip (sets.precast.FC.Standard)
		-- Weaponskills --
	elseif spell.type == 'WeaponSkill' then
		if sets.ws[spell.english] then	
			equip(sets.ws[spell.name])
		else
			equip(sets.ws['Savage Blade'])
		end
		-- Job Abilities --
	elseif spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])  
		end			
	end 
end	

function midcast(spell,act)
	local spellType = spell_maps[spell.name]
	if spell.action_type =='Magic' then
	-- Ninjutsu --
		if spell.Type =='Enhancing' then
			equip(sets.ninjutsu.SIRD)
		elseif spellType =='Utsu' then 
			equip(sets.ninjutsu.utsu)
		elseif spellType =='Enfeebles' then 
			equip(sets.ninjutsu.MACC)	
		elseif spellType =='Nukes' and 
			MagicBurstFlag == true then
				equip(sets.ninjutsu.burst) else
				equip(sets.ninjutsu.freenuke)
		end
	end
	if buffactive["Futae"] then 
		equip(sets.JA.Futae)
	end
end

 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AFTERCAST FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)
  if player.status == 'Idle' then
    equip(sets.idle['Standard'])
  elseif player.status == "Engaged" then
    if HybridTPFlag then
      equip(sets.Melee.Hybrid)
    elseif CritTPFlag then
        equip(sets.Melee.Crit)
    elseif AccFlag == 0 then
      if HasteFlag == 0 then
        equip(sets.tp.NoAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.NoAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.NoAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.NoAccuracy.HasteCap)
      end
    elseif AccFlag == 1 then
      if HasteFlag == 0 then
        equip(sets.tp.LowAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.LowAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.LowAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.LowAccuracy.HasteCap)
      end
    elseif AccFlag == 2 then
      if HasteFlag == 0 then
        equip(sets.tp.MidAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.MidAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.MidAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.MidAccuracy.HasteCap)
      end
    elseif AccFlag == 3 then
      equip(sets.tp.HighAccuracy)
    end
  end
end
 
function status_change(new,old)

  if new == "Idle" then
    equip(sets.status.Idle.DT)
  elseif new == "Engaged" then
    if HybridTPFlag then
      equip(sets.tp.Hybrid)
    elseif CritTPFlag then
        equip(sets.tp.Crit)
    elseif AccFlag == 0 then
      if HasteFlag == 0 then
        equip(sets.tp.NoAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.NoAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.NoAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.NoAccuracy.HasteCap)
      end
    elseif AccFlag == 1 then
      if HasteFlag == 0 then
        equip(sets.tp.LowAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.LowAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.LowAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.LowAccuracy.HasteCap)
      end
    elseif AccFlag == 2 then
      if HasteFlag == 0 then
        equip(sets.tp.MidAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.MidAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.MidAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.MidAccuracy.HasteCap)
      end
    elseif AccFlag == 3 then
      equip(sets.tp.HighAccuracy)
    end

  elseif sets.status[new] then
    equip(sets.status[new])
  end
  if buffactive['Sange'] then
    equip(gear.Shuriken.Happo)
  end

end

function lockstyle()
    if player.main_job == 'NIN' then send_command('@input /lockstyleset 21') end
end

function status_change(new,old)

  if new == "Idle" then
    equip(sets.idle['Standard'])
  elseif new == "Engaged" then
    if HybridTPFlag then
      equip(sets.tp.Hybrid)
    elseif CritTPFlag then
        equip(sets.tp.Crit)
    elseif AccFlag == 0 then
      if HasteFlag == 0 then
        equip(sets.tp.NoAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.NoAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.NoAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.NoAccuracy.HasteCap)
      end
    elseif AccFlag == 1 then
      if HasteFlag == 0 then
        equip(sets.tp.LowAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.LowAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.LowAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.LowAccuracy.HasteCap)
      end
    elseif AccFlag == 2 then
      if HasteFlag == 0 then
        equip(sets.tp.MidAccuracy.Haste0)
      elseif HasteFlag == 1 then
        equip(sets.tp.MidAccuracy.Haste15)
      elseif HasteFlag == 2 then
        equip(sets.tp.MidAccuracy.Haste30)
      elseif HasteFlag == 3 then
        equip(sets.tp.MidAccuracy.HasteCap)
      end
    elseif AccFlag == 3 then
      equip(sets.tp.HighAccuracy)
    end

  elseif sets.status[new] then
    equip(sets.status[new])
  end
  if buffactive['Sange'] then
    equip(gear.Shuriken.Happo)
  end

end
