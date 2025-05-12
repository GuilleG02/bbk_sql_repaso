
CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;


CREATE TABLE User (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Category (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE Product (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    stock INT DEFAULT 0,
    id_category INT,
    FOREIGN KEY (id_category) REFERENCES Category(id)
);
ALTER TABLE Product ADD price DECIMAL(10,2) NOT NULL DEFAULT 0.00;


CREATE TABLE `Order` (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    id_user INT,
    id_product INT,
    order_date DATE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES User(id),
    FOREIGN KEY (id_product) REFERENCES Product(id)
);


INSERT INTO User (name, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('Ana Gómez', 'ana.gomez@example.com'),
('Carlos Rodríguez', 'carlos.rodriguez@example.com'),
('Laura Martín', 'laura.martin@example.com'),
('Pedro Sánchez', 'pedro.sanchez@example.com');

INSERT INTO Category (name) VALUES
('Electrónica'),
('Ropa');

INSERT INTO Product (name, stock, id_category, price) VALUES
('Smartphone', 100, 1, 299.99),
('Laptop', 50, 1, 799.99),
('Camiseta', 200, 2, 19.99),
('Jeans', 150, 2, 39.99),
('Auriculares', 80, 1, 49.99);

INSERT INTO `Order` (name, id_user, id_product, order_date) VALUES
('Pedido 1', 1, 1, '2025-05-01'),
('Pedido 2', 2, 2, '2025-05-02'),
('Pedido 3', 3, 3, '2025-05-03'),
('Pedido 4', 4, 4, '2025-05-04'),
('Pedido 5', 5, 5, '2025-05-05');


UPDATE Product
SET name = 'Nuevo_Nombre'
WHERE id = 3;

UPDATE Product
SET price = 50.00
WHERE id = 3;


SELECT * FROM Product
WHERE price > 20.00;

SELECT * FROM Product
ORDER BY price DESC;

SELECT Product.name, Product.price, Category.name
FROM Product
JOIN Category ON Product.id_category = Category.id;

SELECT User.name, `order`.name, `order`.order_date
FROM User
JOIN `order` ON User.id = `order`.id_user;

SELECT Product.name, Product.price, Category.name
FROM Product
JOIN Category ON Product.id_category = Category.id
WHERE Product.id = 2;

SELECT User.name, `order`.name, `order`.order_date
FROM User
JOIN `order` ON User.id = `order`.id_user
WHERE User.id = 3;


DELETE FROM Product
WHERE id = 20;

CREATE TABLE Reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    user_id INT,
    review TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
);

INSERT INTO Reviews (product_id, user_id, review) VALUES
(1, 1, 'Excelente producto, muy rápido y fácil de usar.'),
(2, 2, 'Laptop/portatil de buena calidad, pero la batería podría durar más.'),
(3, 3, 'La camiseta es muy cómoda y de buen material.'),
(4, 4, 'Los jeans tienen un buen ajuste y se ven geniales.'),
(5, 5, 'Los auriculares tienen un sonido increíble');

UPDATE Reviews
SET review = 'La camiseta es muy suave y de alta calidad. Me encanta cómo se ajusta.'
WHERE id = 3;

SELECT * FROM Reviews;

SELECT Product.name, Reviews.review
FROM Product
JOIN Reviews ON Product.id = Reviews.product_id;

SELECT Product.name, Reviews.review
FROM Product
JOIN Reviews ON Product.id = Reviews.product_id
WHERE Product.id = 2;

SELECT Product.name, Category.name, Reviews.review
FROM Product
JOIN Category ON Product.id_category = Category.id
JOIN Reviews ON Product.id = Reviews.product_id;

-- 5. Seleccionar un usuario y mostrar sus pedidos junto con los productos 
-- que contiene cada pedido

DELETE FROM Reviews
WHERE id = 3;


