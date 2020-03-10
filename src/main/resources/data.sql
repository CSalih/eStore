INSERT INTO `Users` VALUES (1,0,1,'$2a$10$KJ3.GZShC9uV8u381dzk8uotNk5iBWZev4bhoBFMLL8dPGTQZX6mu','admin');
INSERT INTO `Users` VALUES (2,1,1,'$2a$10$FTGax/nv.Rod71CYDTpfReO.9jdUIbaYrTYQE6zVJwc62kL5jW0s2','salihcandir');
INSERT INTO `Users` VALUES (3,2,1,'$2a$10$1yhEfP5e4XQgYrvURhFMMOAfec7ND/VqeMV31a9bYB6kCIAsBvz0u','alberteinstein');

INSERT INTO `Authorities` VALUES (1,'ROLE_ADMIN','admin');
INSERT INTO `Authorities` VALUES (2,'ROLE_USER','salihcandir');
INSERT INTO `Authorities` VALUES (3,'ROLE_USER','alberteinstein');

INSERT INTO `BillingAddress` VALUES (1,'','','','','','',NULL,1);
INSERT INTO `BillingAddress` VALUES (2,'','','','','','',NULL,2);

INSERT INTO `Cart` VALUES (1,0,1);
INSERT INTO `Cart` VALUES (2,0,2);

INSERT INTO `Customer` VALUES (1,'salih.candir@student.uibk.ac.at','Salih Candir','',1,'$2a$10$FTGax/nv.Rod71CYDTpfReO.9jdUIbaYrTYQE6zVJwc62kL5jW0s2','salihcandir',1,1,NULL,1);
INSERT INTO `Customer` VALUES (2,'albert.einstein@example.com','Albert Einstein','',1,'$2a$10$1yhEfP5e4XQgYrvURhFMMOAfec7ND/VqeMV31a9bYB6kCIAsBvz0u','alberteinstein',2,2,NULL,2);

INSERT INTO `Product` VALUES (1,'Phone','new','Smartphone','Apple','iPhone 11 Pro - Gold 64GB',999,'active',10);
INSERT INTO `Product` VALUES (2,'Watch','new','Smartwatch','Apple','Apple Watch 5',399,'active',10);
INSERT INTO `Product` VALUES (3,'Laptop','new','Display: 16\", 3072x1920, 226dpi, 60Hz\r\nCPU: Intel Core i7-9750H, 6x 2.60GHz\r\n','Apple','MacBook Pro',2399,'active',5);
INSERT INTO `Product` VALUES (4,'Tablet','new','12.9-inch iPad Pro, Space Gray, 64GB','Apple','iPad Pro',999,'active',10);
INSERT INTO `Product` VALUES (5,'Headphones','new','Wireless Charging Case, H1 chip, Up to 5 hours of listening time','Apple','AirPods',199,'active',20);

INSERT INTO `ShippingAddress` VALUES (1,'','','','','','',NULL,1);
INSERT INTO `ShippingAddress` VALUES (2,'','','','','','',NULL,2);