/def -i unlock = /for i 1 6 turn %%i to 7 4 0
/def -i unchest = drop noeq%;/for i 1 6 open %%i;;ga from %%i;;save;;keep all;;ga;;drop all chest%;/wear
/def -i chest = remove all%;wear claw belt%;keep eq%;/for i 1 6 put noeq in %%i;;close %%i;;ga;;drop all chest
/def -i wear = /swaptoregen%;wear all

;lightning belt of zeus,uranium boots,purse,ebony bracers,leather belt
