# 只刷新价格过期的商品图标，不覆盖玩家存入的物品
$execute if items entity @s container.$(slot) *[custom_data~{zq_shop:1,buy:$(id),team:"$(team)"},!item_name={text:"$(name) · $(price) 金币",color:"gold"}] run item replace entity @s container.$(slot) with air
$function zq:shop/icon {team:"$(team)",slot:$(slot),id:$(id),model:"$(model)",name:"$(name) · $(price) 金币",desc:"当前 $(level)/$(max) 级，购买后升至 $(next) 级"}
