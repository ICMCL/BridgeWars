# 两道毒墙的 z 坐标：0.5 ± R
scoreboard players set #zp zq_var 50
scoreboard players operation #zp zq_var += #R zq_var
scoreboard players set #zn zq_var 50
scoreboard players operation #zn zq_var -= #R zq_var
execute store result storage zq:tmp pz.a double 0.01 run scoreboard players get #zp zq_var
execute store result storage zq:tmp pz.b double 0.01 run scoreboard players get #zn zq_var
