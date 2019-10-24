DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;

CREATE TABLE bam_products (
	item_id INT(11) NOT NULL,
	product_name VARCHAR(30) NOT NULL,
	department_name VARCHAR(20) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	stock_quantity INTEGER(11) NOT NULL,
	PRIMARY KEY (item_id)
);

INSERT INTO bam_products (item_id, product_name, department_name, price, stock_quantity)
VALUES  (1,'Virgil Abloh ArtBook', 'Book', 55.00, 30),
		('Fossil Watch', 'Apparel', 80.00, 12),
		('Apple MacBook', 'Technology', 1000.00, 100),
		('Nike Slides', 'Footwear', 50.00, 20),
		('Beat Headphones', 'Audio',150.00, 9),
		('Portable Charger', 'Technology', 35.50, 200),
		('Logitech Speakers', 'Audio', 155.00, 4),
		('Banana', 'Grocery', 3.00, 150),
		('Lamp', 'Furniture', 25.00, 100),
		('Toaster', 'Appliances', 25.75, 50);


