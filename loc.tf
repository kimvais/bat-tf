;;Commands for loc
/def -i -h'SEND {inc}' command_inc = cast chaotic warp at increase

/def -mregexp -t'^You perform the ceremony.$' cere_up = /set st_cere=C
/def -mregexp -t'^You start chanting.$' cere_down = /set st_cere=

;/eval /load -q slash.tf
/eval /load -q %{TRIGDIR}clw.tf
