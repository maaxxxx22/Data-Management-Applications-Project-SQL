CREATE SCHEMA test2;
USE test2;

CREATE TABLE coffee_shop (
  shop_id INTEGER NOT NULL,
  shop_name varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state varchar(2) NOT NULL,
  PRIMARY KEY (shop_id)
);

CREATE TABLE employee (
  employee_id INTEGER NOT NULL,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  hire_date date NOT NULL,
  job_title varchar(30) NOT NULL,
  shop_id INTEGER NOT NULL,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (shop_id) REFERENCES coffee_shop(shop_id )
);

CREATE TABLE supplier (
  supplier_id INTEGER NOT NULL,
  company_name varchar(50) NOT NULL,
  country varchar(30) NOT NULL,
  sales_contact_name varchar(60) NOT NULL,
  email varchar(50) NOT NULL,
  PRIMARY KEY (supplier_id)
);

CREATE TABLE coffee (
  coffee_id INTEGER NOT NULL,
  shop_id INTEGER NOT NULL,
  supplier_id INTEGER NOT NULL,
  coffee_name varchar(30) NOT NULL,
  price_per_pound NUMERIC(5,2) NOT NULL,
  PRIMARY KEY (coffee_id),
  FOREIGN KEY (shop_id) REFERENCES coffee_shop(shop_id ),
  FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);


INSERT INTO coffee_shop (shop_id, shop_name, city, state) 
VALUES(1, 'Weinsteins Coffee Shop', 'Ithaca', 'NY');
INSERT INTO coffee_shop (shop_id, shop_name, city, state) 
VALUES(2, 'Homers Brew', 'Springfield', 'OR');
INSERT INTO coffee_shop (shop_id, shop_name, city, state) 
VALUES(3, 'Coffee Queens', 'Beverly Hills', 'CA');



INSERT INTO employee (employee_id, first_name, last_name, hire_date, job_title, shop_id) 
VALUES(1, 'Harvey', 'Weinstein', '1899-02-03', 'Manager', 1);
INSERT INTO employee (employee_id, first_name, last_name, hire_date, job_title, shop_id) 
VALUES(2, 'Homer', 'Simpson', '1995-12-24', 'Manager', 2);
INSERT INTO employee (employee_id, first_name, last_name, hire_date, job_title, shop_id) 
VALUES(3, 'Michelle', 'Rodriguez', '2011-08-21', 'Manager', 3);



INSERT INTO supplier (supplier_id, company_name, country, sales_contact_name, email) 
VALUES(1, 'McCullagh Coffee', 'U.S.A', 'Sully Sullivan', 'youvebeensullied@mail.com');
INSERT INTO supplier (supplier_id, company_name, country, sales_contact_name, email) 
VALUES(2, 'Yu Cha Corp', 'china', 'Yao Ming', 'stole_your_coffee@ymail.com');
INSERT INTO supplier (supplier_id, company_name, country, sales_contact_name, email) 
VALUES(3, 'Africa Merchants Ltd', 'Nigeria', 'Michael Boulos', 'african_coffee@conmail.com');



INSERT INTO coffee (coffee_id, shop_id, supplier_id, coffee_name, price_per_pound) 
VALUES(1, 1, 1, 'Celtic Green', 30);
INSERT INTO coffee (coffee_id, shop_id, supplier_id, coffee_name, price_per_pound) 
VALUES(2, 2, 2, 'Wu Lao', 11);
INSERT INTO coffee (coffee_id, shop_id, supplier_id, coffee_name, price_per_pound) 
VALUES(3, 3, 3, 'Wild Savannah 3', 15);


SELECT * FROM coffee_shop;



SELECT * FROM employee;




SELECT * FROM supplier;




SELECT * FROM coffee;



CREATE VIEW Employee_View AS
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS employee_full_name,
	   hire_date, job_title,shop_id
FROM employee;



SELECT * FROM Employee_View;


CREATE INDEX idx_coffeename ON coffee (coffee_name);




SELECT * FROM employee WHERE hire_date < '1900-01-01';



SELECT
  coffee_shop.shop_name,
  coffee.coffee_name,
  supplier.sales_contact_name,
  supplier.email
FROM coffee_shop
JOIN coffee
  ON coffee_shop.shop_id = coffee.shop_id
JOIN supplier
  ON supplier.supplier_id = coffee.supplier_id;




