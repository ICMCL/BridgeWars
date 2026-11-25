# masked 只比较受保护的非空气方块；玩家搭桥不触发修复。搬岛期间不在旧位置复原。
execute unless score #islands_cached zq_var matches 1 run function zq:map/cache_islands
execute if score #islands_cached zq_var matches 1 unless score #pbusy zq_var matches 1 at @e[type=marker,tag=zq_spawn_red,limit=1] unless blocks -46 -64 -4 -30 -61 4 ~-11 ~-4 ~-4 masked run clone -46 -64 -4 -30 -61 4 ~-11 ~-4 ~-4 masked force
execute if score #islands_cached zq_var matches 1 unless score #pbusy zq_var matches 1 at @e[type=marker,tag=zq_spawn_blue,limit=1] unless blocks 29 -64 -4 45 -61 4 ~-5 ~-4 ~-4 masked run clone 29 -64 -4 45 -61 4 ~-5 ~-4 ~-4 masked force
# 每 tick：基地 3×3 地板复原、上方清空；旗台金块复原
execute at @e[type=marker,tag=zq_spawn_red,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 red_glazed_terracotta
execute at @e[type=marker,tag=zq_spawn_red,limit=1] run fill ~-1 ~ ~-1 ~1 ~2 ~1 air
execute at @e[type=marker,tag=zq_spawn_blue,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 blue_glazed_terracotta
execute at @e[type=marker,tag=zq_spawn_blue,limit=1] run fill ~-1 ~ ~-1 ~1 ~2 ~1 air
execute at @e[type=marker,tag=zq_flag_red,limit=1] unless block ~ ~-1 ~ gold_block run setblock ~ ~-1 ~ gold_block
execute at @e[type=marker,tag=zq_flag_blue,limit=1] unless block ~ ~-1 ~ gold_block run setblock ~ ~-1 ~ gold_block
execute if score #red_flag zq_var matches 0 at @e[type=marker,tag=zq_flag_red,limit=1] unless block ~ ~ ~ red_banner run setblock ~ ~ ~ red_banner
execute if score #blue_flag zq_var matches 0 at @e[type=marker,tag=zq_flag_blue,limit=1] unless block ~ ~ ~ blue_banner run setblock ~ ~ ~ blue_banner
