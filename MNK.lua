Engaged_Modes = {"TP", "Hybrid" ,"DT"}
Engaged_Modes_Index = 1

send_command('bind f9 gs c set meleeTP')
send_command('bind f10 gs c set meleeHybrid')
send_command('bind f11 gs c set meleeDT')
send_command('bind f12 gs c reset gear')

function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
end

function get_sets()

	Cape = {}
	Cape_TP = {name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Cape_Crit = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+8',}}
	Cape_WSDA = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
  
	sets.idle = {}					-- Leave this empty.
	sets.melee = {}					-- Leave this empty
	sets.ws = {}					-- Leave this empty
	sets.ja = {}					-- Leave this empty
	sets.precast = {}				-- leave this empty    
	sets.midcast = {}				-- leave this empty    
	sets.aftercast = {}				-- leave this empty
	
	-----Idle-----
	
    sets.idle.normal = {
		ammo="Ginsen",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		right_ring="Defending Ring",
		left_ring="Shneddick Ring",
		back=Cape_TP	
	}
	
	-----TP-----
	
	sets.melee["TP"] = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Monk's Nodowa +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		body="Kendatsuba Samue +1",
		hands="Malignance Gloves",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		waist="Moonbow Belt",
		back=Cape_TP,
		legs="Hesychast's Hose +3",
		feet="Anchorite's Gaiters +3"
	}

	sets.melee["Hybrid"] = set_combine(sets.melee["TP"], {
		head="Kendatsuba Jinpachi +1",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
	})	
	
	sets.melee["DT"] = set_combine(sets.melee["TP"], {
		head="Malignance Chapeau",
		hands="Malignance Gloves",
		legs="Mpaca's Hose",
		feet="Malignance Boots"
	})

	sets.ja = {}
	sets.ja["Impetus"] = { body="Bhikku Cyclas +1" }
		
	-----WS-----
	
	sets.ws.base = {
		ammo="Knobkierrie",
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1",
		neck="Monk's Nodawa +1",
		waist="Moonbow Belt",
		left_ear="Sherida Earring",
		right_ear="Moonshade Earring",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back=Cape_Crit	
	}

	sets.ws["Victory Smite"] = set_combine(sets.ws.base, {
		neck="Fotia Gorget",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko +1",
		legs="Kendatsuba Hakama +1", 
		right_ear="Brutal Earring",
		back=Cape_Crit
	})
	
	sets.ws["Victory Smite"].Impetus = set_combine(sets.ws.base, {
		neck="Fotia Gorget",
		body="Bhikku Cyclas +1",
		hands="Ryuo Tekko +1",
		legs="Kendatsuba Hakama +1", 
		right_ear="Brutal Earring",
		back=Cape_WSDA
	})
	
    sets.ws["Shijin Spiral"] = set_combine(sets.ws.base, {
		head="Malignance Chapeau",
		neck="Fotia Gorget",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Kendatsuba Hakama +1",
		ring1="Ilabrat Ring",
		back=Cape_TP,
		feet="Malignance Boots"
	})
		
    sets.ws["Howling Fist"] = set_combine(sets.ws.base, {
		head="Mpaca's Cap",
		neck="Fotia Gorget",
		feet="Herculean Boots",
	})		
		
	sets.ws["Raging Fists"] = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Mpaca's Hose",
		feet="Herculean Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt",
		left_ear="Sherida Earring",
		right_ear="Moonshade Earring",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		back=Cape_WSDA
        }
		
	sets.ws["Asuran Fists"] = {
		ammo="Knobkierrie",
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba Sune-Ate +1",
		neck="Monk's Nodawa +1",
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Moonshade Earring",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back=Cape_Crit
        }	
	
	wsd = set_combine(sets.ws["Raging Fists"], {
	})
	
	kick = set_combine(sets.ws, { 
		head="Mpaca's Cap",		
		legs="Hesychast's Hose +3",
		feet="Anchorite's Gaiters +3"
        })

	sets.ws["Tornado Kick"] = kick
	sets.ws["Dragon Kick"] = kick	
	sets.ws["Howling Fist"] = wsd
	
	-----JA-----
 
	sets.ja["Chakra"] = {
	body="Anchorite's Cyclas +2",
	feet="Hesychast's Gloves"
	}
	
	sets.ja["Focus"] = {
	head="Anchorite's Crown +2"
	}
	
end	
 
function precast(spell)
	if sets.ja[spell.name] then
		equip(sets.ja[spell.name])        
	elseif sets.ws[spell.name] then
	if buffactive['Impetus'] and spell.english == "Victory Smite" then
		equip(sets.ws["Victory Smite"].Impetus) 
		else 
		equip(sets.ws[spell.name])        
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
        equip(sets.melee[meleeMode])

        if buffactive['Impetus'] then
            equip(sets.ja["Impetus"])
        end
    else
        equip(sets.idle.normal)
    end
end 

function self_command(command)
	if command == "set meleeTP" then
		Engaged_Modes_Index = 1
		send_command('@input /echo ----- Melee Mode: TP -----')
		set_gear(player.status)
	elseif command == "set meleeHybrid" then
		Engaged_Modes_Index = 2
		send_command('@input /echo ----- Melee Mode: Hybrid -----')
		set_gear(player.status)
	elseif command == "set meleeDT" then
		Engaged_Modes_Index = 3
		send_command('@input /echo ----- Melee Mode: DT -----')
		set_gear(player.status)
	elseif command == "reset gear" then
		local meleeMode = Engaged_Modes[Engaged_Modes_Index]
		send_command('@input /echo ----- Melee Mode: ' .. meleeMode .. ' -----')
		set_gear(player.status)
	end
end