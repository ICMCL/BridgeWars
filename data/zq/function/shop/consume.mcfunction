$execute store result score #icons zq_var run clear @s *[custom_data~{zq_shop:1,buy:$(id),team:"$(team)"}] 1
execute unless score #icons zq_var matches 1.. run return 0
$scoreboard players set @s zq_buy $(id)
execute if score @s zq_buy matches ..25 if score #o_shop zq_var matches 0 run scoreboard players set @s zq_buy 0
execute if score @s zq_buy matches 0 run return run tellraw @s {text:"本局商店已关闭，只能免费换职业。未扣款。",color:"red"}
execute if score @s zq_buy matches ..25 run return run function zq:shop/buy
scoreboard players operation @s zq_pick = @s zq_buy
scoreboard players remove @s zq_pick 30
scoreboard players set @s zq_buy 0
function zq:lobby/pick
