;;Automaagiset
/def -i -h'SEND {command} *' command_command = /if (%#>2) \
  /teecommandi %-1%;\
  /else /send %*%;\
  /endif

  /def -i teecommandi=\
   /set newcmd=/def -i -h'SEND {%1} *' command_%1 = %-1 \%-1 %;\
    /test $[fwrite("newcmds.tf",%newcmd)]%;/echo %newcmd%;/eval -s0 %newcmd

    /def -i -mregexp -t'^\'(.*)\' is a command-alias to \'(.*)\'\.$' commandtrig = \
     /teecommandi $[strcat(%P1," ",%P2)]

