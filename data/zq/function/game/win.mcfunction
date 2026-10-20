execute unless score #running zq_var matches 1 run return 0
scoreboard players set #running zq_var 0
scoreboard players set #endt zq_var 200
title @a times 5 80 20
title @a subtitle ""
$title @a title {text:"$(name) 获胜！",color:"$(color)",bold:true}
$tellraw @a [{text:"[战桥] ",color:"gold"},{text:"$(name) 获胜！",color:"$(color)"},{text:" 10 秒后返回大厅。",color:"white"}]
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s
