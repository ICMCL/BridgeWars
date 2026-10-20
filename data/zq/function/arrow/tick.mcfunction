particle minecraft:witch ~ ~ ~ 0 0 0 0 1 force
# 直接读速度向量，比逐 tick 差分位置省 3 个计分板
execute store result score #dx zq_var run data get entity @s Motion[0] 1000
execute store result score #dy zq_var run data get entity @s Motion[1] 1000
execute store result score #dz zq_var run data get entity @s Motion[2] 1000
# 入地那一 tick 速度归零，所以只在还在飞时才记录方向
scoreboard players set #mv zq_var 0
execute unless score #dx zq_var matches 0 run scoreboard players set #mv zq_var 1
execute unless score #dy zq_var matches 0 run scoreboard players set #mv zq_var 1
execute unless score #dz zq_var matches 0 run scoreboard players set #mv zq_var 1
execute if score #mv zq_var matches 1 run scoreboard players operation @s zq_dx = #dx zq_var
execute if score #mv zq_var matches 1 run scoreboard players operation @s zq_dy = #dy zq_var
execute if score #mv zq_var matches 1 run scoreboard players operation @s zq_dz = #dz zq_var
execute if score #mv zq_var matches 1 run scoreboard players set @s zq_still 0
execute if score #mv zq_var matches 0 run scoreboard players add @s zq_still 1
execute if data entity @s {in_ground:1b} run return run function zq:arrow/hit
execute if data entity @s {inGround:1b} run return run function zq:arrow/hit
execute if score @s zq_still matches 3.. run function zq:arrow/hit
