-- Create the necessary tables

-- Table: Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

-- Table: Items
CREATE TABLE Items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    size ENUM('small', 'medium', 'large') NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Table: Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_type ENUM('admin', 'user') NOT NULL
);

-- Table: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    item_id INT NOT NULL,
    order_status ENUM('pending', 'approved', 'disapproved') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);

-- Insert sample data into Categories and Items tables

INSERT INTO Categories (category_name) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home Appliances');

INSERT INTO Items (item_name, price, size, category_id) VALUES
    ('Smartphone', 499.99, 'medium', 1),
    ('Laptop', 899.99, 'large', 1),
    ('T-shirt', 19.99, 'medium', 2),
    ('Jeans', 39.99, 'large', 2),
    ('Microwave Oven', 149.99, 'medium', 3);

-- Retrieve records from multiple entities (e.g., items and categories)

SELECT Items.item_name, Items.price, Items.size, Categories.category_name
FROM Items
INNER JOIN Categories ON Items.category_id = Categories.category_id;

-- Update records in multiple entities (e.g., update the price of an item and its category)

UPDATE Items
SET price = 549.99, category_id = 2
WHERE item_name = 'Smartphone';

-- Delete records from multiple entities (e.g., delete an item and its associated orders)

DELETE FROM Items
WHERE item_name = 'Microwave Oven';

DELETE FROM Orders
WHERE item_id NOT IN (SELECT item_id FROM Items);