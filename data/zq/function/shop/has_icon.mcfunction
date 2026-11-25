# 普通点击在鼠标上，Shift 点击或数字键取货则在玩家背包里。
$execute if items entity @s player.cursor $(icon) run return 1
$execute if items entity @s container.* $(icon) run return 1
$execute if items entity @s weapon.offhand $(icon) run return 1
$execute if items entity @s player.crafting.* $(icon) run return 1
$execute if items entity @s armor.* $(icon) run return 1
return 0
