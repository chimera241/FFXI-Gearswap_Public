-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
 
--[[
    Custom commands:
     
    ExtraSongsMode may take one of three values: None, Dummy, FullLength
     
    You can set these via the standard 'set' and 'cycle' self-commands.  EG:
    gs c cycle ExtraSongsMode
    gs c set ExtraSongsMode Dummy
     
    The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
    The FullLength state will simply equip the bonus song instrument on top of standard gear.
     
     
    Simple macro to cast a dummy Daurdabla song:
    /console gs c set ExtraSongsMode Dummy
    /ma "Shining Fantasia" <me>
     
    To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
    'Terpander', and info.ExtraSongs to 1.
--]]
 
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
     
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end
 
 
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}
 
    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
 
    -- For tracking current recast timers via the Timers plugin.
    custom_timers = {false}
end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
 
    brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}
    pick_tp_weapon()
     
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
     
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
     
    -- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
    send_command('bind !` input /ma "Chocobo Mazurka" <me>')
 
    select_default_macro_book()
end
 
 
-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
Intarabus = {}
    Intarabus.Song = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
    Intarabus.TP = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
	Intarabus.WS = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

      
    -- Precast Sets
 
    -- Fast cast sets for spells
    sets.precast.FC = {head="Fili Calot +1",neck="Voltsurge Torque", ear1="Loquac. Earring", ear2="Etoliation Earring",
                       body="Inyanga Jubbah +2",hands="Gende. Gages +1", ring1="Weather. Ring", ring2="Kishar Ring",
                       back=Intarabus.Song,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
 
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris"})
 
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {head="Umuthi Hat"})
 
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
 
    sets.precast.FC.BardSong = {head="Fili Calot +1",neck="Voltsurge Torque", ear1="Loquac. Earring", ear2="Etoliation Earring",
                                body="Inyanga Jubbah +2",hands="Gende. Gages +1", ring1="Weather. Ring", ring2="Kishar Ring",
                                back=Intarabus.Song,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Bihu Slippers"}
 
    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	
	sets.precast.FC["Honor March"] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
         
     
    -- Precast sets to enhance JAs
     
    sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps +3"}
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}
 
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {range="Gjallarhorn",
        head="Nahtirah Hat",
        body="Gendewitha Bliaut",hands="Buremte Gloves",
        back="Kumbira Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
 
    -- Engaged sets
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
     
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {range="Linos",
        head="Aya. Zucchetto +2",neck="Bard's Charm +1", ear1="Telos Earring", ear2="Brutal Earring",
        body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ilabrat ring",ring2="Petrov ring",
        back=Intarabus.TP, waist="Sailfi Belt +1", legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
     
        
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Aya. Zucchetto +2",neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Brutal Earring",
        body="Bihu Jstcorps. +3",hands="Aya. Manopolas +2",ring1="Ilabrat ring",ring2="Petrov ring",
        back=Intarabus.WS, waist="Fotia Belt", legs="Lustratio Subligar +1	",feet="Lustratio leggings +1"}
     
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = { 
		head="Aya. Zucchetto +2",neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Brutal Earring",
        body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ilabrat ring",ring2="Petrov ring",
        back=Intarabus.TP, waist="Fotia Belt", legs="Lustratio Subligar +1",feet="Lustratio leggings +1"
		}

    sets.precast.WS['Savage Blade'] = {
		head="Nyame Helm",neck="Bard's Charm +1", ear1="Moonshade Earring", ear2="Ishvara Earring",
        body="Bihu Jstcorps. +3",hands="Nyame Gauntlets",ring1="Ilabrat ring",ring2="Petrov ring",
        back=Intarabus.WS, waist="Sailfi Belt +1", legs="Nyame Flanchard",feet="Nyame Sollerets"
		}
 
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS)
 
    sets.precast.WS['Mordant Rime'] = {
		head="Aya. Zucchetto +2",neck="Bard's Charm +1", ear1="Moonshade Earring", ear2="Ishvara Earring",
        body="Bihu Jstcorps. +3",hands="Aya. Manopolas +2",ring1="Ilabrat ring",ring2="Petrov ring",
        back=Intarabus.WS, waist="Grunfeld Rope", legs="Lustratio Subligar +1",feet="Lustratio leggings +1"
		}
		
	sets.precast.WS['Rudras Storm'] = set_combine(sets.precast.WS)
     
     
    -- Midcast Sets
 
    -- General set for recast times.
    sets.midcast.FastRecast = {range="Angel Lyre",
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
         
    -- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
    sets.midcast.Ballad = {legs="Inyanga Shalwar +2"}
    sets.midcast.Lullaby = {hands="Brioso Cuffs +3"}
    sets.midcast.Madrigal = {head="Fili Calot +1"}
    sets.midcast.March = {hands="Fili Manchettes +1"}
    sets.midcast.Minuet = {body="Fili Hongreline +1"}
    sets.midcast.Minne = {}
    sets.midcast.Paeon = {head="Brioso Roundlet +1"}
    sets.midcast.Carol = {head="Fili Calot +1",
        body="Fili Hongreline +1",hands="Fili Manchettes +1",
        legs="Fili Rhing. +2",feet="Fili Cothurnes +1"}
    sets.midcast["Sentinel's Scherzo"] = {legs="Inyanga Shalwar +2", feet="Fili Cothurnes +1"}
    sets.midcast['Magic Finale'] = {neck="Wind Torque",waist="Corvax Sash",legs="Aoidos' Rhing. +2"}
     
 
    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEffect = {range="Gjallarhorn",
        head="Fili Calot +1",neck="Moonbow Whistle +1", ear1="Loquac. Earring", ear2="",
        body="Fili Hongreline +1",hands="Fili Manchettes +1", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=Intarabus.Song, waist="Flume Belt",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}
		
	sets.midcast["Honor March"] = set_combine(sets.midcast.SongEffect,{range="Marsyas"})
 
    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {range="Daurdabla",
        head="Brioso Roundlet +2",neck="Moonbow Whistle +1", ear1="Regal Earring", ear2="Digni. Earring",
		body="Brioso Just. +2",hands="Brioso Cuffs +3", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=Intarabus.Song, waist="Luminary Sash",legs="Brioso Cannions +2",feet="Brioso Slippers +2"}
 
    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = {range="Daurdabla",
        head="Brioso Roundlet +2",neck="Moonbow Whistle +1", ear1="Regal Earring", ear2="Digni. Earring",
		body="Brioso Just. +2",hands="Inyan. Dastanas +1", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=Intarabus.Song, waist="Refoccilation Stone",legs="Brioso Cannions +2",feet="Brioso Slippers +2"}
 
    -- Song-specific recast reduction
    sets.midcast.SongRecast = {ear2="Loquacious Earring",
        ring1="Prolix Ring",
        back="Harmony Cape",waist="Corvax Sash",legs="Aoidos' Rhing. +2"}
 
    --sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})
 
    -- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}
 
    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = {range=info.ExtraSongInstrument,
        head="Fili Calot +1",neck="Moonbow Whistle +1", ear1="Loquac. Earring", ear2="Mendi. Earring",
        body="Brioso Justau. +2",hands="Fili Manchettes +1", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=Intarabus.Song, waist="Flume Belt",legs="Aya. Cosciales +2",feet="Brioso Slippers +1"} 
    -- Other general spells and classes.
    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",
		head="Vanya Hood",neck="Twilight Torque", ear1="", ear2="",
		body="Vanya Robe",hands="Kaykaus cuffs", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back="Solemnity Cape",waist="",legs="Assid. Pants +1",feet="Kaykaus Boots"}
         
    sets.midcast.Curaga = sets.midcast.Cure
         
    sets.midcast.Stoneskin = {
        head="Nahtirah Hat", neck="Seigel Torque",
        body="Gendewitha Bliaut",hands="Gende. Gages +1",
        back="", waist="Seigel Sash", legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
         
    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",ring1="Ephedra Ring"}
 
     
    -- Sets to return to when not performing an action.
     
    -- Resting sets
    sets.resting = {main=gear.Staff.HMP, 
        body="Gendewitha Bliaut",
        legs="Nares Trews",feet="Chelona Boots +1"}
     
     
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		head="Fili Calot +1",neck="Bard's Charm +1", ear1="Ethereal earring", ear2="",
        body="Inyanga Jubbah +2",hands="Brioso Cuffs +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=Intarabus.Song, waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Fili Cothurnes +1"}
 
    sets.idle.PDT = {
        head="Aya. Zucchetto +2",neck="", ear1="Ethereal earring", ear2="Heartseeker earring",
        body="Ayanmo Corazza +2",hands="aya. manapolas +2",ring1="Inyanga ring",ring2="Defending ring",
        back=Intarabus.Song, waist="Flume belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
 
    sets.idle.Town = {range="Marsyas",
        head="Fili Calot +1",neck="Twilight torque", ear1="Ethereal earring", ear2="",
        body="Inyanaga Jubbah +2",hands="Adhemar Wristbands",ring1="Inyanga ring",ring2="Defending ring",
        back=Intarabus.Song, waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Fili Cothurnes +1"}
     
    sets.idle.Weak = {
        head="Aya. Zucchetto +2",neck="Bard's Charm +1", ear1="Ethereal earring", ear2="Heartseeker earring",
        body="Ayanmo Corazza +2",hands="aya. manapolas +2",ring1="Inyanga ring",ring2="Defending ring",
        back=Intarabus.Song, waist="Flume belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
     
     
    -- Defense sets
 
    sets.defense.PDT = {
        head="Aya. Zucchetto +2",neck="Twilight torque", ear1="Ethereal earring", ear2="Heartseeker earring",
        body="Ayanmo Corazza +2",hands="aya. manapolas +2",ring1="Aya. ring",ring2="Defending ring",
        back="Rosmerta's Cape",waist="Flume belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
 
    sets.defense.MDT = {
        head="Aya. Zucchetto +2",neck="Twilight torque", ear1="Ethereal earring", ear2="Heartseeker earring",
        body="Ayanmo Corazza +2",hands="aya. manapolas +2",ring1="Aya. ring",ring2="Defending ring",
        back="Rosmerta's Cape",waist="Flume belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
 
    sets.Kiting = {feet="Fili Cothurnes +1"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}

end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        -- Auto-Pianissimo
        if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and
            not state.Buff['Pianissimo'] then
             
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] < 2 then
                send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
                eventArgs.cancel = true
                return
            end
        end
    end
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast[generalClass] then
                equip(sets.midcast[generalClass])
            end
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.type == 'BardSong' then
        if state.ExtraSongsMode.value == 'FullLength' then
            equip(sets.midcast.Daurdabla)
        end
 
        state.ExtraSongsMode:reset()
    end
end

 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','ammo')
        else
            enable('main','sub','ammo')
        end
    end
end
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
 
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    pick_tp_weapon()
end
 
 
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
     
    return idleSet
end
 
 
-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
        if state.CastingMode.value == 'Resistant' then
            return 'ResistantSongDebuff'
        else
            return 'SongDebuff'
        end
    elseif state.ExtraSongsMode.value == 'Dummy' then
        return 'DaurdablaDummy'
    else
        return 'SongEffect'
    end
end
 

-- Function to calculate the duration of a song based on the equipment used to cast it.
-- Called from adjust_timers(), which is only called on aftercast().
function calculate_duration(spellName, spellMap)
    local mult = 1
    if player.equipment.range == 'Daurdabla' then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
    if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end -- change to 0.3 with 95 Gjall
     
    if player.equipment.main == "Carnwenhan" then mult = mult + 0.1 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
    if player.equipment.main == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.sub == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
    if player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
    if player.equipment.legs == "Mdk. Shalwar +1" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end
     
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet" then mult = mult + 0.1 end
    if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +1" then mult = mult + 0.1 end
    if spellMap == 'Madrigal' and player.equipment.head == "Aoidos' Calot +2" then mult = mult + 0.1 end
    if spellMap == 'Minuet' and player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
    if spellMap == 'March' and player.equipment.hands == 'Ad. Mnchtte. +2' then mult = mult + 0.1 end
    if spellMap == 'Ballad' and player.equipment.legs == "Aoidos' Rhing. +2" then mult = mult + 0.1 end
    if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Aoidos' Cothrn. +2" then mult = mult + 0.1 end
     
    if buffactive.Troubadour then
        mult = mult*2
    end
    if spellName == "Sentinel's Scherzo" then
        if buffactive['Soul Voice'] then
            mult = mult*2
        elseif buffactive['Marcato'] then
            mult = mult*1.5
        end
    end
     
    local totalDuration = math.floor(mult*120)
 
    return totalDuration
end
 
 
-- Examine equipment to determine what our current TP weapon is.
function pick_tp_weapon()
    if brd_daggers:contains(player.equipment.main) then
        state.CombatWeapon:set('Dagger')
         
        if S{'NIN','DNC'}:contains(player.sub_job) and brd_daggers:contains(player.equipment.sub) then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    else
        state.CombatWeapon:reset()
        state.CombatForm:reset()
    end
end
 
-- Function to reset timers.
function reset_timers()
    for i,v in pairs(custom_timers) do
        send_command('timers delete "'..i..'"')
    end
    custom_timers = {}
end
 
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 7)
end
 
 
windower.raw_register_event('zone change',reset_timers)
windower.raw_register_event('logout',reset_timers)