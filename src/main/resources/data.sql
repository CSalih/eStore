INSERT INTO Users (customerId,enabled,password,username)
VALUES (0,1,'$2a$10$KJ3.GZShC9uV8u381dzk8uotNk5iBWZev4bhoBFMLL8dPGTQZX6mu','admin'),
(1,1,'$2a$10$FTGax/nv.Rod71CYDTpfReO.9jdUIbaYrTYQE6zVJwc62kL5jW0s2','salihcandir'),
(2,1,'$2a$10$1yhEfP5e4XQgYrvURhFMMOAfec7ND/VqeMV31a9bYB6kCIAsBvz0u','alberteinstein');

INSERT INTO Authorities (authority,username)
VALUES ('ROLE_ADMIN','admin'),
('ROLE_USER','salihcandir'),
('ROLE_USER','alberteinstein');

INSERT INTO Product (productCategory,productCondition,productDescription,productManufacturer,productName,productPrice,productStatus,unitInStock)
VALUES ('Phone','new','Smartphone','Apple','iPhone 11 Pro - Gold 64GB',999,'active',10),
('Watch','new','Smartwatch','Apple','Apple Watch 5',399,'active',10),
('Laptop','new','Display: 16", 3072x1920, 226dpi, 60Hz CPU: Intel Core i7-9750H, 6x 2.60GHz','Apple','MacBook Pro',2399,'active',5),
('Tablet','new','12.9-inch iPad Pro, Space Gray, 64GB','Apple','iPad Pro',999,'active',10),
('Headphones','new','Wireless Charging Case, H1 chip, Up to 5 hours of listening time','Apple','AirPods',199,'active',20);
