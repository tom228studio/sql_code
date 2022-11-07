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