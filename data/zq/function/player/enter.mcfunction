# 进入本局（开局 / 中途加入）
tag @s add zq_ingame
tag @s remove zq_out
tag @s remove zq_carry
scoreboard players operation @s zq_gid = #gid zq_var
execute unless score @s zq_id matches 1.. run function zq:player/new_id
scoreboard players set @s zq_dc 0
scoreboard players reset @s zq_death
scoreboard players set @s zq_kill 0
scoreboard players reset @s zq_foot
clear @s
effect clear @s
execute unless score @s zq_cls matches 1..4 run scoreboard players set @s zq_cls 1
execute if entity @s[team=red] run function zq:kit/give with storage zq:t red
execute if entity @s[team=blue] run function zq:kit/give with storage zq:t blue
function zq:kit/steak {n:8}
function zq:player/spawn
tellraw @s {text:"想换职业：回自家基地，右键旗帜后面的箱子，取出免费职业图标。",color:"yellow"}
execute if score #o_shop zq_var matches 1 run tellraw @s {text:"购买道具和团队升级也在同一个箱子里，金币全队共享。",color:"yellow"}
