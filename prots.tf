/require lisp.tf
/require tr.tf

/def -h'SEND {prots}' cmd_prots = \
	/eval /check %{prots}

/def check=/while ({#}) /eval /let prottime=$$[trunc(time()-%%{%{1}_start})]%%;/eval /echo Prot: %%{1} %%{prottime} ($$[trunc((time()-%%{%{1}_start})/60)]:$$[mod(trunc(time()-%%{%{1}_start}),60)])%;/shift%;/done

/def addprot=\
    /eval /set %{1}_start=$$[time()]%;\
    /if (length({prots}) > 0) \
        /eval /set prots=$[strcat({prots}," ",{1})]%%;\
        /eval /set st_prots=$[strcat({st_prots}," ",{2})]%;\
    /else \
        /eval /set prots=%{1}%%;\
        /eval /set st_prots=%{2}%;\
    /endif

/def rmprot=\
    /eval /unset starttime_%{2}%;\
    /eval /set prots=$(/eval /remove %{1} %{prots})%;\
    /eval /set st_prots=$(/eval /remove %{2} %{st_prots})%;\
    /if (length({st_prots}) < 1) \
        /unset prots%%;\
        /unset st_prots%;\
    /endif

/def protup = \
    @@party report %{1} up.%;\
    /addprot %{1} %{2}

/def protdown = \
    @@party report %{1} DOWN!%;\
    /rmprot %{1} %{2}

/def -mregexp -t'^[A-Z][a-z]+ tweaks your nose mischievously\.$' tweaks_my_nose = \
    @@party report Prots: %{prots}

;Reaver
/def -Fp1 -mglob -i -t'The destructive forces leave your body.' glory_down = /protdown glory_of_destruction glory

;Bard "prots"
/def -Fp1 -mglob -i -t'The effect of war ensemble wears off.' warez_off = /protdown war_ensemble WAR
/def -Fp1 -mglob -i -t'You feel full of battle rage! Victory is CERTAIN!' warez_up = /protup war_ensemble WAR
/def -Fp1 -mregexp -i -t'^[A-Z][a-z]+ wraps you into an embracing melody\.' emm_up = /protup embracing_melody EmM
/def -Fp1 -i -t'The embracing melody subsides, leaving you longing for more.' emm_down = /protdown embracing_melody EmM
/def -Fp1 -i -t'You feel optimistic about your near future!' afav_up = /protup arches_favour ArF 


;Channu
/def -p1 -F -i -t'You surround yourself by a bubble of force.' rilya_up = /protup personal_force_field FF
/def -p1 -F -i -t'Your field disperses with a soft \*pop\* and is gone*' rilya_down = /protdown personal_force_field FF

;Infra
/def -p1 -F -mglob -i -t'You have infravision.' infra_up=/protup infravision infra
/def -p1 -F -mglob -i -t'Everything no longer seems so red.' infra_down=/protdown infravision infra

;Poison
/def -p1 -F -mglob -i -t'You feel the poison leaving your veins*' rp_worked = p' Poison Removed
/def -p1 -F -mglob -i -t'You SAVE against POISON*' saved_poison = p' Saved Poison
/def -p1 -F -mglob -i -t'You shiver and suffer from POISON*' am_poisoned = p' Poisoned

/def -p1 -F -mglob -i -t'*spell makes you feel all better*' fully_healed= p' Fully Healed

;;Unstun
/def -p1 -F -mregexp -i -t"^[A-Z][a-z]+\'s chanting appears to do absolutely nothing.$" unstun_up = /protup unstun US
/def -p1 -F -mglob -i -t"It doesn\'t hurt at all\!" unstun_down = p' Unstun weaker!
/def -p1 -F -mglob -i -t"It doesn\'t hurt as much as it normally does\!" doesnt_hurt_as_much_as_it_normally_does =\
	/def -t'You are no longer stunned.' stun_dropped=/protdown unstun US
/eval /def -p1 -F -mglob -i -t'%{capsname} is aided by the higher pow*' iw_worked = /protdown iron_will IW
/def -p1 -F -mglob -i -t'You feel no longer protected from being stunned.' iw_down = /protdown iron_will IW

;;Druid prots
/def -p1 -F -mglob -i -t'You sense a flex shield covering you*' flex_up = /protup flex_shield FLX
/def -p1 -F -mglob -i -t'Your flex shield wobbles, PINGs*' flex_down = /protdown flex_shield FLX
/def -p1 -F -mglob -i -t'Your skin feels softer*' eskin_down = /protdown stoneskin STO 
/def -p1 -F -i -t'You feel your skin harden.' stoneskin_up = /protup stoneskin STO
/def -p1 -F -i -t'You feel your metabolism speed up*' regen_up = /protup regeneration REG
/def -p1 -F -i -t'You no longer have a active regen*' regen_down = /protdown regeneration REG
/def -p1 -mglob -F -i -t'You feel your strength changing*' epow_up = /protup earth_power EPW
/def -p1 -mglob -F -i -t'*runic sigla \'% !^\' fade away..*' epown_down = /prodown earth_power EPW
/def -p1 -mglob -F -i -t'Vines entangle your body.' vmantle_up = /protup vine_mantle VMa

;;Tarma prots
/def -p1 -F -i -t'You feel strong - like you could carry whole*' bot_down = /protup blessing_of_tarmalen BOT
/def -p1 -F -i -t'You hear a loud snap like sound\!' llink_down = /protdown life_link LL
/def -p1 -F -i -t'You feel somehow linked to *' llink_up = /protup life_linki LL
/def -p1 -F -mglob -i -t'You feel your will getting stronger*' unpain_up = /protup unpain UNP
/def -p1 -F -mglob -i -t'You feel your will returning normal.' unpain_down = /protdown unpain UNP

;;Lesser conju prots
/def -p2 -F -i -t'* \'ztonez des deckers\'' fabs_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
         /protup force_absorption FabS
/def -p1 -F -i -t'A skin brown flash*' fabs_down = /protdown force_absorption FabS

/def -p2 -F -i -t'* \'morri nam pantoloosa\'' toxd_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
         /protup toxic_dilution ToxD
/def -p1 -F -i -t'A green flash*' poisp_down = /protdown toxic_dilution ToxD

/def -p2 -F -i -t'* \'meke tul magic\'' magd_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
         /protup magic_dispersion MagD
/def -p1 -F -i -t'A golden flash*' magip_down = /protdown magic_dispersion MagD

/def -p2 -F -i -t'* \'hot hot not zeis daimons\'' hear_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
         /protup heat_reduction HeaR
/def -p1 -F -i -t'A burning red flash*' firep_down = /protdown heat_reduction HeaR

/def -p2 -F -i -t'* \'qor monoliftus\'' ethb_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
         /protup ether_boundary EthB
/def -p1 -F -i -t'A dull black flash*' apshp_down = /protdown ether_boundary EthB

/def -p2 -F -i -t'* \'skaki barictos yetz fiil\'' froi_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
         /protup frost_insulation FroI
/def -p1 -F -i -t'A cold white flash*' coldp_down = /protdown frost_insulation FroI

/def -p2 -F -i -t'* \'sulphiraidzik hydrochloodriz gidz zut\'' cors_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
         /protup corrosion_shield CorS
/def -p1 -F -i -t'A disgusting yellow flash*' acidp_down = /protdown corrosion_shield CorS

/def -p2 -F -i -t'* \'kablaaaammmmm bliitz zundfer\'' enec_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
         /protup energy_channeling EneC
/def -p1 -F -i -t'A crackling blue flash*' elecp_down = /protdown energy_channeling EneC 

/def -p2 -F -i -t'* \'toughen da mind reeez un biis\'' psys_cast = \
    /def -p101 -i -t'You sense a powerful protective aura around you*' lesser_conju_prot = \
        /protup psychic_sanctuary PsyS
/def -p1 -F -i -t'A transparent flash*' psip_down = /protdown psychic_sanctuary PsyS

/def -p1 -F -mglob -i -t'You feel less invisible*' blurordisp_down = /protdown displacement D/Bi
/def -p1 -F -mglob -i -t'You feel much more vulnerable*' resistance_down = /protdown resistance RES
/def -p1 -F -mglob -i -t'You suddenly feel magically heavier*' hw_up = /protup heavy_weight HW
/def -p1 -F -mglob -i -t'You feel lighter, but it doesn*' hw_down = /protdown heavy_weight HW
/def -p1 -F -mglob -i -t'You suddenly can\'t see yourself*' invis_up = /protup invisibility INV
/def -p1 -F -mglob -i -t'You feel a slight tingle*' sop_up = /protup shield_of_protection SOP
/def -p1 -F -mglob -i -t'You turn visible*' ivis_down = /protdown invisibility INV
/def -p1 -F -mglob -i -t'You feel more vulnerable *' sop_up = /protdown shield_of_protection SOP
/def -p1 -F -mglob -i -t'You feel a powerful aura*' disp_up = /protup displacement D/Bi
/def -p1 -F -mglob -i -t'You sense an extra powerful*' sticky_resistance_up = /protup sticky_resistance SRS

;;Big conju prots
/def -p1 -F -mglob -i -t'You see a crystal clear shield fade into existance around you.*' aoa_up = \
    /protup armour_of_aether AOA
/def -p1 -F -mglob -i -t'Your crystal clear shield fades out.' aoa_down = \
    /protdown armour_of_aether AOA

/def -p1 -F -mglob -i -t'You see a swirling foggy white shield fade into existance around you.' aow_up = \
  /protup aura_of_wind AoW
/def -p1 -F -mglob -i -t'Your swirling foggy white shield fades out.' aow_down = \
  /protdown aura_of_wind AoW

/def -p1 -F -mglob -i -t'You see a crackling red-orange shield fade into existance around you.' fls_up = \
  /protup flame_shield FlS
/def -p1 -F -mglob -i -t'Your crackling red-orange shield fades out.' fls_down =\
  /protdown flame_shield FlS

/def -p1 -F -mglob -i -t'You see a frosty blue-white shield fade into existance around you.' frs_up = \
  /protup frost_shield FrS
/def -p1 -F -mglob -i -t'Your frosty blue-white shield fades out.' frs_down =\
  /protdown frost_shield FrS

/def -p1 -F -mglob -i -t'You see a neon purple shield fade into existance around you.' lis_up = \
  /protup lightning_shield LiS
/def -p1 -F -mglob -i -t'Your neon purple shield fades out.' lis_down =\
  /protdown lightning_shield LiS

/def -p1 -F -mglob -i -t'You see a misty pale blue shield fade into existance around you.' psp_up = \
  /protup psionic_phalanx PsP
/def -p1 -F -mglob -i -t'Your misty pale blue shield fades out.' psp_down =\
  /protdown psionic_phalanx PsP

/def -p1 -F -mglob -i -t'You see a flickering golden shield fade into existance around you.' rea_up = \
  /protup repulsor_aura ReA
/def -p1 -F -mglob -i -t'Your flickering golden shield fades out.' rea_down =\
  /protdown repulsor_aura ReA

/def -p1 -F -mglob -i -t'You see a slimy olive green shield fade into existance around you.' sod_up = \
  /protup shield_of_detoxifications SoD
/def -p1 -F -mglob -i -t'Your slimy olive green shield fades out.' sod_down =\
  /protdown shield_of_detoxifications SoD

/def -p1 -F -mglob -i -t'You see a bubbling yellow shield fade into existance around you.' acs_up = \
  /protup acid_shield AcS
/def -p1 -F -mglob -i -t'Your bubbling yellow shield fades out.' acs_down =\
  /protdown acid_shield AcS


;| Acid shield                   |  60 | 100 |    27161 |
;| Aura of wind                  |  60 | 100 |    27161 |
; the magic words 'englobo globo mc'pop'
; You see a swirling foggy white shield fade into existance around you.
; Your swirling foggy white shield fades out.

;| Flame shield                  |  60 | 100 |    27161 |
; You utter the magic words 'huppa huppa tiki tiki'
; You see a crackling red-orange shield fade into existance around you.
; Your crackling red-orange shield fades out.

;| Frost shield                  |  60 | 100 |    27161 |
; You utter the magic words 'nbarrimon zfettix roi'
; You see a frosty blue-white shield fade into existance around you.
; Your frosty blue-white shield fades out.

;| Lightning shield              |  60 | 100 |    27161 |
; You utter the magic words 'ohm'
; You see a neon purple shield fade into existance around you.
; Your neon purple shield fades out.

;| Psionic phalanx               |  60 | 100 |    27161 |
; You utter the magic words 'all for one, gather around me'
; You see a misty pale blue shield fade into existance around you.
; Your misty pale blue shield fades out.

;| Repulsor aura                 |  60 | 100 |    27161 |
; You see a flickering golden shield fade into existance around you.
; Your flickering golden shield fades out.

;| Shield of detoxification      |  60 | 100 |    27161 |
; You see a slimy olive green shield fade into existance around you. shield_of_detox_up
; Your slimy olive green shield fades out.

;/def -p1 -F -aBCcyan -i -t'You lose your concentration*' lost_skill_due_unknown_reason
/def -p1 -F -mglob -i -t'* forms a shield of force around you*' fs_up = /protup force_shield FS
/def -p1 -F -mglob -i -t'Your armour feels thinner*' fs_down = /protdown force_shield FS
/def -p1 -F -mglob -i -t'You feel less agile*' quicksilver_down = /protdown quicksilver QS 

;; Barb prots
/def -p1 -F -mglob -i -t'You begin to concentrate on cold tolerance*' coldtolerance_up = /protup cold_tolerance ColdT
/def -p1 -F -mglob -i -t'You begin to concentrate on pain threshhold*' painthreshold_up = /protup pain_threhhold PainT 
/def -p1 -F -mglob -i -t'You begin to concentrate on fire walking*' firewalking_up = /protup fire_walking FireW
/def -p1 -F -mglob -i -t'Your concentration breaks and you feel less protected from cold*' coldtolerance_down =\
    /protdown cold_tolerance ColdT
/def -p1 -F -mglob -i -t'Your concentration breaks and you feel less protected from fire*' firewalking_down =\
    /protdown fire_walking FireW
/def -p1 -F -mglob -i -t'Your concentration breaks and you feel less protected from physical*' painthreshold_down =\
    /protdown pain_threshold PainT

;;Nun prots
/def -p1 -F -mglob -i -t'A white holy aura surrounds you*' pfe_up = \
    /protup protection_from_evil PFE
/def -p1 -F -mglob -i -t'You no longer have a white aura around you*' pfe_down = \
    /protdown protection_from_evil PFE
/def -p1 -F -mglob -i -t'You feel weaker*' bot_down = /protdown blessing_of_tarmalen BOT

;;Pfg
/def -p1 -F -mglob -i -t'A vile black aura surrounds you.' pfg_up=\
    /protup protection_from_good PFG
/def -p1 -F -mglob -i -t'You no longer have a vile black aura around you.' pfg_down =\
    /protdown protection_from_good PFG
/def -p1 -F -i -t'You are surrounded by divine glow!' sof_up = \
    /protup shield_of_faith SOF
/def -p1 -F -i -t'Your glow disappears.' sof_down = \
    /protdown shielf_of_faith SOF

/def -p1 -F -i -t'* hates you.' hate1 = /set oldau=%{hpmax}%; \
 /def -p100 -F -n1 -i -t'%1 screams in rage and yells' hate = \
 /def -n1 -p100 -F -i -t' hatred. Use your aggressive*' hate2 = \
 /def -p101 -i -t'*screams with frustration as * spell fails*' au2 = /undef au \
 %%%%;/undef au2%%%%;/undef au3%%%%;/undef au4%%%%;/undef au5%%%; \
 /def -p101 -i -t'*falters and loses * spell*' au3 = /undef au \
 %%%%;/undef au2%%%%;/undef au3%%%%;/undef au4%%%%;/undef au5%%%; \
 /def -p101 -i -t'*mumbles something inconcievable*' au4 = /undef au \
 %%%%;/undef au2%%%%;/undef au3%%%%;/undef au4%%%%;/undef au5%%%; \
 /def -p101 -i -t'*fails miserably in * spell*' au5 = /undef au \
 %%%%;/undef au2%%%%;/undef au3%%%%;/undef au4%%%%;/undef au5%%%; \
 /def -p100 -F -n1 -i -t'*' au = \
  /repeat -2 1 /set auamt=$$$$$[hpmax-oldau]%%%%%; \
  p' < Aura of Hate UP (+%%%%%{auamt}hp) >%%%%; \
  /set auratime=$[time()]%%%%;/set st_ah=AH%%%%; \
  /undef au2%%%%;/undef au3%%%%;/undef au4%%%%;/undef au5

/def -p1 -F -i -t'You feel your anger and hate of the*' aoh_down = /protdown aura_of_hate AOH
/def -ag -i -h'SEND {nohate}' send_nohate = /undef hate
/def -p1 -F -mglob -F -i -t'You lie down and begin*' camping = /set st_camp=
/def -p1 -F -mglob -F -i -t'You stretch yourself and consider*' can_camp1 =  /set st_camp=C
/def -p1 -F -mglob -F -i -t'You feel a bit tired*' ca_camp2 = /set st_camp=C
/def -p1 -F -mglob -F -i -t'You don\'t quite feel like camping at the moment.*' cannot_camp = /set st_camp=

;WW
/def -i -t'You slowly descend until your feet are on the ground.' floating_down = /protdown floating FLO
/def -i -t'You feel heavier.' ww_down = /protdown water_walking WW
/def -i -t'You feel light.' ww_up = /protup water_walking WW

;Spider walk
/def -i -t'The walls don\'t look so inviting anymore.' spiderwalk_down = /protdown spider_walk SWa
/def -i -t'For some reason you want to run on the walls for a little while.' spiderwalk_up = /protup spider_walk SWa

;druidi
/def -t'The runic sigla \'!\( \*\)\' fade away.. leaving you feeling strange.' ebl_down = \
    /protdown earth_blood EBL
/def -t'An icy chill runs through your veins.' eblup = \
    /protup earth_blood EBL
/def -t'You no longer have Arches Favour on you. You feel sad.' af_down = \
    /protdown arches_favour AF
;The embracing melody subsides, leaving you longing for more.
;You feel no longer protected from being stunned. iwdown
;You suddenly feel more vulnerable to evil. pfedown
