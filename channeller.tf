;;Commands
/def -i -h'SEND {cb} *' command_cb = cast channelball at %-1%;/set target=%-1 
/def -i -h'SEND {dr}' command_dr = cast drain room
/def -i -h'SEND {cu} *' command_cu = cast channelburn at %-1%;/set target=%-1
/def -i -h'SEND {co} *' command_co = cast channelbolt at %-1%;/set target=%-1
/def -i -h'SEND {cs}' command_cs = check supply
/def -i -h'SEND {de} *' command_de = cast drain enemy at %-1
/def -i -h'SEND {ra} *' command_ra = cast replenish ally at %2 amount %3%;@party say *gives %2 %3 flowerpower*
/def -h'SEND {da} *' cmd_da = cast drain ally at %-1%;@slurp %-1

;;F-keys
/def cmd_f1 = cast channelball
/def cmd_f2 = cast channelburn
/def cmd_f3 = cast channelbolt
/def cmd_f4 = cast drain enemy
/def cmd_f5 = cast channelball at %{target}
/def cmd_f6 = cast channelburn at %{target}
/def cmd_f7 = cast channelbolt at %{target}
/def cmd_f8 = cast channelspray

;;Aura
/def setaurastatus=/set auracolor=%{*}%;\
    /status_edit st_aura:1:C%auracolor%;\
    /eval /set st_aura=$[toupper(substr(auracolor,0,1))]
/def -abBCred -t'Your aura of glowing light fades to nothing.' aurai_drop = \
    /status_edit st_aura:1:Cwhite%;\
    /set st_aura=!
/def -aCyellow -t'Suddenly a softly glowing aura of yellow light comes into being around you.' yellow_aura=\
    /setaurastatus yellow
/def -aCred -t'With a burst of energy, your aura changes from soft yellow to bright red.' aura_to_red =\
    /setaurastatus red
/def -aCblue -i -t'Suddenly the surroundings burst into a sea of bright blue light!' aura_blue =\
    /setaurastatus blue
/def -i -t'You also reset your aura\'s duration.' aura_reload1 =\
    /setaurastatus %auracolor
/def -i -t'You do, however, recharge your aura.' aura_reload2 =\
    /setaurastatus %auracolor
/def -i -t'Not all is lost, however, you did just recharge your aura.' aura_reload1 =\
    /setaurastatus %auracolor
/def -abBCred -t'Your aura is starting to weaken!' aura_weaken =\
    @@party say AURA WEAKENING GOTTA RELOAD ULU ULU!%;\
    /status_edit st_aura:1:BCred%;\
    /set st_aura=^
/def -i -h'SEND {aura}' command_aura = cast energy aura%;\
    @@party say LOADING AURA, (ANY of you pricks MOVE and I'll execute every motherFUCKING LAST ONE of YA!
