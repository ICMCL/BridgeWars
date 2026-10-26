scoreboard players operation @s zq_cls = @s zq_pick
scoreboard players set @s zq_pick 0
execute unless score @s zq_cls matches 1..4 run scoreboard players set @s zq_cls 1
execute if score @s zq_cls matches 1 run tellraw @s {text:"职业：近战",color:"green"}
execute if score @s zq_cls matches 2 run tellraw @s {text:"职业：远程",color:"green"}
execute if score @s zq_cls matches 3 run tellraw @s {text:"职业：混合",color:"green"}
execute if score @s zq_cls matches 4 run tellraw @s {text:"职业：建造者",color:"green"}
function zq:player/switch
