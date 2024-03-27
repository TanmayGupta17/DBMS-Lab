--Find the customers whose address is not known yet.
select *
from customer
where city is null or city=' ';
  
--Find the customer who has made a maximum purchase till date.
select orders.cust#, customer.cname
from orders
join customer on customer.cust# = orders.cust#
group by orders.cust#,customer.cname
having count(orders.cust#)>1;

--Display all those orders which have not been shipped yet.
 select orders.order#
from orders
join shipment on shipment.order# = orders.order#
where orders.order# not in(
select shipment.order#
from shipment
);

--Select all those items which have not been bought by any customer.
select item.item#, item.unitprice
  2  from item
  3  where item.item# not in (
  4  select item#
  5  from order_items
  6  );

--Find the item which has been bought by most of the customers.

--List the orders which are not shipped on a particular date.
--Identify the customers whose orders are shipped on a both specified days.
--Give the customer information whose all orders are shipped from a single warehouse.
--List the customers with maximum number of orders.

