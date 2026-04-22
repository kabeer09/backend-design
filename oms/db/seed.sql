INSERT INTO users (name, email, city) VALUES
('Amit Sharma','amit@gmail.com','Delhi'),
('Ravi Kumar','ravi@gmail.com','Mumbai'),
('Sneha Singh','sneha@gmail.com','Lucknow'),
('Priya Verma','priya@gmail.com','Jaipur'),
('Rahul Yadav','rahul@gmail.com','Delhi'),
('Anjali Gupta','anjali@gmail.com','Mumbai'),
('Vikas Mehta','vikas@gmail.com','Pune'),
('Neha Kapoor','neha@gmail.com','Delhi'),
('Arjun Das','arjun@gmail.com','Bhopal'),
('Kiran Joshi','kiran@gmail.com','Mumbai');





INSERT INTO products (name, stock, price) VALUES
('Laptop', 10, 50000.00),
('Mobile', 20, 20000.00),
('Headphones', 30, 2000.00),
('Keyboard', 25, 1500.00),
('Mouse', 40, 800.00),
('Monitor', 15, 12000.00),
('Printer', 8, 7000.00),
('Tablet', 12, 18000.00),
('Camera', 5, 45000.00),
('Speaker', 18, 3000.00);



INSERT INTO orders (uid, pid, quantity, total_amount, status) VALUES
(1,1,1,50000.00,'PENDING'),
(2,2,2,40000.00,'COMPLETED'),
(3,3,3,6000.00,'PENDING'),
(4,4,1,1500.00,'SHIPPED'),
(5,5,2,1600.00,'PENDING'),
(6,6,1,12000.00,'COMPLETED'),
(7,7,1,7000.00,'CANCELLED'),
(8,8,2,36000.00,'PENDING'),
(9,9,1,45000.00,'SHIPPED'),
(10,10,3,9000.00,'COMPLETED');