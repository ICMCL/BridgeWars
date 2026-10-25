# ===== 在 zq:arena 维度生成/重置战场 =====
# 红岛 x -46..-30，蓝岛 x 29..45，z -4..4，中线 x=0，岛面 y=100，桥 z=0（1 格宽）
fill -80 40 -48 79 170 47 air
kill @e[type=!player,distance=0..]
setblock 0 20 0 chest
# 红岛
fill -46 100 -4 -30 100 4 smooth_stone
fill -46 100 -4 -30 100 -4 crimson_planks
fill -46 100 4 -30 100 4 crimson_planks
fill -46 100 -4 -46 100 4 crimson_planks
fill -30 100 -4 -30 100 4 crimson_planks
fill -45 99 -3 -31 99 3 stone
fill -44 98 -2 -32 98 2 andesite
fill -43 97 -1 -33 97 1 andesite
fill -36 100 -1 -34 100 1 red_glazed_terracotta
setblock -43 100 0 gold_block
setblock -43 101 0 red_banner
summon marker -42.5 101 0.5 {Tags:["zq_flag_red","zq_m"]}
summon marker -34.5 101 0.5 {Tags:["zq_spawn_red","zq_m"],Rotation:[-90f,0f]}
function zq:map/npc {x:-44.5,r:"-90",t:"red"}
# 蓝岛
fill 29 100 -4 45 100 4 smooth_stone
fill 29 100 -4 45 100 -4 warped_planks
fill 29 100 4 45 100 4 warped_planks
fill 29 100 -4 29 100 4 warped_planks
fill 45 100 -4 45 100 4 warped_planks
fill 30 99 -3 44 99 3 stone
fill 31 98 -2 43 98 2 andesite
fill 32 97 -1 42 97 1 andesite
fill 33 100 -1 35 100 1 blue_glazed_terracotta
setblock 42 100 0 gold_block
setblock 42 101 0 blue_banner
summon marker 42.5 101 0.5 {Tags:["zq_flag_blue","zq_m"]}
summon marker 34.5 101 0.5 {Tags:["zq_spawn_blue","zq_m"],Rotation:[90f,0f]}
function zq:map/npc {x:44.5,r:"90",t:"blue"}
# 只保存原生岛体，保护恢复不会覆盖玩家搭建的方块或带回已拿走的旗帜
function zq:map/templates {y0:97,y1:100}
