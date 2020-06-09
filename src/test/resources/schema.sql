-- test.Authorities definition

CREATE TABLE `Authorities` (
  `authoritiesId` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authoritiesId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


-- test.Product definition

CREATE TABLE `Product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productCategory` varchar(255) DEFAULT NULL,
  `productCondition` varchar(255) DEFAULT NULL,
  `productDescription` varchar(255) DEFAULT NULL,
  `productManufacturer` varchar(255) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` double NOT NULL,
  `productStatus` varchar(255) DEFAULT NULL,
  `unitInStock` int(11) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


-- test.Users definition

CREATE TABLE `Users` (
  `usersId` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


-- test.BillingAddress definition

CREATE TABLE `BillingAddress` (
  `billingAddressId` int(11) NOT NULL AUTO_INCREMENT,
  `apartmentNumber` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `streetName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `confirmedOrder_confirmedOrderId` int(11) DEFAULT NULL,
  `customer_customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`billingAddressId`),
  KEY `FKF0492D19C9326873` (`confirmedOrder_confirmedOrderId`),
  KEY `FKF0492D1936B7C582` (`customer_customerId`),
  CONSTRAINT `FKF0492D1936B7C582` FOREIGN KEY (`customer_customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `FKF0492D19C9326873` FOREIGN KEY (`confirmedOrder_confirmedOrderId`) REFERENCES `ConfirmedOrder` (`confirmedOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- test.Cart definition

CREATE TABLE `Cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `grandTotal` double NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  KEY `FK1FEF407B82E681` (`customerId`),
  CONSTRAINT `FK1FEF407B82E681` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- test.CartItem definition

CREATE TABLE `CartItem` (
  `cartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `cartId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  KEY `FK4393E73309700CF` (`productId`),
  KEY `FK4393E7329EA3985` (`cartId`),
  CONSTRAINT `FK4393E7329EA3985` FOREIGN KEY (`cartId`) REFERENCES `Cart` (`cartId`),
  CONSTRAINT `FK4393E73309700CF` FOREIGN KEY (`productId`) REFERENCES `Product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- test.ConfirmedOrder definition

CREATE TABLE `ConfirmedOrder` (
  `confirmedOrderId` int(11) NOT NULL AUTO_INCREMENT,
  `fulfillmentDate` date DEFAULT NULL,
  `grandTotal` double NOT NULL,
  `isFulfilled` tinyint(1) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`confirmedOrderId`),
  KEY `FK2AD1634F7B82E681` (`customerId`),
  KEY `FK2AD1634FD5C33C1D` (`shippingAddressId`),
  KEY `FK2AD1634F9F7DA697` (`billingAddressId`),
  CONSTRAINT `FK2AD1634F7B82E681` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `FK2AD1634F9F7DA697` FOREIGN KEY (`billingAddressId`) REFERENCES `BillingAddress` (`billingAddressId`),
  CONSTRAINT `FK2AD1634FD5C33C1D` FOREIGN KEY (`shippingAddressId`) REFERENCES `ShippingAddress` (`shippingAddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- test.ConfirmedOrderItem definition

CREATE TABLE `ConfirmedOrderItem` (
  `confirmedOrderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `confirmedOrderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`confirmedOrderItemId`),
  KEY `FKD1E41302A792E583` (`confirmedOrderId`),
  KEY `FKD1E41302309700CF` (`productId`),
  CONSTRAINT `FKD1E41302309700CF` FOREIGN KEY (`productId`) REFERENCES `Product` (`productId`),
  CONSTRAINT `FKD1E41302A792E583` FOREIGN KEY (`confirmedOrderId`) REFERENCES `ConfirmedOrder` (`confirmedOrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- test.Customer definition

CREATE TABLE `Customer` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `customerEmail` varchar(255) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `customerPhone` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `confirmedOrderId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  KEY `FK27FBE3FEA792E583` (`confirmedOrderId`),
  KEY `FK27FBE3FE29EA3985` (`cartId`),
  KEY `FK27FBE3FED5C33C1D` (`shippingAddressId`),
  KEY `FK27FBE3FE9F7DA697` (`billingAddressId`),
  CONSTRAINT `FK27FBE3FE29EA3985` FOREIGN KEY (`cartId`) REFERENCES `Cart` (`cartId`),
  CONSTRAINT `FK27FBE3FE9F7DA697` FOREIGN KEY (`billingAddressId`) REFERENCES `BillingAddress` (`billingAddressId`),
  CONSTRAINT `FK27FBE3FEA792E583` FOREIGN KEY (`confirmedOrderId`) REFERENCES `ConfirmedOrder` (`confirmedOrderId`),
  CONSTRAINT `FK27FBE3FED5C33C1D` FOREIGN KEY (`shippingAddressId`) REFERENCES `ShippingAddress` (`shippingAddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- test.CustomerOrder definition

CREATE TABLE `CustomerOrder` (
  `customerOrderId` int(11) NOT NULL AUTO_INCREMENT,
  `billingAddressId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`customerOrderId`),
  KEY `FKAEF781F029EA3985` (`cartId`),
  KEY `FKAEF781F07B82E681` (`customerId`),
  KEY `FKAEF781F0D5C33C1D` (`shippingAddressId`),
  KEY `FKAEF781F09F7DA697` (`billingAddressId`),
  CONSTRAINT `FKAEF781F029EA3985` FOREIGN KEY (`cartId`) REFERENCES `Cart` (`cartId`),
  CONSTRAINT `FKAEF781F07B82E681` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `FKAEF781F09F7DA697` FOREIGN KEY (`billingAddressId`) REFERENCES `BillingAddress` (`billingAddressId`),
  CONSTRAINT `FKAEF781F0D5C33C1D` FOREIGN KEY (`shippingAddressId`) REFERENCES `ShippingAddress` (`shippingAddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- test.ShippingAddress definition

CREATE TABLE `ShippingAddress` (
  `shippingAddressId` int(11) NOT NULL AUTO_INCREMENT,
  `apartmentNumber` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `streetName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `confirmedOrder_confirmedOrderId` int(11) DEFAULT NULL,
  `customer_customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`shippingAddressId`),
  KEY `FKBB1EE46C9326873` (`confirmedOrder_confirmedOrderId`),
  KEY `FKBB1EE4636B7C582` (`customer_customerId`),
  CONSTRAINT `FKBB1EE4636B7C582` FOREIGN KEY (`customer_customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `FKBB1EE46C9326873` FOREIGN KEY (`confirmedOrder_confirmedOrderId`) REFERENCES `ConfirmedOrder` (`confirmedOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;