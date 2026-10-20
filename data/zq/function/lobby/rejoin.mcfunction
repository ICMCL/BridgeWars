scoreboard players reset @s zq_left
execute if entity @s[tag=zq_carry] run function zq:flag/untag
execute if score #running zq_var matches 1 if entity @s[tag=zq_ingame] if score @s zq_gid = #gid zq_var run return 0
# 旁观者重连：继续观战
execute if score #running zq_var matches 1 unless entity @s[team=!] run return run function zq:player/watch
function zq:lobby/send
