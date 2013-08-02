/def -ag -mregexp -i -t'\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\|' gaspamlines    
/def -ag -mglob -i -t'You hear a crackle and * screams in agony as Sharon' sharon1
/def -ag -mglob -i -t'takes out her frustrations with a lightning bolt spell\!' sharon2
/def -ag -mglob -i -t'* misses you\.' someone_misses_me
/def -ag -Fp2 -mregexp -i -t'^[A-Z][a-z]+ misses [A-Z][a-z]+\.$' someone_misses_someone
/def -ag -i -t'A Guardsman is keeping watch here' guardsman_gag
/def -ag -mregexp -i -t'^You have nothing called \'(mowgles|zinc|tin|copper)\'!' rahadrop
/def -ag -mregexp -i -t'^(\[[0-9]{2}:[0-9]{2}\]:)?[A-Z][A-Za-z ]+ .kirahvi[+].: <sk>:' sk_gag
;/def -mregexp -ag -i -t'^[A-Z][a-z]+ sings:' bardigag    
;/def -mregexp -ag -i -t'^[A-Z][a-z]+ starts to hum and sing.$' bardigag2    
;/def -mregexp -ag -i -t'^You sing:' bardigag3   
/def -ag -i -t'A firework explodes * in the sky.' raketti-ignore      
;/def -ag -i -t'Total of * experience spent in reincarnation taxes.' reinc_loss
/def -ag -mregexp -i -t'^Rebirth experience: ([0-9]+)' rebirth_exp = /set rebirth_exp=%{P1}
/def -ag -mregexp -i -t'^[*].* is slightly annoying\.$' rankkulintu1
/def -ag -mregexp -i -t'^[*].* soars up into the sky and shits, it lands on ' rankkulintu2
/def -ag -mregexp -i -t'^[*].* is sooo cool\.$' rankkulintu3
/def -ag -mregexp -i -t'^[*].* stares intently at ' rankkulint4
/def -ag -mregexp -i -t'^[*].* cocks its head to the side\.$' rankkulintu5
/def -ag -mregexp -i -t'^[*].* squawks at ' rankkulintu6
/def -ag -h"REDEF" redef_spam_off
/def -iag -t'The crystal pulses warmly as it recognizes you as one of its students.' nav_crystal_trainspam
;;rumascore
/def -ag -i -t'  \(* level, * guild, * area, * player, * awards\)' rumascore
;;donaspam
/def -ag -i -t'You have no such item (all key).' lootspam1
/def -ag -i -t'Keep list kept intact.' lootspam2
/def -ag -i -t'You have no such item (all box).' lootspam3
/def -ag -i -t'You have no such item (all chest).' lootspam4
/def -ag -i -t'Damogran tells you: Thanks for helping newbies. Poster has been delivered to you.' lootspam5
/def -ag -i -t'You tell Damogran (monster) \'poster\'' lootspam6
/def -ag -i -t'Your magical charity poster is surrounded in strange mist.' lootspam7
/def -ag -i -t'Damogran says \'a magical charity poster is way too close item for you to be abandoned!\'' lootspam8
/def -ag -i -t'You had nothing to toss.' lootspam9 
/def -ag -i -t'You rip the poster to small pieces. The pieces vanish.' lootspam10
/def -ag -i -t'You put all your mithril in the purse.' lootspam11
/def -ag -i -t'You put all your batium in the purse.' lootspam12                                      
/def -ag -i -t'You put all your anipium in the purse.' lootspam13
/def -ag -i -t'You put all your platinum in the purse.' lootspam14
/def -ag -i -t'You put 1000 gold in the purse.' lootspam15

;gIgnoret
/def -mregexp -i -ag -t'^(Broetchen|Gotrek) shouts ' turhanhuutelijat
