$function zq:shop/consume {team:"$(team)",id:1}
$function zq:shop/consume {team:"$(team)",id:2}
$function zq:shop/consume {team:"$(team)",id:3}
$function zq:shop/consume {team:"$(team)",id:4}
$function zq:shop/consume {team:"$(team)",id:5}
$function zq:shop/consume {team:"$(team)",id:6}
$function zq:shop/consume {team:"$(team)",id:8}
$function zq:shop/consume {team:"$(team)",id:9}
$function zq:shop/consume {team:"$(team)",id:12}
$function zq:shop/consume {team:"$(team)",id:21}
$function zq:shop/consume {team:"$(team)",id:22}
$function zq:shop/consume {team:"$(team)",id:23}
$function zq:shop/consume {team:"$(team)",id:24}
$function zq:shop/consume {team:"$(team)",id:25}
$function zq:shop/consume {team:"$(team)",id:31}
$function zq:shop/consume {team:"$(team)",id:32}
$function zq:shop/consume {team:"$(team)",id:33}
$function zq:shop/consume {team:"$(team)",id:34}
$execute store result score #icons zq_var run clear @s *[custom_data~{zq_shop:1},!custom_data~{team:"$(team)"}] 0
execute if score #icons zq_var matches 1.. run function zq:shop/reject_icons
