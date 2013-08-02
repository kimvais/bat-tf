/def -p3 -i -t'The sigla flare even brighter and engulf you. A warm glow surrounds you and' rhealed_myself = /if (max_hp-cur_hp>200) rh nt%;/else h%;/endif

/def -mregexp -aBCbggreen -p3 -i -t'^The sigla flare even brighter and engulf ([A-Z][a-z]+)\. A warm glow surrounds (him|her|it) and' rh_other = /set healtarget=%P1%;/eval scan %P1

;;Monster shapes (varies)
/def -P0BCgreen -F -i -t'is in excellent shape\.$' excshape 
/def -P0BCgreen -p1 -i -t'is in a good shape\.$' gsshape
/def -P0BCyellow -F -i -t'is slightly hurt\.$' shshape = /if (%PL =~ healtarget) = rh %PL%;/endif
/def -P0BCyellow -F -i -t'is noticeably hurt\.$' nhshape= /if (%PL =~ healtarget) = rh %PL%;/endif
/def -P0BCred -p100 -i -t'is not in a good shape\.$' nigsshape= /if (%PL =~ healtarget) = rh %PL%;/endif
/def -P0BCred -F -i -t'is in bad shape\.$' bsshape= /if (%PL =~ healtarget) = rh %PL%;/endif
/def -P0BCmagenta -F -i -t'is in very bad shape\.$' vbsshape= /if (%PL =~ healtarget) = rh %PL%;/endif
/def -P0BCmagenta -F -i -t'is near death\.$' ndshape= /if (%PL =~ healtarget) = rh %PL%;/endif

