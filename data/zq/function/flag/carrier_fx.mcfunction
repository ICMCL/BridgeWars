effect clear @s speed
effect clear @s jump_boost
effect clear @s strength
effect give @s slowness infinite 1 true
effect give @s glowing infinite 0 true
effect give @s mining_fatigue infinite 1 true
# 保留防御升级
execute if entity @s[team=red] if score #red zq_up_res matches 1 run effect give @s resistance infinite 0 true
execute if entity @s[team=red] if score #red zq_up_res matches 2 run effect give @s resistance infinite 1 true
execute if entity @s[team=blue] if score #blue zq_up_res matches 1 run effect give @s resistance infinite 0 true
execute if entity @s[team=blue] if score #blue zq_up_res matches 2 run effect give @s resistance infinite 1 true
# 每 2 秒补 1 个方块（最多 24）
execute if score #sec zq_var matches 0.. run scoreboard players operation #m zq_var = #sec zq_var
scoreboard players operation #m zq_var %= #2 zq_const
execute if score #m zq_var matches 0 if entity @s[team=red] run function zq:flag/carrier_refill with storage zq:t red
execute if score #m zq_var matches 0 if entity @s[team=blue] run function zq:flag/carrier_refill with storage zq:t blue
