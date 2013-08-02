/def -i -mregexp -t'^Total of ([0-9]+) experience spent on character\.$' total_worth = /set total_worth=%P1%;\
  /eval /echo Total of %{rebirth_exp} rebirth experience.

/def -p1 -aCblue -mregexp -i -h'PROMPT ^Hp ([-]?[0-9]+) Sp ([-]?[0-9]+) Ep ([-]?[0-9]+) Xp ([0-9]+) (.*) [$]$' prompti=\
  /test prompt(strcat({P0}," "))
;  %;\
;  ;/set cur_hp=%P1%;\
;  /set cur_sp=%P2%;\
;  /set cur_ep=%P3%;\
;  /set cur_exp=%P4%;\
;  /checktick
;Vanha 
;/def -p1 -mregexp -i -t'^hp: (-?[0-9]+) \\(([0-9]+)\\) sp: (-?[0-9]+) \\(([0-9]+)\\) ep: (-?[0-9]+) \\([0-9]+\) ([0-9]+)' tickit=\
;  /set cur_hp=%P1%;\
;  /set hpmax=%P2%;\
;  /set cur_sp=%P3%;\
;  /set spmax=%P4%;\
;  /set cur_ep=%P5%;\
;  /set cur_exp=%P6%;\
;  /checktick

;sc set H <hp> <maxhp> {diffhp}, S <sp> <maxsp> {diffsp}, E <ep> <maxep> {diffep}, X <exp> {diffexp}, M <cash> <bank>
;sc set H {colorhp} <maxhp> {diffhp}, S {colorsp} <maxsp> {diffsp}, E {colorep} <maxep> {diffep}, X <exp> {diffexp}, M <cash> <bank>
/def -p1 -mregexp -i -t'^H ([-]?[0-9]+) ([0-9]+) ([0-9+\-]+)?, S ([-]?[0-9]+) ([-]?[0-9]+) ([0-9+\-]+)?, E ([-]?[0-9]+) ([0-9]+) ([0-9+\-]+)?, X ([0-9]+) ([0-9+\-]+)?, M ([0-9]+) ([0-9]+)?, % ([0-9]+), W ([0-9]+)$' short_score=\
  /set cur_hp=%P1%;\
  /set hpmax=%P2%;\
  /set cur_sp=%P4%;\
  /set spmax=%P5%;\
  /set cur_ep=%P7%;\
  /set cur_exp=%P10%;\
  /set rooms_explored=%P13%;\
  /set carried_weight=%P14%;\
  /checktick


/def -i checktick = \
  /if (cur_sp>lasttick)\
    /if (emoteticks == 1) @emote has $[cur_sp*100/spmax]\% sp%;\
    /endif%;\
    /if (cur_sp==maxsp)\
      @emote Sizzles\!\
    /elseif ((cur_sp-lasttick)>70 & !heal_all)%;\
      /set tickinterval=$[time()-timetick]%;\
      /echo -aBCcyan Tick: $[cur_sp-lasttick] ($[tickinterval] s)%;\
      /repeat -$[tickinterval-3] 1 /echo -aCcyan Ticking ...%;\
    /endif%;\
    /set timetick=$[time()]%;\
  /endif%;\
  /set lasttick=%cur_sp%;\
  /if (%cur_exp != %last_exp)\
    	/let total_exp=$[total_worth+cur_exp]%;\
    	/let exp_gained=$[cur_exp-last_exp]%;\
    	/let exp_to_go=$[150000000-total_exp]%;\
    	/let percentage_gain=$[exp_gained/(exp_to_go/100.0)]%;\
    	/echo -aB $[ftime("%H:%M:%S", time())] Exp gained: %{exp_gained} ($[substr(percentage_gain,0,4)]\%, %{exp_to_go} to go)%;save%;\
    	/set last_exp=%cur_exp%;\
  /endif%;\
  /if (cur_hp<last_hp)\
    /echo -aBCred Damage: $[last_hp-cur_hp]%;\
    /if ((last_hp-cur_hp)>300) @@party report emote took it big time ($[last_hp-cur_hp] dmg, $[cur_hp] hp)%;\
    /endif%;\
  /endif%;\
  /set last_hp=%P1

/def -aCmagenta -F -i -t'You feel like * healed you a bit.' got_heal_all = /set heal_all=1%;\
 /repeat -5 1 /unset heal_all%;\
 /reset_heal_all_timer%;\
/send sc

