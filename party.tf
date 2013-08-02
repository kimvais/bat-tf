/def echo_report = scan all
;/def -p1 -F -aBCcyan -mregexp -i -t'^[*]{53}$' battle_round = /echo_report
;/def -p1 -F -ag -mregexp -i -t'^\*+$' battle_round = \
;    /if (strlen(csp) > 0) /eval /echo -p -aCcyan *** @{h}%{csp}@{n} - @{h}%{rounds}@{n} ***%;\
;    /else /echo -aBCred *** NO SPELL ***%;/endif%;\
;    /echo_report%;\
;     /if (rounds < 3) /eval emote - %csp in %rounds%;\
;         /endif
/def -F -i -t'You created a party called *' party_create = /set party=1
/def -F -i -t'You left the party.' party_leave = /unset party
/def -F -i -t'You step * and start following the leader.' party_join = /set party=1
/def -F -mregexp -i -t"^[A-Z][a-z]+ kicks you out of the party\." got_kicked_out = /unset party
/def -mregexp -F -aBCgreen -i -t' .party.: ' partylite
/def -F -aBCgreen -i -t'* starts following the leader.' startsfollow
/def -F -aBCgreen -i -t'You start following the leader in your old place.' youstarfollow
/def -F -mregexp -aBCred -i -t'^([A-z]+) lapses into unconsciousness from severe loss of blood.' drops_unconc =\
/if (party) party say %P1 drops uncoscious.%;/endif 
/def -F -aBCred -i -t'Blood pours from *\'s wounds.' someoneisbleeding
/def -i -t"You are not in a party." not_in_a_party = /unset party

;;Area specials
/def -aBCred -mregexp -t'^([A-Z][a-z]+) is frozen solid in a block of ice!$' iceblock = p' %P1 was frozen!

/def -t'You are the new leader of the party.' pld = @@party say prepare to die!%;@@party forcefollow

/eval /load -q %{TRIGDIR}partylite.tf
/def -F -aBCcyan -i -t'...BUT you break it off with intense concentration.' mano = @@party say *saved stun!*

/def -i percolor = \
  /set tmpvar=$[({1}*100)/{2}]%;\
  /if (tmpvar>99)/echo BCwhite%; \
  /elseif (tmpvar>84)/echo BCcyan%; \
  /elseif (tmpvar>68)/echo BCgreen%; \
  /elseif (tmpvar>51)/echo BCyellow%; \
  /elseif (tmpvar>34)/echo BCred%; \
  /elseif (tmpvar>17)/echo BCmagenta%; \
  /else /echo Cbgred%;/endif

/def -i -Fp2 -ag -mregexp -t'([0-9]+)\\((.+)\\) (.+)\\((.+)\\) (.+)\\((.+)\\) \\| \
(.+) \\| (.+) \\|$' partylite = \
  /eval  /echo -p %PL@{$(/percolor %{P1} %{P2})}\
%{P1}@{n}(@{Cwhite}%{P2}@{n}) @{$(/percolor %{P3} %{P4})}\
%{P3}@{n}(@{Cwhite}%{P4}@{n}) @{$(/percolor %{P5} %{P6})}\
%{P5}@{n}(@{Cwhite} %{P6}@{n})|@{$(/percolor %{P7} 100)} \
%{P7}@{n} | %P8 |

;Eturivitargetit
/def -i -Fp1 -mregexp -t'^\| 1[.]([1-3])   ([A-Z][a-z]+)' set_tankvars = /eval /set tank%{P1}=$[tolower({P2})]

;Autojoin
/def -aBCgreen -i -t'^([A-Z][a-z]+) offers you membership to party: ' autojointoaparty = @@party join
