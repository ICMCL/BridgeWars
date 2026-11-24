execute unless score #lobby_synced zq_var matches 1 in minecraft:overworld if loaded 0 150 0 run function zq:internal/world_boot

scoreboard players add #gt zq_var 1
scoreboard players operation #g20 zq_var = #gt zq_var
scoreboard players operation #g20 zq_var %= #20 zq_const

# 重新上线 / 新玩家
execute as @a[scores={zq_left=1..}] run function zq:lobby/rejoin
execute as @a[tag=!zq_seen] run function zq:lobby/welcome

# 触发器（对话框按钮）
scoreboard players enable @a[tag=!zq_ingame] zq_cfg
scoreboard players enable @a[tag=!zq_ingame] zq_set
scoreboard players enable @a[tag=!zq_ingame] zq_time
execute as @a[scores={zq_cfg=1..}] run function zq:cfg/open
execute as @a[scores={zq_set=1..}] run function zq:cfg/apply_rules
execute as @a[scores={zq_time=1..}] run function zq:cfg/apply_times

# 右键道具
execute as @a[scores={zq_use=1..}] at @s run function zq:skill/use

# 禁止丢弃：丢出的物品还给丢的人，2 秒没捡回就删除
execute in zq:arena as @a at @s run function zq:shop/container_tick
execute in zq:arena run kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{zq_shop:1}}}}]
execute in minecraft:overworld run kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{zq_shop:1}}}}]
execute as @e[type=item] run function zq:util/item

execute in minecraft:overworld run function zq:lobby/tick
execute if score #running zq_var matches 1 in zq:arena run function zq:game/tick
execute if score #endt zq_var matches 1.. run function zq:game/end_tick
