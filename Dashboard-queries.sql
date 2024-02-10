
-- Dashboard 1 - Orders

select 
	o.order_id,
	i.item_price,
	o.quantity,
	i.item_cat,
	i.item_name,
	o.created_at,
	a.delivery_address1,
	a.delivery_address2,
	a.delivery_city,
	a.delivery_zipcode,
	o.delivery
from orders o 
left join item i on i.item_id = o.item_id 
left join address a on o.add_id = a.add_id ;


-- Dashboard 2 - inventory managemnt



create view stock1 as
select 
	s1.item_name,
	s1.ing_id,
	s1.ing_name,
	s1.ing_weight,
	s1.ing_price,
	s1.order_quantity,
	s1.recipe_quantity,
	s1.order_quantity * s1.recipe_quantity as ordered_weight,
	s1.ing_price / s1.ing_weight as unit_cost,
	(s1.order_quantity * s1.recipe_quantity)*(s1.ing_price / s1.ing_weight) as ingredient_cost
from
	(
	select
		o.item_id,
		i.sku ,
		i.item_name ,
		r.ing_id ,
		ing.ing_name ,
		r.quantity as recipe_quantity,
		sum(o.quantity) as order_quantity,
		ing.ing_weight ,
		ing.ing_price
	from
		orders o
	left join item i on
		i.item_id = o.item_id
	left join recipe r on
		r.recipe_id = i.sku
	left join ingredient ing on
		ing.ing_id = r.ing_id
	group by
		o.item_id ,
		i.sku,
		i.item_name,
		r.ing_id ,
		r.quantity ,
		ing.ing_name ,
		ing.ing_weight ,
		ing.ing_price 
) s1



select * from stock1 ;

select 
	ing_name,
	sum(ordered_weight) as ordered_weight
from 
	stock1
group by 
	ing_name
;


select 
	s2.ing_name,
	s2.ordered_weight,
	ing.ing_weight * inv.quantity as total_inv_weight,
	(ing.ing_weight * inv.quantity)-s2.ordered_weight as remaining_weight
from 
(
select 
	ing_id,
	ing_name,
	sum(ordered_weight) as ordered_weight
from 
	stock1
group by 
	ing_name,
	ing_id) s2
left join inventory inv on
inv.item_id = s2.ing_id
left join ingredient ing on
ing.ing_id = s2.ing_id


-- Dashboard 3 - Staff

select 
	r."date",
	s.first_name,
	s.last_name,
	s.hourly_rate,
	sh.start_time ,
	sh.end_time,
	(EXTRACT(EPOCH FROM sh.end_time) - EXTRACT(EPOCH FROM sh.start_time))/3600 as hours_in_shift,
	(((EXTRACT(EPOCH FROM sh.end_time) - EXTRACT(EPOCH FROM sh.start_time))/3600) * s.hourly_rate) 
	as staff_cost
from
	rota r
left join staff s on
	s.staff_id = r.staff_id 
left join shift sh on
	sh.shift_id = r.shift_id 



