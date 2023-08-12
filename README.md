# ELECTRONIC-ONLINE-SHOPPING-CART-DATABASE

## Project Description

This database is designed to manage users, products, reviews, carts, orders, and payments for an online shopping cart platform. It can be utilized to develop online shops and shopping cart-based websites or applications. The database includes various entities and relationships, which can be visualized through an ER diagram. The main functionality of the database allows users to search and add products to their shopping cart, make payments, and place orders.

## Database Description

### Entities and Attributes

The following entities will be stored in tables of a relational database:

1. User: [User (userid, name, phoneNum)]
   - Users are individuals who have registered an account on the website.
   - Each user has a unique userid, name, and phone number.

2. Buyer: [Buyer (userid)]
   - Buyers are users who make purchases on the website.
   - Each buyer is associated with a user.

3. Seller: [Seller (userid)]
   - Sellers are users who have opened their own online stores on the website.
   - Sellers are associated with a user and have additional attributes related to their store.

4. Bank Card: [Bank Card (cardNumber, bank, expirydate)]
   - Bank cards can be either credit cards or debit cards.
   - Bank cards are used for payments made by buyers or received by sellers.
   - Each bank card has a unique card number, bank, and expiry date.

5. Credit Card: [Credit Card (cardNumber, organization)]
   - Credit cards are a subcategory of bank cards.
   - Credit cards have additional attributes, such as the organization issuing the card.

6. Debit Card: [Debit Card (cardNumber)]
   - Debit cards are a subcategory of bank cards.
   - Debit cards have the same attributes as bank cards.

7. Store: [Store (sid, name, startTime, customerGrade, streetaddr, city, province)]
   - Stores are online shops managed by sellers.
   - Each store has a unique store ID (sid), name, start time, customer grade, and address details.

8. Product: [Product (pid, name, type, inventory, price, colour, customerReview, modelNumber)]
   - Products are items sold by sellers.
   - Each product has a unique product ID (pid) and attributes such as name, type, inventory, price, etc.
   
9. Order Item: [Order Item (itemid, price, creationTime)]
   - Order items represent products that have been ordered by a buyer but not yet paid for.
   - Each order item has a unique item ID (itemid), price, and creation time.

10. Order: [Order (orderNumber, creationTime, PaymentStatus, totalAmount)]
    - Orders contain a list of products that a buyer has ordered.
    - Each order has a unique order number, creation time, payment status, and total amount.

11. Address: [Address (addrid, name, city, postalCode, streetaddr, province, contactPhoneNumber)]
    - Addresses are locations to which purchased products are delivered.
    - Each address has a unique address ID (addrid) and attributes such as name, city, postal code, street address, province, and contact phone number.

### Relationships

The database includes the following relationships:

1. Credit Card Ownership: A credit card is owned by a buyer. (one-to-many)
2. Debit Card Ownership: A debit card is owned by a seller. (one-to-many)
3. Manage: A store is managed by a seller. (one-to-many)
4. Sell: A product is sold by one store. (one-to-many)
5. Save to Shopping Cart: A buyer saves a product to the shopping cart. (many-to-many)
6. Reflection: An order item corresponds to a product. (one-to-many)
7. Contain: An order item is contained in an order. (one-to-many)
8. Deliver to: An order is delivered to an address. (one-to-many)
9. Payment: An order is paid by a credit card, and a debit card receives payment from an order. (ternary one-to-many-many)
10. Address Ownership: An address is owned by a buyer. (one-to-many)

## ER Diagram

![Er Diagram final1 ](https://github.com/PriyanshuKadam/ELECTRONIC-ONLINE-SHOPPING-CART-DATABASE/assets/142070169/558ca4e4-a598-4082-8c75-ae043e3f58e5)


Please note that the diagram is a visual representation of the entities and relationships described above.
