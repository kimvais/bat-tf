;;/def -i -h'SEND * {nt}' noitis_alias = %PL thiamin
/def -i -h'SEND {f} *' command_f = @@finger %{-1}%;@@atlas find %{-1}
/def -i -h'SEND {leadoff} *' command_leadoff = remove ring of lead;;wear plahplah %-1
/def -i -h'SEND {leadon} *' command_leadon = remove plahplah;;wear ring of lead %-1
/def -i -h'SEND {k} *' command_k = @kill %-1%;target %-1%;/set lastkilled=%-1
/def -i -h'SEND {k} *' command_k = @kill %-1%;target %-1%;@earmark %-1%;/set lastkilled=%-1
/def -i -h'SEND {x}' command_x1 = scan all
/def -i -h'SEND {x} *' command_x2 = scan %-1
/def -i -h'SEND {kill} *' command_kill = @kill %-1%;@target %-1%;/set lastkilled=%-1
/def -i -h'SEND {pp} *' command_pp = party place %-1
/def -i -h'SEND {puf} *' command_puf = party unfollow %-1
/def -i -h'SEND {rep} *' cmd_rep = /paste %-1
/def -i -h'SEND {sp} *' command_sp = show spells %-1
/def -i -h'SEND {tgt} *' command_tgt = alias tgt %-1
/def -i -h'SEND {t} *' command_t = @tell %-1
/def -i -h'SEND {ld}*' command_ld = /undef hang_up%;@@ld %-1
/def -i -h'SEND {h}' command_h = cast cure light wounds at thiamin

;; Sossukanavat
/def -i -h'SEND {dcc} *' command_dcc = @@dcc+ say %-1
/def -i -h'SEND {hc} *' command_hc = @@hardcore+ say %-1
/def -i -h'SEND {hrw} *' command_hrw = @@hardware+ say %-1
/def -i -h'SEND {kir} *' command_kir = @@kirahvi+ say %-1
/def -i -h'SEND {rog} *' command_rog = @@roguelike+ say %-1
/def -i -h'SEND {roo} *' command_roo = @@root+ say %-1
/def -i -h'SEND {safka} *' command_safka = @@safka+ say %-1
/def -i -h'SEND {sku} *' command_sku = @@skull+ say %-1
/def -i -h'SEND {ste} *' command_ste = @@steel+ say %-1
/def -i -h'SEND {tur} *' command_tur = @@turha+ say %-1
/def -i -h'SEND {nubu} *' command_nubu = @@nubu+ say %-1
/def -i -h'SEND {wrd} *' command_wrd = @@weirdos+ say %-1
/def -i -h'SEND {spo} *' command_spo = @@sport+ say %-1
/def -i -h'SEND {lef} *' command_lef = @@leffa+ say %-1
/def -i -h'SEND {hite} *' command_ht = @@hightech+ say %-1
/def -i -h'SEND {ht} *' command_ht = @@hattrick+ say %-1
/def -i -h'SEND {po} *' command_po = @@poker+ say %-1
/def -i -h'SEND {kids} *' command_po = @@kids+ say %-1

/def -i -h'SEND {cda} *' command_cda = use combat damage analysis at %-1 

;;Spider
/def -i -h'SEND {sdc}' cmd_sdc = cast spider demon control at thiamin
/def -i -h'SEND {wr} *' command_wr = cast 'spider wrath' %-1

;;Templar
/def -h'SEND {sof} *' command_sof = cast shield of faith at %-1

/eval /load -q %{TRIGDIR}autocmd.tf
/eval /load -q %{TRIGDIR}foreach_friends.tf

;Trigujen lataus
/def lt = /eval /load -q %{TRIGDIR}%{*}
