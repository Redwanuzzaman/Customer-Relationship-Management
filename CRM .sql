CREATE TABLE `Organizations` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `lead_generation` varchar(255),
  `contact_person_name` varchar(255),
  `contact_person_phone` int,
  `assigned_employee` varchar(255)
);

CREATE TABLE `CRM_activities` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `type` varchar(255),
  `activity_date` datetime,
  `party_id` int,
  `party_name` varchar(255),
  `duration` timestamp,
  `assigned_employee_id` int,
  `assigned_employee_name` varchar(255),
  `product_id` int,
  `product_name` varchar(255),
  `issue` varchar(255),
  `status` varchar(255)
);

CREATE TABLE `Employees` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `email` email,
  `role` varchar(255),
  `phone` int,
  `assigned_organization` varchar(255)
);

CREATE TABLE `Products` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `stock_size` float,
  `unit_price` float
);

CREATE TABLE `Quotations` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `party_id` int,
  `party_name` varchar(255),
  `contact_person_name` varchar(255),
  `assigned_employee_id` int,
  `assigned_employee` varchar(255),
  `product_name` varchar(255),
  `quantity` float,
  `product_id` int,
  `price` float,
  `implementation_time` float,
  `date` date,
  `status` varchar(255)
);

ALTER TABLE `CRM_activities` ADD FOREIGN KEY (`assigned_employee_id`) REFERENCES `Employees` (`id`);

ALTER TABLE `Quotations` ADD FOREIGN KEY (`party_id`) REFERENCES `Organizations` (`id`);

ALTER TABLE `CRM_activities` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `CRM_activities` ADD FOREIGN KEY (`party_id`) REFERENCES `Organizations` (`id`);

ALTER TABLE `Quotations` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `Quotations` ADD FOREIGN KEY (`assigned_employee_id`) REFERENCES `Employees` (`id`);
