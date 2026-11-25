# 主世界大厅两侧的静态预览：岛面 y=140，四层岛体同时作为跨维度保护模板
scoreboard players reset #islands_cached zq_var
$execute store success score #tpl_ok zq_var run clone from zq:arena -46 $(y0) -4 -30 $(y1) 4 to minecraft:overworld -46 137 -4 replace force
execute unless score #tpl_ok zq_var matches 1 run return run tellraw @a {text:"[战桥] 红岛预览模板复制失败，请检查区块是否加载。",color:"red"}
$execute store success score #tpl_ok zq_var run clone from zq:arena 29 $(y0) -4 45 $(y1) 4 to minecraft:overworld 29 137 -4 replace force
execute unless score #tpl_ok zq_var matches 1 run return run tellraw @a {text:"[战桥] 蓝岛预览模板复制失败，请检查区块是否加载。",color:"red"}
execute in minecraft:overworld run setblock -43 141 0 red_banner
execute in minecraft:overworld run setblock 42 141 0 blue_banner
function zq:lobby/preview
