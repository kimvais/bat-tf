;MOVEMENT
/def -i -B'Down' arrowdown = /dokey_down
/def -i -B'Left' arrowleft = /dokey_left
/def -i -B'Right' arrowright = /dokey_right
/def -i -B'Up' arrowup = /dokey_up
/def -i -b'^[KP1' kp1 = /move sw
/def -i -b'^[KP2' kp2 = /move s
/def -i -b'^[KP3' kp3 = /move se
/def -i -b'^[KP4' kp4 = /move w
/def -i -b'^[KP6' kp6 = /move e
/def -i -b'^[KP7' kp7 = /move nw
/def -i -b'^[KP8' kp8 = /move n
/def -i -b'^[KP9' kp9 = /move ne
/def -i -b'^[OM' kbenter = /dokey newline
/def -i -b'^[Op' kp0 = /eval k %lastkilled
/def -i -b'^[Ou' kp5 = /cmd_kp5

/def key_nkp1 = /move sw
/def key_nkp2 = /move s
/def key_nkp3 = /move se
/def key_nkp4 = /move w
/def key_nkp6 = /move e
/def key_nkp7 = /move nw
/def key_nkp8 = /move n
/def key_nkp9 = /move ne
/def -i move = /set dir=%*%;/if (logging_paths) /test fwrite("~/bat/log/path.log",dir)%;/endif%;/send %dir

;Misc commands
/def -i -B'Insert' kbinsert = /if (kblen()>0) /dokey_insert%;/else !kill%;/endif

;Funkkarimakrot
/def -i -b'^[OP' f1 = /cmd_f1
/def -i -b'^[OQ' f2 = /cmd_f2 
/def -i -b'^[OR' f3 = /cmd_f3
/def -i -b'^[OS' f4 = /cmd_f4
/def -i -b'^[[15~' f5 = /cmd_f5
/def -i -B'F6' f6 = /cmd_f6
/def -i -B'F7' f7 = /cmd_f7
/def -i -b'^[[19~' f8 =  /cmd_f8
/def -i -b'^[[20~' f9 = /cmd_f9
/def -i -b'^[[33~' shift-f9 = /cmd_shift-f9

/def -i -h'SEND {tgt} *' tgt_set = alias tgt %{-1}%;party say skilltarget locked: %{-1}


/def -i -B'F10' f10 = /cmd_f10 
/def -i -B'F11' f11 = /cmd_f11
/def -i -B'F12' f12 = /cmd_f12
/def -h'SEND {biisi}' mikabiisi = /quote -S /echo -aB Now playing: !whatsplaying.sh


;/def -i -b'^[[[A' f1 = use iron palm at tgt
;/def -i -b'^[[[B' f2 = use 'iron palm'
;/def -i -b'^[Ot' kb4 = /move w
;/def -i -b'^[Ov' kb6 = /move e
;/def -i -b'^[Or' kb2 = /move s
;/def -i -b'^[Ox' kb8 = /move n
;/def -i -b'^[[1~' kb7 = /move nw
;/def -i -b'^[Oq' kb1 = /move sw
;/def -i -b'^[[4~' kb1 = /move sw
;/def -i -b'^[[5~' kb9 = /move ne
;/def -i -b'^[Oy' kb9 = /move ne
;/def -i -b'^[[6~' kb3 = /move se
