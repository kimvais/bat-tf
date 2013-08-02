/def -p1 -F -mglob -F -i -t'You lie down and begin*' camping = /set st_camp=
/def -p1 -F -mglob -F -i -t'You stretch yourself and consider*' can_camp1 =  /set st_camp=C
/def -p1 -F -mglob -F -i -t'You feel a bit tired.' ca_camp2 = /set st_camp=C
/def -p1 -F -mglob -F -i -t'You feel like camping a little.' ca_camp3 = /set st_camp=C
/def -p1 -F -mglob -F -i -t'You don\'t quite feel like camping at the moment.*' cannot_camp = /set st_camp=
/def -Fp1 -F -aCcyan -i -t'You are prepared to do the skill\.' done_skill = /set rounds=
/def -F -aBCcyan -mregexp -i -t'You observe your skill attempt: ([#]+)' tiamatgloves
/def -F -aCred -i -t'You lose your concentration and stop your skill.' loseskill1 = /set rounds=
/def -F -aCred -i -t'You lose your concentration and cannot do the skill.' loseskill2 = /set rounds=
/def -F -aCcyan -i -t'You start concentrating on the skill.' startskill = /set rounds=S
/def -F -aCcyan -i -t'You break your skill attempt.' skill_stopped = /set rounds=
/def -F -aCcyan -i -t'Your movement prevents you from doing the skill.' moving_stopped_skill =\
    /set rounds=
/def -F -aBCcyan -i -t'...BUT you break it off with intense concentration.' mano = @@party say *saved stun!*

