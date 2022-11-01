res = require('resources')

Weapon_Sets = {"Empty", "Maxentius", "Crocea/Daybreak", "Savage Blade"} --,"Sword""Crocea/Thibron", , "Savage Blade""Aeolian Edge", "Crocea/Thibron", "Crocea/Daybreak", "Crocea/Gleti's", --"Maxentius","Low TP"}
WeaponSetsIndex = 1

NukeSet = {"Low Acc", "High Acc", "Magic Burst"}
NukeSetIndex = 1

EngagedMode = {"Offense", "Tank", }
EngagedModeIndex = 1

PhysicalAccuracyMode = {"High Acc", "Low Acc", "Low TP"}
PhysicalAccuracyModeIndex = 1

IdleMode = {"Refresh", "Damage Taken"}
IdleModeIndex = 2

EnhancingMagicMode = {"Duration", "Potency"}
EnhancingMagicModeIndex = 1

MagicAccuracyMode = {"High Acc", "Low Acc"}
MagicAccuracyModeIndex = 1

EnspellActive = true
Kiting = false

MndEnfeebles = S{"Paralyze", "Paralyze II"
                , "Slow", "Slow II"
                , "Addle", "Addle II"
                , "Silence"
                , "Blind", "Blind II"
                , "Distract", "Distract II", "Distract III"
                , "Frazzle III"
            }

IntEnfeebles = S{"Bind"}

MagicAccEnfeebles = S{"Frazzle II", "Stun", "Gravity", "Gravity II", "Break", "Inundation", "Sleep", "Sleep II", "Dispel", "Dia", "Dia II", "Dia III"}


send_command("bind f9 gs c TankMode")

send_command("bind f10 gs c Cycle WeaponSet")
send_command("bind ^f10 gs c Cycle PhysicalAccuracyMode")
send_command("bind ~f10 gs c OffensiveMode")
send_command("bind @f10 gs c Toggle EnspellMode")

send_command("bind f11 gs c Cycle IdleMode")
send_command("bind ^f11 gs c RefreshSet")
send_command('bind @f11 gs c Toggle Kiting')


send_command("bind ^f12 gs c Cycle MagicMode")
send_command('bind @f12 gs c Cycle NukeSet')
send_command("bind !f12 gs c Cycle EnhancingMode")

send_command("bind f12 gs c RefreshSet")

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

    enable('main', 'sub')
end

function get_sets()

Cape = {}
    Cape_Int = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	Cape_Mnd = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	Cape_TP = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+9',}}
	Cape_WSD = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
MFeet= {}
	MFeet_FC = { name="Merlinic Crackows", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+7','Mag. Acc.+6','"Mag.Atk.Bns."+8',}}
	MFeet_Occult = { name="Merlinic Crackows", augments={'Mag. Acc.+17','"Occult Acumen"+11',}}


    sets.idle = {}

    sets.idle["Damage Taken"] = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		neck="Loricate torque +1",
		ear1="Etiolation earring",
		ear2="Sanare earring",
		body="Lethargy Sayon +2",
		hands="Malignance Gloves",
		ring1="Shneddick Ring",
		ring2="Defending ring",
		back=Cape_Int,
		waist="Flume Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
		}

    sets.idle["Refresh"] = set_combine(sets.idle["Damage Taken"], {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		neck="Sibyl Scarf",
		head="Vitiation chapeau +3",
		body="Jhakri Robe +2",
		ring1="Stikini ring +1",
		ring2="Stikini ring +1",		
		waist="Fucho-no-Obi",
		legs="Carmine Cuisses +1",
		feet="Chironic Slippers"
		})

    sets.kite = {
		legs="Carmine cuisses +1"
		}

    sets.ja = {}
	sets.ja["Convert"] = {}
	sets.ja["Saboteur"] = {hands="Lethargy gantherots +2"}
	sets.ja["Chainspell"] = {body="Vitiation tabard +3"}
	sets.ja["Valiance"] = {
		--ammo="Staunch Tathlum +1",
		--head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Cryptic Earring",
		ear2="Friomisi Earring",
		body="Emet Harness +1",
		hands="Merlinic Dastanas",
		ring1="Begrudging Ring",
		ring2="Supershear Ring",
		back=Cape_TP,
		waist="Sailfi Belt +1",
		legs="Carmine Cuisses +1",
		feet="Malignance Boots"
    }	
	sets.ja["Vallation"] = {
		--ammo="Staunch Tathlum +1",
		--head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Cryptic Earring",
		ear2="Friomisi Earring",
		body="Emet Harness +1",
		hands="Merlinic Dastanas",
		ring1="Begrudging Ring",
		ring2="Supershear Ring",
		back=Cape_TP,
		waist="Sailfi Belt +1",
		legs="Carmine Cuisses +1",
		feet="Malignance Boots"
    }	


	sets.weapons = {}
	sets.weapons["Empty"] = {}
	sets.weapons["Sword"] = {main = "Crocea Mors", sub="Ammurapi shield"}
	sets.weapons["Maxentius"] = {main = "Maxentius", sub="Genmei shield"}
	sets.weapons["Crocea/Thibron"] = {main = "Crocea Mors", sub="Thibron"}
	sets.weapons["Crocea/Gleti's"] = {main = "Crocea Mors", sub="Gleti's Knife"}
	sets.weapons["Crocea/Daybreak"] = {main = "Crocea Mors", sub="Daybreak"}
	sets.weapons["Savage Blade"] = {main = "Naegling", sub="Thibron"}
	sets.weapons["Aeolian Edge"] = {main = "Tauret", sub="Thibron"}
	sets.weapons["Low TP"] = {main= "Qutrub Knife", sub="Wind Knife", range="Kaja Bow"}
    
	sets.engaged = {
		ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",
		neck="Anu Torque",
		ear1="Telos Earring",
		ear2="Odnowa Earring +1",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		waist="Sailfi Belt +1",
		legs="Carmine Cuisses +1",
		feet="Malignance Boots",
		back=Cape_TP
    }

    sets.engaged["Low Acc"] = set_combine( sets.engaged, {
    })

    sets.engaged["High Acc"] = set_combine( sets.engaged, {
	})

    sets.engaged.enspell ={       
		neck="Duelist's Torque +2",
		hands="Aya. Manopolas +2",
		waist="Orpheus's Sash"
	}

    sets.engaged.dw = {}
    sets.engaged.dw["Low Acc"] = sets.engaged["Low Acc"], {
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6'}}
	}
    sets.engaged.dw["High Acc"] = set_combine(sets.engaged["High Acc"], {
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6'}}
    })

    sets.engaged.dw["Low Acc"].enspell = set_combine(sets.engaged.dw["Low Acc"], sets.engaged.enspell)
    sets.engaged.dw["High Acc"].enspell = set_combine(sets.engaged.dw["High Acc"], sets.engaged.enspell)
    
    sets.engaged.sw = {}
    sets.engaged.sw["Low Acc"] = sets.engaged["Low Acc"]
    sets.engaged.sw["High Acc"] = sets.engaged["High Acc"]

    sets.engaged.sw["Low Acc"].enspell = set_combine(sets.engaged.sw["Low Acc"], sets.engaged.enspell)
    sets.engaged.sw["High Acc"].enspell = set_combine(sets.engaged.sw["High Acc"], sets.engaged.enspell)

    sets.engaged.sw["Damage Taken"] = sets.engaged

    sets.fc = {   
		head="Atro. Chapeau +2", --14
		neck="Voltsurge torque", --4
		ear1="Lethargy earring +1", --8
    	ear2="Malignance earring", --4
		body="Viti. Tabard +3", --15
		hands="Malignance gloves",
    	ring1="Kishar Ring", --4
    	ring2="Prolix Ring", --5
    	waist="Embla Sash", --2
		back=Cape_Int,
		legs="Aya. Cosciales +2", --6
    	feet=MFeet_FC --12
    }

    sets.midcast = {}
    
    sets.midcast.cure = {
		main="Daybreak",
		subs="Sors Shield",
		head="Vanya Hood",
		body="Kaykaus Bliaut +1",
		ear1="Mendi. Earring",
		ear2="Magnetic Earring",
		hands="Kaykaus cuffs +1",
		ring1="Stikini ring +1",
		ring2="Mephitas's ring +1",
		waist="Luminary Sash",
		legs="Kaykaus Tights +1",		
		back="Fi Follet Cape +1",		
		feet="Kaykaus boots"
    }
	
	sets.midcast.cure["Cursna"] = set_combine(sets.midcast.cure, {
		neck="Malison Medallion",
		ring1="Menelaus's Ring",
		ring2="Haoma's Ring",
		feet="Vanya Clogs"
	})
	
	sets.midcast.enhancing = {}

    sets.midcast.enhancing = {
		sub="Daybreak",	
		sub="Ammurapi Shield",	
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		neck="Duelist's Torque +2",
		ear1="Lethargy Earring +1",
		ear2="Andoaa Earring",
		body="Viti. Tabard +3",
		hands="Leth. Gantherots +2",
		ring1="Stikini ring +1",
		ring2="Stikini ring +1",
		back="Ghostfyre Cape",
		waist="Embla Sash",
		legs="Lethargy Fuseau +2",
		feet="Leth. Houseaux +2"
        }

    sets.midcast.enhancing["Skill"] = {
		sub="Daybreak",	
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		neck="Duelist's Torque +2",
		ear1="Lethargy Earring +1",
		ear2="Andoaa Earring",
		body="Viti. Tabard +3",
		hands="Vitiation Gloves +2",
		ring1="Stikini ring +1",
		ring2="Stikini ring +1",
		back="Ghostfyre Cape",
		waist="Embla Sash",
		legs="Carmine Cuisses +1",
		feet="Leth. Houseaux +2"
        }
    
    sets.midcast.enhancing["Duration"] = set_combine(sets.midcast.enhancing["Skill"], {
		head="Telchine Cap",
		body="Lethargy Sayon +2",
		ear1="Lethargy Earring +1",
		hands="Atrophy Gloves +3",
		waist="Embla Sash",
		legs="Lethargy Fuseau +2",
		feet="Lethargy Houseaux +2",
		back="Ghostfyre Cape"
    })

    sets.midcast.enhancing.spikes = set_combine(sets.midcast.enhancing["Skill"], {
		legs="Vitiation tights +1"
    })

    sets.midcast.enhancing.gain = set_combine(sets.midcast.enhancing["Skill"], {
		hands="Vitiation Gloves +2"
    })	

    sets.midcast.enhancing.refresh = set_combine(sets.midcast.enhancing["Duration"], {
		head="Amalric Coif +1",
		legs="Lethargy Fuseau +2",
		left_ring="Defending Ring"
    })
	
	sets.midcast.enhancing.refresh.self = set_combine(sets.midcast.enhancing["Duration"], {
		head="Amalric Coif +1",
		body="Vitiation Tabard +3",
		hands="Atrophy Gloves +3",
		left_ring="Defending Ring",
		back="Ghostfyre Cape",
		waist="Embla Sash",
		legs="Lethargy Fuseau +2",
		feet="Lethargy Houseaux +2"
	})

    sets.midcast.enhancing.stoneskin = set_combine(sets.midcast.enhancing, {
		neck="Nodens Gorget",
		waist="Siegel Sash"
		})

    sets.midcast.enhancing.aquaveil = set_combine(sets.midcast.enhancing, {
		head="Amalric Coif +1",
		hands="Regal Cuffs"
		})
		
    sets.midcast.enhancing.phalanx = set_combine(sets.midcast.enhancing, {
		head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+4','Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}},
		legs={ name="Herculean Trousers", augments={'Attack+9','Haste+1','Phalanx +5','Accuracy+5 Attack+5','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		feet={ name="Taeon Boots", augments={'"Cure" potency +5%','Phalanx +3',}},
		})		

    sets.midcast.enhancing.regen = set_combine(sets.midcast.enhancing["Duration"], {
		head="Telchine Cap",
		body="Atrophy Tabard +3",
		legs="Telchine Braconi",
		back=Cape_Mnd
    })
	
	--Enfeebling--
	
    sets.midcast.enfeebling = {
		main="Contemplator +1", --50 MACC, 255 Enf Skill--
		sub="Enki Strap", --38 MACC--
		ammo="Regal Gem",	
		head="Vitiation chapeau +3",
		neck="Duelist's Torque +2",
		ear1="Digni. Earring",
		ear2="Regal Earring",
		body="Atro. Tabard +3",
		hands="Regal Cuffs",
		ring1="Stikini ring +1",
		ring2="Stikini ring +1",
		waist="Obstinate Sash",
		back=Cape_Int,
		legs="Chironic Hose",
		feet="Vitiation Boots +3"
    }
	
	sets.midcast.enfeebling.MACC = { ---481 MACC, 45% Duration, 50 Skill, 20 Potency---   
		main="Contemplator +1", --50 MACC, 255 Enf Skill--
		sub="Enki Strap", --38 MACC--
		range="Kaja Bow", --35 MACC--	
		head="Vitiation Chapeau +3", --45 MACC--
		neck="Duelist's Torque +2", --30 MACC, Potency 10, Duration 25--
		ear1="Snotra Earring", --10 MACC--
		ear2="Regal Earring", --15 MACC Set Bonus--
		body="Atrophy Tabard +3", --55 MACC, +15 MACC Set Bonus, 21 Skill--
		hands="Regal Cuffs", --45 MACC, 20% Duration---
		ring1="Stikini ring +1", --8 MACC--
		ring2="Stikini ring +1", --8 MACC--
		waist="Obstinate Sash", --10 MACC--
		back=Cape_Int, --20 MACC--
		legs="Chironic Hose", --54 MACC, Immuno +1, 13 Skill--
		feet="Vitiation Boots +3" --43 MACC, 10 Pot, 16 Skill--
    }
	
	sets.midcast.enfeebling.Potency = { --410 MACC, 55% Duration, 55 Skill, 44 Potency
		main="Contemplator +1", --50 MACC, 255 Enf Skill--
		sub="Enki Strap", --38 MACC--
		ammo="Regal Gem", --15 MACC, 10 Potency--
		head="Vitiation chapeau +3", --37 MACC, 26 Skill--
		neck="Duelist's Torque +2", --30 MACC, Potency 10, 25% Duration--
		ear1="Snotra Earring", --10 MACC--
		ear2="Regal Earring", --15 MACC Set Bonus--
		body="Lethargy Sayon +2", --54 MACC, 16 Potency---
		hands="Regal Cuffs", --45 MACC, 20% Duration---
		ring1="Stikini ring +1", --8 MACC--
		ring2="Stikini ring +1", --8 MACC--
		waist="Obstinate Sash", --10 MACC--
		back=Cape_Int, --20 MACC--
		legs="Chironic Hose", --54 MACC, Immuno +1, 13 Skill--
		feet="Vitiation Boots +3" --43 MACC, 10 Pot, 16 Skill--
    }

	sets.midcast.enfeebling.duration = { --340 MACC, 20 Potency, 85% Duration--
		main="Contemplator +1", --50 MACC, 255 Enf Skill--
		sub="Enki Strap", --38 MACC--
		ammo="Regal Gem", --15 MACC, 10 Potency--
		head="Atro. Chapeau +2", --45 MACC--
		neck="Duelist's Torque +2", --30 MACC, Potency 10, 25% Duration--
		ear1="Snotra Earring", --10 MACC, 10% Dutaion--
		ear2="Regal Earring", --15 MACC Set Bonus--
		body="Lethargy Sayon +2", --54 MACC, 16 Potency---
		hands="Regal Cuffs", --45 MACC, 20% Duration---
		ring1="Stikini ring +1", --8 MACC--
		ring2="Kishar ring", --5 MACC, 10% Duration--
		waist="Obstinate Sash", --10 MACC--
		back=Cape_Int, --20 MACC--
		legs="Lethargy Fuseau +1", --22 MACC, 10% Duration set bonus--
		feet="Lethargy Houseaux +2" --10% Duration set bonus--
    }

	sets.midcast.enfeebling.hybrid = { --415 MACC, 34 Potency, 29 Skill, 65% Duration--
		main="Crocea Mors", --50 MACC, 255 Enf Skill--
		sub="Ammurapi Shield", --38 MACC--
		ammo="Regal Gem", --15 MACC, 10 Potency--
		head="Atro. Chapeau +2", --45 MACC--
		neck="Duelist's Torque +2", --30 MACC, Potency 10, 25% Duration--
		ear1="Snotra Earring", --10 MACC--
		ear2="Regal Earring", --15 MACC Set Bonus--
		body="Lethargy Sayon +2", --54 MACC, 16 Potency---
		hands="Regal Cuffs", --45 MACC, 20% Duration---
		ring1="Stikini ring +1", --8 MACC--
		ring2="Kishar ring", --5 MACC, 10% Duration--
		waist="Luminary Sash", --10 MACC--
		back=Cape_Int, --20 MACC--
		legs="Chironic Hose", --54 MACC, Immuno +1, 13 Skill--
		feet="Vitiation Boots +3" --43 MACC, 10 Pot, 16 Skill--
    }
	
    sets.midcast.enfeebling.mnd = set_combine(sets.midcast.enfeebling, {
    })

    sets.midcast.enfeebling.mnd["High Acc"] = set_combine(sets.midcast.enfeebling.mnd, {
		body="Atrophy Tabard +3",
		right_ring="Sangoma Ring",
    })
            
    sets.midcast.enfeebling.mnd["Low Acc"] = set_combine(sets.midcast.enfeebling.mnd, {
		right_ring="Kishar Ring"
    })

    sets.midcast.enfeebling.int = set_combine(sets.midcast.enfeebling.MACC, {
		back=Cape_Int
    })
        
    sets.midcast.enfeebling.int["High Acc"] = set_combine(sets.midcast.enfeebling.int, {
		body="Atrophy Tabard +3",
		right_ring="Sangoma Ring"
    })
            
    sets.midcast.enfeebling.int["Low Acc"]= set_combine(sets.midcast.enfeebling.int, {
		body="Lethargy Sayon +2",
		right_ring="Kishar Ring"
    })

    sets.midcast.elemental = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo tathlum",
		head="Vitiation chapeau +3",
		neck="Sanctity Necklace",
		ear1="Barkarole earring",
		ear2="Friomisi earring",
		body="Amalric Doublet +1",
		hands="Amalric gages +1",
		left_ring="Freke Ring",
		right_ring="Shiva Ring +1",
		back=Cape_Int,
		waist="Eschan stone",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1"
		}
		
		        
    sets.midcast.dark_magic = set_combine(sets.midcast.elemental, {
		head="Pixie hairpin +1",
		neck="Erra pendant",
		ring1="Evanescence ring",
		waist="Fucho-no-obi",
    })
    
    sets.midcast.drain = set_combine(sets.midcast.dark_magic, {
		ring2="Excelsis ring",
		waist="Fucho-no-obi",
		feet="Merlinic crackows"
    })

    sets.midcast.aspir = sets.midcast.drain
	
	sets.midcast.emnity = {
		--ammo="Staunch Tathlum +1",
		--head="Bunzi's Hat",
		neck="Warder's Charm +1",
		ear1="Cryptic Earring",
		ear2="Friomisi Earring",
		body="Emet Harness +1",
		hands="Merlinic Dastanas",
		ring1="Begrudging Ring",
		ring2="Supershear Ring",
		back=Cape_TP,
		waist="Sailfi Belt +1",
		legs="Carmine Cuisses +1",
		feet="Malignance Boots"
    }	
		
    sets.midcast.elemental["Low Acc"] = set_combine(sets.midcast.elemental, {})
    sets.midcast.elemental["High Acc"] = set_combine(sets.midcast.elemental, {})
    sets.midcast.elemental["Magic Burst"] = set_combine(sets.midcast.elemental, {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		head="Ea Hat +1",
		neck="Mizu. Kubikazari",
		body="Ea Houppelande +1",
		hands="Ea Cuffs",
		left_ring="Mujin band",
		right_ring="Locus ring",
		legs="Merlinic Shalwar",
		feet=MFeet.MB
		})
			

----WS----

    sets.ws = {}
    
    sets.ws.magic = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		neck="Sanctity Necklace",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		body="Nyame Mail",
		hands="Jhakri Cuffs +2",
		ring1="Freke Ring",
		ring2="Epaminondas's Ring",
		back=Cape_WSD,
		waist="Orpheus's Sash",
		legs="Amalric Slops +1",
		feet="Lethargy Houseaux +2",
        }

    sets.ws.physical = {
		ammo="Oshasha's Treatise",
		head="Nyame Helm",
		neck="Rep. Plat. Medal",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ring1="Metamorph Ring +1",
		ring2="Epaminondas's Ring",
		back=Cape_WSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
    }
        
	sets.ws["Sanguine Blade"] = set_combine(sets.ws.magic, {
        head="Pixie Hairpin +1",
        back=Cape_WSD
    })

    sets.ws["Seraph Blade"] = set_combine(sets.ws.magic, {
        ammo="Regal Gem",
        back=Cape_Int
    })

    sets.ws["Black Halo"] = set_combine(sets.ws.physical, {
        ammo="Regal Gem",
        back=Cape_Int
    })
	
    sets.ws["Chant du Cygne"] = set_combine(sets.ws.physical, {
        ammo="Ginsen",
		head="Ayanmo Zucchetto +2",
        body="Ayanmo Corazza +2",
		hands="Jhakri Cuffs +2",
        legs="Viti. Tights +1",
        feet="Aya. Gambieras +2",
        right_ring="Begrudging Ring",
        back=Cape_Int
    })

    sets.ws["Requiescat"] = set_combine(sets.ws.physical, {
        ammo="Regal Gem",
        body="Viti. Tabard +3",
        hands="Atrophy Gloves +3",
        legs="Viti. Tights +3",
        feet="Vitiation Boots +3",
        waist="Luminary Sash",
        left_ring="Stikini Ring",
        right_ring="Ilabrat Ring",
    })
    
    sets.ws["Evisceration"] = set_combine(sets.ws.physical, {
        ammo="Ginsen",
        body="Ayanmo Corazza +2",
        legs="Viti. Tights +3",
        feet="Aya. Gambieras +2",
        left_ring="Apate Ring",
        right_ring="Ilabrat Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%'}}
    })

    sets.ws["Exenterator"] = set_combine(sets.ws.physical, {
        ammo="Ginsen",
        body="Ayanmo Corazza +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Anu Torque",
        left_ring="Apate Ring",
        right_ring="Ilabrat Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%'}}
    })
	
	sets.ws["Aeolian Edge"] = sets.ws.magic
	sets.ws["Red Lotus Blade"] = sets.ws.magic
	sets.ws["Shining Blade"] = sets.ws["Seraph Blade"]
	sets.ws["Circle Blade"] = sets.ws.physical
	sets.ws["Vorpal Blade"] = sets.ws.physical
	sets.ws["Requiescat"] = sets.ws.physical
	sets.ws["Savage Blade"] = sets.ws.physical
	sets.ws["Death Blossom"] = sets.ws["Savage Blade"]
	
-----Automatic Assigning Enfeebling/Enhancing Magic Sets-----
 -----Enfeebling------
 -----MACC------
 sets.midcast["Sleep"] = sets.midcast.enfeebling.MACC
 sets.midcast["Sleepga"] = sets.midcast.enfeebling.MACC
 sets.midcast["Sleep II"] = sets.midcast.enfeebling.MACC
 sets.midcast["Frazzle II"] = sets.midcast.enfeebling.MACC
 sets.midcast["Dispel"] = sets.midcast.enfeebling.MACC 
 sets.midcast["Dispelga"] = sets.midcast.enfeebling.MACC 
 sets.midcast["Stun"] = sets.midcast.enfeebling.MACC 
 sets.midcast["Gravity"] = sets.midcast.enfeebling.MACC
 sets.midcast["Bind"] = sets.midcast.enfeebling.MACC
 sets.midcast["Break"] = sets.midcast.enfeebling.MACC
 -----Potency-----
 sets.midcast["Slow"] = sets.midcast.enfeebling.Potency
 sets.midcast["Slow II"] = sets.midcast.enfeebling.Potency
 sets.midcast["Paralyze"] = sets.midcast.enfeebling.Potency
 sets.midcast["Paralyze II"] = sets.midcast.enfeebling.Potency
 sets.midcast["Addle"] = sets.midcast.enfeebling.Potency
 sets.midcast["Addle II"] = sets.midcast.enfeebling.Potency
 sets.midcast["Slow"] = sets.midcast.enfeebling.Potency
 sets.midcast["Slow II"] = sets.midcast.enfeebling.Potency
 sets.midcast["Blind"] = sets.midcast.enfeebling.Potency
 sets.midcast["Blind II"] = sets.midcast.enfeebling.Potency
 -----Hybrid-----
 sets.midcast["Distract III"] = sets.midcast.enfeebling.Hybrid
 sets.midcast["Frazzle III"] = sets.midcast.enfeebling.Hybrid
 sets.midcast["Silence"] = sets.midcast.enfeebling.Hybrid
 -----Skill-----
 sets.midcast["Dia III"] = sets.midcast.enfeebling.duration
 sets.midcast["Poison II"] = sets.midcast.enfeebling.duration
 -----Emnity-----
 sets.midcast["Flash"] = sets.midcast.emnity
 
 -----Enhancing-----
 -----Skill-----
 sets.midcast["Temper II"] = sets.midcast.enhancing["Skill"]
 sets.midcast["Enfire"] = sets.midcast.enhancing["Skill"]
 sets.midcast["Enstone"] = sets.midcast.enhancing["Skill"]
 sets.midcast["Enthunder"] = sets.midcast.enhancing["Skill"]
 sets.midcast["Enaero"] = sets.midcast.enhancing["Skill"]
 sets.midcast["Enwater"] = sets.midcast.enhancing["Skill"]
 sets.midcast["Enblizzard"] = sets.midcast.enhancing["Skill"]
 -----Gain Spells-----
 sets.midcast["Gain-Str"] = sets.midcast.enhancing.gain
 sets.midcast["Gain-Dex"] = sets.midcast.enhancing.gain
 sets.midcast["Gain-Int"] = sets.midcast.enhancing.gain
 sets.midcast["Gain-Mnd"] = sets.midcast.enhancing.gain
 sets.midcast["Gain-Agi"] = sets.midcast.enhancing.gain
 sets.midcast["Gain-Chr"] = sets.midcast.enhancing.gain
 sets.midcast["Gain-Vit"] = sets.midcast.enhancing.gain
-----Duration-----
 sets.midcast["Haste II"] = sets.midcast.enhancing["Duration"]
 sets.midcast["Regen II"] = sets.midcast.enhancing["Duration"]
 sets.midcast["Flurry II"] = sets.midcast.enhancing["Duration"]
 sets.midcast["Phalanx II"] = sets.midcast.enhancing["Duration"] 
 -----Refresh-----
 sets.midcast["Refresh III"] = sets.midcast.refresh
 -----Stoneskin-----
 sets.midcast["Stoneskin"] = sets.midcast.enhancing.stoneskin
 ----Stun-----
 sets.midcast["Stun"] = sets.midcast.enfeebling.MACC


end

function precast(spell)
    -- print_set(spell)
    if spell.action_type == "Magic" then
        equip(sets.fc)
    elseif spell.type == "WeaponSkill" then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        end
    elseif spell.type == "JobAbility" then
        if sets.ja[spell.name] then
            equip(sets.ja[spell.name])
        end
    end
end

function midcast(spell)
    -- print_set(spell)
    if spell.action_type == 'Magic' then   
        -- Custom Magic Sets --
        if sets.midcast[spell.english] then
            equip(sets.midcast[spell.english])
        -- Healing Magic --
        elseif string.find(spell.english, 'Cure') or string.find(spell.english, 'Cura') or string.find(spell.english, "Curaga") then
            if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
                equip( equip(sets.midcast.cure), {waist = "Hachirin-no-Obi"})    
            else
                equip(sets.midcast.cure)
			end
		elseif spell.skill == 'Healing Magic' and spell.name == "Cursna" then
			equip(sets.midcast.cure["Cursna"])   
        -- Enhancing Magic --
        elseif spell.skill == 'Enhancing Magic' then
            if string.find(spell.english, "Regen") then
                if(spell.target.name == player.name) then
                    equip(sets.midcast.enhancing.regen.Self)
                else
                    equip(sets.midcast.enhancing.regen)
                end
                
            elseif string.find(spell.english, "Refresh") then
                if(spell.target.name == player.name) then
                    equip(sets.midcast.enhancing.refresh.self)
                else
                    equip(sets.midcast.enhancing.refresh)
                end
            elseif string.find(spell.english, "Spikes") then
                equip(sets.midcast.enhancing.spikes)
            elseif spell.english:startswith("Gain-") then
                equip(sets.midcast.enhancing.gain)
            elseif spell.english:startswith("Phalanx") then
                equip(sets.midcast.enhancing.phalanx)				
            elseif spell.english:startswith("Aquaveil") then
                equip(sets.midcast.enhancing.aquaveil)	
            else
                if(spell.target.name == player.name) then
                    local enhancingMode = EnhancingMagicMode[EnhancingMagicModeIndex]
                    equip(sets.midcast.enhancing[enhancingMode].Self)
                else
                    local enhancingMode = EnhancingMagicMode[EnhancingMagicModeIndex]
                    equip(sets.midcast.enhancing[enhancingMode])
                end
                
            end
        -- Enfeebling Magic --         
        elseif spell.skill == 'Enfeebling Magic' then
            local magicAccuracyMode = MagicAccuracyMode[MagicAccuracyModeIndex]
            if MndEnfeebles[spell.name] then
                equip(sets.midcast.enfeebling.mnd[magicAccuracyMode])
            elseif IntEnfeebles[spell.name] then
                equip(sets.midcast.enfeebling.int[magicAccuracyMode])
            elseif MagicAccEnfeebles[spell.name] then
                equip(sets.midcast.enfeebling.int["High Acc"])
            else
                equip(sets.midcast.enfeebling)
            end

            if buffactive["Saboteur"] then
                equip(sets.ja["Saboteur"])
            end
        -- Elemental Magic --      
        elseif spell.skill == 'Elemental Magic' then
            local nuke_set = NukeSet[NukeSetIndex]
            if (world.day_element == spell.element or world.weather_element == spell.element) and spellType ~= "Helix" then
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
end

function aftercast(spell)
    --print_set(spell)
    SetGearToState(player.status)
end

function status_change(new, old)

    SetGearToState(new)
end

function buff_change(buff,gain)
    -- print_set(buff)
    if windower.wc_match(buff, "terror|petrification|stun|sleep") then
        SetGearToState(player.status)
    elseif S{"Enstone", "Enstone II", "Enwater", "Enwater II", "Enaero", "Enaero II", "Enfire", "Enfire II", "Enthunder", "Enhunder II", "Enblizzard", "Enblizzard II"}[buff] then
        SetGearToState(player.status)
    end
end

function SetGearToState(state)
    -- print(buffactive["Enstone"])
    if state == "Engaged" then
        local engagedMode = EngagedMode[EngagedModeIndex]
        if engagedMode == "Tank" then
            equip(sets.engaged.sw["Damage Taken"])
        else
            local accuracyMode = PhysicalAccuracyMode[PhysicalAccuracyModeIndex]
            local enspellWeatherMapping = {['Earth']={"Enstone", "Enstone II"},
                                           ['Water']= {"Enwater", "Enwater II"},
                                           ['Air']={"Enaero", "Enaero II"},
                                           ['Fire']={"Enfire", "Enfire II"},
                                           ['Ice']={"Enblizzard", "Enblizzard II"},
                                           ['Lightning']={"Enthunder", "Enthunder II"},
                                           ['Light']={"Enthunder", "Enthunder II"},
                                           ['Dark']={"Enblizzard", "Enblizzard II"}}
            if IsDualWield() then
                if EnspellActive and IsEnspellActive() then
                    equip(sets.engaged.dw[accuracyMode].enspell)

                    local buffToCheckForObiForDay = enspellWeatherMapping[world.day_element] or {"", ""}
                    local buffToCheckForObiForWeather = enspellWeatherMapping[world.weather_element] or {"", ""}
                    if buffactive[buffToCheckForObiForDay[1]] and buffactive[buffToCheckForObiForDay[2]] and buffactive[buffToCheckForObiForWeather[1]] or buffactive[buffToCheckForObiForWeather[2]] then
                        equip({waist = "Hachirin-no-Obi"})
                    end
                else
                    equip(sets.engaged.dw[accuracyMode])
                end
            else
                if EnspellActive and IsEnspellActive() then
                    equip(sets.engaged.sw[accuracyMode].enspell)
                    
                    local buffToCheckForObiForDay = enspellWeatherMapping[world.day_element] or {"", ""}
                    local buffToCheckForObiForWeather = enspellWeatherMapping[world.weather_element] or {"", ""}
                    if buffactive[buffToCheckForObiForDay[1]] and buffactive[buffToCheckForObiForWeather[1]] or buffactive[buffToCheckForObiForWeather[2]] then
                        equip({waist = "Hachirin-no-Obi"})
                    end
                else
                    equip(sets.engaged.sw[accuracyMode])
                end
            end
        end
        
   else
        local idleMode = IdleMode[IdleModeIndex]
        equip(sets.idle[idleMode])
   end

   if Kiting then
    equip(sets.kite)
   end

   local weaponSet = Weapon_Sets[WeaponSetsIndex]
   
   enable('main', 'sub')
   equip(sets.weapons[weaponSet])
   if weaponSet ~= "Empty" then
       disable('main', 'sub')
   end

end
   
function IsEnspellActive()
    return (
        buffactive["Enstone"] or buffactive["Enstone II"]
        or buffactive["Enwater"] or buffactive["Enwater II"]
        or buffactive["Enaero"] or buffactive["Enaero II"]
        or buffactive["Enfire"] or buffactive["Enfire II"]
        or buffactive["Enblizzard"] or buffactive["Enblizzard II"]
        or buffactive["Enthunder"] or buffactive["Enthunder II"])
end

function IsDualWield()
    local equipment = windower.ffxi.get_items('equipment')
    local sub = windower.ffxi.get_items(equipment.sub_bag, equipment.sub)
    local item = res.items[sub.id]
    return item.category == "Weapon"
end

function self_command(command)  
    if command == "TankMode" then
        EngagedModeIndex = 1
        add_to_chat(122,  "Tank Mode: On")
        SetGearToState(player.status)
    elseif command == "OffensiveMode" then
        EngagedModeIndex = 2
        add_to_chat(122,  "Offensive Mode: On")
        SetGearToState(player.status)
    elseif command == "Cycle IdleMode" then
        IdleModeIndex = IdleModeIndex % #IdleMode + 1
        add_to_chat(122,  "Idle Mode: " .. IdleMode[IdleModeIndex])
        SetGearToState(player.status)
    elseif command == "Cycle PhysicalAccuracyMode" then
        PhysicalAccuracyModeIndex = PhysicalAccuracyModeIndex % #PhysicalAccuracyMode + 1
        add_to_chat(122,  "Physical Accuracy Mode: " .. PhysicalAccuracyMode[PhysicalAccuracyModeIndex])
        SetGearToState(player.status)
    elseif command == "Toggle EnspellMode" then
        EnspellActive = not EnspellActive
        add_to_chat(122,  "Enspell Mode: " .. (EnspellActive and "On" or "Off"))
        SetGearToState(player.status)
    elseif command == "Cycle MagicMode" then
        MagicAccuracyModeIndex = MagicAccuracyModeIndex % #MagicAccuracyMode + 1
        add_to_chat(122,  "Magic Accuracy Mode: " .. MagicAccuracyMode[MagicAccuracyModeIndex])
        SetGearToState(player.status)
    elseif command == "Cycle EnhancingMode" then
        EnhancingMagicModeIndex = EnhancingMagicModeIndex % #EnhancingMagicMode + 1
        add_to_chat(122,  "Enhancing Magic Mode: " .. EnhancingMagicMode[EnhancingMagicModeIndex])
        SetGearToState(player.status)
    elseif command == "Cycle NukeSet" then
        NukeSetIndex = NukeSetIndex % #NukeSet + 1
        add_to_chat(122,  "Nuke Mode: " .. NukeSet[NukeSetIndex])
        SetGearToState(player.status)
    elseif command == 'RefreshSet' then

        local nuke_set = NukeSet[NukeSetIndex]
        local idle_set = IdleMode[IdleModeIndex]

        SetGearToState(player.status)
        add_to_chat(122, 'Nuke Set: ' .. nuke_set .. ' Idle Set: ' .. idle_set)
    elseif command == "Toggle Kiting" then
        Kiting = not Kiting
        add_to_chat(122,  "Kiting Mode: " .. (Kiting and "On" or "Off"))
        SetGearToState(player.status)
    elseif command == "Cycle WeaponSet" then
        WeaponSetsIndex = WeaponSetsIndex % #Weapon_Sets + 1
        add_to_chat(122,  "Weapon Set: " .. Weapon_Sets[WeaponSetsIndex])
        SetGearToState(player.status)
    end
 

function lockstyle()
    if player.main_job == 'RDM' then send_command('@input /lockstyleset 13') end
end
 
end