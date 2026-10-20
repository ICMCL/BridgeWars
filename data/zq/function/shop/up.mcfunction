$execute if entity @s[team=red] run scoreboard players operation #lvl zq_var = #red $(o)
$execute if entity @s[team=blue] run scoreboard players operation #lvl zq_var = #blue $(o)
$execute if score #lvl zq_var matches $(max).. run return run tellraw @s {text:"$(name) 已满级",color:"yellow"}
scoreboard players operation #price zq_var = #lvl zq_var
scoreboard players add #price zq_var 1
$scoreboard players set #base zq_var $(base)
scoreboard players operation #price zq_var *= #base zq_var
function zq:shop/pay
execute if score #ok zq_var matches 0 run return 0
$execute if entity @s[team=red] run scoreboard players add #red $(o) 1
$execute if entity @s[team=blue] run scoreboard players add #blue $(o) 1
scoreboard players add #lvl zq_var 1
$execute if entity @s[team=red] run tellraw @a[team=red] [{selector:"@s"},{text:" 升级了团队【$(name)】→ ",color:"green"},{score:{name:"#lvl",objective:"zq_var"},color:"yellow"},{text:" 级",color:"green"}]
$execute if entity @s[team=blue] run tellraw @a[team=blue] [{selector:"@s"},{text:" 升级了团队【$(name)】→ ",color:"green"},{score:{name:"#lvl",objective:"zq_var"},color:"yellow"},{text:" 级",color:"green"}]
execute as @a[tag=zq_ingame,gamemode=adventure] run function zq:player/fx
