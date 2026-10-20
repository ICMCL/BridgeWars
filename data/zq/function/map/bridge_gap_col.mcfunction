# 每 5 格：铺 2 格、空 3 格（需要搭或跳）
scoreboard players operation #m zq_var = #i zq_var
scoreboard players operation #m zq_var %= #5 zq_const
execute if score #m zq_var matches 0..1 if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ stone_bricks
scoreboard players add #i zq_var 1
execute if score #i zq_var < #n zq_var positioned ~1 ~ ~ run function zq:map/bridge_gap_col
