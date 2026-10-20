execute if score @s zq_dx matches 0 if score @s zq_dy matches 0 if score @s zq_dz matches 0 run return run kill @s
execute store result storage zq:tmp v.x int 1 run scoreboard players get @s zq_dx
execute store result storage zq:tmp v.y int 1 run scoreboard players get @s zq_dy
execute store result storage zq:tmp v.z int 1 run scoreboard players get @s zq_dz
scoreboard players set #dur zq_var 10
scoreboard players set #steps zq_var 0
function zq:arrow/hit_m with storage zq:tmp v
particle minecraft:dragon_breath ~ ~ ~ 0.2 0.2 0.2 0.02 15 force
playsound minecraft:block.amethyst_block.break master @a ~ ~ ~
kill @s
