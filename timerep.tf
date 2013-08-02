/def -i kello = /eval /echo $[ftime("%H:%M:%S",time())]%;\
  /if (daynumber != (ftime("%d",time()))) /logmove%;/set_day%;/endif
/def -i timerep = /if (world_info()=~"_") /kello%;/endif%;/repeat -0:03 1 /timerep
/timerep
