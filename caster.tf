;;Commands for all casters
/def -ag -i -h'SEND {cast}*' cast_a_spell = @%*%;/set csp=%{-1}%;/def recast=%* 
/def -i -h'SEND {ali} *' command_a = cast 'detect alignment' %-1
/def -i -h'SEND {ccf} *' command_ccf = cast create food %-1
/def -i -h'SEND {ccf}' command_ccf = cast create food
/def -i -h'SEND {fw} *' command_fw = cast feather weight at %-1
/def -i -h'SEND {id} *' command_id = cast identify at %-1
/def -i -h'SEND {invis} *' command_invis = cast invisibility at %-1
/def -i -h'SEND {mm} *' command_mm = cast 'chill touch' %-1
/def -i -h'SEND {rp} *' command_rp = cast remove poison at %-1
/def -i -h'SEND {sat} *' command_sat = cast satiate person at %-1
/def -i -h'SEND {seeinvis} *' command_seeinvis = cast see invisible at %-1
/def -i -h'SEND {ww} *' command_ww = cast water walking at %-1
/def -i -h'SEND {ad} *' command_ad = cast 'aura detection' %-1%;/set adtarget=%-1

;General cast
/def -i -t'You do not have enough spell points to cast the spell.' low_sp = party say Mine ei PYSTY heitt‰ taika, liika v‰h‰ taikavoima!
/def -aBCyellow -i -t'You sizzle with magical energy.' sizzle = @@party report full sp
/def -aBCcyan -i -t'You surreptitiously conceal your spell casting.' conceal = party say emote salamyhk‰isesti pimitt‰‰ lumouksen heiton.

;Cere
/def -i -t'You perform the ceremony.' cere_up = /set st_cere=C
/def -F -aCcyan -i -t'You start chanting.' cere_down = /set st_cere=

;Detect alignment
/def -mregexp -i -t'^[A-z| |\-|\']+ is (evil|neutral|good|a bit good|a bit evil)\.$' detect_align =\
 party say %P0

;;Aura detection
/def -mregexp -t'^You detect ([A-z|,| ]+)\.?$' aura_detection_message = party say %adtarget has: %P1 

;Boxin avaus
/def -mregexp -p2 -t'^You watch with selfpride as your ([a-z| ]+) hits (Box|Chest|Safe)\.$' boxhit = /eval cast %{P1} at $[tolower({P2})]

;Essence eye
/def -ag -mregexp -i -t'^([A-z| ]+)\: ([#]+)$' essence_eye =\
 /set csp=%P1%;\
 /set rounds=$[strlen({P2})]%;\
 /eval /echo -p -aCcyan %csp: @{h}%rounds@{n}
;/if (rounds < 3) /eval emote - %csp in %rounds%;\
;    /endif
; /if (\
;  csp =~ "Dispel evil" |\
;  csp =~ "Saintly touch" |\
;  csp =~ "Holy hand" |\
;  csp =~ "Flames of righteousness" |\
;  csp =~ "Dispel undead" |\
;  csp =~ "Banish demons" |\
;  csp =~ "Harm body" |\
;  csp =~ "Aneurysm" |\
;  csp =~ "Spider wrath")\
; /eval emote - %csp in %rounds%;/endif

;Quick lips
/def -aCcyan -i -t'You feel some power hasten your casting.' ql_haste = \
 /if (rounds < 1) /set rounds=1 %;/else /set rounds=$[rounds-1]%;/endif%;\
 /eval /echo -p -aCcyan %csp: @{h}%rounds@{n} (some power)%;\
 /if (rounds < 3)%;\
 /eval emote - %csp in $[rounds]%;%;/endif 
/def -aCcyan -i -t'You feel unearthly power hasten your casting.' ql_haste2 = \
 /if (rounds < 1) /set rounds=1 %;/else /set rounds=$[rounds-2]%;/endif%;\
 /eval /echo -p -aCcyan %csp: @{h}%rounds@{n} (unearthly power)%;\
 /if (rounds < 3)%;\
 /eval emote - %csp in $[rounds]%;/endif
/def -aCcyan -i -t'You feel godly power hasten your casting.' ql_haste3 = \
 /if (rounds < 1) /set rounds=1 %;/else /set rounds=$[rounds-3]%;/endif%;\
 /eval /echo -p -aCcyan %csp: @{h}%rounds@{n} (godly power)%;\
 /if (rounds < 3)%;\
 /eval emote - %csp in $[rounds]%;/endif

;QC
/def -ag -i -t'You skillfully cast the spell with haste.' qc_haste = \
 /if (rounds < 1) /set rounds=1 %;/else /set rounds=$[rounds-1]%;/endif%;\
 /eval /echo -p -aCcyan %csp: @{h}%rounds@{n} (haste)
; /if (rounds < 3)%;\
; /eval emote - %csp in $[rounds]%;/endif
/def -ag -i -t'You skillfully cast the spell with greater haste.' qc_ghaste = \
 /if (rounds < 1) /set rounds=1 %;/else /set rounds=$[rounds-2]%;/endif%;\
 /eval /echo -p -aCcyan %csp: @{h}%rounds@{n} (greater haste)
; /if (rounds < 3)%;\
; /eval emote - %csp in $[rounds]%;/endif

;/def -ag -i -t'You skillfully cast the spell with haste.' qc_haste = \
;/if (rounds < 1) /set rounds=1 %;/else /set rounds=$[rounds-1]%;/endif%;\
; /eval /echo -p -aCcyan %csp: @{h}%rounds@{n} (haste)%;\
; /if (rounds < 3)%;\
; /eval emote - %csp in $[rounds]%;/endif
;/def -ag -i -t'You skillfully cast the spell with greater haste.' qc_ghaste = \
; /if (rounds < 1) /set rounds=1 %;/else /set rounds=$[rounds-2]%;/endif%;\
; /eval /echo -p -aCcyan %csp: @{h}%rounds@{n} (greater haste)%;\
; /if (rounds < 3)%;\
; /eval emote - %csp in $[rounds]%;/endif


;Lites
/def -F -aCcyan -i -t'You abort the spell casting.' spell_abort1 = /set rounds=%;/set csp=
/def -F -aCcyan -i -t'Your movement prevents you from casting the spell.' spell_abort2 = /set rounds=%;/set csp=
/def -F -aCcyan -i -t'You interrupt the spell.' spell_abort3 = /set rounds=%;/set csp=
/def -F -aBCcyan -i -t'You are done with the chant.' spell_done = /set rounds=%;/set csp=
/def -F -aBCred -i -t'Your heavy burden slows down your casting.' burdened = \
/set rounds=$[rounds+1]%;emote - %csp in $[rounds]

/eval /load -q %{TRIGDIR}spellfail.tf

;Seeinvis
/def -F -i -t'You feel you can see more than ever.' seeinvisup = /protup see_invisible SI
/def -F -i -t'Your vision is less sensitive now.' seeinvisdown = /protdown see_invisible SI

;;Tick
/set emoteticks=1

;;damcrit
/def -F -i -t'You feel like you managed to channel additional POWER to your spell.' dcrit2
/def -F -i -t'You feel like your spell gained additional power.' dcrit1
/def -F -i -t'Your fingertips are surrounded with swirling ENERGY as you cast the spell.' dcrit3
/def -F -i -t'Unseen BURSTS of magic are absorbed into the spell.' dcrit4
