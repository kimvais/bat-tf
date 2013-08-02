/eval /load %{TRIGDIR}clw.tf
/eval /load %{TRIGDIR}tigerma.tf

/def cmd_f1=use iron palm
/def cmd_f2=cast tiger claw
/def cmd_f3=cast spider wrath

/def -P1Cgreen -aBCred -t'Kill! Kill ([A-Z][a-z]+)! Kill! Now!' tiger_mission = /set missiontarget=%{P1}
/def -i -h'SEND {claw} *' command_claw = cast tiger claw at %-1%;file %-1
/def -i -h'SEND {mak} *' command_mak = use dim mak at %-1%;slit %-1
/def -i -h'SEND {ip}*' command_ip = use 'iron palm' %-1
/nollaa_mastats
