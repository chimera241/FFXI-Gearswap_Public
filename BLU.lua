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
	send_command('bind f10 gs c Cycle WeaponSet')
	send_command('bind f11 gs c toggle idle set')
	send_command('bind f12 gs c blueeva')
  
   
	cape = {}
		cape_DD = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Crit.hit rate+10','Damage taken-5%',}}
		cape_nuke = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-8%',}}
		cape_wsd =  { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
		cape_eva = { name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}}


    HHands = {}
		HHands = { name="Herculean Gloves", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Accuracy+13','Attack+4',}}
	HFeet = {}    
        HFeet_tp = { name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','AGI+5','Attack+15',}}
		HFeet_wsd = { name="Herculean Boots", augments={'Attack+10','Weapon skill damage +4%','MND+2','Accuracy+8',}}
		HFeet_th = { name="Herculean Boots", augments={'Enmity-3','Pet: "Dbl. Atk."+1','"Treasure Hunter"+1','Accuracy+19 Attack+19','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
   

		-- Weapon Sets --
	
	Weapon_Sets = {"Savage", "Naegling/Sakpata", "Maxentius/Thibron", "Nuking", "OmenDef"}
	WeaponSetsIndex = 1	

	sets.weapons = {}
	sets.weapons["Savage"] = {main = "Naegling", sub = "Thibron"}
	sets.weapons["Naegling/Sakpata"]  = {main = "Naegling", sub = "Sakpata's Sword"}
	sets.weapons["Maxentius/Thibron"] = {main = "Maxentius", sub = "Thibron"}
	sets.weapons["Nuking"] = {main = "Maxentius", sub = "Bunzi's Rod"}
	sets.weapons["OmenDef"] = {main = "Sakpata's Sword", sub = "Bunzi's Rod"}

        --idle Sets--  
	sets.idle = {}
       
		idle_mode = {'Standard', 'DT', 'Eva'}
		idle_ind = 1                   
       
        sets.idle.Standard = { --21% DT, 10% PDT, 8 Refresh
			ammo="Homilary", --1 Refresh
			head="Malignance Chapeau", --6% DT, 91 Eva, 123 MEva
			neck="Sibyl Scarf", --1 Refresh
			ear1="Ethereal earring", 
			ear2="Malignance Earring",
			body="Jhakri Robe +2", --4 Refresh
			hands="Malignance Gloves", --5% DT, 80 Eva, 112 MEva
			ring1="Stikini Ring +1", --1 Refresh
			ring2="Stikini Ring +1", --1 Refresh
			back=cape_DD, --10% PDT
			waist="Fucho-no-obi", --1 Refresh (context)
			legs="Carmine Cuisses +1", --18% move sp
			feet="Malignance Boots" --4% DT 150 MEva
		}
		
		sets.idle.DT = set_combine(sets.idle.Standard, { --50% DT
			ammo="Staunch Tathlum +1", --3% DT
			neck="Loricate Torque +1", --6% DT
			ear1="Odnowa Earring +1", --3% DT
			ear2="Hearty Earring",
			body="Malignance Tabard",--9% DT, 102 Eva, 139 MEva
			hands="Malignance Gloves", --5% DT, 80 Eva, 112 MEva
			ring1="Warden's Ring",
			ring2="Defending Ring", --10% DT
			waist="Flume Belt", --3% PDT
			legs="Nyame Flanchard" --8% DT, 150 MEva
        })    

		sets.idle.Eva = set_combine(sets.idle.DT, { --47% DT, 10% PDT, 
			head="Nyame Helm", --7% DT, 91 Eva, 123 MEva
			neck="Bathy Choker +1", --15 Eva
			ear1="Eabani Earring",
			ear2="Infused Earring",
			body="Nyame Mail", --9% DT, 102 Eva, 139 MEva
			ring1="Shneddick Ring",
			back=cape_eva,
			waist="Kasiri Belt",
			feet="Nyame Sollerets" --5% DT, 119 Eva, 150 MEva
		})				
			
        --tp Sets--
	sets.tp = {}
 
        tp_mode = {'Hybrid', 'Standard', 'DT', 'MEva'}
        --1=Standard, 2=Accuracy, 3=DT--
        tp_ind = 1
       
	   sets.tp['Standard'] = {
			ammo="Ginsen",
			head="Adhemar Bonnet +1", 
			neck="Mirage Stole +2", 
			ear1="Cessance Earring", 
			ear2="Telos Earring",
			body="Adhemar Jacket +1",
			hands="Adhemar Wristbands +1",
			ring1="Epona's Ring",
			ring2="Petrov Ring",
			back=cape_DD, 
			waist="Salifi Belt +1",
			legs="Samnuha Tights",
			feet=HFeet_tp
		}

		sets.tp['Hybrid'] = set_combine(sets.tp['Standard'], { -- Set = 41% DT, 10% PDT
			ammo="Staunch Tathlum +1", --3% DT
			head="Malignance Chapeau", --6% DT, 123 MEva
			body="Malignance Tabard", --9% DT 139 MEva
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

        sets.ws['Savage Blade'] = {
			ammo="Crepuscular Pebble",
			head="Nyame Helm",
			neck="Rep. Plat. Medal",
			ear1="Moonshade earring",
			ear2="Ishvara earring",
			body="Assim. Jubbah +3",
			hands="Nyame Gauntlets",
			ring1="Epona's ring",
			ring2="Petrov Ring",
			back=cape_wsd, 
			waist="Sailfi Belt +1", 
			legs="Luhlaza Shalwar +3",
			feet="Nyame Sollerets"
		}
		
		sets.ws['Chant du Cygne'] = {
			ammo="Ginsen",
			head="Adhemar Bonnet +1",
			neck="Mirage Stole +2",
			ear1="Moonshade earring",
			ear2="Ishvara earring",
			body="Gleti's Cuirass",
			hands="Adhemar Wristbands +1",
			ring1="Epona's ring",
			ring2="Petrov Ring",
			back=cape_DD, 
			waist="Fotia Belt", 
			legs="Samnuha Tights",
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

		sets.ws['Requiescat'] = {
			ammo="Ginsen",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			ear1="Moonshade earring",
			ear2="Regal earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			ring1="Shiva ring +1",
			ring2="Metamorph Ring +1",
			back=cape_DD, 
			waist="Fotia Belt", 
			legs="Amalric Slops",
			feet="Jhakri Pigaches +2"
		}
		
        sets.ws['Black Halo'] = {
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
       
        sets.precast.FC.Blue = set_combine(sets.precast.FC.Standard, {
		})

		--Midcast Sets--

		--Blue Magic Sets--



	sets.BlueMagic = {}
		
        BlueMagic_mode = {'Off', 'On'} ---Override mode for Evasion casting set (odyssey/omen)
        BlueMagic_ind = 1                     
		
		sets.BlueMagic.Nukes = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace", 
			ear1="Fromisi Earring", 
			ear2="Moldavite Earring",
			body="Amalric Doublet +1", 
			hands="Amalric Gages +1",
			ring1="Metamorph Ring +1", 
			ring2="Shiva Ring +1",  
			back=cape_nuke,
			waist="Orpheus's Sash",
			legs="Luhlaza Shalwar +3",
			feet="Amalric Nails +1",
		}
		
		sets.BlueMagic.Nukes.Dark = set_combine(sets.BlueMagic.Nukes, {
			head="Pixie Hairpin +1",
		})		
        sets.BlueMagic.MACC = {
			ammo="Pemphredo Tathlum",
			head="Assimilator's Keffiyeh +3", --56 MACC
			neck="Mirage Stole +2", --25 MACC
			ear1="Regal Earring", --15 MACC Set Bonus
			ear2="Dignitary's Earring",
			body="Malignance Tabard", --50 MACC
			hands="Malignance Cuffs", --50 MACC
			ring1="Metamorph Ring +1", --11-16 MACC
			ring2="Stikini Ring +1", --11 MACC
			back=cape_nuke,
			waist="Acuity Belt +1", --15 MACC
			legs="Assimilator's Shalwar +3", --56 MACC
			feet="Malignance Boots", --50 MACC
		}
		
        sets.BlueMagic.MaxMACC = set_combine(sets.BlueMagic.MACC, {
			main="Maxentius",
			sub="Bunzi's Rod", --46 MACC
		})
		
        sets.BlueMagic.Skill = set_combine(sets.BlueMagic.MACC, {
			head="Jhakri Coronal +2",
			body="Jhakri Robe +2", 
			hands="Rawhide Gloves",
			ring2="Stikini Ring +1",  
			back=cape_nuke,
		})

		sets.BlueMagic.Conserve = set_combine(sets.BlueMagic.Skill, {
		waist="Luminary Sash",
		ring1="Mephitas's Ring +1"
		})

		sets.BlueMagic.BluCure = {
			head="Telchine Cap",
			neck="Aife's medal",
			ear1="Loquac. earring",
			ear2="Mendi. earring", --5 Cure Pot, 2 Conserve MP
			body="Vedic Coat", -- 10 Conserve MP
			hands="Telchine Gloves", --10% Cure Pot
			ring1="Mephitas's Ring +1", --8 Healing Magic
			ring2="Lebeche Ring", --3% Cure Pot
			back="Fi Follet Cape +1", --5 Conserve MP
			waist="Gishdubar Sash",
			legs="Carmine Cuisses +1", --18 Healing Magic
			feet="Carmine Greaves +1" --8 Conserve MP
			}
		
        sets.BlueMagic.Added = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace", 
			ear1="Regal Earring", 
			ear2="Dignitary's Earring",
			body="Jhakri Robe +2", 
			hands="Jhakri Cuffs +2",
			ring1="Stikini Ring +1", 
			ring2="Stikini Ring +1",  
			back=cape_nuke,
			waist="Eschan Stone",
			legs="Amalric Slops +1",
			feet="Amalric Nails +1",
			}	
		
		sets.BlueMagic.EvaSleep = set_combine(sets.idle.Eva, {
			ring1 = "Kishar Ring", 
			ring2 = "Defending Ring"
		})
		
		sets.BlueMagic.THnuke = set_combine(sets.BlueMagic.Nukes, {
			ammo="Perfect Lucky Egg",
			waist="Chaac Belt", 
			feet="Volte Boots"
		})
		
		sets.BlueMagic['On'] = {
			ammo="Staunch Tathlum +1", --3% DT
			head="Nyame Helm", --7% DT, 91 Eva, 123 MEva
			neck="Bathy Choker +1", --15 Eva
			ear1="Odnowa Earring +1", --3% DT
			ear2="Malignance Earring",
			body="Nyame Mail", --9% DT, 102 Eva, 139 MEva
			hands="Malignance Gloves", --5% DT, 80 Eva, 112 MEva
			ring1="Kishar Ring",
			ring2="Defending Ring", --10% DT,
			back=cape_eva,
			waist="Kasiri Belt",
			legs="Nyame Flanchard", --8% DT, 150 MEva
			feet="Malignance Boots" --4% DT 150 MEva
			}
			
        sets.BlueMagic['Off'] = {
			ammo="Pemphredo Tathlum",
			head="Assimilator's Keffieh +3", --46 MACC
			neck="Mirage Stole +2", --25 MACC
			ear1="Regal Earring", --15 MACC Set Bonus
			ear2="Dignitary's Earring",
			body="Malignance Tabard", --50 MACC
			hands="Malignance Cuffs", --50 MACC
			ring1="Stikini Ring +1", --11 MACC
			ring2="Metamorph Ring +1", --11-16 MACC
			back=cape_nuke,
			waist="Luminary Sash", --10 MACC
			legs="Aya. Cosciales +2", --45 MACC
			feet="Malignance Boots", --50 MACC
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
                                                       
        sets.Enhancing.Steps = {ammo="Honed tathlum",
			head="Whirlpool mask",ear2="Heartseeker earring",
			body="Thaumas coat",hands="Umuthi gloves",
			back="Letalis cape",waist="Chaac belt",legs="Manibozho brais",feet="Manibozho boots"}
                                                         
        --Job Ability Sets--
       
        sets.JA = {}
       
        sets.JA.ChainAffinity = {feet="Assim. Charuqs +1"}
       
        sets.JA.BurstAffinity = {feet="Assim. Shalwar +2"}
       
        sets.JA.Efflux = {legs="Mavi tayt +2"}
       
        sets.JA.AzureLore = {hands="Luh. bazubands +1"}
       
        sets.JA.Diffusion = {feet="Luhlaza Charuqs"}
                                                                           
                       
end
 

spell_maps = {
    ['Cure']='Cure',['Cure II']='Cure',['Cure III']='Cure',['Cure IV']='Cure',['Cure V']='Cure',['Cure VI']='Cure',
    ['Cura']='Curaga',['Cura II']='Curaga',['Cura III']='Curaga',
    ['Curaga']='Curaga',['Curaga II']='Curaga',['Curaga III']='Curaga',['Curaga IV']='Curaga',['Curaga V']='Curaga',
    -- Status Removal doesn't include Esuna or Sacrifice, since they work differently than the rest
    ['Poisona']='StatusRemoval',['Paralyna']='StatusRemoval',['Silena']='StatusRemoval',['Blindna']='StatusRemoval',['Cursna']='StatusRemoval',
    ['Stona']='StatusRemoval',['Viruna']='StatusRemoval',['Erase']='StatusRemoval',   
	['Cursna']='Cursna',
    ['Regen']='Regen',['Regen II']='Regen',['Regen III']='Regen',['Regen IV']='Regen',['Regen V']='Regen',
    ['Refresh']='Refresh',    
	['Spectral Floe']='nuke', ['Tenebral Crush']='darknuke', ['Silent Storm']='nuke', ['Searing Tempest']='nuke', ['Anvil Lightning']='nuke', ['Subduction']='nuke',
	['Sheep Song']='MACC', ['Magic Hammer']='MACC', ['Tourbillion']='MACC', ['Blank Gaze']='MACC', ['Feather Tickle']='MACC', ['Delta Thrust']='MACC', ['Actinic Burst']='MACC', ['Infrasonics']='MACC', 
	['Magic Fruit']='BluCure', ['White Wind']='BluCure', 
	['Battery Charge']='Refresh', ['Mighty Guard']='Conserve', ['Winds of Promvyion']='Conserve', ['Erratic Flutter']='Conserve', ['Mighty Guard']='Conserve', ['Carcharian Verve']='Conserve', 
	['Occultation']='Skill', ['Diamondhide']='Skill', 
	['Sudden Lunge']='Added', 
	['Dream Flower']='EvaSleep', ['Actinic Burst']='EvaSleep', 
	['Cruel Joke']='MaxMACC',
	['Entomb']='THnuke'
}  

-------------------------------
--           Rules           --
-------------------------------

function precast(spell)
	if spell.action_type == 'Magic' then
		if spell.skill == 'Blue Magic' then
			if player.status == 'Idle' and idle_ind == 3 and spell.english == "Dream Flower" then
				equip(set_combine(sets.idle.Eva, {ring1 = "Kishar Ring", ring2 = "Defending Ring"}))
			else				
				equip(sets.precast.FC.Standard)
			end
		else
			equip (sets.precast.FC.Standard)
		end	
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
	-- Blue Magic --
		if spell.skill == 'Blue Magic' then 
			if spellType =="nuke" then
				equip(sets.BlueMagic.Nukes)
			elseif spellType =='darknuke' then
				equip(sets.BlueMagic.Nukes.Dark)
			elseif spellType =='MACC' then
				equip(sets.BlueMagic.MACC)
			elseif spellType =='MaxMACC' then
				equip(sets.BlueMagic.MaxMACC)
			elseif spellType =='Skill' then
				equip(sets.BlueMagic.Skill)	
			elseif spellType =='Refresh' then
				equip(sets.Enhancing['Refresh'])					
			elseif spellType =='Conserve' then
				equip(sets.BlueMagic.Conserve)
			elseif spellType =='BluCure' then
				equip(sets.BlueMagic.BluCure)
			elseif spellType =='Added' then
				equip(sets.BlueMagic.Added)
			elseif spellType =='EvaSleep' then
				if BlueMagic_ind == 2 then
					equip(sets.BlueMagic.EvaSleep)	
				else
					equip(sets.BlueMagic.MACC)
				end
			elseif spellType =='THnuke' then
				equip(sets.BlueMagic.THnuke)				
			else
				equip(sets.BlueMagic.Base)
			end
		-- Enhancing Magic --
		elseif spell.skill == 'Enhancing Magic' then
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
    if player.main_job == 'BLU' then send_command('@input /lockstyleset 2') end
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
