SET REFERENTIAL_INTEGRITY FALSE;
INSERT INTO USERS VALUES (1,0,1,'$2a$10$KJ3.GZShC9uV8u381dzk8uotNk5iBWZev4bhoBFMLL8dPGTQZX6mu','admin');
INSERT INTO USERS VALUES (2,1,1,'$2a$10$FTGax/nv.Rod71CYDTpfReO.9jdUIbaYrTYQE6zVJwc62kL5jW0s2','customer');

INSERT INTO AUTHORITIES VALUES (1,'ROLE_ADMIN','admin');
INSERT INTO AUTHORITIES VALUES (2,'ROLE_USER','customer');

INSERT INTO PRODUCT VALUES (1,'Phone','new','Smartphone','Apple','iPhone 11 Pro - Gold 64GB',999,'active',10);
INSERT INTO PRODUCT VALUES (2,'Watch','new','Smartwatch','Apple','Apple Watch 5',399,'active',10);
INSERT INTO PRODUCT VALUES (3,'Laptop','new','Display: 16\", 3072x1920, 226dpi, 60Hz\r\nCPU: Intel Core i7-9750H, 6x 2.60GHz\r\n','Apple','MacBook Pro',2399,'active',5);
INSERT INTO PRODUCT VALUES (4,'Tablet','new','12.9-inch iPad Pro, Space Gray, 64GB','Apple','iPad Pro',999,'active',10);
INSERT INTO PRODUCT VALUES (5,'Headphones','new','Wireless Charging Case, H1 chip, Up to 5 hours of listening time','Apple','AirPods',199,'active',20);

INSERT INTO CUSTOMER VALUES (1,'customer@customer.at','customer Account','',1,'$2a$10$FTGax/nv.Rod71CYDTpfReO.9jdUIbaYrTYQE6zVJwc62kL5jW0s2','customer',1,1,NULL,1);

INSERT INTO BILLINGADDRESS VALUES (1,'','','','','','',NULL,1);

INSERT INTO SHIPPINGADDRESS VALUES (1,'','','','','','',NULL,1);

INSERT INTO CART VALUES (1,0,1);
SET REFERENTIAL_INTEGRITY TRUE;