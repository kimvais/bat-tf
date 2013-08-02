/def -i percolor = \
  /set tmpvar=$[({1}*100)/{2}]%;\
  /if (tmpvar>99)/echo BCwhite%; \
  /elseif (tmpvar>84)/echo BCcyan%; \
  /elseif (tmpvar>68)/echo BCgreen%; \
  /elseif (tmpvar>51)/echo BCyellow%; \
  /elseif (tmpvar>34)/echo BCred%; \
  /elseif (tmpvar>17)/echo BCmagenta%; \
  /else /echo Cbgred%;/endif

/def -i -p1 -ag -mregexp -t'([0-9]+)\\((.+)\\) (.+)\\((.+)\\) (.+)\\((.+)\\) \\| \
(.+) \\| (.+) \\|$' partylite = \
  /eval  /echo -p %PL@{$(/percolor %{P1} %{P2})}\
%{P1}@{n}(@{Cwhite}%{P2}@{n}) @{$(/percolor %{P3} %{P4})}\
%{P3}@{n}(@{Cwhite}%{P4}@{n}) @{$(/percolor %{P5} %{P6})}\
%{P5}@{n}(@{Cwhite} %{P6}@{n})|@{$(/percolor %{P7} 100)} \
%{P7}@{n} | %P8 |
