; Duergar
;/def -mregexp -t'^([A-Z][a-z]+) arrives from' tmp = /if (idle()>30) @@duergar dlook %{P1}%;/endif

;; rulettiquesti /quote -1 bet 2858 coins on '~/numerot

/eval /load -q %{TRIGDIR}consider.tf
/set LOGDIR=/home/basic/home/kimvais/bat/log/
/set TRIGDIR=/home/basic/home/kimvais/bat/trig/
/eval /set AGELOG=%{LOGDIR}age.log
/eval /set EXPLOG=%{LOGDIR}exp.log
/eval /set NEWCMD=%{TRIGDIR}newcmds.tf

;Hellikeikka
/def -i -t'You can see Death, clad in black, collect your corpse.' you_die = party say *dies.*%;\
/eval /test time:=ftime("%%H:%%M:%%S", time())%;\
        /echo -aCgreen %time: %{*}
/def -i -t'You feel a bit older.' aged_a_bit = grep \'You are\' score%;\
 /eval /test $[fwrite({AGELOG},strcat($[ftime("%d/%m/%y %H:%M:%S",time())]," ",%*))] 

;Ambush
/def set_ambushed = /if (!ambushed) /set ambushed=$[ambushed+1]%%;/repeat -1 1 report_ambushed%;/endif
/def report_ambushed = /if (ambushed>0) @@party say *IS STANDING AMBUSHED AND CANNOT FOLLOW!*%;/endif%;/repeat -5 1 /set ambushed=0
/def -i -t'Your keen senses note a disturbance seconds before the ambush!' alertness_worked = /set ambushed=$[ambushed-1]
/def -i -t'Your superb dexterity avoids a nasty ambush.' not_ambushed1 = /set ambushed=$[ambushed-1]
/def -i -t"Your knowledge about *'s tactics allows you to evade the ambush." not_ambushed2 = /set ambushed=$[ambushed-1]
/def -i -t'Your marvelous intellect avoids a nasty ambush.' not_ambushed3 = /set ambushed=$[ambushed-1]
/def -i -t'Your small size avoids a nasty ambush.' not_ambushed4 = /set ambushed=$[ambushed-1]
/eval /def -i -t"* cackles 'Go ahead, %{capsname}, make my day!'" aamb1 = /set_ambushed
/eval /def -i -t"* exclaims 'You got guts to come back, %{capsname}! too bad I have to kick your ass!'" aamb2 = /set_ambushed
/eval /def -i -t"* grins evilly and cackles 'So you came back for more, %{capsname}\?'" aamb3 = /set_ambushed
/eval /def -i -t"* lectures 'Someone soon has to scrape your remains from the floor, %{capsname}!" aamb4 = /set_ambushed
/eval /def -i -t"* mocks 'Bonjour, %{capsname}\. So we meet again, eh\?'" aamb5 = /set_ambushed
/eval /def -i -t"* mocks '%{capsname}, hope your life insurance is still valid!'" aamb6 = /set_ambushed
/eval /def -i -t"* smiles madly and threatens 'I was only warming up, %{capsname}\. This time i'll get mad!'" aamb7 = /set_ambushed
/eval /def -i -t"* snarls 'Grr, %{capsname}, let me put you out of your misery this time!'" aamb8 = /set_ambushed
/eval /def -i -t"* snarls 'I remember your ugly face, %{capsname}!'" aamb9 = /set_ambushed
/eval /def -i -t"* states 'After i'm done with you, %{capsname}, you will be nothing but dog food!'" aamb10  = /set_ambushed
/eval /def -i -t"* threatens 'This time you won't escape, %{capsname}\.'" aamb11 = /set_ambushed
/eval /def -i -t"* yawns sarcastically and says 'Well %{capsname} guess it's time for your daily beating!'" aamb12  = /set_ambushed
/def -i -t'You cannot leave, you have been AMBUSHED.' am_ambushed = p' EI PYSTY, OON JUMISSA!

;Jano
/def -aCred -i -t'You are THIRSTY*' thirsty = water on%;drink water%;water off%;drink fountain 
/def -aCred -i -t'You are DEHYDRATING rapidly.' dehydrate = drink water%;drink fountain 
;/def -i -t'This is the tall entrance hall to the church of all Gods. *' churchentrance = drink fountain
;/def -i -t'   x.....  You just entered Twigaland, which is a beautiful place within this*' twiga_fountain = drink fountain

;Age
/def -i -t'You feel older.' aged_some =  grep \'You are\' score%;\
 /eval /test (fwrite({AGELOG},strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ",%*))) 
/def -i -t'You feel much older.' aged_much =  grep \'You are\' score%;\
 /eval /test (fwrite({AGELOG},strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ",%*))) 

/def -mregexp -p2 -i -t'You are [A-z \,]+ very young [A-z \,]+\.' score_age1 = \
 /eval /test $[fwrite({AGELOG},strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ","Very young"))]
/def -mregexp -p3 -i -t'You are [A-z \,]+ young [A-z \,]+\.' score_age2 = \
 /eval /test $[fwrite({AGELOG},strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ","Young"))]
/def -mregexp -p1 -i -t'You are [A-z \,]+, middle aged [A-z \,]+\.' score_age3 = \
 /eval /test $[fwrite({AGELOG},strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ","Middle aged"))]
/def -mregexp -p2 -i -t'You are [A-z \,]+ old [A-z \,]+\.' score_age4 = \
 /eval /test $[fwrite({AGELOG},strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ","Old"))]
/def -mregexp -p1 -i -t'You are [A-z \,]+ very old [A-z \,]+\.' score_age5 = \
 /eval /test $[fwrite({AGELOG},strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ","Very old"))]
/def -mregexp -p1 -i -t'You are [A-z \,]+ ancient [A-z \,]+\.' score_age6 = \
 /eval /test $[fwrite({AGELOG},strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ","Ancient"))]

;Reinc
/def -mregexp -i -t'^You are now (a|an) ([a-z]+).$' race_changed = \
 /eval /test (fwrite({AGELOG,strcat((ftime("%d/%m/%y %H:%M:%S",time()))," ","** REINC to ",%P2)))

;;Bloodin donaus
/def blooddonate=/eval set no_look_at_move on%;20 w;;sw;;S;;sw;;W;;w;;SW;;w;;2 s;;transport church;;2 e;;n;;ne;;11 n;;14 e;;18 n;;3 e;;ne;;7 e;;5 s;;2 se;;10 s;;w;;n;;say donate $[%{cur_hp}-1]%;say donate 1%;\
	s;;e;;10 n;;2 nw;;5 n;;7 w;;sw;;8 w;;nw;;12 w;;11 s;;3 w;;n;;r2;;withdraw 2250%;\
	s;;2 w;;sw;;2 s;;se;;e;;s%;lotto%;\
	n;;w;;sw;;4 s;;sw;;8 w;;6 sw;;20 e;;3 e;;ne;;5 n;;20 e;;e%;set no_look_at_move off
/def -mregexp -i -t'^            Come back after ([0-9]+) minutes\.$' thank_you_come_again = /eval /repeat -$[%{P1}*60] 1 \
	/echo -aB *** BLOOD DONATE AVAILABLE ***

;Curse jne.
/def -aBCcyan -i -t'Your feel excruciating pain in your head.' suppress_up = party say My magic was suppressed.
/def -aBCcyan -i -t'You feel relieved.' suppress_down = party say Suppress magic wore off.
/def -aBCcyan -i -t'You feel rather empty-headed.' forgot_how_to_cast =\
 party I just forgot how to cast spells and use skills!
/def -F -aCmagenta -i -t'You shiver and feel strange.' cursedrop = party say Some stat just got back to normal.
/def -F -aCmagenta -i -t'You feel more vital.' betterafterdeath = party say Death effects withdrawn.

;Login
/eval /load -q %{TRIGDIR}login.tf

;Merkkuservices:
/eval /def -mregexp -i -t"^([A-Z][a-z]+) uses acupuncture on %{capsname}" akupunktiota = r %P1 stats

;Lootti
/set am_i_looting=1
/def loot = dg
/def -i autoloot=/if (am_i_looting) /loot%;/endif
/def donaloot = keep all;;get all from corpse;;keep all crate;;keep all safe;;keep all key;;keep all box;;keep all chest;;poster;;raha

/def -h'SEND {unl} *' ovet = /for i 1 %* unlock door 1 with key %i;;unlock door 2 with key %i

;/def -p1 -mregexp -t'^You watch with selfpride as your chill touch hits (Safe|Chest|Box|Crate)\.' box =\
; /eval mm $[tolower(%P1)]

;Boxit
/def -mregexp -t'^You swing your foot against ([a-z]+) with a brutal force!$' kick1 = use kick at %{P1}
/def -mregexp -t'^You swing your foot heavily, and \*SLAM\* it against ([a-z]+)!$' kick2 = use kick at %{P1}
/def -mregexp -t'^Your kick lashes at ([a-z]+), and meets it with a satisfactory impact!$' box3 = use kick at %{P1}

/def -mregexp -t'^[A-Z][a-z]+ holds .+ over the still form of (his|her|its) fallen foe\.$' locbleed = /locdo

;Magic tower
/def -t'you are outside the tower again standing before a small block' torniulos = get tower;;pff

;;
;; Race specials
;undead wake
/def -t'You cannot concentrate hard enough yet to raise a corpse.' no_wake = dig grave 
;;
;;  Arealitei
;;

;Tarackia swamps
/def -P1BCred -mregexp -t'^from all directions enter (the building) through its main entrance\.  A breeze$' tarackia_swamp_barracks

;Zonni swamps
/def -aBCred -t'A slime-covered ladder leads up onto a small plateau.' zonni_swamps_ladder
/def -aBCred -t'A slime-covered ladder suddenly descends from a plateau you hadn\'t noticed.' zonni_swamps_ladder_down


