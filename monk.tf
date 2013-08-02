/eval /load -q %{TRIGDIR}ma.tf
;;/load -q clw.tf

;;Monk                                                                                                       
/def autoloot=gac;;get corpse;;eat corpse

/def -t'You fail to reach the state of inner harmony.' medifail = use meditation

;;Commands
/def -i -h'SEND {ip} *' cmd_ip = use 'iron palm' %-1  
/def cmd_f1=use iron palm
/def cmd_f5=clw nt
/def cmd_f6=ccw nt
/def cmd_f7=mh nt
