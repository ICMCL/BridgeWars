# 只更新两岛之间的桥和毒墙粒子，不改兼作保护模板的岛体
execute in minecraft:overworld run fill -29 140 0 28 140 0 air
execute in minecraft:overworld run fill -29 135 0 28 139 0 air replace gray_concrete
execute if score #o_bridge zq_var matches 2 in minecraft:overworld run fill -29 140 0 28 140 0 stone_bricks
execute if score #o_bridge zq_var matches 3 in minecraft:overworld positioned 0 140 0 run function zq:map/bridge_thick_m {x1:-29,x2:28}
execute if score #o_poison zq_var matches 1 in minecraft:overworld run function zq:lobby/preview_poison
