scoreboard players reset @s zq_use
execute unless entity @s[tag=zq_ingame,gamemode=adventure] run return 0
execute if entity @s[tag=zq_carry] if items entity @s weapon.* *[custom_data~{zq:"foot"}] run return run title @s actionbar {text:"扛旗时不能使用脚下生桥",color:"red"}
execute if items entity @s weapon.mainhand *[custom_data~{zq:"fireball"}] run return run function zq:skill/do {id:"fireball",slot:"weapon.mainhand"}
execute if items entity @s weapon.offhand *[custom_data~{zq:"fireball"}] run return run function zq:skill/do {id:"fireball",slot:"weapon.offhand"}
execute if items entity @s weapon.mainhand *[custom_data~{zq:"bomb"}] run return run function zq:skill/do {id:"bomb",slot:"weapon.mainhand"}
execute if items entity @s weapon.offhand *[custom_data~{zq:"bomb"}] run return run function zq:skill/do {id:"bomb",slot:"weapon.offhand"}
execute if items entity @s weapon.mainhand *[custom_data~{zq:"foot"}] run return run function zq:skill/do {id:"foot",slot:"weapon.mainhand"}
execute if items entity @s weapon.offhand *[custom_data~{zq:"foot"}] run return run function zq:skill/do {id:"foot",slot:"weapon.offhand"}
execute if items entity @s weapon.mainhand *[custom_data~{zq:"plat"}] run return run function zq:skill/do {id:"plat",slot:"weapon.mainhand"}
execute if items entity @s weapon.offhand *[custom_data~{zq:"plat"}] run return run function zq:skill/do {id:"plat",slot:"weapon.offhand"}
