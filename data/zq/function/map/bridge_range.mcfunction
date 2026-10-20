scoreboard players set #x1 zq_var -29
scoreboard players operation #x1 zq_var += #p zq_var
scoreboard players set #x2 zq_var 28
scoreboard players operation #x2 zq_var -= #p zq_var
execute store result storage zq:tmp b.x1 int 1 run scoreboard players get #x1 zq_var
execute store result storage zq:tmp b.x2 int 1 run scoreboard players get #x2 zq_var
scoreboard players operation #n zq_var = #x2 zq_var
scoreboard players operation #n zq_var -= #x1 zq_var
scoreboard players add #n zq_var 1
