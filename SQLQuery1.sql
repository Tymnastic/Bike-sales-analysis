select 
		ord.order_id,
		concat (cus.first_name,' ',cus.last_name) as customers,
		cus.city, 
		cus.state, 
		ord.order_date,
		sum(ite.quantity) as total_unit ,
		sum(ite.quantity* ite.list_price) as revenue ,
		pro.product_name,
		cat.category_name,
		sto.store_name,
		bra.brand_name,
		concat(sta.first_name, '' , sta.last_name) as salesrep
from sales.orders ord
join sales.customers cus
on ord.customer_id = cus.customer_id
join sales.order_items ite on
ord.order_id =ite.order_id
join production.products pro
on pro.product_id = ite.product_id
join production.categories cat on
	cat.category_id=pro.category_id
join sales.stores sto
on sto.store_id=ord.store_id
join sales.staffs sta  on
	sta.staff_id=ord.staff_id
	join production.brands bra on
	pro.brand_id=bra.brand_id
group by 
ord.order_id,
concat (cus.first_name,' ',cus.last_name),
cus.city, 
cus.state, 
ord.order_date,
pro.product_name,
cat.category_name,
sto.store_name,
concat(sta.first_name, '' , sta.last_name),
bra.brand_name

select* from production.brands
select* from sales.stores;
select* from production.categories;
select * from production.products;
select * from production.stocks;
select * from sales.orders;
select * from sales.order_items;
select * from sales.staffs