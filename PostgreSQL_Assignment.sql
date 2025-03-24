-- Active: 1742206811194@@127.0.0.1@5432@bookstore_db
--Database creation using the given name bookstore_db
CREATE DATABASE bookstore_db


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





