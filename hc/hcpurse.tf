/def -i -mregexp \
 -t'^[ ]?It contains ([0-9]+) anipium, ([0-9]+) batium, ([0-9]+) gold, ([0-9]+) mithril and ([0-9]+) platinum' purse_look =\
 /eval /set purse_coins=$[%P1*50+%P2*100+%P3+%P4*500+%P5*10]%;/eval /echo $[%P1+%P2+%P3+%P4+%P5] coins worth: $[purse_coins] gp.
