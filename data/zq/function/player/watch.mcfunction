# 没选队 → 旁观
clear @s
effect clear @s
gamemode spectator @s
execute in zq:arena run tp @s -0.5 125 0.5 90 50
tellraw @s {text:"你是旁观者，本局观战。",color:"gray"}
