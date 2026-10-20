scoreboard players remove @s zq_timer 1
execute if score @s zq_timer matches ..0 run fill ~-2 ~ ~-2 ~2 ~ ~2 air replace slime_block
execute if score @s zq_timer matches ..0 run kill @s
