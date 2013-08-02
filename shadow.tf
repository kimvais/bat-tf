;
; yksinkertainen viemari/luolamapperi
;

/require stack-q.tf

/def -i palauta_suunta=\
	/let foo1=%{1}%;\
        /if (strcmp({1},"w")==0) \
                /let foo1=e%;\
        /elseif (strcmp({1},"e")==0) \
                /let foo1=w%;\
        /elseif (strcmp({1},"s")==0) \
                /let foo1=n%;\
        /elseif (strcmp({1},"n")==0) \
                /let foo1=s%;\
        /elseif (strcmp({1},"se")==0) \
                /let foo1=nw%;\
        /elseif (strcmp({1},"ne")==0) \
                /let foo1=sw%;\
        /elseif (strcmp({1},"sw")==0) \
                /let foo1=ne%;\
        /elseif (strcmp({1},"forward")==0) \
                /let foo1=backward%;\
        /elseif (strcmp({1},"backward")==0) \
                /let foo1=forward%;\
        /elseif (strcmp({1},"f")==0) \
                /let foo1=backward%;\
        /elseif (strcmp({1},"b")==0) \
                /let foo1=forward%;\
        /elseif (strcmp({1},"u")==0) \
                /let foo1=d%;\
        /elseif (strcmp({1},"d")==0) \
                /let foo1=u%;\
	/endif%;\
	/return {foo1}

/def -i palauta_suunta2=\
	/let foo1=%{1}%;\
        /if (strcmp({1},"w")==0) \
                /let foo1=e%;\
        /elseif (strcmp({1},"e")==0) \
                /let foo1=w%;\
        /elseif (strcmp({1},"s")==0) \
                /let foo1=n%;\
        /elseif (strcmp({1},"n")==0) \
                /let foo1=s%;\
        /elseif (strcmp({1},"se")==0) \
                /let foo1=nw%;\
        /elseif (strcmp({1},"ne")==0) \
                /let foo1=sw%;\
        /elseif (strcmp({1},"sw")==0) \
                /let foo1=ne%;\
        /elseif (strcmp({1},"forward")==0) \
                /let foo1=b%;\
        /elseif (strcmp({1},"backward")==0) \
                /let foo1=f%;\
        /elseif (strcmp({1},"f")==0) \
                /let foo1=b%;\
        /elseif (strcmp({1},"b")==0) \
                /let foo1=f%;\
        /elseif (strcmp({1},"u")==0) \
                /let foo1=d%;\
        /elseif (strcmp({1},"d")==0) \
                /let foo1=u%;\
	/endif%;\
	/return {foo1}


/def -i split_s=\
        /let foo1=0%;\
        /let teksti=%{1}%;\
	/set suunnat=$[strcat()]%;\
	/set paluusuuntaskipattu=0%;\
	/set kakkonen=%{2}%;\
        /while (foo1 != -1) \
                /let foo2=$[strchr(teksti,",")]%;\
                /if (foo2 != -1) \
			/if (strcmp(substr(teksti,0,foo2),"out") == 0 | strcmp(substr(teksti,0,foo2),"temple")==0) \
				/let foo999=0%;\
			/elseif (strcmp(substr(teksti,0,foo2),palauta_suunta({kakkonen})) != 0) \
				/if (strcmp(substr(teksti,0,foo2),"forward")==0) \
					/set suunnat=$[strcat(suunnat,"f")]%;\
				/elseif (strcmp(substr(teksti,0,foo2),"backward")==0) \
					/set suunnat=$[strcat(suunnat,"b")]%;\
				/else \
                        		/set suunnat=$[strcat(suunnat,substr(teksti,0,foo2))]%;\
				/endif%;\
			/else \
				/set paluusuuntaskipattu=1%;\
			/endif%;\
                        /let teksti=$[substr(teksti,foo2+1)]%;\
                /else \
                        /let foo1=-1%;\
                        /if (strlen(teksti) > 0) \
				/if (strcmp(teksti,"out") == 0 | strcmp(teksti,"temple")==0) \
					/let foo999=0%;\
				/elseif (strcmp(teksti,palauta_suunta({kakkonen})) != 0) \
					/if (strcmp(teksti,"forward")==0) \
						/set suunnat=$[strcat(suunnat,"f")]%;\
					/elseif (strcmp(teksti,"backward")==0) \
						/set suunnat=$[strcat(suunnat,"b")]%;\
					/else \
                                		/set suunnat=$[strcat(suunnat,teksti)]%;\
					/endif%;\
				/else \
					/set paluusuuntaskipattu=1%;\
				/endif%;\
                        /endif%;\
                /endif%;\
        /done%;\
	/if (paluusuuntaskipattu == 1) \
		/set suunnat=$[strcat(palauta_suunta2({kakkonen}),suunnat)]%;\
	/endif

/eval /set risteykset=0

/eval /set polku=
/eval /set next_s=
/eval /set takapakki=0
/eval /set takapakki_asetettu=0
/set polkupino=
/set reitti=
/eval /set suunnat_old=
;		/if (strlen(suunnat) == 1) \
;			/set next_s=%suunnat%;\
;			/set takapakki=1%;\
;			/set takapakki_asetettu=1%;\

/set roomcount=0

/def -i -mregexp -t"^Shadow Maze \(([a-z,]*)\)" shadow_maze=\
	/split_s %P1 %next_s%;\
	/set suunnat2=%suunnat%;\
	/if (takapakki == 1) \
		/echo takapakki%;\
		/set suunnat=$(/pop polkupino)%;\
	/else \
		/set roomcount=$[roomcount+1]%;\
	/endif%;\
	/if (strlen(next_s) > 0) \
		/set reitti=$[strcat(reitti,next_s)]%;\
	/endif%;\
	/echo Suunnat: %suunnat%;\
	/set takapakki=0%;\
	/set next_s=$[(substr({suunnat},-1))]%;\
	/set suunnat=$[(substr({suunnat},0,-1))]%;\
	/if (strlen(suunnat) > 0) \
		/push %suunnat polkupino%;\
	/elseif (strlen(polkupino) > 0) \
		/set takapakki=1%;\
	/endif%;\
	/echo seuraava suunta: %next_s%;\
	/echo Huoneita: %roomcount Polku: %polkupino%;\
	/if (shadow_auto == 1) \
		/repeat -0 1 %next_s%;\
	/endif%;\
	/set div_action=%next_s

/def -i pino=/echo polku: %polkupino

/def -i shadowauto=\
        /if (shadow_auto == 1) \
                /echo -aBCwhite | Shadow non-automatic%;\
                /set shadow_auto=0%;\
        /else \
                /echo -aBCwhite | Shadow automatic%;\
                /set shadow_auto=1%;\
        /endif

/def clear_shadow=/shadow_clear

/def shadow_clear=/undef pino%;\
		/undef shadow_maze%;\
		/undef split_s%;\
		/undef clear_shadow%;\
		/undef shadow_clear%;\
		/undef palauta_suunta

/def shadow_takapakki=\
	$[palauta_suunta2(substr(reitti,-1))]%;\
	/set reitti=$[(substr({reitti},0,-1))]

/kf8 /shadow_takapakki
/laki /shadowauto

/def -n1 -msimple -t"A gorgeous looking woman clad in shadows" foo3=/shadowauto

