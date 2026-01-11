-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 11, 2026 at 02:14 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'staff',
  `department` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT '25000.00',
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `full_name`, `email`, `phone`, `password`, `role`, `department`, `address`, `salary`, `status`, `created_at`) VALUES
(9, 'nurse_ann', 'Ann Perkins', 'ann.p@company.com', '555-0107', 'vitamins', 'staff', 'Health', '444 Pawnee Commons, Pawnee, IN', 58000.00, 'active', '2026-01-11 14:11:07'),
(3, 'legal_mike', 'Mike Ross', 'mike.ross@company.com', '555-0101', 'lawyer123', 'advisor', 'Legal', '123 Pearson St, New York, NY', 95000.00, 'active', '2026-01-11 14:10:29'),
(4, 'janitor_bob', 'Bob Belcher', 'bob.b@company.com', '555-0102', 'burgers4life', 'staff', 'Maintenance', '456 Ocean Ave, Seymours Bay, NJ', 32000.00, 'active', '2026-01-11 14:10:29'),
(5, 'pr_holly', 'Holly Flax', 'holly.f@company.com', '555-0103', 'yodaears', 'manager', 'Human Resources', '789 Nashua Rd, Scranton, PA', 62000.00, 'active', '2026-01-11 14:10:29'),
(6, 'dev_elliot', 'Elliot Alderson', 'elliot.a@company.com', '555-0104', 'mrrobot', 'admin', 'Cybersecurity', '101 Coney Island, Brooklyn, NY', 110000.00, 'active', '2026-01-11 14:10:29'),
(7, 'sales_dwight', 'Dwight Schrute', 'dwight.s@company.com', '555-0105', 'beets', 'staff', 'Sales', 'Schrute Farms, Honesdale, PA', 55000.00, 'active', '2026-01-11 14:10:29'),
(8, 'driver_dom', 'Dominic Toretto', 'dom.t@company.com', '555-0106', 'family', 'staff', 'Logistics', '1327 Toretto Blvd, Los Angeles, CA', 45000.00, 'active', '2026-01-11 14:10:29'),
(10, 'architect_ted', 'Ted Mosby', 'ted.m@company.com', '555-0108', 'bluehorn', 'advisor', 'Design', '77th Street, New York, NY', 88000.00, 'active', '2026-01-11 14:11:07'),
(11, 'scientist_sheldon', 'Sheldon Cooper', 'sheldon.c@company.com', '555-0109', 'bazinga', 'consultant', 'Research', '2311 Los Robles, Pasadena, CA', 105000.00, 'active', '2026-01-11 14:11:07'),
(12, 'recep_erin', 'Erin Hannon', 'erin.h@company.com', '555-0110', 'florida', 'staff', 'Front Desk', '123 Scranton Business Park, PA', 30000.00, 'active', '2026-01-11 14:11:07'),
(13, 'detective_jake', 'Jake Peralta', 'jake.p@company.com', '555-0111', 'coolcool', 'investigator', 'Security', '99th Precinct, Brooklyn, NY', 68000.00, 'active', '2026-01-11 14:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`) VALUES
(1, 'Technology'),
(2, 'Human Resources'),
(3, 'Finance'),
(4, 'Executive Department'),
(5, 'Human Resources'),
(6, 'Information Technology'),
(7, 'Finance and Accounting'),
(8, 'Marketing and Sales'),
(9, 'Customer Support'),
(10, 'Research and Development'),
(11, 'Operations'),
(12, 'Administration');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `position_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `position_id` (`position_id`),
  KEY `department_id` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
CREATE TABLE IF NOT EXISTS `payroll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `pay_period` varchar(50) DEFAULT NULL,
  `net_salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
CREATE TABLE IF NOT EXISTS `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) NOT NULL,
  `base_salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position_name`, `base_salary`) VALUES
(1, 'Manager', 30000.00),
(2, 'Front-End Developer', 25000.00),
(3, 'HR Assistant', 18000.00),
(4, 'Chief Executive Officer (CEO)', NULL),
(5, 'Chief Operating Officer (COO)', NULL),
(6, 'Chief Financial Officer (CFO)', NULL),
(7, 'Human Resources Manager', NULL),
(8, 'HR Assistant', NULL),
(9, 'IT Manager', NULL),
(10, 'Front-End Developer', NULL),
(11, 'Back-End Developer', NULL),
(12, 'Full-Stack Developer', NULL),
(13, 'UI/UX Designer', NULL),
(14, 'QA Tester', NULL),
(15, 'Project Manager', NULL),
(16, 'Marketing Officer', NULL),
(17, 'Sales Executive', NULL),
(18, 'Accountant', NULL),
(19, 'Administrative Assistant', NULL),
(20, 'Customer Service Representative', NULL),
(21, 'Intern', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
