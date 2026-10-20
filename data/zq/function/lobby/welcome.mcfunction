tag @s add zq_seen
execute if entity @s[tag=zq_ingame] run return 0
team leave @s
function zq:lobby/send
tellraw @s {text:"欢迎来到战桥！默认身份是旁观者，站上红/蓝区域选队。",color:"yellow"}
