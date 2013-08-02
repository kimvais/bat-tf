/set tellfile=/home/kinki/log/tells.log
/set kirahvichannelfile=/home/kinki/log/kirahvichannel.log
/set saleschannelfile=/home/kinki/log/saleschannel.log
/set nunchannelfile=/home/kinki/log/nunchannel.log
/set batchannelfile=/home/kinki/log/batchannel.log

/let logtimestamp=\[$[ftime("%d/%m/%y %H:%M:%S",time())]\]:%; \
/let logtimestamp=%logtimestamp %*%; \
/let kirahviwrite=$[fwrite({kirahvichannelfile},timeandtell)]
/let tellwrite=$[fwrite({tellfile},timeandtell)]
/let saleswrite=$[fwrite({saleschannelfile},timeandtell)]
/let batwrite=$[fwrite({newbiechannelfile},timeandtell)]

/def -i set_logfile=/eval /set logfilename=$[ftime("hcbat-%d-%m-%Y.log", time())]
/def -i logmove=/set_logfile%;/eval /log -g ~/log/%logfilename%;/eval /echo %logfilename

/def -i set_day = /set daynumber=$[ftime("%d",time())]
/set_day
/logmove
