/def -abBCred -t'Your disc wavers dangerously.' discwaver
/def -P1BCyellow -mregexp -t'It belongs to Noitatohtori and it\'s floating about ([0-9]+) centimetres above ground.' discheight
/def -p1 -P0Cgreen -t'((gloss|lode|deposit|abyss) of [a-z]+ ore)' ore
/def -p1 -P0Cgreen -t'((crag|graveyard|hill|slab) of [a-z]+)' ore2
/def -p1 -P0Cgreen -t'((A|An) [a-z]+ tree)' tree
/def -aBCred -t'You do not have enough spell points to cast the spell.' nosp

/def -i -p1 -mglob -h'SEND {mm}*' command_mm = cast 'noituloves dischord' %-1
/def -i -p1 -mglob -h'SEND {mine} *' command_mine = use mining at %-1%;/set lastmined=%-1
/def -i -h'SEND {prota} *' command_prota = cast protect armour at %-1
/def -i -h'SEND {protw} *' command_protw = cast protect weapon at %-1

/def cmd_f1 = mm
/def cmd_f5 = /eval use mining at %lastmined
/def cmd_f6 = put all %lastmined in disc;;la %lastmined
