/def -i swap = /if (st_swap =~ "REG") /swaptocbt%;/else /swaptoreg%;/endif

; tarmaekut 17.10.2003
;/set healerset=bands,turban,green glove,vest of yak,green glove 2,opal ring 2,opal ring,stone amulet,golden belt,ruby necklace,robe

;/set sprset=leggings,purple glove,circlet,shirt,purple glove 2,ruby ring,ruby ring 2,fang necklace,pendant of apathy,ice belt,magic cloak

;/set spr_set=ruby ring,ruby ring 2,circlet,fang necklace
;/set combat_set=opal ring,emerald ring,turban,ruby necklace

;Conjuekut 5.2.2004
;/set combat_set=tabard,leather bag,green glove,green glove 2,opal ring,opal ring 2,dah'bec crown,golden belt
;/set combat_wpn1=rust claw the holy hammer
;/set combat_wpn2=

;/set spr_set=shirt,purple glove,purple glove 2,ruby ring,ruby ring 2,fang necklace,circlet,ice belt
; Monk set / tiger set
/set combat_set=opal ring,opal ring 2,amazon breastplate
/set spr_set=ruby ring,ruby ring 2,tabard,green glove,green glove 2

/def -ag -i -h'SEND {swapcbt}*' swaptocbt = /set st_swap=CBT%;\
    /eval remove %spr_set%;\
    /eval wear %combat_set%;\
    /if (combat_wpn1 !~ '') wield %{combat_wpn1} in 1%;/endif%;\
    /if (combat_wpn2 !~ '') wield %{combat_wpn2} in 2%;/endif%;\
    ready
/def -ag -i -h'SEND {swapreg}*' swaptoreg = /set st_swap=REG%;\
    /eval remove %combat_set%;\
;    /if (combat_wpn1 !~ '') remove %{combat_wpn1}%;/endif%;\
;    /if (combat_wpn2 !~ '') remove %{combat_wpn2}%;/endif%;\
    /eval wear %spr_set%;\
    emote is whoring

/def cmd_f9 = /swaptoreg
/def cmd_shift-f9 = /swaptocbt

