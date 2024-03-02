create table customer(
  2  cust# int,
  3  cname varchar(20),
  4  city varchar(20),
  5  Primary Key(cust#)
  6  );

create table orders(
  2  order# int,
  3  odate date,
  4  cust# int,
  5  ordamt int,
  6  Primary Key(order#),
  7  Foreign key(cust#) references customer(cust#)
  8  );

create table Item(
  2  item# int,
  3  unitprice int,
  4  Primary Key(item#)
  5  );

 create table order_items(
  2  order# int,
  3  qty int,
  4  item# int,
  5  Foreign Key(order#) references orders(order#),
  6  Foreign Kye(item#) references item(item#)
  7  );

create table warehouse(
  2  warehouse# int,
  3  city varchar(20),
  4  Primary Key(warehouse#)
  5  );

create table shipment(
  2  order# int,
  3  warehouse# int,
  4  shipdate date,
  5  Foreign Key(order#) references orders(order#),
  6  Foreign Key(warehouse#) references warehouse(warehouse#)
  7  );

insert into customer values (1,'Tanmay','Anand');
insert into customer values (2,'Vansh','Mumbai');
insert into customer values (3,'Harsh','Mumbai');
insert into customer values (4,'Aryan','Delhi');
insert into customer values (5,'Swayam','Rachi');

insert into orders values (17,'12-Aug-2020',1,100);
insert into orders values (20,'12-Aug-2021',1,200);
insert into orders values (18,'7-Nov-2020',2,50);
insert into orders values (19,'18-Jan-2021',3,125);
insert into orders values (21,'18-Feb-2021',4,100);

insert into item values(121,20);
insert into item values(128,30);
insert into item values(151,10);
insert into item values(180,15);
insert into item values(173,35);

insert into order_items values (17,5,121);
insert into order_items values (20,20,151);
insert into order_items values (18,5,151);
insert into order_items values (19,4,173);
insert into order_items values (21,3,128);

insert into warehouse values(777,'Anand');
insert into warehouse values(878,'Mumbai');
insert into warehouse values(999,'Delhi');
insert into warehouse values(555,'Rachi');
insert into warehouse values(545,'kolkata');

insert into shipment values(17,777,'14-Aug-2020');
insert into shipment values(20,777,'14-Aug-2021');
insert into shipment values(18,878,'9-Nov-2020');
insert into shipment values(19,878,'20-Jan-2021');
insert into shipment values(21,555,'20-Feb-2021');


--Produce a listing: CUSTNAME, No. of Orders, AVG_ORDER_AMT, where the middle column is the total number of orders by the customer and
the last column is the average order amount for that customer

select cname as custname, count(order#), avg(ordamt)
  2  from customer,orders
  3  where customer.cust# = orders.cust#
  4  group by cname;

--List the order no for the orders that were shipped from all the warehouses that the company has in a specific city.

select order#
  2  from shipment,warehouse
  3  where warehouse.warehouse# = shipment.warehouse# and city='Mumbai';

--Decrease the order_amount by 10% if ordered quantity is greater than ten or else by 5% using Case construct.

update orders
  2  set ordamt = case
  3  when ordamt>10 then ordamt-ordamt*0.1
  4  else ordamt-ordamt*0.05
  5  end;
