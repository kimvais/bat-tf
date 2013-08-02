;Stunnaan mosan
/def -aBCcyan -t'Your attack causes * to lose focus slightly.' i_stun1 = /stunned_monster
/def -aBCcyan -t'You hurt * who seems to become somewhat confused.' i_stun2 = /stunned_monster
/def -aBCcyan -t'You cause *\'s world to become blurred and unfocused.' i_stun3 = /stunned_monster
/def -aBCcyan -t'* gets hit badly and has serious problems staying in balance.' i_stun4 = /stunned_monster
;/def -aBCcyan -t'' i_stun5
/def -aBCcyan -t'You STUN *, who loses connection to the reality.' i_stun6 = /stunned_monster
/def stunned_monster = @@say HUUDA MUN NIMEE JA KUTSU MUA REHTORIKS!

;Oma stunni
/def -aCred -t'You get hit, and your eyes lose focus slightly*' am_stunned1 = /amstunned
/def -aCred -t'You become somewhat confused, losing your edge*' am_stunned3 = /amstunned
/def -aCred -t'Your mind reels and the world becomes blurred.' am_stunned3 = /amstunned
/def -aCred -t'You get hit badly\, and have problems staying in balance.' am_stunned4 = /amstunned
/def -aCred -t'You stagger helplessly in pain and confusion.' am_tunned5 = /amstunned
/def -aCred -t'You lose connection to the reality\, becoming truly STUNNED.' am_stunned6 = /amstunned
/def -aCred -t'You try to concentrate but your head spins like a whirligig\!' am_stunned7 = /amstunned
/def amstunned=@@party report *is STUNNED*

;Joku toinen stunnas jonkun kolmannen
/def -aBCcyan -t'The eyes of * lose focus slightly.' was_stunned1
/def -aBCcyan -t'* swears and seems to be somewhat confused.' was_stunned2
/def -aBCcyan -t'* struggles to keep focus while the world becomes blurred.' was_stunned3
/def -aBCcyan -t'* gets hit badly and has serious problems staying in balance.' was_stunned4
/def -aBCcyan -t'* loses connection to reality, becoming truly STUNNED.' was_stunned6
;/def -aBCcyan -t'' was_stunned5
;/def -aBCcyan -t'' was_stunned6
