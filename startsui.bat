set xdir=%~dp0
komorebic.exe stop
komorebic.exe start -c "%xdir%komorebi/komorebi.json"
komorebic.exe mouse-follows-focus disable
komorebic.exe resize-delta 200
start cmd /c kanata.exe -c "%xdir%kanata.kbd" -p 10000
komokana.exe -p 10000 -d default -c "%xdir%komorebi/komokana.yaml"
