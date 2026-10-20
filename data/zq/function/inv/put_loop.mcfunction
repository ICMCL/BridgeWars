data modify storage zq:tmp it set from storage zq:tmp list[0]
data remove storage zq:tmp list[0]
execute store result storage zq:tmp sl.s int 1 run data get storage zq:tmp it.Slot
data modify storage zq:tmp it.Slot set value 0b
data modify block 0 20 0 Items set value []
data modify block 0 20 0 Items append from storage zq:tmp it
function zq:inv/put_slot with storage zq:tmp sl
execute if data storage zq:tmp list[0] run function zq:inv/put_loop
