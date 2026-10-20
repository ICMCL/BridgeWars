# 团队升级效果（每秒补一次）；扛旗者不享受升级，改为明显的减益
execute if entity @s[tag=zq_carry] run return run function zq:flag/carrier_fx
execute if entity @s[team=red] run scoreboard players operation #us zq_var = #red zq_up_str
execute if entity @s[team=red] run scoreboard players operation #ur zq_var = #red zq_up_res
execute if entity @s[team=red] run scoreboard players operation #uv zq_var = #red zq_up_spd
execute if entity @s[team=red] run scoreboard players operation #uj zq_var = #red zq_up_jmp
execute if entity @s[team=blue] run scoreboard players operation #us zq_var = #blue zq_up_str
execute if entity @s[team=blue] run scoreboard players operation #ur zq_var = #blue zq_up_res
execute if entity @s[team=blue] run scoreboard players operation #uv zq_var = #blue zq_up_spd
execute if entity @s[team=blue] run scoreboard players operation #uj zq_var = #blue zq_up_jmp
execute if score #us zq_var matches 1 run effect give @s strength infinite 0 true
execute if score #us zq_var matches 2 run effect give @s strength infinite 1 true
execute if score #ur zq_var matches 1 run effect give @s resistance infinite 0 true
execute if score #ur zq_var matches 2 run effect give @s resistance infinite 1 true
execute if score #uv zq_var matches 1 run effect give @s speed infinite 0 true
execute if score #uv zq_var matches 2 run effect give @s speed infinite 1 true
execute if score #uj zq_var matches 1 run effect give @s jump_boost infinite 0 true
execute if score #uj zq_var matches 2 run effect give @s jump_boost infinite 1 true
