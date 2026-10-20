$execute if score #o_win zq_var matches 1 if score #$(t)_flag zq_var matches 1 run return run title @s actionbar {text:"自家旗帜被夺走了，夺回后才能得分！",color:"red"}
$function zq:flag/cap {f:"$(f)",t:"$(t)"}
