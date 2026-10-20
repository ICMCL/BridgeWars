$scoreboard players set #$(f)_flag zq_var 0
$execute in zq:arena at @e[type=marker,tag=zq_flag_$(f),limit=1] run setblock ~ ~-1 ~ gold_block
$execute in zq:arena at @e[type=marker,tag=zq_flag_$(f),limit=1] run setblock ~ ~ ~ $(f)_banner
