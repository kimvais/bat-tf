;/def -mregexp -t'^\| Created: [A-z]+ ((Jan|Feb|Mar|Apr|May|Jun|Jul|Sep|Oct|Nov|Dec) [0-9]+ [0-2][0-9]:[0-5][0-9]:[0-5][0-9] [0-9]+))' party_time = /eval /echo %{P1}

;/def -mregexp -t'^\| Created: [A-z]+ ((Jan|Feb|Mar|Apr|May|Jun|Jul|Sep|Oct|Nov|Dec) [0-9]+ [0-2][0-9]:[0-5][0-9]:[0-5][0-9] [0-9]+)' party_time = /eval /sys date +'\\\%s' --date '\%{P1}' >> %{LOGDIR}kills.log
/def -mregexp -t'^\| Created: [A-z]+ ((Jan|Feb|Mar|Apr|May|Jun|Jul|Sep|Oct|Nov|Dec) [0-9]+ [0-2][0-9]:[0-5][0-9]:[0-5][0-9] [0-9]+)' party_time = /set partydate=$(/eval /sys date +'\\\%s' --date '\%{P1}')
/def -mregexp -t'^\|[ ]+([0-9]+): (.*[a-z])[ ]+\|$' party_kills_list = /eval /test $[fwrite(strcat(%{LOGDIR},"kills.log"),strcat(%{partydate},",",%{P1},",'",%{P2},"'"))]

