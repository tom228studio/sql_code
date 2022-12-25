--Задача #1: По аналогии с предыдущим примером сформулируйте запрос, возвращающий все заказы, в которых содержится заданный товар (по названию товара)
select *
	from orderitems o 
	where prod_id = (select prod_id from products p where prod_name = '1 ton anvil')
	

--Задача #2: Cформулируйте запрос, возвращающий список всех клиентов (с указанием фамилии и имени), совершивших заказ за определенный период времени.
select * 
	from customers c 
	where cust_id in (select o.cust_id from orders o where o.order_date in ('2016-01-09','2016-03-10'))

	
--Иной способ решения задачи #2

select * -- список всех значений столбца A, для которых оператор сравнения истинен для всех значений столбца B. 
	from customers c 
	where cust_id = all (select o.cust_id from orders o where o.order_date in ('2016-01-09','2016-03-10'))
	
select * -- список всех значений столбца A, для которых оператор сравнения истинен хотя бы для какого-нибудь одного значения столбца B.
	from customers c 
	where cust_id = some (select o.cust_id from orders o where o.order_date in ('2016-01-09','2016-03-10'))


--Задача #3: Cформулируйте запрос, возвращающий список всех заказов с суммарной стоимость более заданной величины.
select * 
		from products pr 
		where money(500000) < (select sum(oi.item_price) from orderitems oi where oi.prod_id = pr.prod_id)