tag @s add zq_chk
execute unless data entity @s item.components."minecraft:custom_data"{zq:"erase"} run return 0
execute if data entity @s {pickup:2b} run return 0
tag @s add zq_erase
scoreboard players set @s zq_dx 0
scoreboard players set @s zq_dy 0
scoreboard players set @s zq_dz 0
scoreboard players set @s zq_still 0
