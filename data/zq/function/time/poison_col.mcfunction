particle dust{color:[0.6,0.0,0.9],scale:2.5} ~ ~ ~ 0 1.5 0 0 2 force
scoreboard players add #pw zq_var 1
execute if score #pw zq_var matches ..32 positioned ~3 ~ ~ run function zq:time/poison_col
