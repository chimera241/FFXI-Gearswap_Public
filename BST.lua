function file_unload()
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')

	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')

	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
	send_command('unbind @b')
 
        end 

function get_sets()	
 
	send_command('bind f9 gs c toggle tp set')
	send_command('bind f10 gs c Cycle PetMode')
	send_command('bind f11 gs c toggle idle set')
	send_command('bind f12 gs c blueeva')
  
   
	cape = {}

	HHead = {}
		HHead_th = {name="Herculean Helm", augments={'Mag. Acc.+20','Rng.Atk.+29','"Treasure Hunter"+1','Accuracy+8 Attack+8','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}
    HHands = {}
		HHands = { name="Herculean Gloves", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Accuracy+13','Attack+4',}}
	HFeet = {}    
        HFeet_tp = { name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','AGI+5','Attack+15',}}
		HFeet_wsd = { name="Herculean Boots", augments={'Attack+10','Weapon skill damage +4%','MND+2','Accuracy+8',}}
		HFeet_th = { name="Herculean Boots", augments={'Enmity-3','Pet: "Dbl. Atk."+1','"Treasure Hunter"+1','Accuracy+19 Attack+19','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
   

		-- Weapon Sets --
	
	Weapon_Sets = {"Agwu", "Dolichenus", "Savage"}
	WeaponSetsIndex = 1	

	sets.weapons = {}
	sets.weapons["Agwu"] = {main = "Agwu's Axe", sub = ""}
	sets.weapons["Dolichenus"] = {main = "Kaja Axe", sub = ""}
	sets.weapons["Savage Blade"] = {main = "Naegling", sub = ""}

        --idle Sets--  
	sets.idle = {}
       
		idle_mode = {'Standard', 'ReadyMACC', 'ReadyPet'}
		idle_ind = 1                   
       
        sets.idle['Standard'] = { --21% DT, 10% PDT, 8 Refresh
			ammo="Staunch Tathlum +1", --3% DT
			head="Malignance Chapeau",
			neck="Loricate Torque +1", --6% DT
			ear1="Odnowa Earring +1", --3% DT
			ear2="Hearty Earring",
			body="Malignance Tabard",--9% DT, 102 Eva, 139 MEva
			hands="Malignance Gloves", --5% DT, 80 Eva, 112 MEva
			ring1="Shneddick Ring",
			ring2="Defending Ring", --10% DT
			waist="Flume Belt", --3% PDT
			legs="Nyame Flanchard", --8% DT, 150 MEva	
			feet="Malignance Boots", --5% DT, 80 Eva, 112 MEva		
		}
		
        sets.idle['ReadyMACC'] = set_combine(sets.idle['Standard'], { --21% DT, 10% PDT, 8 Refresh
			ammo="Staunch Tathlum +1", --3% DT
			head="Nyame Helm",
			neck="Adad Amulet", 
			ear1="Crepuscular Earring", --3% DT
			ear2="Enmerkar Earring",
			body="Udug Jacket",--9% DT, 102 Eva, 139 MEva
			hands="Nyame Gauntlets", --5% DT, 80 Eva, 112 MEva
			ring1="Shneddick Ring",
			ring2="Cath Palug Ring", --5% DT
			waist="Incarnation Sash", --3% PDT
			legs="Nyame Flanchard", --8% DT, 150 MEva	
			feet="Nyame Sollerets", --5% DT, 80 Eva, 112 MEva		
		})

        sets.idle['ReadyPet'] = { --21% DT, 10% PDT, 8 Refresh
			ammo="Staunch Tathlum +1", --3% DT
			head="Malignance Chapeau",
			neck="Loricate Torque +1", --6% DT
			ear1="Odnowa Earring +1", --3% DT
			ear2="Hearty Earring",
			body="Malignance Tabard",--9% DT, 102 Eva, 139 MEva
			hands="Malignance Gloves", --5% DT, 80 Eva, 112 MEva
			ring1="Shneddick Ring",
			ring2="Defending Ring", --10% DT
			waist="Flume Belt", --3% PDT
			legs="Nyame Flanchard", --8% DT, 150 MEva	
			feet="Malignance Boots", --5% DT, 80 Eva, 112 MEva		
		}		
			
        --tp Sets--
	sets.tp = {}
 
        tp_mode = {'Hybrid', 'Standard', 'DT', 'MEva'}
        --1=Standard, 2=Accuracy, 3=DT--
        tp_ind = 1
       
	   sets.tp['Standard'] = {
			ammo="Coiste Bodhar",
			head="Adhemar Bonnet +1", 
			neck="Anu Torque", 
			ear1="Eabani Earring", 
			ear2="Sherida Earring",
			body="Gleti's Cuirass",
			hands="Adhemar Wristbands +1",
			ring1="Gere Ring",
			ring2="Epona's Ring",
			back=cape_DD, 
			waist="Salifi Belt +1",
			legs="Gleti's Breeches",
			feet="Malignance Boots"
		}

		sets.tp['Hybrid'] = set_combine(sets.tp['Standard'], { -- Set = 41% DT, 10% PDT
			ammo="Staunch Tathlum +1", --3% DT
			head="Malignance Chapeau", --6% DT, 123 MEva
			body="Malignance Tabard", --9% DT 139 MEva
			ring1="Moonlight Ring",
			ring2="Defending Ring", --10% DT
			feet="Malignance Boots" --4% DT 150 MEva
		})
		
		sets.tp['DT'] = set_combine(sets.tp['Hybrid'], { -- Set = 51% DT
			neck="Loricate Torque +1", --6% DT
			ear1="Odnowa Earring +1", --2% MDT, 0-3% DT (Hides Aug)
			hands="Malignance Gloves", --5% DT, 112 MEva
			legs="Nyame Flanchard", --8% DT, 150 MEva
		})

		sets.tp['MEva'] = set_combine(sets.tp.DT, {
		})
      
        --Weaponskill Sets--
        sets.ws = {}

        sets.ws['Decimation'] = {
			ammo="Coiste Bodhar",
			head="Gleti's Mask",
			neck="Fotia Gorget",
			ear1="Lugra Earring +1",
			ear2="Sherida earring",
			body="Gleti's Cuirass",
			hands="Gleti's Gauntlets",
			ring1="Gere Ring",
			ring2="Epona's Ring",
			back=cape_DD, 
			waist="Fotia Belt", 
			legs="Gleti's Breeches",
			feet="Gleti's Boots"
		}
		
		sets.ws['Ruinator'] = {
			ammo="Coiste Bodhar",
			head="Gleti's Mask",
			neck="Fotia Gorget",
			ear1="Moonshade earring",
			ear2="Ishvara earring",
			body="Gleti's Cuirass",
			hands="Gleti's Gauntlets",
			ring1="Epona's ring",
			ring2="Regal Ring",
			back=cape_DD, 
			waist="Fotia Belt", 
			legs="Gleti's Breeches",
			feet="Gleti's Boots"
		}
		
		sets.ws['Decimation'] = {
			ammo="Ginsen",
			head="Gleti's Mask",
			neck="Fotia Gorget",
			ear1="Moonshade earring",
			ear2="Ishvara earring",
			body="Gleti's Cuirass",
			hands="Gleti's Gauntlets",
			ring1="Epona's ring",
			ring2="Regal Ring",
			back=cape_DD, 
			waist="Fotia Belt", 
			legs="Gleti's Breeches",
			feet="Gleti's Boots"
		}		
		
		sets.ws['Cloudsplitter'] = {
			ammo="Crepuscular Pebble",
			head="Nyame Helm",
			neck="Sibyl Scarf",
			ear1="Moonshade earring",
			ear2="Friomisi earring",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			ring1="Gere Ring",
			ring2="Shiva ring +1",
			back=cape_DD, 
			waist="Orpheus's Sash", 
			legs="Nyame Flanchard",
			feet="Nyame Sollerets"
		}
		
		sets.ws['Sanguine Blade'] = {
			ammo="Ginsen",
			head="Pixie Hairpin +1",
			neck="Sanctity Necklace",
			ear1="Friomisi earring",
			ear2="Regal earring",
			body="Amalric Doublet +1",
			hands="Jhakri Cuffs +2",
			ring1="Shiva ring +1",
			ring2="Stikini Ring +1",
			back=cape_nuke, 
			waist="Orpheus's Sash", 
			legs="Luhlaza Shalwar +3",
			feet="Amalric Nails +1"
		}

		sets.ws['Savage Blade'] = {
			ammo="Crepuscular Pebble",
			head="Nyame Helm",
			neck="Rep. Plat. Medal",
			ear1="Moonshade earring",
			ear2="Ishvara earring",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			ring1="Epona's ring",
			ring2="Petrov Ring",
			back=cape_DD, 
			waist="Sailfi Belt +1", 
			legs="Nyame Flanchard",
			feet="Nyame Sollerets"
		}
                                                                
--Magic--

	--Precast Sets--
		sets.precast = {}
	   
		sets.precast.FC = {}
	   
		sets.precast.FC.Standard = { --68%, plus 20% from traits
			head="Amalric Coif +1", --11%
			neck="Voltsurge Torque", --4%
			ear1="Loquac. Earring", --5%
			ear2="Malignance Earring", --4%
			body="Taeon Tabard", --8%
			hands="Taeon Gloves", --5%
			ring1="Prolix Ring", --2%
			ring2="Kishar Ring", --4%
			back=cape_eva, --Fi Follet +1 10% at R15 note: Not Augmented at moment
			waist="Witful Belt", --3%	
			legs="Gyve Trousers", --4%
			feet="Carmine Greaves +1" --8%
		}
       
        sets.precast.ready = set_combine(sets.precast.FC.Standard, {
	
		})

		--Pet Sets--
		
		sets.pet = {}
		
		sets.pet.physical ={
			ammo="Hesperiidae",
			head="Emicho Coronet +1",
			neck="Beastmaster's Charm +1",
			ear1="Crepuscular Earring",
			ear2="Enmerkar Earring",
			body="Nyame Mail",
			hands="Nukumi Manoplas +1",
			ring1="",
			ring2="C. Pa Ring",
			waist="Incarnation Sash",
			legs="Gleti's Breeches",
			feet="Gleti's Boots"		}
		
		sets.pet.macc = {
			ammo="",
			head="Nyame Helm",
			neck="Beastmaster's Charm +1",
			ear1="Crepuscular Earring",
			ear2="Enmerkar Earring",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			ring1="",
			ring2="C. Pa Ring",
			waist="Incarnation Sash",
			legs="Gleti's Breeches",
			feet="Nyame Sollerets"
		}
		
		sets.pet.mab = {
		}
		
        --Other Magic Midcast--
        sets.Enhancing = {}
        
		sets.Enhancing['Phalanx'] = {
			head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
			neck="Loricate Torque +1",
			ear1="Loquac. earring",
			ear2="Augment. earring",
			body={ name="Taeon Tabard", augments={'"Fast Cast"+4','Phalanx +3',}},
			hands={ name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
			ring1="Stikini Ring +1",
			ring2="Stikini Ring +1",
			back="Fi Follet Cape +1",
			waist="Pythia sash +1",
			legs={ name="Herculean Trousers", augments={'Attack+9','Haste+1','Phalanx +5','Accuracy+5 Attack+5','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
			feet={ name="Taeon Boots", augments={'"Cure" potency +5%','Phalanx +3',}}		
		}
		   
        sets.Enhancing['Stoneskin'] = set_combine(sets.Enhancing['Phalanx'], {
			neck="Stone Gorget",
			hands="Stone Mufflers",
			waist="Siegel sash",
		})		
			
		sets.Enhancing['Refresh'] = set_combine(sets.Enhancing['Phalanx'], {
			head="Amalric Coif +1",
			body="Telchine Chas.",
			hands="Telchine Gloves",
			waist="Gishdubar Sash",
			legs="Telchine Braconi",
			feet="Telchine Pigaches"
		})

        --Job Ability Sets--
       
        sets.JA = {}
		
end
 
spell_maps = {
-- Complete list of Ready moves to use with Sic & Ready Recast -5 Desultor Tassets.
['Purulent Ooze']=petmacc, ['Corrosive Ooze']=petmacc, 
}
-------------------------------
--           Rules           --
-------------------------------

function precast(spell)
	if spell.action_type == 'Magic' then
		equip (sets.precast.FC.Standard)
	elseif spell.type == 'Monster' then 
		equip (sets.precast.ready)
	elseif spell.type == 'WeaponSkill' then
		if sets.ws[spell.english] then	
			equip(sets.ws[spell.name])
		else
			equip(sets.ws['Savage Blade'])
		end	
	elseif spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english]) 
		end	
	end
end
      
function midcast(spell,act)
	local spellType = spell_maps[spell.name]
	if spell.action_type =='Magic' then
		if spell.skill == 'Enhancing Magic' then
			if sets.Enhancing[spell.english] then
				equip(sets.Enhancing[spell.english])
			else
				equip(sets.Enhancing['Phalanx'])
			end
		elseif spell.skill == 'Healing Magic' then
			equip(sets.BlueMagic.BluCure)
		end
	end
end

function pet_midcast(spell)
		if spell.type == 'Monster' then
			if spellType == 'petmacc' then
				equip(sets.pet.macc)
			elseif spellType == 'petphysical' then
				equip(sets.pet.physical)
			elseif spellType == 'petmab' then
				equip(sets.pet.mab)
			end
		end
	end
 
function aftercast(spell)
        if player.status == 'Engaged' then
                equip(sets.tp[tp_mode[tp_ind]])
        else
                equip(sets.idle[idle_mode[idle_ind]])
        end
       
        if spell.action_type == 'Weaponskill' then
                add_to_chat(158,'tp Return: ['..tostring(player.tp)..']')
        end
end

function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.type == "Monster" and not spell.interrupted then
		equip(set_combine(sets.midcast.Pet.WS, sets.midcast.Pet[state.CorrelationMode.value]))
	end
end

function status_change(new, old)
	set_gear(new)
end

function set_gear(status)
	if status == 'Engaged' then	
		local tp_mode = tp_mode[tp_ind]
		equip(sets.tp[tp_mode])
        lockstyle()				
	else
		local idle_mode = idle_mode[idle_ind]
		equip(sets.idle[idle_mode])
        lockstyle()		
	end
	local weaponSet = Weapon_Sets[WeaponSetsIndex]
	enable ('main', 'sub')
	equip(sets.weapons[weaponSet])
end

function lockstyle()
    if player.main_job == 'BST' then send_command('@input /lockstyleset 1') end
end

function self_command(command)
        if command == 'toggle tp set' then
			tp_ind = tp_ind +1
			if tp_ind > #tp_mode then tp_ind = 1 end
			send_command('@input /echo <----- TP Set changed to '..tp_mode[tp_ind]..' ----->')
			equip(sets.tp[tp_mode[tp_ind]])
        elseif command == 'toggle idle set' then
			idle_ind = idle_ind +1
			if idle_ind > #idle_mode then idle_ind = 1 end
			send_command('@input /echo <----- Idle Set changed to '..idle_mode[idle_ind]..' ----->')
			equip(sets.idle[idle_mode[idle_ind]])
		elseif command == 'equip tp set' then
			equip(sets.tp[tp_mode[tp_ind]])
        elseif command == 'equip idle set' then
			equip(sets.idle[idle_mode[idle_ind]])
		elseif command == "Cycle WeaponSet" then
			WeaponSetsIndex = WeaponSetsIndex % #Weapon_Sets + 1
			add_to_chat(122,  "Weapon Set: " .. Weapon_Sets[WeaponSetsIndex])
			set_gear(player.status)	
        elseif command == 'blueeva' then
			BlueMagic_ind = BlueMagic_ind +1
			if BlueMagic_ind > #BlueMagic_mode then BlueMagic_ind = 1 end
			send_command('@input /echo <----- Evasion Override changed to '..BlueMagic_mode[BlueMagic_ind]..' ----->')
			equip(sets.idle[idle_mode[idle_ind]])

        end
end
