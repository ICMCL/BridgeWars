$execute if score #$(f)_flag zq_var matches 1 run return 0
$scoreboard players set #$(f)_flag zq_var 1
tag @s add zq_carry
scoreboard players reset @s zq_foot
$execute at @e[type=marker,tag=zq_flag_$(f),limit=1] run setblock ~ ~ ~ air
# 原来的物品先收起来，换成扛旗装备
function zq:inv/stash
$function zq:flag/carrier_kit with storage zq:t $(t)
function zq:flag/carrier_fx
$execute if score #o_shop zq_var matches 1.. unless score #$(t)_bonus zq_var matches 1 run scoreboard players add #$(t) zq_coin 5
$scoreboard players set #$(t)_bonus zq_var 1
$tellraw @a [{selector:"@s"},{text:" 夺走了 ",color:"white"},{text:"敌方旗帜！",color:"$(f)"}]
title @a times 5 30 10
title @a subtitle ""
$title @a[team=$(f)] title {text:"我方旗帜被夺！",color:"red",bold:true}
$title @a[team=$(t)] title {text:"我方夺得旗帜！",color:"green",bold:true}
title @s title {text:"你扛着旗帜！",color:"gold",bold:true}
execute if score #o_cap zq_var matches 0 run title @s subtitle {text:"减速、发光、只能用旗手物品 —— 快带回自家旗台金块",color:"yellow"}
execute if score #o_cap zq_var matches 1 run title @s subtitle {text:"减速、发光、只能用旗手物品 —— 快带回自家出生点",color:"yellow"}
execute as @a at @s run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 0.4 1.6
