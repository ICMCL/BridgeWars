# 最终半宽 1.5 格，安全带 z=-1..1；只展示粒子，不启用伤害或收缩计时
scoreboard players set #pw zq_var 0
execute positioned -48.5 142 -1 run function zq:time/poison_col
scoreboard players set #pw zq_var 0
execute positioned -48.5 142 2 run function zq:time/poison_col
