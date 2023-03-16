use sales;
use production;
--
select 
ord.order_id,
CONCAT(cus.first_name,' ',cus.last_name) as NAME_CUSTOMER,
ord.order_date,
cus.city,
cus.state, 
sum(ite.quantity) as TOTAL_UNITS,
sum(ite.quantity * ite.list_price) as revenue,
pro.product_name,
cat.category_name,
sto.store_name,
bra.brand_name,
concat(sta.first_name,' ',sta.last_name) as SALES_REP

from sales.orders ord 
join sales.customers cus
ON ord.customer_id = cus.customer_id
join sales.order_items ite
on ord.order_id = ite.order_id
join production.products pro 
on ite.product_id = pro.product_id
join production.categories cat
on pro.category_id = cat.category_id
join sales.stores sto
on ord.store_id= sto.store_id
join sales.staffs sta
on ord.staff_id= sta.staff_id
join production.brands bra
on pro.brand_id = bra.brand_id
group by 
	ord.order_id,
	cus.city,
	cus.state, 
	ord.order_date,
    pro.product_name,
    cat.category_name,
    sto.store_name,
    bra.brand_name