Create database if not exists MySQL_Assignment;
use MySQL_Assignment;

create table if not exists SalesPeople ( 
Snum int unsigned not null,
Sname varchar(10) unique not null default '',
city varchar(10) not null default '',
comm decimal(3,2) not null default .99,
primary key (Snum)
);
desc SalesPeople;
-- drop table SalesPeople;

insert into SalesPeople values 
(1001, 'Peel', 'London', .12),
(1002,  'Serres', 'Sanjose', .13),
(1004, 'Motika', 'London', .11),
(1007, 'Rifkin', 'Barcelona', .15),
(1003, 'Axelrod', 'Newyork', .10);
select * from SalesPeople;

create table if not exists Customers (
Cnum int unsigned not null,
Cityname varchar(15) not null default '',
City varchar(10) not null default '',
Snum int unsigned not null,
primary key (Cnum),
foreign key (Snum) references SalesPeople(Snum)
);
desc Customers;
-- drop table Customers;
show tables;

insert into Customers values
(2001,  'Hoffman', 'London', 1001),
(2002, 'Giovanni', 'Rome', 1003),
(2003,  'Liu', 'Sanjose', 1002),
(2004,  'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);
select * from Customers;

create table if not exists Orders (
Onum int unsigned not null,
Amt decimal(6,2) not null default 9999.99,
Odate date not null default '00-00-0000',
Cnum int unsigned not null,
Snum int unsigned not null,
primary key(Onum),
foreign key (Cnum) references Customers(Cnum),
foreign key (snum) references SalesPeople(Snum)
);
desc Orders;
-- drop table Orders;

insert into Orders values
(3001, 18.69, '1990-10-3', 2008, 1007),
(3003, 767.19, '1990-10-3', 2001, 1001),
(3002, 1900.10, '1990-10-3', 2007, 1004),
(3005,  5160.45, '1990-10-3', 2003, 1002),
(3006,  1098.16 ,'1990-10-3', 2008, 1007),
(3009, 1713.23, '1990-10-4', 2002, 1003),
(3007,  75.75, '1990-10-4', 2004, 1002),
(3008 , 4273.00, '1990-10-5', 2006, 1001),
(3010,  1309.95, '1990-10-6', 2004, 1002),
(3011,  9891.88, '1990-10-6', 2006, 1001);
select * from Orders;
select
s.Snum as 'Sales number',
s.Sname as 'Sales person name',
s.city as 'Sales city',
s.comm as 'Sales comm',
c.Cnum as 'Customer number',
c.Cityname as 'Customer cityname',
c.City as 'Customer City',
o.Onum as 'Order number',
o.Amt as 'Order amount',
o.Odate as 'Order date'
from Orders as o
inner join Customers as c
inner join SalesPeople as s;

-- 1st condition
select count(Sname) from SalesPeople where Sname like 'A%' or Sname like 'a%';

-- 2nd condition
select Sname from Orders o,SalesPeople s where o.Snum = s.Snum and o.Amt >2000;

-- 3rd condition
select count(Sname) from SalesPeople where city = 'Newyork';

-- 4th condition
select count(Sname) from SalesPeople where city = 'London' and city = 'paris';

-- 5th condition
select odate,snum,count(*) from orders group by odate,snum;
