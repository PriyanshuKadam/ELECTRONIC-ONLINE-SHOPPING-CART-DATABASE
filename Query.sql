--1) The information of laptops
SELECT * FROM Product 
WHERE type='laptop';

--2) List of all products whose price above average price
CREATE VIEW Products_Above_Average_Price AS
SELECT pid, name, price
FROM Product WHERE price > (SELECT AVG(price) FROM Product);
select * from products_above_average_price;

--3) Retrieve the names and phone numbers of all buyers who have saved a product to their shopping cart but have not yet made a purchase.
SELECT u.name, u.phoneNumber
FROM Users u
INNER JOIN Buyer b ON u.userid = b.userid
INNER JOIN Save_to_Shopping_Cart c ON b.userid = c.userid
LEFT JOIN Contain o ON c.userid = o.orderNumber
WHERE o.orderNumber IS NULL; 

--4) The total quantity of products from store with storeid 8 in the shopping cart
SELECT SUM(quantity) AS totalQuantity  FROM Save_to_Shopping_Cart
WHERE Save_to_Shopping_Cart.pid IN (SELECT Product.pid FROM Product WHERE sid=8);

--5)  Retrieve the products sold in a given store. 
SELECT Product.name,SUM(Contain.quantity) AS total_quantity FROM Product,Contain,Orders
WHERE Product.pid=Contain.itemid AND Contain.orderNumber=Orders.orderNumber AND Product.sid=8
GROUP BY Product.name
ORDER BY total_quantity DESC

--6) Retrieve the total revenue for each brand sold in a given store.
SELECT brand, SUM(price) AS totalRevenue FROM Product
GROUP BY brand

--7) The address, starttime and endtime of the servicepoints in the same city as userid 5      
SELECT streetaddr,starttime,endtime
FROM ServicePoint
WHERE ServicePoint.city IN (SELECT Address.city FROM Address WHERE userid=5);

--8)  Retrieve the total unpaid amount of the users
SELECT orders.paymentstate,SUM(ORDERS.TOTALAMOUNT) AS TOTAL_Unpaid_amount 
FROM ORDERS, Payment,users,creditcard 
WHERE orders.paymentstate='Unpaid' AND orders.ordernumber = payment.ordernumber and payment.creditcardnumber = creditcard.cardnumber and creditcard.userid=users.userid 
GROUP BY orders.paymentstate ;

--9) Retrieve the total sales for a given store in a given month.
SELECT SUM(price)
FROM Orders, Contain, OrderItem
WHERE Orders.orderNumber = Contain.orderNumber AND Contain.itemid = OrderItem.itemid AND Orders.creationTime LIKE '%2016-09%'  AND OrderItem.pid IN (SELECT pid FROM Product WHERE sid = 8)

--10) Update the name and contact phone number of person of address where the province is Quebec and city is montreal.
UPDATE address
SET name = 'Carolina', contactPhoneNumber ='123456789'
WHERE province = 'Quebec' AND city = 'Montreal' and addrid = 100
Select * from address where name= 'Carolina' 

--11) Retrieve the average grade and number of comments for each product in a given store.
SELECT Product.pid, Product.name, avg(cast(Comments.grade as float)), COUNT(Comments.grade) FROM Product, Comments , store
WHERE product.sid = store.sid and Product.pid = Comments.pid and store.sid = 8
GROUP BY Product.pid, product.name.

--12) Print the User details who has placed the most expensive amount of Order
SELECT name, users.userid, totalamount 
FROM Users,payment,creditcard,Orders 
WHERE Totalamount=(SELECT max(TOTALAMOUNT)FROM orders) AND payment.creditcardnumber = creditcard.cardnumber and payment.ordernumber=Orders.ordernumber and creditcard.userid=users.userid

--13) Update the payment state of orders to unpaid which created after year 2017 and with total amount greater than 50.  
UPDATE Orders
SET paymentState = 'Unpaid'
WHERE creationTime > '2017-01-01' AND totalAmount > 50;
select * from orders




