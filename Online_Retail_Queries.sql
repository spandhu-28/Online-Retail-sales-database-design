Table creation queries

-- Customers Table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT UNIQUE,
    phone TEXT,
    address TEXT
);

-- Products Table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    category TEXT,
    price REAL,
    stock INTEGER,
    carbon_footprint REAL
);

-- Orders Table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    order_date TEXT,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order Items Table
CREATE TABLE Order_Items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    price REAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    payment_date TEXT,
    amount REAL,
    payment_method TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


Insertion queries

INSERT INTO Customers (name, email, phone, address) VALUES
('Spandana', 'spandana@email.com', '9876543210', 'Bangalore'),
('Ravi', 'ravi@email.com', '9123456789', 'Mysore');

INSERT INTO Products (name, category, price, stock, carbon_footprint) VALUES
('Eco Bottle', 'Sustainable', 299, 50, 1.2),
('Reusable Bag', 'Eco', 199, 100, 0.5),
('Bamboo Toothbrush', 'Eco', 99, 200, 0.2);

INSERT INTO Orders (customer_id, order_date, status) VALUES
(1, '2026-03-01', 'Delivered'),
(2, '2026-03-02', 'Shipped');

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 299),
(2, 3, 1, 99);

INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES
(1, '2026-03-01', 598, 'UPI'),
(2, '2026-03-02', 99, 'Card');


Select queries

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Payments;


SELECT c.name, o.order_id, o.status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

SELECT SUM(amount) AS total_sales FROM Payments;


SELECT p.name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

SELECT name, stock FROM Products WHERE stock < 50;