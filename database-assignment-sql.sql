CREATE DATABASE Inventory
-- 2(a)
CREATE TABLE Users (
id INT NOT NULL AUTO_INCREMENT ,
Name VARCHAR(255) NOT NULL, 
Address VARCHAR(255) NOT NULL,
Password VARCHAR(255) NOT NULL,
Email VARCHAR(255),
Created_at datetime DEFAULT CURRENT_TIMESTAMP,
Phone_number VARCHAR(255),
Sex ENUM('Male','Female'),
PRIMARY KEY (id)
);



CREATE TABLE Role(
id INT NOT NULL AUTO_INCREMENT,
Role VARCHAR(255) NOT NULL,
Users_id INT NOT NULL,
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (Users_id) REFERENCES Users(id)
)

CREATE TABLE Items(
id INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(255) NOT NULL,
Price FLOAT  NOT NULL,
Size VARCHAR(255) NOT NULL,
Description VARCHAR(255),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id)
);


 CREATE TABLE Users_Items (
id INT NOT NULL AUTO_INCREMENT,
Users_id INT  NOT NULL,
Items_id INT NOT NULL,
PRIMARY KEY(id),
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (Users_id) REFERENCES Users(id),
 FOREIGN KEY (Items_id) REFERENCES Items(id)
 );

CREATE TABLE Category (
id INT NOT NULL AUTO_INCREMENT,
Category VARCHAR(255) NOT NULL,
Items_id INT ,
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (Items_id) REFERENCES Items(id)
);

CREATE TABLE Item_Stock(
id INT NOT NULL AUTO_INCREMENT,
Item_Quantity VARCHAR(255) NOT NULL,
Category_id INT  NOT NULL,
Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
Updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (Category_id) REFERENCES Category(id)
);

CREATE TABLE Order_Item (
id INT NOT NULL AUTO_INCREMENT,
Order_Date DATE NOT NULL,
Updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
Users_id INT NOT NULL,
Items_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (Users_id) REFERENCES Users(id),
FOREIGN KEY (Items_id) REFERENCES Items(id)
);

CREATE TABLE User_Order_item(
id INT NOT NULL AUTO_INCREMENT,
Order_item_id INT NOT NULL,
Users_id INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (Order_item_id) REFERENCES Order_Item(id),	
FOREIGN KEY (Users_id) REFERENCES Users(id)
)

CREATE TABLE Item_User_item(
id INT NOT NULL AUTO_INCREMENT,
Order_item_id INT NOT NULL,
Items_id INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (Order_item_id) REFERENCES Order_Item(id),	
FOREIGN KEY (Items_id) REFERENCES Items(id)
);


CREATE TABLE Order_Details(
id INT NOT NULL AUTO_INCREMENT,
Order_Quantity INT NOT NULL,
Expected_Date DATETIME,
Order_Item_id INT NOT NULL,
Users_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (Order_Item_id) REFERENCES Order_Item(id),
FOREIGN KEY (Users_id) REFERENCES Users(id)

);


CREATE TABLE Supplier(
id INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(255) NOT NULL,
Address VARCHAR(255) NOT NULL,
Order_Details_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (Order_Details_id) REFERENCES Supplier(id)
);

CREATE TABLE Deliver(
id INT NOT NULL AUTO_INCREMENT,
Deliver_Date DATETIME NOT NULL,
Item_Id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (Item_Id) REFERENCES Items(id)

)

CREATE TABLE Deliver_Details(
id INT NOT NULL AUTO_INCREMENT,
Deliver_Quantities VARCHAR(255) NOT NULL,
Deliver_Date DATETIME NOT NULL,
Deliver_id INT NOT NULL,
Created_at DATETIME DEFAULT  CURRENT_TIMESTAMP,
PRIMARY KEY(id),
FOREIGN KEY (Deliver_id) REFERENCES Deliver(id)
);

CREATE TABLE Customer(
id INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(255) NOT NULL,
Address VARCHAR(255) NOT NULL,
Deliver_Details_Id INT NOT NULL,
Users_Id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (Deliver_Details_Id) REFERENCES Deliver_details(id),
FOREIGN KEY (Users_Id) REFERENCES Users(id)
);




-- 2 (b) Inserting Record
INSERT INTO Users 
(id,Name,Address,Password, Email, Created_at,Phone_number,Sex ) 
 VALUES (1, 'John', 'Lagos', 'john', 'john@gmail.com',now(), '07056555565','Male' );
INSERT INTO Users 
(id,Name,Address, Password, Email,Created_at, Phone_number, Sex)
 VALUES(2,'james','Abuja','james','james@gmail.com', now(),'09044365666','Male');


 INSERT INTO Role 
(id,Role,Users_id, Created_at)
 VALUES(1,'Admin', 2 ,now()),
 ( 2,'user',1,now()); 

 INSERT INTO Items (id,Name,Price,Size,Description,Created_at)
VALUES(1,'Shoe',15000.00,'45','black suade',now()),
(2,'Socks',350.00,'extra-large','Cotton',now());


INSERT INTO Users_Items (id,Users_id,Items_id,Created_at)
VALUES(1,2,1,now()),
(2,1,2,now());


INSERT INTO Category (id,Category,Items_id,Created_at)
VALUES(1,'Suade',1,now()),
(2,'Cotton',2,now());

INSERT INTO Item_Stock (id,Item_Quantity,Category_id,Created_at)
VALUES(1,'500pcs',2,now()),
(2,'100pcs',1,now());

INSERT INTO Order_Item (id,Order_Date,Updated_at,Users_id,Items_id)
VALUES(1,'2023-09-09',now(),1,2),
(2,'2023-09-09',now(),2,1);


INSERT  INTO User_Order_item(id,Order_item_id,Users_id)
VALUES(1,2,1),
(2,1,2);

INSERT INTO Item_User_item (id,Order_item_id,Items_id)
VALUES(1,1,2),
(2,2,1);

INSERT INTO Order_Details (id,Order_Quantity,Expected_Date,Order_Item_id,Users_Id)
VALUES(1,20,'2023-09-20',1,1),
(2,40,'2023-09-24',2,1);

INSERT INTO Supplier (id,Name,Address,Order_Details_id)
VALUES(1,'Joan','rivers',2),
(2,'Paul','benin',1);

INSERT INTO Deliver (id,Deliver_Date,Item_Id)
VALUES(1,'2023-10-12',1),
(2,'2023-12-11',2);

INSERT INTO Deliver_Details (id,Deliver_Quantities,Deliver_Date,Deliver_id,Created_at)
VALUES(1,'23','2023-10-12',2,now()),
(2,'333','2023-11-02',1,now());

INSERT Customer(id,Name,Address,Deliver_Details_Id,Users_Id)
VALUES(1,'Samuel','Abija',1,2),
(2,'obo','edo',2,1);

-- 2 (c) Getting Records from the entity
SELECT * FROM  Items;
SELECT Name, Address, Email FROM Users;
SELECT Name,Address FROM Supplier WHERE id= 1;

-- 2 (d) Updating the records of an  entity
UPDATE Customer
SET Name = 'Samuel'
WHERE id = 1;

UPDATE Users
SET Phone_number = '070789895544',
Address = 'Abia'
WHERE id = 2;

-- 2 (e) Deleting record from entity
DELETE FROM  Role
WHERE id = 2;

DELETE FROM Users_Items
WHERE Users_id =2;
