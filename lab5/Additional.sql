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
from item
where item.item# not in (
select item#
from order_items
);

--Find the item which has been bought by most of the customers.
select item#
from (
select order_items.item#, count(distinct orders.cust#) as noofcustomer
from orders
join order_items on order_items.order# = orders.order#
group by order_items.item#
order by noofcustomer desc
)
where rownum = 1;

--List the orders which are not shipped on a particular date.
select orders.order#
from orders
join shipment on shipment.order# = orders.order#
where shipment.shipdate is null or shipment.shipdate != '10-Jan-2020';

--Identify the customers whose orders are shipped on a both specified days.
--Give the customer information whose all orders are shipped from a single warehouse.
select customer.cust#, customer.cname
from customer
join orders on orders.cust# = customer.cust#
join shipment on shipment.order# = orders.order#
group by customer.cust#, customer.cname
having count(distinct shipment.warehouse#)=1;

--List the customers with maximum number of orders.
select cust#
from (
select customer.cust#, count(distinct orders.order#) as nooforders
from customer
join orders on orders.cust# = customer.cust#
group by customer.cust#
order by nooforders desc
)
where rownum = 1;
