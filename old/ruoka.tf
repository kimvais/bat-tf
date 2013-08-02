/def -ag -h'SEND {g}*' givefood=/getfood%;/eval give %food to %{-1}

/def getfood=/if (! (strlen(ruoka) >0) ) /echo -aCred NO FOOD%;/set food=%;\
    /else /let posi=$[strstr(ruoka, " ")]%;\
        /if (posi = -1) \
            /set food=%ruoka%;/set ruoka=%;\
        /else /set food=$[substr(ruoka, 0, posi)]%;\
            /endif%;\
    /endif

/def -p1 -mregexp -t'You create .* ([a-z]+)\.' createdfood = \
        /set food=%P1%;get %food%;\
        /set ruoka=$[strcat(food, " ", ruoka)]

/def -p1 -mregexp -t'You give .* ([a-z]+) to ([A-Z][a-z]+)\.' givedfoodaway = \
        /echo gived food to %P2!!!!%;\
        /let posi=$[strstr(ruoka, " ")]%;\
        /if (posi = -1) \
                /set ruoka=%;\
        /else /set ruoka=$[substr(ruoka, posi+1)]%;\
        /endif

/def -p1 -t'You get a hungry look in your eyes and state *' ccf = ccf



