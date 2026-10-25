# 只更新两岛之间的桥和毒墙粒子，不改兼作保护模板的岛体
execute in minecraft:overworld run fill -29 140 0 28 140 0 air
execute if score #o_bridge zq_var matches 2 in minecraft:overworld run fill -29 140 0 28 140 0 stone_bricks
execute if score #o_poison zq_var matches 1 in minecraft:overworld run function zq:lobby/preview_poison
