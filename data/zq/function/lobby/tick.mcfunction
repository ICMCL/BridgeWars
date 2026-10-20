execute as @a[tag=!zq_ingame,team=!red,x=-5,y=151,z=-1,dx=1,dy=0,dz=2] run function zq:lobby/join with storage zq:t red
execute as @a[tag=!zq_ingame,team=!blue,x=3,y=151,z=-1,dx=1,dy=0,dz=2] run function zq:lobby/join with storage zq:t blue
execute as @a[tag=!zq_ingame,team=!,x=-2,y=151,z=3,dx=3,dy=0,dz=2] run function zq:lobby/leave
execute if score #running zq_var matches 1 unless score #sudden zq_var matches 1 as @a[tag=!zq_ingame,team=red,gamemode=adventure,x=-5,y=151,z=-1,dx=1,dy=0,dz=2] run function zq:player/enter
execute if score #running zq_var matches 1 unless score #sudden zq_var matches 1 as @a[tag=!zq_ingame,team=blue,gamemode=adventure,x=3,y=151,z=-1,dx=1,dy=0,dz=2] run function zq:player/enter
execute if block -2 151 -5 stone_button[powered=true] run function zq:lobby/button
execute as @e[type=interaction,tag=zq_cfgnpc] if data entity @s interaction run function zq:cfg/npc
execute if score #g20 zq_var matches 0 run effect give @a[tag=!zq_ingame] saturation infinite 0 true
execute if score #g20 zq_var matches 0 run effect give @a[tag=!zq_ingame] resistance infinite 4 true
execute if score #g20 zq_var matches 0 run effect give @a[tag=!zq_ingame] regeneration infinite 4 true
execute as @a[tag=!zq_ingame,gamemode=adventure,x=-100,y=-100,z=-100,dx=200,dy=240,dz=200] run tp @s -0.5 151 0.5
