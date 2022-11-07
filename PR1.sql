create table Аптека ( 
PH_ID serial primary key,
Addreass varchar(40)
);

create table Группа_препаратов ( 
GR_ID serial primary key,
"Name" varchar(40)
);

create table Препарат ( 
R_ID serial primary key,
GR_ID smallint -- int2
);

create table Наличие_препаратов( 
A_ID serial primary key,
PH_ID smallint,
R_ID smallint,
Quantity smallint, 
DateEnd date
);

create table Дефицит_препараторв(  
D_ID serial primary key,
PH_ID smallint, 
PR_ID smallint,
Solution varchar(40),
DateStart date,
DateEnd date not null
);

create table Сотрудник ( 
E_ID serial primary key,
PH_ID smallint,
FName varchar(40),
Post varchar(40)
);

create table Клиент (
C_ID serial primary key,
Fname varchar(40),
LName varchar(40),
DateReg date not null
);

create table Корзина_покупок (
BS_ID serial primary key,
E_ID smallint,
C_ID smallint
);

create table Покупка (
B_ID serial primary key,
PH_ID smallint, 
PR_ID smallint,
BS_ID smallint,
Price money
);
