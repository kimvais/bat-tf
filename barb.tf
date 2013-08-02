/eval /load -q %{TRIGDIR}lure.tf

;Commandit
/def -i -h'SEND {bcry} *' command_bcry = use battlecry at %-1%;giant loom %-1%;earmark %-1%;target %-1
/def -i -h'SEND {burn}' command_burn = party say BURNING!%;use looting and burning%;light torch%;/repeat -3 1 drop all corpse
/def -i -h'SEND {bb}' command_bb = barbarian binfo thiamin
/def -i -h'SEND {lure} *' command_lure = use lure at %-1   
/def cmd_f1=use impale
/def cmd_f4=use lure
/def cmd_f2=use pound
/def cmd_f3=use cleave

;Notski
/def -t'You fail to start the fire.' fire_fail = /command_fire
/def -h'SEND {fire}' command_fire = use fire building


;Poltto
/def -i -t'You use torch to do the skill.' burn_done = extinguish torch

;Repu
/def -ag -i -t'Reputation bar:'
/def -ag -mregexp -i -t'^\[([X]*)([@]*)([#]*)([:]*)([.]*)\]$' poikelot=\
/set oldrepu=%newrepu%;\
/set kymppitonnit=%P1%;/set tonnit=%P2%;/set satkut=%P3%;/set kympit=%P4%;/set ykkoset=%P5%;\
/set newrepu=\
$[10000*strlen(kymppitonnit)+1000*strlen(tonnit)+100*strlen(satkut)+10*strlen(kympit)+strlen(ykkoset)]%;\
/set repulisa=$[ %newrepu - %oldrepu ]%;\
/set repustringi=$[strcat(kymppitonnit,tonnit,satkut,kympit,ykkoset)]%;\
/echo -p @{n}             @{BCyellow}%newrepu@{n} (+@{BCgreen}%repulisa@{n})%;\
/echo -p @{n}             [%repustringi]
/def -mregexp -PRB -t'Reputation:  ' reputitle 

/def autoloot=get corpse;;gac

;Idletank
/def -t'^Zithromax points at (.+) meaningfully and nods his head\.$' zithrotarget = target %{P1}
/def -t'\*Zithromax shouts: \'FOR PRIDE AND VALOR!\'.' zithrocry = /repeat -1.5 1 use lure
