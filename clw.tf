/eval /def -i -t'%{capsname} is not wounded' autoheal_off = /undef autoheal
/def -i h = /set heal_hp=%1%;h
/def -mregexp -p3 -i -t'^You heal (little|some|much|very much|all) of ([A-z]+)\'s wounds.' autoheal =\
 /if (%P1 =~ 'little' | %P1 =~ 'some' | %P1 =~ 'much')%;\
    /eval clw $[tolower(%P2)]%;\
     /endif
     /def -mregexp -p3 -i -t'^You heal (little|some|much|very much|all) of your own wounds.' autoheal2 =\
      /if (%P1 =~ 'little' | %P1 =~ 'some' | %P1 =~ 'much')%;/eval @@cast cure light wounds at %{myname}%;\
       /endif

