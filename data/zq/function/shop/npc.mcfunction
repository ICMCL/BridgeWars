# @s = 被右键的交互实体；够得着就能开，只有本队能用，扛旗时不能用
execute if entity @s[tag=zq_shop_red] on target if entity @s[team=red,tag=zq_ingame,tag=!zq_carry,gamemode=adventure] run function zq:shop/open
execute if entity @s[tag=zq_shop_blue] on target if entity @s[team=blue,tag=zq_ingame,tag=!zq_carry,gamemode=adventure] run function zq:shop/open
execute if entity @s[tag=zq_shop_red] on target unless entity @s[team=red] run title @s actionbar {text:"这是敌方的商人",color:"red"}
execute if entity @s[tag=zq_shop_blue] on target unless entity @s[team=blue] run title @s actionbar {text:"这是敌方的商人",color:"red"}
execute on target if entity @s[tag=zq_carry] run title @s actionbar {text:"扛旗时不能使用商店",color:"red"}
data remove entity @s interaction
data remove entity @s attack
