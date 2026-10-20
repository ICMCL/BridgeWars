# 击杀旗手的一方 +5
execute if score #o_shop zq_var matches 1 if entity @s[team=blue] run scoreboard players add #red zq_coin 5
execute if score #o_shop zq_var matches 1 if entity @s[team=red] run scoreboard players add #blue zq_coin 5
function zq:flag/untag
execute if entity @s[team=blue] run function zq:flag/reset {f:"red"}
execute if entity @s[team=red] run function zq:flag/reset {f:"blue"}
tellraw @a [{selector:"@s"},{text:" 倒下了，旗帜已归位",color:"gray"}]
