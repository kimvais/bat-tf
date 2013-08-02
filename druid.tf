/def -aBCred -t'* winces and looks a bit braver\.' wither_expires = p' Wither Flesh EXPIRES
/def -Fp1 -aBCbgcyan -aCblack -t'^[A-Z][a-z]+ .(wanted|ghost).: reinc(arnation)?$' reinclite
/def -h'SEND {reinc} *' command_reinc = cast reincarnation at %-1%;tell %-1 reincin ya
/def -h'SEND {fire}' command_fire = use fire building
/def -i -h'SEND {gg}*' command_gg = /set gftarget=%-1%;/eval cast gem fire at %gftarget use gem 1
/def -i -h'SEND {qq}*' command_qq = cast 'earthquake' %-1
/def -i -h'SEND {flx} *' command_flx = cast 'flex shield' %-1%;flex %-1
/def -i -h'SEND {ita} *' command_ita = cast inquiry to ahm at %-1%;/set ita_target=$[toupper(%-1)]
/def -mregexp -t'^(Instant|Fast|Normal|Slow) mode\:[\W]+([0-9|.]+)' inquiry_report = /eval @@emote %ita_target - $[tolower(%P0)]
/def -i -h'SEND {ra} *' command_ra = tell %-1 transfer (10k), die, accept

/def -t'You fail to start the fire.' fire_fail = /command_fire
/def -i -p1 -mglob -h'SEND {wf} *' command_wf = cast wither flesh at %-1
/def -i -p1 -mglob -h'SEND {es} *' command_es = cast earth skin at %-1
/def -i -p1 -mglob -h'SEND {epow} *' command_epow = cast earth power at %-1
/def -i -p1 -mglob -h'SEND {csa}' command_csa = cast charge staff at amount all
/def -i -h'SEND {gspam} *' command_gspam = tell %-1 accept rais/ress/body/reinc from noitatohtori
/def -i -h'SEND {ebl} *' command_ebl = cast earth blood at %-1

/def cmd_f10 = /eval cast gem fire at %gftarget use gem 1

/def -mregexp -P0Cgreen -t'water lily' water_lily

;chesti
/def -mregexp -p100 -t'^You watch with selfpride as your gem fire hits (Chest|Box|Safe).' gem_fire_chest_open = /eval cast gem fire at use gem $[tolower(%{P1})]

