$execute store result storage zq:dlgtmp o.i int 1 run scoreboard players get $(s) zq_var
$data modify storage zq:dlgtmp o.n set value $(n)
function zq:cfg/setopt2 with storage zq:dlgtmp o
