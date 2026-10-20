execute unless score #running zq_var matches 1 run return 0
scoreboard players set #running zq_var 0
scoreboard players set #endt zq_var 200
title @a title {text:"平局",color:"gray",bold:true}
