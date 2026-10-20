# 需在 zq:arena 维度执行
clear @s
data remove storage zq:tmp list
data remove storage zq:tmp eq
execute store result storage zq:tmp id.id int 1 run scoreboard players get @s zq_id
function zq:inv/restore_m with storage zq:tmp id
execute unless block 0 20 0 chest run setblock 0 20 0 chest
execute if data storage zq:tmp list[0] run function zq:inv/put_loop
execute if data storage zq:tmp eq.head run function zq:inv/put_eq {k:"head",s:"armor.head"}
execute if data storage zq:tmp eq.chest run function zq:inv/put_eq {k:"chest",s:"armor.chest"}
execute if data storage zq:tmp eq.legs run function zq:inv/put_eq {k:"legs",s:"armor.legs"}
execute if data storage zq:tmp eq.feet run function zq:inv/put_eq {k:"feet",s:"armor.feet"}
execute if data storage zq:tmp eq.offhand run function zq:inv/put_eq {k:"offhand",s:"weapon.offhand"}
data modify block 0 20 0 Items set value []
