scoreboard players operation #m zq_var = #sec zq_var
scoreboard players operation #m zq_var -= #t_ps zq_var
scoreboard players operation #m zq_var %= #t_pi zq_var
execute if score #m zq_var matches 0 run function zq:time/pull
