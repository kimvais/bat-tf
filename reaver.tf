/def cmd_f1 = cast word of spite
/def cmd_f2 = use scythe swipe
/def cmd_f3 = use rampant cutting
/def cmd_f4 = cast word of spite at human
/def cmd_f5 = cast word of blasting                                                                   /def cmd_f6 = cast word of slaughter

/def -h'SEND {cer}' cmd_cer = use prayer to destruction at spell
/def -h'SEND {ces}' cmd_ces = use prayer to destruction at skill
/def -i -b'^[Op' kp0 = /eval c %lastkilled
/def -i -h'SEND {c} *' command_c = cast word of spite at %-1%;target %-1%;/set lastkilled=%.1
/def -i -h'SEND {dr} *' command_dr = cast detect race at %-1
/def -i -h'SEND {glory}' cmd_glory = cast glory of destruction at amount 100
/def -i -h'SEND {wb}*' command_wb = cast 'word of blasting' %-1
/def -i -p1 -mglob -h'SEND {v} *' command_v = use scythe swipe at %-1
/def -p1 -mglob -h'SEND {cer}' cmd_cer = use prayer to destruction at spell
/def -p1 -mglob -h'SEND {ces}' cmd_ces = use prayer to destruction at skill
/def -i -h'SEND {sac} *' command_sac = cast word of attrition at %-1

/def -p1 -t'Your body swells in anticipation of the battles to come.' = party say GLOORIAA!
/def -p1 -t'The destructive forces leave your body.' = party say Glory of destruction downn
