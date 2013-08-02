/eval /set tellfile=%{LOGDIR}tells.log
/eval /set kirahvichannelfile=%{LOGDIR}kirahvichannel.log
/eval /set saleschannelfile=%{LOGDIR}saleschannel.log
/eval /set nunchannelfile=%{LOGDIR}nunchannel.log
/eval /set batchannelfile=%{LOGDIR}batchannel.log

/set logtimestamp=\[$[ftime("%d/%m/%y %H:%M:%S",time())]\]:%; \
/set logtimestamp=%logtimestamp %*%; \
/set kirahviwrite=$[fwrite({kirahvichannelfile},{logtimestamp})]
/set tellwrite=$[fwrite({tellfile},{logtimestamp})]
/set saleswrite=$[fwrite({saleschannelfile},{logtimestamp})]
/set batwrite=$[fwrite({newbiechannelfile},{logtimestamp})]

/def -i set_logfile=/eval /set logfilename=$[ftime("%d-%m-%Y.log", time())]
/def -i logmove=/set_logfile%;/eval /log -g %{LOGDIR}%logfilename%;/eval /echo %logfilename
/def -mregexp -t'^Total of ([0-9]+) experience spent on character\.$' totalexp =/set explogline=$[time()] %P1%;\
    /test $[fwrite(%{EXPLOG},%explogline)]

/def -i set_day = /set daynumber=$[ftime("%d",time())]
/set_day
/logmove
