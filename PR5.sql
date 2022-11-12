--Задача 1. 
SELECT prod_id, prod_name, prod_price FROM products
where prod_price = 2.50;
--Задача 2.
SELECT prod_id, prod_name, prod_price FROM products
where prod_name = "Fuses";
--Задача 3.
SELECT prod_id, prod_name, prod_price FROM products
where prod_name = "Fuses" or prod_name = "fuses";
--Задача 4.
SELECT prod_id, prod_name, prod_price FROM products
where prod_price < 10;
--Задача 5.
SELECT prod_id, prod_name, prod_price FROM products
where prod_price <= 10;
--Задача 6.
SELECT vend_id, prod_name, prod_price FROM products
where vend_id = 1003;
---------------------------------------------------
SELECT vend_id, prod_name, prod_price FROM products
where vend_id IN 1003;
---------------------------------------------------
SELECT vend_id, prod_name, prod_price FROM products
where vend_id <> 1003;
--Задача 7.
SELECT prod_id, prod_name, prod_price FROM products
where prod_price >= 5 or prod_price = 10;
---------------------------------------------------
SELECT prod_id, prod_name, prod_price FROM products
where prod_price BETWEEN 5 and 10;
--Задача 8.
SELECT cust_name, cust_email, concat_ws(' ',cust_zip, cust_city, cust_address, cust_country, cust_state) as "Полный адрес" FROM customers
where cust_email IS NULL;
--Задача 9.
SELECT cust_name, cust_email, concat_ws(' ',cust_zip, cust_city, cust_address, cust_country, cust_state) as "Полный адрес" FROM customers
where cust_email IS NOT NULL;
--Задача 10.
SELECT prod_id, prod_name, prod_price FROM products
where prod_price <= 10 and prod_id = 1003;
--Задача 11.
SELECT prod_id, prod_name, prod_price FROM products
where prod_id = 1003 or prod_id = 1002;
----------------------------------------------------
SELECT prod_id, prod_name, prod_price FROM products
where prod_id IN 1003 or 1002;
--Задача 12.
SELECT vend_id, prod_name, prod_price FROM products
where vend_id IN 1002 or 1004
order by prod_name;
--Задача 13.
SELECT vend_id, prod_name, prod_price FROM products
where vend_id IN 1002 or 1004
order by prod_name;
--Задача 14.
SELECT vend_id, prod_name, prod_price FROM products
where vend_id IN (1002 or 1004) and LENGTH(vend_id)>5
order by prod_name;
--Задача 15.
SELECT vend_id, UPPER(prod_name), prod_price FROM products
where vend_id IN 1002 or 1003
order by vend_id;
-----------------------------------------------------
SELECT vend_id, UPPER(prod_name), prod_price FROM products
where vend_id = 1002 or vend_id = 1003
order by vend_id;
--Задача 16.
SELECT prod_id, prod_name, prod_price FROM products
where prod_name like "jet%";
--Задача 17.
SELECT prod_id, prod_name, prod_price FROM products
where prod_name like "%a%" and "%n%" and "%v%" and "%i%" and "%l%";
--Задача 18.
SELECT prod_id, prod_name, prod_price FROM products
where prod_name like "_ton anvil%";
--Задача 19.
SELECT prod_id, prod_name, prod_price FROM products
where prod_name like "%ton%";
--Задача 20.
SELECT cust_name, cust_email, concat_ws(' ',cust_zip, cust_city, cust_address, cust_country, cust_state) as "Полный адрес" FROM customers
where cust_name like "E%" or "J%"
order by cust_name;
--Задача 21.
SELECT cust_name, cust_email, concat_ws(' ',cust_zip, cust_city, cust_address, cust_country, cust_state) as "Полный адрес" FROM customers
where cust_name NOT like "E%" or "J%"
order by cust_name DESC;
--Задача 22.
select vend_name, position('Inc' in vend_name) as "Позиция" from vendors 
where vend_id = 1004;
---------------------------------------------------------
select vend_name, position('Inc' in vend_name) as "Позиция" from vendors 
where vend_id <= 1003 and vend_id > 1005;
--Задача 23.
select * from productnotes 
where note_date between '2016-01-09' and '2016-05-09';
