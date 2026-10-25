# 搬岛时等待分片完成，避免旧位置复原出重复岛屿
# 更新加载区块期间继续使用旧模板，迁移成功清理后切换到主世界预览岛
execute unless score #pbusy zq_var matches 1 if block -46 -57 -4 crimson_planks at @e[type=marker,tag=zq_spawn_red,limit=1] run clone -46 -60 -4 -30 -57 4 ~-11 ~-4 ~-4 filtered #zq:island force
execute unless score #pbusy zq_var matches 1 unless block -46 -57 -4 crimson_planks at @e[type=marker,tag=zq_spawn_red,limit=1] run clone from minecraft:overworld -46 137 -4 -30 140 4 to zq:arena ~-11 ~-4 ~-4 filtered #zq:island force
execute unless score #pbusy zq_var matches 1 if block 29 -57 -4 warped_planks at @e[type=marker,tag=zq_spawn_blue,limit=1] run clone 29 -60 -4 45 -57 4 ~-5 ~-4 ~-4 filtered #zq:island force
execute unless score #pbusy zq_var matches 1 unless block 29 -57 -4 warped_planks at @e[type=marker,tag=zq_spawn_blue,limit=1] run clone from minecraft:overworld 29 137 -4 45 140 4 to zq:arena ~-5 ~-4 ~-4 filtered #zq:island force
# 每 tick：基地 3×3 地板复原、上方清空；旗台金块复原
execute at @e[type=marker,tag=zq_spawn_red,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 red_glazed_terracotta
execute at @e[type=marker,tag=zq_spawn_red,limit=1] run fill ~-1 ~ ~-1 ~1 ~2 ~1 air
execute at @e[type=marker,tag=zq_spawn_blue,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 blue_glazed_terracotta
execute at @e[type=marker,tag=zq_spawn_blue,limit=1] run fill ~-1 ~ ~-1 ~1 ~2 ~1 air
execute at @e[type=marker,tag=zq_flag_red,limit=1] unless block ~ ~-1 ~ gold_block run setblock ~ ~-1 ~ gold_block
execute at @e[type=marker,tag=zq_flag_blue,limit=1] unless block ~ ~-1 ~ gold_block run setblock ~ ~-1 ~ gold_block
execute if score #red_flag zq_var matches 0 at @e[type=marker,tag=zq_flag_red,limit=1] unless block ~ ~ ~ red_banner run setblock ~ ~ ~ red_banner
execute if score #blue_flag zq_var matches 0 at @e[type=marker,tag=zq_flag_blue,limit=1] unless block ~ ~ ~ blue_banner run setblock ~ ~ ~ blue_banner
