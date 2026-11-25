# 只读计数；container.* 含快捷栏和背包，不含副手、装备、鼠标和 2×2 合成格。主手已在快捷栏内。
$execute store result score #n zq_var if items entity @s container.* $(item)
$execute store result score #extra zq_var if items entity @s weapon.offhand $(item)
scoreboard players operation #n zq_var += #extra zq_var
$execute store result score #extra zq_var if items entity @s player.cursor $(item)
scoreboard players operation #n zq_var += #extra zq_var
$execute store result score #extra zq_var if items entity @s player.crafting.* $(item)
scoreboard players operation #n zq_var += #extra zq_var
$execute store result score #extra zq_var if items entity @s armor.* $(item)
scoreboard players operation #n zq_var += #extra zq_var
