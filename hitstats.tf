;;************************************************************
;;
;; Hittilaskuri v2.1 by thiamin@batmud.bat.org
;; based on 
;; hittilaskuri 2.release, jkotka@cc.tut.fi
;; 10.6.2000 
;;************************************************************
;Broetchen (party): Gashes/butts: 0 (0.0%)                                                            
;    Broetchen (party): Lthumps/bumps: 0 (0.0%))                                                         
;    Broetchen (party): Cuts/thumps: 82 (3.2%)                                                         
;    Broetchen (party): Tears/strokes: 1431 (56.0%)                                                   
;    Broetchen (party): Incises/thrusts: 667 (26.1%)                                      
;    Broetchen (party): Shreds/jabs: 371 (14.5%)  

;; Bashing hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY BEAT " cr_att23=/set crhit23=$[crhit23+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BARBARICALLY BASH " cr_att22=/set crhit22=$[crhit22+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely sock " cr_att21=/set crhit21=$[crhit21+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely strike " cr_att20=/set crhit20=$[crhit20+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou horribly thrust " cr_att19=/set crhit19=$[crhit19+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou badly smash " cr_att18=/set crhit18=$[crhit18+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly beat " cr_att17=/set crhit17=$[crhit17+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou smash " cr_att16=/set crhit16=$[crhit16+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou whack " cr_att15=/set crhit15=$[crhit15+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou beat " cr_att14=/set crhit14=$[crhit14+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou flail " cr_att13=/set crhit13=$[crhit13+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou knock " cr_att12=/set crhit12=$[crhit12+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cuff " cr_att11=/set crhit11=$[crhit11+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou sock " cr_att10=/set crhit10=$[crhit10+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou strike " cr_att9=/set crhit9=$[crhit9+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bash " cr_att8=/set crhit8=$[crhit8+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou jab " cr_att7=/set crhit7=$[crhit7+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou thrust " cr_att6=/set crhit6=$[crhit6+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou stroke " cr_att5=/set crhit5=$[crhit5+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou thump " cr_att4=/set crhit4=$[crhit4+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bump " cr_att3=/set crhit3=$[crhit3+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou butt " cr_att2=/set crhit2=$[crhit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou jostle " cr_att1 =/set crhit1=$[crhit1+1]
;; Cutting hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou DISMEMBER " sl_att23=/set slhit23=$[slhit23+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou CRUELLY REND " sl_att22=/set slhit22=$[slhit22+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou SAVAGELY SHRED " sl_att21=/set slhit21=$[slhit21+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY TEAR " sl_att20=/set slhit20=$[slhit20+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely rip " sl_att19=/set slhit19=$[slhit19+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou quickly cut " sl_att18=/set slhit18=$[slhit18+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly slash " sl_att17=/set slhit17=$[slhit17+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou uncontrollably slash " sl_att16=/set slhit16=$[slhit16+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely shave " sl_att15=/set slhit15=$[slhit15+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou rive " sl_att14=/set slhit14=$[slhit14+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly tatter " sl_att13=/set slhit13=$[slhit13+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slit " sl_att12=/set slhit12=$[slhit12+1]
/def -Fp5 -mregexp -i -t" you pierce " sl_att11=/set slhit11=$[slhit11+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou incisively cut " sl_att10=/set slhit10=$[slhit10+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slash " sl_att9=/set slhit9=$[slhit9+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou horribly shred " sl_att8=/set slhit8=$[slhit8+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou shred " sl_att7=/set slhit7=$[slhit7+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou incise " sl_att6=/set slhit6=$[slhit6+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou tear " sl_att5=/set slhit5=$[slhit5+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cut " sl_att4=/set slhit4=$[slhit4+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou lightly cut " sl_att3=/set slhit3=$[slhit3+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou gash " sl_att2=/set slhit2=$[slhit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou solidly slash " sl_att1 =/set slhit1=$[slhit1+1]
;; Stabbing hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY BORE " pu_att4=/set puhit24=$[puhit24+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou REALLY DRILL " pu_att23=/set puhit23=$[puhit23+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou CRUELLY RIDDLE " pu_att22=/set puhit22=$[puhit22+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BARBARICALLY PIERCE " pu_att21=/set puhit21=$[puhit21+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely shaft " pu_att20=/set puhit20=$[puhit20+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly crater " pu_att19=/set puhit19=$[puhit19+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou powerfully perforate " pu_att18=/set puhit18=$[puhit18+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou powerfully pierce " pu_att17=/set puhit17=$[puhit17+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou gorge " pu_att16=/set puhit16=$[puhit16+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou chasm " pu_att15=/set puhit15=$[puhit15+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou drill " pu_att14=/set puhit14=$[puhit14+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou dig through " pu_att13=/set puhit13=$[puhit13+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou dig into " pu_att12=/set puhit12=$[puhit12+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou riddle " pu_att11=/set puhit11=$[puhit11+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou really poke " pu_att10=/set puhit10=$[puhit10+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou shaft " pu_att9=/set puhit9=$[puhit9+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cavitate " pu_att8=/set puhit8=$[puhit8+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou crater " pu_att7=/set puhit7=$[puhit7+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bore " pu_att6=/set puhit6=$[puhit6+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou sink " pu_att5=/set puhit5=$[puhit5+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou puncture " pu_att4=/set puhit4=$[puhit4+1]
/def -Fp5 -mregexp -i -t"^You pierce " pu_att3=/set puhit3=$[puhit3+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slightly pierce " pu_att2 =/set puhit2=$[puhit2+1]
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou scratch " pu_att1=/set puhit1=$[puhit1+1]
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile pierce." pu_dodges =/set hitdod=$[hitdod+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully parries your pierce." pu_parries =/set hitpar=$[hitpar+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile slash." sl_dodges =/set hitdod=$[hitdod+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile bash." cr_dodges =/set hitdod=$[hitdod+1] 
/def -Fp1 -mglob -i -aBCblack -t"* successfully parries your slash." sl_parries =/set hitpar=$[hitpar+1] 
/def -Fp1 -mglob -i -aBCBlack -t"* successfully parries your bash." cr_parries =/set hitpar=$[hitpar+1] 
/def -aBCblack -i -t"You miss *" missi=/set miss=$[miss+1]

/def -i -h'SEND hitstats' hittelot=\
	/set total=$[slhit1+slhit2+slhit3+slhit4+slhit5+slhit6+slhit7+slhit8+slhit9+slhit10+slhit11+slhit12+slhit13+slhit14+slhit15+slhit16+slhit17+slhit18+slhit19+slhit20+slhit21+slhit22+slhit23+crhit1+crhit2+crhit3+crhit4+crhit5+crhit6+crhit7+crhit8+crhit9+crhit10+crhit11+crhit12+crhit13+crhit14+crhit15+crhit16+crhit17+crhit18+crhit19+crhit20+crhit21+crhit22+crhit23+puhit1+puhit2+puhit3+puhit4+puhit5+puhit6+puhit7+puhit8+puhit9+puhit10+puhit11+puhit12+puhit13+puhit14+puhit15+puhit16+puhit17+puhit18+puhit19+puhit20+puhit21+puhit22+puhit23]%;\
	/echo -ah Hits scored%;\
	/echo .......................................%;\
	/echo -p DISMEMBER      :@{h}%slhit23@{n} (@{h}%$[(slhit23*100)/total]\@{n}\%)  \
             BRUTALLY BEAT  :@{h}%crhit23@{n} (@{h}%$[(crhit23*100)/total]\@{n}\%)  \
             REALLY DRILL   :@{h}%puhit23@{n} (@{h}%$[(puhit23*100)/total]\@{n}\%)%;\
	/echo -p CRUELLY REND   :@{h}%slhit22@{n} (@{h}%$[(slhit22*100)/total]\@{n}\%)  \
             BARBARARIC.BASH:@{h}%crhit22@{n} (@{h}%$[(crhit22*100)/total]\@{n}\%)  \
             CRUELLY RIDDLE :@{h}%puhit22@{n} (@{h}%$[(puhit22*100)/total]\@{n}\%)%;\
	/echo -p SAVAGELY SHRED :@{h}%slhit21@{n} (@{h}%$[(slhit21*100)/total]\@{n}\%)  \
             Savagely sock  :@{h}%crhit21@{n} (@{h}%$[(crhit21*100)/total]\@{n}\%)  \
             BARBARIC.PIERCE:@{h}%puhit21@{n} (@{h}%$[(puhit21*100)/total]\@{n}\%)%;\
	/echo -p BRUTALLY TEAR  :@{h}%slhit20@{n} (@{h}%$[(slhit20*100)/total]\@{n}\%)  \
             Savagely strike:@{h}%crhit20@{n} (@{h}%$[(crhit20*100)/total]\@{n}\%)  \
             Savagely shaft :@{h}%puhit20@{n} (@{h}%$[(puhit20*100)/total]\@{n}\%)%;\
	/echo -p Savagely rip   :@{h}%slhit19@{n} (@{h}%$[(slhit19*100)/total]\@{n}\%)  \
             Horribly thrust:@{h}%crhit19@{n} (@{h}%$[(crhit19*100)/total]\@{n}\%)  \
             Cruelly crater :@{h}%puhit19@{n} (@{h}%$[(puhit19*100)/total]\@{n}\%)%;\
	/echo -p Quicly cut     :@{h}%slhit18@{n} (@{h}%$[(slhit18*100)/total]\@{n}\%)  \
             Badly smash    :@{h}%crhit18@{n} (@{h}%$[(crhit18*100)/total]\@{n}\%)  \
             Power.perforate:@{h}%puhit18@{n} (@{h}%$[(puhit18*100)/total]\@{n}\%)%;\
	/echo -p Cruelly slash  :@{h}%slhit17@{n} (@{h}%$[(slhit17*100)/total]\@{n}\%)  \
             Cruelly beat   :@{h}%crhit17@{n} (@{h}%$[(crhit17*100)/total]\@{n}\%)  \
             Powerful.pierce:@{h}%puhit17@{n} (@{h}%$[(puhit17*100)/total]\@{n}\%)%;\
	/echo -p Uncontrol.slash:@{h}%slhit16@{n} (@{h}%$[(slhit16*100)/total]\@{n}\%)  \
             Smash          :@{h}%crhit16@{n} (@{h}%$[(crhit16*100)/total]\@{n}\%)  \
             Chasm   	    :@{h}%puhit15@{n} (@{h}%$[(puhit15*100)/total]\@{n}\%)%;\
	/echo -p Savagely shave :@{h}%slhit15@{n} (@{h}%$[(slhit15*100)/total]\@{n}\%)  \
             Whack          :@{h}%crhit15@{n} (@{h}%$[(crhit15*100)/total]\@{n}\%)  \
             Drill          :@{h}%puhit14@{n} (@{h}%$[(puhit14*100)/total]\@{n}\%)%;\
	/echo -p Rive           :@{h}%slhit14@{n} (@{h}%$[(slhit14*100)/total]\@{n}\%)  \
             Beat           :@{h}%crhit14@{n} (@{h}%$[(crhit14*100)/total]\@{n}\%)  \
             Dig through    :@{h}%puhit13@{n} (@{h}%$[(puhit13*100)/total]\@{n}\%)%;\
    /echo -p Cruelly tatter :@{h}%slhit13@{n} (@{h}%$[(slhit13*100)/total]\@{n}\%)  \
             Flail          :@{h}%crhit13@{n} (@{h}%$[(crhit13*100)/total]\@{n}\%)  \
             Dig into  	    :@{h}%puhit12@{n} (@{h}%$[(puhit12*100)/total]\@{n}\%)%;\
    /echo -p Slit           :@{h}%slhit12@{n} (@{h}%$[(slhit12*100)/total]\@{n}\%)  \
             Knock          :@{h}%crhit12@{n} (@{h}%$[(crhit12*100)/total]\@{n}\%)  \
             Riddle  	    :@{h}%puhit11@{n} (@{h}%$[(puhit11*100)/total]\@{n}\%)%;\
	/echo -p Pierce         :@{h}%slhit11@{n} (@{h}%$[(slhit11*100)/total]\@{n}\%)  \
             Cuff           :@{h}%crhit11@{n} (@{h}%$[(crhit11*100)/total]\@{n}\%)  \
             Really poke    :@{h}%puhit10@{n} (@{h}%$[(puhit10*100)/total]\@{n}\%)%;\
	/echo -p Incisively cut :@{h}%slhit10@{n} (@{h}%$[(slhit10*100)/total]\@{n}\%)  \
             Sock           :@{h}%crhit10@{n} (@{h}%$[(crhit10*100)/total]\@{n}\%)  \
             Shaft  	    :@{h}%puhit9@{n} (@{h}%$[(puhit9*100)/total]\@{n}\%)%;\
    /echo -p Slash          :@{h}%slhit9@{n} (@{h}%$[(slhit9*100)/total]\@{n}\%)  \
             Strike         :@{h}%crhit9@{n} (@{h}%$[(crhit9*100)/total]\@{n}\%)  \
             Gorge  	    :@{h}%puhit16@{n} (@{h}%$[(puhit16*100)/total]\@{n}\%)%;\
	/echo -p Horribly shred :@{h}%slhit8@{n} (@{h}%$[(slhit8*100)/total]\@{n}\%)  \
             Bash           :@{h}%crhit8@{n} (@{h}%$[(crhit8*100)/total]\@{n}\%)  \
             Cavitate	    :@{h}%puhit8@{n} (@{h}%$[(puhit8*100)/total]\@{n}\%)%;\
	/echo -p Shred          :@{h}%slhit7@{n} (@{h}%$[(slhit7*100)/total]\@{n}\%)  \
             Jab            :@{h}%crhit7@{n} (@{h}%$[(crhit7*100)/total]\@{n}\%)  \
             Crater         :@{h}%puhit7@{n} (@{h}%$[(puhit7*100)/total]\@{n}\%)%;\
	/echo -p Incise         :@{h}%slhit6@{n} (@{h}%$[(slhit6*100)/total]\@{n}\%)  \
             Thrust         :@{h}%crhit6@{n} (@{h}%$[(crhit6*100)/total]\@{n}\%)  \
             Bore           :@{h}%puhit6@{n} (@{h}%$[(puhit6*100)/total]\@{n}\%)%;\
	/echo -p Tear           :@{h}%slhit5@{n} (@{h}%$[(slhit5*100)/total]\@{n}\%)  \
             Stroke         :@{h}%crhit5@{n} (@{h}%$[(crhit5*100)/total]\@{n}\%)  \
             Sink           :@{h}%puhit5@{n} (@{h}%$[(puhit5*100)/total]\@{n}\%)%;\
	/echo -p Cut            :@{h}%slhit4@{n} (@{h}%$[(slhit4*100)/total]\@{n}\%)  \
             Thump          :@{h}%crhit4@{n} (@{h}%$[(crhit4*100)/total]\@{n}\%)  \
             Puncture	    :@{h}%puhit4@{n} (@{h}%$[(puhit4*100)/total]\@{n}\%)%;\
	/echo -p Lightly cut    :@{h}%slhit3@{n} (@{h}%$[(slhit3*100)/total]\@{n}\%)  \
             Bump           :@{h}%crhit3@{n} (@{h}%$[(crhit3*100)/total]\@{n}\%)  \
             Pierce         :@{h}%puhit3@{n} (@{h}%$[(puhit3*100)/total]\@{n}\%)%;\
	/echo -p Gash           :@{h}%slhit2@{n} (@{h}%$[(slhit2*100)/total]\@{n}\%)  \
             Butt           :@{h}%crhit2@{n} (@{h}%$[(crhit2*100)/total]\@{n}\%)  \
             Slightly pierce:@{h}%puhit2@{n} (@{h}%$[(puhit2*100)/total]\@{n}\%)%;\
	/echo -p Solidly slash  :@{h}%slhit1@{n} (@{h}%$[(slhit1*100)/total]\@{n}\%)  \
             Jostle         :@{h}%crhit1@{n} (@{h}%$[(crhit1*100)/total]\@{n}\%)  \
             Scratch        :@{h}%puhit1@{n} (@{h}%$[(puhit1*100)/total]\@{n}\%)%;\
    /echo ........................................%;\
	/echo -p @{h}%total \($[(100*total)/((total+miss+hitpar+hitdod))]\%\)@{n} hits scored.%;\
	/echo -p @{h}%miss \($[(100*miss)/((total+miss+hitpar+hitdod))]\%\)@{n}  hits missed.%;\
	/echo -p @{h}%hitpar \($[(100*hitpar)/((total+miss+hitpar+hitdod))]\%\)@{n} hits parried.%;\
	/echo -p @{h}%hitdod \($[(100*hitdod)/((total+miss+hitpar+hitdod))]\%\)@{n} hits dodged.%;\

/def -i nollaa_hitstats=\
 /set slhit1=0%;\
 /set slhit2=0%;\
 /set slhit3=0%;\
 /set slhit4=0%;\
 /set slhit5=0%;\
 /set slhit6=0%;\
 /set slhit7=0%;\
 /set slhit8=0%;\
 /set slhit9=0%;\
 /set slhit10=0%;\
 /set slhit11=0%;\
 /set slhit12=0%;\
 /set slhit13=0%;\
 /set slhit14=0%;\
 /set slhit15=0%;\
 /set slhit16=0%;\
 /set slhit17=0%;\
 /set slhit18=0%;\
 /set slhit19=0%;\
 /set slhit20=0%;\
 /set slhit21=0%;\
 /set slhit22=0%;\
 /set crhit1=0%;\
 /set crhit2=0%;\
 /set crhit3=0%;\
 /set crhit4=0%;\
 /set crhit5=0%;\
 /set crhit6=0%;\
 /set crhit7=0%;\
 /set crhit8=0%;\
 /set crhit9=0%;\
 /set crhit10=0%;\
 /set crhit11=0%;\
 /set crhit12=0%;\
 /set crhit13=0%;\
 /set crhit14=0%;\
 /set crhit15=0%;\
 /set crhit16=0%;\
 /set crhit17=0%;\
 /set crhit18=0%;\
 /set crhit19=0%;\
 /set crhit20=0%;\
 /set crhit21=0%;\
 /set crhit22=0%;\
 /set crhit23=0%;\
 /set puhit1=0%;\
 /set puhit2=0%;\
 /set puhit3=0%;\
 /set puhit4=0%;\
 /set puhit5=0%;\
 /set puhit6=0%;\
 /set puhit7=0%;\
 /set puhit8=0%;\
 /set puhit9=0%;\
 /set puhit10=0%;\
 /set puhit11=0%;\
 /set puhit12=0%;\
 /set puhit13=0%;\
 /set puhit14=0%;\
 /set puhit15=0%;\
 /set puhit16=0%;\
 /set puhit17=0%;\
 /set puhit18=0%;\
 /set puhit19=0%;\
 /set puhit20=0%;\
 /set puhit21=0%;\
 /set puhit22=0%;\
 /set puhit23=0%;\
 /set slhit23=0%;\
 /set hitdod=0%;\
 /set hitpar=0%;\
 /set miss=0

/nollaa_hitstats

