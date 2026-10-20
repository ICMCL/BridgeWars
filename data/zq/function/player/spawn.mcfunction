gamemode adventure @s
scoreboard players reset @s zq_resp
execute if entity @s[team=red] run tp @s @e[type=marker,tag=zq_spawn_red,limit=1]
execute if entity @s[team=blue] run tp @s @e[type=marker,tag=zq_spawn_blue,limit=1]
execute at @s run spawnpoint @s ~ ~ ~
effect clear @s
effect give @s instant_health 1 10 true
effect give @s resistance 1 4 true
function zq:player/fx
