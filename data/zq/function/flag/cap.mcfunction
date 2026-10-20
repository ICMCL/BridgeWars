function zq:flag/untag
$function zq:flag/reset {f:"$(f)"}
tellraw @a [{selector:"@s"},{text:" 把敌方旗帜带回了家！",color:"gold"}]
$function zq:game/win with storage zq:t $(t)
