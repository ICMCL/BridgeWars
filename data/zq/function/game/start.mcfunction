# ===== 开局 =====
scoreboard players set #endt zq_var 0
gamerule tnt_explodes true
function zq:cfg/calc
data remove storage zq:inv p
scoreboard players add #gid zq_var 1
scoreboard players set #t zq_var 0
scoreboard players set #sec zq_var 0
scoreboard players set #p zq_var 0
scoreboard players set #pbusy zq_var 0
scoreboard players set #psl zq_var 0
scoreboard players set #sudden zq_var 0
scoreboard players set #pz zq_var 0
scoreboard players set #red_flag zq_var 0
scoreboard players set #blue_flag zq_var 0
scoreboard players set #red_bonus zq_var 0
scoreboard players set #blue_bonus zq_var 0
scoreboard players set #red zq_coin 5
scoreboard players set #blue zq_coin 5
scoreboard players set #red zq_up_str 0
scoreboard players set #blue zq_up_str 0
scoreboard players set #red zq_up_res 0
scoreboard players set #blue zq_up_res 0
scoreboard players set #red zq_up_spd 0
scoreboard players set #blue zq_up_spd 0
scoreboard players set #red zq_up_jmp 0
scoreboard players set #blue zq_up_jmp 0
scoreboard players set #red zq_up_rsp 0
scoreboard players set #blue zq_up_rsp 0
execute in zq:arena run function zq:map/build
execute if score #o_bridge zq_var matches 2 in zq:arena run function zq:map/bridge_full
execute if score #o_bridge zq_var matches 3 in zq:arena run function zq:map/bridge_thick
scoreboard objectives setdisplay sidebar zq_side
scoreboard players reset * zq_side
scoreboard players set #running zq_var 1
execute as @a[team=!] run function zq:player/enter
execute as @a[team=] run function zq:player/watch
title @a times 5 40 10
title @a title {text:"战桥 开始！",color:"gold",bold:true}
execute if score #o_cap zq_var matches 0 run title @a subtitle {text:"夺取敌方旗帜，带回自家旗台",color:"yellow"}
execute if score #o_cap zq_var matches 1 run title @a subtitle {text:"夺取敌方旗帜，带回自家出生点",color:"yellow"}
function zq:cfg/summary
