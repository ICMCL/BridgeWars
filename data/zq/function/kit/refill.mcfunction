# 通用补给：背包里 clr 不超过 m 个时补 1 个 it（clr 用于计数，it 是带组件的完整写法）
$function zq:kit/count {item:'$(clr)'}
$execute if score #n zq_var matches ..$(m) run give @s $(it) 1
