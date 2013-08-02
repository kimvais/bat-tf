/def damagereport=@@party say %*

/def -p1 -aBCred -mregexp \
  -t'^([A-z \\,\\-]+) shrugs off the attack\\.$' shrugsoff = \
  /set target=%P1%;\
  /damagereport %{target} shrugs %{blast_damage_type} (100\% resist)

/def -p1 -aBCred -mregexp \
  -t'^([A-z \\,\\-]+) winces a little from the pain\\.$' wincespain = \
  /set target=%P1%;\
  /damagereport %{target} winces %{blast_damage_type} (80\% resist)

/def -p1 -aCmagenta -mregexp \
  -t'^([A-z \\,\\-]+) grunts from the pain\\.$' gruntspain = \
  /set target=%P1%;\
  /damagereport %{target} grunts %{blast_damage_type} (60\% resist)

/def -p1 -aCmagenta -mregexp \
  -t'^([A-z \\,\\-]+) shudders from the force of the attack\\.' shruddersattack = \
  /set target=%P1%;\
  /damagereport %{target} shudders %{blast_damage_type} (40\% resist)

/def -p1 -aCmagenta -mregexp \
  -t'^([A-z \\,\\-]+) writhes in agony\\.$' writhesspain = \
  /set target=%P1%;\
  /damagereport %{target} writhes %{blast_damage_type} (20\% resist)

/def -p1 -aCmagenta -mregexp \
 -t'^([A-z \\,\\-]+) screams in pain\\.$' screamspain = \
  /set target=%P1%;\
  /damagereport %{target} screams %{blast_damage_type} (0\% resist)

