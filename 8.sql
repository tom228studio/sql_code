--/* Задача #1:
select p.prod_name, 
		p.prod_price, 
		oi.quantity, 
		oi.item_price 
	from products p, orderitems oi 
	where p.prod_id = oi.prod_id;

--Задача #2:Сформулируйте на языке SQL запросы на выборку следующих данных (с использование оператора JOIN для соединения таблиц). Двумя способами

-- Cписок всех товаров, которые когда-либо заказывал заданный клиент;
select c.cust_id, 
		c.cust_name, 
		p.prod_name, 
		p.prod_price, 
		oi.quantity, 
		oi.item_price 
	from products p
	join orderitems oi on p.prod_id = oi.prod_id 
	join orders o on oi.order_num = o.order_num
	join customers c on o.cust_id = c.cust_id;

-- Cписок всех клиентов, не имеющих ни одного заказа.
select c.cust_id, 
		c.cust_name, 
		o.order_num
	from customers c
	left outer join orders o on c.cust_id = o.cust_id where o.cust_id is null;