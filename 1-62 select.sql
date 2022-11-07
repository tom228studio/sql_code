CREATE TABLE "Customers" (
  "cust_id" int PRIMARY KEY,
  "cust_name" varchar NOT null,
  "cust_address" varchar NOT null,
  "cust_city" varchar NOT null,
  "cust_state" varchar NOT null,
  "cust_zip" int NOT null,
  "cust_country" varchar NOT null,
  "cust_contact" varchar NOT null,
  "cust_email" varchar
);

CREATE TABLE "Orderitems" (
  "order_num" int,
  "order_item" int NOT null,
  "prod_id" varchar ,
  "quantity" int NOT null,
  "item_price" money NOT null
);

CREATE TABLE "Orders" (
  "order_num" int PRIMARY KEY,
  "order_date" date NOT null,
  "cust_id" int NOT null
);

CREATE TABLE "Productnotes" (
  "note_id" int,
  "prod_id" varchar,
  "note_date" date not null,
  "note_text" text NOT null
);

CREATE TABLE "Products" (
  "prod_id" varchar PRIMARY KEY ,
  "vend_id" int,
  "prod_name" varchar NOT null,
  "prod_price" money,
  "prod_desc" varchar NOT null
);

CREATE TABLE "Vendors" (
  "vend_id" int PRIMARY KEY,
  "vend_name" varchar NOT null,
  "vend_address" varchar NOT null,
  "vend_city" varchar NOT null,
  "vend_state" varchar,
  "vend_zip" varchar NOT null,
  "vend_country" varchar NOT null
);

ALTER TABLE "Orders" ADD FOREIGN KEY ("cust_id") REFERENCES "Customers" ("cust_id");

ALTER TABLE "Orderitems" ADD FOREIGN KEY ("order_num") REFERENCES "Orders" ("order_num");

ALTER TABLE "Orderitems" ADD FOREIGN KEY ("prod_id") REFERENCES "Products" ("prod_id");

ALTER TABLE "Productnotes"  ADD FOREIGN KEY ("prod_id") REFERENCES "Products" ("prod_id");

ALTER TABLE "Products"  ADD FOREIGN KEY ("vend_id") REFERENCES "Vendors" ("vend_id");

INSERT INTO "Customers" ( "cust_id" , "cust_name" , "cust_address" , "cust_city" , "cust_state" , "cust_zip" , "cust_country" , "cust_contact" , "cust_email") VALUES
(10001, 'Coyote inc.' , '200 Maple Lane' , 'Detroit' , 'MI' , 44444 , 'USA' , 'Y Lee' , 'ylee@coyote.com'),
(10002, 'Mouse House' , '333 Fromage Lane' , 'Culumbus' , 'OH' , 43333 , 'USA' , 'Jerry Mouse' , NULL),
(10003,'Wascals','1 Sunny','Muncie','IN',42222,'USA','Jim Jones','rabbit@wascally.com'),
(10004,'Yosemite Place','829 Riverside Drive','Phoenix','AZ','88888','USA','Y Sam','sam@yosemite.com'),
(10005,'E Fludd','4545 53rd Street','Chicago','IL','54545','USA','E Fudd',NULL);

insert into "Orders" ("order_num","order_date","cust_id") values
(20005,'2016-01-09',10001),
(20006,'2016-12-09',10003),
(20008,'2016-03-10',10005),
(20009,'2016-08-10',10001);

insert into "Vendors" ("vend_id","vend_name","vend_address","vend_city","vend_state","vend_zip","vend_country") values 
(1001,'Anvils R Us','123 Main Street','Southfield','MI',48075,'USA'),
(1002,'LT Supplies', '500 Park Street','Anytown','OH',44333,'USA'),
(1003, 'ACME','555 High Street','Los Angeles','CA',90046,'USA'),
(1004,'Furball Inc.','1000 5th Avenue','New York','NY',11111,'USA'),
(1005,'Jet Set','42 Galaxy Road','London',null,'N16 6PS','England'),
(1006, 'Jouets Et Ours','1 Rue Amusement','Paris',null,45678,'France');

insert into "Products" ("vend_id","prod_id","prod_name","prod_price","prod_desc") values 
(1001,'ANV01','.5 ton anvil','5,9900','.5 ton anvil, black, complete with handy hook'),
(1001,'ANV02','1 ton anvil','9,9900','1 ton anvil, black, complete with handy hook and carrying case'),
(1001,'ANV03','2 ton anvil','14,9900','2 ton anvil, black, complete with handy hook and carrying case'),
(1003,'DTNTR','Detonator','13,0000','Detonator(plunger powered),fuses not included'),
(1003,'FB','Bird seed','10,0000','large bag(suitable for road runners)'),
(1003,'FC','Carrots','2,5000','Carrots(rabbit hunting season only'),
(1002,'FU1','Fuses','3,4200','1 dozen, extra long'),
(1005,'JP1000','JetPack 1000','35,0000','JetPack 1000, intended for single use'),
(1005,'JP2000','JetPack 2000','55,0000','JetPack 2000, multi-use'),
(1002,'OL1','Oil can','8,9900','Oil can,red'),
(1003,'SAFE','Safe','50,0000','Safe with combination lock'),
(1003,'SLING','Sling','4,4900','Sling,one size fits all'),
(1003,'TNT1','TNT (1 stick)','2,5000','TNT, red,single stick'),
(1003,'TNT2','TNT (5 sticks)','10,0000','TNT, red,pack of 10 sticks');

insert into "Productnotes" ("note_id","note_date","note_text","prod_id") values
(109,'2016-01-09 00:00:00.000','Item is extremely heavy. Designed for dropping, not recommended for use with slings, ropes, pulleys, or tightropes.','ANV03'),
(110,'2016-01-09 00:00:00.000','Customer complaint: rabbit has been able to detect trap, food apparently less effective now.','FC'),
(111,'2016-02-09 00:00:00.000','Shipped unassembled, requires common tools (including oversized hammer).','SLING'),
(112,'2016-02-09 00:00:00.000','Customer complaint:Circular hole in safe floor can apparently be easily cut with handsaw.','SAFE'),
(113,'2016-05-09 00:00:00.000','Customer complaint:Not heavy enough to generate flying stars around head of victim. If being purchased for dropping, recommend ANV02 or ANV03 instead.','ANV01'),
(114,'2016-07-09 00:00:00.000','Call from individual trapped in safe plummeting to the ground, suggests an escape hatch be added.Comment forwarded to vendor.','SAFE');

insert into "Orderitems" ("order_item","order_num","quantity","item_price","prod_id") values
(1,20005,10,'5,9900','ANV01'),
(2,20005,3,'9,9900','ANV02'),
(3,20005,5,'10,0000','TNT2'),
(4,20005,1,'10,0000','FB'),
(1,20006,1,'55,0000','JP2000'),
(1,20008,50,'2,5000','FC'),
(1,20009,1,'10,0000','FB'),
(2,20009,1,'8,9900','OL1'),
(3,20009,1,'4,4900','SLING'),
(4,20009,1,'14,9900','ANV03');

--Задача 1 Выборка Products.
SELECT * FROM "Products";
--Задача 2 Выборка данных из столбца наименование продукта таблицы Products
select "prod_name" from "Products"; 
--Задача 3 Выборка данных код продукта,наименование продукта,стоимость продукта из таблицы продукты
select "prod_name" , "prod_id" , "prod_price" from "Products"; 
--Задача 4 Выборка уникальных данных из толбца vend_id таблицы продукт
select distinct "vend_id" from "Products"; 
--Задача 5 Произвести выборку первых 5 строк из столбца наименование таблицы продукты
select  "prod_name" from "Products" limit 5;
--Задача 6 Произвести выборку первых 5 строк из столбца наименования таблицы продукты начиная с 5-й позиции
select "prod_name" from "Products" limit 5 offset 5;
--Задача 7 Произвести выборку всех строк из столбца наименования продукта таблицы продукты начиная с 5-й позиции
select "prod_name" from "Products" offset 5;
--Задача 8 Произвести выборку данных из столбца наименование продукта таблицы продукты и осуществить сортировку по возрастанию
select "prod_name" from "Products" order by "prod_name" asc;
--Задача 9: Произвести выборку данных из столбца Код продукта, Наименование продукта, Цена продукта и осуществить сортировку по возрастанию по столбцам Наименование и Цена
select "prod_id","prod_name","prod_price" from "Products"  order by "prod_name" asc , "prod_price" asc;
--Задача 10: Произвести выборку данных из столбца Код продукта, Наименование продукта, Цена продукта из таблицы Продукты и осуществить сортировку по убыванию по Цене
select "prod_id" , "prod_name" , "prod_price" from "Products" order by "prod_price" desc;
--Задача 11
select "prod_id","prod_name","prod_price" from "Products" order by "prod_price" asc,"prod_name" desc;
--Задача 12

--1 Спопсоб
select concat ("vend_name" , "vend_country") from "Vendors" ; 
--2 Способ
select concat("vend_name" ||"vend_country") from "Vendors" ;
--Задача 13

--1 Способ
select concat("vend_name" || "vend_country") as "Nameing(Country)" from "Vendors" ;
--2 Способ
select concat("vend_name" , "vend_country") as "Nameing(Country)" from "Vendors" ;
--Задача 14
select "prod_id" , "quantity" , "item_price" from "Orderitems" ;
--Задача 15
select "prod_id" , "quantity"*"item_price" as "expanded_price" from "Orderitems";
--Задача 16

--1 Cпособ
select concat("vend_name" ,' ', "vend_country") as "Наименование (место нахождения)" , char_length("vend_name" || ' ' || "vend_country") as "Кол-во символов" from "Vendors";
--2 Способ
select concat("vend_name" ,' ', "vend_country") as "Наименование (место нахождения)" , character_length("vend_name" || ' ' || "vend_country") as "Кол-во символов" from "Vendors";
--3 Способ
select concat("vend_name" ,' ', "vend_country") as "Наименование (место нахождения)" , length("vend_name" || ' ' || "vend_country") as "Кол-во символов" from "Vendors";
--Задача 17
select upper("note_text") from "Productnotes";
--Задача 18
select lower("prod_id") from "Products";
--Задача 19

--1 Способ
select concat("vend_name" ,' ', "vend_country") as "Наименование (место нахождения)" , upper("vend_name" || ' ' || "vend_country") as "Регистр" from "Vendors";
--2 Способ 
select ("vend_name" ,' ', "vend_country") as "Наименование (место нахождения)" , upper("vend_name" || ' ' || "vend_country") as "Регистр" from "Vendors";
--Задача 20
select "prod_desc", trim(rtrim(prod_desc)) as "Результат"
from "Products"
limit 1;
select "prod_desc", substring("prod_desc",2,char_length("prod_desc")-2) as "Результат"
from "Products"
limit 1;
--Задание 21
select "prod_desc", trim(rtrim(prod_desc)) as "Результат"
from "Products";

select "prod_desc", substring("prod_desc",2,char_length("prod_desc")-2) as "Результат"
from "Products";
/*Часть 2 */
--Задача 22
select "prod_desc",ltrim("prod_desc", 'T') as "Результат"
from "Products";
--Задача 23
select "prod_desc",ltrim("prod_desc", 'Jet') as "Результат"
from "Products" ;

select "prod_desc",rtrim("prod_desc", 'Jet') as "Результат"
from "Products" ;
--Задача 24

--1 Способ
select ltrim("prod_desc", 'Jet, t, S, . ') as "Результат"
from "Products" ;

--2 Способ
select "prod_desc", ltrim("prod_desc",'J,e,t, t, S, .') as "Результат" from "Products" ; 


--Задача 25

--1 Спопсоб
select "prod_desc",rtrim("prod_desc", 'e') as "Результат"
from "Products" ;

--2 Способ
select "prod_desc",rtrim("prod_desc", 'e') as "Результат"
from "Products" ;

--Задача 26

--1 Способ
select "prod_desc", rtrim("prod_desc",'ook') as "Результат" from "Products" ;

--2 Способ
select "prod_desc", ltrim("prod_desc",'ook') as "Результат" from "Products" ;

--Задача 27

--1 Способ
select "prod_desc", rtrim("prod_desc",'e,l,k,g') as "Результат" from "Products" ;

--2 Способ
select "prod_desc", ltrim("prod_desc",'e,l,k,g') as "Результат" from "Products" ;

--Задача 28

select "prod_desc", overlay("prod_desc" placing 'YYY' from 4 for 6) from "Products" ;

--Задача 29

--1 Способ
select "vend_city", strpos( "vend_city" , 'a') as "Позиция" from "Vendors";

--2 Способ
select "vend_city", position ('a' in "vend_city") as "Позиция" from "Vendors";

--Задача 30

--1 Способ
select "vend_address", position ('Str' in "vend_address") as "Позиция" from "Vendors" order by "vend_address" asc ;

--2 Способ
select "vend_address", strpos ("vend_address" , 'Str') as "Позиция" from "Vendors" order by "vend_address" asc ;

--Задача 31

--1 Способ
select "note_text" , substring("note_text", 13,22) as "Результат" from "Productnotes"; 

--2 Способ
select "note_text" , substring("note_text" from 13 for 22) as "Результат" from "Productnotes";
 
--Задача 32
select substring("note_text" from 1 for 22) as "Результат" from "Productnotes";

--Задача 33
select substring("note_text" from -22 for 0) as "Результат" from "Productnotes";

--Задача 34
select right("note_text", 14) as "Результат" from "Productnotes";

--Задача 35
select right("note_text", -17) as "Результат" from "Productnotes";

--Задача 36
select repeat("vend_name", 3) as "Повтор" from "Vendors";

--Задача 37
select reverse("vend_name") as "Реверс" from "Vendors";

--Задача 38
select split_part("cust_email", '@', 1) as "Часть 1", split_part("cust_email", '@', 2) as "Часть 2" from "Customers";
--Задача 39
select split_part("cust_name", ' ', 1) as "Часть 1", split_part("cust_name", ' ', 2) as "Часть 2" from "Customers";

--Задача 40
select age('2022-10-23', '1812-08-03');
--Задача 41
select age("order_date") as "Интервал" from "Orders";
--Задача 42
--1 способ
select current_time;
--2 способ
select now();

--Задача 43
select current_time;

--Часть 3

--Задача 44
select now();

--Задача 45 
select date_part('year',"order_date") as "Год" from "Orders";

--Задача 46 
select date_part('month',"order_date") as "Месяц" from "Orders";

--Задача 47
select date_part('day',"order_date") as "День" from "Orders";
--Задача 48

select date_part('hours', timestamp '2020-06-30 02:36:24' );

--Задача 49
select date_part('minutes', timestamp '2020-06-30 02:36:24' );

--Задача 50 

select date_part('seconds', timestamp '2020-06-30 02:36:24' );

--Задача 51

select date_part('year', timestamp '2021-12-31 12:48:17' ) as "Год" , date_part('month', timestamp '2021-12-31 12:48:17' ) as "Месяц" , date_part('day', timestamp '2021-12-31 12:48:17' ) as "День" , date_part('hours', timestamp '2021-12-31 12:48:17' ) as "Часы", date_part('minutes', timestamp '2021-12-31 12:48:17' ) as "Минуты",date_part('seconds', timestamp '2021-12-31 12:48:17' ) as "Секунды";
 
--Задача 52
select "order_date", age("order_date") as "Интервал", date_part('year' , age("order_date")) as "Года"  from "Orders";
--Задача 53
select "order_date", age("order_date") as "Интервал", date_part('month' , age("order_date")) as "Месяца"  from "Orders";
--Задача 54
select "order_date", age("order_date") as "Интервал", date_part('day' , age("order_date")) as "Дни"  from "Orders";
--Задача 55
select age(timestamp'1856-04-25 09:56:34') as "Интервал", date_part('hours', age(timestamp'1856-04-25 09:56:34')) as "Часы", date_part('minutes', age(timestamp'1856-04-25 09:6:34')) as "Минуты", date_part('seconds', age(timestamp'1856-04-25 09:56:34')) as "Секунды";
--Задача 56
select "order_date", date_trunc('year' , "order_date") as "Результат" from "Orders";
--Задача 57
select "order_date", date_trunc('month' , "order_date") as "Результат" from "Orders";

--задание 58
select "order_date", date_trunc('day' , "order_date") as "Результат" from "Orders";

--задание 59
select date_trunc('hour' , timestamp'2015-05-26 16:36:42.258') as "Результат";

--задание 60
select date_trunc('minutes' , timestamp'2015-05-26 16:36:42.258') as "Результат";

--задание 61
select date_trunc('seconds' , timestamp'2015-05-26 16:36:42.258') as "Результат";

--задание 62
select concat("note_id",'/', "prod_id",'/', "note_date") as "Результат" from "Productnotes";
select concat_ws('/', "note_id", "prod_id", "note_date") as "Результат" from "Productnotes";