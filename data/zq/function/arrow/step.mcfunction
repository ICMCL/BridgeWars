scoreboard players add #steps zq_var 1
scoreboard players set #cost zq_var 99
execute if block ~ ~ ~ #minecraft:air run scoreboard players set #cost zq_var 0
execute if block ~ ~ ~ #zq:cost1 run scoreboard players set #cost zq_var 1
execute if block ~ ~ ~ #zq:cost3 run scoreboard players set #cost zq_var 3
execute if block ~ ~ ~ #zq:cost10 run scoreboard players set #cost zq_var 10
execute if score #cost zq_var > #dur zq_var run return 0
scoreboard players operation #dur zq_var -= #cost zq_var
execute unless score #cost zq_var matches 0 run setblock ~ ~ ~ air destroy
execute if score #steps zq_var matches ..16 if score #dur zq_var matches 1.. positioned ^ ^ ^0.5 run function zq:arrow/step
