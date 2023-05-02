/*Quarying the customer informations with there order ID */
SELECT ord.order_id , CONCAT(cus.first_name,' ',cus.last_name) as 'cust_full_name' ,cus.city,cus.state,ord.order_date,product_name,cat.category_name,store.store_name
,CONCAT(seller.first_name,' ',seller.last_name) as 'seller',SUM(items.quantity) as totle_unites , SUM(items.quantity * items.list_price) as revenue
FROM sales.customers cus
join sales.orders ord 
ON ord.customer_id = cus.customer_id
join sales.order_items items
ON ord.order_id= items.order_id
join [production].[products] prod
ON
items.product_id= prod.product_id
join [production].[categories] cat
ON prod.category_id = cat.category_id
join [sales].[stores] store
ON store.store_id= ord.store_id
join [sales].[staffs] seller
ON seller.staff_id=ord.staff_id
GROUP BY 
ord.order_id , CONCAT(cus.first_name,' ',cus.last_name),cus.city,cus.state,ord.order_date,prod.product_name,category_name,store.store_name,CONCAT(seller.first_name,' ',seller.last_name)