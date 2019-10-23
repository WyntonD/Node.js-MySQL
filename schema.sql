CREATE DATABASE bamazon_db;
USE bamazon_db;

-- Create a table called 'products' which will contain the store inventory --
CREATE TABLE products (
	item_id INT NOT NULL,
	product_name VARCHAR(30) NOT NULL,
	department_name VARCHAR(20) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	stock_quantity INTEGER(11) NOT NULL,
	PRIMARY KEY (item_id)
);


-- Insert data into the 'products' table --
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES  ('Virgil Abloh ArtBook', 'Book', 55.00, 30),
		('Fossil Watch', 'Apparel', 80.00, 12),
		('Apple MacBook', 'Technology', 1000.00, 100),
		('Nike Slides', 'Footwear', 50.00, 20),
		('Beat Headphones', 'Audio',150.00, 9),
		('Portable Charger', 'Technology', 35.50, 200),
		('Logitech Speakers', 'Audio', 155.00, 4),
		('Banana', 'Grocery', 3.00, 150),
		('Lamp', 'Furniture', 25.00, 100),
		('Toaster', 'Appliances', 25.75, 50),
		('Mirror', 'Furniture', 20, 14),
		('Vacuum Cleaner', 'Appliances', 40.00, 150);

