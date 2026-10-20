scoreboard players remove @s zq_foot 1
execute if entity @s[team=red] if block ~ ~-1 ~ #minecraft:air run setblock ~ ~-1 ~ red_stained_glass
execute if entity @s[team=blue] if block ~ ~-1 ~ #minecraft:air run setblock ~ ~-1 ~ blue_stained_glass
scoreboard players operation #s zq_var = @s zq_foot
scoreboard players add #s zq_var 19
scoreboard players operation #s zq_var /= #20 zq_const
title @s actionbar [{text:"▮ 脚下生桥 剩余 ",color:"aqua"},{score:{name:"#s",objective:"zq_var"},color:"yellow",bold:true},{text:" 秒",color:"aqua"}]
execute if score @s zq_foot matches 0 run title @s actionbar {text:"脚下生桥 已结束",color:"gray"}
