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


-- Get Sets: Everything in this section is run as soon as you change jobs.
function get_sets()

Cape = {}
    Cape_TP = { name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	Cape_WSD = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Cape_Jump = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10',}}

	sets = {}
	petcast = false
	-- Regular Sets --
	
	sets.idle= {}
	
	sets.idle.normal = { 
		ammo="Staunch Tathlum +1",
		head="Hjarrandi Helm",
		neck="Loricate Torque +1",
		ear1="Sherida Earring",
		ear2="Ethereal Earring",
		body="Hjarrandi Breast.",
		hands="Nyame Gauntlets",
		ring1="Defending Ring",
		ring2="Shneddick Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Carmine Cuisses +1",
		feet="Nyame Sollerets"}

	--TP Sets--

	sets.tp = {}
	
	sets.tp["TP"] = { --29% PDT, 17% MDT--
		ammo="Ginsen",
		head="Flamma Zucchetto +2",
		neck="Dragoon's Collar +2",
		ear1="Sherida Earring",
		ear2="Cessance Earring",
		body="Gleti's Cuirass", --12%--
		hands="Gleti's Gauntlets", --5%--
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=Cape_TP, --10% PDT--
		waist="Sailfi Belt +1",
		legs="Ptero. Brais +3", --2% PDT--
		feet="Flam. Gambieras +2"
		}
			  
	sets.tp["Hybrid"] = set_combine(sets.tp["TP"], { --39% PDT, 27% MDT--
		ammo="Staunch Tathlum +1",
		head="Hjarrandi Helm", --10%--
		ring1="Defending Ring" --10%--
		})
		
	sets.tp["DT"] = set_combine(sets.tp["TP"], { --49% PDT, 37% MDT--
		ammo="Staunch Tathlum +1",
		head="Hjarrandi Helm", --10%--
		hands="Nyame Gauntlets", --7%--
		body="Hjarrandi Breast.", --12%--
		ring1="Defending Ring", --10%--
		feet="Nyame Sollerets" --7%--
		})
			

	-- Can add a set for each WS by making a new set: sets.WS["Stardiver"] or sets.WS["Camlann's Torment"] for example
    sets.WS = { ammo="Knobkierrie",
        neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
        body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring", 
		waist="Fotia Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}
    
    multihit = set_combine(sets.WS, {
        head="Ptero. Armet +3", 
		hands="Sulv. Gauntlets +2", 
		body="Dagon Breast.",
        back=Cape_TP, 
		feet="Lustra. Leggings +1"})

	sets.WS["Stardiver"] = multihit
    sets.WS["Drakesbane"] = multihit

    wsd = set_combine(sets.WS, { 
        head="Valorous Mask", 
		ear1="Thrud Earring",
        back=Cape_WSD, 
		legs="Vishap Brais +3"
		})

    sets.WS["Impulse Drive"] = wsd
    sets.WS["Camlann's Torment"] = wsd
    sets.WS["Sonic Thrust"] = wsd
	sets.WS["Savage Blade"] = wsd

    --Fill out set with macc gear you want
    sets.WS["Leg Sweep"] = set_combine(sets.WS, {})

    -- Job Ability Sets --
	sets.JA = {}
	sets.JA.Jump = { ammo="Ginsen",
		head="Flamm. Zucchetto +2",
		neck="Anu Torque",
		ear1="Sherida Earring",
		ear2="Cessance Earring",
		body="Ptero. Mail +3",
		hands="Vis. Fng. Gaunt. +3",
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=Cape_Jump, 
		waist="Sailfi Belt +1",
		legs="Ptero. Brais +3",
		feet="Vishap Greaves +3"
		}
	
	sets.JA.Angon = {ammo="Angon",hands="Ptero. Fin. G. +3"} 
	-- Angon, Relic Hands, and that dumb earring in Mamook if you feel like it
	
	sets.JA.AncientCircle = {legs="Vishap Brais +3"} 
	-- Ancient Circle normally: 3 minute duration, Damage+15% DT-15% DragonKiller+15% against Dragons (10% vs. NMs)
	-- Ancient Circle with AF1: 4.5 minute duration, Damage+17% DT-17% DragonKiller+17% against Dragons (11% vs. NMs)
	
	sets.JA.SpiritLink = {head="Vishap Armet +1",ear1="Pratik Earring",hands="Pel. Vambraces +1",feet="Ptero. Greaves +3"} 
	-- Spirit Link/Empathy gear go here; note that Relic Feet will cause a 100% Wyvern to still drain HP (unless leveling up
	
	sets.JA.SpiritSurge = {neck="Chanoix's Gorget",ear1="Anastasi Earring",ear2="Lancer's Earring",
					body="Ptero. Mail +3",hands="Despair Fin. Gaunt.", 
					back="Updraft Mantle",legs="Vishap Brais +3",feet="Ptero. Greaves +3"} 
	-- Augmented Relic Body affects duration; Wyvern Max HP affects Spirit Surge's Max HP effect on you
	
	sets.JA.SteadyWing = {neck="Chanoix's Gorget",ear1="Anastasi Earring",ear2="Lancer's Earring",
					body="Emicho Haubert",hands="Despair Fin. Gaunt.", 
					back="Updraft Mantle",legs="Vishap Brais +3",feet="Ptero. Greaves +3"} 
	-- Wyvern Max HP strongly affects Steady Wing's Stoneskin effect
	
	-- Casting Sets --
	sets.FastCast = {ammo="Impatiens", 
					 head="Vishap Armet +1",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
					 body="Jumalik Mail",hands="Leyline Gloves", ring1="Lebeche Ring",ring2="Weather. Ring",
																							feet="Carmine Greaves +1"}
	-- Can add more FC and Quick Magic here for spells; AF1 Head recommended in case of GearSwap error, at least for faster spells
	
	sets.Midcast = {ammo="Staunch Tathlum", 
					head="Vishap Armet +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
					body="Jumalik Mail",hands="Founder's Gauntlets",ring1="Meridian Ring",ring2="Weather. Ring",
					back="Xucau Mantle",waist="Glassblower's Belt",legs="Founder's Hose",feet="Amm Greaves"}
	-- AF1 Head strongly advised for Healing Breath trigger
	-- HP or defensive stuff for Healing Breath; can use Fast Cast or Magic Acc. or whatever if you want too
	
	sets.Breath = {ammo="Staunch Tathlum",
				   head="Ptero. Armet +3",neck="Lancer's Torque",ear1="Anastasi Earring",ear2="Lancer's Earring",
				   body="Emicho Haubert",hands="Despair Fin. Gaunt.",
				   back="Updraft Mantle",waist="Glassblower's Belt",legs="Vishap Brais +1",feet="Ptero. Greaves +3"}
	-- Healing Breath is modified by Wyvern Max HP and Wyvern: Breath+
	-- Elemental Breaths are modified by Wyvern Current HP, Wyvern: Breath+, and Pet: Magic Accuracy
	-- Remove Status Breaths are presumably affected by nothing
end


-- Precast: JA and WS should be defined here, Fast Cast and such for magic. 
function precast(spell)
	if spell.type == "WeaponSkill" then
		if sets.WS[spell.name] then -- If you made a set for a WS and then use it,
		equip(sets.WS[spell.name])  -- it'll equip that set for that WS only
		else
		equip(sets.WS["Default"]) -- otherwise, it'll use this set instead
		end
	elseif spell.action_type == 'Magic' then 
		equip(sets.FastCast)
	elseif spell.name == 'Dismiss' and pet.hpp < 100 then		
		cancel_spell() -- Dismiss resets the Call Wyvern recast IF your Wyvern is at 100% HP; sorry to anyone who just wanted to kill their wyvern for the fun of it
		windower.add_to_chat(50,'  '..pet.name..' is below full HP (<pethpp>), cancelling Dismiss!')
	elseif spell.name == 'Call Wyvern' then
		if pet.isvalid then
		cancel_spell() -- Uses Spirit Link instead when your Wyvern is already present
		send_command('input /ja "Spirit Link" <me>')
		else
		equip(sets.JA.SpiritSurge) -- Relic Body goes here; can just use Spirit Surge set if you have it augmented
		end
	elseif spell.name == 'Spirit Surge' then
		equip(sets.JA.SpiritSurge)
	elseif spell.name == 'Spirit Surge' then
		equip(sets.JA.SpiritSurge)
	elseif spell.name == 'Steady Wing' then
		equip(sets.JA.SteadyWing)
	elseif spell.name == 'Angon' then
		equip(sets.JA.Angon)
	elseif spell.name == 'Ancient Circle' then
		equip(sets.JA.AncientCircle)
	elseif spell.name == 'Spirit Link' then
		if pet.isvalid then
			equip(sets.JA.SpiritLink)
		else
			cancel_spell() -- Uses Call Wyvern instead when your Wyvern isn't present
			send_command('input /ja "Call Wyvern" <me>')
		end
	elseif string.find(spell.name,"Jump") then -- Any spell or ability with the word Jump in it
		if not pet.isvalid then -- If you don't have a pet
			if spell.name == "Spirit Jump" then -- Forces Spirit Jump into regular Jump when Wyvern is dead
				cancel_spell()
				send_command('input /ja "Jump" <t>')
				return
			elseif spell.name == "Soul Jump" then -- Forces Soul Jump into High Jump when Wyvern is dead
				cancel_spell()
				send_command('input /ja "High Jump" <t>')
				return
			end
		end
		equip(sets.JA.Jump)
	end
end            
 
-- Midcast: For magic, this section affects your spell's potency, accuracy, etc. Unnecessary for JA/WS.
function midcast(spell)
	if spell.action_type == 'Magic' then 
        equip(sets.Midcast)
	end
end

-- Pet Change: Occurs when your Pet is summoned or killed.
function pet_change(pet,gain)
	if gain == false and pet.name then
		-- General announcement for when your Wyvern is killed, Dimissed, or eaten by Spirit Surge
		windower.add_to_chat(50,' *** '..string.upper(pet.name)..' IS DEAD YO ***')
	end
end
 
-- Aftercast: Occurs following the use of any WS, JA, Spell, Item, or Ranged Attack
function aftercast(spell)
	set_gear(player.status)
end

-- Status Change: When Engaging, Disengaging, Resting, Standing Up, etc.
function status_change(new, old)
	set_gear(new)
end

-- Pet Status Change
function pet_status_change(new,old)
	if new ~= "Engaged" then
	petcast = false
	end
end

-- A custom function that equips a set based on whether you're engaged or not.
function set_gear(status)
    if status == 'Engaged' then
        local meleeMode = Engaged_Modes[Engaged_Modes_Index]
        equip(sets.tp[meleeMode])
    else
        equip(sets.idle.normal)
    end
end 


function lockstyle()
    if player.main_job == 'DRG' then send_command('@input /lockstyleset 20') end
end
 
-- Manual commands sent in-game with //gs c <command>
function self_command(command)
	if command == 'petcast' and petcast then -- This command reverts to your regular gear 1.2 seconds after a Breath by default
		petcast = false
		equip_current() 
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