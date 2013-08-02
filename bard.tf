;; Skillit & spellit
/def -i -h'SEND {nd} *' command_nd = cast 'noituloves dischord' %-1
/def -i -h'SEND {nd}' command_nd_notarget = cast 'noituloves dischord'
/def -aBCcyan -t'You memorize the tunes for *' memorize_tunes
/def cmd_f1=cast noituloves dischord
/def cmd_f2=use slash
/def -i -h'SEND {war}' command_war = cast war ensemble
/def -i -h'SEND {cf} *' command_cf = cast con fioco at %-1
/def -i -h'SEND {cf}' command_cf_notarget = cast con fioco
/def -i -h'SEND {emm}' command_emm = cast melodical embracement


;;Protit
/def -t'You embrace yourself with your melody.' own_emm_up = /protup embracing_melody EmM

;; Firebuilding
/def -i -h'SEND {fire}' cmd_fire = use fire building
/def -i -t'You fail to start the fire.' fail2startfire = fire

;; Lauluvihkot
/def -i -h'SEND {re}' cmd_re = /eval keep notebook %{howmanynotebooks};;drop notebook %{howmanynotebooks} to thiamin;;read notebook;;keep notebook
/def -i -t'You have one notebook.' 1notebook = /set howmanynotebooks=1  
/def -i -t'You have two notebooks.' twonotebooks = /set howmanynotebooks=2
/def -i -t'You have three notebooks.' threenotebooks = /set howmanynotebooks=3
/def -i -t'You have four notebooks.' fournotebooks = /set howmanynotebooks=4
/def -i -t'You have five notebooks.' fivenotebooks = /set howmanynotebooks=5
/def -i -t'You have six notebooks.' sixnotebooks = /set howmanynotebooks=6
/def -i -t'You have seven notebooks.' sevennotebooks = /set howmanynotebooks=7
/def -i -t'You have eight notebooks.' eightnotebooks = /set howmanynotebooks=8
/def -i -t'You have nine notebooks.' ninenotebooks = /set howmanynotebooks=9
/def -i -t'You have ten notebooks.' tennotebooks = /set howmanynotebooks=10
/def -i -t'You have eleven notebooks.' elevennotebooks = /set howmanynotebooks=11
/def -i -t'You have twelve notebooks.' twelvenotebooks = /set howmanynotebooks=12
/def -i -t'You have thirteen notebooks.' thirteennotebooks = /set howmanynotebooks=13
/def -i -t'You have fourteen notebooks.' fourteennotebooks = /set howmanynotebooks=14
/def -i -t'You have fifteen notebooks.' fifteennotebooks = /set howmanynotebooks=15
/def -i -t'You have sixteen notebooks.' sixteennotebooks = /set howmanynotebooks=16
/def -i -t'You have seventeen notebooks.' seventeennotebooks = /set howmanynotebooks=17
/def -i -t'You have eighteen notebooks.' eighteennotebooks = /set howmanynotebooks=18
/def -i -t'You have nineteen notebooks.' nineteennotebooks = /set howmanynotebooks=19
/def -i -t'You have twenty notebooks.' twentynotebooks = /set howmanynotebooks=20
