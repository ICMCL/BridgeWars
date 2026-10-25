$execute if score #$(team) $(o) matches $(max).. if items entity @s container.$(slot) *[custom_data~{zq_shop:1,buy:$(id),team:"$(team)"}] run item replace entity @s container.$(slot) with air
$execute if score #$(team) $(o) matches $(max).. run return 0
$scoreboard players operation #lvl zq_var = #$(team) $(o)
scoreboard players operation #price zq_var = #lvl zq_var
scoreboard players add #price zq_var 1
$data modify storage zq:tmp upgrade set value {team:"$(team)",slot:$(slot),id:$(id),model:"$(model)",name:"$(name)",max:$(max)}
execute store result storage zq:tmp upgrade.level int 1 run scoreboard players get #lvl zq_var
execute store result storage zq:tmp upgrade.next int 1 run scoreboard players get #price zq_var
$scoreboard players set #base zq_var $(base)
scoreboard players operation #price zq_var *= #base zq_var
execute store result storage zq:tmp upgrade.price int 1 run scoreboard players get #price zq_var
function zq:shop/upgrade_icon with storage zq:tmp upgrade
