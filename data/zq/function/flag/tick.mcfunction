# 旗已归位但还有人带着扛旗标记（掉线回来等）→ 清掉并还原物品
execute if score #red_flag zq_var matches 0 as @a[team=blue,tag=zq_carry] run function zq:flag/untag
execute if score #blue_flag zq_var matches 0 as @a[team=red,tag=zq_carry] run function zq:flag/untag
# 旗手掉线 → 旗帜归位
execute if score #red_flag zq_var matches 1 unless entity @a[team=blue,tag=zq_carry] run function zq:flag/reset {f:"red"}
execute if score #blue_flag zq_var matches 1 unless entity @a[team=red,tag=zq_carry] run function zq:flag/reset {f:"blue"}
# 拿旗只认实际挖掉敌旗的玩家；旗帜可能已被保护逻辑复原，不能只检测空气
execute if score #red_flag zq_var matches 0 at @e[type=marker,tag=zq_flag_red,limit=1] as @a[team=blue,tag=zq_ingame,tag=!zq_carry,gamemode=adventure,scores={zq_mred=1..},distance=..6] at @s run function zq:flag/take {f:"red",t:"blue"}
execute if score #blue_flag zq_var matches 0 at @e[type=marker,tag=zq_flag_blue,limit=1] as @a[team=red,tag=zq_ingame,tag=!zq_carry,gamemode=adventure,scores={zq_mblue=1..},distance=..6] at @s run function zq:flag/take {f:"blue",t:"red"}
scoreboard players reset @a zq_mred
scoreboard players reset @a zq_mblue
# 带回：默认必须站上自家旗台金块；若交旗位置设为「出生点」，站上自家 3×3 出生点釉陶（或旗台金块）即可
execute as @a[tag=zq_carry,team=blue,gamemode=adventure] at @s if block ~ ~-1 ~ gold_block if entity @e[type=marker,tag=zq_flag_blue,distance=..1.5] run function zq:flag/try_cap {f:"red",t:"blue"}
execute as @a[tag=zq_carry,team=red,gamemode=adventure] at @s if block ~ ~-1 ~ gold_block if entity @e[type=marker,tag=zq_flag_red,distance=..1.5] run function zq:flag/try_cap {f:"blue",t:"red"}
execute if score #o_cap zq_var matches 1 as @a[tag=zq_carry,team=blue,gamemode=adventure] at @s if block ~ ~-1 ~ blue_glazed_terracotta if entity @e[type=marker,tag=zq_spawn_blue,distance=..2.5] run function zq:flag/try_cap {f:"red",t:"blue"}
execute if score #o_cap zq_var matches 1 as @a[tag=zq_carry,team=red,gamemode=adventure] at @s if block ~ ~-1 ~ red_glazed_terracotta if entity @e[type=marker,tag=zq_spawn_red,distance=..2.5] run function zq:flag/try_cap {f:"blue",t:"red"}
execute as @a[tag=zq_carry] at @s run particle minecraft:dust{color:[1.0,0.85,0.0],scale:2.0} ~ ~2.6 ~ 0.25 0.25 0.25 0 4 force
