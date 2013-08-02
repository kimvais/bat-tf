/def -F -i -t'You create some magical fluid at the bottom of the flask.' prefpotion = get empty from p1
/def -F -i -t'You get \'flask\' from your * sturdy pack.' gotflask = poke flask
/def -F -i -t'You poke your own prepared alchemist\'s flask.' poke_prepared = /prefpotion
/def -F -i -t'You poke your own empty alchemist\'s flask.' poke_empty = pref%;/def recast = pref
/def -F -i -t'There is no empty in your *' tyhjat_loppu = /undef recast
/def -F -i -t' .. but your * sturdy pack is full.' pack_full = label p1 as asd%;label p2 as p1%;label asd as p2
 
/def -F -i -t'You submit the contents * into the authenticator.' submission = put flask in p1%;\
 /test $[fwrite("/home/kinki/bat/a/alch.log",%*)]
/def -F -i -t'You feel close...' feelclose = \
 /test $[fwrite("/home/kinki/bat/a/alch.log",%*)]
/def -i -h'SEND {mix}*' miksaus = use mix potion at flask use %-1%;\
 /test $[fwrite("/home/kinki/bat/a/alch.log",%*)] 
/def -F -i -t'a flask * glows.' loistava_potu =\
 /test $[fwrite("/home/kinki/bat/a/alch.log",%*)] 
/def -F -i -t'Flask * accepted.' hyvaksy =\
 /test $[fwrite("/home/kinki/bat/a/alch.log",%*)]%;\
 /pulauta_formulat%;grep 'scribbled' ahelp
/def -F -i -t'You feel something is missing...' eiosaaviela =\
 /test $[fwrite("/home/kinki/bat/a/alch.log",%*)] 

/def -F -i -t'You perform the ceremony.' ch1 = /if (robo=1) cast create herb%;/endif
/def -F -i -t'You get a green look in the eyes and chant \'greeeenie fiiingerie\'' ch2 = /if (robo=1) \
cer%;/endif
/def -F -i -t'You suck some minerals from deep in the ground and draw *' ch3 = get herb
/def -F -mregexp -i -t'^ formulas \<filter\>      \- look at ([0-9]+) formula\(s\) you scribbled down' formulat =\
 title $[%P1*100/197] % pure alchemaholist 
/def -i pulauta_formulat= /sys grep 'Flask' ~/bat/a/alch.log|sort>~/public_html/formulas.txt 

/def -mregexp -i -t"^([A-Za-z]*) tells you \'potion ([a-z|_]*)\'" potui_kyselee=/quote -0 tell %P1 Number of \
 \\'%P2\\' potions found: !grep -c %P2 \
 /home/kinki/public_html/formulas.txt

/eval /load -q %{TRIGDIR}herblite.tf

/def -i putherbs=\
get apple,wormwood,barberry,yarrow,burdock,chickweed root,cabbage,arnica,carrot,thistle,cauliflower,costmary,chicory root,borage,cotton,mystic spinach,crystaline,jaslah,elder berry,honeysuckle,ginseng,mistletoe,lettuce,water lily,lobelia,comfrey,mushroom,mangrel,onion,bloodmoss,pear,boneset,plum,sweet flag,potato,mandrake,rhubarb,soapwort,vine seed,lungwort,spinach,h'cliz,strawberry,mugwort,turnip,mystic carrot%;\
put all in h1%;\
put all in h2%;\
put all in h3%;\
put all in h4%;\
put all in h5%;\

/def -i storeherbs=\
get apple,wormwood,arnica,cabbage,barberry,yarrow,burdock,chickweed,cauliflower,costmary,carrot,thistle \
 thorn,chcory,borage,cotton,mystic spinach,crystalline,jaslah,elder berry,mistletoe,lettuce,water \
 lily,lobelia,comfrey,lungwort,vine seed,mandrake,potato,mangrel,mushroom,onion,bloodmoss,pear,boneset,\
 plum,sweet flag,rhubarb,soapwort,spinach,h'cliz,strawberry,mugwort,turnip,mystic carrot,garlic,nightshade,\
 blueberry,wolfbane,raspberry,bloodroot,foxglove,holly berry,henbane,jimsonweed,hemlock,tomato%;\
put all in h1%;\
put all in h2%;\
put all in h3%;\
put all in h4%;\
put all in h5%;\
put all in h6%;\
put all in h7%;\
put all in h8%;\
put all in h9%;\
put all in h10

/def -i -h'SEND {og}*' organget =\
 /set organ_name=%-1 %;\
 /set cannumber=1%;\
 /canpull

/def -i canpull = get %organ_name from o%cannumber

/def -mregexp -i -t'^There is no ([a-z| ]+) in your (big|HUGE|small) shiny can.' no_organ =\
 /if (%P1 =~ %organ_name) /set cannumber=$[cannumber+1]%;/canpull%;/endif

/def -i -h'SEND {hg}*' herbget =\
 /set herb_name=%-1 %;\
 /set jarnumber=1%;\
 /jarpull

/def -i jarpull = get %herb_name from h%jarnumber

/def -mregexp -i -t'^There is no ([a-z| ]+) in your (big|HUGE|small) shiny jar.' no_herb =\
 /if (%P1 =~ %herb_name) /set jarnumber=$[jarnumber+1]%;/jarpull%;/endif

