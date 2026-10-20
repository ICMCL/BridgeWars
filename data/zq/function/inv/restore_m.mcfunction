$data modify storage zq:tmp list set from storage zq:inv p.p$(id).inv
$data modify storage zq:tmp eq set from storage zq:inv p.p$(id).eq
$data remove storage zq:inv p.p$(id)
