execute store result score @s zq_tmp run data get entity @s Age
execute if score @s zq_tmp matches 40.. run return run kill @s
data modify entity @s PickupDelay set value 0s
tag @s add zq_it
execute on origin run tp @e[type=item,tag=zq_it,limit=1] @s
tag @s remove zq_it
