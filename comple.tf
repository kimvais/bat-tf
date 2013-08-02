;          Word completion
;
; TAB completes the word from history.
; Only words starting with capitals are scanned,
; even though lower case letters are entered.
; (E.g. useful when searching for players/monsters only)
;
; Documentation and modifications by Mozzoop - 99 <mozzoop@boco.fi>
; Original code written by Ben Jackson <bjj@arcanet.com>


; removed `@' and `-' for commands
/set complete_wordseps=][ !?#$%^&*(),.><\"'`:;=+\}\{

/def -i dabbrev_complete = \
        /let prefix=$(/last $[kbhead()])%;\
        /test regmatch(strcat("([^", complete_wordseps, "]*)\$"), prefix)%;\
        /let prefix=%{P1}%;\
	/let prefix=$[strcat(toupper(substr({prefix},0,1)),substr({prefix}, 1))]%;\
        /let pattern=$[strcat("(^|[", complete_wordseps, "])", prefix, "([^", complete_wordseps, "]*)")]%;\
        /let line=$(/recall -mregexp /1 %{pattern})%;\
        /if (regmatch(pattern, line))%;\
		/let lone=$[tolower({P2})]%;\
                /test input(strcat({lone}, " "))%;\
        /else \
                /echo -aCyellow % No match found!%;\
        /endif

/def -i -b'^I' = \
        /if (kbpoint() = 0) \
                /dokey page %;\
        /else \
                /test kbgoto(kbwordleft())%;\
                /test kbgoto(kbwordright())%;\
                /dabbrev_complete %;\
        /endif
