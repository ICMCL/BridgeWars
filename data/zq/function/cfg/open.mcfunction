scoreboard players operation #c zq_var = @s zq_cfg
scoreboard players set @s zq_cfg 0
execute if score #running zq_var matches 1 unless score #c zq_var matches 4 run return run tellraw @s {text:"游戏进行中不能修改设置",color:"red"}
execute if score #c zq_var matches 1 run function zq:cfg/show_rules
execute if score #c zq_var matches 2 run function zq:cfg/show_times
execute if score #c zq_var matches 3 run function zq:cfg/defaults
execute if score #c zq_var matches 3 run tellraw @a [{selector:"@s"},{text:" 把设置恢复成了默认",color:"yellow"}]
execute if score #c zq_var matches 3..4 run function zq:cfg/summary
