/def -i -p3 -aCmagenta -mglob -t'*brutally shove your weapon*' lure5 = \
  @@party say Lure in (5rnd stun)                                
/def -i -p3 -aCmagenta -mglob -t'You go \'GOTCHA!\' and strike*' lure4 = \
  @@party say Lure in (4rnd stun)                                
/def -i -p3 -aCmagenta -mglob \
  -t'You see opportunity and butt the shaft of your weapon towards a vital nerve' \
  lure3 = @@party say Lure in (3rnd stun)                                  
/def -i -p3 -aCmagenta -mglob -t'You valiantly strike back at *' lure2 = \
  @@party say Lure in (2rnd stun)                                
/def -i -p3 -aCmagenta -mglob \
  -t'You have trouble but manage to deliver a kick in *' lure1 = \
  @@party say Lure in (1rnd stun) 
