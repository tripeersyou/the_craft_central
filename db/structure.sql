DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ar_internal_metadata`;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `beginning_inventory_products`;

CREATE TABLE `beginning_inventory_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `ending_inventory_id` bigint(20) DEFAULT NULL,
  `price` decimal(2,0) NOT NULL,
  `cost` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_beginning_inventory_products_on_product_id` (`product_id`),
  KEY `index_beginning_inventory_products_on_ending_inventory_id` (`ending_inventory_id`),
  CONSTRAINT `fk_rails_90683eef0d` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_d7dcf11baf` FOREIGN KEY (`ending_inventory_id`) REFERENCES `ending_inventories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `deliveries`;

CREATE TABLE `deliveries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) DEFAULT NULL,
  `total_items` int(11) NOT NULL,
  `total_cost` decimal(2,0) NOT NULL,
  `total_price` decimal(2,0) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deliveries_on_store_id` (`store_id`),
  CONSTRAINT `fk_rails_2bc2aaf559` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `delivery_products`;

CREATE TABLE `delivery_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `delivery_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(2,0) NOT NULL,
  `cost` decimal(2,0) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_delivery_products_on_delivery_id` (`delivery_id`),
  KEY `index_delivery_products_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_30728471b1` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`),
  CONSTRAINT `fk_rails_eabf57a855` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ending_inventories`;

CREATE TABLE `ending_inventories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) DEFAULT NULL,
  `sales` decimal(2,0) DEFAULT NULL,
  `cogs` decimal(2,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ending_inventories_on_store_id` (`store_id`),
  CONSTRAINT `fk_rails_02635e5413` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ending_inventory_products`;

CREATE TABLE `ending_inventory_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `ending_inventory_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ending_inventory_products_on_product_id` (`product_id`),
  KEY `index_ending_inventory_products_on_ending_inventory_id` (`ending_inventory_id`),
  CONSTRAINT `fk_rails_0be61c9f76` FOREIGN KEY (`ending_inventory_id`) REFERENCES `ending_inventories` (`id`),
  CONSTRAINT `fk_rails_218b651e01` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_products`;

CREATE TABLE `order_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_products_on_order_id` (`order_id`),
  KEY `index_order_products_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_96c0709f78` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_f40b8ccee4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) DEFAULT NULL,
  `total_items` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_supplier_id` (`supplier_id`),
  CONSTRAINT `fk_rails_d426350910` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `description` text,
  `limit` int(11) NOT NULL,
  `price` decimal(2,0) NOT NULL,
  `cost` decimal(2,0) NOT NULL,
  `inventory` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_products_on_sku` (`sku`),
  KEY `index_products_on_brand_id` (`brand_id`),
  CONSTRAINT `fk_rails_f3b4d49caa` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pullout_products`;

CREATE TABLE `pullout_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pullout_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(2,0) NOT NULL,
  `cost` decimal(2,0) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pullout_products_on_pullout_id` (`pullout_id`),
  KEY `index_pullout_products_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_ab32f531e7` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_d39ab2faf0` FOREIGN KEY (`pullout_id`) REFERENCES `pullouts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pullouts`;

CREATE TABLE `pullouts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) DEFAULT NULL,
  `total_items` int(11) NOT NULL,
  `total_cost` decimal(2,0) NOT NULL,
  `total_price` decimal(2,0) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pullouts_on_store_id` (`store_id`),
  CONSTRAINT `fk_rails_387edf3bad` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `staffs`;

CREATE TABLE `staffs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_staffs_on_email` (`email`),
  UNIQUE KEY `index_staffs_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `store_products`;

CREATE TABLE `store_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `inventory` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_store_products_on_store_id` (`store_id`),
  KEY `index_store_products_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_814f36e860` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_f80750e323` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `stores`;

CREATE TABLE `stores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` text,
  `email` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT '',
  `contact_number` varchar(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `supplier_products`;

CREATE TABLE `supplier_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_supplier_products_on_supplier_id` (`supplier_id`),
  KEY `index_supplier_products_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_8e1c65b71a` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `fk_rails_9a363579c5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `transfer_products`;

CREATE TABLE `transfer_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transfer_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transfer_products_on_transfer_id` (`transfer_id`),
  KEY `index_transfer_products_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_9899e2357d` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_b02108c5c4` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `transfers`;

CREATE TABLE `transfers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_to_id` bigint(20) DEFAULT NULL,
  `store_from_id` bigint(20) DEFAULT NULL,
  `pullout_id` bigint(20) DEFAULT NULL,
  `delivery_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transfers_on_store_to_id` (`store_to_id`),
  KEY `index_transfers_on_store_from_id` (`store_from_id`),
  KEY `index_transfers_on_pullout_id` (`pullout_id`),
  KEY `index_transfers_on_delivery_id` (`delivery_id`),
  CONSTRAINT `fk_rails_6b7ab047f0` FOREIGN KEY (`store_to_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `fk_rails_a658be5735` FOREIGN KEY (`store_from_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `fk_rails_e17d874424` FOREIGN KEY (`pullout_id`) REFERENCES `pullouts` (`id`),
  CONSTRAINT `fk_rails_e39f650b13` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `schema_migrations` (version) VALUES
('20180208235255'),
('20180208235317'),
('20180212080244'),
('20180212080251'),
('20180212080263'),
('20180212080273'),
('20180212080349'),
('20180212083250'),
('20180212083434'),
('20180212083741'),
('20180212084304'),
('20180212084826'),
('20180212085044'),
('20180212124737'),
('20180212125109'),
('20180212125216'),
('20180212125300'),
('20180212125448'),
('20180212125601');
