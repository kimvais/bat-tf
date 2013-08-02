;Equt
/def -P0Cgreen -i -t'\{[Tt]hiamin\}' equlabel
/def -P2BCyellow -i -mregexp -t'^(This item|It|This armour|This weapon) is in (AWESOME|incredible|superb|excellent|great|good|fine|battered|poor|bad|very bad|awful) condition\.$' equcond

;Channels
/def -P2Cred -aCcyan -i -t'^([A-Z][A-z]+ )?(.sales.): ' saleslite = \
 /test $[fwrite({saleschannelfile},strcat(ftime("%d/%m/%y %H:%M:%S",time())," ",({*})))]
/def -P3B -aCblue -mregexp -i -t'^([A-Z][A-z| ]+ )?(@hcbat )?(.suomi.): ' suomilite
/def -P2BCwhite -aCblue -mregexp -i -t'^([A-Z][A-z| ]+ )?.(sf).: ' sflite
/def -aB -P2Cblue -i -t'^([A-Z][A-z| ]+ )?(.fin.): ' finlite
/def -Fp1000 -mregexp -P1BCyellow -aCmagenta -i -t'^[|]@@  [)] .(skull[+]).: ' dino_skullpluslite
/def -Fp1000 -mregexp -P2Cblue -aB -i -t'^([A-Z][A-z| ]+ )?.(hockey).: ' hockeylite  
/def -Fp1000 -mregexp -P2Cred -aB -i -t'^([A-Z][A-z| ]+ )?.(football).: ' footballlite  
/def -Fp1000 -mregexp -aCcyan -i -t'^([A-Z][A-z| ]+ )?.(wanted).: ' wantedlite
/def -Fp1000 -P2BCmagenta -aCmagenta -i -t'^([A-Z][A-z| ]+ )?.(bat).: ' batlite
; Society channels
/def -Fp1000 -P2BCgreen -aCmagenta -i -t'^([A-Z][A-z| ]+ )?.(turha[+]).: ' turhapluslite
/def -Fp1000 -P2BCyellow -aCcyan -i -t'^([A-Z][A-z| ]+ )?.(roguelike[+]).: ' roguelikepluslite
/def -Fp1000 -P2BCgreen -aCcyan -i -t'^([A-Z][A-z| ]+ )?.(hardcore[+]).: ' hardcorepluslite
/def -Fp1000 -P2BCgreen -aCgreen -i -t'^([A-Z][A-z| ]+ )?.(hattrick[+]).: ' hardcorepluslite
/def -Fp1000 -P2BCred -aCgreen -i -t'^([A-Z][A-z| ]+ )?.(root[+]).: ' rootpluslite
/def -Fp1000 -aCcyan -P2Cblue -i -t'^([A-Z][A-z| ]+ )?(.kirahvi[+].): ' kirahvilite = /test \
 $[fwrite({kirahvichannelfile},strcat(ftime("%d/%m/%y %H:%M:%S",time())," ",({*})))]
/def -Fp1000 -mregexp -P2BCred -aCred -i -t'^([A-Z][A-z| ]+ )?.(steel[+]).: ' steelpluslite
/def -Fp1000 -mregexp -P2BCyellow -aCgreen -i -t'^([A-Z][A-z| ]+ )?.(safka[+]).: ' safkapluslite
/def -Fp1000 -mregexp -P2BCyellow -aCred -i -t'^([A-Z][A-z| ]+ )?.(hardware[+]).: ' hardwarepluslite
/def -Fp1000 -mregexp -P2BCred -aCyellow -i -t'^([A-Z][A-z| ]+ )?.(dcc[+]).: ' dccpluslite
/def -Fp1000 -mregexp -P2BCyellow -aCmagenta -i -t'^([A-Z][A-z| ]+ )?.(skull[+]).: ' skullpluslite
/def -Fp1000 -mregexp -P2BCwhite -aBCmagenta -i -t'^([A-Z][A-z| ]+ )?.(nubu[+]).: ' nubupluslite
/def -Fp1000 -mregexp -P2BCmagenta -aBCwhite -i -t'^([A-Z][A-z| ]+ )?.(wiz).: ' wizlite
/def -Fp1000 -mregexp -P2BCblue -aBCmagenta -i -t'^([A-Z][A-z| ]+ )?.(weirdos[+]).: ' weirdospluslite
/def -Fp1000 -mregexp -P2BCblue -aBCyellow -i -t'^([A-Z][A-z| ]+ )?.(sport[+]).: ' sportpluslite
/def -Fp1000 -mregexp -P2BCblue -aBCgreen -i -t'^([A-Z][A-z| ]+ )?.(leffa[+]).: ' leffapluslite
/def -Fp1000 -mregexp -P2BCcyan -aBCgreen -i -t'^([A-Z][A-z| ]+ )?.(hightech[+]).: ' hightechpluslite
/def -Fp1000 -mregexp -P2BCblack -aCred -i -t'^([A-Z][A-z| ]+ )?.(poker[+]).: ' pokerpluslite 
/def -Fp1000 -mregexp -P2Cgreen -aBCblack -i -t'^([A-Z][A-z| ]+ )?.(books[+]).: ' bookspluslite 

;Guild channels
/def -P2BCmagenta -aCyellow -i \
    -t'^([A-Z][A-z| ]+ )?\
    .(alchemists|barbarian|bard|cavalier|channellers|conjurer|crimson|druids|\
      lord_chaos|merchant|monk|navigator|nun|psionicist|priests|squire|\
      tarmalen|templar).: ' guild_channel_lite
/def -ag -i -t'^.(tiger).([A-Z][A-Z|a-z| ]+):' tiger_channel_lite =\
	/eval /echo -p @{Cyellow}%{P2} [@{n}@{BCmagenta}tiger@{n}@{Cyellow}]: %{PR}

;Kirahvi/Turha-url catcher
/def -p2 -mregexp -t'^([A-Z][A-z]+) .([a-z]+[+]|fin).: .*(http\:\/\/[^ ]+)' sschannel_url = /echo URL CATCHED!%;\
  /test $[fwrite("/var/www/html/u/url.txt",strcat("Bug?",";",ftime("%d/%m/%y;%H:%M:%S",time()),";",%{P2},";",%{P3}))]
/def -p1 -mregexp -t'^([A-Z][A-z]+) .([a-z]+[+]|fin).: .*(www\.[^ ]+)' sschannel_url2 = /echo URL CATCHED!%;\
  /test $[fwrite("/var/www/html/u/url.txt",strcat(%{P1},";",ftime("%d/%m/%y;%H:%M:%S",time()),";",%{P2},";http://",%{P3}))]
/def -p2 -mregexp -t'^\(fsay\) ([A-Z][A-z]+) [a-z]* \'.*(http\:\/\/[^ ]+)\.\'$' fsay_url = /echo URL CATCHED!%;\
  /test $[fwrite("/var/www/html/u/url.txt",strcat(%{P1},";",ftime("%d/%m/%y;%H:%M:%S",time()),";fsay;",%{P2}))]

;Tells
/def -mregexp -F -p2 -i -t'^[A-Z][a-z]+ tells you ' tells_me =\
 /test $[fwrite({tellfile},strcat((ftime("%d.%m.%y %H:%M:%S",time()))," ",{*}))]
/def -mglob -F -p2 -aCyellow -i -t'You tell *' you_tell =\
 /test $[fwrite({tellfile},strcat((ftime("%d.%m.%y %H:%M:%S",time()))," ",{*}))]
/def -mregexp -F -p2 -i -t'^[A-Z][a-z]+ tells .* and you ' multi_tell =\
 /test $[fwrite({tellfile},strcat((ftime("%d.%m.%y %H:%M:%S",time()))," ",{*}))]
/def -mregexp -F -p2 -i -t'^[@][A-Z][a-z]+ ' emotetome =\
 /test $[fwrite({tellfile},strcat((ftime("%d.%m.%y %H:%M:%S",time()))," ",{*}))]


;General info
/def -F -aBCmagenta -i -t'Info: *' inform
/def -F -aBCmagenta -i -t'Bank transfer from *' trans
/def -F -aCmagenta -i -t'You feel your luck changing.' luckchange
/def -F -aCmagenta -i -t'The fire burns out, spoiling anything in it.' fire_down
/def -F -aBCyellow -i -t'You feel like you just got slightly better in*' gotslightlybetter = @save
/def -F -aBCmagenta -i -t'\[Potion purchase\): Bank transfer *' potionsold
/def -mregexp -aCgreen -t'^[A-Z][a-z]+ [A-z]+? the .+ \(horny\)$' burglehorn

;shapes
/def -P0BCgreen -Fp1 -i -t'is in excellent shape\.$' excshape 
/def -P0BCgreen -Fp1 -i -t'is in a good shape\.$' gsshape
/def -P0BCyellow -Fp1 -i -t'is slightly hurt\.$' shshape
/def -P0BCyellow -Fp1 -i -t'is noticeably hurt\.$' nhshape
/def -P0BCred -Fp1 -i -t'is not in a good shape\.$' nigsshape
/def -P0BCred -Fp1 -i -t'is in bad shape\.$' bsshape
/def -P0BCmagenta -Fp1 -i -t'is in very bad shape\.$' vbsshape
/def -P0BCmagenta -Fp1 -i -t'is near death\.$' ndshapei

;,Movement
/def -F -aCyellow -i -t'* leaves {north.|south.|west.|east.|northeast.|northwest.|northeast.|southeast.|southwest.|up.|down.|enter.|out.|path.}' leaves_dir

;;Item handling
/def -F -aCmagenta -i -t'* drops you *' drops_me = @save
/def -Fp1 -aCmagenta -i -t'You take *' i_take = @save
/def -aBCcyan -F -mregexp -i -t'^[A-z \-\'\,]+ is DEAD\, R\.I\.P\.' ripsraps = /autoloot

;;Disable save on certain actions:
/def -p100 -t'You take a cool refreshing drink of water from *' drink_water
/def -p100 -t'You take a piss in the corner.' piss_in_a_corner
/def -p100 -t'You take a deep breath *' take_a_breath

;;Warnings (red)
/def -aBCred -F -i -t'The balance of your chaos blade shifts wildly about*' bladedamage1
/def -aBCred -F -i -t'can see thin veins of steel running*' bladedamage2
/def -aBCred -F -i -t'Flecks of * shimmer and disappear from your chaos blade.' bladedamage3
/def -aBCred -F -i -t'lapses into unconsciousness due' unconc
/def -aBCred -F -i -t'You are no longer satiated.' hungry1
/def -aBCred -F -i -t'You are STUNNED*' urstunned
/def -aBCred -F -i -t'* stops following the leader.' stopsfollow
/def -aBCred -F -i -t'You stop following the leader.' ustopfollow
/def -aBCred -F -i -t'* is now in the 1st row.' firstrow
/def -aBCred -F -i -t'A * hits you.' spellhitsme1
/def -aBCred -F -i -t'An * hits you.' spellhitsme2
/def -aBCred -F -mregexp -i -t'^Your ([A-z| ]+) gets damaged; it\'s now in ([A-z| ]+) condition\.' equdamage = \
 party say My %{P1} got damaged, and it is now in %{P2} cond.
/def -aBCred -F -mglob -i -t'* is disturbed by spellcasting.' monsie_agroed_by_spell
/def -aBCred -F -mglob -i -t'* got mad at hostile actions *' monsie_agroed_by_skill
/def -aBCred -F -i -t'* loses its tangerine glow.' eq_prot_poof
/def -aBCred -F -i -t'You have a feeling that somebody is watching you.' all_seeing_eyed
/def -aBCred -F -i -t'You decide to change the skill to new one\.' skillchanged
/def -aBCred -F -i -t'You lose your concentration *' skillorspelllost
/def -aBCred -F -i -mregexp -t'^[A-Z][a-z]+ disappears into thick air\.$' someone_was_banished

/eval /load -q %{TRIGDIR}critlite.tf

;;Spider
/def -F -aCred -i -t'Your feel infernal energies flowing to your body from your heart.' spidulite1
/def -F -aCred -i -t'You feel something alien crawling inside your mind seeking release.' spidulite2
/eval /def -F -aCbggreen -aBCred -mregexp -i -t"^A shower of (black|indigo|blue|brown|yellow|green|violet) blood flies from %{capsname}'s palm at " wrathbloodhits =\
 	@@party report Wrath hit! (%{P1})

;Combat (cyan)
/def -F -aCcyan -i -t'Your armours absorb some of the damage.' armor_absorbed
/def -F -aCcyan -i -t'Your marvellous sense of combat prevents your * from getting scratched.' csense_saved_from_eqdmg
/def -F -aCcyan -i -t'Struggling valiantly, you manage to absorb the attack with your armour.' csende_armoria_eteen
/def -F -aBCcyan -i -t'You score a CRITICAL hit!*' crit1
/def -F -aBCcyan -mregexp -i -t'You score a [*]CRITICAL[*] hit!' crit2
;/def -F -aBCcyan -i -t'You STUN*' youstun
/def -F -aCcyan -i -t'You awaken from your short rest, and feel slightly better.' camped
/def -F -aCcyan -i -t'You are not doing anything at the moment.' no_skill_in_progress
;/def -F -aBCbgred -mglob -i -t'* is STUNNED from the force of *' is_stunned
/def -F -aBCcyan -i -t'You get hit hard but your discipline saves concentration on skill.' discipline_skill
/def -F -aBCcyan -i -t'You get hit hard but your discipline saves concentration on spell.' discipline_spell

;;Other combat, skills and spells (yellow)
/def -F -aBCyellow -i -t'* seems hurt and confused.' broke_skill
/def -F -aBCyellow -i -t'{*} starts concentrating on a new offensive spell.' offspell
/def -F -aBCyellow -i -mregexp -t'^[A-Z][a-z]+ has summoned you!$' summonedme
/def -F -aBCyellow -i -t'When your eyes clear, * stands before you.' relocedtome
/def -F -aBCyellow -i -t'* DOUBLEs over in PAIN!' eatswither
/def -F -aBCyellow -i -t'*...WHO breaks the stun quickly off with intense concentration.*' breaksstun
/def -F -aCyellow -i -t'* performs a solemn ceremony to please Aveallis.' tarmacere
/def -F -aCyellow -i -t'* coughs up blood and howls soullessly to satisfy Draen-Dalar.' priestcere
/def -F -aCyellow -i -t'* bows to the four winds and prays to Lumine.' neutralcere
/def -F -aBCyellow -i -t'{*} starts concentrating on a new offensive skill.' offskill
/def -F -aCyellow -i -t'{*} aborts the spell casting.' aborts_spell
/def -F -aCyellow -i -t'{*} breaks the skill attempt.' aborts_skill
/def -F -aCyellow -i -t'* eyes widden in terror as * ruthlessly wounds *.' bfury1
/def -F -aCyellow -i -t'With great precision and speed * maliciously assults *.' bfury2
/def -F -aCyellow -i -t'*\'s ruthless onslaught of attacks causes * to stumble back and *' bfury3 

;; Fire blasts
/def -F -mregexp -aCbgred -aBCyellow -i \
    -t' grins as (its|his|her) (lava blast|firebolt|fire blast|meteor swarm|meteor blast|lava storm|channelburn|gem fire) hits ' other_fire_blast
/def -F -mregexp -aCbgred -aBCyellow -i \
    -t'^You watch with selfpride as your (lava blast|firebolt|fire blast|meteor swarm|meteor blast|lava storm|channelburn|gem fire) hits (.*)\.$' own_fire_blast =\
    /set blast_damage_type=fire

;; Cold blasts
/def -F -mregexp -aCbgblue -aBCcyan -i \
    -t' grins as (its|his|her) (cold ray|chill touch|flaming ice|darkfire|cone of cold|icebolt|hail storm|hoar frost) hits ' other_cold_blast
/def -F -mregexp -aCbgblue -aBCcyan -i \
    -t'^You watch with selfpride as your (cold ray|chill touch|flaming ice|darkfire|cone of cold|icebolt|hail storm|hoart frost) hits (.*)\.$' own_cold_blast = \
    /set blast_damage_type=cold

;; Poison blasts
/def -F -mregexp -aCbggreen -aBCred -i \
    -t' grins as (its|his|her) (summon carnal spores|thorn spray|poison blast|venom strike|poison spray|power blast|killing cloud) hits ' other_poison_blast
/def -F -mregexp -aCbggreen -aBCred -i \
    -t'^You watch with selfpride as your (summon carnal spores|thorn spray|poison blast|venom strike|poison spray|power blast|killing cloud) hits (.*)\.$' own_poison_blast =\
    /set blast_damage_type=poison

;; Magical blasts
/def -F -mregexp -aCbgmagenta -aBCyellow -i \
    -t' grins as (its|his|her) (golden arrow|magic missile|summon lesser spores|levin bolt|magic wave|summon greater spores|magic eruption|channelball|star light|wither flesh) hits ' other_mana_blast
/def -F -mregexp -aCbgmagenta -aBCyellow -i \
    -t'^You watch with selfpride as your (golden arrow|magic missile|summon lesser spores|levin bolt|magic wave|summon greater spores|magic eruption|channelball|star light|wither flesh) hits (.*)\.$' own_mana_blast =\
    /set blast_damage_type=mana

;; Acid blasts
/def -F -mregexp -aCbgyellow -aBCgreen -i \
    -t' grins as (its|his|her) (disruption|acid wind|acid arrow|acid rain|acid ray|acid storm|acid blast) hits ' other_acid_blast
/def -F -mregexp -aCbgyellow -aBCgreen -i \
    -t'^You watch with selfpride as your (disruption|acid wind|acid arrow|acid rain|acid ray|acid storm|acid blast) hits (.*)\.$' own_acid_blast =\
    /set blast_damage_type=acid

;; Electric blasts
/def -F -mregexp -aCbgblue -aBCyellow -i \
    -t' grins as (its|his|her) (lightning blast|shocking grasp|lightning bolt|lightning blast|chain lightning|forked lightning|electrocution|lightning storm|channelbolt) hits ' other_elec_blast
/def -F -mregexp -aCbgblue -aBCyellow -i \
    -t'^You watch with selfpride as your (lightning blast|shocking grasp|lightning bolt|lightning blast|chain lightning|forked lightning|electrocution|lightning storm|channelbolt) hits (.*)\.$' own_elec_blast =\
    /set blast_damage_type=electricity

;; Asphx blasts
/def -F -mregexp -aCbgmagenta -aBCblue -i \
    -t' grins as (its|his|her) (vacuumbolt|chaos bolt|vacuum ball|strangulation|vacuum globe|blast vacuum) hits ' other_asphyx_blast
/def -F -mregexp -aCbgmagenta -aBCblue -i \
    -t'^You watch with selfpride as your (vacuumbolt|chaos bolt|vacuum ball|strangulation|vacuum globe|blast vacuum) hits (.*)\.$' own_asphyx_blast =\
    /set blast_damage_type = asphyxication

;; Psi blasts
/def -F -aCbgcyan -aBCmagenta -i -t'* crushes * mind with a powerful psychic attack!' other_psi_crush
/def -F -aCbgcyan -aBCmagenta -i -t'You crush * mind with your psychic attack!' own_psi_crush =\
    /set blast_damage_type = psionic
/def -F -aCbgcyan -aBCmagenta -i -t'* hits * with {its|his|her} psychic storm.' other_psi_area
/def -F -aCbgcyan -abCmagenta -i -t'You hit * with your psychic storm.' own_psi_area =\
    /set blast_damage_type = psionic
/def -F -aCbgcyan -aBCmagenta -i -mregexp \
    -t' grins as (his|her|its) (mind blast|mind disruption|psibolt|psi blast) hits ' other_psi_blast
/def -F -aCbgcyan -aBCmagenta -i -mregexp \
    -t'^You watch with selfpride as your (mind blast|mind disruption|psi blast|psibolt) hits (.*)\.$' own_psi_blast =\
    /set blast_damage_type=psionic

;; Priest blasts
/def -F -aCbgwhite -aBCred -i -t'* casts a harming spell on *' other_priest_blast
/def -F -aCbgwhite -aBCred -i -t'You cast harming spell on *' own_priest_blast

;;Heals
/def -F -aB -aCbggreen -p3 -i -t'You heal * of * wounds.' own_heal
/def -p1 -mregexp -i -t'^([A-Z][a-z]+)\\\'s spell makes you feel [a-z| ]+ better\\!$' cast_heal_on_me = report

;;Spessut
/def -abBCred -t'a young leprechaun is standing at the end of the rainbow' rainbow_event = /echo -abBCred *** KILL THAT LEPRECHAUN ***
