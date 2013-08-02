;; Funkkarit
/def cmd_f1 = cast 'saintly touch'
/def cmd_f2 = cast 'holy hand'
/def cmd_f3 = cast 'dispel evil'
/def cmd_f5 = cast cure light wounds at thiamin

;;Commands for nun
/def -i -h'SEND {hh} *' command_hh = cast 'holy hand' %-1
/def -i -h'SEND {st} *' command_st = cast 'saintly touch' %-1
/def -i -h'SEND {tu} *' command_turn = use 'turn undead' %-1%;@turn %-1
/def -i -h'SEND {de}*' command_de = cast 'dispel evil' %-1
/def -i -h'SEND {c}*' command_c = cast 'dispel evil' %-1
/def -i -h'SEND {pfe}*' command_pfe = cast 'protection from evil' %-1
/def -i -h'SEND {clw} *' command_clw = cast cure light wounds at %-1

;;BLASTS

;Crits
/def -aCbgyellow -aBCred -mglob -i -t'Your strong faith helps you to channel IMMENSE amount of *' nuncrit1 = /eval party say CRIT! (%*)
/def -aCbgyellow -aBCred -mglob -i -t'Holy forces coil around you, OVERPOWERING your spell.' nuncrit2 = /eval party say CRIT! (%*)
/def -aCbgyellow -aBCred -mglob -i -t'Your * flashes brilliantly, FUMING with celestial energy.' nuncrit3 = /eval party say CRIT! (%*)
/def -aCbgyellow -aBCred -mglob -i -t'Fabric of space ruptures and VAST amount of energy combines into your spell.' nuncrit4 = /eval party say CRIT! (%*)
/def -aCbgyellow -aBCred -mglob -i -t'Saints smile over you as UNBOUNDED amount of energy merges into your spell.' nuncrit5 = /eval party say CRIT! (%*)
/def -aCbgyellow -aBCred -mglob -i -t'Wave of holy force flows through you, boosting your spell.' nuncrit6 = /eval party say CRIT! (%*)
/def -aCbgyellow -aBCred -mglob -i -t'You sustain the spell and let its power grow before unleashing it.' nuncrit7 = /eval party say CRIT! (%*)

;Banish Demons
/def -aCbgblue -aB -mregexp -i -t'^Purifying forces gather inside you, ultimately ' purifying_forces
/def -aCbgblue -aB -mregexp -i -t'as one big burst, uncontrollably exploding on ' uncontrollably_exploding 
/def -aCbgblue -aB -mregexp -i -t'as one big burst, striking directly upon ' striking_directly 
/def -aCbgblue -aB -mregexp -i -t'as one big burst, frantically scorching ' frantically_scorching

;Dispel Evil
/def -aCbgblue -aB -mregexp -i -t'strikes with blazing rage upon ' blazing_rage 
/def -aCbgblue -aB -mregexp -i -t'strikes with purifying glow upon ' purifying_glow
/def -aCbgblue -aB -mregexp -i -t'strikes mightily upon ' mightily
/def -aCbgblue -aB -mregexp -i -t'strikes hard upon ' strikes_hard = party say %PR shrugs mana =(
/def -aCbgblue -aB -mregexp -i -t'strikes with sheer force upon ' strikes_sheer_force
/def -aCbgblue -aB -mregexp -i -t'strikes with terrific force upon ' terrific_force
/def -aCbgblue -aB -mregexp -i -t'^White light tangles around you as dazzling flash erupts from your [A-z| ]+ *' white_light
/def -aCbgblue -aB -mregexp -i -t'^Magical mist swirls around you as dazzling flash erupts from your [A-z| ]+ *' magical_mist

;Dispel undead
/def -aCbgblue -aB -mregexp -i -t'Your [A-z| ]+ (flashes brightly|sparkles under magical pressure) as glimmering ray of light dashes through' du_spell
/def -aCbgblue -aB -mregexp -i -t'the air dispelling *' dudispels
/def -aCbgblue -aB -mregexp -i -t'the air rendering *' durenders 
/def -aCbgblue -aB -mregexp -i -t'the air damaging *' dudamages

;Flames of righteousness
/def -aCbgblue -aB -mglob -i -t'You hit * with your flames of righteousness.' flames_of_righteousness_hits

;Holy Hand
/def -aCbgblue -aB -mregexp -i -t'^Your glimmering [A-z| ]+ emits fuming white aura around screaming' fuming_white_aura
/def -aCbgblue -aB -mglob -i -t'*{effectively|moderately} {damaging|injuring} {him|her|it}*' holy_hand_damage

;Saintly touch
/def -aCbgblue -aB -mregexp -i -t'^Your [A-z| ]+ glimmers divinely as a (burning|flareing) symbol of purify appears into' glimmers_divinely 
/def -aCbgblue -aB -mregexp -i -t'^the forehead of *' hits_forehead = party say Saintly touch hits %PR 


;;PROTS

;Protection from evil
/def -i -t'You suddenly feel more vulnerable to evil.' own_pfe_down = \
    /protdown protection_from_evil PFE
/def -i -t'Your * glows with sheer power as you are surrounded by*' pfe_up1 = \
    /protup protection_from_evil PFE
/def -i -t'Your * glitters with sheer power as you are surrounded by*' pfe_up2 = \
    /protup protection_from_evil PFE
/def -i -t'Your * pulsates with sheer power as you are surrounded by*' pfe_up3 = \
    /protup protection_from_evil PFE
/def -i -t'Your glow fades away and you suddenly feel more vulnerable to evil.' pfe_dispelled = \
    /protdown protection_from_evil PFE
;Soul shield
/def -mglob -i -t'You spiritually reach out for your soul, protecting it with holy force.' soul_shield_up  = p' Soul Shield up!%;/set st_ss=SS%;/set time_ss=$[time()]
/def -mglob -i -t'Your soul feels suddenly more vulnerable.' soul_shield_down = /eval party say Soul Shield down (was up for $[ftime("%M min %S sec",time()-time_ss)])%;/set st_ss=

;Mana Shield
/def -mglob -i -t'You feel your magical power expanding.' mana_shield_up  = p' Mana Shield up!%;/set st_sps=MS%;/set time_sps=$[time()]
/def -mglob -i -t'Your life force seems weaker.' mana_shield_down = /eval party say Mana Shield down (was up for $[ftime("%M min %S sec",time()-time_sps)])%;/set st_sps=

;Celestial haven
/def -i -t'Magical barrier dissolves.' have_down

;;SKILLS

;Turn undead

;fail
/def -aCred -mregexp -i -t' laughs maliciously at you and jumps on you\.$' turnfail1 = use turn undead at $[tolower({PL})]
/def -aCred -i -t'You fail to channel your god\'s power.' turnfail2 = !use
;success
/def -aCcyan -mglob -i -t'You hear soft tinkle as * is vaporized before your eyes.' turnsuccess1
/def -aCcyan -mglob -i -t'* abruptly turns into a pile of dust.' turnsuccess2
/def -aCcyan -mglob -i -t'* screams loudly as bright light consumes its undead body.' turnsuccess3
/def -aCcyan -mglob -i -t'Dazzling white mist takes over * as it ceases to exist.' turnsuccess4
/def -aCcyan -mglob -i -t'* yields before you and dispels.' turnsucces5

/def -aBCcyan -i -t'You feel righteous!' you_feel_righteous = @save

;TASK LIST
/def -P0Cgreen -mregexp -i -t'[A-z \']+ \| \[ \:\) \]' task_done
/def -P0Cred -mregexp -i -t'[A-z \']+ \| \[ \:\( \]' task_not_done 

;;OTHERS
/def -F -p1 -i -t'This has once been a dwelling of a higher level magic-user*' shilia = stomp spider
/def -F -p1 -i -t'This is a huge hall that has once been used as the halls of justice and*' demon_of_justice = stomp spider
/def -F -p1 -i -t'Tiger has summoned you\!' tigerhas_summoned = wimpy very high;;kill tiger;;de tiger
/def -F -p1 -i -t'A curtain of blackness tries to close in front of your eyes.' tigertulitanne = wimpy very high;;kill tiger;;de tiger
