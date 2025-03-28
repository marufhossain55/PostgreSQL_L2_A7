
--Database creation using the given name bookstore_db
CREATE DATABASE bookstore_db

-- to see if i am in the correct database
SELECT current_database();
-- .sql file creation for query named PostgreSQL_Assignment.sql


-- 1. Create a "books" table with the following fields:

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL, 
    author VARCHAR(255) NOT NULL, 
    price DECIMAL(10, 2) CHECK (price >= 0), 
    stock INT CHECK (stock >= 0),
    published_year INT 
);

-- 2️. Create a "customers" table with the following fields:

CREATE TABLE customers (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL, 
    joined_date DATE DEFAULT CURRENT_DATE 
);


-- 3️. Create an "orders" table with the following fields:

CREATE TABLE orders (
    id SERIAL PRIMARY KEY, 
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE, 
    book_id INT REFERENCES books(id) ON DELETE CASCADE, 
    quantity INT CHECK (quantity > 0), 
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


 -- books Table data insertion 
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Black Coat', 'Neamat Imam', 30.00, 10, 2013),
('Bangladesh: A Legacy of Blood', 'Anthony Mascarenhas', 45.00, 7, 1986),
('The Good Muslim', 'Tahmima Anam', 28.00, 12, 2011),
('A Golden Age', 'Tahmima Anam', 32.00, 9, 2007),
('The Liberation of Bangladesh', 'Maj Gen Sukhwant Singh', 50.00, 5, 1980),
('Ekattorer Dinguli', 'Jahanara Imam', 22.00, 20, 1986),
('The Bengal Delta: Ecology, State and Social Change', 'Iftekhar Iqbal', 40.00, 3, 2010),
('River of Life', 'Kazi Nazrul Islam', 18.00, 25, 1922),
('The Art of Kantha Embroidery', 'Niaz Zaman', 35.00, 8, 1993),
('The River and the Railroad', 'Iftekhar Iqbal', 38.00, 6, 2015);

 -- customers Table data insertion 

 INSERT INTO customers (name, email, joined_date) VALUES
('Abdul Rahman', 'abdul.rahman@email.com', '2023-01-10'),
('Fatima Begum', 'fatima.begum@email.com', '2022-05-15'),
('Mohammad Ali', 'mohammad.ali@email.com', '2023-06-20'),
('Ayesha Akter', 'ayesha.akter@email.com', '2021-11-25')

 -- orders Table data insertion 
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, '2024-03-10'), 
(2, 1, 1, '2024-02-20'), 
(1, 3, 2, '2024-03-05'), 
(3, 4, 1, '2024-01-15'), 
(4, 5, 3, '2024-02-01'); 

-- 1️. Find books that are out of stock.

SELECT title FROM books WHERE stock = 0;

-- 2️. Retrieve the most expensive book in the store.

SELECT * FROM books WHERE price = (SELECT MAX(price) FROM books);

-- 3️. Find the total number of orders placed by each customer.

SELECT name,  
(SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.id) 
AS total_orders
FROM customers c
ORDER BY total_orders DESC;

-- 4️. Calculate the total revenue generated from book sales.

SELECT SUM((SELECT price FROM books WHERE id = o.book_id) * o.quantity) 
AS total_revenue
FROM orders o;


-- 5️. List all customers who have placed more than one order.SELECT c.name, COUNT(o.id) AS orders_count
SELECT c.name, COUNT(o.id) AS orders_count
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name
HAVING COUNT(o.id) > 1
ORDER BY orders_count DESC;


-- 6️. Find the average price of books in the store.
SELECT ROUND(AVG(price), 2) AS avg_book_price
FROM books;


-- 7️. Increase the price of all books published before 2000 by 10%.(No table output, but affected rows will be removed accordingly.)

-- if you want to show the table after updating just run select * from books

UPDATE books
SET price = price * 1.10
WHERE published_year < 2000;

--8️. Delete customers who haven't placed any orders.
DELETE FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
