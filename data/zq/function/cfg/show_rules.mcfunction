data modify storage zq:dlgtmp d set from storage zq:dlg rules
function zq:cfg/setopt {s:"#o_bridge",n:0}
execute if score #o_pull zq_var matches 1 run data modify storage zq:dlgtmp d.inputs[1].initial set value 1b
execute if score #o_shop zq_var matches 1 run data modify storage zq:dlgtmp d.inputs[2].initial set value 1b
execute if score #o_poison zq_var matches 1 run data modify storage zq:dlgtmp d.inputs[3].initial set value 1b
execute if score #o_sudden zq_var matches 1 run data modify storage zq:dlgtmp d.inputs[4].initial set value 1b
execute if score #o_resp zq_var matches 1 run data modify storage zq:dlgtmp d.inputs[5].initial set value 1b
function zq:cfg/setopt {s:"#o_win",n:6}
function zq:cfg/show with storage zq:dlgtmp
