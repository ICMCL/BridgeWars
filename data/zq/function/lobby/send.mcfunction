# 把 @s 送回大厅
tag @s remove zq_ingame
tag @s remove zq_carry
tag @s remove zq_out
scoreboard players reset @s zq_resp
scoreboard players reset @s zq_foot
scoreboard players reset @s zq_death
gamemode adventure @s
effect clear @s
clear @s
execute in minecraft:overworld run tp @s -0.5 151 0.5 180 0
execute in minecraft:overworld run spawnpoint @s -1 151 0
