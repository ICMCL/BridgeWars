execute store result score #z zq_var run data get entity @s Pos[2] 100
scoreboard players remove #z zq_var 50
execute if score #z zq_var matches ..-1 run scoreboard players operation #z zq_var *= #-1 zq_const
execute if score #z zq_var > #R zq_var run function zq:time/poison_dmg
