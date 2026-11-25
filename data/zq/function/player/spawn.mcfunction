gamemode adventure @s
scoreboard players reset @s zq_resp
# 商店留在基地中心；玩家站在同一块受保护基地的前排，面向桥，不与矿车重叠。
execute if entity @s[team=red] in zq:arena at @e[type=marker,tag=zq_spawn_red,limit=1] run tp @s ~1 ~ ~ -90 0
execute if entity @s[team=blue] in zq:arena at @e[type=marker,tag=zq_spawn_blue,limit=1] run tp @s ~-1 ~ ~ 90 0
execute at @s run spawnpoint @s ~ ~ ~
effect clear @s
effect give @s instant_health 1 10 true
effect give @s resistance 1 4 true
function zq:player/fx
