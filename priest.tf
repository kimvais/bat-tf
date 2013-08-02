;;Priest
/def -i -h'SEND {ane} *' command_ane = cast aneurysm at %-1%;alias tgt %-1
/def -i -h'SEND {aoh} *' command_aoh = cast aura of hate at %-1
/def -i -h'SEND {cw} *' command_cw = cast 'cause critical wounds' %-1
/def -i -h'SEND {damn} *' command_damn = cast damn armament at %-1
/def -i -h'SEND {dd} *' command_dd = use 'cardiac stimulation' %-1
/def -i -h'SEND {fa} *' command_fa = use 'cardiac stimulation' %-1
/def -i -h'SEND {habo} *' command_habo = cast harm body at %-1%;alias tgt %-1
/def -i -h'SEND {hemo} *' command_hemo = cast 'hemorrhage' %-1
/def -i -h'SEND {pfg} *' command_pfg = cast protection from good at %-1
/def -i -h'SEND {scar} *' command_scar = cast make scar at %-1                                              
/def -i -h'SEND {sac} *' command_sac = use evil intent at %-1

;Priest
/def -i -aCbgmagenta -aCblack -mregexp -t'^You harm (.| )+ (really much|a lot|some)\.$' harmhit = emote harmittaa.%;/set harm_hits=$[harm_hits+1]
/def -i -aCbgred -aCblack -t'You fail to reach *' harmfail = emote ei harmita yht‰‰n.%;/set harm_misses=$[harm_misses+1]
/def -i -aBCred -t'You use your left hand for channeling harmful powers.' damnarmament_down

/def -i -h'SEND {harmit}' harmstats = \
	/set total=$[harm_hits+harm_misses]%;\
	/echo -ah Harm statistics%;\
	/echo .......................................%;\
        /echo -p Hits       :@{h}%harm_hits@{n} (@{h}%$[(harm_hits*100)/total]\@{n}\%)%;\
        /echo -p Misses     :@{h}%harm_misses@{n} (@{h}%$[(harm_misses*100)/total]\@{n}\%)%
