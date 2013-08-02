/set kilke=( ) [ ] { } . : - _ + ? ^ # ! % / =
/def party_say_kilke =\
    /eval /unset palku%;\
    /eval /unset ploppu%;\
    /for i 1 5 /let numero=$$[rand(18)]%%;\
    /eval /echo $$(/nth %numero %kilke)%%;\
    /set palku=$$[strcat(%%palku,%%merkki)]%%;\
    /set ploppu=$$[strcat(%%merkki,%%ploppu)]%;\
    /eval party say %palku %* %ploppu

    /set kilke1=()[]{}.:-_+?¿^*#!%$\/<>=¡!÷»«¶§º¹²³¥
    /set kilke2=)(][}{.:-_+¿?^*#!%$/\><=!¡÷«»¶§º¹²³¥
        /def -p2 -h"SEND {p'}*" partysay = \
        /if (%-1 =~ "last") /send party say last%;/break%;/endif%;\
        /let i=0%;\
        /while (i <= $[rand(20)]) \
        /let i=$[i+1]%;\
        /let pos=$[rand(strlen(kilke1))]%;\
        /let alku=$[substr({kilke1}, pos, 1)]%alku%;\
        /let loppu=%loppu$[substr({kilke2}, pos, 1)]%;\
        /done%;\
        /send party say %alku %-1 %loppu
        /def -p1 -h'SEND {p\' last}' partylast = party say last

