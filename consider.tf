;;Consider
;/def -i -mregexp -aCyellow -t' has a soft skin\.$' con_1_resist =\
;    /set con_monsie=%PL%;/set con_physres=0
;/def -i -mregexp -aCyellow -t' seems to have a bit hardened skin\.$' con_20_resist = \
;    /set con_monsie=%PL%;/set con_physres=20
;/def -i -mregexp -aCyellow -t' has somewhat hardened skin\.' con_40_resist = \
;    /set con_monsie=%PL%;/set con_physres=40
;/def -i -mregexp -aCyellow -t' seems to have quite hard skin\.' con_60_resist = \
;    /set con_monsie=%PL%;/set con_physres=60
;/def -i -mregexp -aCyellow -t'\'s skin seems to be virtually impenetrable!' con_80_resist = \
;    /set con_monsie=%PL%;/set con_physres=80
;/def -i -mregexp -aCyellow -t'\'s skin could fold up a rapier!' con_100_resist = \
;    /set con_monsie=%PL%;/set con_physres=100

/def -i -mregexp -p100 -mregexp -t'^You take a close look at (.+) in comparison to yourself\.$' con_take_look = /set con_monsie=%P1
/def -i -mregexp -t'^You would get (a lot|well above average|above average|average|below average|some|very little) experience for ' con_exp_line = \
    /set con_exp=$[toupper({P1})]
/def -i -mregexp -t'^The final estimation is that (.+) here doesn\'t look very dangerous\.$' con_easy =\
    /eval @@party say %con_monsie doesn't look very dangerous and %con_exp exp.
/def -i -mregexp -t'^The final estimation is that (.+) looks like a fair opponent\.$' con_fair_opponent = \
    /eval @@party say %con_monsie looks like a fair opponent and %con_exp exp.
/def -i -mregexp -t'^The final estimation is that (.+) and you are nearly equal in power\. Damn\.$' con_nearly_equal = \
    /eval @@party say %con_monsie is nearly equal in power with me and %con_exp exp.
/def -i -mregexp -t'^The final estimation is that (.+) looks quite skilled, beware\.$' con_quite_skilled = \
    /eval @@party say %con_monsie looks quite skilled and is %con_exp exp.
/def -i -mregexp -t'^The final estimation is that (.+) looks much stronger than you, beware\.$' con_much_stronger = \
    /eval @@party say %con_monsie looks MUCH STRONGER THAN ME and is %con_exp exp.
/def -i -mregexp -t'^The final estimation is that (.+) has such bulging muscles that your hands tremble\.$' con_hands_tremble = \
    /eval @@party say %con_monsie has BULGING MUSCLES and is %con_exp exp.

;/def -mregexp -t'^You start treating ([A-Z][a-z]+)\.$' firstaid = \
;    /eval use first aid at $[tolower({P1})]
