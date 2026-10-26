# 搬岛时等待分片完成，避免旧位置复原出重复岛屿
execute unless score #pbusy zq_var matches 1 at @e[type=marker,tag=zq_spawn_red,limit=1] run clone from minecraft:overworld -46 137 -4 -30 140 4 to zq:arena ~-11 ~-4 ~-4 filtered #zq:island force
execute unless score #pbusy zq_var matches 1 at @e[type=marker,tag=zq_spawn_blue,limit=1] run clone from minecraft:overworld 29 137 -4 45 140 4 to zq:arena ~-5 ~-4 ~-4 filtered #zq:island force
# 每 tick：基地 3×3 地板复原、上方清空；旗台金块复原
execute at @e[type=marker,tag=zq_spawn_red,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 red_glazed_terracotta
execute at @e[type=marker,tag=zq_spawn_red,limit=1] run fill ~-1 ~ ~-1 ~1 ~2 ~1 air
execute at @e[type=marker,tag=zq_spawn_blue,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 blue_glazed_terracotta
execute at @e[type=marker,tag=zq_spawn_blue,limit=1] run fill ~-1 ~ ~-1 ~1 ~2 ~1 air
execute at @e[type=marker,tag=zq_flag_red,limit=1] unless block ~ ~-1 ~ gold_block run setblock ~ ~-1 ~ gold_block
execute at @e[type=marker,tag=zq_flag_blue,limit=1] unless block ~ ~-1 ~ gold_block run setblock ~ ~-1 ~ gold_block
execute if score #red_flag zq_var matches 0 at @e[type=marker,tag=zq_flag_red,limit=1] unless block ~ ~ ~ red_banner run setblock ~ ~ ~ red_banner
execute if score #blue_flag zq_var matches 0 at @e[type=marker,tag=zq_flag_blue,limit=1] unless block ~ ~ ~ blue_banner run setblock ~ ~ ~ blue_banner
