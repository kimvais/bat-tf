/def otainfo = /set guild=%1%;/for i 1 %2 %1 info %%i
/def -mregexp -t'^\| Spells available at level ([0-9]+) ?  \| Cur \| Rac \| Max \| Exp      \|$' spellinfo = \
  /set infolvl=%P1%;/set infotype=spell%;/eval /echo %{infotype} info: %{infolvl}
/def -mregexp -t'^\| Skills available at level ([0-9]+) ?  \| Cur \| Rac \| Max \| Exp      \|$' skillinfo = \
  /set infolvl=%P1%;/set infotype=skill%;/eval /echo %{infotype} info: %{infolvl}
/def -mregexp -t'^\| ([A-Z][a-z \-]*[^ ]) +\| +([0-9]+) \| +([0-9]+) \| +([0-9]+) \| +(.*) \|' guildinforow = \
  /set infoname=%{P1}%;/set infopercent=%{P4}%;/eval /set sqlcommand=INSERT INTO guild_info VALUES ("%{guild}",%{infolvl},"%{infotype}","%{infoname}",%{infopercent});%;/test $[fwrite("/home/kinki/bat/kiltainfo.sql",%{sqlcommand})]
