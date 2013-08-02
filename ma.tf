;;************************************************************
;;
;; Ma-laskuri v2.0 by Kimmo@Parviainen.cc
;; based on 
;; hittilaskuri 2.release, jkotka@cc.tut.fi
;; 10.6.2000 
;;************************************************************
;; Thanks to Macala & Buddhaman for help with the messages
;  19 Beyond tells you 'bearhug, kick, circle kick, back-kick ...'
;    20 (20:27) Beyond tells you 'ja noi menee keskella: attack, leg-twist, side-kick
	 

/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bearhug " ma_bearhug=/set mahit15=$[mahit15+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+) you strike " ma_strike=/set mahit14=$[mahit14+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou gouge " ma_gouge=/set mahit13=$[mahit13+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou thud " ma_thud=/set mahit12=$[mahit12+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou side-kick " ma_sikick=/set mahit11=$[mahit11+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou leg-twist " ma_legtwist=/set mahit10=$[mahit10+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou attack " ma_attack=/set mahit9=$[mahit9+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou stomp " ma_stomp=/set mahit8=$[mahit8+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou lunge " ma_lunge=/set mahit7=$[mahit7+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou spin-kick " ma_spkick=/set mahit6=$[mahit6+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou stomp-kick " ma_stkick=/set mahit5=$[mahit5+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou circle kick " ma_ckick=/set mahit4=$[mahit4+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou smash " ma_smash=/set mahit3=$[mahit3+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou kick " ma_kick=/set mahit2=$[mahit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou step " ma_step =/set mahit1=$[mahit1+1]
/def -Fp1 -mglob -i -t"* successfully dodges your futile kick." ma_dodges =/set madod=$[madod+1] 
/def -Fp1 -mglob -i -t"* successfully parries your kick." ma_parries =/set mapar=$[mapar+1] 
/def -aBCblack -i -t"You miss *" missi=/set miss=$[miss+1]


/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou spank " ua_spank =/set uahit1=$[uahit1+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou smack " ua_smack =/set uahit2=$[uahit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slap " ma_slap =/set uahit3=$[uahit3+1]
/def -Fp5 -mregexp -i -t"^You strike " ua_strike =/set uahit4=$[uahit4+1]
;/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou boot " ma_step =/set uahit5=$[uahit5+1]
;/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou step " ma_step =/set uahit6=$[uahit6+1]
;/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou step " ma_step =/set uahit7=$[uahit7+1]
;/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou step " ma_step =/set uahit8=$[uahit8+1]
;/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou step " ma_step =/set uahit9=$[uahit9+1]
;/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou step " ma_step =/set uahit10=$[uahit10+1]

/def -i -h'SEND mastats' hittelot=\
	/set total=$[mahit1+mahit2+mahit3+mahit4+mahit5+mahit6+mahit7+mahit8+mahit9+mahit10+mahit11+mahit12+mahit13+mahit14+mahit15]%;\
	/echo -ah Hits scored%;\
	/echo .......................................%;\
	/echo -p Bearhug	:@{h}%mahit15@{n} (@{h}%$[(mahit15*100)/total]\@{n}\%)%;\
        /echo -p Strike		:@{h}%mahit14@{n} (@{h}%$[(mahit14*100)/total]\@{n}\%)%;\
        /echo -p Gouge	        :@{h}%mahit13@{n} (@{h}%$[(mahit13*100)/total]\@{n}\%)%;\
        /echo -p Leg-twist	:@{h}%mahit10@{n} (@{h}%$[(mahit10*100)/total]\@{n}\%)%;\
	/echo -p Thud		:@{h}%mahit12@{n} (@{h}%$[(mahit12*100)/total]\@{n}\%)%;\
	/echo -p Side-kick	:@{h}%mahit11@{n} (@{h}%$[(mahit11*100)/total]\@{n}\%)%;\
	/echo -p Attack		:@{h}%mahit9@{n} (@{h}%$[(mahit9*100)/total]\@{n}\%)%;\
	/echo -p Lunge          :@{h}%mahit7@{n} (@{h}%$[(mahit7*100)/total]\@{n}\%)%;\
	/echo -p Stomp		:@{h}%mahit8@{n} (@{h}%$[(mahit8*100)/total]\@{n}\%)%;\
	/echo -p Spin-kick  	:@{h}%mahit6@{n} (@{h}%$[(mahit6*100)/total]\@{n}\%)%;\
	/echo -p Stomp-kick     :@{h}%mahit5@{n} (@{h}%$[(mahit5*100)/total]\@{n}\%)%;\
	/echo -p Circle kick    :@{h}%mahit4@{n} (@{h}%$[(mahit4*100)/total]\@{n}\%)%;\
	/echo -p Smash    	:@{h}%mahit3@{n} (@{h}%$[(mahit3*100)/total]\@{n}\%)%;\
	/echo -p Kick           :@{h}%mahit2@{n} (@{h}%$[(mahit2*100)/total]\@{n}\%)%;\
	/echo -p Step 		:@{h}%mahit1@{n} (@{h}%$[(mahit1*100)/total]\@{n}\%)%;\
	/echo ........................................%;\
	/echo -p @{h}%total \($[(100*total)/((total+miss+mapar+madod))]\%\)@{n} hits scored.%;\
	/echo -p @{h}%miss \($[(100*miss)/((total+miss+mapar+madod))]\%\)@{n}  hits missed.%;\
	/echo -p @{h}%mapar \($[(100*maparl)/((total+miss+mapar+madod))]\%\)@{n} hits parried.%;\
	/echo -p @{h}%madod \($[(100*madod)/((total+miss+mapar+madod))]\%\)@{n} hits dodged.%;\

/def -i nollaa_mastats=\
 /set mahit1=0%;\
 /set mahit2=0%;\
 /set mahit3=0%;\
 /set mahit4=0%;\
 /set mahit5=0%;\
 /set mahit6=0%;\
 /set mahit7=0%;\
 /set mahit8=0%;\
 /set mahit9=0%;\
 /set mahit10=0%;\
 /set mahit11=0%;\
 /set mahit12=0%;\
 /set mahit13=0%;\
 /set mahit14=0%;\
 /set mahit15=0%;\
 /set madod=0%;\
 /set mapar=0%;\
 /set miss=0

/nollaa_mastats
