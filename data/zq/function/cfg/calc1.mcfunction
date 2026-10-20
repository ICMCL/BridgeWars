$execute store result storage zq:tmp lk.i int 1 run scoreboard players get #i_$(k) zq_var
$data modify storage zq:tmp lk.k set value "$(k)"
function zq:cfg/calc2 with storage zq:tmp lk
