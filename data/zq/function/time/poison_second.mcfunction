# 半宽 R（×100）= 650 - 500 × 已缩时间 / 总时长，最小 150（中间 3 格）
scoreboard players operation #e zq_var = #sec zq_var
scoreboard players operation #e zq_var -= #t_xs zq_var
scoreboard players set #R zq_var 500
scoreboard players operation #R zq_var *= #e zq_var
scoreboard players operation #R zq_var /= #t_xd zq_var
scoreboard players operation #R zq_var *= #-1 zq_const
scoreboard players add #R zq_var 650
execute if score #R zq_var matches ..150 run scoreboard players set #R zq_var 150
# 缩到最小后，只有在「死斗」本身开着时才提前进入死斗；关掉死斗就只是墙外持续掉血
execute if score #R zq_var matches ..150 if score #o_sudden zq_var matches 1 if score #sudden zq_var matches 0 run function zq:time/sudden
function zq:time/poison_store
execute as @a[tag=zq_ingame,gamemode=adventure] run function zq:time/poison_check
