scoreboard players operation #n zq_var = @s zq_set
scoreboard players set @s zq_set 0
execute if score #running zq_var matches 1 run return run tellraw @s {text:"游戏进行中不能修改设置",color:"red"}
execute unless score #n zq_var matches 100000000..121211111 run return 0
scoreboard players operation #o_cap zq_var = #n zq_var
scoreboard players operation #o_cap zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #o_win zq_var = #n zq_var
scoreboard players operation #o_win zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #o_resp zq_var = #n zq_var
scoreboard players operation #o_resp zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #o_sudden zq_var = #n zq_var
scoreboard players operation #o_sudden zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #o_poison zq_var = #n zq_var
scoreboard players operation #o_poison zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #o_shop zq_var = #n zq_var
scoreboard players operation #o_shop zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #o_pull zq_var = #n zq_var
scoreboard players operation #o_pull zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #o_bridge zq_var = #n zq_var
scoreboard players operation #o_bridge zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
tellraw @a [{selector:"@s"},{text:" 修改了规则设置",color:"yellow"}]
function zq:lobby/preview
function zq:cfg/summary
