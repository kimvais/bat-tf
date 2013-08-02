/def -p1 -mregexp -t'^hp: ([0-9]+) \\(([0-9]+)\\) sp: ([0-9]+) \\(([0-9]+)\\) ep: ([0-9|\-]+) \\([0-9]+\) ([0-9]+)' tickit=\
  /set cur_hp=%P1%;\
  /set hpmax=%P2%;\
  /set curtick=%P3%;\
  /set spmax=%P4%;\
  /set cur_ep=%P5%;\
  /set cur_exp=%P6%;\
  /if (curtick>lasttick)\
    /if (curtick==maxsp)\
      @emote sizzlettää kuin pieni lehmä\!%;\
    /elseif ((curtick-lasttick)>20 & !heal_all)%;\
      /set tickinterval=$[time()-timetick]%;\
      /echo -aBCcyan Tick: $[curtick-lasttick] ($[tickinterval] s)%;\
      /repeat -$[tickinterval-3] 1 /echo -aCcyan Ticking ...%;\
        /if (emoteticks == 1) @emote has $[curtick*100/spmax]\% sp%;/endif%;\
     /endif%;\
    /set timetick=$[time()]%;\
  /endif%;/set lasttick=%curtick%;\
  /if (cur_exp>last_exp)\
    /echo -aB Exp gained: $[cur_exp-last_exp]%;save%;\
  /endif%;/set last_exp=%cur_exp%;\
  /if (cur_hp<last_hp)\
    say Damage: $[last_hp-cur_hp]%;\
    /if ((last_hp-cur_hp)>100) party say *took it big time ($[last_hp-cur_hp] dmg, $[cur_hp] hp)*%;\
    /endif%;\
  /endif%;/set last_hp=%P1%

/def -aCmagenta -F -t'You feel like * healed you a bit.' got_heal_all = /set heal_all=1%;\
 /repeat -5 1 /unset heal_all
/send sc




