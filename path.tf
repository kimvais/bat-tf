/def -i dopath = \
  /set pathlist=%; \
  /dopath_aux %*%; \
  /set pathlist=$(/all_but_first %pathlist)%;\
   set no_look_at_move on%; \
  /quote -0 /send !%pathlist%;/repeat -3 1 set no_look_at_move off%%;look

/def -i dopath_aux  = \
    /if ( {1} =/ '[0-9]*' & {#} >= 2 ) \
        /let no_twenties=$[{1} / 20]%; \
        /let after_twenties=$[mod({1},20)]%; \
        /let tdir=%2%; \
        /for i 1 %no_twenties /set pathlist=$$[strcat(%%{pathlist}, "\; echo 20 ", {tdir})]%; \
        /if (after_twenties!=0) \
          /set pathlist=$[strcat({pathlist}, "; echo ", {after_twenties}," ", {tdir})]%; \
        /endif%; \
        /dopath_aux %-2%;\
    /elseif ({#}) \
        /set pathlist=$[strcat({pathlist}, "; echo ", {1})]%; \
        /echo -aBCred %pathlist%; \
        /dopath_aux %-1%; \
    /endif 

/def -i all_but_first = /echo - %-1 
/def -i stop = /echo -aBCgreen We are there!
/def -i at = /if (!logging_paths) /startpath %*%;/else /endpath %*%;/endif
/def -i startpath = /set logging_paths=1%;/set st_logpath=LOG%;/set startofpath=%*
/def -i endpath = /unset logging_paths%;/set st_logpath=%;/quote -S /eval /echo /def -i $[strcat(startofpath,"_",%*)] = /dopath !~/bat/bin/teepathi.sh

/def -i -aB -t'Central Park' ocp_lite

/eval /load -q %{TRIGDIR}paths.tf

;;Mapper
/def -mregexp -t'^Obvious exits are: ([a-z, ]+) and ([a-z]+)\.$' obvious_exits_are = /eval /set orig_suunnat=%{P1},%{P2}%;\
	/eval /echo $[replace(" ","",%{orig_suunnat})]
/def -mregexp -t'^Obvious exit is: ([a-z]+)\.$' obvious_exit_is = /eval /echo %{P1}
