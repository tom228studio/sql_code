
create table customers(
id_customer char(5) unique not null,
CompanyName varchar(40) not null,
ConstactName char(30) null,
Address varchar(60) null,
city char(15) null,
Phone char(24) null,
Fax char(24) null
);

create table orders(
id_order integer not null,
id_customer char(5) unique not null,
OrderDate date null,
ShippeDate date null,
Freight money null,
Shipname varchar(40) null,
ShipAddress varchar(60) null, 
Quantity integer null
);

alter table orders
add column shipregion integer null;

alter table orders
alter column shipregion type varchar(40);

alter table orders
drop column shipregion;

alter table orders
alter column orderdate set default current_date;

alter table orders 
add constraint quantityy
check (quantity > 1 and quantity < 30)

alter table orders
add primary key (id_order);

alter table customers 
add primary key (id_customer);

alter table orders
add constraint OR_CU
foreign key (id_customer) references customers(id_customer)
