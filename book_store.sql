CREATE TABLE `Employee` (
	`employee_id` INT(11) NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`position` varchar(15) NOT NULL,
	`employment_date` DATE NOT NULL,
	`manager_id` INT(11),
	`email` varchar(50) NOT NULL,
	`phone_number` INT(12) NOT NULL,
	`salary` FLOAT NOT NULL,
	`bonus` FLOAT,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `Book` (
	`book_id` INT NOT NULL,
	`ISBN` INT NOT NULL,
	`title` varchar(60) NOT NULL,
	`genre` varchar(100) NOT NULL,
	`price` FLOAT NOT NULL,
	`quantity_in_stock` INT,
	`year_of_publication` INT NOT NULL,
	`publisher_id` INT NOT NULL,
	`author_id` INT NOT NULL,
	`book_type` varchar(60) NOT NULL,
	`language` INT(20) NOT NULL,
	PRIMARY KEY (`book_id`)
);

CREATE TABLE `Publisher` (
	`publisher_id` INT NOT NULL,
	`name` varchar(50) NOT NULL,
	`year_of_establishment` INT NOT NULL,
	`country` varchar(25) NOT NULL,
	PRIMARY KEY (`publisher_id`)
);

CREATE TABLE `Author` (
	`autor_id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`country_of_birth` varchar(30) NOT NULL,
	PRIMARY KEY (`autor_id`)
);

CREATE TABLE `Order` (
	`order_id` INT(11) NOT NULL AUTO_INCREMENT,
	`invoice_id` varchar(8) NOT NULL,
	`book_id` INT(11) NOT NULL,
	`order_datetime` DATETIME NOT NULL,
	`quantity` INT(11) NOT NULL,
	PRIMARY KEY (`order_id`)
);

CREATE TABLE `Customer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`address_id` INT NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`phone_number` INT(12) NOT NULL,
	`email` varchar(50) NOT NULL,
	`discount` INT(2),
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `Address` (
	`address_id` INT NOT NULL AUTO_INCREMENT,
	`customer_id` INT NOT NULL,
	`country` varchar(25) NOT NULL,
	`region` varchar(25) NOT NULL,
	`city` varchar(25) NOT NULL,
	`street` varchar(25) NOT NULL,
	`house` INT NOT NULL,
	PRIMARY KEY (`address_id`)
);

CREATE TABLE `Invoice` (
	`invoice_id` varchar(8) NOT NULL AUTO_INCREMENT,
	`employee_id` INT(11) NOT NULL,
	`customer_id` INT(11) NOT NULL,
	`payment_method` INT(11) NOT NULL,
	`transaction_moment` DATETIME NOT NULL,
	`status` varchar(10) NOT NULL,
	PRIMARY KEY (`invoice_id`)
);

ALTER TABLE `Employee` ADD CONSTRAINT `Employee_fk0` FOREIGN KEY (`manager_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Book` ADD CONSTRAINT `Book_fk0` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher`(`publisher_id`);

ALTER TABLE `Book` ADD CONSTRAINT `Book_fk1` FOREIGN KEY (`author_id`) REFERENCES `Author`(`autor_id`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice`(`invoice_id`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk1` FOREIGN KEY (`book_id`) REFERENCES `Book`(`book_id`);

ALTER TABLE `Customer` ADD CONSTRAINT `Customer_fk0` FOREIGN KEY (`address_id`) REFERENCES `Address`(`address_id`);

ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_fk0` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_fk1` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`);









