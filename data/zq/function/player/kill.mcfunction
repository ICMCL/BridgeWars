scoreboard players remove @s zq_kill 1
execute if score #o_shop zq_var matches 1 if entity @s[team=red] run scoreboard players add #red zq_coin 3
execute if score #o_shop zq_var matches 1 if entity @s[team=blue] run scoreboard players add #blue zq_coin 3
execute if score #o_shop zq_var matches 1 run tellraw @s {text:"击杀 +3 金币",color:"gold"}
execute at @s run playsound minecraft:entity.experience_orb.pickup master @s
execute if score @s zq_kill matches 1.. run function zq:player/kill
