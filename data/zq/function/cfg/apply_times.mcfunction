scoreboard players operation #n zq_var = @s zq_time
scoreboard players set @s zq_time 0
execute if score #running zq_var matches 1 run return run tellraw @s {text:"游戏进行中不能修改设置",color:"red"}
execute unless score #n zq_var matches 100000000..199999999 run return 0
scoreboard players operation #i_sd zq_var = #n zq_var
scoreboard players operation #i_sd zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #i_xd zq_var = #n zq_var
scoreboard players operation #i_xd zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #i_xs zq_var = #n zq_var
scoreboard players operation #i_xs zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #i_pi zq_var = #n zq_var
scoreboard players operation #i_pi zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #i_ps zq_var = #n zq_var
scoreboard players operation #i_ps zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #i_bed zq_var = #n zq_var
scoreboard players operation #i_bed zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #i_full zq_var = #n zq_var
scoreboard players operation #i_full zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
scoreboard players operation #i_gap zq_var = #n zq_var
scoreboard players operation #i_gap zq_var %= #10 zq_const
scoreboard players operation #n zq_var /= #10 zq_const
function zq:cfg/calc
tellraw @a [{selector:"@s"},{text:" 修改了阶段时间",color:"yellow"}]
function zq:cfg/summary
