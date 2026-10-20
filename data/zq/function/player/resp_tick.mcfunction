scoreboard players remove @s zq_resp 1
execute if score @s zq_resp matches ..0 run return run function zq:player/spawn
scoreboard players operation #s zq_var = @s zq_resp
scoreboard players add #s zq_var 19
scoreboard players operation #s zq_var /= #20 zq_const
title @s actionbar [{text:"复活倒计时 ",color:"red"},{score:{name:"#s",objective:"zq_var"},color:"yellow"},{text:" 秒",color:"red"}]
