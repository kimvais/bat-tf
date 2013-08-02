;;************************************************************
;;
;; Hittilaskuri v3.0rc1 by Kimmo "Kimvais" Parviainen <k@77.fi>
;; loosely based on 
;; hittilaskuri 2.release, jkotka@cc.tut.fi
;; 10.6.2000 
;;************************************************************
;Broetchen (party): Gashes/butts: 0 (0.0%)                                                            
;    Broetchen (party): Lthumps/bumps: 0 (0.0%))                                                         
;    Broetchen (party): Cuts/thumps: 82 (3.2%)                                                         
;    Broetchen (party): Tears/strokes: 1431 (56.0%)                                                   
;    Broetchen (party): Incises/thrusts: 667 (26.1%)                                      
;    Broetchen (party): Shreds/jabs: 371 (14.5%)  
;; Thanks to Macala & Buddhaman for help with the messages
;  19 Beyond tells you 'bearhug, kick, circle kick, back-kick ...'
;    20 (20:27) Beyond tells you 'ja noi menee keskella: attack, leg-twist, side-kick


;; *** USER VARIABLES ***
/set limb1_name=Right hand
/set limb2_name=Left hand
/set limb3_name=none
/set limb4_name=none
/set limb1_type=slash
/set limb2_type=slash
/set limb3_type=unarmed
/set limb4_type=unarmed

;; *** MACROS ***
/def hit = /eval /set limb=$[++limb]%;\
	   /eval /set hit_%{1}_%{limb}_%{2}=$$[++hit_%{1}_%{limb}_%{2}]%;\
	   /set total=$[++total]
/def miss = /eval /set limb=$[++limb]%;\
	    /eval /set miss_%{limb}=$$[++miss_%{limb}]
/def dodge =/eval /set limb=$[++limb]%;\
	    /eval /set dodge=$$[++dodge_%{limb}]
/def parry =/eval /set limb=$[++limb]%;\
	    /eval /set parry=$$[++parry_%{limb}]
	    
/def -i nollaa_hitstats=\
	/for j 1 4 \
		/for i 1 25 \
  			/eval /set hit_slash_%%{j}_%%%{i}=0%%%;\
  			/eval /set hit_crush_%%{j}_%%%{i}=0%%%;\
  			/eval /set hit_puncture_%%{j}_%%%{i}=0%%%;\
  			/eval /set hit_ma_%%{j}_%%%{i}=0%%%;\
  			/eval /set hit_unarmed_%%{j}_%%%{i}=0%%;\
  		/eval /set miss_%%j=0%%;/eval /set dodge_%%j=0%%;/eval /set parry_%%j=0%%;\
 	/set total=0

;;; *** TRIGS ***
/def -p1 -F -aBCcyan -mregexp -i -t'^[*]{53}$' battle_round = /set limb=0%;/echo_report
;; Bashing hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY BEAT " cr_att23=/hit crush 23
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BARBARICALLY BASH " cr_att22=/hit crush 22
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely sock " cr_att21=/hit crush 21
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely strike " cr_att20=/hit crush 20
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou horribly thrust " cr_att19=/hit crush 19
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou badly smash " cr_att18=/hit crush 18
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly beat " cr_att17=/hit crush 17
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou smash " cr_att16=/hit crush 16
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou whack " cr_att15=/hit crush 15
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou beat " cr_att14=/hit crush 14
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou flail " cr_att13=/hit crush 13
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou knock " cr_att12=/hit crush 12
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cuff " cr_att11=/hit crush 1
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou sock " cr_att10=/hit crush 10
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou strike " cr_att9=/hit crush 9
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bash " cr_att8=/hit crush 8
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou jab " cr_att7=/hit crush 7
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou thrust " cr_att6=/hit crush 6
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou stroke " cr_att5=/hit crush 5
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou thump " cr_att4=/hit crush 4
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bump " cr_att3=/hit crush 3
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou butt " cr_att2=/hit crush 2
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou jostle " cr_att1 =/hit crush 1
;; Cutting hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou DISMEMBER " sl_att23=/hit slash 23
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou CRUELLY REND " sl_att22=/hit slash 22
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou SAVAGELY SHRED " sl_att21=/hit slash 21
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY TEAR " sl_att20=/hit slash 20
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely rip " sl_att19=/hit slash 19
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou quickly cut " sl_att18=/hit slash 18
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly slash " sl_att17=/hit slash 17
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou uncontrollably slash " sl_att16=/hit slash 16
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely shave " sl_att15=/hit slash 15
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou rive " sl_att14=/hit slash 14
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly tatter " sl_att13=/hit slash 13
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slit " sl_att12=/hit slash 12
/def -Fp5 -mregexp -i -t" you pierce " sl_att11=/hit slash 11
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou incisively cut " sl_att10=/hit slash 10
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slash " sl_att9=/hit slash 9
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou horribly shred " sl_att8=/hit slash 8
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou shred " sl_att7=/hit slash 7
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou incise " sl_att6=/hit slash 6
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou tear " sl_att5=/hit slash 5
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cut " sl_att4=/hit slash 4
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou lightly cut " sl_att3=/hit slash 3
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou gash " sl_att2=/hit slash 2
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou solidly slash " sl_att1 =/hit slash 1
;; Stabbing hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BRUTALLY BORE " pu_att4=/hit puncture 24
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou REALLY DRILL " pu_att23=/hit puncture 23
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou CRUELLY RIDDLE " pu_att22=/hit puncture 22
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou BARBARICALLY PIERCE " pu_att21=/hit puncture 21
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou savagely shaft " pu_att20=/hit puncture 20
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cruelly crater " pu_att19=/hit puncture 19
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou powerfully perforate " pu_att18=/hit puncture 18
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou powerfully pierce " pu_att17=/hit puncture 17
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou gorge " pu_att16=/hit puncture 16
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou chasm " pu_att15=/hit puncture 15
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou drill " pu_att14=/hit puncture 14
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou dig through " pu_att13=/hit puncture 13
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou dig into " pu_att12=/hit puncture 12
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou riddle " pu_att11=/hit puncture 11
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou really poke " pu_att10=/hit puncture 10
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou shaft " pu_att9=/hit puncture 9
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou cavitate " pu_att8=/hit puncture 8
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou crater " pu_att7=/hit puncture 7
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bore " pu_att6=/hit puncture 6
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou sink " pu_att5=/hit puncture 5
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou puncture " pu_att4=/hit puncture 4
/def -Fp5 -mregexp -i -t"^You pierce " pu_att3=/hit puncture 3
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slightly pierce " pu_att2 =/hit puncture 2
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou scratch " pu_att1=/hit puncture 1

;; Martial arts hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou bearhug " ma_bearhug=/hit ma 15
/def -Fp5 -mregexp -i -t"^([A-z| ]+) you strike " ma_strike=/hit ma 14
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou gouge " ma_gouge=/hit ma 13
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou thud " ma_thud=/hit ma 12
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou side-kick " ma_sikick=/hit ma 11
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou leg-twist " ma_legtwist=/hit ma 10
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou attack " ma_attack=/hit ma 9
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou stomp " ma_stomp=/hit ma 8
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou lunge " ma_lunge=/hit ma 7
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou spin-kick " ma_spkick=/hit ma 6
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou stomp-kick " ma_stkick=/hit ma 5
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou circle kick " ma_ckick=/hit ma 4
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou smash " ma_smash=/hit ma 3
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou kick " ma_kick=/hit ma 2
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou step " ma_step =/hit ma 1

;; Unarmed hits
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou spank " ua_spank =/hit unarmed 1
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou smack " ua_smack =/hit unarmed 2
/def -Fp5 -mregexp -i -t"^([A-z| ]+)?[Yy]ou slap " ma_slap =/hit unarmed 3
/def -Fp5 -mregexp -i -t"^You strike " ua_strike =/hit unarmed 4

;; Dodges, parries, misses
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile pierce." pu_dodges =/dodge puncture
/def -Fp1 -mglob -i -aBCblack -t"* successfully parries your pierce." pu_parries =/parry puncture
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile slash." sl_dodges =/dodge slash
/def -Fp1 -mglob -i -aBCblack -t"* successfully dodges your futile bash." cr_dodges =/dodge crush
/def -Fp1 -mglob -i -aBCblack -t"* successfully parries your slash." sl_parries =/parry slash
/def -Fp1 -mglob -i -aBCBlack -t"* successfully parries your bash." cr_parries =/parry crush
/def -Fp1 -mglob -i -t"* successfully dodges your futile kick." ma_dodges =/dodge ma
/def -Fp1 -mglob -i -t"* successfully parries your kick." ma_parries =/parry ma
/def -aBCblack -i -t"You miss *" missi=/miss

/nollaa_hitstats

;; Output
/def print_hit_stats=\
	/eval /echo $[strcat(pad(limb2_name,-26),pad(limb1_name,-26),pad(limb3_name,-26),pad(limb4_name,-26))]%;\
	/eval /echo -- $[strrep("-",26*4)]%;\
	/let i=15%;\
	/while ( i > 0)\
	/eval /echo $$[strcat(\
		 	      pad(hit_%{limb2_type}_name_%{i},-15),\
		              pad(hit_%{limb2_type}_2_%{i},5),\
			      pad( strcat(hit_%{limb2_type}_2_%{i}*100/total,"\%"),4 ),"  ",\
		 	      pad(hit_%{limb1_type}_name_%{i},-15),\
		              pad(hit_%{limb1_type}_1_%{i},5),\
			      pad( strcat(hit_%{limb1_type}_1_%{i}*100/total,"\%"),4 ),"  ",\
		 	      pad(hit_%{limb3_type}_name_%{i},-15),\
		              pad(hit_%{limb3_type}_3_%{i},5),\
			      pad( strcat(hit_%{limb3_type}_3_%{i}*100/total,"\%"),4 ),"  ",\
		 	      pad(hit_%{limb4_type}_name_%{i},-15),\
		              pad(hit_%{limb4_type}_4_%{i},5),\
			      pad( strcat(hit_%{limb4_type}_4_%{i}*100/total,"\%"),4 ))]%;\
		/let i=$[--i]%;\
		/done%;\
	/eval /echo -- $[strrep("-",26*4)]%;\
	/eval /echo $[strcat(pad("dodge",-15),pad(dodge_2,5),pad(strcat(dodge_2*100/total,"\%"),5),"  ",\
			     pad("dodge",-15),pad(dodge_1,5),pad(strcat(dodge_1*100/total,"\%"),5),"  ",\
			     pad("dodge",-15),pad(dodge_3,5),pad(strcat(dodge_3*100/total,"\%"),5),"  ",\
			     pad("dodge",-15),pad(dodge_4,5),pad(strcat(dodge_4*100/total,"\%"),5))]%;\
	/eval /echo $[strcat(pad("parry",-15),pad(parry_2,5),pad(strcat(parry_2*100/total,"\%"),5),"  ",\
			     pad("parry",-15),pad(parry_1,5),pad(strcat(parry_1*100/total,"\%"),5),"  ",\
			     pad("parry",-15),pad(parry_3,5),pad(strcat(parry_3*100/total,"\%"),5),"  ",\
			     pad("parry",-15),pad(parry_4,5),pad(strcat(parry_4*100/total,"\%"),5))]%;\
	/eval /echo $[strcat(pad("miss",-15),pad(miss_2,5),pad(strcat(miss_2*100/total,"\%"),5),"  ",\
			     pad("miss",-15),pad(miss_1,5),pad(strcat(miss_1*100/total,"\%"),5),"  ",\
			     pad("miss",-15),pad(miss_3,5),pad(strcat(miss_3*100/total,"\%"),5),"  ",\
			     pad("miss",-15),pad(miss_4,5),pad(strcat(miss_4*100/total,"\%"),5))]
			     
/def -i -h'SEND hitstats' command_hitstats = /print_hit_stats

;; Iskujen nimet
/set hit_slash_name_1=solidly slash
/set hit_slash_name_2=gash
/set hit_slash_name_3=lightly cut
/set hit_slash_name_4=cut
/set hit_slash_name_5=tear
/set hit_slash_name_6=incise
/set hit_slash_name_7=shred
/set hit_slash_name_8=horribly shred
/set hit_slash_name_9=slash
/set hit_slash_name_10=incisively cut
/set hit_slash_name_11=pierce
/set hit_slash_name_12=slit
/set hit_slash_name_13=cruelly tatter
/set hit_slash_name_14=rive
/set hit_slash_name_15=savagely shave
/set hit_slash_name_16=uncontrollably slash
/set hit_slash_name_17=cruelly slash
/set hit_slash_name_18=quickly cut
/set hit_slash_name_19=savagely rip
/set hit_slash_name_20=BRUTALLY TEAR
/set hit_slash_name_21=SAVAGELY SHRED
/set hit_slash_name_22=CRUELLY REND
/set hit_slash_name_23=DISMEMBER
/set hit_slash_name_24=?
/set hit_crush_name_1=?
/set hit_crush_name_2=?
/set hit_crush_name_3=?
/set hit_crush_name_4=?
/set hit_crush_name_5=?
/set hit_crush_name_6=?
/set hit_crush_name_7=?
/set hit_crush_name_8=?
/set hit_crush_name_9=?
/set hit_crush_name_10=?
/set hit_crush_name_11=?
/set hit_crush_name_12=?
/set hit_crush_name_13=?
/set hit_crush_name_14=?
/set hit_crush_name_15=?
/set hit_crush_name_16=?
/set hit_crush_name_17=?
/set hit_crush_name_18=?
/set hit_crush_name_19=?
/set hit_crush_name_20=?
/set hit_crush_name_21=?
/set hit_crush_name_22=?
/set hit_crush_name_23=?
/set hit_crush_name_24=?
/set hit_puncture_name_1=?
/set hit_puncture_name_2=?
/set hit_puncture_name_3=?
/set hit_puncture_name_4=?
/set hit_puncture_name_5=?
/set hit_puncture_name_6=?
/set hit_puncture_name_7=?
/set hit_puncture_name_8=?
/set hit_puncture_name_9=?
/set hit_puncture_name_10=?
/set hit_puncture_name_11=?
/set hit_puncture_name_12=?
/set hit_puncture_name_13=?
/set hit_puncture_name_14=?
/set hit_puncture_name_15=?
/set hit_puncture_name_16=?
/set hit_puncture_name_17=?
/set hit_puncture_name_18=?
/set hit_puncture_name_19=?
/set hit_puncture_name_20=?
/set hit_puncture_name_21=?
/set hit_puncture_name_22=?
/set hit_puncture_name_23=?
/set hit_puncture_name_24=?
/set hit_puncture_name_25=?
/set hit_ma_name_1=step
/set hit_ma_name_2=kick
/set hit_ma_name_3=smash
/set hit_ma_name_4=circle kick
/set hit_ma_name_5=stomp-kick
/set hit_ma_name_6=spin-kick
/set hit_ma_name_7=stomp
/set hit_ma_name_8=lunge
/set hit_ma_name_9=attack
/set hit_ma_name_10=side-kick
/set hit_ma_name_11=thud
/set hit_ma_name_12=leg-twist
/set hit_ma_name_13=gouge
/set hit_ma_name_14=strike
/set hit_ma_name_15=bearhug
/set hit_ma_name_16=?
/set hit_ma_name_17=?
/set hit_ma_name_18=?
/set hit_ma_name_19=?
/set hit_ma_name_20=?
/set hit_ma_name_21=?
/set hit_ma_name_22=?
/set hit_ma_name_23=?
/set hit_ma_name_24=?
/set hit_ma_name_25=?
/set hit_unarmed_name_1=spank
/set hit_unarmed_name_2=smack
/set hit_unarmed_name_3=slap
/set hit_unarmed_name_4=strike
/set hit_unarmed_name_5=boot
/set hit_unarmed_name_6=kick
/set hit_unarmed_name_7=sock
/set hit_unarmed_name_8=stomp
/set hit_unarmed_name_9=dragon-punch
/set hit_unarmed_name_10=headbutt
/set hit_unarmed_name_11=savagely 3-kick
/set hit_unarmed_name_12=cruelly hdbutt
/set hit_unarmed_name_13=uppercut
/set hit_unarmed_name_14=?
/set hit_unarmed_name_15=?
/set hit_unarmed_name_16=?
/set hit_unarmed_name_17=?
/set hit_unarmed_name_18=?
/set hit_unarmed_name_19=?
/set hit_unarmed_name_20=?
/set hit_unarmed_name_21=?
/set hit_unarmed_name_22=?
/set hit_unarmed_name_23=?
/set hit_unarmed_name_24=?
/set hit_unarmed_name_25=?
;	/echo -ah Hits scored%;\
;	/echo .......................................%;\
;	/echo -p DISMEMBER      :@{h}%slhit23@{n} (@{h}%$[(slhit23*100)/total]\@{n}\%)  \
;             BRUTALLY BEAT  :@{h}%crhit23@{n} (@{h}%$[(crhit23*100)/total]\@{n}\%)  \
;             REALLY DRILL   :@{h}%puhit23@{n} (@{h}%$[(puhit23*100)/total]\@{n}\%)%;\
;	/echo -p CRUELLY REND   :@{h}%slhit22@{n} (@{h}%$[(slhit22*100)/total]\@{n}\%)  \
;             BARBARARIC.BASH:@{h}%crhit22@{n} (@{h}%$[(crhit22*100)/total]\@{n}\%)  \
;             CRUELLY RIDDLE :@{h}%puhit22@{n} (@{h}%$[(puhit22*100)/total]\@{n}\%)%;\
;	/echo -p SAVAGELY SHRED :@{h}%slhit21@{n} (@{h}%$[(slhit21*100)/total]\@{n}\%)  \
;             Savagely sock  :@{h}%crhit21@{n} (@{h}%$[(crhit21*100)/total]\@{n}\%)  \
;             BARBARIC.PIERCE:@{h}%puhit21@{n} (@{h}%$[(puhit21*100)/total]\@{n}\%)%;\
;	/echo -p BRUTALLY TEAR  :@{h}%slhit20@{n} (@{h}%$[(slhit20*100)/total]\@{n}\%)  \
;             Savagely strike:@{h}%crhit20@{n} (@{h}%$[(crhit20*100)/total]\@{n}\%)  \
;             Savagely shaft :@{h}%puhit20@{n} (@{h}%$[(puhit20*100)/total]\@{n}\%)%;\
;	/echo -p Savagely rip   :@{h}%slhit19@{n} (@{h}%$[(slhit19*100)/total]\@{n}\%)  \
;             Horribly thrust:@{h}%crhit19@{n} (@{h}%$[(crhit19*100)/total]\@{n}\%)  \
;             Cruelly crater :@{h}%puhit19@{n} (@{h}%$[(puhit19*100)/total]\@{n}\%)%;\
;	/echo -p Quicly cut     :@{h}%slhit18@{n} (@{h}%$[(slhit18*100)/total]\@{n}\%)  \
;             Badly smash    :@{h}%crhit18@{n} (@{h}%$[(crhit18*100)/total]\@{n}\%)  \
;             Power.perforate:@{h}%puhit18@{n} (@{h}%$[(puhit18*100)/total]\@{n}\%)%;\
;	/echo -p Cruelly slash  :@{h}%slhit17@{n} (@{h}%$[(slhit17*100)/total]\@{n}\%)  \
;             Cruelly beat   :@{h}%crhit17@{n} (@{h}%$[(crhit17*100)/total]\@{n}\%)  \
;             Powerful.pierce:@{h}%puhit17@{n} (@{h}%$[(puhit17*100)/total]\@{n}\%)%;\
;	/echo -p Uncontrol.slash:@{h}%slhit16@{n} (@{h}%$[(slhit16*100)/total]\@{n}\%)  \
;             Smash          :@{h}%crhit16@{n} (@{h}%$[(crhit16*100)/total]\@{n}\%)  \
;             Chasm   	    :@{h}%puhit15@{n} (@{h}%$[(puhit15*100)/total]\@{n}\%)%;\
;	/echo -p Savagely shave :@{h}%slhit15@{n} (@{h}%$[(slhit15*100)/total]\@{n}\%)  \
;             Whack          :@{h}%crhit15@{n} (@{h}%$[(crhit15*100)/total]\@{n}\%)  \
;             Drill          :@{h}%puhit14@{n} (@{h}%$[(puhit14*100)/total]\@{n}\%)%;\
;	/echo -p Rive           :@{h}%slhit14@{n} (@{h}%$[(slhit14*100)/total]\@{n}\%)  \
;             Beat           :@{h}%crhit14@{n} (@{h}%$[(crhit14*100)/total]\@{n}\%)  \
;             Dig through    :@{h}%puhit13@{n} (@{h}%$[(puhit13*100)/total]\@{n}\%)%;\
;    /echo -p Cruelly tatter :@{h}%slhit13@{n} (@{h}%$[(slhit13*100)/total]\@{n}\%)  \
;             Flail          :@{h}%crhit13@{n} (@{h}%$[(crhit13*100)/total]\@{n}\%)  \
;             Dig into  	    :@{h}%puhit12@{n} (@{h}%$[(puhit12*100)/total]\@{n}\%)%;\
;    /echo -p Slit           :@{h}%slhit12@{n} (@{h}%$[(slhit12*100)/total]\@{n}\%)  \
;             Knock          :@{h}%crhit12@{n} (@{h}%$[(crhit12*100)/total]\@{n}\%)  \
;             Riddle  	    :@{h}%puhit11@{n} (@{h}%$[(puhit11*100)/total]\@{n}\%)%;\
;	/echo -p Pierce         :@{h}%slhit11@{n} (@{h}%$[(slhit11*100)/total]\@{n}\%)  \
;             Cuff           :@{h}%crhit11@{n} (@{h}%$[(crhit11*100)/total]\@{n}\%)  \
;             Really poke    :@{h}%puhit10@{n} (@{h}%$[(puhit10*100)/total]\@{n}\%)%;\
;	/echo -p Incisively cut :@{h}%slhit10@{n} (@{h}%$[(slhit10*100)/total]\@{n}\%)  \
;             Sock           :@{h}%crhit10@{n} (@{h}%$[(crhit10*100)/total]\@{n}\%)  \
;             Shaft  	    :@{h}%puhit9@{n} (@{h}%$[(puhit9*100)/total]\@{n}\%)%;\
;    /echo -p Slash          :@{h}%slhit9@{n} (@{h}%$[(slhit9*100)/total]\@{n}\%)  \
;             Strike         :@{h}%crhit9@{n} (@{h}%$[(crhit9*100)/total]\@{n}\%)  \
;             Gorge  	    :@{h}%puhit16@{n} (@{h}%$[(puhit16*100)/total]\@{n}\%)%;\
;	/echo -p Horribly shred :@{h}%slhit8@{n} (@{h}%$[(slhit8*100)/total]\@{n}\%)  \
;             Bash           :@{h}%crhit8@{n} (@{h}%$[(crhit8*100)/total]\@{n}\%)  \
;             Cavitate	    :@{h}%puhit8@{n} (@{h}%$[(puhit8*100)/total]\@{n}\%)%;\
;	/echo -p Shred          :@{h}%slhit7@{n} (@{h}%$[(slhit7*100)/total]\@{n}\%)  \
;             Jab            :@{h}%crhit7@{n} (@{h}%$[(crhit7*100)/total]\@{n}\%)  \
;             Crater         :@{h}%puhit7@{n} (@{h}%$[(puhit7*100)/total]\@{n}\%)%;\
;	/echo -p Incise         :@{h}%slhit6@{n} (@{h}%$[(slhit6*100)/total]\@{n}\%)  \
;             Thrust         :@{h}%crhit6@{n} (@{h}%$[(crhit6*100)/total]\@{n}\%)  \
;             Bore           :@{h}%puhit6@{n} (@{h}%$[(puhit6*100)/total]\@{n}\%)%;\
;	/echo -p Tear           :@{h}%slhit5@{n} (@{h}%$[(slhit5*100)/total]\@{n}\%)  \
;             Stroke         :@{h}%crhit5@{n} (@{h}%$[(crhit5*100)/total]\@{n}\%)  \
;             Sink           :@{h}%puhit5@{n} (@{h}%$[(puhit5*100)/total]\@{n}\%)%;\
;	/echo -p Cut            :@{h}%slhit4@{n} (@{h}%$[(slhit4*100)/total]\@{n}\%)  \
;             Thump          :@{h}%crhit4@{n} (@{h}%$[(crhit4*100)/total]\@{n}\%)  \
;             Puncture	    :@{h}%puhit4@{n} (@{h}%$[(puhit4*100)/total]\@{n}\%)%;\
;	/echo -p Lightly cut    :@{h}%slhit3@{n} (@{h}%$[(slhit3*100)/total]\@{n}\%)  \
;             Bump           :@{h}%crhit3@{n} (@{h}%$[(crhit3*100)/total]\@{n}\%)  \
;             Pierce         :@{h}%puhit3@{n} (@{h}%$[(puhit3*100)/total]\@{n}\%)%;\
;	/echo -p Gash           :@{h}%slhit2@{n} (@{h}%$[(slhit2*100)/total]\@{n}\%)  \
;             Butt           :@{h}%crhit2@{n} (@{h}%$[(crhit2*100)/total]\@{n}\%)  \
;             Slightly pierce:@{h}%puhit2@{n} (@{h}%$[(puhit2*100)/total]\@{n}\%)%;\
;	/echo -p Solidly slash  :@{h}%slhit1@{n} (@{h}%$[(slhit1*100)/total]\@{n}\%)  \
;             Jostle         :@{h}%crhit1@{n} (@{h}%$[(crhit1*100)/total]\@{n}\%)  \
;             Scratch        :@{h}%puhit1@{n} (@{h}%$[(puhit1*100)/total]\@{n}\%)%;\
;    /echo ........................................%;\
;	/echo -p @{h}%total \($[(100*total)/((total+miss+hitpar+hitdod))]\%\)@{n} hits scored.%;\
;	/echo -p @{h}%miss \($[(100*miss)/((total+miss+hitpar+hitdod))]\%\)@{n}  hits missed.%;\
;	/echo -p @{h}%hitpar \($[(100*hitpar)/((total+miss+hitpar+hitdod))]\%\)@{n} hits parried.%;\
;	/echo -p @{h}%hitdod \($[(100*hitdod)/((total+miss+hitpar+hitdod))]\%\)@{n} hits dodged.%;\
;
;
;	 
;/def -i -h'SEND mastats' hittelot=\
;	/echo -ah Hits scored%;\
;	/echo .......................................%;\
;	/echo -p Bearhug	:\
;	@{h}%hit_ma_1_15@{n} (@{h}%$[(hit_ma_1_15*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_15@{n} (@{h}%$[(hit_ma_2_15*100)/total]\@{n}\%)\
;	%;\
;        /echo -p Strike		:\
;	@{h}%hit_ma_1_14@{n} (@{h}%$[(hit_ma_1_14*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_14@{n} (@{h}%$[(hit_ma_2_14*100)/total]\@{n}\%)\
;	%;\
;        /echo -p Gouge	        :\
;	@{h}%hit_ma_1_13@{n} (@{h}%$[(hit_ma_1_13*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_13@{n} (@{h}%$[(hit_ma_2_13*100)/total]\@{n}\%)\
;	%;\
;        /echo -p Leg-twist	:\
;	@{h}%hit_ma_1_10@{n} (@{h}%$[(hit_ma_1_10*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_10@{n} (@{h}%$[(hit_ma_2_10*100)/total]\@{n}\%)\
;	%;\
;	/echo -p Thud		:\
;	@{h}%hit_ma_1_12@{n} (@{h}%$[(hit_ma_1_12*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_12@{n} (@{h}%$[(hit_ma_2_12*100)/total]\@{n}\%)\
;	%;\
;	/echo -p Side-kick	:\
;	@{h}%hit_ma_1_11@{n} (@{h}%$[(hit_ma_1_11*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_11@{n} (@{h}%$[(hit_ma_2_11*100)/total]\@{n}\%)\
;	%;\
;	/echo -p Attack		:\
;	@{h}%hit_ma_1_9@{n} (@{h}%$[(hit_ma_1_9*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_9@{n} (@{h}%$[(hit_ma_2_9*100)/total]\@{n}\%)\
;	%;\
;	/echo -p Lunge          :\
;	@{h}%hit_ma_1_7@{n} (@{h}%$[(hit_ma_1_7*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_7@{n} (@{h}%$[(hit_ma_2_7*100)/total]\@{n}\%)\
;	%;\
;	/echo -p Stomp		:\
;	@{h}%hit_ma_1_8@{n} (@{h}%$[(hit_ma_1_8*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_8@{n} (@{h}%$[(hit_ma_2_8*100)/total]\@{n}\%)\
;	%;\
;	/echo -p Spin-kick  	:\
;	@{h}%hit_ma_1_6@{n} (@{h}%$[(hit_ma_1_6*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_6@{n} (@{h}%$[(hit_ma_2_6*100)/total]\@{n}\%)\
;	%;\
;	/echo -p Stomp-kick     :\
;	@{h}%hit_ma_1_5@{n} (@{h}%$[(hit_ma_1_5*100)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_5@{n} (@{h}%$[(hit_ma_2_5*100)/total]\@{n}\%)\
;	%;\
;	/echo -p Circle kick    :\
;	@{h}%hit_ma_1_4@{n} (@{h}%$[pad(hit_ma_1_4*100,4)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_4@{n} (@{h}%$[pad(hit_ma_2_4*100,4)/total]\@{n}\%)\
;	%;\
;	/echo -p Smash    	:\
;	@{h}%hit_ma_1_3@{n} (@{h}%$[pad(hit_ma_1_3*100,4)/total]\@{n}\%)  \
;	@{h}%hit_ma_2_3@{n} (@{h}%$[pad(hit_ma_2_3*100,4)/total]\@{n}\%)\
;	%;\
;	/echo -p Kick           :\
;	@{h}%hit_ma_1_2@{n} (@{h}$[pad(hit_ma_1_2*100,4)/total]@{n}\%)  \
;	@{h}%hit_ma_2_2@{n} (@{h}$[pad(hit_ma_2_2*100,10)/total]@{n}\%)\
;	%;\
;	/eval /echo $[pad("Step",10)]:\
;	@{h}%hit_ma_1_1@{n} (@{h}$[pad(hit_ma_1_1*100,3)/total]@{n}\%)  \
;	@{h}%hit_ma_2_1@{n} (@{h}$[pad(hit_ma_2_1*100,4)/total]@{n}\%)\
;	%;\
;	/echo ........................................%;\
;	/echo -p @{h}%total \($[(100*total)/((total+miss+mapar+madod))]\%\)@{n} hits scored.%;\
;	/echo -p @{h}%miss \($[(100*miss)/((total+miss+mapar+madod))]\%\)@{n}  hits missed.%;\
;	/echo -p @{h}%mapar \($[(100*maparl)/((total+miss+mapar+madod))]\%\)@{n} hits parried.%;\
;	/echo -p @{h}%madod \($[(100*madod)/((total+miss+mapar+madod))]\%\)@{n} hits dodged.%;\
