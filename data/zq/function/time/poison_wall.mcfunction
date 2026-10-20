# 两道紫色粒子毒墙：从 x=-48.5 起每 3 格一个点，递归铺 33 个
scoreboard players set #pw zq_var 0
$execute positioned -48.5 102 $(a) run function zq:time/poison_col
scoreboard players set #pw zq_var 0
$execute positioned -48.5 102 $(b) run function zq:time/poison_col
