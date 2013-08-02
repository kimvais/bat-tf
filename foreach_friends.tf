/def emfr=/set emotion=%*%;\
    /eval /echo %emotion%;\
    /def -mregexp -t'^ .[ |0-9][0-9][0-9].  ([A-Z][a-z]+)' friendsline = /eval /send %emotion %%P1%%;\
    /def -mregexp -t'^Total players: [0-9+]\.' loppu = /undef friendsline%;/undef loppu%;\
    /send friends

/def votefr=/set vote=%1%;/set list=%2%;\
    /def -mregexp -t'^ .[ |0-9][0-9][0-9].  ([A-Z][a-z]+)' friendsline = /eval rateplayer %%P1 %%vote%%;\
    /def -mregexp -t'^Total players: [0-9+]\.' loppu = /undef friendsline%;/undef loppu%;\
    /eval /send friends %list

/def tfr=/set frmsg=%*%;\
    /eval /echo %frmsg%;\
    /def -mregexp -t'^ .[ |0-9][0-9][0-9].  ([A-Z][a-z]+)' friendsline = /eval /send emoteto %%P1 spams you all '%frmsg'%%;\
    /def -mregexp -t'^Total players: [0-9+]\.' loppu = /undef friendsline%;/undef loppu%;\
    /send friends
