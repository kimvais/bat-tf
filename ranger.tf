/eval /load -q %{TRIGDIR}lure.tf

;Commandit
/def -i -h'SEND {bcry} *' command_bcry = use battlecry at %-1%;giant loom %-1%;earmark %-1%;target %-1
/def -i -h'SEND {burn}' command_burn = party say BURNING!%;use looting and burning%;light torch%;/repeat -3 1 drop all corpse
/def -i -h'SEND {bf}' command_bf = use bladed fury at %-1
/def -i -h'SEND {lure} *' command_lure = use lure at %-1   
/def cmd_f1=use bladed fury
/def cmd_f4=use lure
/def cmd_f2=use pound
/def cmd_f3=use cleave

;Notski
/def -t'You fail to start the fire.' fire_fail = /command_fire
/def -h'SEND {fire}' command_fire = use fire building

/def autoloot=get corpse;;gac
