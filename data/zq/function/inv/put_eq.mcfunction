$data modify storage zq:tmp it set from storage zq:tmp eq.$(k)
data modify storage zq:tmp it.Slot set value 0b
data modify block 0 20 0 Items set value []
data modify block 0 20 0 Items append from storage zq:tmp it
$item replace entity @s $(s) from block 0 20 0 container.0
