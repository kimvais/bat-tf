/def -i -t'Recovering character.' recovering_character = /login 
/def -i -t'Moving to starting location.' enter_game = /login
/def login = wear all;;keep all;;battle listen all 3%;/def -i -p1 -mglob -h'DISCONNECT ' hang_up = /repeat -30 1 /world
