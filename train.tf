/def -i -t'An old priest is wandering here*' oldpriest = /def -i gtrain = /priest_train 
/def -i -t'Grimoor, Lord of Ultimate Chaos*' grimoor = /def -i gtrain = /loc_train
/def -i -t'Sister Valentina the Chosen of Saints*' vallu = /def -i gtrain = /nun_train
/def -i -t'Sister Alma the Master Exorcist' alma =  /def -i gtrain = /nun_train
/def -i -t'An old monk is standing here*' oldmonk = /def -i gtrain = /monk_train
/def -i -t'titan priest is performing a ceremony to please Tarmalen*' titantarm = /def -i gtrain = /tarma_train
/def -i -t'a mysterious gypsy woman singing a song to praise Tarmalen*' ramona = /def -i gtrain = /tarma_train
/def -i -t'Mithrandir the Druid GuildMaster' mithrandir = /def -i gtrain = /druid_train
/def -i -t'Carved into the mountainside is a large chamber.*' channuroom = \
    stand platform%;/def -i gtrain = /channellers_train
/def -i -t'a brilliant dagger of light will shoot out from the crystal and' navcrystal = \
    la crystal%;/def -i gtrain = /nav_train
/def -i -t'Oogga, famed Barbarian Lord' ooggabarb = train barbaric ways to:100%;/def -i gtrain = /barb_train
/def -i -t'a man clad in black silk smiling at you in arrogant manner' tenjitiger = /def -i gtrain = /tiger_train
/def -i -t'Sable Bladetree, lord high ranger' sableranger = /def -i gtrain = /ranger_train

;Juolle
 /def -ag -mregexp -t'You still need ([0-9]+) experience points\.$' exp_conv =\
  /if (%{P1} > 1000000) \
    /eval /echo You still need %{P1} ($[({P1}/100000)/10.0]M) experience points.%;\
  /else \
    /eval /echo You still need  %{P1} ($[({P1}/100)/10.0]k) experience points.%;\
  /endif

/def -i train = /gag_trainmessages%;\
    /repeat -0.2 1 /gtrain%;\
    /repeat -3 1 /ungag_trainmessages%;\
    /repeat -0.3 1 grep 'Total of [0-9]+ experience spent on character.' show experience
/def -i -mregexp -ag -t'This costs you ([0-9]+) experience points' tline1 = /set exp_spent=%P1
/def -i -mregexp -ag -t'Trained total ([0-9]+)% of the skill' tline2 = /set perc_trained=%P1
/def -i -mregexp -ag -t'Studied total ([0-9]+)% of the spell' tline3 = /set perc_studied=%P1
/def -i -mregexp -ag -t'You now have \'([A-z| |\-]+)\' at ([0-9]+)% without special bonuses' tline4= /set skspname=%P1%;\
    /set skspwob=%P2

/def -i -mregexp -ag -t'With current bonuses it is at ([0-9]+)%. Current maximum without bonuses is ([0-9]+)%' tline5=\
    /echo -paCyellow :$[pad(%skspname,20)] -> @{B}$[{P1}]@{n} \% ($[{P1}-perc_trained] + %perc_trained) for %{exp_spent} exp. \
    $[{P2}-skspwob] \% left to train.

/def -i gag_trainmessages =\
/def -i -ag -t'Starting to train to *' tmsg1%;\
/def -i -ag -t'You need * more experience to reach the total cost of * experience.' tmsg2%;\
/def -i -ag -t'You may train it only to *' tmsg3%;\
/def -i -ag -t'You have * at * and you may only train it up to *' tmsg4%;\
/def -i -ag -t'Starting to study to *' tmsg5%;\
/def -i -ag -t'You already have it at *' tmsg6%;\
/def -i -ag -t'' tmsg7%;\
/def -i -ag -t'Training *...' tmsg8
/def -i ungag_trainmessages = /undef tmsg1 tmsg2 tmsg3 tmsg4 tmsg5 tmsg6 tmsg7 tmsg8

/def -i loc_train = \
    study summon blade to:100%;\
    train attack to:85%;\
    train long blades to:100%;\
    train parry to:100%;\
    train dodge to:100%;\
    train throw weight to:100%;\
    train vampiric blow to:100%;\
    train negate offhand penalty to:100%;\
    train enhance criticals to:100%;\
    train combat sense to:100%;\
    train cast generic to:90%;\
    train cast special to:100%;\
    train discipline to:100%;\
    train tumbling attack to:100%;\
    train find weakness to:100%;\
    train stun to:100%;\
    train riposte to:100%;\
    train stunned maneuvers to:100%;\
    train consider to:100%;\
    train force of chaos to:100%;\
    study infravision to:100%;\
    train swim to:100%;\
    study chaotic warp to:100%;\
    train cast transformation to:100%;\
    study detect alignment to:100%;\
    study darkness to:100%;\
    study blade of fire to:100%;\
    train tempt to:100%;\
    train attack to:100%;\
    train overbear to:100%;\
    train bloodlust to:100%;\
    train short blades to:100%;\
    train shield bash to:100%;\
    train destructive rage to:100%;\
    train cast generic to:100

/def -i -t'Reincarnation room \(*\)\.' reincroom = /def -i train = train level%%;advance

/def -i priest_train = \
    train attack to:100%;\
    study aneurysm to:100%;\
    study harm body to:100%;\
    train mastery of pain to:100%;\
    train quick chant to:100%;\
    train cast generic to:90%;\
    train cast harm to:100%;\
    train conceal spellcasting to:100%;\
    study cure serious wounds to:100%;\
    study cure light wounds to:100%;\
    study aura of hate to:100%;\
    train mana control to:100%;\
    train essence eye to:100%;\
    train desecrate ground to:100%;\
    train dark baptism to:100%;\
    study cause critical wounds to:90%;\
    study cause serious wounds to:80%;\
    study cause light wounds to:75%;\
    study resurrect to:100%;\
    study raise dead to:100%;\
    train cardiac stimulation to:100%;\
    train cast special to:100%;\
    train cast teleportation to:100%;\
    study last rites to:100%;\
    train ceremony to:100%;\
    study pestilence to:100%;\
    train evil intent to:100%;\
    study hemorrhage to:100%;\
    train cast information to:100%;\
    study make scar to:100%;\
    train cast control to:100%;\
    train cast protection to:100%;\
    study cause critical wounds to:100%;\
    study cause serious wounds to:100%;\
    study cause light wounds to:100%;\
    study protection from good to:100%;\
    study dispel good to:100%;\
    study go to:100%;\
    study mellon collie to:100%;\
    study detect alignment to:100%;\
    study new body to:100%;\
    study damn armament to:100%;\
    train baptize to:100%;\
    train location memory to:100%;\
    train cast evil to:100%;\
    train cast magical to:100%;\
    train dark meditation to:100%;\
    study unholy matrimony to:100%;\
    study bastardly balm to:100%;\
    study energy drain to:100%;\
    study mana drain to:100%;\
    study mobile cannon to:100

/def druid_train=\
    train cast generic to:85%;\
    train mastery of runic sigla to:100%;\
    study wither flesh to:100%;\
    train quick chant to:100%;\
    train cast runes to:100%;\
    train essence eye to:100%;\
    train camping to:100%;\
    train fire building to:100%;\
    study charge staff to:100%;\
    study drain pool to:100%;\
    train consider to:100%;\
    train hiking to:100%;\
    train mana control to:100%;\
    study flex shield to:100%;\
    study gem fire to:100%;\
    train location memory to:100%;\
    study earthquake to:100%;\
    train cast help to:100%;\
    train cast special to:100%;\
    train cast teleportation to:100%;\
    study reincarnation to:100%;\
    study regeneration to:100%;\
    study rain to:100%;\
    study drying wind to:100%;\
    study transfer mana to:100%;\
    study hoar frost to:100%;\
    study water walking to:100%;\
    study earth power to:100%;\
    train cast information to:100%;\
    train cast transformation to:100%;\
    train cast control to:100%;\
    study satiate person to:100%;\
    study restore to:100%;\
    study aura detection to:100%;\
    study replenish energy to:100%;\
    study earth skin to:100%;\
    study create mud to:100%;\
    study infravision to:100%;\
    study star light to:100%;\
    study earth blood to:100%;\
    study blessed warmth to:100%;\
    study summon storm to:100%;\
    study natural transformation to:100%;\
    train plant lore to:100%;\
    train attack to:100%;\
    train bludgeons to:100%;\
    study see invisible to:100%;\
    train first aid to:100%;\
    train bless to:100%;\
    train baptize to:100%;\
    train ceremony to:100%;\
    study shapechange to:100%;\
    train track to:100%;\
    study create food to:100%;\
    study good berry to:100%;\
    study vine mantle to:100%;\
    study runic heal to:100%;\
    study moon sense to:100%;\
    train torch creation to:100%;\
    train hear noises to:100%;\
    train stargazing to:100%;\
    train fresh pants to:100%;\
    train fresh pants to:100%;\
    study word of recall to:100%;\
    study detect poison to:100%;\
    study detect alignment to:100%;\
    study call pigeon to:100%;\
    study wilderness location to:100%;\
    train cast generic to:100%;\
    train make bandage to:100%;\
    train tinning to:100

/def nun_train=\
    train turn undead to:50%;\
    train quick chant to:50%;\
    study dispel evil to:50%;\
    study protection from evil to:50%;\
    study dispel undead to:50%;\
    train cast dispel to:50%;\
    study flames of righteousness to:50%;\
    study banish demons to:50%;\
    study holy hand to:50%;\
    study saintly touch to:50%;\
    study aura detection to:50%;\
    train cast teleportation to:50%;\
    train mana control to:50%;\
    train cast holy to:50%;\
    train cast heal to:50%;\
    train cast protection to:50%;\
    train cast information to:50%;\
    train cast generic to:85%;\
    study cure light wounds to:50%;\
    study cure serious wounds to:50%;\
    train cast special to:50%;\
    train consider to:50%;\
    train essence eye to:50%;\
    train first aid to:50%;\
    study mana shield to:50%;\
    train burial ceremony to:50%;\
    train plant lore to:50%;\
    train baptize to:50%;\
    train bless to:50%;\
    train exorcize to:50%;\
    train sewing to:50%;\
    train attack to:50%;\
    train ceremony to:50%;\
    train candlestick making to:50%;\
    train vial throwing to:50%;\
    train bludgeons to:50%;\
    study word of recall to:50%;\
    study detect alignment to:50%;\
    study satiate person to:50%;\
    study water walking to:50%;\
    study light to:50%;\
    study identify relic to:50%;\
    study resist temptation to:50%;\
    study create food to:50%;\
    study remove scar to:50%;\
    study cure player to:50%;\
    study guardian angel to:50%;\
    study remove poison to:50%;\
    study soul shield to:50%;\
    study cleanse heathen to:50%;\
    train cast generic to:50%;\
    study bless vial to:50%;\
    train turn undead to:100%;\
    train quick chant to:100%;\
    study dispel evil to:100%;\
    study protection from evil to:100%;\
    study dispel undead to:100%;\
    train cast dispel to:100%;\
    study flames of righteousness to:100%;\
    study banish demons to:100%;\
    study holy hand to:100%;\
    train discipline to:50%;\
    study saintly touch to:100%;\
    study aura detection to:100%;\
    train cast teleportation to:100%;\
    train mana control to:100%;\
    train cast holy to:100%;\
    train cast heal to:100%;\
    train cast protection to:100%;\
    train cast information to:100%;\
    train cast generic to:85%;\
    study cure light wounds to:100%;\
    study cure serious wounds to:100%;\
    train power of faith to:100%;\
    train discipline to:100%;\
    train cast special to:100%;\
    train consider to:100%;\
    train essence eye to:100%;\
    train first aid to:100%;\
    study mana shield to:100%;\
    train burial ceremony to:100%;\
    train plant lore to:100%;\
    train baptize to:100%;\
    train bless to:100%;\
    train exorcize to:100%;\
    train sewing to:100%;\
    train attack to:100%;\
    train ceremony to:100%;\
    train candlestick making to:100%;\
    train vial throwing to:100%;\
    train bludgeons to:100%;\
    study word of recall to:100%;\
    study detect alignment to:100%;\
    study satiate person to:100%;\
    study water walking to:100%;\
    study light to:100%;\
    study identify relic to:100%;\
    study resist temptation to:100%;\
    study create food to:100%;\
    study remove scar to:100%;\
    study cure player to:100%;\
    study guardian angel to:100%;\
    study remove poison to:100%;\
    study soul shield to:100%;\
    study cleanse heathen to:100%;\
    train cast generic to:100%;\
    study bless vial to:100

/def -i old_nun_train = \
    study dispel evil to:100                 %;\
    train quick chant to:100                 %;\
    train knowledge of dispelling to:100     %;\
    study flames of righteousness to:100     %;\
    train turn undead to:100                 %;\
    study protection from evil to:100        %;\
    study summon to:100                      %;\
    train cast dispel to:100                 %;\
    train mana control to:100                %;\
    train cast holy to:100                   %;\
    train cast heal to:100                   %;\
    train cast teleportation to:100          %;\
    train cast information to:100            %;\
    train essence eye to:100                 %;\
    study remove scar to:100                 %;\
    study celestial haven to:100             %;\
    study heavenly protection to:100         %;\
    train mastery of shielding to:100        %;\
    train mastery of holy vials to:100       %;\
    study detect alignment to:100            %;\
    train first aid to:100                   %;\
    study soul shield to:100                 %;\
    study heavy weight to:100                %;\
    study holy bolt to:100                   %;\
    study holy wind to:100                   %;\
    train burial ceremony to:100             %;\
    study aura detection to:100              %;\
    study saintly touch to:100               %;\
    study banish demons to:100               %;\
    train plant lore to:100                  %;\
    train consider to:100                    %;\
    study remove poison to:100               %;\
    study restore to:100                     %;\
    study dispel undead to:100               %;\
    train power of faith to:100              %;\
    train ceremony to:100                    %;\
    study cleanse heathen to:100             %;\
    train bless to:100                       %;\
    train baptize to:100                     %;\
    train candlestick making to:100          %;\
    study guardian angel to:100              %;\
    study mana shield to:100                 %;\
    train cast special to:100                %;\
    study satiate person to:100              %;\
    study cure player to:100                 %;\
    study create food to:100                 %;\
    train exorcize to:100                    %;\
    train attack to:100                      %;\
    train bludgeons to:100                   %;\
    study word of recall to:100

/def -i monk_train = \
    train martial arts to:100%;\
    train iron palm to:100%;\
    train dodge to:100%;\
    train unarmed parry to:100%;\
    train hiking to:100%;\
    train combat sense to:100%;\
    train contact reflexes to:100%;\
    train throw weight to:100%;\
    train enhance criticals to:100%;\
    train tumbling attack to:100%;\
    train meditation to:100%;\
    train find weakness to:100%;\
    train stunned maneuvers to:100%;\
    train alertness to:100%;\
    train stun to:100%;\
    train consider to:100%;\
    train attack to:100%;\
    train swim to:100%;\
    train defence sense to:100%;\
    train joint lock to:100%;\
    train leather craft to:100%;\
    train ki to:100%;\
    train kiai-cry to:100%;\
    train discipline to:100%;\
    train baptize to:100%;\
    train bless to:100%;\
    train acupuncture to:100%;\
    train vital points to:100%;\
    train punch to:100%;\
    train kata to:100%;\
    train sculpture to:100%;\
    train sewing to:100%;\
    train mind over body to:100%;\
    train bash to:100%;\
    train kick to:100%;\
    train fresh pants to:100

/def -i old_druid_train=\
    train mastery of runic sigla to:100%;\
    study drain pool to:100%;\
    train camping to:100%;\
    train fire building to:100%;\
    train quick chant to:100%;\
    train cast generic to:90%;\
    train cast runes to:100%;\
    train cast help to:100%;\
    train cast special to:100%;\
    train mana control to:100%;\
    train cast teleportation to:100%;\
    train cast control to:100%;\
    train cast information to:100%;\
    train cast transformation to:100%;\
    study regeneration to:100%;\
    study earthquake to:100%;\
    study reincarnation to:100%;\
    study shapechange to:100%;\
    study runic heal to:100%;\
    study hoar frost to:100%;\
    study flex shield to:100%;\
    study earth power to:100%;\
    study word of recall to:100%;\
    study create mud to:100%;\
    study earth blood to:100%;\
    study gem fire to:100%;\
    study wilderness location to:100%;\
    study star light to:100%;\
    study detect poison to:100%;\
    study infravision to:100%;\
    train bludgeons to:100%;\
    study aura detection to:100%;\
    study see invisible to:100%;\
    study detect alignment to:100%;\
    study rain to:100%;\
    study satiate person to:100%;\
    study water walking to:100%;\
    study call pigeon to:100%;\
    study drying wind to:100%;\
    study charge staff to:100%;\
    study natural transformation to:100%;\
    study create food to:100%;\
    study restore to:100%;\
    study earth skin to:100%;\
    study moon sense to:100%;\
    study replenish energy to:100%;\
    study vine mantle to:100%;\
    study good berry to:100%;\
    study transfer mana to:100%;\
    study summon storm to:100%;\
    study blessed warmth to:100%;\
    study wither flesh to:100%;\
    train consider to:100%;\
    train essence eye to:100%;\
    train plant lore to:100%;\
    train location memory to:100%;\
    train hiking to:100%;\
    train bless to:100%;\
    train first aid to:100%;\
    train ceremony to:100%;\
    train swim to:100%;\
    train baptize to:100%;\
    train tinning to:100%;\
    train make bandage to:100%;\
    train hear noises to:100%;\
    train stargazing to:100%;\
    train torch creation to:100%;\
    train fresh pants to:100%;\
    train attack to:100%;\
    train track to:100

/def -i tarma_train=\
    study everything to:60 except lessen poison,guardian angel%;\
    train mastery of medicine to:93%;\
    train mastery of assistance to:90%;\
    train quick chant to:100%;\
    train cast heal to:100%;\
    train cast generic to:85%;\
    study major heal to:100%;\
    study minor party heal to:100%;\
    study cure critical wounds to:100%;\
    study major party heal to:100%;\
    train mastery of medicine to:100%;\
    train mastery of assistance to:100%;\
    train essence eye to:100%;\
    train mana control to:100%;\
    train cast help to:100%;\
    train cast special to:100%;\
    train cast teleportation to:100%;\
    study cure serious wounds to:100%;\
    study cure light wounds to:100%;\
    study deaths door to:100%;\
    study resurrect to:100%;\
    study raise dead to:100%;\
    study unpain to:100%;\
    study unstun to:100%;\
    study remove poison to:100%;\
    study minor heal to:100%;\
    study heal all to:100%;\
    study restore to:100%;\
    study light to:100%;\
    study blessing of tarmalen to:100%;\
    study remove scar to:100%;\
    study water walking to:100%;\
    study satiate person to:100%;\
    studt summon to:100%;\
    train mastery of medicine to:100%;\
    study life link to:100%;\
    train first aid to:100%;\
    train consider to:100%;\
    study natural renewal to:100%;\
    study new body to:100%;\
    study sex change to:100%;\
    study detect misery to:100%;\
    train ceremony to:100%;\
    study word of recall to:100%;\
    train bludgeons to:100%;\
    study detect alignment to:100%;\
    study create food to:100%;\
    study see the light to:100%;\
    study cure player to:100%;\
    study soul hold to:100%;\
    study lessen poison to:100%;\
    study moon sense to:100%;\
    study true heal to:100%;\
    train burial ceremony to:100%;\
    train attack to:100%;\
    train tempt to:100%;\
    train baptize to:100%;\
    train bless to:100%;\
    study enhanced vitality to:100%;\
    study true party heal to:100%;\
    study guardian angel to:100

/def -i nav_train =\
    train cast teleportation to:100%;\
    train mastery of locating to:100%;\
    study summon to:100%;\
    study relocate to:100%;\
    study dimension door to:100%;\
    train location memory to:100%;\
    study teleport without error to:100%;\
    train cast generic to:100%;\
    study heavy weight to:100%;\
    study go to:100%;\
    study wizard eye to:100%;\
    study banish to:100%;\
    study mobile cannon to:100%;\
    study word of recall to:100%;\
    study teleport with error to:100%;\
    train stargazing to:100

/def -i channellers_train =\
    train cast generic to:80%;\
    train cast channelling to:100%;\
    train quick chant to:100%;\
    train mastery of channelling to:80%;\
    train mana control to:100%;\
    train essence eye to:100%;\
    train cast magical to:75%;\
    train cast electricity to:75%;\
    train cast fire to:75%;\
    study channelball to:100%;\
    study channelbolt to:100%;\
    study channelburn to:100%;\
    train mastery of channelling to:100%;\
    study drain room to:100%;\
    study replenish ally to:100%;\
    study drain ally to:100%;\
    study energy aura to:100%;\
    study channelspray to:100%;\
    study drain room to:100%;\
    study drain enemy to:100%;\
    train cast teleportation to:100%;\
    study summon to:100%;\
    train mastery of draining to:100%;\
    train analysis of magic lore to:100%;\
    study personal force field to:100%;\
    study feather weight to:100%;\
    study identify to:100%;\
    study drain item to:100%;\
    study golem heal to:100%;\
    train damage criticality to:100%;\
    study transform golem to:100%;\
    train consider to:100%;\
    train cast generic to:100%;\
    train zapping to:100%;\
    train plant lore to:100%;\
    train craft orb to:100%;\
    train wandmaking to:100%;\
    train cast alchemy to:100%;\
    train cast electricity to:100%;\
    train cast information to:100%;\
    train cast magical to:100%;\
    train cast transformation to:100%;\
    train cast fire to:100%;\
    train attack to:100%;\
    train short blades to:100%;\
    train flow of magic to:100%;\
    train bludgeons to:100%;\
    study word of recall to:100%;\
    study see magic to:100%;\
    study darkness to:100%;\
    study floating to:100%;\
    study light to:100%;\
    study greater darkness to:100%;\
    study greater light to:100%;\
    study animate golem to:100%;\
    train mix salve to:100%;\
    study channelray to:100%;\
    study energy vortex to:100%;\
    study magic missile to:100%;\
    study lightning bolt to:100%;\
    study firebolt to:100%;\
    study shocking grasp to:100%;\
    study flame arrow to:100%;\
    study summon lesser spores to:100%;\
    study create herb to:100%;\
    study item dispersion shield to:100

/def -i barb_train =\
	train barbaric ways to:100%;\
	train camping,fire_building to:max%;\
	train dodge to:max%;\
	train parry to:max%;\
	train attack to:70%;\
	train throw weight to:85%;\
	train looting and burning to:80%;\
	train everything to:70 except cleave,pound,cold_tolerance,fire_walking,pain_threshold,controlled_panic,alcohol_tolerance,reaving,grapple,toxic_immunity,tinning,push,pulverize%;\
	train enhance criticals,find_weakness,stun,negate_offhand_penalty,track to:90%;\
	train axes,pound,cleave,pulverize,reaving,pain_threshold to:75%;\
	train enhance criticals,find weakness,stun,negate offhand penalty,stun,attack,bludgeons,axes,track to:100

/def -i tiger_train =\
	train level%;\
	train attack to:75%;\
	train dodge,iron palm,martial arts,throw weight,dim mak,cast heal,cast generic,meditation to:rac%;\
	study everything to:60%;\
	train everything to:93 except dark nerves,vital points,sneak%;\
	study everything to:80%;\
	train everything to:max except dark nerves,vital points,sneak%;\
	train everything to:max%;\
	study everything to:max

/def -i ranger_train =\
	train long blades to:80%;\
	train throw weight to:80%;\
	train attack to:70%;\
	train parry to:80%;\
	train dodge to:80%;\
	train bladed fury to:80%;\
	train camping to:80%;\
	train fire building to:80%;\
	train offhanded fury to:80%;\
	train multiple fury to:80%;\
	train mastery of bladed fury to:80%;\
	train mastery of fire building to:80%;\
	train mastery of camping to:80%;\
	train alertness to:80%;\
	train stun to:80%;\
	train axes to:55%;\
	train short blades to:80%;\
	train hiking to:80%;\
	train rescue to:80%;\
	train axes to:75%;\
	train enhanced peer to:80%;\
	train negate offhand penalty to:80%;\
	train first aid to:80%;\
	train discipline to:80%;\
	train track to:80%;\
	train kick to:80%;\
	train plant lore to:80%;\
	train consider to:80%;\
	train wipe tracks to:80%;\
	train compare to:80%;\
	train fishing to:80%;\
	train hunting to:80%;\
	train torch creation to:80%;\
	train shield bash to:80%;\
	train push to:80%;\
	train swim to:80%;\
	train scouting to:80%;\
	train switch weapon to:80%;\
	train leather craft to:80%;\
	train everything to:max except attack,location_memory,axes,swim,stargazing,make_bandage,scouting,locate_water,leather_craft,woodland_stealth,telescope_operation,forest_location%;\
	train make bandage to:80%;\
	train locate water to:80%;\
	train camouflage to:80%;\
	train woodland stealth to:80%;\
	train forest location to:80%;\
	train tinning to:80%;\
	train stargazing to:80%;\
	train telescope operation to:80%;\
	train controlled panic to:80%;\
	train location memory to:80%;\
	train everything to:80 except axes,attack%;\
	train everything to:max
