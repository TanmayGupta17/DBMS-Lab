--Display the names of the customers who have purchased items on 09/05/2015.

select customer.cname as custname, customer.cust# as custid
  2  from customer
  3  join orders on customer.cust# = orders.cust#
  4  where odate='9-May-2015';

--Count the total number of items in each order.

select order_items.order# as orderid, count(order_items.item#) as total_items
  2  from order_items
  3  group by order_items.order#;

--Find the order with maximum number of items in it.

select orders.order# as orderid, count(order_items.item#)
  2  from orders
  3  join order_items on orders.order# = order_items.order#
  4  group by orders.order#
  5  order by count(order_items.item#) desc;

--Find the date on which maximum number of orders were shipped

select shipment.shipdate, count(order#)
  2  from shipment
  3  group by shipdate
  4  order by count(order#) desc;

--List the order no for the orders that were shipped from all the warehouses that the company has in a specific city.

 select distinct order#, warehouse.warehouse#
  2  from shipment
  3  join warehouse on warehouse.warehouse# = shipment.warehouse#
  4  where warehouse.city = 'Mumbai';

--List the customer with a specific surname.

select *
  2  from customer
  3  where cname like '%Gupta%';

--List the customers in descending order of their total order amount.

select customer.cname, orders.ordamt
  2  from orders
  3  join customer on customer.cust# = orders.cust#
  4  order by orders.ordamt desc;

--Identify the customer with at least three orders that shipped on the particular date

SELECT c.cust#, c.cname, COUNT(o.order#) AS order_count
  2  FROM CUSTOMER c
  3  JOIN ORDERS o ON c.cust# = o.cust#
  4  JOIN SHIPMENT s ON o.order# = s.order#
  5  WHERE s.shipdate = '18-Feb-2021'
  6  GROUP BY c.cust#, c.cname
  7  HAVING COUNT(o.order#) >= 3;


