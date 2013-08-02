/eval /load -q %{TRIGDIR}nav.tf
/eval /load -q %{TRIGDIR}caster.tf

;;Commands for tarma
/def -i -h'SEND {bot} *' command_bot = cast blessing of tarmalen at %-1                          
/def -i -h'SEND {mh} *' command_mh = cast major heal at %-1
/def -i -h'SEND {ccw} *' command_ccw = cast 'cure critical wounds' %-1
/def -i -h'SEND {clw} *' command_clw = cast cure light wounds at %-1
/def -i -h'SEND {csw} *' command_csw = cast 'cure serious wounds' %-1
/def -i -h'SEND {date}' command_date =  /quote -S /echo -aB !date +'\%A \%x \%X, viikko \%V'
/def -i -h'SEND {fa} *' command_fa = use first aid at %-1%;party say reviving %-1
/def -i -h'SEND {ress} *' command_ress = cast resurrect at %-1%;tell %-1 reﬂing your aﬂ out of there. 
/def -i -h'SEND {rais} *' command_rais = cast raise dead at %-1%;tell %-1 rusinag (raising)
/def -i -h'SEND {mh} *' command_mh = cast 'major heal' %-1
/def -i -h'SEND {unp} *' command_unp = cast 'unpain' %-1
/def -i -h'SEND {dd} *' command_dd = @cast 'deaths door' %-1%;@party report *is reviving %-1 *
/def -i -h'SEND {rmscar} *' command_rmscar = cast remove scar at %-1
/def -i -h'SEND {bot} *' command_bot = cast blessing of tarmalen at %-1
/def -i -h'SEND {us} *' command_us = cast unstun at %-1
/def -i -h'SEND {acc}' command_acc = ghost accept resurrect, raise dead or new body from Noitatohtori. Fumble prices are 50k/100k/200k respectively
/def -i -h'SEND {ws} *' command_ws = @@cast 'summon' %-1%;@@wanted got %-1%;@@tell %-1 gotcha!
/def -i -h'SEND {gspam} *' command_gspam = tell %-1 accept rais/ress/body/reinc from thiamin
/def -i -h'SEND {gspam}' command_gspam = ghost accept rais/ress/body/reinc from thiamin


;;Funkkarit
/def cmd_f1 = /eval @@cast 'cure critical wounds' %{tank1}
/def cmd_f2 = /eval @@cast 'cure critical wounds' %{tank2}
/def cmd_f3 = /eval @@cast 'cure critical wounds' %{tank3}
/def cmd_f4 = /eval @@cast 'minor party heal'
/def cmd_f5 = /eval @@cast 'major heal' %{tank1}
/def cmd_f6 = /eval @@cast 'major heal' %{tank2}
/def cmd_f7 = /eval @@cast 'major heal' %{tank3}
/def cmd_f8 = /eval @@cast 'major party heal'
/def cmd_kp5 = @@scan all%;@@party status short

;;Heal all
/def -i reset_heal_all_timer = /eval /set heal_all_time=$[time()]
/def -i -t"You clap hands and whisper 'koko mudi kuntoon, hep'" cast_heal_all = /reset_heal_all_timer
/def -i -h'SEND {healall}' command_healall = /if (%heal_all_time+285 < time()) /send cast heal all at 50%;/else /eval /echo -aB Heal all available in $[ftime("%M min %S sec.",%heal_all_time+285-time())]%;/endif
/def -i -mregexp -t'^[0-9]+ players can be affected with this spell\.$' not_enough_players_for_heal_all = /reset_heal_all_timer

;;Heal-target aliases
/def -i -mregexp -t'^1st. Row[ ]+(-----|[A-Z][a-z]+)[ ]+(-----|[A-Z][a-z]+)[ ]+(-----|[A-Z][a-z]+)' firstrow = \
 /if (%P1 =~ '-----') %;/else /eval /set tank1=%P1%;/endif%;\
 /if (%P2 =~ '-----') %;/else /eval /set tank2=%P2%;/endif%;\
 /if (%P3 =~ '-----') %;/else /eval /set tank3=%P3%;/endif

;;Rmscar
/def -mregexp -t'^([A-Z][a-z]+)\'s scar vanishes\.$' rmscar = /eval rmscar $[tolower(%P1)]

