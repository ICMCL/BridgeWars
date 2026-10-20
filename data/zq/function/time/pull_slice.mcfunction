# 每 tick 搬一片（zq:cfg pslice 里的第 #psl 条），峰值约 11 万方块，14 tick 搬完
# #pbusy 既防重入，也让 game/start 能把残留的调度链掐掉
execute unless score #pbusy zq_var matches 1 run return 0
execute unless score #running zq_var matches 1 run return run scoreboard players set #pbusy zq_var 0
execute store result storage zq:tmp ps.i int 1 run scoreboard players get #psl zq_var
function zq:time/pull_slice2 with storage zq:tmp ps
scoreboard players add #psl zq_var 1
execute if score #psl zq_var matches 14.. run return run scoreboard players set #pbusy zq_var 0
schedule function zq:time/pull_slice 1t
