;Equt
/def -P0Cgreen -i -t'\{[Tt]hiamin\}' equlabel
/def -P2BCyellow -i -mregexp -t'^(It|This armour|This weapon) is in (AWESOME|incredible|superb|excellent|great|good|fine|batterred|poor|bad|very bad|awful) condition\.$' equcond
/def -aBCyellow -t'Damogran shouts \'One stranger told he had seen*' damoeku


;Channels
/def -P2Cred -aBCblue -i -t'^([A-Z][a-z]+ )?(.sales.): ' saleslite

/def -P3B -aCblue -mregexp -i -t'^([A-Z][a-z]+ )?(@hcbat )?(.suomi.): ' suomilite
/def -P1BCwhite -aCblue -mregexp -i -t'^[A-Z][a-z]+ (.sf.): ' sflite

/def -aBCblue -P2Ccyan -i -t'^([A-Z][a-z]+ )?(.kirahvi[+].): ' kirahvilite
/def -mregexp -P0BCred -aCred -i -t' .steel\+.: ' steelpluslite
/def -mregexp -P0Cblue -aB -i -t' .hockey.: ' hockeylite  
/def -mregexp -P0Cred -aB -i -t' .football.: ' footballlite  
/def -mregexp -aBCblue -i -t'^[A-Z][a-z]+ (.wanted.): ' wantedlite
/def -P0BCmagenta -aCmagenta -i -t' .bat.: ' batlite

/def -P0BCmagenta -aCmagenta -i -t' .alchemists.: ' alchemistslite
/def -P0BCmagenta -aCmagenta -i -t' .barbarian.: ' barblite
/def -P0BCmagenta -aCmagenta -i -t' .druids.: ' druidlite
/def -P0BCmagenta -aCmagenta -i -t' .lord_chaos.: ' lorclite
/def -P0BCmagenta -aCmagenta -i -t' .merchant.: ' merhclite
/def -P0BCmagenta -aCmagenta -i -t' .monk.: ' monklite
/def -P0BCmagenta -aCmagenta -i -t' .nun.: ' nunlite
/def -P0BCmagenta -aCmagenta -i -t' .priests.: ' priestlite
/def -P0BCmagenta -aCmagenta -i -t' .tarmalen.: ' tarmalite
/def -p999 -ag -mregexp -i -t'(.)kirahvi\+(.): ([A-Z][a-z]+ )?<sk>:?' kirahvisk = /echo -ahCred %PL%P3%P1sk%P2:%PR

;Tells
/def -mregexp -F -p2 -i -t'^[A-z]+ tells you ' tells_me 
/def -mglob -F -p2 -aCyellow -i -t'You tell *' you_tell
/def -mregexp -F -p2 -i -t'^[A-z]+ tells [A-Z|\,| ] and you' multi_tell
/def -mregexp -F -p2 -i -t'^[@]' emotetome 
 
;General info
/def -F -aBCmagenta -i -t'Info: *' inform
/def -F -aBCmagenta -i -t'Bank transfer from *' trans
/def -F -aCmagenta -i -t'You feel your luck changing.' luckchange
/def -F -aCmagenta -i -t'The fire burns out, spoiling anything in it.' fire_down
/def -F -aBCyellow -i -t'You feel like you just got slightly better in*' gotslightlybetter = @save
/def -F -aBCmagenta -i -t'\[Potion purchase\]: Bank transfer *' potionsold
/def -mregexp -aCgreen -t'^[A-Z][a-z]+ [A-z]+ the .+ \(horny\)$' burglehorn

;shapes
/def -P0BCgreen -F -i -t'is in excellent shape\.$' excshape 
/def -P0BCgreen -p1 -i -t'is in a good shape\.$' gsshape
/def -P0BCyellow -F -i -t'is slightly hurt\.$' shshape
/def -P0BCyellow -F -i -t'is noticeably hurt\.$' nhshape
/def -P0BCred -p100 -i -t'is not in a good shape\.$' nigsshape
/def -P0BCred -F -i -t'is in bad shape\.$' bsshape
/def -P0BCmagenta -F -i -t'is in very bad shape\.$' vbsshape
/def -P0BCmagenta -F -i -t'is near death\.$' ndshapei

;,Movement
/def -F -aCyellow -i -t'* leaves north.' leavesn
/def -F -aCyellow -i -t'* leaves south.' leavess
/def -F -aCyellow -i -t'* leaves west.' leavesw
/def -F -aCyellow -i -t'* leaves east.' leavese
/def -F -aCyellow -i -t'* leaves northeast.' leavesne
/def -F -aCyellow -i -t'* leaves northwest.' leavesnw
/def -F -aCyellow -i -t'* leaves southeast.' leavesse
/def -F -aCyellow -i -t'* leaves southwest.' leavessw

;;Item handling
/def -F -aCmagenta -i -t'* drops you *' drops_me = @save
/def -F -aCmagenta -i -t'You take *' i_take = @save
/def -aBCcyan -F -mregexp -i -t'^[A-z| |\-|\']+ is DEAD\, R\.I\.P\.' ripsraps = /autoloot
/def -i -p1 -mregexp -t'^ It contains ([0-9]+) anipium, ([0-9]+) batium, ([0-9]+) gold, ([0-9]+) mithril and ([0-9]+) platinum' purse_look = /eval /set purse_coins=$[%P1*50+%P2*100+%P3+%P4*500+%P5*10]%;/eval /echo Coins worth: $[purse_coins] gp.

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
/def -aBCred -F -mregexp -i -t'^Your ([A-z| ]+) gets damaged\; it\'s now in ([A-z| ]+) condition\.' equdamage = \
 party say My %P1 got damaged, and it is now in %P2 cond.
/def -aBCred -F -mglob -i -t'* is disturbed by spellcasting.' monsie_agroed_by_spell
/def -aBCred -F -mglob -i -t'* got mad at hostile actions *' monsie_agroed_by_skill
/def -aBCred -F -i -t'* loses its tangerine glow.' eq_prot_poof
/def -aBCred -F -i -t'You have a feeling that somebody is watching you.' all_seeing_eyed
/def -aBCred -F -i -t'You decide to change the skill to new one\.' skillchanged

/load -q critlite.tf

;;Spider
/def -F -aCred -i -t'Your feel infernal energies flowing to your body from your heart.' spidulite1
/def -F -aCred -i -t'You feel something alien crawling inside your mind seeking release.' spidulite2
/def -F -aCbggreen -aBCblack -i -t'A shower of black blood flies from Noitatohtori\'s palm at *' blackblood =\
 party say Wrath hit! (black)
/def -F -aCbggreen -aBCcyan -i -t'A shower of indigo blood flies from Noitatohtori\'s palm at *' indigoblood =\
 party say Wrath hit! (indigo)
/def -F -aCbggreen -aBCblue -i -t'A shower of blue blood flies from Noitatohtori\'s palm at *' blueblood =\
 party say Wrath hit! (blue)
/def -F -aCbggreen -aCyellow -i -t'A shower of brown blood flies from Noitatohtori\'s palm at *' brownblood =\
 party say Wrath hit! (brown)
/def -F -aCbggreen -aBCgreen -i -t'A shower of green blood flies from Noitatohtori\'s palm at *' greenblood =\
 party say Wrath hit! (green)
/def -F -aCbggreen -aCmagenta -i -t'A shower of violet blood flies from Noitatohtori\'s palm at *' violetblood =\
 party say Wrath hit! (violet)
/def -F -aCbggreen -aBCyellow -i -t'A shower of yellow blood flies from Noitatohtori\'s palm at *' yellowblood =\
 party say Wrath hit! (yellow)

;Combat (cyan)
/def -F -aCcyan -i -t'Your armours absorb some of the damage.' armor_absorbed
/def -F -aCcyan -i -t'Your marvellous sense of combat prevents your * from getting scratched.' csense_saved_from_eqdmg
/def -F -aCcyan -i -t'Struggling valiantly, you manage to absorb the attack with your armour.' csende_armoria_eteen

;;Other combat, skills and spells (yellow)
/def -F -aBCyellow -i -t'{*} starts concentrating on a new offensive spell.' offspell
/def -F -aBCyellow -i -t'* has summoned *' summonedme
/def -F -aBCyellow -i -t'When your eyes clear, * stands before you.' relocedtome
/def -F -aBCyellow -i -t'* DOUBLEs over in PAIN!' eatswither
/def -F -aBCyellow -i -t'*...WHO breaks the stun quickly off with intense concentration.*' breaksstun
/def -F -aCyellow -i -t'* performs a solemn ceremony to please Aveallis.' tarmacere
/def -F -aCyellow -i -t'* coughs up blood and howls soullessly to satisfy Draen-Dalar.' priestcere
/def -F -aCyellow -i -t'* bows to the four winds and prays to Lumine.' neutralcere
/def -F -aBCyellow -i -t'{*} starts concentrating on a new offensive skill.' offskill
/def -F -aCyellow -i -t'{*} aborts the spell casting.'
/def -F -aCyellow -i -t'{*} breaks the skill attempt.'
/def -F -aCyellow -i -t'* eyes widden in terror as * ruthlessly wounds *.' bfury1
/def -F -aCyellow -i -t'With great precision and speed * maliciously assults *.' bfury2
/def -F -aCyellow -i -t'*\'s ruthless onslaught of attacks causes * to stumble back and *' bfury3
     

;; Fire blasts
/def -F -aCbgred -aBCyellow -i -t'* grins as {its|his|her} lava blast hits *' other_fireblast1
/def -F -aCbgred -aBCyellow -i -t'* grins as {its|his|her} flame arrow hits *' other_fireblast2
/def -F -aCbgred -aBCyellow -i -t'* grins as {its|his|her} firebolt hits *' other_fireblast3
/def -F -aCbgred -aBCyellow -i -t'* grins as {its|his|her} fire blast hits *' other_fireblast4
/def -F -aCbgred -aBCyellow -i -t'* grins as {its|his|her} meteor swarm hits *' other_fireblast5
/def -F -aCbgred -aBCyellow -i -t'* grins as {its|his|her} meteor blast hits *' other_fireblast6
/def -F -aCbgred -aBCyellow -i -t'* grins as {its|his|her} lava storm hits *' other_fireblast7
/def -F -aCbgred -aBCyellow -i -t'You watch with selfpride as your lava blast hits *' own_fireblast1
/def -F -aCbgred -aBCyellow -i -t'You watch with selfpride as your flame arrow hits *' own_fireblast2
/def -F -aCbgred -aBCyellow -i -t'You watch with selfpride as your firebolt hits *' own_fireblast3
/def -F -aCbgred -aBCyellow -i -t'You watch with selfpride as your fire blast hits *' own_fireblast4
/def -F -aCbgred -aBCyellow -i -t'You watch with selfpride as your meteor swarm hits *' own_fireblast5
/def -F -aCbgred -aBCyellow -i -t'You watch with selfpride as your meteor blast hits *' own_fireblast6
/def -F -aCbgred -aBCyellow -i -t'You watch with selfpride as your lava storm hits *' own_fireblast7

;; Cold blasts
/def -F -aCbgblue -aBCcyan -i -t'* grins as {its|his|her} cold ray hits *' other_coldblast1
/def -F -aCbgblue -aBCcyan -i -t'* grins as {its|his|her} chill touch hits *' other_coldblast2
/def -F -aCbgblue -aBCcyan -i -t'* grins as {its|his|her} flaming ice hits *' other_coldblast3
/def -F -aCbgblue -aBCcyan -i -t'* grins as {its|his|her} darkfire hits *' other_coldblast4
/def -F -aCbgblue -aBCcyan -i -t'* grins as {its|his|her} cone of cold hits *' other_coldblast5
/def -F -aCbgblue -aBCcyan -i -t'* grins as {its|his|her} icebolt hits *' other_coldblast6
/def -F -aCbgblue -aBCcyan -i -t'* grins as {its|his|her} hail storm hits *' other_coldblast7
/def -F -aCbgblue -aBCcyan -i -t'You watch with selfpride as your cold ray hits *' own_coldblast1
/def -F -aCbgblue -aBCcyan -i -t'You watch with selfpride as your chill touch hits *' own_coldblast2
/def -F -aCbgblue -aBCcyan -i -t'You watch with selfpride as your flaming ice hits *' own_coldblast3
/def -F -aCbgblue -aBCcyan -i -t'You watch with selfpride as your darkfire hits *' own_coldblast4
/def -F -aCbgblue -aBCcyan -i -t'You watch with selfpride as your cone of cold hits *' own_coldblast5
/def -F -aCbgblue -aBCcyan -i -t'You watch with selfpride as your ice bolt hits *' own_coldblast6
/def -F -aCbgblue -aBCcyan -i -t'You watch with selfpride as your hail storm hits *' own_coldblast7

;; Poison blasts
/def -F -aCbggreen -aBCred -i -t'* grins as {its|his|her} thorn spray hits *' other_poisonblast1
/def -F -aCbggreen -aBCred -i -t'* grins as {its|his|her} poison blast hits *' other_poisonblast2
/def -F -aCbggreen -aBCred -i -t'* grins as {its|his|her} venom strike hits *' other_poisonblast3
/def -F -aCbggreen -aBCred -i -t'* grins as {its|his|her} poison spray hits *' other_poisonblast4
/def -F -aCbggreen -aBCred -i -t'* grins as {its|his|her} power blast hits *' other_poisonblast5
/def -F -aCbggreen -aBCred -i -t'* grins as {its|his|her} killing cloud hits *' other_poisonblast6
/def -F -aCbggreen -aBCred -i -t'You watch with selfpride as your thorn spray hits *' own_poisonblast1
/def -F -aCbggreen -aBCred -i -t'You watch with selfpride as your poison blast hits *' own_poisonblast2
/def -F -aCbggreen -aBCred -i -t'You watch with selfpride as your venom strike hits *' own_poisonblast3
/def -F -aCbggreen -aBCred -i -t'You watch with selfpride as your poison spray hits *' own_poisonblast4
/def -F -aCbggreen -aBCred -i -t'You watch with selfpride as your power blast hits *' own_poisonblast5
/def -F -aCbggreen -aBCred -i -t'You watch with selfpride as your killing cloud hits *' own_poisonblast6

;; Magical blasts
/def -F -aCbgyellow -aBCred -i -t'* grins as {its|his|her} golden arrow hits *' other_manablast1
/def -F -aCbgyellow -aBCred -i -t'* grins as {its|his|her} magic missile hits *' other_manablast2
/def -F -aCbgyellow -aBCred -i -t'* grins as {its|his|her} summon lesser spores hits *' other_manablast3
/def -F -aCbgyellow -aBCred -i -t'* grins as {its|his|her} levin bolt hits *' other_manablast4
/def -F -aCbgyellow -aBCred -i -t'* grins as {its|his|her} magic wave hits *' other_manablast5
/def -F -aCbgyellow -aBCred -i -t'* grins as {its|his|her} summon greater spores hits *' other_manablast6
/def -F -aCbgyellow -aBCred -i -t'* grins as {its|his|her} magic eruption hits *' other_manablast7
/def -F -aCbgyellow -aBCred -i -t'You watch with selfpride as your golden arrow hits *' own_manablast1
/def -F -aCbgyellow -aBCred -i -t'You watch with selfpride as your magic missile hits *' own_manablast2
/def -F -aCbgyellow -aBCred -i -t'You watch with selfpride as your summon lesser spores hits *' own_manablast3
/def -F -aCbgyellow -aBCred -i -t'You watch with selfpride as your levin bolt hits *' own_manablast4
/def -F -aCbgyellow -aBCred -i -t'You watch with selfpride as your magic wave hits *' own_manablast5
/def -F -aCbgyellow -aBCred -i -t'You watch with selfpride as your summon greater spores hits *' own_manablast6
/def -F -aCbgyellow -aBCred -i -t'You watch with selfpride as your magic eruption hits *' own_manablas7

;; Acid blasts
/def -F -aCbgyellow -aBCgreen -i -t'* grins as {its|his|her} dissruption hits *' other_acidblast1
/def -F -aCbgyellow -aBCgreen -i -t'* grins as {its|his|her} acid wind hits *' other_acidblast2
/def -F -aCbgyellow -aBCgreen -i -t'* grins as {its|his|her} acid arrow hits *' other_acidblast3
/def -F -aCbgyellow -aBCgreen -i -t'* grins as {its|his|her} acid rain hits *' other_acidblast4
/def -F -aCbgyellow -aBCgreen -i -t'* grins as {its|his|her} acid ray hits *' other_acidblast5
/def -F -aCbgyellow -aBCgreen -i -t'* grins as {its|his|her} acid storm hits *' other_acidblast6
/def -F -aCbgyellow -aBCgreen -i -t'* grins as {its|his|her} acid blast hits *' other_acidblast7
/def -F -aCbgyellow -aBCgreen -i -t'You watch with selfpride as your dissruption hits *' own_acidblast1
/def -F -aCbgyellow -aBCgreen -i -t'You watch with selfpride as your acid wind hits *' own_acidblast2
/def -F -aCbgyellow -aBCgreen -i -t'You watch with selfpride as your acid arrow hits *' own_acidblast3
/def -F -aCbgyellow -aBCgreen -i -t'You watch with selfpride as your acid rain hits *' own_acidblast4
/def -F -aCbgyellow -aBCgreen -i -t'You watch with selfpride as your acid ray hits *' own_acidblast5
/def -F -aCbgyellow -aBCgreen -i -t'You watch with selfpride as your acid storm hits *' own_acidblast6

;; Electric blasts
/def -F -aCbgblue -aBCyellow -i -t'* grins as {its|his|her} lightning blast hits *' other_elecblast1
/def -F -aCbgblue -aBCyellow -i -t'* grins as {its|his|her} shocking grasp  hits *' other_elecblast2
/def -F -aCbgblue -aBCyellow -i -t'* grins as {its|his|her} lightning bolt hits *' other_elecblast3
/def -F -aCbgblue -aBCyellow -i -t'* grins as {its|his|her} lightning blast hits *' other_elecblast4
/def -F -aCbgblue -aBCyellow -i -t'* grins as {its|his|her} chain lightning hits *' other_elecblast5
/def -F -aCbgblue -aBCyellow -i -t'* grins as {its|his|her} forked lightning hits *' other_elecblast6
/def -F -aCbgblue -aBCyellow -i -t'* grins as {its|his|her} electrocution hits *' other_elecblast7
/def -F -aCbgblue -aBCyellow -i -t'* grins as {its|his|her} lightning storm hits *' other_elecblast8
/def -F -aCbgblue -aBCyellow -i -t'You watch with selfpride as your lightning blast hits *'
/def -F -aCbgblue -aBCyellow -i -t'You watch with selfpride as your shocking grasp hits *'
/def -F -aCbgblue -aBCyellow -i -t'You watch with selfpride as your lightning bolt hits *'
/def -F -aCbgblue -aBCyellow -i -t'You watch with selfpride as your chain lightning hits *'
/def -F -aCbgblue -aBCyellow -i -t'You watch with selfpride as your forked lightning hits *'
/def -F -aCbgblue -aBCyellow -i -t'You watch with selfpride as your electrocution hits *'
/def -F -aCbgblue -aBCyellow -i -t'You watch with selfpride as your lightning storm hits *'

;; Asphx blasts
/def -F -aCbgmagenta -aBCblue -i -t'* grins as {its|his|her} vacuumbolt hits *'
/def -F -aCbgmagenta -aBCblue -i -t'* grins as {its|his|her} suffocation hits *'
/def -F -aCbgmagenta -aBCblue -i -t'* grins as {its|his|her} chaos bolt hits *'
/def -F -aCbgmagenta -aBCblue -i -t'* grins as {its|his|her} vacuum ball hits *'
/def -F -aCbgmagenta -aBCblue -i -t'* grins as {its|his|her} strangulation hits *'
/def -F -aCbgmagenta -aBCblue -i -t'* grins as {its|his|her} vacuum globe hits *'
/def -F -aCbgmagenta -aBCblue -i -t'* grins as {its|his|her} blast vacuum hits *'
/def -F -aCbgmagenta -aBCblue -i -t'You watch with selfpride as your vacuumbolt hits *'
/def -F -aCbgmagenta -aBCblue -i -t'You watch with selfpride as your suffocation hits *'
/def -F -aCbgmagenta -aBCblue -i -t'You watch with selfpride as your chaos bolt hits *'
/def -F -aCbgmagenta -aBCblue -i -t'You watch with selfpride as your vacuum ball hits *'
/def -F -aCbgmagenta -aBCblue -i -t'You watch with selfpride as your strangulation hits *'
/def -F -aCbgmagenta -aBCblue -i -t'You watch with selfpride as your vacuum globe hits *'
/def -F -aCbgmagenta -aBCblue -i -t'You watch with selfpride as your blast vacuum hits *'

;; Psi blasts
/def -F -aCbgcyan -aBCmagenta -i -t'* crushes * mind with a powerful psychic attack!'
/def -F -aCbgcyan -aBCmagenta -i -t'You crush * mind with your psychic attack!'
/def -F -aCbgcyan -aBCmagenta -i -t'* hits * with {its|his|her} psychic storm.'
/def -F -aCbgcyan -aBCmagenta -i -t'* grins as {his|her|its} mind disruption hits *'
/def -F -aCbgcyan -aBCmagenta -i -t'* grins as {his|her|its} psibolt hits *'
/def -F -aCbgcyan -aBCmagenta -i -t'* grins as {his|her|its} psi blast hits *'

;; Druid blasts
/def -F -aCbggreen -aBCgreen -i -t'* grins as {its|his|her} hoar frost hits *'
/def -F -aCbggreen -aBCgreen -i -t'* grins as {its|his|her} star light hits *'
/def -F -aCbggreen -aBCgreen -i -t'* grins as {its|his|her} wither flesh hits *'
/def -F -aCbggreen -aBCgreen -i -t'You watch with selfpride as your wither flesh hits *'

;; Nun blasts (old)
/def -F -aCbgblue -aBCwhite -i -t'* grins as {its|his|her} dispel evil hits *'
/def -F -aCbgblue -aBCwhite -i -t'* grins as {its|his|her} banish demons hits *'
/def -F -aCbgblue -aBCwhite -i -t'* grins as {its|his|her} holy hand hits *'
/def -F -aCbgblue -aBCwhite -i -t'* grins as {its|his|her} holy cross hits *'
/def -F -aCbgblue -aBCwhite -i -t'* grins as {its|his|her} turn undead hits *'
/def -F -aCbgblue -aBCwhite -i -t'You watch with selfpride as your dispel evil hits *'
/def -F -aCbgblue -aBCwhite -i -t'You watch with selfpride as your banish demons hits *'
/def -F -aCbgblue -aBCwhite -i -t'You watch with selfpride as your holy hand hits *'
/def -F -aCbgblue -aBCwhite -i -t'You watch with selfpride as your holy cross hits *'
/def -F -aCbgblue -aBCwhite -i -t'You watch with selfpride as your turn undead hits *'

;; Priest blasts
/def -F -aCbgwhite -aBCred -i -t'* casts a harming spell on *'
/def -F -aCbgwhite -aBCred -i -t'You cast harming spell on *'

;;Heals
/def -F -aB -aCbggreen -p3 -i -t'You heal * of * wounds.'
