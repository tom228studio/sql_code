-- Лабораторная работа #18: View (представление)
-- За написание ответственен: Шириков Илья Юрьевич

/* Задание для самостоятельной работы: Создайте представление возвращающее список заказов с указанием имени клиента и количества товаров в каждом заказе.
Таким образом, результат должен включать следующие атрибуты: IdOrd, OrdDate, IdCust, FName, LName, Количество видов товаров в заказе. */

create view listOfOrders -- задать представление 
as 
select o.order_num, o.order_date, o.cust_id, c.cust_contact, c.cust_email, count(oi.quantity) as "Количество товаров в заказе"
from orders o, customers c, orderitems oi
group by o.order_num, oi.quantity, c.cust_contact, c.cust_email 

select * from listoforders; -- вызвать выборку 

drop view listoforders; -- удалить представление