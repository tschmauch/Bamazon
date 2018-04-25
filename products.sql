Drop Database IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products(
	item_id int(5) NOT NULL AUTO_INCREMENT,
	product_name NOT NULL varchar(20),
	department_name NOT NULL varchar(20),
	price DECIMAL(10,2),
	stock int(5),
	PRIMARY KEY (item_id)
);

--create initial product stock.
INSERT INTO products (product_name, department_name, price, stock)
VALUES ("candy", "grocery", 3.00, 100);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("movie", "electronics", 15.00, 100);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("ammunition", "sporting goods", 10.00, 200);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("cereal", "grocery", 3.00, 100);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("bread", "grocery", 2.50, 90);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("football", "sporting goods", 15.00, 25);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("video game", "electronics", 60.00, 50);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("battery", "electronics", 5.99, 150);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("dinner plate", "home decor", 4.99, 50);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("cups", "home decor", 4.99, 50);

INSERT INTO products (product_name, department_name, price, stock)
VALUES ("bottled water", "grocery", 10.25, 75);