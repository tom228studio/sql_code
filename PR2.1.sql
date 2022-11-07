
create table PHARMACY( 
PH_ID serial primary key,
Addreass varchar(40)
);

create table "GROUP"( 
GR_ID serial primary key,
"Name" varchar(40)
);

create table PREPARATION( 
R_ID serial primary key,
GR_ID smallint unique
);

create table AVAILABILITY( 
A_ID serial primary key,
PH_ID smallint unique,
PR_ID smallint unique,
Quantity smallint, 
DateEnd date
);

create table Deficit(  
D_ID serial primary key,
PH_ID smallint unique, 
PR_ID smallint unique,
Solution varchar(40),
DateStart date,
DateEnd date not null
);

create table Employee( 
E_ID serial primary key,
PH_ID smallint unique,
FName varchar(40),
Post varchar(40) 
);

create table Client(
C_ID serial primary key,
Fname varchar(40),
LName varchar(40),
DateReg date not null
);

create table Basket(
BS_ID serial primary key,
E_ID smallint unique,
C_ID smallint unique
);

create table Buying(
B_ID serial primary key,
PH_ID smallint unique, 
PR_ID smallint unique,
BS_ID smallint unique,
Price money
);

alter table client
ADD CONSTRAINT Cl_Ba
FOREIGN KEY (c_id) REFERENCES basket(c_id); 

alter table pharmacy 
ADD CONSTRAINT PH_DE
FOREIGN KEY (ph_id) REFERENCES deficit(ph_id); 

alter table pharmacy
ADD CONSTRAINT PH_AV
FOREIGN KEY (ph_id) REFERENCES availability(ph_id);

alter table pharmacy
ADD CONSTRAINT PH_EM
FOREIGN KEY (ph_id) REFERENCES employee(ph_id);

alter table pharmacy
ADD CONSTRAINT PH_BY
FOREIGN KEY (ph_id) REFERENCES buying(ph_id);

alter table employee
ADD CONSTRAINT EM_BA
FOREIGN KEY (e_id) REFERENCES basket(e_id);

alter table basket
ADD CONSTRAINT BA_BU
FOREIGN KEY (bs_id) REFERENCES buying(bs_id);

ALTER TABLE preparation
add CONSTRAINT PR_AV 
FOREIGN KEY (pr_id) REFERENCES availability(pr_id);

alter table preparation
add constraint PR_BY
foreign key (pr_id) references buying(pr_id);

alter table preparation
add constraint PR_DF
foreign key (pr_id) references deficit(pr_id);

alter table "GROUP"
add constraint GR_PR
foreign key (gr_id) references preparation(gr_id);