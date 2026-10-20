scoreboard players set #ok zq_var 0
execute if entity @s[team=red] if score #red zq_coin >= #price zq_var run scoreboard players set #ok zq_var 1
execute if entity @s[team=red] if score #ok zq_var matches 1 run scoreboard players operation #red zq_coin -= #price zq_var
execute if entity @s[team=blue] if score #blue zq_coin >= #price zq_var run scoreboard players set #ok zq_var 1
execute if entity @s[team=blue] if score #ok zq_var matches 1 run scoreboard players operation #blue zq_coin -= #price zq_var
execute if score #ok zq_var matches 0 run tellraw @s [{text:"金币不足！需要 ",color:"red"},{score:{name:"#price",objective:"zq_var"},color:"yellow"}]
execute if score #ok zq_var matches 1 run playsound minecraft:entity.experience_orb.pickup master @s
