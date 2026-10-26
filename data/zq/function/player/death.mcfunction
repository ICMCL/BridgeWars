scoreboard players reset @s zq_death
scoreboard players reset @s zq_foot
execute unless entity @s[tag=zq_ingame] run return 0
execute if entity @s[tag=zq_carry] run function zq:flag/drop
execute if score #o_shop zq_var matches 2 run function zq:player/drop_shop
scoreboard players add @s zq_dc 1
execute if score #sudden zq_var matches 1 run return run function zq:player/out
# 复活时间（秒）
execute if score #o_resp zq_var matches 1 run scoreboard players operation #s zq_var = @s zq_dc
execute if score #o_resp zq_var matches 1 run scoreboard players remove #s zq_var 1
execute if score #o_resp zq_var matches 1 if score #s zq_var matches 11.. run scoreboard players set #s zq_var 10
execute if score #o_resp zq_var matches 0 run scoreboard players set #s zq_var 5
execute if entity @s[team=red] run scoreboard players operation #s zq_var -= #red zq_up_rsp
execute if entity @s[team=blue] run scoreboard players operation #s zq_var -= #blue zq_up_rsp
execute if score #s zq_var matches ..0 run return run function zq:player/spawn
scoreboard players operation @s zq_resp = #s zq_var
scoreboard players operation @s zq_resp *= #20 zq_const
gamemode spectator @s
execute if entity @s[team=red] at @e[type=marker,tag=zq_spawn_red,limit=1] run tp @s ~ ~12 ~ -90 50
execute if entity @s[team=blue] at @e[type=marker,tag=zq_spawn_blue,limit=1] run tp @s ~ ~12 ~ 90 50
