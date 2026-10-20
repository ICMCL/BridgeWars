# schedule 回调默认跑在主世界，必须显式切回 zq:arena
$data modify storage zq:tmp pb set from storage zq:cfg pslice[$(i)]
execute in zq:arena run function zq:time/pull_do with storage zq:tmp pb
