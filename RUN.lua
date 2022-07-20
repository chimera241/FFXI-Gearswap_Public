Engaged_Modes = {"TP", "Hybrid" ,"PDT", "MEVA"}
Engaged_Modes_Index = 1

send_command('bind f9 gs c set meleeTP')
send_command('bind !f9 gs c set meleeHybrid')
send_command('bind ^f9 gs c set meleePDT')
send_command('bind f11 gs c toggle idle set')
send_command('bind f12 gs c reset gear')

function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
end

function get_sets()

	Ogma = {}
		Ogma.Tanking = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}}
		Ogma.TP = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
		Ogma.SIRD = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Spell interruption rate down-10%',}}
    HHands = {}
		HHands = { name="Herculean Gloves", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','Accuracy+13','Attack+4',}}
	HFeet = {}    
        HFeet_TP = { name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','AGI+5','Attack+15',}}
		HFeet_WSD = { name="Herculean Boots", augments={'Attack+10','Weapon skill damage +4%','MND+2','Accuracy+8',}}
		HFeet_TH = { name="Herculean Boots", augments={'Enmity-3','Pet: "Dbl. Atk."+1','"Treasure Hunter"+1','Accuracy+19 Attack+19','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
    -- Idle Sets --
    sets.idle = {}  

	idle_mode = {'Standard', 'Phalanx'}
	idle_ind = 1  
   
    sets.idle['Standard'] = { --49 DT, 25 PDT2, 599
				main="Epeolatry", --25 PDT2
				sub="Utu Grip",
				ammo="Staunch Tathlum +1", --3 DT
				head="Nyame Helm", --7 DT, 123 MEva
				neck="Loricate Torque +1", --6 "Futhark Torque +2", --7DT, 30MEva
				ear1="Hearty Earring",
				ear2="Odnowa Earring +1", --3 DT 
				body="Nyame Mail", --9 DT, 139 MEva
				hands="Nyame Gauntlets", --3 DT, 37 MEva
				ring1="Shneddick Ring", 
				ring2="Defending Ring", --10 DT
				back=Ogma.Tanking, 
				waist="Flume Belt", --4 PDT
				legs="Nyame Flanchard", --8 DT, 150 MEva
				feet="Nyame Sollerets" --7 DT, 150 MEva 
				}

    sets.idle['Phalanx'] = {
				ammo="Staunch Tathlum +1", --10%--
				neck="Moonlight Necklace", --15%-- 
				head="Fu. Bandeau +3", --Phalanx +7--
				body="Taeon Tabard", --Phalanx +3--
				hands="Taeon Gloves", --Phalanx +3--
				ring1="Moonlight Ring", 
				ring2="Defending Ring",
				back=Ogma.SIRD, 
				waist="Audumbla Sash", --10%--
				legs="Herculean Trousers", --Phalanx +5--
				feet="Taeon Boots" --Phalanx +3--
				}
   
   
    -- TP/Engaged sets --
    sets.melee = {}
   
    sets.melee["TP"] = {
				sub="Utu Grip", 
				ammo="Ginsen",
				head="Adhemar Bonnet +1",
				neck="Anu Torque",
				ear1="Telos Earring",
				ear2="Sherida Earring",
				body="Adhemar Jacket +1",
				hands="Adhemar Wristbands +1",
				ring1="Epona's Ring",
				ring2="Niqmaddu Ring",
				back=Ogma.TP, 
				waist="Sailfi Belt +1",
				legs="Samnuha Tights",
				feet=HFeet_TP
				}
   
    sets.melee["Hybrid"] = { --29% DT, 46 PDT, 71% PDT inc Epeo--
				sub="Utu Grip", 
				ammo="Ginsen",
				head="Aya. Zucchetto +2", --3--
				neck="Futhark Torque +2", --7--
				ear1="Telos Earring",
				ear2="Sherida Earring",
				body="Ayanmo Corazza +2", --6--
				hands="Turms Mittens +1", 
				ring1="Epona's Ring",
				ring2="Defending Ring", --10--
				back=Ogma.TP, --10 PDT--
				waist="Sailfi Belt +1",
				legs="Eri. Leg Guards +1", --7 PDT--
				feet="Aya. Gambieras +2" --3--
				}
   
    sets.melee["PDT"] = { --37 DT, 84 PDT inc Epeo--
				sub="Refined Grip +1", 
				ammo="Staunch Tathlum +1",
				head="Nyame Helm",
				neck="Futhark Torque +2",
				ear1="Hearty Earring",
				ear2="Ethereal Earring",
				body="Nyame Mail",
				hands="Turms Mittens +1",
				ring1="Ayanmo Ring",
				ring2="Defending Ring",
				back=Ogma.Tanking, 
				waist="Flume Belt",
				legs="Eri. Leg Guards +1",
				feet="Nyame Sollerets"
				}
   
    sets.melee["MEVA"] = {
				sub="Refined Grip +1", 
				ammo="Staunch Tathlum",          
				head="Rune. Bandeau +2",
				neck="Futhark Torque +2",
				ear1="Hearty Earring",
				ear2="Ethereal Earring",
				body="Runeist's Coat +2",
				hands="Turms Mittens +1",
				ring1="Moonlight Ring",
				ring2="Defending Ring",
				back=Ogma.Tanking, 
				waist="Flume Belt",
				legs="Rune. Trousers +1",
				feet="Turms Leggings +1"
				}
 
    -- JA Sets for Precast Function -- 
    sets.JA = {}
	
		
	sets.JA.enmity = { --109 inc Epeo, 35% SIRD--
				head="Fu. Bandeau +3",
				neck="Futhark Torque +2", --15, 15%--
				ear1="Cryptic Earring", --4--
				ear2="Friomisi Earring", --2--
				body="Emet Harness +1", --10--
				hands="Kurys Gloves", --9--
				ring1="Supershear Ring", --5--
				ring2="Petrov Ring", --4--
				back=Ogma.SIRD, --10%--
				waist="Audumbla Sash", --10% 
				legs="Eri. Leg Guards +1", --11--
				feet="Eri. Greaves +1" --6--
				}   
					
    sets.JA['Elemental Sforzo'] = {body="Futhark Coat +3"}
    sets.JA['Vallation'] = set_combine(sets.JA.enmity, {					
				body="Runeist's Coat +2", --10--
				})

    sets.JA['Valiance'] = set_combine(sets.JA.enmity, {					
				body="Runeist's Coat +2", --10--
				})	
				
    sets.JA['Pflug'] = set_combine(sets.JA.enmity, {feet="Runeist Bottes +1"})
    sets.JA['Swordplay'] = {hands="Futhark Mitons +1"}
    sets.JA['Gambit'] = {hands="Runeist Mitons +1"}
    sets.JA['Liement'] = sets.JA.enmity
				
    sets.JA['Battuta'] = {head="Fu. Bandeau +3"}
   
    sets.JA['Lunge'] = {ammo="Dosis Tathlum",
		head="Highwing Helm",
		body="Rawhide Vest",
		hands="Leyline Gloves",
		legs="Perdition Slops",
		feet={ name="Qaaxo Leggings", augments={'Attack+15','"Mag.Atk.Bns."+15','STR+12',}},
		neck="Eddy Necklace",
		waist="Yamabuki-no-Obi",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Acumen Ring",
		right_ring="Fenrir Ring +1",
		back="Argocham. Mantle"
	}
	
	sets.JA['Swipe'] = sets.JA['Lunge']

	sets.JA['Embolden'] = {back="Evasionist's Cape"}

	sets.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",legs="Runeist Trousers +1"}

	sets.JA['Rayke'] = {feet="Futhark Bootes +1"}

	sets.JA['Ignis'] = sets.JA.enmity
	sets.JA['Gelus'] = sets.JA.enmity
	sets.JA['Flabra'] = sets.JA.enmity
	sets.JA['Teluus'] = sets.JA.enmity
	sets.JA['Sulpor'] = sets.JA.enmity
	sets.JA['Unda'] = sets.JA.enmity
	sets.JA['Lux'] = sets.JA.enmity
	sets.JA['Tenebrae'] = sets.JA.enmity
	
    --WS Resolution Set --

    sets.ws = {}
	
	sets.ws["Dimidiation"] = {
				ammo="Knobkierrie",
				head="Herculean Helm",
				neck="Caro Necklace", 
				ear1="Moonshade Earring",
				ear2="Sherida Earring",
				body="Adhemar Jacket +1",
				hands="Meg. Gloves +2",
				ring1="Epona's Ring",
				ring2="Niqmaddu Ring",
				back=Ogma.TP, 
				waist="Sailfi Belt +1",
				legs="Lustratio Subligar +1",
				feet="Lustratio leggings +1"
				}

	sets.ws["Resolution"] = {
				head="Adhemar Bonnet +1",
				neck="Fotia Gorget",
				ear1="Moonshade Earring",
				ear2="Sherida Earring",
				body="Adhemar Jacket +1",
				hands="Meg. Gloves +2",
				ring1="Epona's Ring",
				ring2="Niqmaddu Ring",
				back=Ogma.TP, 
				waist="Fotia Belt",
				legs="Samnuha Tights",
				feet=HFeet_TP	
				}

	sets.ws["Shockwave"] = {
				Heaad="Ayanmo Zucchetto +2",
				neck="Sanctity Necklace",
				ear1="Moonshade Earring",
				ear2="Sherida Earring",
				body="Ayanmo Corazza +2",
				hands="Ayanmo Manopolas +2",
				ring1="Stikini Ring +1",
				ring2="Stikini Ring +1",
				back=Ogma.TP,
				waist="Sailfi Belt +1",
				legs="Ayanmo Cosciales +2",
				feet="Ayanmo Gambieras +2"
				}
				
	sets.ws["Full Break"] = sets.ws["Shockwave"]
	sets.ws["Armour Break"] = sets.ws["Shockwave"]
	sets.ws["Weapon Break"] = sets.ws["Shockwave"]
	sets.ws["Upheaval"] = sets.ws["Resolution"]

	
    -- Precast Spell sets --
    sets.precast = {}

    sets.precast.fc = {     --62%--
		ammo="Impatiens", 
		head="Rune. Bandeau +2", --12%--
		neck="Voltsurge Torque", --4%-- 
		ear1="Loquac. Earring", --2%--
		ear2="Etoliation Earring", --1%--
		body="Taeon Tabard", --8%--
		hands="Runeist Mitons +1", --5%--
		ring1="Prolix Ring", --2%--
		ring2="Kishar Ring", --4%--
		back=Ogma_SIRD, --10%--
		waist="Sailfi Belt +1", 
		legs="Aya. Cosciales +2", --6%--
		feet="Carmine Greaves +1" --8%--
		}
					
	sets.precast.fc.enhancing = set_combine(sets.precast.fc, {
		legs="Futhark Trousers +2"
		})

    --Midcast--
    sets.midcast = {}

	sets.midcast.base = { ---Enhancing Skill Set----
		ammo="Staunch Tathlum +1", --11 SIRD--
		head="Carmine Mask +1", --11 skill--
		neck="Moonlight Necklace", --15% SIRD--
		ear1="Odnowa Earring +1",
		ear2="Andoaa Earring",
		body="Taeon Tabard",
		hands="Taeon Gloves",
		ring1="Stikini Ring +1", --8 skill--
		ring2="Stikini Ring +1", --8 skill--
		back=Ogma.Tanking,
		waist="Audumbla Sash",
		legs="Carmine Cuisses +1", --20% SIRD, 18 skill--
		feet="Carmine Greaves +1" --FC and 4% PDT--
		}
					
	sets.midcast.duration = set_combine(sets.midcast.base,{
		head="Erilaz Galea +1", 
		legs="Fu. Trousers +2",
		waist="Gishdubar Sash"
		})
			
	sets.midcast.regen = set_combine(sets.midcast.base,{
		head="Rune. Bandeau +2", 
		legs="Fu. Trousers +1"
		})			

	sets.midcast.SIRD = set_combine(sets.midcast.base,{ --91%--
		ammo="Staunch Tathlum +1", --11%--
		head="Agwu's Cap", --10%
		neck="Moonlight Necklace", --15%-- 
		hands="Rawhide Gloves", --15%--
		back=Ogma.SIRD, --10%--
		ring2="Evanescence Ring", --5%--
		waist="Audumbla Sash", --10%--
		legs="Carmine Cuisses +1" --20%--
		})
					
	sets.midcast.phalanx = { --Phalanx +21, 25% SIRD--
		ammo="Staunch Tathlum +1", --10%--
		neck="Moonlight Necklace", --15%-- 
		head="Fu. Bandeau +3", --Phalanx +7--
		body="Taeon Tabard", --Phalanx +3--
		hands="Taeon Gloves", --Phalanx +3--
		ring1="Moonlight Ring", 
		ring2="Defending Ring",
		back=Ogma.SIRD, 
		waist="Audumbla Sash", --10%--
		legs="Herculean Trousers", --Phalanx +5--
		feet="Taeon Boots" --Phalanx +3--
		}
	
	sets.midcast.enmity = { --109 inc Epeo, 35% SIRD--
		head="Fu. Bandeau +3",
		neck="Moonlight Necklace", --15, 15%--
		ear1="Cryptic Earring", --4--
		ear2="Friomisi Earring", --2--
		body="Emet Harness +1", --10--
		hands="Kurys Gloves", --9--
		ring1="Moonlight Ring",
		ring2="Defending Ring",
		back=Ogma.SIRD, --10%--
		waist="Audumbla Sash", --10% 
		legs="Eri. Leg Guards +1", --11--
		feet="Eri. Greaves +1" --6--
		}					
 
-----Automatic Assigning Enfeebling/Enhancing Magic Sets----- NEEDS CHANGING THIS IS FROM RDM!!!!!-----
 -----Enfeebling------
 -----enmity------
sets.midcast["Flash"] = sets.midcast.enmity
sets.midcast["Foil"] = sets.midcast.enmity
sets.midcast["Poisonga"] = sets.midcast.enmity
sets.midcast["Stun"] = sets.midcast.enmity
-----SIRD-----
sets.midcast["Ice Spikes"] = sets.midcast.SIRD
sets.midcast["Shock Spikes"] = sets.midcast.SIRD
sets.midcast["Jettatura"] = sets.midcast.SIRD
sets.midcast["Blank Gaze"] = sets.midcast.SIRD
sets.midcast["Sheep Song"] = sets.midcast.SIRD
sets.midcast["Cocoon"] = sets.midcast.SIRD 
 -----Enhancing-----
sets.midcast["Phalanx"] = sets.midcast.phalanx
sets.midcast["Refresh"] = sets.midcast.duration
sets.midcast["Temper"] = sets.midcast.base
sets.midcast["Regen"] = sets.midcast.regen
 -----Barspells-----
sets.midcast["Barfire"] = sets.midcast.duration
sets.midcast["Barblizzard"] = sets.midcast.duration
sets.midcast["Baraero"] = sets.midcast.duration
sets.midcast["Barstone"] = sets.midcast.duration
sets.midcast["Barthunder"] = sets.midcast.duration
sets.midcast["Barwater"] = sets.midcast.duration
sets.midcast["Baramnesia"] = sets.midcast.duration
sets.midcast["Barparalyze"] = sets.midcast.duration
sets.midcast["Barsilence"] = sets.midcast.duration
sets.midcast["Barslow"] = sets.midcast.duration
sets.midcast["Barpoison"] = sets.midcast.duration

end

--Precast Actions--

function precast(spell)
    -- print_set(spell) --print out the spell structure to chat log. Useful for debugging. Uncomment to use
    if spell.type == 'WeaponSkill' then
        --Check to see if we have the specific weaponskill set defined, if we do, use it, if not, use the generic sets.ws
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.precast.fc.enhancing)
    elseif spell.action_type == 'Magic' then
        --Just use a magic fast cast set
        equip(sets.precast.fc)
    elseif spell.action_type == 'Ability' then
        --If we have a set for jobability defined, use it
        if sets.JA[spell.name] then
            equip(sets.JA[spell.name])
        end
    end

end
 
--Midcast functions for spells--
 
function midcast(spell)
	-- print_set(spell)
	if spell.action_type == 'Magic' then   
		-- Custom Magic Sets --
		if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])           
			elseif spell.skill =='enhancing magic' then    
			if string.find(spell.english, "regen") then    
			equip(sets.midcast.enhancing.regen)
			end
		end
	end
end

--Aftercast function, returns user to TP set after actions/spells--
 
function aftercast(spell)
	set_gear(player.status)
end
 
function status_change(new, old)
	set_gear(new)
end

function set_gear(status)
	if status == 'Engaged' then
		local meleeMode = Engaged_Modes[Engaged_Modes_Index]
		equip(sets.melee[meleeMode])
	else
		local idle_mode = idle_mode[idle_ind]
		equip(sets.idle[idle_mode])
        lockstyle()	
	end
end 

function lockstyle()
	if player.main_job == 'RUN' then send_command('@input /lockstyleset 23')
	end
end

function self_command(command)
	if command == "set meleeTP" then
		Engaged_Modes_Index = 1
		send_command('@input /echo ----- Melee Mode: TP -----')
		set_gear(player.status)        
	elseif command == 'toggle idle set' then
		idle_ind = idle_ind +1
		if idle_ind > #idle_mode then idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to '..idle_mode[idle_ind]..' ----->')
		equip(sets.idle[idle_mode[idle_ind]])
	elseif command == "set meleeHybrid" then
		Engaged_Modes_Index = 2
		send_command('@input /echo ----- Melee Mode: Hybrid -----')
		set_gear(player.status)
	elseif command == "set meleePDT" then
		Engaged_Modes_Index = 3
		send_command('@input /echo ----- Melee Mode: PDT -----')
		set_gear(player.status)
	elseif command == "reset gear" then
		local meleeMode = Engaged_Modes[Engaged_Modes_Index]
		send_command('@input /echo ----- Melee Mode: ' .. meleeMode .. ' -----')
		set_gear(player.status)
	end
end