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

--Demonstrate the handling of data in ORDER_ITEMS relation on deletion of any item from the ITEM relation

