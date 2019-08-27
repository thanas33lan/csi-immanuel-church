-- Thanaseelan 26-Aug-2019
INSERT INTO `resources` (`resource_id`, `display_name`) VALUES ('Admin\\Controller\\Customer', 'Manage Customer');
INSERT INTO `privileges` (`resource_id`, `privilege_name`, `display_name`) VALUES ('Admin\\Controller\\Customer', 'index', 'Access'), ('Admin\\Controller\\Customer', 'add', 'Add'), ('Admin\\Controller\\Customer', 'edit', 'Edit');
CREATE TABLE `customer` (
 `customer_id` int(11) NOT NULL AUTO_INCREMENT,
 `first_name` varchar(255) DEFAULT NULL,
 `last_name` varchar(255) DEFAULT NULL,
 `gender` varchar(255) DEFAULT NULL,
 `email` varchar(255) DEFAULT NULL,
 `phone` bigint(11) DEFAULT NULL,
 `alternate_phone` bigint(11) DEFAULT NULL,
 `church_name` varchar(255) DEFAULT NULL,
 `street_address` varchar(255) DEFAULT NULL,
 `address_line2` varchar(255) DEFAULT NULL,
 `city` varchar(255) DEFAULT NULL,
 `state` varchar(255) DEFAULT NULL,
 `pincode` bigint(11) DEFAULT NULL,
 `recceiver_name` varchar(255) DEFAULT NULL,
 `payment_status` varchar(255) DEFAULT NULL,
 `added_by` int(11) DEFAULT NULL,
 `added_on` datetime DEFAULT NULL,
 `customer_status` varchar(255) NOT NULL,
 PRIMARY KEY (`customer_id`),
 KEY `added_by` (`added_by`),
 CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;