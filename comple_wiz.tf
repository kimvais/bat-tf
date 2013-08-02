;          Word completion
;
; TAB completes the word from history.
; Only words starting with capitals are scanned,
; even though lower case letters are entered.
; Mod: lowercase words ending with /, .c, .h and .o work.
; (E.g. useful when searching for players/monsters only)
;
; Support for lowercase directories and files ending with .h, .c and .o
;   added by Era - 2006 <era@batmud>
; Documentation and modifications by Mozzoop - 99 <mozzoop@boco.fi>
; Original code written by Ben Jackson <bjj@arcanet.com>

/set complete_wordseps=][ !?#$%^&*(),.><\"'`:;=+}{@|/

/def dabbrev_complete = \
  /let prefix=$(/last $[kbhead()])%;\
  /test regmatch(strcat("([^", complete_wordseps, "]*)\$"), prefix)%;\
  /let prefix=%{P1}%;\
  /let prefix2=%{P1}%;\
  /let prefix=$[strcat(toupper(substr({prefix},0,1)),substr({prefix}, 1))]%;\
;  /let pattern=$[strcat("(^|[", complete_wordseps, "])", prefix, "([^", complete_wordseps, "]*)")]%;\
  /let pattern=\
$[strcat(\
"(^|[", complete_wordseps, "])\
(", prefix, "([^", complete_wordseps, "]*)|\
", prefix2, "([A-z0-9]*([.][cho]|/))\
)")]%;\
  /let line=$(/recall -mregexp /1 %{pattern})%;\
  /if (regmatch(pattern, line)) \
    /if (strlen({P3}) > strlen({P4})) \
      /let lone=$[tolower({P3})]%;\
      /test input(strcat({lone}, " "))%;\
    /else \
      /let lone=%{P4} %;\
      /test input(strcat({lone}))%;\
    /endif %;\
  /else \
    /echo -aCyellow % No match found!%;\
  /endif

/def -b'^I' tab = \
  /if (kbpoint() == 0) \
    /dokey page %;\
  /else \
    /test kbgoto(kbwordleft())%;\
    /test kbgoto(kbwordright())%;\
    /dabbrev_complete %;\
  /endif
