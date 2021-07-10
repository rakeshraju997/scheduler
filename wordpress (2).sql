-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2021 at 06:57 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wordpress`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `category`, `date`, `user_id`, `email`) VALUES
(1, 3, '2021-06-15', 1, 'first@gmail.com'),
(2, 2, '2021-06-07', 2, 'second@gmail.com'),
(3, 1, '2021-06-28', 3, 'third@gmail.com'),
(4, 2, '2021-06-07', 4, 'fourth@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ea_appointments`
--

CREATE TABLE `ea_appointments` (
  `id` int(11) NOT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `is_unavailable` tinyint(4) NOT NULL DEFAULT 0,
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_appointments`
--

INSERT INTO `ea_appointments` (`id`, `book_datetime`, `start_datetime`, `end_datetime`, `location`, `notes`, `hash`, `is_unavailable`, `id_users_provider`, `id_users_customer`, `id_services`, `id_google_calendar`) VALUES
(1, '2021-07-05 09:47:49', '2021-07-22 09:00:00', '2021-07-22 09:30:00', NULL, '', '9a5d34d5a00bb37e2234b21fd48a1034', 0, 2, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_consents`
--

CREATE TABLE `ea_consents` (
  `id` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_migrations`
--

CREATE TABLE `ea_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_migrations`
--

INSERT INTO `ea_migrations` (`version`) VALUES
(21);

-- --------------------------------------------------------

--
-- Table structure for table `ea_roles`
--

CREATE TABLE `ea_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_roles`
--

INSERT INTO `ea_roles` (`id`, `name`, `slug`, `is_admin`, `appointments`, `customers`, `services`, `users`, `system_settings`, `user_settings`) VALUES
(1, 'Administrator', 'admin', 1, 15, 15, 15, 15, 15, 15),
(2, 'Provider', 'provider', 0, 15, 15, 0, 0, 0, 15),
(3, 'Customer', 'customer', 0, 0, 0, 0, 0, 0, 0),
(4, 'Secretary', 'secretary', 0, 15, 15, 0, 0, 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ea_secretaries_providers`
--

CREATE TABLE `ea_secretaries_providers` (
  `id_users_secretary` int(11) NOT NULL,
  `id_users_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_services`
--

CREATE TABLE `ea_services` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT 1,
  `id_service_categories` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services`
--

INSERT INTO `ea_services` (`id`, `name`, `duration`, `price`, `currency`, `description`, `location`, `availabilities_type`, `attendants_number`, `id_service_categories`) VALUES
(1, 'Service', 30, '0.00', '', NULL, NULL, 'flexible', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services_providers`
--

CREATE TABLE `ea_services_providers` (
  `id_users` int(11) NOT NULL,
  `id_services` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services_providers`
--

INSERT INTO `ea_services_providers` (`id_users`, `id_services`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_categories`
--

CREATE TABLE `ea_service_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_settings`
--

CREATE TABLE `ea_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_settings`
--

INSERT INTO `ea_settings` (`id`, `name`, `value`) VALUES
(1, 'company_working_plan', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]}}'),
(2, 'book_advance_timeout', '30'),
(3, 'google_analytics_code', ''),
(4, 'customer_notifications', '1'),
(5, 'date_format', 'DMY'),
(6, 'require_captcha', '0'),
(7, 'time_format', 'regular'),
(8, 'display_cookie_notice', '0'),
(9, 'cookie_notice_content', 'Cookie notice content.'),
(10, 'display_terms_and_conditions', '0'),
(11, 'terms_and_conditions_content', 'Terms and conditions content.'),
(12, 'display_privacy_policy', '0'),
(13, 'privacy_policy_content', 'Privacy policy content.'),
(14, 'first_weekday', 'sunday'),
(15, 'require_phone_number', '1'),
(16, 'api_token', ''),
(17, 'display_any_provider', '1'),
(18, 'company_name', 'osce'),
(19, 'company_email', 'osce@gmail.com'),
(20, 'company_link', 'osce@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ea_users`
--

CREATE TABLE `ea_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mobile_number` varchar(128) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip_code` varchar(64) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `timezone` varchar(256) DEFAULT 'UTC',
  `language` varchar(256) DEFAULT 'english',
  `id_roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_users`
--

INSERT INTO `ea_users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `phone_number`, `address`, `city`, `state`, `zip_code`, `notes`, `timezone`, `language`, `id_roles`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', NULL, '46346363', NULL, NULL, NULL, NULL, NULL, 'UTC', 'english', 1),
(2, 'Jane', 'Doe', 'jane@example.org', NULL, '+1 (000) 000-0000', NULL, NULL, NULL, NULL, NULL, 'UTC', 'english', 2),
(3, 'James', 'Doe', 'james@example.org', NULL, '+1 (000) 000-0000', NULL, NULL, NULL, NULL, NULL, 'UTC', 'english', 3),
(4, 't4et', 'tertre', 'tretret@gmail.com', NULL, '543643636', '', '', NULL, '', NULL, 'Asia/Calcutta', 'english', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_settings`
--

CREATE TABLE `ea_user_settings` (
  `id_users` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `working_plan` text DEFAULT NULL,
  `working_plan_exceptions` text DEFAULT NULL,
  `notifications` tinyint(4) DEFAULT NULL,
  `google_sync` tinyint(4) DEFAULT NULL,
  `google_token` text DEFAULT NULL,
  `google_calendar` varchar(128) DEFAULT NULL,
  `sync_past_days` int(11) DEFAULT 30,
  `sync_future_days` int(11) DEFAULT 90,
  `calendar_view` varchar(32) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_user_settings`
--

INSERT INTO `ea_user_settings` (`id_users`, `username`, `password`, `salt`, `working_plan`, `working_plan_exceptions`, `notifications`, `google_sync`, `google_token`, `google_calendar`, `sync_past_days`, `sync_future_days`, `calendar_view`) VALUES
(1, 'admin', '4740adec60b0745afd38d16299e2dff939efc75b17531ef660783960d0e7e543', '0c86505b96911689a09931e5d025024656e37f01e186303fdd006ac0433fd05f', NULL, NULL, 1, NULL, NULL, NULL, 30, 90, 'default'),
(2, 'janedoe', 'e6155f0ee7cb05f7cc7d5e2df95cfe6e16ef7d5ab4859b612272fe225d139ba0', '47ae4326770572d6d70a4842d04d8d35c499ee923719aabb070b2946b02df469', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"11:20\",\"end\":\"11:30\"},{\"start\":\"14:30\",\"end\":\"15:00\"}]}}', NULL, 1, 0, NULL, NULL, 30, 90, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_name` varchar(80) NOT NULL,
  `salary` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `city` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_name`, `salary`, `gender`, `city`, `email`) VALUES
(1, 'Yogesh', '30000', 'male', 'Bhopal', 'yogesh@makitweb.com'),
(2, 'Vishal', '28000', 'male', 'Pune', 'vishal@gmail.com'),
(3, 'Vijay', '35000', 'male', 'Jaipur', 'vijayec@yahoo.com'),
(4, 'Rahul', '25000', 'male', 'Kanpur', 'rahul512@gmail.com'),
(5, 'Sonarika', '50000', 'female', 'Mumbai', 'bsonarika@gmail.com'),
(6, 'Jitentendre', '48000', 'male', 'Bhopal', 'jiten94@yahoo.com'),
(7, 'Aditya', '36000', 'male', 'Pune', 'aditya@gmail.com'),
(8, 'Anil', '32000', 'male', 'Indore', 'anilsingh@gmail.com'),
(9, 'Sunil', '48000', 'male', 'Nagpur', 'sunil1993@gmail.com'),
(10, 'Akilesh', '52000', 'male', 'Surat', 'akileshsahu@yahoo.com'),
(11, 'Raj', '48000', 'male', 'Ahmedabad', 'rajsingh@gmail.com'),
(12, 'Mayank', '54000', 'male', 'Ghaziabad', 'mpatidar@gmail.com'),
(13, 'Shalu', '43000', 'female', 'Bhopal', 'gshalu521@gmail.com'),
(14, 'Ravi', '32000', 'male', 'Ludhiana', 'ravisharma21@yahoo.com'),
(15, 'Shruti', '45000', 'female', 'Delhi', 'shruti@gmail.com'),
(16, 'Rishi', '38000', 'male', 'Mumbai', 'rishi121@gmail.com'),
(17, 'Rohan', '47000', 'male', 'Jaipur', 'rohansingh@gmail.com'),
(18, 'Priya', '28000', 'female', 'Indore', 'priya1992@gmail.com'),
(19, 'Rakesh', '34000', 'male', 'bhopal', 'rakesh@yahoo.com'),
(20, 'Vinay', '34000', 'male', 'Delhi', 'vinaysingh@gmail.com'),
(21, 'Tanu', '41000', 'female', 'pune', 'Tanu@gmail.com'),
(22, 'Ajay', '28000', 'male', 'bhopal', 'ajay93@gmail.com'),
(23, 'Nikhil', '46000', 'male', 'pune', 'nikhil@gmail.com'),
(24, 'Arav', '28000', 'male', 'Nagpur', 'aravsingh@yahoo.com'),
(25, 'Madhu', '32000', 'female', 'Rajkot', 'madhu@gmail.com'),
(26, 'Sagar', '44000', 'male', 'Rajkot', 'sagar@gmail.com'),
(27, 'Anju ', '30000', 'female', 'Ranchi', 'anju@gmail.com'),
(28, 'Rajat', '28000', 'male', 'kota', 'rajat@gmail.com'),
(29, 'Anjali', '32000', 'female', 'Gwalior', 'anjali@gmail.com'),
(30, 'Saloni', '32000', 'female', 'Nashik', 'saloni@gmail.com'),
(31, 'Mayur', '28000', 'male', 'Bhopal', 'mayur@gmail.com'),
(32, 'Pankaj', '32000', 'male', 'Indore', 'pankaj@gmail.com'),
(33, 'Hrithik', '33000', 'male', 'Pune', 'hrithik@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_actions`
--

CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(24, 'action_scheduler/migration_hook', 'complete', '2021-06-21 07:40:43', '2021-06-21 07:40:43', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1624261243;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1624261243;}', 1, 1, '2021-06-21 07:40:49', '2021-06-21 07:40:49', 0, NULL),
(25, 'action_scheduler/migration_hook', 'complete', '2021-06-29 10:03:16', '2021-06-29 10:03:16', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1624960996;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1624960996;}', 1, 1, '2021-06-29 10:03:19', '2021-06-29 10:03:19', 0, NULL),
(26, 'action_scheduler/migration_hook', 'complete', '2021-06-29 10:04:20', '2021-06-29 10:04:20', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1624961060;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1624961060;}', 1, 1, '2021-06-29 10:06:20', '2021-06-29 10:06:20', 0, NULL),
(27, 'woocommerce_update_marketplace_suggestions', 'complete', '2021-06-29 10:08:33', '2021-06-29 10:08:33', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1624961313;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1624961313;}', 0, 1, '2021-06-29 10:08:35', '2021-06-29 10:08:35', 0, NULL),
(28, 'wc-admin_import_customers', 'complete', '2021-06-29 10:11:38', '2021-06-29 10:11:38', '[1]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1624961498;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1624961498;}', 2, 1, '2021-06-29 10:11:44', '2021-06-29 10:11:44', 0, NULL),
(29, 'wc-admin_import_customers', 'complete', '2021-06-29 10:13:58', '2021-06-29 10:13:58', '[1]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1624961638;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1624961638;}', 2, 1, '2021-06-29 10:14:14', '2021-06-29 10:14:14', 0, NULL),
(30, 'wc-admin_import_orders', 'complete', '2021-06-29 10:13:58', '2021-06-29 10:13:58', '[47]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1624961638;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1624961638;}', 2, 1, '2021-06-29 10:14:14', '2021-06-29 10:14:14', 0, NULL),
(31, 'wc-admin_import_orders', 'complete', '2021-07-02 05:21:43', '2021-07-02 05:21:43', '[47]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625203303;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625203303;}', 2, 1, '2021-07-02 05:21:46', '2021-07-02 05:21:46', 0, NULL),
(32, 'wc-admin_import_customers', 'complete', '2021-07-02 05:22:13', '2021-07-02 05:22:13', '[1]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625203333;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625203333;}', 2, 1, '2021-07-02 05:23:10', '2021-07-02 05:23:10', 0, NULL),
(33, 'action_scheduler/migration_hook', 'complete', '2021-07-02 05:23:24', '2021-07-02 05:23:24', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625203404;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625203404;}', 1, 1, '2021-07-02 05:23:32', '2021-07-02 05:23:32', 0, NULL),
(34, 'wc-admin_import_customers', 'complete', '2021-07-05 07:25:48', '2021-07-05 07:25:48', '[1]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625469948;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625469948;}', 2, 1, '2021-07-05 07:26:26', '2021-07-05 07:26:26', 0, NULL),
(35, 'action_scheduler/migration_hook', 'complete', '2021-07-05 07:42:00', '2021-07-05 07:42:00', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625470920;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625470920;}', 1, 1, '2021-07-05 07:43:34', '2021-07-05 07:43:34', 0, NULL),
(36, 'action_scheduler/migration_hook', 'complete', '2021-07-05 07:44:35', '2021-07-05 07:44:35', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625471075;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625471075;}', 1, 1, '2021-07-05 07:44:38', '2021-07-05 07:44:38', 0, NULL),
(37, 'wc-admin_import_customers', 'complete', '2021-07-06 05:04:04', '2021-07-06 05:04:04', '[1]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625547844;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625547844;}', 2, 1, '2021-07-06 05:05:01', '2021-07-06 05:05:01', 0, NULL),
(38, 'wc-admin_import_customers', 'complete', '2021-07-07 04:57:47', '2021-07-07 04:57:47', '[1]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625633867;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625633867;}', 2, 1, '2021-07-07 04:58:46', '2021-07-07 04:58:46', 0, NULL),
(39, 'wc-admin_import_customers', 'complete', '2021-07-08 04:42:19', '2021-07-08 04:42:19', '[1]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625719339;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625719339;}', 2, 1, '2021-07-08 04:45:55', '2021-07-08 04:45:55', 0, NULL),
(40, 'wc-admin_import_customers', 'complete', '2021-07-09 04:47:20', '2021-07-09 04:47:20', '[1]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1625806040;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1625806040;}', 2, 1, '2021-07-09 04:48:18', '2021-07-09 04:48:18', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_claims`
--

CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_groups`
--

CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration'),
(2, 'wc-admin-data');

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_logs`
--

CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

INSERT INTO `wp_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 24, 'action created', '2021-06-21 07:39:43', '2021-06-21 07:39:43'),
(2, 24, 'action started via Async Request', '2021-06-21 07:40:49', '2021-06-21 07:40:49'),
(3, 24, 'action complete via Async Request', '2021-06-21 07:40:49', '2021-06-21 07:40:49'),
(4, 25, 'action created', '2021-06-29 10:02:16', '2021-06-29 10:02:16'),
(5, 25, 'action started via WP Cron', '2021-06-29 10:03:19', '2021-06-29 10:03:19'),
(6, 25, 'action complete via WP Cron', '2021-06-29 10:03:19', '2021-06-29 10:03:19'),
(7, 26, 'action created', '2021-06-29 10:03:20', '2021-06-29 10:03:20'),
(8, 26, 'action started via WP Cron', '2021-06-29 10:06:20', '2021-06-29 10:06:20'),
(9, 26, 'action complete via WP Cron', '2021-06-29 10:06:20', '2021-06-29 10:06:20'),
(10, 27, 'action created', '2021-06-29 10:08:33', '2021-06-29 10:08:33'),
(11, 27, 'action started via Async Request', '2021-06-29 10:08:35', '2021-06-29 10:08:35'),
(12, 27, 'action complete via Async Request', '2021-06-29 10:08:35', '2021-06-29 10:08:35'),
(13, 28, 'action created', '2021-06-29 10:11:33', '2021-06-29 10:11:33'),
(14, 28, 'action started via Async Request', '2021-06-29 10:11:44', '2021-06-29 10:11:44'),
(15, 28, 'action complete via Async Request', '2021-06-29 10:11:44', '2021-06-29 10:11:44'),
(16, 29, 'action created', '2021-06-29 10:13:53', '2021-06-29 10:13:53'),
(17, 30, 'action created', '2021-06-29 10:13:53', '2021-06-29 10:13:53'),
(18, 29, 'action started via WP Cron', '2021-06-29 10:14:14', '2021-06-29 10:14:14'),
(19, 29, 'action complete via WP Cron', '2021-06-29 10:14:14', '2021-06-29 10:14:14'),
(20, 30, 'action started via WP Cron', '2021-06-29 10:14:14', '2021-06-29 10:14:14'),
(21, 30, 'action complete via WP Cron', '2021-06-29 10:14:14', '2021-06-29 10:14:14'),
(22, 31, 'action created', '2021-07-02 05:21:38', '2021-07-02 05:21:38'),
(23, 31, 'action started via Async Request', '2021-07-02 05:21:45', '2021-07-02 05:21:45'),
(24, 31, 'action complete via Async Request', '2021-07-02 05:21:46', '2021-07-02 05:21:46'),
(25, 32, 'action created', '2021-07-02 05:22:08', '2021-07-02 05:22:08'),
(26, 33, 'action created', '2021-07-02 05:22:24', '2021-07-02 05:22:24'),
(27, 32, 'action started via WP Cron', '2021-07-02 05:23:10', '2021-07-02 05:23:10'),
(28, 32, 'action complete via WP Cron', '2021-07-02 05:23:10', '2021-07-02 05:23:10'),
(29, 33, 'action started via WP Cron', '2021-07-02 05:23:32', '2021-07-02 05:23:32'),
(30, 33, 'action complete via WP Cron', '2021-07-02 05:23:32', '2021-07-02 05:23:32'),
(31, 34, 'action created', '2021-07-05 07:25:43', '2021-07-05 07:25:43'),
(32, 34, 'action started via Async Request', '2021-07-05 07:26:26', '2021-07-05 07:26:26'),
(33, 34, 'action complete via Async Request', '2021-07-05 07:26:26', '2021-07-05 07:26:26'),
(34, 35, 'action created', '2021-07-05 07:41:00', '2021-07-05 07:41:00'),
(35, 35, 'action started via WP Cron', '2021-07-05 07:43:34', '2021-07-05 07:43:34'),
(36, 35, 'action complete via WP Cron', '2021-07-05 07:43:34', '2021-07-05 07:43:34'),
(37, 36, 'action created', '2021-07-05 07:43:35', '2021-07-05 07:43:35'),
(38, 36, 'action started via WP Cron', '2021-07-05 07:44:38', '2021-07-05 07:44:38'),
(39, 36, 'action complete via WP Cron', '2021-07-05 07:44:38', '2021-07-05 07:44:38'),
(40, 37, 'action created', '2021-07-06 05:03:59', '2021-07-06 05:03:59'),
(41, 37, 'action started via WP Cron', '2021-07-06 05:05:01', '2021-07-06 05:05:01'),
(42, 37, 'action complete via WP Cron', '2021-07-06 05:05:01', '2021-07-06 05:05:01'),
(43, 38, 'action created', '2021-07-07 04:57:42', '2021-07-07 04:57:42'),
(44, 38, 'action started via WP Cron', '2021-07-07 04:58:46', '2021-07-07 04:58:46'),
(45, 38, 'action complete via WP Cron', '2021-07-07 04:58:46', '2021-07-07 04:58:46'),
(46, 39, 'action created', '2021-07-08 04:42:14', '2021-07-08 04:42:14'),
(47, 39, 'action started via WP Cron', '2021-07-08 04:45:55', '2021-07-08 04:45:55'),
(48, 39, 'action complete via WP Cron', '2021-07-08 04:45:55', '2021-07-08 04:45:55'),
(49, 40, 'action created', '2021-07-09 04:47:15', '2021-07-09 04:47:15'),
(50, 40, 'action started via WP Cron', '2021-07-09 04:48:18', '2021-07-09 04:48:18'),
(51, 40, 'action complete via WP Cron', '2021-07-09 04:48:18', '2021-07-09 04:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_appointments`
--

CREATE TABLE `wp_bookly_appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `staff_any` tinyint(1) NOT NULL DEFAULT 0,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `custom_service_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_service_price` decimal(10,2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `extras_duration` int(11) NOT NULL DEFAULT 0,
  `internal_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_event_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_event_etag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outlook_event_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outlook_event_change_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outlook_event_series_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_meeting_provider` enum('zoom') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_meeting_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_meeting_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` enum('bookly','google','outlook') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bookly',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_categories`
--

CREATE TABLE `wp_bookly_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 9999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookly_categories`
--

INSERT INTO `wp_bookly_categories` (`id`, `name`, `position`) VALUES
(1, 'OSCE Offline Training', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_customers`
--

CREATE TABLE `wp_bookly_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `wp_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `facebook_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_customer_appointments`
--

CREATE TABLE `wp_bookly_customer_appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `series_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `number_of_persons` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `units` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras_multiply_nop` tinyint(1) NOT NULL DEFAULT 1,
  `extras_consider_duration` tinyint(1) NOT NULL DEFAULT 1,
  `custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `status_changed_at` datetime DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone_offset` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `rating_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collaborative_service_id` int(10) UNSIGNED DEFAULT NULL,
  `collaborative_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compound_service_id` int(10) UNSIGNED DEFAULT NULL,
  `compound_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` enum('frontend','backend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_holidays`
--

CREATE TABLE `wp_bookly_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `repeat_event` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookly_holidays`
--

INSERT INTO `wp_bookly_holidays` (`id`, `staff_id`, `parent_id`, `date`, `repeat_event`) VALUES
(1, NULL, NULL, '2021-01-23', 0),
(2, 1, 1, '2021-01-23', 0),
(3, NULL, NULL, '2021-01-24', 0),
(4, 1, 3, '2021-01-24', 0),
(5, NULL, NULL, '2021-01-25', 0),
(6, 1, 5, '2021-01-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_log`
--

CREATE TABLE `wp_bookly_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` enum('create','update','delete') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` int(10) UNSIGNED DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_messages`
--

CREATE TABLE `wp_bookly_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_notifications`
--

CREATE TABLE `wp_bookly_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `gateway` enum('email','sms') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_staff` tinyint(1) NOT NULL DEFAULT 0,
  `to_customer` tinyint(1) NOT NULL DEFAULT 0,
  `to_admin` tinyint(1) NOT NULL DEFAULT 0,
  `to_custom` tinyint(1) NOT NULL DEFAULT 0,
  `custom_recipients` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attach_ics` tinyint(1) NOT NULL DEFAULT 0,
  `attach_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookly_notifications`
--

INSERT INTO `wp_bookly_notifications` (`id`, `gateway`, `type`, `active`, `name`, `subject`, `message`, `to_staff`, `to_customer`, `to_admin`, `to_custom`, `custom_recipients`, `attach_ics`, `attach_invoice`, `settings`) VALUES
(1, 'email', 'new_booking', 1, 'Notification to customer about approved appointment', 'Your appointment information', 'Dear {client_name}.\n\nThis is a confirmation that you have booked {service_name}.\n\nWe are waiting you at {company_address} on {appointment_date} at {appointment_time}.\n\nThank you for choosing our company.\n\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"approved\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(2, 'email', 'new_booking', 1, 'Notification to staff member about approved appointment', 'New booking information', 'Hello.\n\nYou have a new booking.\n\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"approved\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(3, 'email', 'ca_status_changed', 1, 'Notification to customer about cancelled appointment', 'Booking cancellation', 'Dear {client_name}.\n\nYou have cancelled your booking of {service_name} on {appointment_date} at {appointment_time}.\n\nThank you for choosing our company.\n\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"cancelled\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(4, 'email', 'ca_status_changed', 1, 'Notification to staff member about cancelled appointment', 'Booking cancellation', 'Hello.\n\nThe following booking has been cancelled.\n\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"cancelled\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(5, 'email', 'ca_status_changed', 1, 'Notification to customer about rejected appointment', 'Booking rejection', 'Dear {client_name}.\n\nYour booking of {service_name} on {appointment_date} at {appointment_time} has been rejected.\n\nReason: {cancellation_reason}\n\nThank you for choosing our company.\n\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"rejected\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(6, 'email', 'ca_status_changed', 1, 'Notification to staff member about rejected appointment', 'Booking rejection', 'Hello.\n\nThe following booking has been rejected.\n\nReason: {cancellation_reason}\n\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"rejected\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(7, 'sms', 'new_booking', 1, 'Notification to customer about approved appointment', '', 'Dear {client_name}.\nThis is a confirmation that you have booked {service_name}.\nWe are waiting you at {company_address} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"approved\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(8, 'sms', 'new_booking', 1, 'Notification to staff member about approved appointment', '', 'Hello.\nYou have a new booking.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"approved\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(9, 'sms', 'ca_status_changed', 1, 'Notification to customer about cancelled appointment', '', 'Dear {client_name}.\nYou have cancelled your booking of {service_name} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"cancelled\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(10, 'sms', 'ca_status_changed', 1, 'Notification to staff member about cancelled appointment', '', 'Hello.\nThe following booking has been cancelled.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"cancelled\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(11, 'sms', 'ca_status_changed', 1, 'Notification to customer about rejected appointment', '', 'Dear {client_name}.\nYour booking of {service_name} on {appointment_date} at {appointment_time} has been rejected.\nReason: {cancellation_reason}\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"rejected\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(12, 'sms', 'ca_status_changed', 1, 'Notification to staff member about rejected appointment', '', 'Hello.\nThe following booking has been rejected.\nReason: {cancellation_reason}\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"rejected\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":9,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(13, 'sms', 'appointment_reminder', 0, 'Evening reminder to customer about next day appointment (requires cron setup)', '', 'Dear {client_name}.\nWe would like to remind you that you have booked {service_name} tomorrow at {appointment_time}. We are waiting for you at {company_address}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"any\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":1,\"perform\":\"before\",\"at_hour\":18,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":-24}'),
(14, 'sms', 'appointment_reminder', 0, 'Follow-up message in the same day after appointment (requires cron setup)', '', 'Dear {client_name}.\nThank you for choosing {company_name}. We hope you were satisfied with your {service_name}.\nThank you and we look forward to seeing you again soon.\n{company_name}\n{company_phone}\n{company_website}', 0, 1, 0, 0, NULL, 0, 0, '{\"status\":\"any\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":21,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":0}'),
(15, 'sms', 'staff_day_agenda', 0, 'Evening notification with the next day agenda to staff member (requires cron setup)', '', 'Hello.\nYour agenda for tomorrow is:\n{next_day_agenda}', 1, 0, 0, 0, NULL, 0, 0, '{\"status\":\"any\",\"option\":2,\"services\":{\"any\":\"any\",\"ids\":[]},\"offset_hours\":2,\"perform\":\"before\",\"at_hour\":18,\"before_at_hour\":18,\"offset_before_hours\":-24,\"offset_bidirectional_hours\":-24}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_payments`
--

CREATE TABLE `wp_bookly_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('local','free','paypal','authorize_net','stripe','2checkout','payu_biz','payu_latam','payson','mollie','woocommerce','cloud_stripe') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_type` enum('in_full','deposit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_full',
  `gateway_price_correction` decimal(10,2) DEFAULT 0.00,
  `status` enum('pending','completed','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'completed',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_schedule_item_breaks`
--

CREATE TABLE `wp_bookly_schedule_item_breaks` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_schedule_item_id` int(10) UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_sent_notifications`
--

CREATE TABLE `wp_bookly_sent_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_id` int(10) UNSIGNED NOT NULL,
  `notification_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_series`
--

CREATE TABLE `wp_bookly_series` (
  `id` int(10) UNSIGNED NOT NULL,
  `repeat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_services`
--

CREATE TABLE `wp_bookly_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('simple','collaborative','compound','package') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'simple',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT 900,
  `slot_length` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `deposit` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100%',
  `capacity_min` int(11) NOT NULL DEFAULT 1,
  `capacity_max` int(11) NOT NULL DEFAULT 1,
  `one_booking_per_slot` tinyint(1) NOT NULL DEFAULT 0,
  `padding_left` int(11) NOT NULL DEFAULT 0,
  `padding_right` int(11) NOT NULL DEFAULT 0,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `end_time_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `same_staff_for_subservices` tinyint(1) NOT NULL DEFAULT 0,
  `units_min` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `units_max` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `package_life_time` int(11) DEFAULT NULL,
  `package_size` int(11) DEFAULT NULL,
  `package_unassigned` tinyint(1) NOT NULL DEFAULT 0,
  `appointments_limit` int(11) DEFAULT NULL,
  `limit_period` enum('off','day','week','month','year','upcoming','calendar_day','calendar_week','calendar_month','calendar_year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `staff_preference` enum('order','least_occupied','most_occupied','least_occupied_for_period','most_occupied_for_period','least_expensive','most_expensive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'most_expensive',
  `staff_preference_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurrence_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `recurrence_frequencies` set('daily','weekly','biweekly','monthly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'daily,weekly,biweekly,monthly',
  `time_requirements` enum('required','optional','off') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'required',
  `collaborative_equal_duration` tinyint(1) NOT NULL DEFAULT 0,
  `online_meetings` enum('off','zoom') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `final_step_url` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visibility` enum('public','private','group') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `position` int(11) NOT NULL DEFAULT 9999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookly_services`
--

INSERT INTO `wp_bookly_services` (`id`, `category_id`, `type`, `title`, `duration`, `slot_length`, `price`, `color`, `deposit`, `capacity_min`, `capacity_max`, `one_booking_per_slot`, `padding_left`, `padding_right`, `info`, `start_time_info`, `end_time_info`, `same_staff_for_subservices`, `units_min`, `units_max`, `package_life_time`, `package_size`, `package_unassigned`, `appointments_limit`, `limit_period`, `staff_preference`, `staff_preference_settings`, `recurrence_enabled`, `recurrence_frequencies`, `time_requirements`, `collaborative_equal_duration`, `online_meetings`, `final_step_url`, `visibility`, `position`) VALUES
(1, NULL, 'simple', 'Half day', 900, 'default', '12.00', '#16A3CC', '100%', 1, 1, 0, 0, 0, '', '', '', 0, 1, 1, NULL, NULL, 0, NULL, 'off', 'most_expensive', '{}', 1, 'daily,weekly,biweekly,monthly', 'required', 0, 'off', '', 'public', 0),
(2, NULL, 'simple', 'Full day', 900, 'default', '0.00', '#6234CF', '100%', 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 0, NULL, 'off', 'most_expensive', '{}', 1, 'daily,weekly,biweekly,monthly', 'required', 0, 'off', '', 'public', 1),
(3, NULL, 'simple', '3 day ', 900, 'default', '0.00', '#60DC9B', '100%', 1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, 0, NULL, 'off', 'most_expensive', '{}', 1, 'daily,weekly,biweekly,monthly', 'required', 0, 'off', '', 'public', 2);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_shop`
--

CREATE TABLE `wp_bookly_shop` (
  `id` int(10) UNSIGNED NOT NULL,
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `type` enum('plugin','bundle') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'plugin',
  `highlighted` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(10) UNSIGNED DEFAULT 0,
  `demo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sales` int(10) UNSIGNED NOT NULL,
  `rating` decimal(10,2) NOT NULL,
  `reviews` int(10) UNSIGNED NOT NULL,
  `published` datetime NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookly_shop`
--

INSERT INTO `wp_bookly_shop` (`id`, `plugin_id`, `type`, `highlighted`, `priority`, `demo_url`, `title`, `slug`, `description`, `url`, `icon`, `price`, `sales`, `rating`, `reviews`, `published`, `seen`, `created_at`) VALUES
(1, 7226091, 'plugin', 1, 100, NULL, 'Bookly Pro', 'bookly-addon-pro', 'Bring appointment scheduling process to the next level with Bookly Pro add-on.  Pro add-on turns Bookly plugin into the professional appointment management system. Unlock Advanced Customer management, Service provider management, Services management, Email and SMS notifications, Booking management capabilities. Connect payment gateways and modify Pro version with other add-ons available only with Bookly Pro and more.', 'https://codecanyon.net/item/bookly-booking-plugin-responsive-appointment-booking-and-scheduling/7226091', 'https://s3.envato.com/files/276918414/bookly-icon-(1)%20(3).png', '62.00', 38127, '4.54', 1032, '2014-04-12 17:14:52', 1, '2021-06-21 07:16:18'),
(2, 13903524, 'plugin', 0, 0, NULL, 'Bookly Multisite (Add-on)', 'bookly-addon-multisite', 'Do you need to administrate Booky on multiple websites? This add-on enables Bookly to become a Multisite ready plugin. You need to buy an additional Regular License for Bookly Pro and every installed add-on for each domain name that you use.', 'https://codecanyon.net/item/bookly-multisite-addon/13903524', 'https://s3.envato.com/files/257314580/14multisite.png', '49.00', 620, '5.00', 7, '2015-12-04 16:38:03', 1, '2021-06-21 07:16:18'),
(3, 15552320, 'plugin', 0, 0, NULL, 'Bookly Service Extras (Add-on)', 'bookly-addon-service-extras', 'Increase the average check for every client visit with Service Extras add-on. Let your customers order extra items when they schedule an appointment with you or book your service. It adds one more step into the booking form and allows your customers to pick extras they would like to order as an addition to the service booking, see the price of extras, name, image, and total cost of the selected items.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-service-extras-addon/15552320', 'https://s3.envato.com/files/275715191/bookly_extras_80x80.jpg', '49.00', 2641, '4.41', 32, '2016-04-01 15:29:11', 1, '2021-06-21 07:16:18'),
(4, 17328208, 'plugin', 0, 0, NULL, 'Bookly Locations (Add-on)', 'bookly-addon-locations', 'Do you offer your services in more than one location? Try Bookly Locations add-on to manage the service booking process between various locations. Let your customers pick the location, where they would like to get the service and associate the staff members with those locations.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-locations-addon/17328208', 'https://s3.envato.com/files/257314201/3locations.png', '39.00', 2298, '4.30', 30, '2016-08-03 17:49:31', 1, '2021-06-21 07:16:18'),
(5, 17367838, 'plugin', 0, 0, NULL, 'Bookly Chain Appointments (Add-on)', 'bookly-addon-chain-appointments', 'Do you offer services which can be combined and provided during a single client visit by the same or different staff members? Let your clients book several services for a single visit with the Chain Appointments add-on. The clients will be able to choose multiple services from different providers at the first step of the booking process.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-chain-appointments-addon/17367838', 'https://s3.envato.com/files/257314361/11chain.png', '29.00', 1025, '4.80', 5, '2016-08-09 17:40:29', 1, '2021-06-21 07:16:18'),
(6, 17457141, 'plugin', 0, 0, NULL, 'Bookly Multiply Appointments (Add-on)', 'bookly-addon-multiply-appointments', 'Do you provide fixed-time services, which your clients can book for example for an hour or 15 minutes? Boost your sales with Bookly Multiply Appointments add-on by providing an option to book the same service several times in a row.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-multiply-appointments-addon/17457141', 'https://s3.envato.com/files/277980955/icon_80x80.png', '29.00', 702, '0.00', 2, '2016-08-16 16:02:12', 1, '2021-06-21 07:16:18'),
(7, 17956131, 'plugin', 0, 0, NULL, 'Bookly Deposit Payments (Add-on)', 'bookly-addon-deposit-payments', 'Would you like to reduce the number of no-shows? Or maybe you need to buy something before the clients\' visit? With Bookly Deposit Payments add-on, you can request full or partial pre-payment during the service booking process.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-deposit-payments-addon/17956131', 'https://s3.envato.com/files/257314254/7deposit.png', '39.00', 1348, '4.57', 7, '2016-09-22 18:11:00', 1, '2021-06-21 07:16:18'),
(8, 18611122, 'plugin', 0, 0, NULL, 'Bookly Special Days (Add-on)', 'bookly-addon-special-days', 'Customize the schedule of your employees during the holiday season or any other occasion, without changing your regular schedule. With this add-on, you can add days with long or short hours or even the day when you provide service for 24 hours. Bookly Special Days add-on enables you to modify the schedule of each staff member in your organization.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-special-days-addon/18611122', 'https://s3.envato.com/files/257314246/6specialdays.png', '39.00', 1882, '4.27', 11, '2016-11-07 01:25:43', 1, '2021-06-21 07:16:18'),
(9, 18704535, 'plugin', 0, 0, NULL, 'Bookly Special Hours (Add-on)', 'bookly-addon-special-hours', 'Would you like to provide a discount during happy hours or raise service price during busy hours? You can do it with Bookly Special Hours add-on. With full control of the daily schedule, you can adjust the price to maximize revenues or reduce workload.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-special-hours-addon/18704535', 'https://s3.envato.com/files/276664014/icon_80x80.jpg', '29.00', 455, '4.20', 5, '2016-11-09 01:22:54', 1, '2021-06-21 07:16:18'),
(10, 18874038, 'plugin', 0, 0, NULL, 'Bookly Service Schedule (Add-on)', 'bookly-addon-service-schedule', 'Do you have services with a specific schedule which must be aligned with the default schedule of your employees? With Bookly Service Schedule add-on, you can set hours during each day of the week when your clients can book this service taking into consideration the staff members availability.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-service-schedule-addon/18874038', 'https://s3.envato.com/files/257314213/5serviceschedule.png', '29.00', 2011, '4.40', 10, '2016-11-22 05:03:19', 1, '2021-06-21 07:16:18'),
(11, 19497634, 'plugin', 0, 0, NULL, 'Bookly Recurring Appointments (Add-on)', 'bookly-addon-recurring-appointments', 'Do you provide a service which may require a series of visits, like therapy, massage, tutoring and more? With Bookly Recurring Appointments, your client can book the service set upfront. Must-have for businesses, which provide service sets.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-recurring-appointments-addon/19497634', 'https://s3.envato.com/files/257314299/10recurring.png', '39.00', 1354, '3.67', 12, '2017-02-23 17:42:00', 1, '2021-06-21 07:16:18'),
(12, 19617518, 'plugin', 0, 0, NULL, 'Bookly PayPal Payments Standard (Add-on)', 'bookly-addon-paypal-payments-standard', 'Do you have PayPal Business or PayPal Premier account and would like to provide one of the most popular online payment options for your clients? With Bookly PayPal Payments Standard add-on clients can pay directly via credit card or by logging in to their PayPal account – all processed by PayPal.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-paypal-payments-standard-addon/19617518', 'https://s3.envato.com/files/257314391/13paypalstandard.png', '29.00', 1265, '5.00', 6, '2017-03-22 04:29:25', 1, '2021-06-21 07:16:18'),
(13, 20005540, 'plugin', 0, 0, NULL, 'Bookly Staff Cabinet (Add-on)', 'bookly-addon-staff-cabinet', 'You can manage Bookly in the WordPress admin area of your website. Many of your employees may also need access to Bookly. To avoid any complications and limit the access to the website admin area, you can use Bookly Staff Cabinet, where your employees can: view the calendar, add and manage appointments, view and update personal details and more.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-staff-cabinet-addon/20005540', 'https://s3.envato.com/files/257314313/12staffcabinet.png', '39.00', 1626, '3.69', 16, '2017-05-26 16:11:36', 1, '2021-06-21 07:16:18'),
(14, 20685954, 'plugin', 0, 0, NULL, 'Bookly PayU Latam (Add-on)', 'bookly-addon-payu-latam', 'Accept payments online to reduce the funnel friction and boost your sales. PayU Latam is an international payment gateway provider, which also supports the most popular payment options in Latin America and is a perfect fit for businesses, which provide services in the LatAm market.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-payu-latam-addon/20685954', 'https://s3.envato.com/files/257315044/34payulatam.jpg', '29.00', 84, '0.00', 2, '2017-10-04 22:22:08', 1, '2021-06-21 07:16:18'),
(15, 20917406, 'plugin', 0, 0, NULL, 'Bookly Waiting List (Add-on)', 'bookly-addon-waiting-list', 'Do you lose customers because you are overbooked? Try Bookly Waiting List add-on to collect warm leads and maximize your profits. When you are fully booked, the customer will be able to join the waiting list. Service provider will get an automatic notification when the free slot appears.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-waiting-list-addon/20917406', 'https://s3.envato.com/files/257314909/28waitinglist.jpg', '29.00', 316, '0.00', 1, '2017-11-09 17:58:26', 1, '2021-06-21 07:16:18'),
(16, 20952783, 'plugin', 0, 0, NULL, 'Bookly Packages (Add-on)', 'bookly-addon-packages', 'Do you have customers who purchase your services regularly? You can increase their loyalty to your company and boost your sales by providing package deals at a discounted price with Bookly Packages add-on.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-packages-addon/20952783', 'https://s3.envato.com/files/277560972/icon_80x80.jpg', '29.00', 516, '3.00', 4, '2017-11-14 18:45:26', 1, '2021-06-21 07:16:18'),
(17, 21113698, 'plugin', 0, 0, NULL, 'Bookly 2Checkout (Add-on)', 'bookly-addon-2checkout', 'Accept payments online to reduce the funnel friction and boost your sales. 2Checkout enables merchants to accept mobile and online payments from buyers worldwide. Seamless, safe, reliable payment processing regardless of where you are on the map.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-2checkout-addon/21113698', 'https://s3.envato.com/files/257315086/35_2checkout(1).jpg', '29.00', 28, '0.00', 0, '2017-12-12 10:30:34', 1, '2021-06-21 07:16:18'),
(18, 21113750, 'plugin', 0, 0, NULL, 'Bookly Authorize.Net (Add-on)', 'bookly-addon-authorize-net', 'Accept payments online to reduce the funnel friction and boost your sales. Authorize.Net is a US-based payment gateway, which allows merchants to accept various payment types like: Visa, MasterCard, Discover, American Express, JCB, PayPal, Visa Checkout, Apple Pay, Google Pay, E-check.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-authorizenet-addon/21113750', 'https://s3.envato.com/files/257315021/33authorize.jpg', '29.00', 148, '0.00', 0, '2017-12-12 10:30:24', 1, '2021-06-21 07:16:18'),
(19, 21113860, 'plugin', 0, 0, NULL, 'Bookly Coupons (Add-on)', 'bookly-addon-coupons', 'Provide your clients with discount coupons to boost your sales, improve the conversion rate for less popular services, and increase customer loyalty. With the Bookly Coupons add-on enabled, your clients will be able to apply a coupon code at the checkout and get the service at a discounted price. You can easily create, manage and keep track of all promotional codes directly in Bookly.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-coupons-addon/21113860', 'https://s3.envato.com/files/257314530/17coupons.jpg', '39.00', 1522, '4.20', 5, '2017-12-12 10:39:37', 1, '2021-06-21 07:16:18'),
(20, 21113970, 'plugin', 0, 0, NULL, 'Bookly Custom Fields (Add-on)', 'bookly-addon-custom-fields', 'Do you need to know specific info about your customer before they visit you? Do you want to provide a personalized experience for your customers?\r\nWith Custom Fields add-on, you can ask for more details during the booking process to save time and provide better client experience during the visit.\r\n\r\nImportant: This add-on requires the Bookly PRO to be installed and activated.\r\n', 'https://codecanyon.net/item/bookly-custom-fields-addon/21113970', 'https://s3.envato.com/files/278250393/icon_80x80.jpg', '49.00', 3692, '5.00', 12, '2017-12-12 10:40:39', 1, '2021-06-21 07:16:18'),
(21, 21114042, 'plugin', 0, 0, NULL, 'Bookly Mollie (Add-on)', 'bookly-addon-mollie', 'Accept payments online to reduce the funnel friction and boost your sales. Mollie is a Payment Service Provider (PSP) which allows you to process such payment methods as iDEAL, credit card, Bancontact/Mister Cash, PayPal, SCT, SDD, and others.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-mollie-addon/21114042', 'https://s3.envato.com/files/257314852/25mollie.jpg', '34.00', 587, '0.00', 2, '2017-12-12 10:43:25', 1, '2021-06-21 07:16:18'),
(22, 21114096, 'plugin', 0, 0, NULL, 'Bookly Payson (Add-on)', 'bookly-addon-payson', 'Accept payments online to reduce the funnel friction and boost your sales. Payson is one of Sweden’s leading companies for payments online. It provides both e-traders and private individuals with access to secure online payments.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-payson-addon/21114096', 'https://s3.envato.com/files/257315118/37payson.jpg', '29.00', 13, '0.00', 1, '2017-12-12 10:44:08', 1, '2021-06-21 07:16:18'),
(23, 21114146, 'plugin', 0, 0, NULL, 'Bookly Stripe (Add-on)', 'bookly-addon-stripe', 'Accept payments online to reduce the funnel friction and boost your sales. Stripe operates in more than 25 countries and provides various options to accept payments online. One of the most powerful solutions to cover your payments needs.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-stripe-addon/21114146', 'https://s3.envato.com/files/257314285/9stripe.jpg', '39.00', 2342, '4.60', 10, '2017-12-12 10:46:42', 1, '2021-06-21 07:16:18'),
(24, 21344225, 'plugin', 0, 0, NULL, 'Bookly Group Booking (Add-on)', 'bookly-addon-group-booking', 'Do you provide services for groups, like yoga or fitness class, group tutoring, or maybe a guided tour? With Bookly Group Booking add-on, you can easily set the capacity for each service you provide, let your customers specify the number of people during the booking and more.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-group-booking-addon/21344225', 'https://s3.envato.com/files/257314273/8groupbooking.jpg', '39.00', 2697, '5.00', 6, '2018-02-01 01:33:45', 1, '2021-06-21 07:16:18'),
(25, 21344290, 'plugin', 0, 0, NULL, 'Bookly Customer Groups (Add-on)', 'bookly-addon-customer-groups', 'Do you have different types of customers? Bookly Customer Groups add-on enables you to create and manage Customer Groups. With this add-on, you can arrange your customers in different categories and set the rules for booking process, pricing and more.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-customer-groups-addon/21344290', 'https://s3.envato.com/files/257314959/31customergroups.jpg', '29.00', 307, '0.00', 0, '2018-02-01 02:03:48', 1, '2021-06-21 07:16:18'),
(26, 21344354, 'plugin', 0, 0, NULL, 'Bookly Files (Add-on)', 'bookly-addon-files', 'Do you require documents or any other information before the customer can book your service? Let your clients attach files during the booking process with Bookly Files add-on. All materials added by your customers will be available for review in booking details.\r\n\r\nImportant: This add-on requires the Bookly PRO and Bookly Custom Fields (Add-on) installed and activated.', 'https://codecanyon.net/item/bookly-files-addon/21344354', 'https://s3.envato.com/files/257314861/27files.jpg', '29.00', 502, '3.83', 6, '2018-02-01 02:07:58', 1, '2021-06-21 07:16:18'),
(27, 21574371, 'plugin', 0, 0, NULL, 'Bookly Compound Services (Add-on)', 'bookly-addon-compound-services', 'Do you have services which can be combined into one service at a higher price? For example, if you provide web design, coding, content creation services you could combine them into the website or app development service which includes services mentioned in the example and involves several employees in it. \r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-compound-services-addon/21574371', 'https://s3.envato.com/files/257314987/30compound.jpg', '29.00', 192, '0.00', 1, '2018-03-13 06:08:47', 1, '2021-06-21 07:16:18'),
(28, 21574466, 'plugin', 0, 0, NULL, 'Bookly Customer Information (Add-on)', 'bookly-addon-customer-information', 'Know your customer better with Bookly Customer Information add-on. Add custom fields to the booking form to gather additional info about your customer. The extended user profile will allow you to personalize your marketing activities in the future.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-customer-information-addon/21574466', 'https://s3.envato.com/files/279832345/icon_80x80.jpg', '29.00', 1025, '5.00', 5, '2018-03-13 06:10:12', 1, '2021-06-21 07:16:18'),
(29, 21574566, 'plugin', 0, 0, NULL, 'Bookly Ratings (Add-on)', 'bookly-addon-ratings', 'Do you want to improve your services and become more client-oriented? With Bookly Ratings add-on, you can evaluate your staff members and services you provide. Encourage your customers to rate the services they receive to keep up with professional standards and always meet the client’s expectations.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-ratings-addon/21574566', 'https://s3.envato.com/files/257315009/32ratings.jpg', '29.00', 265, '0.00', 2, '2018-03-13 06:19:21', 1, '2021-06-21 07:16:18'),
(30, 21841764, 'plugin', 0, 0, NULL, 'Bookly Cart (Add-on)', 'bookly-addon-cart', 'Do you want to boost your online sales even more? With Bookly Cart add-on, your customers can add multiple service bookings to the cart. It simplifies the buying process and motivates to purchase more. You can customize columns and display the cart summary data the way you want.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-cart-addon/21841764', 'https://s3.envato.com/files/257314676/21cart.jpg', '29.00', 1087, '4.57', 7, '2018-04-29 02:25:40', 1, '2021-06-21 07:16:18'),
(31, 21841828, 'plugin', 0, 0, NULL, 'Bookly Taxes (Add-on)', 'bookly-addon-taxes', 'Bookly Taxes add-on will let you set up and include taxes in the service price. You’ll be able to define different tax rates and apply them to all or only to selected services. Based on your settings, Bookly will calculate and display a total price with taxes that were applied.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-taxes-addon/21841828', 'https://s3.envato.com/files/257314926/29taxes.jpg', '39.00', 415, '3.00', 3, '2018-04-29 02:29:54', 1, '2021-06-21 07:16:18'),
(32, 21841856, 'plugin', 0, 0, NULL, 'Bookly Invoices (Add-on)', 'bookly-addon-invoices', 'Do you need need to invoice your clients without routine? With Bookly Invoices add-on, you can automatically issue invoices to your clients after your service is booked. Send a payment request when appointments are booked, approved, or received, and get paid within a specified period. Take advantage of the automatic online invoicing and let your clients pay for your services quickly and easily.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.\r\n', 'https://codecanyon.net/item/bookly-invoices-addon/21841856', 'https://s3.envato.com/files/276228740/icon_80x80.jpg', '39.00', 733, '0.00', 1, '2018-04-29 02:30:22', 1, '2021-06-21 07:16:18'),
(33, 21841871, 'plugin', 0, 0, NULL, 'Bookly Google Maps Address (Add-on)', 'bookly-addon-google-maps-address', 'Would you like to reduce Bookly form fill-in time and increase the conversion rate? Bookly Google Maps Address add-on simplifies the process of address data entry allowing you to use an autocomplete service. It helps to minimize the funnel friction, which leads to a better conversion rate and more sales.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-google-maps-address-addon/21841871', 'https://s3.envato.com/files/257314833/26googlemaps.jpg', '29.00', 364, '4.67', 3, '2018-04-29 02:45:11', 1, '2021-06-21 07:16:18'),
(34, 22060579, 'plugin', 0, 0, NULL, 'Bookly Advanced Google Calendar (Add-on)', 'bookly-addon-advanced-google-calendar', 'Are you used to Google Сalendar and want to leverage its capabilities together with Bookly? With  Bookly Advanced Google Calendar add-on, you get two-way synchronization between Bookly Calendar and Google Calendar so that you’ll always be able to see and manage all appointments in both calendars.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-advanced-google-calendar-addon/22060579', 'https://s3.envato.com/files/257314406/15googlecalendar.jpg', '49.00', 2044, '4.44', 9, '2018-06-06 04:37:53', 1, '2021-06-21 07:16:18'),
(35, 22060627, 'plugin', 0, 0, NULL, 'Bookly Customer Cabinet (Add-on)', 'bookly-addon-customer-cabinet', 'Do you need even more flexibility and let your customers manage their existing appointments and profile info? With Bookly Customer Cabinet add-on, Bookly becomes fully GDPR compliant and allows your users to control their data and appointments on your website in their personal user account. \r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-customer-cabinet-addon/22060627', 'https://s3.envato.com/files/257314653/19customercabinet.jpg', '29.00', 1285, '3.89', 9, '2018-06-06 04:39:24', 1, '2021-06-21 07:16:18'),
(36, 22060703, 'plugin', 0, 0, NULL, 'Bookly Custom Duration (Add-on)', 'bookly-addon-custom-duration', 'Do you sell services which may have a flexible duration like tutoring, training, consulting, etc.? With Bookly Custom Duration add-on, your customers can define the length of the appointment. The price will be calculated accordingly.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-custom-duration-addon/22060703', 'https://s3.envato.com/files/277098076/icon_80x80.jpg', '29.00', 920, '4.20', 5, '2018-06-06 04:42:30', 1, '2021-06-21 07:16:18'),
(37, 22060797, 'plugin', 0, 0, NULL, 'Bookly PayUbiz (Add-on)', 'bookly-addon-payu-biz', 'Accept payments online to reduce the funnel friction and boost your sales. PayUbiz is a payment gateway provider, which also supports most popular payment options in India and is a perfect fit for businesses, which provide services in the Indian market.\r\n\r\nImportant: This add-on requires the Bookly PRO installed and activated.', 'https://codecanyon.net/item/bookly-payubiz-addon/22060797', 'https://s3.envato.com/files/257315098/36payubiz.jpg', '29.00', 17, '0.00', 1, '2018-06-06 04:52:32', 1, '2021-06-21 07:16:18'),
(38, 22999600, 'plugin', 0, 0, NULL, 'Bookly Tasks (Add-on) ', 'bookly-addon-tasks', 'Bookly Tasks add-on allows you and your customers to create bookings without choosing date and time.', 'https://codecanyon.net/item/bookly-tasks-addon/22999600', 'https://s3.envato.com/files/257552116/icon_80x80.jpg', '29.00', 305, '0.00', 1, '2018-12-12 00:17:51', 1, '2021-06-21 07:16:18'),
(39, 22999632, 'plugin', 0, 0, NULL, 'Bookly Collaborative Services (Add-on)', 'bookly-addon-collaborative-services', 'Bookly Collaborative Services add-on allows you to create services that require simultaneous participation of several staff members or staff member and shared resources necessary for the service performance.', 'https://codecanyon.net/item/bookly-collaborative-services-addon/22999632', 'https://s3.envato.com/files/257552412/icon_80x80.jpg', '39.00', 409, '0.00', 0, '2018-12-12 00:22:29', 1, '2021-06-21 07:16:18'),
(40, 23324001, 'plugin', 0, 0, NULL, 'Bookly Custom Statuses (Add-on)', 'bookly-addon-custom-statuses', 'Bookly Custom Statuses add-on allows you to create and use additional statuses for the appointment.', 'https://codecanyon.net/item/bookly-custom-statuses-addon/23324001', 'https://s3.envato.com/files/260657848/icon_80x80.jpg', '29.00', 327, '0.00', 2, '2019-02-18 20:10:01', 1, '2021-06-21 07:16:18'),
(41, 23350952, 'plugin', 0, 0, NULL, 'Bookly Outlook Calendar (Add-on)', 'bookly-addon-outlook-calendar', 'Bookly Outlook Calendar add-on allows you to get a full two-way synchronization between Bookly Calendar and Outlook Calendar.', 'https://codecanyon.net/item/bookly-outlook-calendar-addon/23350952', 'https://s3.envato.com/files/260900000/icon_80x80(1).jpg', '49.00', 557, '0.00', 2, '2019-02-21 23:33:34', 1, '2021-06-21 07:16:18'),
(42, 24219988, 'plugin', 0, 0, NULL, 'Bookly PayPal Checkout (Add-on)', 'bookly-addon-paypal-checkout', 'Bookly PayPal Checkout add-on allows your client to use PayPal Checkout payment method.', 'https://codecanyon.net/item/bookly-paypal-checkout-addon/24219988', 'https://s3.envato.com/files/268224387/icon_80x80.jpg', '29.00', 390, '0.00', 0, '2019-07-30 18:31:46', 1, '2021-06-21 07:16:18'),
(43, 29936495, 'plugin', 0, 0, NULL, 'Bookly Discounts (Add-on)', 'bookly-addon-discounts', 'Bookly Discounts add-on allows you to set up conditional discounts that will be applied during checkout if the booking details match requirements set by you.', 'https://codecanyon.net/item/bookly-discounts-addon/29936495', 'https://s3.envato.com/files/317556319/icon_80x80.jpg', '29.00', 81, '0.00', 0, '2021-01-05 01:18:25', 1, '2021-06-21 07:16:18');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_staff`
--

CREATE TABLE `wp_bookly_staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `wp_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `attachment_id` int(10) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_time_limit` int(10) UNSIGNED DEFAULT NULL,
  `visibility` enum('public','private','archive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `position` int(11) NOT NULL DEFAULT 9999,
  `google_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outlook_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoom_authentication` enum('default','jwt','oauth') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `zoom_jwt_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoom_jwt_api_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoom_oauth_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookly_staff`
--

INSERT INTO `wp_bookly_staff` (`id`, `category_id`, `wp_user_id`, `attachment_id`, `full_name`, `email`, `phone`, `time_zone`, `info`, `working_time_limit`, `visibility`, `position`, `google_data`, `outlook_data`, `zoom_authentication`, `zoom_jwt_api_key`, `zoom_jwt_api_secret`, `zoom_oauth_token`) VALUES
(1, NULL, 2, 0, 'krishna sagar', 'k@gmail.com', '63463636', NULL, '', NULL, 'public', 1, NULL, NULL, 'default', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_staff_schedule_items`
--

CREATE TABLE `wp_bookly_staff_schedule_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `day_index` int(10) UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bookly_staff_schedule_items`
--

INSERT INTO `wp_bookly_staff_schedule_items` (`id`, `staff_id`, `location_id`, `day_index`, `start_time`, `end_time`) VALUES
(1, 1, NULL, 1, NULL, NULL),
(2, 1, NULL, 2, '08:00:00', '18:00:00'),
(3, 1, NULL, 3, '08:00:00', '18:00:00'),
(4, 1, NULL, 4, '08:00:00', '18:00:00'),
(5, 1, NULL, 5, '08:00:00', '18:00:00'),
(6, 1, NULL, 6, '08:00:00', '18:00:00'),
(7, 1, NULL, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_staff_services`
--

CREATE TABLE `wp_bookly_staff_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `deposit` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100%',
  `capacity_min` int(11) NOT NULL DEFAULT 1,
  `capacity_max` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_stats`
--

CREATE TABLE `wp_bookly_stats` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bookly_sub_services`
--

CREATE TABLE `wp_bookly_sub_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('service','spare_time') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'service',
  `service_id` int(10) UNSIGNED NOT NULL,
  `sub_service_id` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 9999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2021-06-21 06:26:19', '2021-06-21 06:26:19', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0),
(2, 47, 'WooCommerce', '', '', '', '2021-07-02 05:21:38', '2021-07-02 05:21:38', 'Unpaid order cancelled - time limit reached. Order status changed from Pending payment to Cancelled.', 0, '1', 'WooCommerce', 'order_note', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_appointments`
--

CREATE TABLE `wp_ea_appointments` (
  `id` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `worker` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  `price` decimal(10,2) DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_connections`
--

CREATE TABLE `wp_ea_connections` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `worker` int(11) DEFAULT NULL,
  `slot_count` int(11) DEFAULT 1,
  `day_of_week` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `day_from` date DEFAULT NULL,
  `day_to` date DEFAULT NULL,
  `is_working` smallint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_ea_connections`
--

INSERT INTO `wp_ea_connections` (`id`, `group_id`, `location`, `service`, `worker`, `slot_count`, `day_of_week`, `time_from`, `time_to`, `day_from`, `day_to`, `is_working`) VALUES
(1, NULL, 1, 1, 1, 3, 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday', '00:00:00', '23:59:59', '2021-07-05', '2021-07-06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_error_logs`
--

CREATE TABLE `wp_ea_error_logs` (
  `id` int(11) NOT NULL,
  `error_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `errors` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `errors_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_fields`
--

CREATE TABLE `wp_ea_fields` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_locations`
--

CREATE TABLE `wp_ea_locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cord` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_ea_locations`
--

INSERT INTO `wp_ea_locations` (`id`, `name`, `address`, `location`, `cord`) VALUES
(1, 'kochi', 'kochiiii', 'kochiii', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_meta_fields`
--

CREATE TABLE `wp_ea_meta_fields` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mixed` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(4) NOT NULL,
  `required` tinyint(4) NOT NULL,
  `validation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_ea_meta_fields`
--

INSERT INTO `wp_ea_meta_fields` (`id`, `type`, `slug`, `label`, `mixed`, `default_value`, `visible`, `required`, `validation`, `position`) VALUES
(1, 'EMAIL', 'email', 'EMail', '', '', 1, 1, 'email', 1),
(2, 'INPUT', 'name', 'Name', '', '', 1, 1, 'minlength-3', 2),
(3, 'INPUT', 'phone', 'Phone', '', '', 1, 1, 'minlength-3', 3),
(4, 'TEXTAREA', 'description', 'Description', '', '', 1, 0, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_options`
--

CREATE TABLE `wp_ea_options` (
  `id` int(11) NOT NULL,
  `ea_key` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ea_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_ea_options`
--

INSERT INTO `wp_ea_options` (`id`, `ea_key`, `ea_value`, `type`) VALUES
(1, 'mail.pending', 'pending', 'default'),
(2, 'mail.reservation', 'reservation', 'default'),
(3, 'mail.canceled', 'canceled', 'default'),
(4, 'mail.confirmed', 'confirmed', 'default'),
(5, 'mail.admin', '', 'default'),
(6, 'mail.action.two_step', '0', 'default'),
(7, 'trans.service', 'Service', 'default'),
(8, 'trans.location', 'Location', 'default'),
(9, 'trans.worker', 'Worker', 'default'),
(10, 'trans.done_message', 'Done', 'default'),
(11, 'time_format', '00-24', 'default'),
(12, 'trans.currency', '$', 'default'),
(13, 'pending.email', '', 'default'),
(14, 'price.hide', '0', 'default'),
(15, 'price.hide.service', '0', 'default'),
(16, 'datepicker', 'en-US', 'default'),
(17, 'send.user.email', '0', 'default'),
(18, 'custom.css', '', 'default'),
(19, 'form.label.above', '0', 'default'),
(20, 'show.iagree', '0', 'default'),
(21, 'cancel.scroll', 'calendar', 'default'),
(22, 'multiple.work', '1', 'default'),
(23, 'compatibility.mode', '0', 'default'),
(24, 'pending.subject.email', 'New Reservation #id#', 'default'),
(25, 'send.from.email', '', 'default'),
(26, 'css.off', '0', 'default'),
(27, 'submit.redirect', '', 'default'),
(28, 'advance.redirect', '[]', 'default'),
(29, 'advance_cancel.redirect', '[]', 'default'),
(30, 'pending.subject.visitor.email', 'Reservation #id#', 'default'),
(31, 'block.time', '0', 'default'),
(32, 'max.appointments', '5', 'default'),
(33, 'pre.reservation', '0', 'default'),
(34, 'default.status', 'pending', 'default'),
(35, 'send.worker.email', '0', 'default'),
(36, 'currency.before', '0', 'default'),
(37, 'nonce.off', '0', 'default'),
(38, 'gdpr.on', '0', 'default'),
(39, 'gdpr.label', 'By using this form you agree with the storage and handling of your data by this website.', 'default'),
(40, 'gdpr.link', '', 'default'),
(41, 'gdpr.message', 'You need to accept the privacy checkbox', 'default'),
(42, 'gdpr.auto_remove', '0', 'default'),
(43, 'sort.workers-by', 'id', 'default'),
(44, 'sort.services-by', 'id', 'default'),
(45, 'sort.locations-by', 'id', 'default'),
(46, 'order.workers-by', 'DESC', 'default'),
(47, 'order.services-by', 'DESC', 'default'),
(48, 'order.locations-by', 'DESC', 'default'),
(49, 'captcha.site-key', '', 'default'),
(50, 'captcha3.site-key', '', 'default'),
(51, 'captcha.secret-key', '', 'default'),
(52, 'captcha3.secret-key', '', 'default'),
(53, 'fullcalendar.public', '0', 'default'),
(54, 'fullcalendar.event.show', '0', 'default'),
(55, 'fullcalendar.event.template', '', 'default'),
(56, 'shortcode.compress', '1', 'default'),
(57, 'label.from_to', '0', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_services`
--

CREATE TABLE `wp_ea_services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `slot_step` int(11) DEFAULT NULL,
  `block_before` int(11) DEFAULT 0,
  `block_after` int(11) DEFAULT 0,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_ea_services`
--

INSERT INTO `wp_ea_services` (`id`, `name`, `duration`, `slot_step`, `block_before`, `block_after`, `price`) VALUES
(1, 'osce', 149, 149, 1, 1, '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `wp_ea_staff`
--

CREATE TABLE `wp_ea_staff` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_ea_staff`
--

INSERT INTO `wp_ea_staff` (`id`, `name`, `description`, `email`, `phone`) VALUES
(1, 'rak', 'rrasreesr', 'r@gmail.com', '5345356356');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_activities`
--

CREATE TABLE `wp_latepoint_activities` (
  `id` mediumint(9) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initiated_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initiated_by_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_activities`
--

INSERT INTO `wp_latepoint_activities` (`id`, `agent_id`, `booking_id`, `service_id`, `customer_id`, `code`, `description`, `initiated_by`, `initiated_by_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 1, 'customer_create', NULL, 'admin', 1, '2021-07-05 08:49:19', '2021-07-05 08:49:19'),
(2, 1, 1, 1, 1, 'booking_create', NULL, 'admin', 1, '2021-07-05 08:49:19', '2021-07-05 08:49:19'),
(3, 1, NULL, NULL, NULL, 'agent_update', NULL, 'admin', 1, '2021-07-05 08:50:49', '2021-07-05 08:50:49'),
(4, 1, NULL, NULL, NULL, 'agent_update', NULL, 'admin', 1, '2021-07-05 11:44:06', '2021-07-05 11:44:06'),
(5, NULL, NULL, NULL, 2, 'customer_create', NULL, 'admin', 1, '2021-07-05 11:48:43', '2021-07-05 11:48:43'),
(6, 1, 2, 1, 2, 'booking_create', NULL, 'admin', 1, '2021-07-05 11:48:43', '2021-07-05 11:48:43'),
(7, 1, 2, 1, 2, 'booking_update', NULL, 'admin', 1, '2021-07-05 11:49:09', '2021-07-05 11:49:09'),
(8, 2, NULL, NULL, NULL, 'agent_create', NULL, 'admin', 1, '2021-07-05 11:51:15', '2021-07-05 11:51:15'),
(9, 2, NULL, NULL, NULL, 'agent_update', NULL, 'admin', 1, '2021-07-05 11:51:42', '2021-07-05 11:51:42'),
(10, 2, NULL, NULL, NULL, 'agent_update', NULL, 'admin', 1, '2021-07-05 11:52:57', '2021-07-05 11:52:57'),
(11, 1, 2, 1, 2, 'booking_change_status', 'Appointment status changed from pending to approved', 'admin', 1, '2021-07-05 11:54:19', '2021-07-05 11:54:19'),
(12, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:14:29', '2021-07-06 05:14:29'),
(13, 2, 3, 1, 3, 'booking_create', NULL, 'admin', 1, '2021-07-06 05:16:09', '2021-07-06 05:16:09'),
(14, 1, 4, 1, 3, 'booking_create', NULL, 'admin', 1, '2021-07-06 05:26:53', '2021-07-06 05:26:53'),
(15, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:30:15', '2021-07-06 05:30:15'),
(16, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:32:00', '2021-07-06 05:32:00'),
(17, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:32:39', '2021-07-06 05:32:39'),
(18, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:35:21', '2021-07-06 05:35:21'),
(19, NULL, NULL, 2, NULL, 'service_create', NULL, 'admin', 1, '2021-07-06 05:36:30', '2021-07-06 05:36:30'),
(20, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:36:38', '2021-07-06 05:36:38'),
(21, 1, NULL, NULL, NULL, 'agent_update', NULL, 'admin', 1, '2021-07-06 05:41:58', '2021-07-06 05:41:58'),
(22, 2, NULL, NULL, NULL, 'agent_update', NULL, 'admin', 1, '2021-07-06 05:42:44', '2021-07-06 05:42:44'),
(23, 3, NULL, NULL, NULL, 'agent_create', NULL, 'admin', 1, '2021-07-06 05:43:21', '2021-07-06 05:43:21'),
(24, NULL, NULL, 3, NULL, 'service_create', NULL, 'admin', 1, '2021-07-06 05:44:28', '2021-07-06 05:44:28'),
(25, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:44:38', '2021-07-06 05:44:38'),
(26, NULL, NULL, 3, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:46:21', '2021-07-06 05:46:21'),
(27, NULL, NULL, 2, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 05:46:41', '2021-07-06 05:46:41'),
(28, 3, 5, 3, 3, 'booking_create', NULL, 'admin', 1, '2021-07-06 05:49:28', '2021-07-06 05:49:28'),
(29, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 06:05:30', '2021-07-06 06:05:30'),
(30, NULL, NULL, 1, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 06:06:08', '2021-07-06 06:06:08'),
(31, NULL, NULL, 2, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 06:06:35', '2021-07-06 06:06:35'),
(32, NULL, NULL, 3, NULL, 'service_update', NULL, 'admin', 1, '2021-07-06 06:06:55', '2021-07-06 06:06:55'),
(33, 3, 6, 3, 3, 'booking_create', NULL, 'admin', 1, '2021-07-06 06:16:27', '2021-07-06 06:16:27'),
(34, 3, 7, 3, 3, 'booking_create', NULL, 'admin', 1, '2021-07-06 06:43:27', '2021-07-06 06:43:27'),
(35, 3, 8, 2, 3, 'booking_create', NULL, 'admin', 1, '2021-07-06 06:52:37', '2021-07-06 06:52:37'),
(36, 3, 9, 3, 3, 'booking_create', NULL, 'admin', 1, '2021-07-06 07:54:11', '2021-07-06 07:54:11'),
(37, 3, 10, 3, 3, 'booking_create', NULL, 'admin', 1, '2021-07-07 09:55:50', '2021-07-07 09:55:50'),
(38, 2, 11, 2, 3, 'booking_create', NULL, 'admin', 1, '2021-07-07 10:09:28', '2021-07-07 10:09:28'),
(39, 1, 12, 1, 3, 'booking_create', NULL, 'admin', 1, '2021-07-08 04:48:46', '2021-07-08 04:48:46'),
(40, 1, 13, 2, 3, 'booking_create', NULL, 'admin', 1, '2021-07-08 04:49:29', '2021-07-08 04:49:29'),
(41, 1, 14, 3, 3, 'booking_create', NULL, 'admin', 1, '2021-07-08 04:49:54', '2021-07-08 04:49:54'),
(42, 3, 15, 3, 3, 'booking_create', NULL, 'admin', 1, '2021-07-08 07:48:09', '2021-07-08 07:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_agents`
--

CREATE TABLE `wp_latepoint_agents` (
  `id` mediumint(9) NOT NULL,
  `avatar_image_id` int(11) DEFAULT NULL,
  `bio_image_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_hours` tinyint(1) DEFAULT NULL,
  `wp_user_id` mediumint(9) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_emails` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_phones` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_agents`
--

INSERT INTO `wp_latepoint_agents` (`id`, `avatar_image_id`, `bio_image_id`, `first_name`, `last_name`, `display_name`, `title`, `bio`, `features`, `email`, `phone`, `password`, `custom_hours`, `wp_user_id`, `status`, `extra_emails`, `extra_phones`, `created_at`, `updated_at`) VALUES
(1, 6, 0, 'London', '', '', '', '', '[{\"value\":\"\",\"label\":\"\"},{\"value\":\"\",\"label\":\"\"},{\"value\":\"\",\"label\":\"\"}]', 'london@gmail.com', '645654654645', '$P$Bt.4xD4nd4QkCQNQ95N8QwPP0sXUXP/', NULL, 0, 'active', '', '', '2021-07-05 08:06:20', '2021-07-06 05:41:58'),
(2, 0, 0, 'Edinburgh', '', 'Edinburgh', '', '', '[{\"value\":\"\",\"label\":\"\"},{\"value\":\"\",\"label\":\"\"},{\"value\":\"\",\"label\":\"\"}]', 'edinburgh@trainer.com', '7415646742569', '$P$B8x9TUjwaLNdZqULE0Y.qZanl4Tw/.0', NULL, 0, 'active', '', '', '2021-07-05 11:51:15', '2021-07-06 05:42:44'),
(3, 0, 0, 'Manchester', '', 'Manchester', '', '', '[{\"value\":\"\",\"label\":\"\"},{\"value\":\"\",\"label\":\"\"},{\"value\":\"\",\"label\":\"\"}]', 'Mancheste@trainer.com', '', '$P$B6GvV7nBjnlRonGlRjtONeWYGJQlxA0', NULL, 0, 'active', '', '', '2021-07-06 05:43:21', '2021-07-06 05:43:21');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_agents_services`
--

CREATE TABLE `wp_latepoint_agents_services` (
  `id` mediumint(9) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `is_custom_hours` tinyint(1) DEFAULT NULL,
  `is_custom_price` tinyint(1) DEFAULT NULL,
  `is_custom_duration` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_agents_services`
--

INSERT INTO `wp_latepoint_agents_services` (`id`, `agent_id`, `service_id`, `location_id`, `is_custom_hours`, `is_custom_price`, `is_custom_duration`, `created_at`, `updated_at`) VALUES
(4, 2, 2, 1, 0, 0, 0, '2021-07-06 05:36:30', '2021-07-06 05:36:30'),
(5, 2, 1, 1, 0, 0, 0, '2021-07-06 05:36:38', '2021-07-06 05:36:38'),
(6, 1, 1, 1, 0, 0, 0, '2021-07-06 05:41:58', '2021-07-06 05:41:58'),
(7, 1, 2, 1, 0, 0, 0, '2021-07-06 05:41:58', '2021-07-06 05:41:58'),
(8, 3, 1, 1, 0, 0, 0, '2021-07-06 05:43:21', '2021-07-06 05:43:21'),
(9, 3, 2, 1, 0, 0, 0, '2021-07-06 05:43:21', '2021-07-06 05:43:21'),
(10, 1, 3, 1, 0, 0, 0, '2021-07-06 05:44:28', '2021-07-06 05:44:28'),
(11, 2, 3, 1, 0, 0, 0, '2021-07-06 05:44:28', '2021-07-06 05:44:28'),
(12, 3, 3, 1, 0, 0, 0, '2021-07-06 05:44:28', '2021-07-06 05:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_agent_meta`
--

CREATE TABLE `wp_latepoint_agent_meta` (
  `id` mediumint(9) NOT NULL,
  `object_id` mediumint(9) NOT NULL,
  `meta_key` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_bookings`
--

CREATE TABLE `wp_latepoint_bookings` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` mediumint(9) NOT NULL,
  `end_time` mediumint(9) NOT NULL,
  `buffer_before` mediumint(9) NOT NULL,
  `buffer_after` mediumint(9) NOT NULL,
  `duration` mediumint(9) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `customer_id` mediumint(9) NOT NULL,
  `service_id` mediumint(9) NOT NULL,
  `agent_id` mediumint(9) NOT NULL,
  `location_id` mediumint(9) DEFAULT NULL,
  `total_attendies` mediumint(4) DEFAULT NULL,
  `payment_method` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_portion` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_bookings`
--

INSERT INTO `wp_latepoint_bookings` (`id`, `start_date`, `end_date`, `start_time`, `end_time`, `buffer_before`, `buffer_after`, `duration`, `price`, `status`, `customer_id`, `service_id`, `agent_id`, `location_id`, `total_attendies`, `payment_method`, `payment_portion`, `ip_address`, `coupon_code`, `customer_comment`, `created_at`, `updated_at`) VALUES
(12, '2021-07-13', '2021-07-13', 480, 720, 60, 60, 0, '3.00', 'approved', 3, 1, 1, 1, 1, NULL, NULL, NULL, NULL, '', '2021-07-08 04:48:46', '2021-07-08 04:48:46'),
(13, '2021-07-15', '2021-07-15', 480, 1020, 0, 0, 0, '6.00', 'approved', 3, 2, 1, 1, 1, NULL, NULL, NULL, NULL, '', '2021-07-08 04:49:29', '2021-07-08 04:49:29'),
(14, '2021-07-22', '2021-07-22', 480, 1020, 0, 0, 0, '18.00', 'approved', 3, 3, 1, 1, 1, NULL, NULL, NULL, NULL, '', '2021-07-08 04:49:54', '2021-07-08 04:49:54'),
(15, '2021-07-17', '2021-07-17', 480, 1020, 0, 0, 0, '18.00', 'approved', 3, 3, 3, 1, 1, NULL, NULL, NULL, NULL, '', '2021-07-08 07:48:08', '2021-07-08 07:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_booking_meta`
--

CREATE TABLE `wp_latepoint_booking_meta` (
  `id` mediumint(9) NOT NULL,
  `object_id` mediumint(9) NOT NULL,
  `meta_key` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_customers`
--

CREATE TABLE `wp_latepoint_customers` (
  `id` mediumint(9) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_image_id` int(11) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_nonse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wordpress_user_id` int(11) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_customers`
--

INSERT INTO `wp_latepoint_customers` (`id`, `first_name`, `last_name`, `email`, `phone`, `avatar_image_id`, `status`, `password`, `activation_key`, `account_nonse`, `google_user_id`, `facebook_user_id`, `wordpress_user_id`, `is_guest`, `notes`, `admin_notes`, `created_at`, `updated_at`) VALUES
(1, 'rakewsh', 'eddaw', 'r@gmail.com', '353453', NULL, 'pending_verification', '$P$B24BqW6CmoW4Jjy6.34FCymX2Uk5Tp/', 'd3b7f365a5553a5c90bdfcc21ae21ecfaaa7d4f4', 'e87909064d2daec25f540d00a4a2970fdd0465d8', NULL, NULL, NULL, 1, '5345', '', '2021-07-05 08:49:19', '2021-07-05 08:49:19'),
(2, 'Tst', 'Usr', 'test@usr.com', '1342353454', NULL, 'pending_verification', '$P$BcEdcmCoAdyeq/USoDrJNe5ZEhhvHC/', 'c99403ad320ced410760b9ccff96191926341302', 'e4976a9e2744d25800a3a2ca2f456b33630a8536', NULL, NULL, 4, 0, 'dss', 'vdfggf', '2021-07-05 11:48:43', '2021-07-05 11:49:09'),
(3, 'rakesh', 'raju', 'admin@gmail.com', '5465466546', NULL, 'pending_verification', '$P$B.X.TzueIquyFiJCVf17kRQuplqGCv1', 'fffe5804286d420b93d0914d5cc04a0981d57fef', 'f7d898020e2c654b77490629fce6a22903075df5', NULL, NULL, 1, 0, '', NULL, '2021-07-05 11:49:28', '2021-07-08 07:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_customer_meta`
--

CREATE TABLE `wp_latepoint_customer_meta` (
  `id` mediumint(9) NOT NULL,
  `object_id` mediumint(9) NOT NULL,
  `meta_key` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_customer_meta`
--

INSERT INTO `wp_latepoint_customer_meta` (`id`, `object_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(1, 3, 'latepoint_selected_timezone_bbfa5b726c6b7a9cf3cda9370be3ee91', '+00:00', '2021-07-06 05:14:53', '2021-07-06 05:14:53'),
(2, 3, 'timezone_name', '+00:00', '2021-07-06 05:16:09', '2021-07-08 07:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_custom_prices`
--

CREATE TABLE `wp_latepoint_custom_prices` (
  `id` mediumint(9) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_price_variable` tinyint(1) DEFAULT NULL,
  `price_min` decimal(10,2) DEFAULT NULL,
  `price_max` decimal(10,2) DEFAULT NULL,
  `charge_amount` decimal(10,2) DEFAULT NULL,
  `is_deposit_required` tinyint(1) DEFAULT NULL,
  `deposit_value` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_locations`
--

CREATE TABLE `wp_latepoint_locations` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selection_image_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_locations`
--

INSERT INTO `wp_latepoint_locations` (`id`, `name`, `full_address`, `status`, `selection_image_id`, `created_at`, `updated_at`) VALUES
(1, 'Main Location', NULL, 'active', NULL, '2021-07-05 08:05:37', '2021-07-05 08:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_sent_reminders`
--

CREATE TABLE `wp_latepoint_sent_reminders` (
  `id` mediumint(9) NOT NULL,
  `booking_id` mediumint(9) NOT NULL,
  `reminder_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_services`
--

CREATE TABLE `wp_latepoint_services` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_price_variable` tinyint(1) DEFAULT NULL,
  `price_min` decimal(10,2) DEFAULT NULL,
  `price_max` decimal(10,2) DEFAULT NULL,
  `charge_amount` decimal(10,2) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `is_deposit_required` tinyint(1) DEFAULT NULL,
  `deposit_value` decimal(10,2) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `buffer_before` int(11) DEFAULT NULL,
  `buffer_after` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `selection_image_id` int(11) DEFAULT NULL,
  `description_image_id` int(11) DEFAULT NULL,
  `bg_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeblock_interval` int(11) DEFAULT NULL,
  `capacity_min` int(4) DEFAULT NULL,
  `capacity_max` int(4) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_services`
--

INSERT INTO `wp_latepoint_services` (`id`, `name`, `short_description`, `is_price_variable`, `price_min`, `price_max`, `charge_amount`, `deposit_amount`, `is_deposit_required`, `deposit_value`, `duration`, `buffer_before`, `buffer_after`, `category_id`, `order_number`, `selection_image_id`, `description_image_id`, `bg_color`, `timeblock_interval`, `capacity_min`, `capacity_max`, `status`, `visibility`, `created_at`, `updated_at`) VALUES
(1, 'OSCE Half day section', '', NULL, '3.00', '0.00', '3.00', '0.00', NULL, NULL, 240, 60, 60, 1, NULL, 56, NULL, '#2752E4', 0, 1, 1, 'active', 'visible', '2021-07-05 08:07:26', '2021-07-06 06:06:08'),
(2, 'OSCE Full Day Session', '', NULL, '6.00', '0.00', '6.00', '0.00', NULL, NULL, 540, 0, 0, 1, NULL, 56, NULL, '#C066F1', 0, 1, 1, 'active', 'visible', '2021-07-06 05:36:30', '2021-07-06 06:06:35'),
(3, 'OSCE Three day session', '', NULL, '18.00', '0.00', '18.00', '0.00', NULL, NULL, 540, 0, 0, 1, NULL, 56, NULL, '#26B7DD', 0, 1, 1, 'active', 'visible', '2021-07-06 05:44:28', '2021-07-06 06:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_service_categories`
--

CREATE TABLE `wp_latepoint_service_categories` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` mediumint(9) DEFAULT NULL,
  `selection_image_id` int(11) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_service_categories`
--

INSERT INTO `wp_latepoint_service_categories` (`id`, `name`, `short_description`, `parent_id`, `selection_image_id`, `order_number`, `created_at`, `updated_at`) VALUES
(1, 'half day', '', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_service_meta`
--

CREATE TABLE `wp_latepoint_service_meta` (
  `id` mediumint(9) NOT NULL,
  `object_id` mediumint(9) NOT NULL,
  `meta_key` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_service_meta`
--

INSERT INTO `wp_latepoint_service_meta` (`id`, `object_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(1, 1, 'durations', '[]', '2021-07-06 05:14:29', '2021-07-06 06:06:08'),
(2, 2, 'durations', '[]', '2021-07-06 05:36:30', '2021-07-06 06:06:35'),
(3, 3, 'durations', '[]', '2021-07-06 05:44:28', '2021-07-06 06:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_sessions`
--

CREATE TABLE `wp_latepoint_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_key` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint(20) UNSIGNED NOT NULL,
  `hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_settings`
--

CREATE TABLE `wp_latepoint_settings` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_settings`
--

INSERT INTO `wp_latepoint_settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'default_booking_status', 'approved', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(2, 'time_system', '12', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(3, 'date_format', 'd/m/Y', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(4, 'timeblock_interval', '60', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(5, 'show_booking_end_time', 'on', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(6, 'disable_verbose_date_output', 'off', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(7, 'earliest_possible_booking', '', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(8, 'latest_possible_booking', '', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(9, 'max_future_bookings_per_customer', '', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(10, 'one_location_at_time', 'on', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(11, 'currency_symbol_before', '$', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(12, 'currency_symbol_after', '', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(13, 'phone_format', '(999) 999-9999', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(14, 'disable_phone_formatting', 'off', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(15, 'country_phone_code', 'krishna_sagar', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(16, 'color_scheme_for_booking_form', 'blue', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(17, 'border_radius', 'rounded', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(18, 'time_pick_style', 'timeline', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(19, 'hide_timepicker_when_one_slot_available', 'off', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(20, 'enable_google_login', 'off', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(21, 'google_client_id', '', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(22, 'google_client_secret', 'ev1IKEegfiFxRwa3+E6s6w==', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(23, 'enable_facebook_login', 'off', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(24, 'facebook_app_id', '', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(25, 'facebook_app_secret', 'YA0evA25mqKF5/AKZMTcJg==', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(26, 'page_url_customer_dashboard', '/customer-dashboard', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(27, 'page_url_customer_login', '/customer-login', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(28, 'wp_users_as_customers', 'on', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(29, 'allow_customer_booking_cancellation', 'on', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(30, 'day_calendar_min_height', '700', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(31, 'customer_dashboard_book_shortcode', '[latepoint_book_button]', '2021-07-05 08:57:34', '2021-07-06 06:26:50'),
(32, 'steps_show_service_categories', 'off', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(33, 'steps_show_agent_bio', 'off', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(34, 'steps_hide_login_register_tabs', 'off', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(35, 'steps_hide_registration_prompt', 'off', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(36, 'steps_require_setting_password', 'off', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(37, 'steps_hide_agent_info', 'off', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(38, 'steps_skip_verify_step', 'on', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(39, 'steps_always_show_agent_step', 'off', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(40, 'allow_any_agent', 'off', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(41, 'any_agent_order', 'random', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(42, 'steps_support_text', '<h5>Questions?</h5>\r\nCall (858) 939-3746 for help', '2021-07-05 11:47:13', '2021-07-06 06:12:08'),
(43, 'confirmation_step_tracking_code', '', '2021-07-05 11:47:13', '2021-07-06 06:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_step_settings`
--

CREATE TABLE `wp_latepoint_step_settings` (
  `id` mediumint(9) NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_step_settings`
--

INSERT INTO `wp_latepoint_step_settings` (`id`, `label`, `value`, `step`, `created_at`, `updated_at`) VALUES
(1, 'order_number', '4', 'datepicker', '2021-07-05 11:50:12', '2021-07-07 10:03:39'),
(2, 'icon_image_id', '', 'datepicker', '2021-07-05 11:50:12', '2021-07-07 10:03:39'),
(3, 'title', 'Select Date & Time', 'datepicker', '2021-07-05 11:50:12', '2021-07-07 10:03:39'),
(4, 'sub_title', 'Date & Time Selection', 'datepicker', '2021-07-05 11:50:12', '2021-07-07 10:03:39'),
(5, 'use_custom_image', 'off', 'datepicker', '2021-07-05 11:50:12', '2021-07-07 10:03:39'),
(6, 'description', 'Click on a date to see a timeline of available slots, click on a green time slot to reserve it', 'datepicker', '2021-07-05 11:50:12', '2021-07-07 10:03:39'),
(7, 'order_number', '3', 'agents', '2021-07-06 05:47:48', '2021-07-07 10:03:39'),
(8, 'icon_image_id', '', 'agents', '2021-07-06 05:47:48', '2021-07-07 10:03:39'),
(9, 'title', 'Select Location', 'agents', '2021-07-06 05:47:48', '2021-07-07 10:03:39'),
(10, 'sub_title', 'Select Location', 'agents', '2021-07-06 05:47:48', '2021-07-07 10:03:39'),
(11, 'use_custom_image', 'off', 'agents', '2021-07-06 05:47:48', '2021-07-07 10:03:39'),
(12, 'description', 'You can pick a specific locationto perform your service or select any to automatically assign you one', 'agents', '2021-07-06 05:47:48', '2021-07-07 10:03:39'),
(13, 'order_number', '1', 'locations', '2021-07-06 06:09:28', '2021-07-07 10:03:39'),
(14, 'icon_image_id', '', 'locations', '2021-07-06 06:09:28', '2021-07-07 10:03:39'),
(15, 'title', 'Select Location', 'locations', '2021-07-06 06:09:28', '2021-07-07 10:03:39'),
(16, 'sub_title', 'Select Location', 'locations', '2021-07-06 06:09:28', '2021-07-07 10:03:39'),
(17, 'use_custom_image', 'off', 'locations', '2021-07-06 06:09:28', '2021-07-07 10:03:39'),
(18, 'description', 'Please select a location you want the service to be performed at', 'locations', '2021-07-06 06:09:28', '2021-07-07 10:03:39'),
(19, 'order_number', '2', 'services', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(20, 'icon_image_id', NULL, 'services', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(21, 'title', 'Select Service', 'services', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(22, 'sub_title', 'Service Selection', 'services', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(23, 'use_custom_image', 'off', 'services', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(24, 'description', 'Please select a service for which you want to schedule an appointment', 'services', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(25, 'order_number', '5', 'contact', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(26, 'icon_image_id', NULL, 'contact', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(27, 'title', 'Enter Information', 'contact', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(28, 'sub_title', 'Customer Information', 'contact', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(29, 'use_custom_image', 'off', 'contact', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(30, 'description', 'Please provide you contact details so we can send you a confirmation and other contact info', 'contact', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(31, 'order_number', '6', 'payment', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(32, 'icon_image_id', NULL, 'payment', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(33, 'title', 'Payment Method', 'payment', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(34, 'sub_title', 'Your Payment Information', 'payment', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(35, 'use_custom_image', 'off', 'payment', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(36, 'description', 'You can either pay online using your credit card or PayPal, or you can pay on arrival with cash', 'payment', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(37, 'order_number', '7', 'verify', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(38, 'icon_image_id', NULL, 'verify', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(39, 'title', 'Verify Order Details', 'verify', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(40, 'sub_title', 'Verify Booking Details', 'verify', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(41, 'use_custom_image', 'off', 'verify', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(42, 'description', 'Double check your reservation details and click submit button if everything is correct', 'verify', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(43, 'order_number', '8', 'confirmation', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(44, 'icon_image_id', NULL, 'confirmation', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(45, 'title', 'Confirmation', 'confirmation', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(46, 'sub_title', 'Appointment Confirmation', 'confirmation', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(47, 'use_custom_image', 'off', 'confirmation', '2021-07-07 10:02:27', '2021-07-07 10:03:39'),
(48, 'description', 'Your appointment has been successfully scheduled. Please retain this confirmation for your record.', 'confirmation', '2021-07-07 10:02:27', '2021-07-07 10:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_transactions`
--

CREATE TABLE `wp_latepoint_transactions` (
  `id` mediumint(9) NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `processor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funds_status` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_latepoint_work_periods`
--

CREATE TABLE `wp_latepoint_work_periods` (
  `id` mediumint(9) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `start_time` smallint(6) NOT NULL,
  `end_time` smallint(6) NOT NULL,
  `week_day` tinyint(3) NOT NULL,
  `custom_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_latepoint_work_periods`
--

INSERT INTO `wp_latepoint_work_periods` (`id`, `agent_id`, `service_id`, `location_id`, `start_time`, `end_time`, `week_day`, `custom_date`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 0, 480, 1020, 1, NULL, '2021-07-05 08:07:29', '2021-07-05 08:12:15'),
(2, 0, 0, 0, 480, 1020, 2, NULL, '2021-07-05 08:07:29', '2021-07-05 08:12:15'),
(3, 0, 0, 0, 480, 1020, 3, NULL, '2021-07-05 08:07:29', '2021-07-05 08:12:15'),
(4, 0, 0, 0, 480, 1020, 4, NULL, '2021-07-05 08:07:29', '2021-07-05 08:12:15'),
(5, 0, 0, 0, 480, 1020, 5, NULL, '2021-07-05 08:07:29', '2021-07-05 08:12:15'),
(6, 0, 0, 0, 480, 1020, 6, NULL, '2021-07-05 08:07:29', '2021-07-05 08:12:15'),
(7, 0, 0, 0, 480, 1020, 7, NULL, '2021-07-05 08:07:29', '2021-07-05 08:12:15'),
(16, 2, 0, 0, 480, 1020, 1, NULL, '2021-07-05 11:51:42', '2021-07-06 05:42:44'),
(17, 2, 0, 0, 480, 1020, 2, NULL, '2021-07-05 11:51:42', '2021-07-06 05:42:44'),
(18, 2, 0, 0, 480, 1020, 3, NULL, '2021-07-05 11:51:42', '2021-07-06 05:42:44'),
(19, 2, 0, 0, 480, 1020, 4, NULL, '2021-07-05 11:51:42', '2021-07-06 05:42:44'),
(20, 2, 0, 0, 480, 1020, 5, NULL, '2021-07-05 11:51:42', '2021-07-06 05:42:44'),
(21, 2, 0, 0, 480, 1020, 6, NULL, '2021-07-05 11:51:42', '2021-07-06 05:42:44'),
(22, 2, 0, 0, 480, 1020, 7, NULL, '2021-07-05 11:51:42', '2021-07-06 05:42:44'),
(25, 0, 1, 0, 480, 720, 1, NULL, '2021-07-06 05:14:29', '2021-07-06 06:06:08'),
(26, 0, 1, 0, 480, 720, 2, NULL, '2021-07-06 05:14:29', '2021-07-06 06:06:08'),
(27, 0, 1, 0, 480, 720, 3, NULL, '2021-07-06 05:14:29', '2021-07-06 06:06:08'),
(28, 0, 1, 0, 480, 720, 4, NULL, '2021-07-06 05:14:29', '2021-07-06 06:06:08'),
(29, 0, 1, 0, 480, 720, 5, NULL, '2021-07-06 05:14:29', '2021-07-06 06:06:08'),
(30, 0, 1, 0, 480, 720, 6, NULL, '2021-07-06 05:14:29', '2021-07-06 06:06:08'),
(31, 0, 1, 0, 480, 720, 7, NULL, '2021-07-06 05:14:29', '2021-07-06 06:06:08'),
(32, 0, 2, 0, 480, 1020, 1, NULL, '2021-07-06 05:36:30', '2021-07-06 06:06:36'),
(33, 0, 2, 0, 480, 1020, 2, NULL, '2021-07-06 05:36:30', '2021-07-06 06:06:36'),
(34, 0, 2, 0, 480, 1020, 3, NULL, '2021-07-06 05:36:30', '2021-07-06 06:06:36'),
(35, 0, 2, 0, 480, 1020, 4, NULL, '2021-07-06 05:36:30', '2021-07-06 06:06:36'),
(36, 0, 2, 0, 480, 1020, 5, NULL, '2021-07-06 05:36:30', '2021-07-06 06:06:36'),
(37, 0, 2, 0, 480, 1020, 6, NULL, '2021-07-06 05:36:30', '2021-07-06 06:06:36'),
(38, 0, 2, 0, 480, 1020, 7, NULL, '2021-07-06 05:36:30', '2021-07-06 06:06:36'),
(39, 0, 3, 0, 480, 1020, 1, NULL, '2021-07-06 05:44:28', '2021-07-06 06:06:55'),
(40, 0, 3, 0, 480, 1020, 2, NULL, '2021-07-06 05:44:28', '2021-07-06 06:06:55'),
(41, 0, 3, 0, 480, 1020, 3, NULL, '2021-07-06 05:44:28', '2021-07-06 06:06:55'),
(42, 0, 3, 0, 480, 1020, 4, NULL, '2021-07-06 05:44:28', '2021-07-06 06:06:55'),
(43, 0, 3, 0, 480, 1020, 5, NULL, '2021-07-06 05:44:28', '2021-07-06 06:06:55'),
(44, 0, 3, 0, 480, 1020, 6, NULL, '2021-07-06 05:44:28', '2021-07-06 06:06:55'),
(45, 0, 3, 0, 480, 1020, 7, NULL, '2021-07-06 05:44:28', '2021-07-06 06:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'Scheduler', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:183:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:7:\"shop/?$\";s:27:\"index.php?post_type=product\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:47:\"booked_appointments/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"booked_appointments/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"booked_appointments/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"booked_appointments/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"booked_appointments/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"booked_appointments/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:36:\"booked_appointments/([^/]+)/embed/?$\";s:52:\"index.php?booked_appointments=$matches[1]&embed=true\";s:40:\"booked_appointments/([^/]+)/trackback/?$\";s:46:\"index.php?booked_appointments=$matches[1]&tb=1\";s:48:\"booked_appointments/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?booked_appointments=$matches[1]&paged=$matches[2]\";s:55:\"booked_appointments/([^/]+)/comment-page-([0-9]{1,})/?$\";s:59:\"index.php?booked_appointments=$matches[1]&cpage=$matches[2]\";s:45:\"booked_appointments/([^/]+)/wc-api(/(.*))?/?$\";s:60:\"index.php?booked_appointments=$matches[1]&wc-api=$matches[3]\";s:51:\"booked_appointments/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:62:\"booked_appointments/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:44:\"booked_appointments/([^/]+)(?:/([0-9]+))?/?$\";s:58:\"index.php?booked_appointments=$matches[1]&page=$matches[2]\";s:36:\"booked_appointments/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"booked_appointments/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"booked_appointments/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"booked_appointments/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"booked_appointments/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"booked_appointments/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:56:\"custom-calendar/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:62:\"index.php?booked_custom_calendars=$matches[1]&feed=$matches[2]\";s:51:\"custom-calendar/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:62:\"index.php?booked_custom_calendars=$matches[1]&feed=$matches[2]\";s:32:\"custom-calendar/([^/]+)/embed/?$\";s:56:\"index.php?booked_custom_calendars=$matches[1]&embed=true\";s:44:\"custom-calendar/([^/]+)/page/?([0-9]{1,})/?$\";s:63:\"index.php?booked_custom_calendars=$matches[1]&paged=$matches[2]\";s:26:\"custom-calendar/([^/]+)/?$\";s:45:\"index.php?booked_custom_calendars=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:25:\"([^/]+)/wc-api(/(.*))?/?$\";s:45:\"index.php?name=$matches[1]&wc-api=$matches[3]\";s:31:\"[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:17:\"booked/booked.php\";i:1;s:37:\"easyappointments/easyappointments.php\";i:2;s:23:\"latepoint/latepoint.php\";i:3;s:25:\"pluginajax/pluginajax.php\";i:4;s:29:\"woo-razorpay/woo-razorpay.php\";i:5;s:27:\"woocommerce/woocommerce.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:68:\"C:\\xampp\\htdocs\\wordpress/wp-content/plugins/latepoint/latepoint.php\";i:2;s:64:\"C:\\xampp\\htdocs\\wordpress/wp-content/plugins/akismet/akismet.php\";i:3;s:62:\"C:\\xampp\\htdocs\\wordpress/wp-content/plugins/booked/booked.php\";i:4;s:80:\"C:\\xampp\\htdocs\\wordpress/wp-content/plugins/booked/includes/admin-functions.php\";i:5;s:73:\"C:\\xampp\\htdocs\\wordpress/wp-content/plugins/booked/dist/booked-admin.css\";}', 'no'),
(40, 'template', 'twentytwentyone', 'yes'),
(41, 'stylesheet', 'twentytwentyone', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '49752', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:3:{s:28:\"appointment-booking/main.php\";a:2:{i:0;s:17:\"Bookly\\Lib\\Plugin\";i:1;s:9:\"uninstall\";}s:51:\"bookly-responsive-appointment-booking-tool/main.php\";a:2:{i:0;s:17:\"Bookly\\Lib\\Plugin\";i:1;s:9:\"uninstall\";}s:26:\"easy-appointments/main.php\";a:2:{i:0;s:15:\"EasyAppointment\";i:1;s:9:\"uninstall\";}}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1639808779', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'initial_db_version', '49752', 'yes'),
(99, 'wp_user_roles', 'a:9:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:117:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:24:\"edit_booked_appointments\";b:1;s:21:\"manage_booked_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;s:15:\"manage_database\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:20:\"booked_booking_agent\";a:2:{s:4:\"name\";s:13:\"Booking Agent\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:24:\"edit_booked_appointments\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:15:\"latepoint_agent\";a:2:{s:4:\"name\";s:15:\"LatePoint Agent\";s:12:\"capabilities\";a:3:{s:4:\"read\";b:1;s:12:\"upload_files\";b:1;s:13:\"edit_bookings\";b:1;}}}', 'yes'),
(100, 'fresh_site', '0', 'yes'),
(101, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(107, 'cron', 'a:24:{i:1625806634;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1625806776;a:2:{s:26:\"booked_send_user_reminders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:16:\"booked_everyfive\";s:4:\"args\";a:0:{}s:8:\"interval\";i:300;}}s:27:\"booked_send_admin_reminders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:16:\"booked_everyfive\";s:4:\"args\";a:0:{}s:8:\"interval\";i:300;}}}i:1625807137;a:1:{s:24:\"latepoint_send_reminders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1625807777;a:1:{s:21:\"bookly_hourly_routine\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1625808380;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1625809183;a:1:{s:33:\"wc_admin_process_orders_milestone\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1625809189;a:1:{s:29:\"wc_admin_unsnooze_admin_notes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1625809624;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1625811979;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625811980;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1625812003;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625812005;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625812252;a:1:{s:27:\"check_plugin_updates-booked\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1625814721;a:1:{s:40:\"check_plugin_updates-appointment-booking\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625814977;a:1:{s:20:\"bookly_daily_routine\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625816383;a:1:{s:14:\"wc_admin_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625817937;a:1:{s:30:\"latepoint_check_plugin_version\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625824946;a:2:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625835736;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1625846536;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1625875200;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1626157580;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1626256996;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:11:\"fifteendays\";s:4:\"args\";a:0:{}s:8:\"interval\";i:1296000;}}}s:7:\"version\";i:2;}', 'yes'),
(108, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'recovery_keys', 'a:1:{s:22:\"NYhPVvgMrDBD6kSNs54nw2\";a:2:{s:10:\"hashed_key\";s:34:\"$P$BYnzWJjiCKtYCfqiE8D6sZcNYoOtUr.\";s:10:\"created_at\";i:1625748158;}}', 'yes'),
(119, 'theme_mods_twentytwentyone', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(120, 'https_detection_errors', 'a:1:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:24:\"SSL verification failed.\";}}', 'yes'),
(121, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.7.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.7.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.7.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.7.2-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.7.2\";s:7:\"version\";s:5:\"5.7.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1625806026;s:15:\"version_checked\";s:5:\"5.7.2\";s:12:\"translations\";a:0:{}}', 'no'),
(127, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1625806027;s:7:\"checked\";a:3:{s:14:\"twentynineteen\";s:3:\"2.0\";s:12:\"twentytwenty\";s:3:\"1.7\";s:15:\"twentytwentyone\";s:3:\"1.3\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.2.0.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.7.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.3.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no'),
(135, 'can_compress_scripts', '1', 'no'),
(146, 'recently_activated', 'a:2:{s:26:\"easy-appointments/main.php\";i:1625470859;s:31:\"scheduler-new/scheduler-new.php\";i:1625203344;}', 'yes'),
(149, 'finished_updating_comment_type', '1', 'yes'),
(156, 'widget_booked_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(157, 'booked_version_check', '2.3', 'yes'),
(161, 'external_updates-booked', 'O:8:\"stdClass\":3:{s:9:\"lastCheck\";i:1625806029;s:14:\"checkedVersion\";s:3:\"2.3\";s:6:\"update\";O:8:\"stdClass\":7:{s:2:\"id\";i:0;s:4:\"slug\";s:6:\"booked\";s:7:\"version\";s:5:\"2.3.5\";s:8:\"homepage\";s:20:\"https://getbooked.io\";s:12:\"download_url\";s:55:\"http://boxyupdates.com/get/?action=download&slug=booked\";s:14:\"upgrade_notice\";N;s:8:\"filename\";s:17:\"booked/booked.php\";}}', 'no'),
(162, 'booked_login_redirect_page', '', 'yes'),
(163, 'booked_custom_login_message', 'esfeswfewtgewtwt', 'yes'),
(164, 'booked_appointment_redirect_type', '', 'yes'),
(165, 'booked_appointment_success_redirect_page', '', 'yes'),
(166, 'booked_registration_name_requirements', 'a:1:{i:0;s:15:\"require_surname\";}', 'yes'),
(167, 'booked_hide_admin_bar_menu', '', 'yes'),
(168, 'booked_timeslot_intervals', '120', 'yes'),
(169, 'booked_appointment_buffer', '0', 'yes'),
(170, 'booked_appointment_limit', '0', 'yes'),
(171, 'booked_cancellation_buffer', '0', 'yes'),
(172, 'booked_new_appointment_default', 'publish', 'yes'),
(173, 'booked_prevent_appointments_before', '', 'yes'),
(174, 'booked_prevent_appointments_after', '', 'yes'),
(175, 'booked_booking_type', 'registered', 'yes'),
(176, 'booked_require_guest_email_address', 'true', 'yes'),
(177, 'booked_hide_default_calendar', '', 'yes'),
(178, 'booked_hide_unavailable_timeslots', '', 'yes'),
(179, 'booked_hide_google_link', '', 'yes'),
(180, 'booked_hide_weekends', '', 'yes'),
(181, 'booked_dont_allow_user_cancellations', '', 'yes'),
(182, 'booked_show_only_titles', '', 'yes'),
(183, 'booked_hide_end_times', '', 'yes'),
(184, 'booked_hide_available_timeslots', '', 'yes'),
(185, 'booked_public_appointments', '', 'yes'),
(186, 'booked_redirect_non_admins', '', 'yes'),
(187, 'booked_light_color', '#0073AA', 'yes'),
(188, 'booked_dark_color', '#015e8c', 'yes'),
(189, 'booked_button_color', '#56C477', 'yes'),
(190, 'booked_email_logo', 'http://localhost/wordpress/wp-content/uploads/2021/06/pws-logo-svg.png', 'yes'),
(191, 'booked_default_email_user', '', 'yes'),
(192, 'booked_email_force_sender', '', 'yes'),
(193, 'booked_email_force_sender_from', 'admin@gmail.com', 'yes'),
(194, 'booked_emailer_disabled', '', 'yes'),
(195, 'booked_reminder_buffer', '30', 'yes'),
(196, 'booked_admin_reminder_buffer', '30', 'yes'),
(197, 'booked_reminder_email', 'Just a friendly reminder that you have an appointment coming up soon! Here\'s the appointment information:\r\n\r\n<strong>Calendar:</strong> %calendar%\r\n<strong>Date:</strong> %date%\r\n<strong>Time:</strong> %time%\r\n\r\nSincerely,\r\nYour friends at Scheduler', 'yes'),
(198, 'booked_admin_reminder_email', 'You have an appointment coming up soon! Here\'s the appointment information:\r\n\r\n<strong>Customer:</strong> %name%\r\n<strong>Date:</strong> %date%\r\n<strong>Time:</strong> %time%\r\n\r\n(Sent via the Scheduler website)', 'yes'),
(199, 'booked_reminder_email_subject', 'Reminder: You have an appointment coming up soon!', 'yes'),
(200, 'booked_admin_reminder_email_subject', 'An appointment is coming up soon!', 'yes'),
(201, 'booked_registration_email_subject', 'Thank you for registering!', 'yes'),
(202, 'booked_registration_email_content', 'Hey %name%!\r\n\r\nThanks for registering at Scheduler. You can now login to manage your account and appointments using the following credentials:\r\n\r\nEmail Address: %email%\r\nPassword: %password%\r\n\r\nSincerely,\r\nYour friends at Scheduler', 'yes'),
(203, 'booked_approval_email_content', 'Hey %name%!\r\n\r\nThe appointment you requested at Scheduler has been approved! Here\'s your appointment information:\r\n\r\nDate: %date%\r\nTime: %time%\r\n\r\nSincerely,\r\nYour friends at Scheduler', 'yes'),
(204, 'booked_approval_email_subject', 'Your appointment has been approved!', 'yes'),
(205, 'booked_cancellation_email_content', 'Hey %name%!\r\n\r\nThe appointment you requested at Scheduler has been cancelled. For reference, here\'s the appointment information:\r\n\r\nDate: %date%\r\nTime: %time%\r\n\r\nSincerely,\r\nYour friends at Scheduler', 'yes'),
(206, 'booked_cancellation_email_subject', 'Your appointment has been cancelled.', 'yes'),
(207, 'booked_appt_confirmation_email_content', 'Hey %name%!\r\n\r\nThis is just an email to confirm your appointment. For reference, here\'s the appointment information:\r\n\r\nDate: %date%\r\nTime: %time%\r\n\r\nSincerely,\r\nYour friends at Scheduler', 'yes'),
(208, 'booked_appt_confirmation_email_subject', 'Your appointment confirmation from Scheduler.', 'yes'),
(209, 'booked_admin_appointment_email_content', 'You have a new appointment request! Here\'s the appointment information:\r\n\r\nCustomer: %name%\r\nDate: %date%\r\nTime: %time%\r\n\r\nLog into your website here: http://localhost/wordpress/wp-admin/ to approve this appointment.\r\n\r\n(Sent via the Scheduler website)', 'yes'),
(210, 'booked_admin_appointment_email_subject', 'You have a new appointment request!', 'yes'),
(211, 'booked_admin_cancellation_email_content', 'One of your customers has cancelled their appointment. Here\'s the appointment information:\r\n\r\nCustomer: %name%\r\nDate: %date%\r\nTime: %time%\r\n\r\n(Sent via the Scheduler website)', 'yes'),
(212, 'booked_admin_cancellation_email_subject', 'An appointment has been cancelled.', 'yes'),
(216, 'booked_defaults', 'a:14:{s:3:\"Mon\";a:1:{s:9:\"1000-1800\";s:1:\"2\";}s:11:\"Mon-details\";a:1:{s:9:\"1000-1800\";a:1:{s:5:\"title\";s:0:\"\";}}s:3:\"Tue\";a:1:{s:9:\"0000-1800\";i:1;}s:11:\"Tue-details\";a:1:{s:9:\"0000-1800\";a:1:{s:5:\"title\";s:0:\"\";}}s:3:\"Wed\";a:1:{s:9:\"0000-1800\";i:1;}s:11:\"Wed-details\";a:1:{s:9:\"0000-1800\";a:1:{s:5:\"title\";s:0:\"\";}}s:3:\"Thu\";a:1:{s:9:\"0000-1800\";i:1;}s:11:\"Thu-details\";a:1:{s:9:\"0000-1800\";a:1:{s:5:\"title\";s:0:\"\";}}s:3:\"Fri\";a:1:{s:9:\"0000-1800\";i:1;}s:11:\"Fri-details\";a:1:{s:9:\"0000-1800\";a:1:{s:5:\"title\";s:0:\"\";}}s:3:\"Sat\";a:1:{s:9:\"0000-1800\";i:1;}s:11:\"Sat-details\";a:1:{s:9:\"0000-1800\";a:1:{s:5:\"title\";s:0:\"\";}}s:3:\"Sun\";a:1:{s:9:\"0000-1800\";i:1;}s:11:\"Sun-details\";a:1:{s:9:\"0000-1800\";a:1:{s:5:\"title\";s:0:\"\";}}}', 'yes'),
(217, 'booked_custom_fields', '[{\\\"name\\\":\\\"drop-down-label---2811302\\\",\\\"value\\\":\\\"Choose your sessions\\\"},{\\\"name\\\":\\\"single-drop-down---10842216\\\",\\\"value\\\":\\\"Half day\\\"},{\\\"name\\\":\\\"single-drop-down---2544030\\\",\\\"value\\\":\\\"Full Day\\\"},{\\\"name\\\":\\\"single-drop-down---10831290\\\",\\\"value\\\":\\\"3 Day\\\"},{\\\"name\\\":\\\"required---2811302\\\",\\\"value\\\":true}]', 'yes'),
(221, 'taxonomy_2', 'a:1:{s:21:\"notifications_user_id\";s:0:\"\";}', 'yes'),
(223, 'taxonomy_3', 'a:1:{s:21:\"notifications_user_id\";s:0:\"\";}', 'yes'),
(228, 'external_updates-booked-frontend-agents', 'O:8:\"stdClass\":3:{s:9:\"lastCheck\";i:1624258539;s:14:\"checkedVersion\";s:6:\"1.1.13\";s:6:\"update\";O:8:\"stdClass\":7:{s:2:\"id\";i:0;s:4:\"slug\";s:22:\"booked-frontend-agents\";s:7:\"version\";s:6:\"1.1.16\";s:8:\"homepage\";s:20:\"https://getbooked.io\";s:12:\"download_url\";s:71:\"http://boxyupdates.com/get/?action=download&slug=booked-frontend-agents\";s:14:\"upgrade_notice\";N;s:8:\"filename\";s:49:\"booked-frontend-agents/booked-frontend-agents.php\";}}', 'no'),
(421, 'external_updates-appointment-booking', 'O:8:\"stdClass\":3:{s:9:\"lastCheck\";i:1624258637;s:14:\"checkedVersion\";s:4:\"15.1\";s:6:\"update\";O:8:\"stdClass\":8:{s:2:\"id\";i:0;s:4:\"slug\";s:19:\"appointment-booking\";s:7:\"version\";s:4:\"15.1\";s:8:\"homepage\";N;s:6:\"tested\";N;s:12:\"download_url\";N;s:14:\"upgrade_notice\";N;s:8:\"filename\";s:28:\"appointment-booking/main.php\";}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(422, 'bookly_last_updated_info', '2021-06-21 06:57:18', 'yes'),
(424, 'booked_defaults_3', 'a:2:{s:3:\"Tue\";a:1:{s:9:\"0000-1000\";i:2;}s:11:\"Tue-details\";a:1:{s:9:\"0000-1000\";a:1:{s:5:\"title\";s:0:\"\";}}}', 'yes'),
(425, 'booked_defaults_2', 'a:2:{s:3:\"Wed\";a:1:{s:9:\"0000-1800\";i:2;}s:11:\"Wed-details\";a:1:{s:9:\"0000-1800\";a:1:{s:5:\"title\";s:0:\"\";}}}', 'yes'),
(427, 'booked_disabled_timeslots', 'a:2:{i:2;a:1:{s:10:\"2021-06-23\";a:1:{s:9:\"0000-1800\";b:1;}}i:0;a:1:{s:10:\"2021-06-03\";a:0:{}}}', 'yes'),
(433, 'bookly_data_loaded', '1', 'yes'),
(434, 'bookly_db_version', '19.8', 'yes'),
(435, 'bookly_installation_time', '1624259777', 'yes'),
(436, 'bookly_admin_preferred_language', '', 'yes'),
(437, 'bookly_app_color', '#f4662f', 'yes'),
(438, 'bookly_app_custom_styles', '', 'yes'),
(439, 'bookly_app_required_employee', '0', 'yes'),
(440, 'bookly_app_service_name_with_duration', '0', 'yes'),
(441, 'bookly_app_show_blocked_timeslots', '0', 'yes'),
(442, 'bookly_app_show_calendar', '0', 'yes'),
(443, 'bookly_app_show_day_one_column', '0', 'yes'),
(444, 'bookly_app_show_login_button', '0', 'yes'),
(445, 'bookly_app_show_notes', '1', 'yes'),
(446, 'bookly_app_show_progress_tracker', '1', 'yes'),
(447, 'bookly_app_align_buttons_left', '0', 'yes'),
(448, 'bookly_app_staff_name_with_price', '1', 'yes'),
(449, 'bookly_app_show_email_confirm', '0', 'yes'),
(450, 'bookly_app_show_start_over', '1', 'yes'),
(451, 'bookly_l10n_button_apply', 'Apply', 'yes'),
(452, 'bookly_l10n_button_back', 'Back', 'yes'),
(453, 'bookly_l10n_info_complete_step', 'Thank you! Your booking is complete. An email with details of your booking has been sent to you.', 'yes'),
(454, 'bookly_l10n_info_complete_step_limit_error', 'You are trying to use the service too often. Please contact us to make a booking.', 'yes'),
(455, 'bookly_l10n_info_complete_step_processing', 'Your payment has been accepted for processing.', 'yes'),
(456, 'bookly_l10n_info_details_step', 'You selected a booking for {service_name} by {staff_name} at {appointment_time} on {appointment_date}. The price for the service is {service_price}.\nPlease provide your details in the form below to proceed with booking.', 'yes'),
(457, 'bookly_l10n_info_details_step_guest', '', 'yes'),
(458, 'bookly_l10n_info_payment_step_single_app', 'Please tell us how you would like to pay: ', 'yes'),
(459, 'bookly_l10n_info_service_step', 'Please select service: ', 'yes'),
(460, 'bookly_l10n_info_time_step', 'Below you can find a list of available time slots for {service_name} by {staff_name}.\nClick on a time slot to proceed with booking.', 'yes'),
(461, 'bookly_l10n_label_category', 'Category', 'yes'),
(462, 'bookly_l10n_label_email', 'Email', 'yes'),
(463, 'bookly_l10n_label_email_confirm', 'Confirm email', 'yes'),
(464, 'bookly_l10n_label_employee', 'Employee', 'yes'),
(465, 'bookly_l10n_label_finish_by', 'Finish by', 'yes'),
(466, 'bookly_l10n_label_name', 'Full name', 'yes'),
(467, 'bookly_l10n_label_first_name', 'First name', 'yes'),
(468, 'bookly_l10n_label_last_name', 'Last name', 'yes'),
(469, 'bookly_l10n_label_notes', 'Notes', 'yes'),
(470, 'bookly_l10n_label_pay_locally', 'I will pay locally', 'yes'),
(471, 'bookly_l10n_label_pay_cloud_stripe', 'I will pay now with Credit Card', 'yes'),
(472, 'bookly_l10n_label_phone', 'Phone', 'yes'),
(473, 'bookly_l10n_label_select_date', 'I\'m available on or after', 'yes'),
(474, 'bookly_l10n_label_service', 'Service', 'yes'),
(475, 'bookly_l10n_label_start_from', 'Start from', 'yes'),
(476, 'bookly_l10n_option_category', 'Select category', 'yes'),
(477, 'bookly_l10n_option_employee', 'Any', 'yes'),
(478, 'bookly_l10n_option_service', 'Select service', 'yes'),
(479, 'bookly_l10n_option_day', 'Select day', 'yes'),
(480, 'bookly_l10n_option_month', 'Select month', 'yes'),
(481, 'bookly_l10n_option_year', 'Select year', 'yes'),
(482, 'bookly_l10n_required_email', 'Please tell us your email', 'yes'),
(483, 'bookly_l10n_email_in_use', 'This email is already in use', 'yes'),
(484, 'bookly_l10n_email_confirm_not_match', 'Email confirmation doesn\'t match', 'yes'),
(485, 'bookly_l10n_required_employee', 'Please select an employee', 'yes'),
(486, 'bookly_l10n_required_name', 'Please tell us your name', 'yes'),
(487, 'bookly_l10n_required_first_name', 'Please tell us your first name', 'yes'),
(488, 'bookly_l10n_required_last_name', 'Please tell us your last name', 'yes'),
(489, 'bookly_l10n_required_phone', 'Please tell us your phone', 'yes'),
(490, 'bookly_l10n_required_service', 'Please select a service', 'yes'),
(491, 'bookly_l10n_step_service', 'Service', 'yes'),
(492, 'bookly_l10n_step_time', 'Time', 'yes'),
(493, 'bookly_l10n_step_time_slot_not_available', 'The selected time is not available anymore. Please, choose another time slot.', 'yes'),
(494, 'bookly_l10n_step_details', 'Details', 'yes'),
(495, 'bookly_l10n_step_details_button_login', 'Login', 'yes'),
(496, 'bookly_l10n_step_payment', 'Payment', 'yes'),
(497, 'bookly_l10n_step_done', 'Done', 'yes'),
(498, 'bookly_l10n_step_done_button_start_over', 'Start over', 'yes'),
(499, 'bookly_l10n_step_service_button_next', 'Next', 'yes'),
(500, 'bookly_l10n_step_service_mobile_button_next', 'Next', 'yes'),
(501, 'bookly_l10n_step_details_button_next', 'Next', 'yes'),
(502, 'bookly_l10n_step_payment_button_next', 'Next', 'yes'),
(503, 'bookly_cal_show_only_business_days', '1', 'yes'),
(504, 'bookly_cal_show_only_business_hours', '1', 'yes'),
(505, 'bookly_cal_show_only_staff_with_appointments', '1', 'yes'),
(506, 'bookly_cal_one_participant', '{service_name}\n{client_name}\n{client_phone}\n{client_email}\n{total_price} {payment_type} {payment_status}\nStatus: {status}\nSigned up: {signed_up}\nCapacity: {service_capacity}', 'yes'),
(507, 'bookly_cal_many_participants', '{service_name}\nSigned up: {signed_up}\nCapacity: {service_capacity}', 'yes'),
(508, 'bookly_co_logo_attachment_id', '', 'yes'),
(509, 'bookly_co_name', '', 'yes'),
(510, 'bookly_co_address', '', 'yes'),
(511, 'bookly_co_phone', '', 'yes'),
(512, 'bookly_co_website', '', 'yes'),
(513, 'bookly_cst_allow_duplicates', '0', 'yes'),
(514, 'bookly_cst_cancel_action', 'cancel', 'yes'),
(515, 'bookly_cst_create_account', '0', 'yes'),
(516, 'bookly_cst_default_country_code', '', 'yes'),
(517, 'bookly_cst_first_last_name', '0', 'yes'),
(518, 'bookly_cst_phone_default_country', 'auto', 'yes'),
(519, 'bookly_cst_remember_in_cookie', '0', 'yes'),
(520, 'bookly_cst_required_address', '0', 'yes'),
(521, 'bookly_cst_required_birthday', '0', 'yes'),
(522, 'bookly_cst_required_details', 'a:2:{i:0;s:5:\"phone\";i:1;s:5:\"email\";}', 'yes'),
(523, 'bookly_cst_show_update_details_dialog', '1', 'yes'),
(524, 'bookly_email_sender', 'admin@gmail.com', 'yes'),
(525, 'bookly_email_sender_name', 'Scheduler', 'yes'),
(526, 'bookly_email_send_as', 'html', 'yes'),
(527, 'bookly_email_reply_to_customers', '1', 'yes'),
(528, 'bookly_gen_time_slot_length', '15', 'yes'),
(529, 'bookly_gen_service_duration_as_slot_length', '0', 'yes'),
(530, 'bookly_gen_default_appointment_status', 'approved', 'yes'),
(531, 'bookly_gen_min_time_prior_booking', '0', 'yes'),
(532, 'bookly_gen_min_time_prior_cancel', '0', 'yes'),
(533, 'bookly_gen_max_days_for_booking', '365', 'yes'),
(534, 'bookly_gen_use_client_time_zone', '0', 'yes'),
(535, 'bookly_gen_allow_staff_edit_profile', '1', 'yes'),
(536, 'bookly_gen_link_assets_method', 'enqueue', 'yes'),
(537, 'bookly_gen_collect_stats', '0', 'yes'),
(538, 'bookly_gen_show_powered_by', '0', 'yes'),
(539, 'bookly_gen_prevent_caching', '1', 'yes'),
(540, 'bookly_gen_prevent_session_locking', '0', 'yes'),
(541, 'bookly_url_approve_page_url', 'http://localhost/wordpress', 'yes'),
(542, 'bookly_url_approve_denied_page_url', 'http://localhost/wordpress', 'yes'),
(543, 'bookly_url_cancel_page_url', 'http://localhost/wordpress', 'yes'),
(544, 'bookly_url_cancel_denied_page_url', 'http://localhost/wordpress', 'yes'),
(545, 'bookly_url_reject_page_url', 'http://localhost/wordpress', 'yes'),
(546, 'bookly_url_reject_denied_page_url', 'http://localhost/wordpress', 'yes'),
(547, 'bookly_sms_administrator_phone', '', 'yes'),
(548, 'bookly_sms_undelivered_count', '0', 'yes'),
(549, 'bookly_cloud_notify_low_balance', '1', 'yes'),
(550, 'bookly_cloud_token', '', 'yes'),
(551, 'bookly_cloud_products', 'a:3:{i:0;a:6:{s:2:\"id\";s:3:\"sms\";s:8:\"icon_url\";s:41:\"https://i.bookly.info/cloud/sms_96x96.png\";s:7:\"version\";s:4:\"18.6\";s:6:\"rating\";s:3:\"5.0\";s:6:\"button\";b:1;s:5:\"texts\";a:8:{s:5:\"title\";s:17:\"SMS Notifications\";s:5:\"price\";s:13:\"Pay as you go\";s:11:\"description\";s:464:\"<p>With <strong>SMS Notifications</strong> service you will keep your customers and staff members informed about their bookings, reduce “no shows” and empty booking slots. The service offers a wide range of codes which you can use to <a href=\"https://support.booking-wp-plugin.com/hc/en-us/articles/212411309\" target=\"_blank\">personalize</a> your text messages.</p><p>Top up your balance with one of the standard amounts and never lose your bookings again.</p>\";s:9:\"action-on\";s:11:\"Get started\";s:10:\"action-off\";s:7:\"Disable\";s:20:\"action-revert-cancel\";s:22:\"I want to keep my plan\";s:11:\"info-button\";s:10:\"SMS Prices\";s:10:\"info-title\";s:10:\"SMS Prices\";}}i:1;a:6:{s:2:\"id\";s:6:\"stripe\";s:8:\"icon_url\";s:44:\"https://i.bookly.info/cloud/stripe_96x96.png\";s:7:\"version\";s:4:\"18.6\";s:6:\"rating\";s:3:\"5.0\";s:6:\"button\";b:1;s:5:\"texts\";a:8:{s:5:\"title\";s:15:\"Stripe Payments\";s:5:\"price\";s:39:\"0.9% <small>per-transaction fee</small>\";s:11:\"description\";s:356:\"<p>With <strong>Stripe Payments</strong> activated, you can integrate <a href=\"https://stripe.com/\" target=\"_blank\">Stripe</a> payment gateway into your Bookly booking form to process credit card payments online.</p><p>Click <strong>Get started</strong> button to connect Bookly to your Stripe account and let customers instantly pay for your services.</p>\";s:9:\"action-on\";s:11:\"Get started\";s:10:\"action-off\";s:7:\"Disable\";s:20:\"action-revert-cancel\";s:22:\"I want to keep my plan\";s:11:\"info-button\";s:9:\"More info\";s:10:\"info-title\";s:5:\"Setup\";}}i:2;a:7:{s:2:\"id\";s:6:\"zapier\";s:8:\"icon_url\";s:44:\"https://i.bookly.info/cloud/zapier-96x96.png\";s:7:\"version\";s:4:\"18.7\";s:6:\"rating\";s:3:\"5.0\";s:6:\"button\";b:1;s:5:\"texts\";a:8:{s:5:\"title\";s:6:\"Zapier\";s:5:\"price\";s:22:\"Your subscription plan\";s:11:\"description\";s:704:\"<p><strong><a href=\"https://zapier.com/\" target=\"_blank\">Zapier</a></strong> allows you to automatically trigger actions in your favorite cloud apps for certain events inside of Bookly: when new bookings are made and updated, and new customers are created.</p>\n<p>You can try <strong>Zapier integration</strong> for free during 7 days to learn more and discover how it can work for you. After the trial period expires, you will be charged for the price of the selected plan.</p>\n<p>Choose your subscription plan, click <strong>Start 7-day Trial</strong> or <strong>Get started</strong> button to set up the connection between Bookly and Zapier, and create individual workflows to perform automations.</p>\";s:9:\"action-on\";s:17:\"Start 7-day Trial\";s:10:\"action-off\";s:19:\"Cancel subscription\";s:20:\"action-revert-cancel\";s:22:\"I want to keep my plan\";s:11:\"info-button\";s:9:\"More info\";s:10:\"info-title\";s:18:\"Zapier Integration\";}s:6:\"prices\";a:6:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:7:\"caption\";s:79:\"$24<sup>.99</sup> per month<br/><small class=\"text-muted\">200 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:7:\"caption\";s:79:\"$59<sup>.99</sup> per month<br/><small class=\"text-muted\">500 Tasks /mo</small>\";s:4:\"tags\";a:1:{i:0;s:10:\"best_offer\";}}i:2;a:3:{s:2:\"id\";s:1:\"3\";s:7:\"caption\";s:82:\"$124<sup>.99</sup> per month<br/><small class=\"text-muted\">1,100 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}i:3;a:3:{s:2:\"id\";s:1:\"4\";s:7:\"caption\";s:82:\"$249<sup>.99</sup> per month<br/><small class=\"text-muted\">2,300 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}i:4;a:3:{s:2:\"id\";s:1:\"5\";s:7:\"caption\";s:83:\"$999<sup>.99</sup> per month<br/><small class=\"text-muted\">12,000 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}i:5;a:3:{s:2:\"id\";s:1:\"6\";s:7:\"caption\";s:85:\"$1,499<sup>.99</sup> per month<br/><small class=\"text-muted\">20,000 Tasks /mo</small>\";s:4:\"tags\";a:0:{}}}}}', 'yes'),
(552, 'bookly_cloud_promotions', 'a:0:{}', 'yes'),
(553, 'bookly_cloud_account_products', '', 'yes'),
(554, 'bookly_cloud_stripe_enabled', '0', 'yes'),
(555, 'bookly_cloud_stripe_timeout', '0', 'yes'),
(556, 'bookly_cloud_stripe_increase', '0', 'yes'),
(557, 'bookly_cloud_stripe_addition', '0', 'yes'),
(558, 'bookly_cloud_zapier_api_key', '', 'yes'),
(559, 'bookly_bh_monday_start', '08:00:00', 'yes'),
(560, 'bookly_bh_monday_end', '18:00:00', 'yes'),
(561, 'bookly_bh_tuesday_start', '08:00:00', 'yes'),
(562, 'bookly_bh_tuesday_end', '18:00:00', 'yes'),
(563, 'bookly_bh_wednesday_start', '08:00:00', 'yes'),
(564, 'bookly_bh_wednesday_end', '18:00:00', 'yes'),
(565, 'bookly_bh_thursday_end', '18:00:00', 'yes'),
(566, 'bookly_bh_thursday_start', '08:00:00', 'yes'),
(567, 'bookly_bh_friday_start', '08:00:00', 'yes'),
(568, 'bookly_bh_friday_end', '18:00:00', 'yes'),
(569, 'bookly_bh_saturday_start', '', 'yes'),
(570, 'bookly_bh_saturday_end', '', 'yes'),
(571, 'bookly_bh_sunday_start', '', 'yes'),
(572, 'bookly_bh_sunday_end', '', 'yes'),
(573, 'bookly_pmt_currency', 'USD', 'yes'),
(574, 'bookly_pmt_price_format', '{symbol}{sign}{price|2}', 'yes'),
(575, 'bookly_pmt_order', '', 'yes'),
(576, 'bookly_pmt_local', '1', 'yes'),
(577, 'bookly_ntf_processing_interval', '2', 'yes'),
(578, 'bookly_сa_count', '0', 'yes'),
(579, 'bookly_logs_enabled', '0', 'yes'),
(590, 'action_scheduler_hybrid_store_demarkation', '23', 'yes'),
(591, 'schema-ActionScheduler_StoreSchema', '3.0.1624261180', 'yes'),
(592, 'schema-ActionScheduler_LoggerSchema', '2.0.1624261180', 'yes'),
(595, 'woocommerce_schema_version', '430', 'yes'),
(596, 'woocommerce_store_address', 'paravur', 'yes'),
(597, 'woocommerce_store_address_2', 'ernakulam', 'yes'),
(598, 'woocommerce_store_city', 'kochi', 'yes'),
(599, 'woocommerce_default_country', 'IN:ML', 'yes'),
(600, 'woocommerce_store_postcode', '683520', 'yes'),
(601, 'woocommerce_allowed_countries', 'all', 'yes'),
(602, 'woocommerce_all_except_countries', 'a:0:{}', 'yes'),
(603, 'woocommerce_specific_allowed_countries', 'a:0:{}', 'yes'),
(604, 'woocommerce_ship_to_countries', '', 'yes'),
(605, 'woocommerce_specific_ship_to_countries', 'a:0:{}', 'yes'),
(606, 'woocommerce_default_customer_address', 'base', 'yes'),
(607, 'woocommerce_calc_taxes', 'no', 'yes'),
(608, 'woocommerce_enable_coupons', 'yes', 'yes'),
(609, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(610, 'woocommerce_currency', 'USD', 'yes'),
(611, 'woocommerce_currency_pos', 'left', 'yes'),
(612, 'woocommerce_price_thousand_sep', '', 'yes'),
(613, 'woocommerce_price_decimal_sep', '', 'yes'),
(614, 'woocommerce_price_num_decimals', '0', 'yes'),
(615, 'woocommerce_shop_page_id', '24', 'yes'),
(616, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(617, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(618, 'woocommerce_placeholder_image', '23', 'yes'),
(619, 'woocommerce_weight_unit', 'kg', 'yes'),
(620, 'woocommerce_dimension_unit', 'cm', 'yes'),
(621, 'woocommerce_enable_reviews', 'yes', 'yes'),
(622, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(623, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(624, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(625, 'woocommerce_review_rating_required', 'yes', 'no'),
(626, 'woocommerce_manage_stock', 'yes', 'yes'),
(627, 'woocommerce_hold_stock_minutes', '60', 'no'),
(628, 'woocommerce_notify_low_stock', 'yes', 'no'),
(629, 'woocommerce_notify_no_stock', 'yes', 'no'),
(630, 'woocommerce_stock_email_recipient', 'admin@gmail.com', 'no'),
(631, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(632, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(633, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(634, 'woocommerce_stock_format', '', 'yes'),
(635, 'woocommerce_file_download_method', 'force', 'no'),
(636, 'woocommerce_downloads_require_login', 'no', 'no'),
(637, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(638, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(639, 'woocommerce_prices_include_tax', 'no', 'yes'),
(640, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(641, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(642, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(643, 'woocommerce_tax_classes', '', 'yes'),
(644, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(645, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(646, 'woocommerce_price_display_suffix', '', 'yes'),
(647, 'woocommerce_tax_total_display', 'itemized', 'no'),
(648, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(649, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(650, 'woocommerce_ship_to_destination', 'billing', 'no'),
(651, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(652, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(653, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(654, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(655, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(656, 'woocommerce_registration_generate_username', 'yes', 'no'),
(657, 'woocommerce_registration_generate_password', 'yes', 'no'),
(658, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(659, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(660, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(661, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(662, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(663, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(664, 'woocommerce_trash_pending_orders', '', 'no'),
(665, 'woocommerce_trash_failed_orders', '', 'no'),
(666, 'woocommerce_trash_cancelled_orders', '', 'no'),
(667, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(668, 'woocommerce_email_from_name', 'Scheduler', 'no'),
(669, 'woocommerce_email_from_address', 'admin@gmail.com', 'no'),
(670, 'woocommerce_email_header_image', '', 'no'),
(671, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(672, 'woocommerce_email_base_color', '#96588a', 'no'),
(673, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(674, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(675, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(676, 'woocommerce_merchant_email_notifications', 'no', 'no'),
(677, 'woocommerce_cart_page_id', '25', 'no'),
(678, 'woocommerce_checkout_page_id', '26', 'no'),
(679, 'woocommerce_myaccount_page_id', '27', 'no'),
(680, 'woocommerce_terms_page_id', '', 'no'),
(681, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(682, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(683, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(684, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(685, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(686, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(687, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(688, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(689, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(690, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(691, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(692, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(693, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(694, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(695, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(696, 'woocommerce_api_enabled', 'no', 'yes'),
(697, 'woocommerce_allow_tracking', 'no', 'no'),
(698, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(699, 'woocommerce_single_image_width', '600', 'yes'),
(700, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(701, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(702, 'woocommerce_demo_store', 'no', 'no'),
(703, 'woocommerce_permalinks', 'a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}', 'yes'),
(704, 'current_theme_supports_woocommerce', 'yes', 'yes'),
(705, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(707, 'product_cat_children', 'a:0:{}', 'yes'),
(708, 'default_product_cat', '17', 'yes'),
(711, 'woocommerce_version', '5.4.1', 'yes'),
(712, 'woocommerce_db_version', '5.4.1', 'yes'),
(713, 'woocommerce_inbox_variant_assignment', '12', 'yes'),
(717, '_transient_jetpack_autoloader_plugin_paths', 'a:1:{i:0;s:29:\"{{WP_PLUGIN_DIR}}/woocommerce\";}', 'yes'),
(718, 'action_scheduler_lock_async-request-runner', '1625806642', 'yes'),
(719, 'woocommerce_admin_notices', 'a:1:{i:0;s:20:\"no_secure_connection\";}', 'yes'),
(720, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:\"database_prefix\";s:32:\"5kYWhdsgQ7DgAFyEo70yZACR9M812GDV\";}', 'yes'),
(721, '_transient_woocommerce_webhook_ids_status_active', 'a:0:{}', 'yes'),
(722, 'widget_woocommerce_widget_cart', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(723, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(724, 'widget_woocommerce_layered_nav', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(725, 'widget_woocommerce_price_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(726, 'widget_woocommerce_product_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(727, 'widget_woocommerce_product_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(728, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(729, 'widget_woocommerce_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(730, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(731, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(732, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(733, 'widget_woocommerce_rating_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(736, 'woocommerce_admin_version', '2.3.1', 'yes'),
(737, 'woocommerce_admin_install_timestamp', '1624261183', 'yes'),
(738, 'wc_remote_inbox_notifications_wca_updated', '', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(739, 'wc_remote_inbox_notifications_specs', 'a:28:{s:19:\"eu_vat_changes_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:19:\"eu_vat_changes_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:54:\"Get your business ready for the new EU tax regulations\";s:7:\"content\";s:617:\"On July 1, 2021, new taxation rules will come into play when the <a href=\"https://ec.europa.eu/taxation_customs/business/vat/modernising-vat-cross-border-ecommerce_en\">European Union (EU) Value-Added Tax (VAT) eCommerce package</a> takes effect.<br/><br/>The new regulations will impact virtually every B2C business involved in cross-border eCommerce trade with the EU.<br/><br/>We therefore recommend <a href=\"https://woocommerce.com/posts/new-eu-vat-regulations\">familiarizing yourself with the new updates</a>, and consult with a tax professional to ensure your business is following regulations and best practice.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:19:\"eu_vat_changes_2021\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:39:\"Learn more about the EU tax regulations\";}}s:3:\"url\";s:52:\"https://woocommerce.com/posts/new-eu-vat-regulations\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-06-24 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-07-11 00:00:00\";}i:2;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:3:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:29:\"woocommerce_allowed_countries\";s:5:\"value\";s:3:\"all\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:1;a:2:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:29:\"woocommerce_allowed_countries\";s:5:\"value\";s:10:\"all_except\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:27:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"BE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"BG\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"CZ\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:3;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"DK\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:4;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"DE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:5;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"EE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:6;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"IE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:7;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"EL\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:8;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"ES\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:9;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"FR\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:10;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"HR\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:11;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"IT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:12;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"CY\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:13;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"LV\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:14;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"LT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:15;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"LU\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:16;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"HU\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:17;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"MT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:18;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"NL\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:19;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"AT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:20;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"PL\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:21;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"PT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:22;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"RO\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:23;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"SI\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:24;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"SK\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:25;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"FI\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}i:26;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:32:\"woocommerce_all_except_countries\";s:5:\"value\";s:2:\"SE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:9:\"!contains\";}}}}i:2;a:3:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:29:\"woocommerce_allowed_countries\";s:5:\"value\";s:3:\"all\";s:7:\"default\";b:0;s:9:\"operation\";s:2:\"!=\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:29:\"woocommerce_allowed_countries\";s:5:\"value\";s:10:\"all_except\";s:7:\"default\";b:0;s:9:\"operation\";s:2:\"!=\";}i:2;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:27:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"BE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"BG\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"CZ\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:3;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"DK\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:4;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"DE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:5;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"EE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:6;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"IE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:7;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"EL\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:8;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"ES\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:9;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"FR\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:10;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"HR\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:11;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"IT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:12;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"CY\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:13;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"LV\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:14;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"LT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:15;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"LU\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:16;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"HU\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:17;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"MT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:18;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"NL\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:19;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"AT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:20;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"PL\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:21;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"PT\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:22;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"RO\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:23;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"SI\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:24;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"SK\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:25;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"FI\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}i:26;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:38:\"woocommerce_specific_allowed_countries\";s:5:\"value\";s:2:\"SE\";s:7:\"default\";a:0:{}s:9:\"operation\";s:8:\"contains\";}}}}}}}}s:20:\"paypal_ppcp_gtm_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:20:\"paypal_ppcp_gtm_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:38:\"Offer more options with the new PayPal\";s:7:\"content\";s:113:\"Get the latest PayPal extension for a full suite of payment methods with extensive currency and country coverage.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:36:\"open_wc_paypal_payments_product_page\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:61:\"https://woocommerce.com/products/woocommerce-paypal-payments/\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-04-05 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-04-21 00:00:00\";}i:2;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:7:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:43:\"woocommerce-gateway-paypal-express-checkout\";}}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:30:\"woocommerce-gateway-paypal-pro\";}}i:2;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:37:\"woocommerce-gateway-paypal-pro-hosted\";}}i:3;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:35:\"woocommerce-gateway-paypal-advanced\";}}i:4;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:40:\"woocommerce-gateway-paypal-digital-goods\";}}i:5;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:31:\"woocommerce-paypal-here-gateway\";}}i:6;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:44:\"woocommerce-gateway-paypal-adaptive-payments\";}}}}i:3;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:27:\"woocommerce-paypal-payments\";}}}}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:27:\"woocommerce-paypal-payments\";s:7:\"version\";s:5:\"1.2.1\";s:8:\"operator\";s:1:\"<\";}}}}}s:23:\"facebook_pixel_api_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:23:\"facebook_pixel_api_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:44:\"Improve the performance of your Facebook ads\";s:7:\"content\";s:152:\"Enable Facebook Pixel and Conversions API through the latest version of Facebook for WooCommerce for improved measurement and ad targeting capabilities.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:30:\"upgrade_now_facebook_pixel_api\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:11:\"Upgrade now\";}}s:3:\"url\";s:67:\"plugin-install.php?tab=plugin-information&plugin=&section=changelog\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-05-17 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-06-14 00:00:00\";}i:2;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:24:\"facebook-for-woocommerce\";s:7:\"version\";s:5:\"2.4.0\";s:8:\"operator\";s:2:\"<=\";}}}s:16:\"facebook_ec_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:16:\"facebook_ec_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:59:\"Sync your product catalog with Facebook to help boost sales\";s:7:\"content\";s:170:\"A single click adds all products to your Facebook Business Page shop. Product changes are automatically synced, with the flexibility to control which products are listed.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:22:\"learn_more_facebook_ec\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:42:\"https://woocommerce.com/products/facebook/\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-03-01 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-03-15 00:00:00\";}i:2;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:24:\"facebook-for-woocommerce\";}}}}s:37:\"ecomm-need-help-setting-up-your-store\";O:8:\"stdClass\":8:{s:4:\"slug\";s:37:\"ecomm-need-help-setting-up-your-store\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:32:\"Need help setting up your Store?\";s:7:\"content\";s:350:\"Schedule a free 30-min <a href=\"https://wordpress.com/support/concierge-support/\">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:16:\"set-up-concierge\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:21:\"Schedule free session\";}}s:3:\"url\";s:34:\"https://wordpress.com/me/concierge\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:3:{i:0;s:35:\"woocommerce-shipping-australia-post\";i:1;s:32:\"woocommerce-shipping-canada-post\";i:2;s:30:\"woocommerce-shipping-royalmail\";}}}}s:20:\"woocommerce-services\";O:8:\"stdClass\":8:{s:4:\"slug\";s:20:\"woocommerce-services\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:26:\"WooCommerce Shipping & Tax\";s:7:\"content\";s:255:\"WooCommerce Shipping & Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:84:\"https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:20:\"woocommerce-services\";}}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\"<\";s:4:\"days\";i:2;}}}s:32:\"ecomm-unique-shopping-experience\";O:8:\"stdClass\":8:{s:4:\"slug\";s:32:\"ecomm-unique-shopping-experience\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:53:\"For a shopping experience as unique as your customers\";s:7:\"content\";s:274:\"Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:43:\"learn-more-ecomm-unique-shopping-experience\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:71:\"https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:3:{i:0;s:35:\"woocommerce-shipping-australia-post\";i:1;s:32:\"woocommerce-shipping-canada-post\";i:2;s:30:\"woocommerce-shipping-royalmail\";}}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\"<\";s:4:\"days\";i:2;}}}s:37:\"wc-admin-getting-started-in-ecommerce\";O:8:\"stdClass\":8:{s:4:\"slug\";s:37:\"wc-admin-getting-started-in-ecommerce\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:38:\"Getting Started in eCommerce - webinar\";s:7:\"content\";s:174:\"We want to make eCommerce and this process of getting started as easy as possible for you. Watch this webinar to get tips on how to have our store up and running in a breeze.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:17:\"watch-the-webinar\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:17:\"Watch the webinar\";}}s:3:\"url\";s:28:\"https://youtu.be/V_2XtCOyZ7o\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:12:\"setup_client\";s:9:\"operation\";s:2:\"!=\";s:5:\"value\";b:1;}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:3:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:13:\"product_count\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";s:1:\"0\";}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:7:\"revenue\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";s:4:\"none\";}i:2;O:8:\"stdClass\":4:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:7:\"revenue\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";s:10:\"up-to-2500\";}}}}}s:18:\"your-first-product\";O:8:\"stdClass\":8:{s:4:\"slug\";s:18:\"your-first-product\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:18:\"Your first product\";s:7:\"content\";s:461:\"That\'s huge! You\'re well on your way to building a successful online store — now it’s time to think about how you\'ll fulfill your orders.<br/><br/>Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href=\"https://href.li/?https://woocommerce.com/shipping\" target=\"_blank\">WooCommerce Shipping</a>.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:82:\"https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:12:\"stored_state\";s:5:\"index\";s:22:\"there_were_no_products\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";b:1;}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:12:\"stored_state\";s:5:\"index\";s:22:\"there_are_now_products\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";b:1;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:13:\"product_count\";s:9:\"operation\";s:2:\">=\";s:5:\"value\";i:1;}i:3;O:8:\"stdClass\":5:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:13:\"product_types\";s:9:\"operation\";s:8:\"contains\";s:5:\"value\";s:8:\"physical\";s:7:\"default\";a:0:{}}}}s:31:\"wc-square-apple-pay-boost-sales\";O:8:\"stdClass\":8:{s:4:\"slug\";s:31:\"wc-square-apple-pay-boost-sales\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:26:\"Boost sales with Apple Pay\";s:7:\"content\";s:191:\"Now that you accept Apple Pay® with Square you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:27:\"boost-sales-marketing-guide\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"See marketing guide\";}}s:3:\"url\";s:97:\"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-boost-sales\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:9:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:18:\"woocommerce-square\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"2.3\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:27:\"wc_square_apple_pay_enabled\";s:5:\"value\";i:1;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:38:\"wc-square-apple-pay-grow-your-business\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:4;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:38:\"wc-square-apple-pay-grow-your-business\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:5;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:6;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:7;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:8;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:38:\"wc-square-apple-pay-grow-your-business\";O:8:\"stdClass\":8:{s:4:\"slug\";s:38:\"wc-square-apple-pay-grow-your-business\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:45:\"Grow your business with Square and Apple Pay \";s:7:\"content\";s:178:\"Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:34:\"grow-your-business-marketing-guide\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"See marketing guide\";}}s:3:\"url\";s:104:\"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-grow-your-business\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:9:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:18:\"woocommerce-square\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"2.3\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:27:\"wc_square_apple_pay_enabled\";s:5:\"value\";i:2;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:31:\"wc-square-apple-pay-boost-sales\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:4;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:31:\"wc-square-apple-pay-boost-sales\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:5;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:6;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:7;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:8;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:32:\"wcpay-apple-pay-is-now-available\";O:8:\"stdClass\":8:{s:4:\"slug\";s:32:\"wcpay-apple-pay-is-now-available\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:53:\"Apple Pay is now available with WooCommerce Payments!\";s:7:\"content\";s:397:\"Increase your conversion rate by offering a fast and secure checkout with <a href=\"https://woocommerce.com/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay\" target=\"_blank\">Apple Pay</a>®. It’s free to get started with <a href=\"https://woocommerce.com/payments/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay\" target=\"_blank\">WooCommerce Payments</a>.\";}}s:7:\"actions\";a:2:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:13:\"add-apple-pay\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:13:\"Add Apple Pay\";}}s:3:\"url\";s:69:\"/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}i:1;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:121:\"https://docs.woocommerce.com/document/payments/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:20:\"woocommerce-payments\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:5:\"2.3.0\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:26:\"wcpay_is_apple_pay_enabled\";s:5:\"value\";b:0;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}}}s:27:\"wcpay-apple-pay-boost-sales\";O:8:\"stdClass\":8:{s:4:\"slug\";s:27:\"wcpay-apple-pay-boost-sales\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:26:\"Boost sales with Apple Pay\";s:7:\"content\";s:205:\"Now that you accept Apple Pay® with WooCommerce Payments you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:27:\"boost-sales-marketing-guide\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"See marketing guide\";}}s:3:\"url\";s:96:\"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-boost-sales\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:26:\"wcpay_is_apple_pay_enabled\";s:5:\"value\";i:1;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:2;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:3;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:34:\"wcpay-apple-pay-grow-your-business\";O:8:\"stdClass\":8:{s:4:\"slug\";s:34:\"wcpay-apple-pay-grow-your-business\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:58:\"Grow your business with WooCommerce Payments and Apple Pay\";s:7:\"content\";s:178:\"Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:34:\"grow-your-business-marketing-guide\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"See marketing guide\";}}s:3:\"url\";s:103:\"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-grow-your-business\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:26:\"wcpay_is_apple_pay_enabled\";s:5:\"value\";i:2;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:2;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:3;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:37:\"wc-admin-optimizing-the-checkout-flow\";O:8:\"stdClass\":8:{s:4:\"slug\";s:37:\"wc-admin-optimizing-the-checkout-flow\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:28:\"Optimizing the checkout flow\";s:7:\"content\";s:171:\"It\'s crucial to get your store\'s checkout as smooth as possible to avoid losing sales. Let\'s take a look at how you can optimize the checkout experience for your shoppers.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:28:\"optimizing-the-checkout-flow\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:78:\"https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\">\";s:4:\"days\";i:3;}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:45:\"woocommerce_task_list_tracked_completed_tasks\";s:9:\"operation\";s:8:\"contains\";s:5:\"value\";s:8:\"payments\";s:7:\"default\";a:0:{}}}}s:39:\"wc-admin-first-five-things-to-customize\";O:8:\"stdClass\":8:{s:4:\"slug\";s:39:\"wc-admin-first-five-things-to-customize\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:45:\"The first 5 things to customize in your store\";s:7:\"content\";s:173:\"Deciding what to start with first is tricky. To help you properly prioritize, we\'ve put together this short list of the first few things you should customize in WooCommerce.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:82:\"https://woocommerce.com/posts/first-things-customize-woocommerce/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\">\";s:4:\"days\";i:2;}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:45:\"woocommerce_task_list_tracked_completed_tasks\";s:5:\"value\";s:9:\"NOT EMPTY\";s:7:\"default\";s:9:\"NOT EMPTY\";s:9:\"operation\";s:2:\"!=\";}}}s:32:\"wc-payments-qualitative-feedback\";O:8:\"stdClass\":8:{s:4:\"slug\";s:32:\"wc-payments-qualitative-feedback\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:55:\"WooCommerce Payments setup - let us know what you think\";s:7:\"content\";s:146:\"Congrats on enabling WooCommerce Payments for your store. Please share your feedback in this 2 minute survey to help us improve the setup process.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:35:\"qualitative-feedback-from-new-users\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:14:\"Share feedback\";}}s:3:\"url\";s:39:\"https://automattic.survey.fm/wc-pay-new\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:1:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:45:\"woocommerce_task_list_tracked_completed_tasks\";s:9:\"operation\";s:8:\"contains\";s:5:\"value\";s:20:\"woocommerce-payments\";s:7:\"default\";a:0:{}}}}s:29:\"share-your-feedback-on-paypal\";O:8:\"stdClass\":8:{s:4:\"slug\";s:29:\"share-your-feedback-on-paypal\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:29:\"Share your feedback on PayPal\";s:7:\"content\";s:127:\"Share your feedback in this 2 minute survey about how we can make the process of accepting payments more useful for your store.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:14:\"share-feedback\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:14:\"Share feedback\";}}s:3:\"url\";s:43:\"http://automattic.survey.fm/paypal-feedback\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:26:\"woocommerce-gateway-stripe\";}}}}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:43:\"woocommerce-gateway-paypal-express-checkout\";}}}}s:31:\"wcpay_instant_deposits_gtm_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:31:\"wcpay_instant_deposits_gtm_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:69:\"Get paid within minutes – Instant Deposits for WooCommerce Payments\";s:7:\"content\";s:384:\"Stay flexible with immediate access to your funds when you need them – including nights, weekends, and holidays. With <a href=\"https://woocommerce.com/products/woocommerce-payments/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_instant_deposits\">WooCommerce Payments\'</a> new Instant Deposits feature, you’re able to transfer your earnings to a debit card within minutes.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:40:\"Learn about Instant Deposits eligibility\";}}s:3:\"url\";s:136:\"https://docs.woocommerce.com/document/payments/instant-deposits/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_instant_deposits\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-05-18 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-06-01 00:00:00\";}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:21:\"base_location_country\";s:5:\"value\";s:2:\"US\";s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:20:\"woocommerce-payments\";}}}}s:31:\"google_listings_and_ads_install\";O:8:\"stdClass\":8:{s:4:\"slug\";s:31:\"google_listings_and_ads_install\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:35:\"Drive traffic and sales with Google\";s:7:\"content\";s:123:\"Reach online shoppers to drive traffic and sales for your store by showcasing products across Google, for free or with ads.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:11:\"get-started\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:11:\"Get started\";}}s:3:\"url\";s:56:\"https://woocommerce.com/products/google-listings-and-ads\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-06-09 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:23:\"google_listings_and_ads\";}}}}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:11:\"order_count\";s:9:\"operation\";s:1:\">\";s:5:\"value\";i:10;}}}s:39:\"wc-subscriptions-security-update-3-0-15\";O:8:\"stdClass\":8:{s:4:\"slug\";s:39:\"wc-subscriptions-security-update-3-0-15\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:42:\"WooCommerce Subscriptions security update!\";s:7:\"content\";s:736:\"We recently released an important security update to WooCommerce Subscriptions. To ensure your site\'s data is protected, please upgrade <strong>WooCommerce Subscriptions to version 3.0.15</strong> or later.<br/><br/>Click the button below to view and update to the latest Subscriptions version, or log in to <a href=\"https://woocommerce.com/my-dashboard\">WooCommerce.com Dashboard</a> and navigate to your <strong>Downloads</strong> page.<br/><br/>We recommend always using the latest version of WooCommerce Subscriptions, and other software running on your site, to ensure maximum security.<br/><br/>If you have any questions we are here to help — just <a href=\"https://woocommerce.com/my-account/create-a-ticket/\">open a ticket</a>.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:30:\"update-wc-subscriptions-3-0-15\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"View latest version\";}}s:3:\"url\";s:30:\"&page=wc-addons&section=helper\";s:18:\"url_is_admin_query\";b:1;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:1:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:25:\"woocommerce-subscriptions\";s:8:\"operator\";s:1:\"<\";s:7:\"version\";s:6:\"3.0.15\";}}}s:29:\"woocommerce-core-update-5-4-0\";O:8:\"stdClass\":8:{s:4:\"slug\";s:29:\"woocommerce-core-update-5-4-0\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:31:\"Update to WooCommerce 5.4.1 now\";s:7:\"content\";s:140:\"WooCommerce 5.4.1 addresses a checkout issue discovered in WooCommerce 5.4. We recommend upgrading to WooCommerce 5.4.1 as soon as possible.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:20:\"update-wc-core-5-4-0\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:25:\"How to update WooCommerce\";}}s:3:\"url\";s:64:\"https://docs.woocommerce.com/document/how-to-update-woocommerce/\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:1:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:1:\"=\";s:7:\"version\";s:5:\"5.4.0\";}}}s:19:\"wcpay-promo-2020-11\";O:8:\"stdClass\":7:{s:4:\"slug\";s:19:\"wcpay-promo-2020-11\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:19:\"wcpay-promo-2020-11\";s:7:\"content\";s:19:\"wcpay-promo-2020-11\";}}s:5:\"rules\";a:0:{}}s:19:\"wcpay-promo-2020-12\";O:8:\"stdClass\":7:{s:4:\"slug\";s:19:\"wcpay-promo-2020-12\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:19:\"wcpay-promo-2020-12\";s:7:\"content\";s:19:\"wcpay-promo-2020-12\";}}s:5:\"rules\";a:0:{}}s:30:\"wcpay-promo-2021-6-incentive-1\";O:8:\"stdClass\":8:{s:4:\"slug\";s:30:\"wcpay-promo-2021-6-incentive-1\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:74:\"Special offer: Save 50% on transaction fees for up to $125,000 in payments\";s:7:\"content\";s:715:\"Save big when you add <a href=\"https://woocommerce.com/payments/?utm_medium=notification&utm_source=product&utm_campaign=wcpay_exp222\">WooCommerce Payments</a> to your store today.\n                Get a discounted rate of 1.5% + $0.15 on all transactions – that’s 50% off the standard fee on up to $125,000 in processed payments (or six months, whichever comes first). Act now – this offer is available for a limited time only.\n                <br/><br/>By clicking \"Get WooCommerce Payments,\" you agree to the promotional <a href=\"https://woocommerce.com/terms-conditions/woocommerce-payments-half-off-six-promotion/?utm_medium=notification&utm_source=product&utm_campaign=wcpay_exp222\">Terms of Service</a>.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:25:\"get-woo-commerce-payments\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:24:\"Get WooCommerce Payments\";}}s:3:\"url\";s:57:\"admin.php?page=wc-admin&action=setup-woocommerce-payments\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:12:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:6:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"1\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"3\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"5\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"7\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:4;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"9\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:5;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:2:\"11\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}}}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:4:{i:0;s:17:\"crowdsignal-forms\";i:1;s:11:\"layout-grid\";i:2;s:17:\"full-site-editing\";i:3;s:13:\"page-optimize\";}}}}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:21:\"base_location_country\";s:5:\"value\";s:2:\"US\";s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:26:\"woocommerce_allow_tracking\";s:5:\"value\";s:3:\"yes\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:4;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:2:\">=\";s:4:\"days\";i:31;}i:5;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:20:\"woocommerce-payments\";}}}}i:6;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.0\";}i:7;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:10:\"db_version\";s:5:\"value\";s:5:\"45805\";s:7:\"default\";i:0;s:9:\"operation\";s:2:\">=\";}i:8;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:19:\"wcpay-promo-2020-11\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:9;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:19:\"wcpay-promo-2020-11\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:10;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:19:\"wcpay-promo-2020-12\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:11;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:19:\"wcpay-promo-2020-12\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:30:\"wcpay-promo-2021-6-incentive-2\";O:8:\"stdClass\":8:{s:4:\"slug\";s:30:\"wcpay-promo-2021-6-incentive-2\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:58:\"Special offer: No transaction fees* for up to three months\";s:7:\"content\";s:684:\"Save big when you add <a href=\"https://woocommerce.com/payments/?utm_medium=notification&utm_source=product&utm_campaign=wcpay_exp233\">WooCommerce Payments</a> to your store today. Pay zero transaction fees* on up to $25,000 in processed payments (or three months, whichever comes first). Act now – this offer is available for a limited time only. *Currency conversion fees excluded.\n                <br/><br/>By clicking \"Get WooCommerce Payments,\" you agree to the promotional <a href=\"https://woocommerce.com/terms-conditions/woocommerce-payments-no-transaction-fees-for-three-promotion/?utm_medium=notification&utm_source=product&utm_campaign=wcpay_exp233\">Terms of Service</a>.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:24:\"get-woocommerce-payments\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:24:\"Get WooCommerce Payments\";}}s:3:\"url\";s:57:\"admin.php?page=wc-admin&action=setup-woocommerce-payments\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:12:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:6:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"2\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"4\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"6\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:1:\"8\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:4;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:2:\"10\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:5;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";s:2:\"12\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}}}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:4:{i:0;s:17:\"crowdsignal-forms\";i:1;s:11:\"layout-grid\";i:2;s:17:\"full-site-editing\";i:3;s:13:\"page-optimize\";}}}}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:21:\"base_location_country\";s:5:\"value\";s:2:\"US\";s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:26:\"woocommerce_allow_tracking\";s:5:\"value\";s:3:\"yes\";s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:4;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:2:\">=\";s:4:\"days\";i:31;}i:5;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:20:\"woocommerce-payments\";}}}}i:6;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.0\";}i:7;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:10:\"db_version\";s:5:\"value\";s:5:\"45805\";s:7:\"default\";i:0;s:9:\"operation\";s:2:\">=\";}i:8;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:19:\"wcpay-promo-2020-11\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:9;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:19:\"wcpay-promo-2020-11\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:10;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:19:\"wcpay-promo-2020-12\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:11;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:19:\"wcpay-promo-2020-12\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:34:\"ppxo-pps-upgrade-paypal-payments-1\";O:8:\"stdClass\":8:{s:4:\"slug\";s:34:\"ppxo-pps-upgrade-paypal-payments-1\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:47:\"Get the latest PayPal extension for WooCommerce\";s:7:\"content\";s:440:\"Heads up! There\'s a new PayPal on the block!<br/><br/>Now is a great time to upgrade to our latest <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal extension</a> to continue to receive support and updates with PayPal.<br/><br/>Get access to a full suite of PayPal payment methods, extensive currency and country coverage, and pay later options with the all-new PayPal extension for WooCommerce.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:34:\"ppxo-pps-install-paypal-payments-1\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:18:\"View upgrade guide\";}}s:3:\"url\";s:96:\"https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:27:\"woocommerce-paypal-payments\";}}}}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:43:\"woocommerce-gateway-paypal-express-checkout\";}}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:27:\"woocommerce_paypal_settings\";s:9:\"operation\";s:2:\"!=\";s:5:\"value\";b:0;s:7:\"default\";b:0;}}}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";i:7;s:7:\"default\";i:1;s:9:\"operation\";s:1:\"<\";}}}s:34:\"ppxo-pps-upgrade-paypal-payments-2\";O:8:\"stdClass\":8:{s:4:\"slug\";s:34:\"ppxo-pps-upgrade-paypal-payments-2\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:31:\"Upgrade your PayPal experience!\";s:7:\"content\";s:513:\"We\'ve developed a whole new <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal extension for WooCommerce</a> that combines the best features of our many PayPal extensions into just one extension.<br/><br/>Get access to a full suite of PayPal payment methods, extensive currency and country coverage, offer subscription and recurring payments, and the new PayPal pay later options.<br/><br/>Start using our latest PayPal today to continue to receive support and updates.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:34:\"ppxo-pps-install-paypal-payments-2\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:18:\"View upgrade guide\";}}s:3:\"url\";s:96:\"https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:27:\"woocommerce-paypal-payments\";}}}}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:43:\"woocommerce-gateway-paypal-express-checkout\";}}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:27:\"woocommerce_paypal_settings\";s:9:\"operation\";s:2:\"!=\";s:5:\"value\";b:0;s:7:\"default\";b:0;}}}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:36:\"woocommerce_inbox_variant_assignment\";s:5:\"value\";i:6;s:7:\"default\";i:1;s:9:\"operation\";s:1:\">\";}}}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(740, 'wc_remote_inbox_notifications_stored_state', 'O:8:\"stdClass\":3:{s:22:\"there_were_no_products\";b:1;s:22:\"there_are_now_products\";b:1;s:17:\"new_product_count\";i:0;}', 'yes'),
(745, 'wc_blocks_db_schema_version', '260', 'yes'),
(746, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(748, 'booked_wc_payment_options', 'a:5:{s:19:\"email_confirmations\";s:14:\"after_complete\";s:17:\"enable_thumbnails\";s:6:\"enable\";s:19:\"enable_auto_cleanup\";s:7:\"disable\";s:12:\"cleanup_mode\";s:10:\"twicedaily\";s:13:\"redirect_page\";s:8:\"checkout\";}', 'yes'),
(751, '_transient_woocommerce_reports-transient-version', '1625806098', 'yes'),
(762, 'woocommerce_onboarding_profile', 'a:8:{s:12:\"setup_client\";b:0;s:8:\"industry\";a:1:{i:0;a:1:{s:4:\"slug\";s:22:\"education-and-learning\";}}s:13:\"product_types\";a:1:{i:0;s:9:\"downloads\";}s:13:\"product_count\";s:4:\"1-10\";s:14:\"selling_venues\";s:2:\"no\";s:19:\"business_extensions\";a:0:{}s:5:\"theme\";s:15:\"twentytwentyone\";s:9:\"completed\";b:1;}', 'yes'),
(772, 'woocommerce_task_list_tracked_completed_tasks', 'a:3:{i:0;s:13:\"store_details\";i:1;s:8:\"products\";i:2;s:8:\"payments\";}', 'yes'),
(773, 'woocommerce_task_list_welcome_modal_dismissed', 'yes', 'yes'),
(779, '_transient_product_query-transient-version', '1625472483', 'yes'),
(897, 'recovery_mode_email_last_sent', '1625748158', 'yes'),
(941, '_transient_health-check-site-status-result', '{\"good\":\"13\",\"recommended\":\"6\",\"critical\":\"1\"}', 'yes'),
(1284, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(1300, '_transient_timeout_orders-all-statuses', '1626074975', 'no'),
(1301, '_transient_orders-all-statuses', 'a:2:{s:7:\"version\";s:10:\"1625469986\";s:5:\"value\";a:1:{i:0;s:12:\"wc-cancelled\";}}', 'no'),
(1319, 'woocommerce_marketplace_suggestions', 'a:2:{s:11:\"suggestions\";a:27:{i:0;a:4:{s:4:\"slug\";s:28:\"product-edit-meta-tab-header\";s:7:\"context\";s:28:\"product-edit-meta-tab-header\";s:5:\"title\";s:22:\"Recommended extensions\";s:13:\"allow-dismiss\";b:0;}i:1;a:6:{s:4:\"slug\";s:39:\"product-edit-meta-tab-footer-browse-all\";s:7:\"context\";s:28:\"product-edit-meta-tab-footer\";s:9:\"link-text\";s:21:\"Browse all extensions\";s:3:\"url\";s:64:\"https://woocommerce.com/product-category/woocommerce-extensions/\";s:8:\"promoted\";s:31:\"category-woocommerce-extensions\";s:13:\"allow-dismiss\";b:0;}i:2;a:9:{s:4:\"slug\";s:46:\"product-edit-mailchimp-woocommerce-memberships\";s:7:\"product\";s:33:\"woocommerce-memberships-mailchimp\";s:14:\"show-if-active\";a:1:{i:0;s:23:\"woocommerce-memberships\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:116:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/mailchimp-for-memberships.svg\";s:5:\"title\";s:25:\"Mailchimp for Memberships\";s:4:\"copy\";s:79:\"Completely automate your email lists by syncing membership changes to Mailchimp\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:67:\"https://woocommerce.com/products/mailchimp-woocommerce-memberships/\";}i:3;a:9:{s:4:\"slug\";s:19:\"product-edit-addons\";s:7:\"product\";s:26:\"woocommerce-product-addons\";s:14:\"show-if-active\";a:2:{i:0;s:25:\"woocommerce-subscriptions\";i:1;s:20:\"woocommerce-bookings\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:106:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-add-ons.svg\";s:5:\"title\";s:15:\"Product Add-Ons\";s:4:\"copy\";s:93:\"Offer add-ons like gift wrapping, special messages or other special options for your products\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:49:\"https://woocommerce.com/products/product-add-ons/\";}i:4;a:9:{s:4:\"slug\";s:46:\"product-edit-woocommerce-subscriptions-gifting\";s:7:\"product\";s:33:\"woocommerce-subscriptions-gifting\";s:14:\"show-if-active\";a:1:{i:0;s:25:\"woocommerce-subscriptions\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:116:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/gifting-for-subscriptions.svg\";s:5:\"title\";s:25:\"Gifting for Subscriptions\";s:4:\"copy\";s:70:\"Let customers buy subscriptions for others - they\'re the ultimate gift\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:67:\"https://woocommerce.com/products/woocommerce-subscriptions-gifting/\";}i:5;a:9:{s:4:\"slug\";s:42:\"product-edit-teams-woocommerce-memberships\";s:7:\"product\";s:33:\"woocommerce-memberships-for-teams\";s:14:\"show-if-active\";a:1:{i:0;s:23:\"woocommerce-memberships\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:112:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/teams-for-memberships.svg\";s:5:\"title\";s:21:\"Teams for Memberships\";s:4:\"copy\";s:123:\"Adds B2B functionality to WooCommerce Memberships, allowing sites to sell team, group, corporate, or family member accounts\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:63:\"https://woocommerce.com/products/teams-woocommerce-memberships/\";}i:6;a:8:{s:4:\"slug\";s:29:\"product-edit-variation-images\";s:7:\"product\";s:39:\"woocommerce-additional-variation-images\";s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:118:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/additional-variation-images.svg\";s:5:\"title\";s:27:\"Additional Variation Images\";s:4:\"copy\";s:72:\"Showcase your products in the best light with a image for each variation\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:73:\"https://woocommerce.com/products/woocommerce-additional-variation-images/\";}i:7;a:9:{s:4:\"slug\";s:47:\"product-edit-woocommerce-subscription-downloads\";s:7:\"product\";s:34:\"woocommerce-subscription-downloads\";s:14:\"show-if-active\";a:1:{i:0;s:25:\"woocommerce-subscriptions\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:113:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscription-downloads.svg\";s:5:\"title\";s:22:\"Subscription Downloads\";s:4:\"copy\";s:57:\"Give customers special downloads with their subscriptions\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:68:\"https://woocommerce.com/products/woocommerce-subscription-downloads/\";}i:8;a:8:{s:4:\"slug\";s:31:\"product-edit-min-max-quantities\";s:7:\"product\";s:30:\"woocommerce-min-max-quantities\";s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:109:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/min-max-quantities.svg\";s:5:\"title\";s:18:\"Min/Max Quantities\";s:4:\"copy\";s:81:\"Specify minimum and maximum allowed product quantities for orders to be completed\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:52:\"https://woocommerce.com/products/min-max-quantities/\";}i:9;a:8:{s:4:\"slug\";s:28:\"product-edit-name-your-price\";s:7:\"product\";s:27:\"woocommerce-name-your-price\";s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:106:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/name-your-price.svg\";s:5:\"title\";s:15:\"Name Your Price\";s:4:\"copy\";s:70:\"Let customers pay what they want - useful for donations, tips and more\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:49:\"https://woocommerce.com/products/name-your-price/\";}i:10;a:8:{s:4:\"slug\";s:42:\"product-edit-woocommerce-one-page-checkout\";s:7:\"product\";s:29:\"woocommerce-one-page-checkout\";s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:108:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/one-page-checkout.svg\";s:5:\"title\";s:17:\"One Page Checkout\";s:4:\"copy\";s:92:\"Don\'t make customers click around - let them choose products, checkout & pay all on one page\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:63:\"https://woocommerce.com/products/woocommerce-one-page-checkout/\";}i:11;a:4:{s:4:\"slug\";s:19:\"orders-empty-header\";s:7:\"context\";s:24:\"orders-list-empty-header\";s:5:\"title\";s:20:\"Tools for your store\";s:13:\"allow-dismiss\";b:0;}i:12;a:6:{s:4:\"slug\";s:30:\"orders-empty-footer-browse-all\";s:7:\"context\";s:24:\"orders-list-empty-footer\";s:9:\"link-text\";s:21:\"Browse all extensions\";s:3:\"url\";s:64:\"https://woocommerce.com/product-category/woocommerce-extensions/\";s:8:\"promoted\";s:31:\"category-woocommerce-extensions\";s:13:\"allow-dismiss\";b:0;}i:13;a:8:{s:4:\"slug\";s:19:\"orders-empty-wc-pay\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:20:\"woocommerce-payments\";s:4:\"icon\";s:111:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/woocommerce-payments.svg\";s:5:\"title\";s:20:\"WooCommerce Payments\";s:4:\"copy\";s:125:\"Securely accept payments and manage transactions directly from your WooCommerce dashboard – no setup costs or monthly fees.\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:54:\"https://woocommerce.com/products/woocommerce-payments/\";}i:14;a:8:{s:4:\"slug\";s:19:\"orders-empty-zapier\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:18:\"woocommerce-zapier\";s:4:\"icon\";s:97:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/zapier.svg\";s:5:\"title\";s:6:\"Zapier\";s:4:\"copy\";s:88:\"Save time and increase productivity by connecting your store to more than 1000+ services\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:52:\"https://woocommerce.com/products/woocommerce-zapier/\";}i:15;a:8:{s:4:\"slug\";s:30:\"orders-empty-shipment-tracking\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:29:\"woocommerce-shipment-tracking\";s:4:\"icon\";s:108:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipment-tracking.svg\";s:5:\"title\";s:17:\"Shipment Tracking\";s:4:\"copy\";s:86:\"Let customers know when their orders will arrive by adding shipment tracking to emails\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:51:\"https://woocommerce.com/products/shipment-tracking/\";}i:16;a:8:{s:4:\"slug\";s:32:\"orders-empty-table-rate-shipping\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:31:\"woocommerce-table-rate-shipping\";s:4:\"icon\";s:110:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/table-rate-shipping.svg\";s:5:\"title\";s:19:\"Table Rate Shipping\";s:4:\"copy\";s:122:\"Advanced, flexible shipping. Define multiple shipping rates based on location, price, weight, shipping class or item count\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:53:\"https://woocommerce.com/products/table-rate-shipping/\";}i:17;a:8:{s:4:\"slug\";s:40:\"orders-empty-shipping-carrier-extensions\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:4:\"icon\";s:118:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipping-carrier-extensions.svg\";s:5:\"title\";s:27:\"Shipping Carrier Extensions\";s:4:\"copy\";s:116:\"Show live rates from FedEx, UPS, USPS and more directly on your store - never under or overcharge for shipping again\";s:11:\"button-text\";s:13:\"Find Carriers\";s:8:\"promoted\";s:26:\"category-shipping-carriers\";s:3:\"url\";s:99:\"https://woocommerce.com/product-category/woocommerce-extensions/shipping-methods/shipping-carriers/\";}i:18;a:8:{s:4:\"slug\";s:32:\"orders-empty-google-product-feed\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:25:\"woocommerce-product-feeds\";s:4:\"icon\";s:110:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/google-product-feed.svg\";s:5:\"title\";s:19:\"Google Product Feed\";s:4:\"copy\";s:76:\"Increase sales by letting customers find you when they\'re shopping on Google\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:53:\"https://woocommerce.com/products/google-product-feed/\";}i:19;a:4:{s:4:\"slug\";s:35:\"products-empty-header-product-types\";s:7:\"context\";s:26:\"products-list-empty-header\";s:5:\"title\";s:23:\"Other types of products\";s:13:\"allow-dismiss\";b:0;}i:20;a:6:{s:4:\"slug\";s:32:\"products-empty-footer-browse-all\";s:7:\"context\";s:26:\"products-list-empty-footer\";s:9:\"link-text\";s:21:\"Browse all extensions\";s:3:\"url\";s:64:\"https://woocommerce.com/product-category/woocommerce-extensions/\";s:8:\"promoted\";s:31:\"category-woocommerce-extensions\";s:13:\"allow-dismiss\";b:0;}i:21;a:8:{s:4:\"slug\";s:30:\"products-empty-product-vendors\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:27:\"woocommerce-product-vendors\";s:4:\"icon\";s:106:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-vendors.svg\";s:5:\"title\";s:15:\"Product Vendors\";s:4:\"copy\";s:47:\"Turn your store into a multi-vendor marketplace\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:49:\"https://woocommerce.com/products/product-vendors/\";}i:22;a:8:{s:4:\"slug\";s:26:\"products-empty-memberships\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:23:\"woocommerce-memberships\";s:4:\"icon\";s:102:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/memberships.svg\";s:5:\"title\";s:11:\"Memberships\";s:4:\"copy\";s:76:\"Give members access to restricted content or products, for a fee or for free\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:57:\"https://woocommerce.com/products/woocommerce-memberships/\";}i:23;a:9:{s:4:\"slug\";s:35:\"products-empty-woocommerce-deposits\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:20:\"woocommerce-deposits\";s:14:\"show-if-active\";a:1:{i:0;s:20:\"woocommerce-bookings\";}s:4:\"icon\";s:99:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/deposits.svg\";s:5:\"title\";s:8:\"Deposits\";s:4:\"copy\";s:75:\"Make it easier for customers to pay by offering a deposit or a payment plan\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:54:\"https://woocommerce.com/products/woocommerce-deposits/\";}i:24;a:8:{s:4:\"slug\";s:40:\"products-empty-woocommerce-subscriptions\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:25:\"woocommerce-subscriptions\";s:4:\"icon\";s:104:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscriptions.svg\";s:5:\"title\";s:13:\"Subscriptions\";s:4:\"copy\";s:97:\"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:59:\"https://woocommerce.com/products/woocommerce-subscriptions/\";}i:25;a:8:{s:4:\"slug\";s:35:\"products-empty-woocommerce-bookings\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:20:\"woocommerce-bookings\";s:4:\"icon\";s:99:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/bookings.svg\";s:5:\"title\";s:8:\"Bookings\";s:4:\"copy\";s:99:\"Allow customers to book appointments, make reservations or rent equipment without leaving your site\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:54:\"https://woocommerce.com/products/woocommerce-bookings/\";}i:26;a:8:{s:4:\"slug\";s:30:\"products-empty-product-bundles\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:27:\"woocommerce-product-bundles\";s:4:\"icon\";s:106:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-bundles.svg\";s:5:\"title\";s:15:\"Product Bundles\";s:4:\"copy\";s:49:\"Offer customizable bundles and assembled products\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:49:\"https://woocommerce.com/products/product-bundles/\";}}s:7:\"updated\";i:1624961315;}', 'no'),
(1321, '_transient_product-transient-version', '1624961371', 'yes'),
(1335, '_transient_timeout_wc_term_counts', '1627553502', 'no'),
(1336, '_transient_wc_term_counts', 'a:1:{i:17;s:1:\"1\";}', 'no'),
(1339, '_transient_shipping-transient-version', '1624961517', 'yes'),
(1340, '_transient_timeout_wc_shipping_method_count_legacy', '1627553517', 'no'),
(1341, '_transient_wc_shipping_method_count_legacy', 'a:2:{s:7:\"version\";s:10:\"1624961517\";s:5:\"value\";i:0;}', 'no'),
(1344, '_transient_orders-transient-version', '1625203298', 'yes'),
(1368, 'woocommerce_admin_last_orders_milestone', '1', 'yes'),
(1383, '_transient_wc_count_comments', 'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(1574, 'easy_app_db_version', '3.5.3', 'yes'),
(1600, 'easyappointments_path', 'C:/xampp/htdocs/wordpress/easyappointments_new', 'yes'),
(1601, 'easyappointments_url', 'http://localhost/wordpress/easyappointments_new', 'yes'),
(1603, 'action_scheduler_migration_status', 'complete', 'yes'),
(1625, 'latepoint_db_version', '1.3.4', 'yes'),
(1628, 'latepoint_latest_available_version', '4.3.0', 'yes'),
(1629, 'latepoint_wizard_visited', '1', 'yes'),
(1715, '_site_transient_timeout_browser_7f65ff317c237641f7aace3b7dac03d6', '1626090819', 'no'),
(1716, '_site_transient_browser_7f65ff317c237641f7aace3b7dac03d6', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"91.0.4472.124\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1717, '_site_transient_timeout_php_check_9dfe9c1407d8720f2aa82fbeb25ecdd3', '1626090819', 'no'),
(1718, '_site_transient_php_check_9dfe9c1407d8720f2aa82fbeb25ecdd3', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(2382, '_transient_timeout__woocommerce_helper_subscriptions', '1625806926', 'no'),
(2383, '_transient__woocommerce_helper_subscriptions', 'a:0:{}', 'no'),
(2384, '_site_transient_timeout_theme_roots', '1625807826', 'no'),
(2385, '_site_transient_theme_roots', 'a:3:{s:14:\"twentynineteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";}', 'no'),
(2386, '_transient_timeout__woocommerce_helper_updates', '1625849226', 'no'),
(2387, '_transient__woocommerce_helper_updates', 'a:4:{s:4:\"hash\";s:32:\"d751713988987e9331980363e24189ce\";s:7:\"updated\";i:1625806026;s:8:\"products\";a:0:{}s:6:\"errors\";a:1:{i:0;s:10:\"http-error\";}}', 'no'),
(2388, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1625806028;s:7:\"checked\";a:13:{s:19:\"akismet/akismet.php\";s:5:\"4.1.9\";s:17:\"booked/booked.php\";s:3:\"2.3\";s:49:\"booked-frontend-agents/booked-frontend-agents.php\";s:6:\"1.1.13\";s:51:\"bookly-responsive-appointment-booking-tool/main.php\";s:4:\"19.8\";s:37:\"easyappointments/easyappointments.php\";s:5:\"1.3.1\";s:26:\"easy-appointments/main.php\";s:5:\"3.5.3\";s:9:\"hello.php\";s:5:\"1.7.2\";s:25:\"pluginajax/pluginajax.php\";s:5:\"1.0.0\";s:29:\"woo-razorpay/woo-razorpay.php\";s:5:\"2.7.1\";s:35:\"scheduler-creee/scheduler-creee.php\";s:5:\"1.0.0\";s:31:\"scheduler-new/scheduler-new.php\";s:5:\"1.0.0\";s:23:\"latepoint/latepoint.php\";s:5:\"4.2.3\";s:27:\"woocommerce/woocommerce.php\";s:5:\"5.4.1\";}s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:6:\"4.1.10\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/akismet.4.1.10.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.8\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:51:\"bookly-responsive-appointment-booking-tool/main.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:56:\"w.org/plugins/bookly-responsive-appointment-booking-tool\";s:4:\"slug\";s:42:\"bookly-responsive-appointment-booking-tool\";s:6:\"plugin\";s:51:\"bookly-responsive-appointment-booking-tool/main.php\";s:11:\"new_version\";s:6:\"19.9.1\";s:3:\"url\";s:73:\"https://wordpress.org/plugins/bookly-responsive-appointment-booking-tool/\";s:7:\"package\";s:92:\"https://downloads.wordpress.org/plugin/bookly-responsive-appointment-booking-tool.19.9.1.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:95:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/icon-128x128.png?rev=1005009\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:98:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/banner-1544x500.png?rev=1726755\";s:2:\"1x\";s:97:\"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/banner-772x250.png?rev=1726755\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.7.2\";s:12:\"requires_php\";s:5:\"5.3.7\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:5:{s:37:\"easyappointments/easyappointments.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:30:\"w.org/plugins/easyappointments\";s:4:\"slug\";s:16:\"easyappointments\";s:6:\"plugin\";s:37:\"easyappointments/easyappointments.php\";s:11:\"new_version\";s:5:\"1.3.1\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/easyappointments/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/easyappointments.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/easyappointments/assets/icon-128x128.png?rev=2406677\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:71:\"https://ps.w.org/easyappointments/assets/banner-772x250.png?rev=1397845\";}s:11:\"banners_rtl\";a:0:{}}s:26:\"easy-appointments/main.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:31:\"w.org/plugins/easy-appointments\";s:4:\"slug\";s:17:\"easy-appointments\";s:6:\"plugin\";s:26:\"easy-appointments/main.php\";s:11:\"new_version\";s:5:\"3.5.3\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/easy-appointments/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/easy-appointments.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/easy-appointments/assets/icon-256x256.png?rev=1472759\";s:2:\"1x\";s:70:\"https://ps.w.org/easy-appointments/assets/icon-128x128.png?rev=1472759\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/easy-appointments/assets/banner-1544x500.png?rev=2169533\";s:2:\"1x\";s:72:\"https://ps.w.org/easy-appointments/assets/banner-772x250.png?rev=2169533\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:29:\"woo-razorpay/woo-razorpay.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:26:\"w.org/plugins/woo-razorpay\";s:4:\"slug\";s:12:\"woo-razorpay\";s:6:\"plugin\";s:29:\"woo-razorpay/woo-razorpay.php\";s:11:\"new_version\";s:5:\"2.7.1\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/woo-razorpay/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/woo-razorpay.2.7.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/woo-razorpay/assets/icon-256x256.png?rev=2257034\";s:2:\"1x\";s:65:\"https://ps.w.org/woo-razorpay/assets/icon-128x128.png?rev=1273156\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"5.4.1\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.5.4.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=2366418\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=2366418\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2366418\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2366418\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(5, 6, '_wp_attached_file', '2021/06/pws-logo-svg.png'),
(6, 6, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:95;s:6:\"height\";i:117;s:4:\"file\";s:24:\"2021/06/pws-logo-svg.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(7, 7, '_edit_lock', '1624337871:1'),
(8, 11, '_appointment_title', ''),
(9, 11, '_appointment_timestamp', '1624269600'),
(10, 11, '_appointment_timeslot', '1000-1800'),
(11, 11, '_appointment_user', '1'),
(12, 11, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Half day</p>'),
(17, 20, '_appointment_title', ''),
(18, 20, '_appointment_timestamp', '1624320000'),
(19, 20, '_appointment_timeslot', '0000-1000'),
(20, 20, '_appointment_user', '1'),
(21, 20, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Full Day</p>'),
(22, 22, '_appointment_title', ''),
(23, 22, '_appointment_timestamp', '1624874400'),
(24, 22, '_appointment_timeslot', '1000-1800'),
(25, 22, '_appointment_user', '1'),
(26, 22, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Full Day</p>'),
(27, 23, '_wp_attached_file', 'woocommerce-placeholder.png'),
(28, 23, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:27:\"woocommerce-placeholder.png\";s:5:\"sizes\";a:4:{s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"woocommerce-placeholder-1024x1024.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(29, 28, '_appointment_title', ''),
(30, 28, '_appointment_timestamp', '1624874400'),
(31, 28, '_appointment_timeslot', '1000-1800'),
(32, 28, '_appointment_user', '1'),
(33, 28, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Half day</p>'),
(34, 28, '_booked_wc_time_created', '1624261340'),
(35, 28, '_booked_wc_date_created', '2021-06-21 07:42:20'),
(36, 29, '_appointment_title', ''),
(37, 29, '_appointment_timestamp', '1624320000'),
(38, 29, '_appointment_timeslot', '0000-1000'),
(39, 29, '_appointment_user', '2'),
(40, 29, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Full Day</p>'),
(41, 29, '_booked_wc_time_created', '1624261443'),
(42, 29, '_booked_wc_date_created', '2021-06-21 07:44:03'),
(43, 30, '_appointment_title', ''),
(44, 30, '_appointment_timestamp', '1624924800'),
(45, 30, '_appointment_timeslot', '0000-1000'),
(46, 30, '_appointment_user', '3'),
(47, 30, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Half day</p>'),
(48, 30, '_booked_wc_time_created', '1624261549'),
(49, 30, '_booked_wc_date_created', '2021-06-21 07:45:49'),
(50, 31, '_appointment_title', ''),
(51, 31, '_appointment_timestamp', '1625011200'),
(52, 31, '_appointment_timeslot', '0000-1800'),
(53, 31, '_appointment_user', '3'),
(54, 31, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Half day</p>'),
(55, 31, '_booked_wc_time_created', '1624263388'),
(56, 31, '_booked_wc_date_created', '2021-06-21 08:16:28'),
(57, 11, '_appointment_user_reminder_sent', '1'),
(58, 11, '_appointment_admin_reminder_sent', '1'),
(59, 33, '_appointment_title', ''),
(60, 33, '_appointment_timestamp', '1624492800'),
(61, 33, '_appointment_timeslot', '0000-1800'),
(62, 33, '_appointment_user', '1'),
(63, 33, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Half day</p>'),
(64, 33, '_booked_wc_time_created', '1624268542'),
(65, 33, '_booked_wc_date_created', '2021-06-21 09:42:22'),
(66, 34, '_appointment_title', ''),
(67, 34, '_appointment_timestamp', '1624924800'),
(68, 34, '_appointment_timeslot', '0000-1800'),
(69, 34, '_appointment_user', '1'),
(70, 34, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>3 Day</p>'),
(71, 35, '_appointment_title', ''),
(72, 35, '_appointment_timestamp', '1624406400'),
(73, 35, '_appointment_timeslot', '0000-1800'),
(74, 35, '_appointment_user', '3'),
(75, 35, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Full Day</p>'),
(76, 37, '_edit_lock', '1624273956:1'),
(77, 37, '_edit_last', '1'),
(78, 38, '_edit_lock', '1625218315:1'),
(79, 22, '_appointment_user_reminder_sent', '1'),
(80, 28, '_appointment_user_reminder_sent', '1'),
(81, 22, '_appointment_admin_reminder_sent', '1'),
(82, 28, '_appointment_admin_reminder_sent', '1'),
(83, 45, '_appointment_title', ''),
(84, 45, '_appointment_timestamp', '1626998400'),
(85, 45, '_appointment_timeslot', '0000-1800'),
(86, 45, '_appointment_user', '1'),
(87, 45, '_cf_meta_value', '<p class=\"cf-meta-value\"><strong>Choose your sessions</strong><br>Half day</p>'),
(88, 46, '_edit_lock', '1624961235:1'),
(89, 46, '_edit_last', '1'),
(90, 46, '_regular_price', '45'),
(91, 46, '_sale_price', '30'),
(92, 46, 'total_sales', '0'),
(93, 46, '_tax_status', 'taxable'),
(94, 46, '_tax_class', ''),
(95, 46, '_manage_stock', 'no'),
(96, 46, '_backorders', 'no'),
(97, 46, '_sold_individually', 'no'),
(98, 46, '_virtual', 'yes'),
(99, 46, '_downloadable', 'no'),
(100, 46, '_download_limit', '-1'),
(101, 46, '_download_expiry', '-1'),
(102, 46, '_stock', NULL),
(103, 46, '_stock_status', 'instock'),
(104, 46, '_wc_average_rating', '0'),
(105, 46, '_wc_review_count', '0'),
(106, 46, '_product_version', '5.4.1'),
(107, 46, '_price', '30'),
(108, 46, '_booked_appointment', 'no'),
(109, 47, '_order_key', 'wc_order_NvxJU8Coj2MhO'),
(110, 47, '_customer_user', '1'),
(111, 47, '_payment_method', 'razorpay'),
(112, 47, '_payment_method_title', 'Credit Card/Debit Card/NetBanking'),
(113, 47, '_customer_ip_address', '::1'),
(114, 47, '_customer_user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'),
(115, 47, '_created_via', 'checkout'),
(116, 47, '_cart_hash', 'bf3fac2688cbb72af47e993fc5aa6f4d'),
(117, 47, '_billing_first_name', 'rakesh'),
(118, 47, '_billing_last_name', 'raju'),
(119, 47, '_billing_address_1', 'rgfrewgfr'),
(120, 47, '_billing_address_2', 'gregerg'),
(121, 47, '_billing_city', 'gergreg'),
(122, 47, '_billing_state', 'KL'),
(123, 47, '_billing_postcode', '683520'),
(124, 47, '_billing_country', 'IN'),
(125, 47, '_billing_email', 'admin@gmail.com'),
(126, 47, '_billing_phone', '6456546546546'),
(127, 47, '_order_currency', 'USD'),
(128, 47, '_cart_discount', '0'),
(129, 47, '_cart_discount_tax', '0'),
(130, 47, '_order_shipping', '0'),
(131, 47, '_order_shipping_tax', '0'),
(132, 47, '_order_tax', '0'),
(133, 47, '_order_total', '1410'),
(134, 47, '_order_version', '5.4.1'),
(135, 47, '_prices_include_tax', 'no'),
(136, 47, '_billing_address_index', 'rakesh raju  rgfrewgfr gregerg gergreg KL 683520 IN admin@gmail.com 6456546546546'),
(137, 47, '_shipping_address_index', '        '),
(138, 47, 'is_vat_exempt', 'no'),
(139, 2, '_edit_lock', '1625486661:1'),
(142, 56, '_wp_attached_file', '2021/07/cn8iIUuikw7EFxNvC1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image.jpg'),
(143, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:400;s:6:\"height\";i:400;s:4:\"file\";s:74:\"2021/07/cn8iIUuikw7EFxNvC1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image.jpg\";s:5:\"sizes\";a:4:{s:6:\"medium\";a:4:{s:4:\"file\";s:74:\"cn8iIUuikw7EFxNvC1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:74:\"cn8iIUuikw7EFxNvC1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:74:\"cn8iIUuikw7EFxNvC1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:74:\"cn8iIUuikw7EFxNvC1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2021-06-21 06:26:19', '2021-06-21 06:26:19', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2021-06-21 06:26:19', '2021-06-21 06:26:19', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2021-06-21 06:26:19', '2021-06-21 06:26:19', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[latepoint_book_button]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2021-07-05 08:11:17', '2021-07-05 08:11:17', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2021-06-21 06:26:19', '2021-06-21 06:26:19', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2021-06-21 06:26:19', '2021-06-21 06:26:19', '', 0, 'http://localhost/wordpress/?page_id=3', 0, 'page', '', 0),
(6, 1, '2021-06-21 06:40:54', '2021-06-21 06:40:54', '', 'pws logo svg', '', 'inherit', 'open', 'closed', '', 'pws-logo-svg', '', '', '2021-06-21 06:40:54', '2021-06-21 06:40:54', '', 0, 'http://localhost/wordpress/wp-content/uploads/2021/06/pws-logo-svg.png', 0, 'attachment', 'image/png', 0),
(7, 1, '2021-06-21 06:44:35', '2021-06-21 06:44:35', '<!-- wp:shortcode -->\n[booked-calendar]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode /-->\n\n<!-- wp:shortcode /-->', 'North Hampton', '', 'publish', 'closed', 'closed', '', 'north-hampton', '', '', '2021-06-21 08:27:47', '2021-06-21 08:27:47', '', 0, 'http://localhost/wordpress/?page_id=7', 0, 'page', '', 0),
(8, 1, '2021-06-21 06:44:35', '2021-06-21 06:44:35', '', 'North Hampton', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-06-21 06:44:35', '2021-06-21 06:44:35', '', 7, 'http://localhost/wordpress/?p=8', 0, 'revision', '', 0),
(9, 1, '2021-06-21 06:45:02', '2021-06-21 06:45:02', '<!-- wp:shortcode -->\n[booked-calendar]\n<!-- /wp:shortcode -->', 'North Hampton', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-06-21 06:45:02', '2021-06-21 06:45:02', '', 7, 'http://localhost/wordpress/?p=9', 0, 'revision', '', 0),
(11, 1, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 21, 2021 @ 10:00 am (User: 1)', '', 'publish', 'closed', 'closed', '', 'june-21-2021-1000-am-user-1', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-21-2021-1000-am-user-1/', 0, 'booked_appointments', '', 0),
(12, 1, '2021-06-21 06:51:04', '2021-06-21 06:51:04', '<!-- wp:shortcode -->\n[booked-calendar calendar=3]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode -->\n[booked-calendar calendar=2]\n<!-- /wp:shortcode -->', 'North Hampton', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-06-21 06:51:04', '2021-06-21 06:51:04', '', 7, 'http://localhost/wordpress/?p=12', 0, 'revision', '', 0),
(15, 1, '2021-06-21 06:58:39', '2021-06-21 06:58:39', '<!-- wp:shortcode -->\n[booked-calendar]\n<!-- /wp:shortcode -->', 'North Hampton', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-06-21 06:58:39', '2021-06-21 06:58:39', '', 7, 'http://localhost/wordpress/?p=15', 0, 'revision', '', 0),
(17, 1, '2021-06-21 06:59:18', '2021-06-21 06:59:18', '<!-- wp:shortcode -->\n[booked-calendar calendar=3]\n<!-- /wp:shortcode -->', 'North Hampton', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-06-21 06:59:18', '2021-06-21 06:59:18', '', 7, 'http://localhost/wordpress/?p=17', 0, 'revision', '', 0),
(19, 1, '2021-06-21 07:02:25', '2021-06-21 07:02:25', '<!-- wp:shortcode -->\n[booked-calendar]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode -->\n[booked-calendar calendar=3]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode -->\n[booked-calendar calendar=2]\n<!-- /wp:shortcode -->', 'North Hampton', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-06-21 07:02:25', '2021-06-21 07:02:25', '', 7, 'http://localhost/wordpress/?p=19', 0, 'revision', '', 0),
(20, 1, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 22, 2021 @ 12:00 am (User: 1)', '', 'publish', 'closed', 'closed', '', 'june-22-2021-1200-am-user-1', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-22-2021-1200-am-user-1/', 0, 'booked_appointments', '', 0),
(22, 1, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 28, 2021 @ 10:00 am (User: 1)', '', 'publish', 'closed', 'closed', '', 'june-28-2021-1000-am-user-1', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-28-2021-1000-am-user-1/', 0, 'booked_appointments', '', 0),
(23, 1, '2021-06-21 07:39:41', '2021-06-21 07:39:41', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2021-06-21 07:39:41', '2021-06-21 07:39:41', '', 0, 'http://localhost/wordpress/wp-content/uploads/2021/06/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(24, 1, '2021-06-21 07:39:42', '2021-06-21 07:39:42', '', 'Shop', '', 'publish', 'closed', 'closed', '', 'shop', '', '', '2021-06-21 07:39:42', '2021-06-21 07:39:42', '', 0, 'http://localhost/wordpress/shop/', 0, 'page', '', 0),
(25, 1, '2021-06-21 07:39:42', '2021-06-21 07:39:42', '<!-- wp:shortcode -->[woocommerce_cart]<!-- /wp:shortcode -->', 'Cart', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2021-06-21 07:39:42', '2021-06-21 07:39:42', '', 0, 'http://localhost/wordpress/cart/', 0, 'page', '', 0),
(26, 1, '2021-06-21 07:39:42', '2021-06-21 07:39:42', '<!-- wp:shortcode -->[woocommerce_checkout]<!-- /wp:shortcode -->', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2021-06-21 07:39:42', '2021-06-21 07:39:42', '', 0, 'http://localhost/wordpress/checkout/', 0, 'page', '', 0),
(27, 1, '2021-06-21 07:39:42', '2021-06-21 07:39:42', '<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->', 'My account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2021-06-21 07:39:42', '2021-06-21 07:39:42', '', 0, 'http://localhost/wordpress/my-account/', 0, 'page', '', 0),
(28, 1, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 28, 2021 @ 10:00 am (User: 1)', '', 'publish', 'closed', 'closed', '', 'june-28-2021-1000-am-user-1-2', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-28-2021-1000-am-user-1-2/', 0, 'booked_appointments', '', 0),
(29, 2, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 22, 2021 @ 12:00 am (User: 2)', '', 'publish', 'closed', 'closed', '', 'june-22-2021-1200-am-user-2', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-22-2021-1200-am-user-2/', 0, 'booked_appointments', '', 0),
(30, 3, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 29, 2021 @ 12:00 am (User: 3)', '', 'publish', 'closed', 'closed', '', 'june-29-2021-1200-am-user-3', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-29-2021-1200-am-user-3/', 0, 'booked_appointments', '', 0),
(31, 3, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 30, 2021 @ 12:00 am (User: 3)', '', 'publish', 'closed', 'closed', '', 'june-30-2021-1200-am-user-3', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-30-2021-1200-am-user-3/', 0, 'booked_appointments', '', 0),
(32, 1, '2021-06-21 08:27:47', '2021-06-21 08:27:47', '<!-- wp:shortcode -->\n[booked-calendar]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode /-->\n\n<!-- wp:shortcode /-->', 'North Hampton', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-06-21 08:27:47', '2021-06-21 08:27:47', '', 7, 'http://localhost/wordpress/?p=32', 0, 'revision', '', 0),
(33, 1, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 24, 2021 @ 12:00 am (User: 1)', '', 'publish', 'closed', 'closed', '', 'june-24-2021-1200-am-user-1', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-24-2021-1200-am-user-1/', 0, 'booked_appointments', '', 0),
(34, 1, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 29, 2021 @ 12:00 am (User: 1)', '', 'publish', 'closed', 'closed', '', 'june-29-2021-1200-am-user-1', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-29-2021-1200-am-user-1/', 0, 'booked_appointments', '', 0),
(35, 3, '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 'June 23, 2021 @ 12:00 am (User: 3)', '', 'publish', 'closed', 'closed', '', 'june-23-2021-1200-am-user-3', '', '', '2021-06-01 00:00:00', '2021-06-01 00:00:00', '', 0, 'http://localhost/wordpress/booked_appointments/june-23-2021-1200-am-user-3/', 0, 'booked_appointments', '', 0),
(37, 1, '2021-06-21 11:12:11', '2021-06-21 11:12:11', 'test testeee', 'test', '', 'publish', 'closed', 'closed', '', 'test', '', '', '2021-06-21 11:12:11', '2021-06-21 11:12:11', '', 0, 'http://localhost/wordpress/?post_type=book&#038;p=37', 0, 'book', '', 0),
(38, 1, '2021-06-22 10:49:12', '2021-06-22 10:49:12', '<!-- wp:shortcode -->\n[booked-form]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode /-->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode /-->', 'Scheduler', '', 'publish', 'closed', 'closed', '', 'scheduler', '', '', '2021-07-02 09:01:19', '2021-07-02 09:01:19', '', 0, 'http://localhost/wordpress/?page_id=38', 0, 'page', '', 0),
(39, 1, '2021-06-22 10:49:12', '2021-06-22 10:49:12', '<!-- wp:shortcode -->\n[sitepoint_contact_form]\n<!-- /wp:shortcode -->', 'Scheduler', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2021-06-22 10:49:12', '2021-06-22 10:49:12', '', 38, 'http://localhost/wordpress/?p=39', 0, 'revision', '', 0),
(40, 1, '2021-06-24 05:08:16', '2021-06-24 05:08:16', '<!-- wp:shortcode -->\nscheduler\n<!-- /wp:shortcode -->', 'Scheduler', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2021-06-24 05:08:16', '2021-06-24 05:08:16', '', 38, 'http://localhost/wordpress/?p=40', 0, 'revision', '', 0),
(41, 1, '2021-06-24 05:08:27', '2021-06-24 05:08:27', '<!-- wp:shortcode -->\n[scheduler]\n<!-- /wp:shortcode -->', 'Scheduler', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2021-06-24 05:08:27', '2021-06-24 05:08:27', '', 38, 'http://localhost/wordpress/?p=41', 0, 'revision', '', 0),
(44, 1, '2021-06-28 11:59:43', '2021-06-28 11:59:43', '<!-- wp:shortcode -->\n[scheduler]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode -->\n[booked-calendar]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Scheduler', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2021-06-28 11:59:43', '2021-06-28 11:59:43', '', 38, 'http://localhost/wordpress/?p=44', 0, 'revision', '', 0),
(45, 1, '2021-07-01 00:00:00', '2021-07-01 00:00:00', '', 'July 23, 2021 @ 12:00 am (User: 1)', '', 'publish', 'closed', 'closed', '', 'july-23-2021-1200-am-user-1', '', '', '2021-07-01 00:00:00', '2021-07-01 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=booked_appointments&p=45', 0, 'booked_appointments', '', 0),
(46, 1, '2021-06-29 10:09:30', '2021-06-29 10:09:30', '', 'osce', '', 'publish', 'open', 'closed', '', 'osce', '', '', '2021-06-29 10:09:31', '2021-06-29 10:09:31', '', 0, 'http://localhost/wordpress/?post_type=product&#038;p=46', 0, 'product', '', 0),
(47, 1, '2021-06-29 10:13:53', '2021-06-29 10:13:53', '', 'Order &ndash; June 29, 2021 @ 10:13 AM', '', 'wc-cancelled', 'open', 'closed', 'wc_order_NvxJU8Coj2MhO', 'order-jun-29-2021-1013-am', '', '', '2021-07-02 05:21:38', '2021-07-02 05:21:38', '', 0, 'http://localhost/wordpress/?post_type=shop_order&#038;p=47', 0, 'shop_order', '', 1),
(48, 1, '2021-07-02 05:31:57', '2021-07-02 05:31:57', '<!-- wp:shortcode -->\n[scheduler]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode -->\n[booked-calendar]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[booked-login]\n<!-- /wp:shortcode -->', 'Scheduler', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2021-07-02 05:31:57', '2021-07-02 05:31:57', '', 38, 'http://localhost/wordpress/?p=48', 0, 'revision', '', 0),
(50, 1, '2021-07-02 05:34:34', '2021-07-02 05:34:34', '<!-- wp:shortcode -->\n[scheduler]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode /-->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[booked-login]\n<!-- /wp:shortcode -->', 'Scheduler', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2021-07-02 05:34:34', '2021-07-02 05:34:34', '', 38, 'http://localhost/wordpress/?p=50', 0, 'revision', '', 0),
(52, 1, '2021-07-02 09:01:19', '2021-07-02 09:01:19', '<!-- wp:shortcode -->\n[booked-form]\n<!-- /wp:shortcode -->\n\n<!-- wp:shortcode /-->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode /-->', 'Scheduler', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2021-07-02 09:01:19', '2021-07-02 09:01:19', '', 38, 'http://localhost/wordpress/?p=52', 0, 'revision', '', 0),
(53, 1, '2021-07-05 07:32:04', '2021-07-05 07:32:04', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[ea_bootstrap]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-07-05 07:32:04', '2021-07-05 07:32:04', '', 2, 'http://localhost/wordpress/?p=53', 0, 'revision', '', 0),
(54, 1, '2021-07-05 07:44:13', '2021-07-05 07:44:13', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[easyappointments]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-07-05 07:44:13', '2021-07-05 07:44:13', '', 2, 'http://localhost/wordpress/?p=54', 0, 'revision', '', 0),
(56, 1, '2021-07-05 08:07:22', '2021-07-05 08:07:22', '', 'cn8iIUuikw7EFxNvC1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image', '', 'inherit', 'open', 'closed', '', 'cn8iiuuikw7efxnvc1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image', '', '', '2021-07-05 08:07:22', '2021-07-05 08:07:22', '', 0, 'http://localhost/wordpress/wp-content/uploads/2021/07/cn8iIUuikw7EFxNvC1ay_02_9e7c91ffae6c666a1936807b5f087c0e_image.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2021-07-05 08:08:03', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-07-05 08:08:03', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=57', 0, 'post', '', 0),
(58, 1, '2021-07-05 08:11:17', '2021-07-05 08:11:17', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:shortcode -->\n[latepoint_book_button]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-07-05 08:11:17', '2021-07-05 08:11:17', '', 2, 'http://localhost/wordpress/?p=58', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 17, 'product_count_product_cat', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(4, 'simple', 'simple', 0),
(5, 'grouped', 'grouped', 0),
(6, 'variable', 'variable', 0),
(7, 'external', 'external', 0),
(8, 'exclude-from-search', 'exclude-from-search', 0),
(9, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(10, 'featured', 'featured', 0),
(11, 'outofstock', 'outofstock', 0),
(12, 'rated-1', 'rated-1', 0),
(13, 'rated-2', 'rated-2', 0),
(14, 'rated-3', 'rated-3', 0),
(15, 'rated-4', 'rated-4', 0),
(16, 'rated-5', 'rated-5', 0),
(17, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(46, 4, 0),
(46, 17, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(4, 4, 'product_type', '', 0, 1),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'product_type', '', 0, 0),
(7, 7, 'product_type', '', 0, 0),
(8, 8, 'product_visibility', '', 0, 0),
(9, 9, 'product_visibility', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_visibility', '', 0, 0),
(16, 16, 'product_visibility', '', 0, 0),
(17, 17, 'product_cat', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', 'rakesh'),
(3, 1, 'last_name', 'raju'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'plugin_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:4:{s:64:\"09b3c4553c775e68f94c4c6afb58c39caa85e362bcd9a60f4b3024ba14ed5f35\";a:4:{s:10:\"expiration\";i:1625806662;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36\";s:5:\"login\";i:1625633862;}s:64:\"95f130a087446be80d13d54ef2f7a6dcf428327622c5cba732d9af0d2c98e42c\";a:4:{s:10:\"expiration\";i:1625892134;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36\";s:5:\"login\";i:1625719334;}s:64:\"bfad63546fc2e05aa65407d94e15f894ec90fd580e992776d929b1d470b5063e\";a:4:{s:10:\"expiration\";i:1625892135;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36\";s:5:\"login\";i:1625719335;}s:64:\"743d602d08d2c3ead522164723941490ea61155a1ba4060d6f4b1010df1446e7\";a:4:{s:10:\"expiration\";i:1625978835;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36\";s:5:\"login\";i:1625806035;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '57'),
(18, 1, 'wp_user-settings', 'libraryContent=browse&mfold=o'),
(19, 1, 'wp_user-settings-time', '1624877892'),
(20, 2, 'nickname', 'krishna_sagar'),
(21, 2, 'first_name', 'krishna'),
(22, 2, 'last_name', 'sagar'),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'syntax_highlighting', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'fresh'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'locale', ''),
(31, 2, 'wp_capabilities', 'a:1:{s:20:\"booked_booking_agent\";b:1;}'),
(32, 2, 'wp_user_level', '0'),
(33, 2, 'dismissed_wp_pointers', ''),
(34, 1, 'bookly_staff_members_table_settings', 'a:2:{s:5:\"order\";a:0:{}s:6:\"filter\";a:3:{s:10:\"visibility\";s:0:\"\";s:8:\"archived\";s:1:\"0\";s:8:\"category\";s:0:\"\";}}'),
(35, 1, 'bookly_dismiss_collect_stats_notice', '1'),
(36, 1, 'bookly_dismiss_powered_by_notice', '1'),
(37, 1, 'bookly_appointments_table_settings', 'a:2:{s:5:\"order\";a:0:{}s:6:\"filter\";a:6:{s:2:\"id\";s:0:\"\";s:12:\"created_date\";s:3:\"any\";s:5:\"staff\";s:0:\"\";s:8:\"customer\";s:0:\"\";s:7:\"service\";s:0:\"\";s:6:\"status\";s:0:\"\";}}'),
(38, 1, 'bookly_services_table_settings', 'a:2:{s:5:\"order\";a:0:{}s:6:\"filter\";a:1:{s:8:\"category\";s:0:\"\";}}'),
(39, 1, 'bookly_payments_table_settings', 'a:2:{s:6:\"filter\";a:6:{s:2:\"id\";s:0:\"\";s:4:\"type\";s:0:\"\";s:8:\"customer\";s:0:\"\";s:5:\"staff\";s:0:\"\";s:7:\"service\";s:0:\"\";s:6:\"status\";s:0:\"\";}s:5:\"order\";a:0:{}}'),
(40, 1, '_woocommerce_tracks_anon_id', 'woo:UiO4ip5sY8JgcuTCFiP77lCE'),
(41, 1, 'booked_phone', ''),
(42, 1, 'last_update', '1624962405'),
(43, 1, 'woocommerce_admin_activity_panel_inbox_last_read', '1624962404043'),
(44, 1, 'wc_last_active', '1625788800'),
(45, 2, 'session_tokens', 'a:1:{s:64:\"fb7d6b2cb56f52ed2a12db82c1d0bf39a6fe9da211ed6d951064e856bcd58e71\";a:4:{s:10:\"expiration\";i:1625471034;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36\";s:5:\"login\";i:1624261434;}}'),
(46, 2, 'wc_last_active', '1624233600'),
(48, 2, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:0:{}}'),
(49, 3, 'nickname', 'test'),
(50, 3, 'first_name', 'testtt'),
(51, 3, 'last_name', 'testtt'),
(52, 3, 'description', ''),
(53, 3, 'rich_editing', 'true'),
(54, 3, 'syntax_highlighting', 'true'),
(55, 3, 'comment_shortcuts', 'false'),
(56, 3, 'admin_color', 'fresh'),
(57, 3, 'use_ssl', '0'),
(58, 3, 'show_admin_bar_front', 'true'),
(59, 3, 'locale', ''),
(60, 3, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(61, 3, 'wp_user_level', '0'),
(62, 3, 'dismissed_wp_pointers', ''),
(63, 3, 'session_tokens', 'a:1:{s:64:\"18d205f9d24402ae97d20a5627277dc6aa82cbf10e083dbd9e86661833951dcd\";a:4:{s:10:\"expiration\";i:1625471141;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36\";s:5:\"login\";i:1624261541;}}'),
(64, 3, 'wc_last_active', '1624233600'),
(66, 3, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:0:{}}'),
(67, 1, 'woocommerce_admin_task_list_tracked_started_tasks', '{\"products\":1,\"payments\":1,\"appearance\":1}'),
(68, 1, 'meta-box-order_product', 'a:3:{s:4:\"side\";s:96:\"submitdiv,product_catdiv,tagsdiv-product_tag,postimagediv,woocommerce-product-images,postexcerpt\";s:6:\"normal\";s:43:\"postcustom,slugdiv,woocommerce-product-data\";s:8:\"advanced\";s:0:\"\";}'),
(69, 1, 'screen_layout_product', '2'),
(70, 1, 'closedpostboxes_product', 'a:0:{}'),
(71, 1, 'metaboxhidden_product', 'a:2:{i:0;s:10:\"postcustom\";i:1;s:7:\"slugdiv\";}'),
(73, 1, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:1:{s:32:\"d9d4f495e875a2e075a1a4a6e1b9770f\";a:11:{s:3:\"key\";s:32:\"d9d4f495e875a2e075a1a4a6e1b9770f\";s:10:\"product_id\";i:46;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:47;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:1410;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:1410;s:8:\"line_tax\";i:0;}}}'),
(74, 1, 'billing_first_name', 'rakesh'),
(75, 1, 'billing_last_name', 'raju'),
(76, 1, 'billing_address_1', 'rgfrewgfr'),
(77, 1, 'billing_address_2', 'gregerg'),
(78, 1, 'billing_city', 'gergreg'),
(79, 1, 'billing_state', 'KL'),
(80, 1, 'billing_postcode', '683520'),
(81, 1, 'billing_country', 'IN'),
(82, 1, 'billing_email', 'admin@gmail.com'),
(83, 1, 'billing_phone', '6456546546546'),
(84, 1, 'shipping_method', ''),
(88, 1, '_order_count', '1'),
(89, 1, '_last_order', '47'),
(91, 4, 'nickname', 'test@usr.com'),
(92, 4, 'first_name', 'Tst'),
(93, 4, 'last_name', 'Usr'),
(94, 4, 'description', ''),
(95, 4, 'rich_editing', 'true'),
(96, 4, 'syntax_highlighting', 'true'),
(97, 4, 'comment_shortcuts', 'false'),
(98, 4, 'admin_color', 'fresh'),
(99, 4, 'use_ssl', '0'),
(100, 4, 'show_admin_bar_front', 'true'),
(101, 4, 'locale', ''),
(102, 4, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(103, 4, 'wp_user_level', '0'),
(104, 4, 'dismissed_wp_pointers', ''),
(105, 4, 'booked_phone', ''),
(106, 4, 'last_update', '1625485749');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$B.X.TzueIquyFiJCVf17kRQuplqGCv1', 'admin', 'admin@gmail.com', 'http://localhost/wordpress', '2021-06-21 06:26:19', '', 0, 'admin'),
(2, 'krishna_sagar', '$P$Bi7b7v4PMT.I4aMWyVjlgwFMxZeNHr1', 'krishna_sagar', 'k@gmail.com', 'http://poweroins.com', '2021-06-21 07:11:01', '', 0, 'krishna sagar'),
(3, 'test', '$P$BTigmlHBTQYKEkovrQKlXCxL/cC3a81', 'test', 'test@gmail.com', '', '2021-06-21 07:45:02', '', 0, 'testtt testtt'),
(4, 'test@usr.com', '$P$BcEdcmCoAdyeq/USoDrJNe5ZEhhvHC/', 'testusr-com', 'test@usr.com', '', '2021-07-05 11:48:43', '', 0, 'Tst Usr');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_admin_notes`
--

CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT 0,
  `layout` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wc_admin_notes`
--

INSERT INTO `wp_wc_admin_notes` (`note_id`, `name`, `type`, `locale`, `title`, `content`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`, `layout`, `image`, `is_deleted`, `icon`) VALUES
(1, 'paypal_ppcp_gtm_2021', 'marketing', 'en_US', 'Offer more options with the new PayPal', 'Get the latest PayPal extension for a full suite of payment methods with extensive currency and country coverage.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(2, 'facebook_pixel_api_2021', 'marketing', 'en_US', 'Improve the performance of your Facebook ads', 'Enable Facebook Pixel and Conversions API through the latest version of Facebook for WooCommerce for improved measurement and ad targeting capabilities.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(3, 'facebook_ec_2021', 'marketing', 'en_US', 'Sync your product catalog with Facebook to help boost sales', 'A single click adds all products to your Facebook Business Page shop. Product changes are automatically synced, with the flexibility to control which products are listed.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(4, 'ecomm-need-help-setting-up-your-store', 'info', 'en_US', 'Need help setting up your Store?', 'Schedule a free 30-min <a href=\"https://wordpress.com/support/concierge-support/\">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(5, 'woocommerce-services', 'info', 'en_US', 'WooCommerce Shipping & Tax', 'WooCommerce Shipping &amp; Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(6, 'ecomm-unique-shopping-experience', 'info', 'en_US', 'For a shopping experience as unique as your customers', 'Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(7, 'wc-admin-getting-started-in-ecommerce', 'info', 'en_US', 'Getting Started in eCommerce - webinar', 'We want to make eCommerce and this process of getting started as easy as possible for you. Watch this webinar to get tips on how to have our store up and running in a breeze.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(8, 'your-first-product', 'info', 'en_US', 'Your first product', 'That\'s huge! You\'re well on your way to building a successful online store — now it’s time to think about how you\'ll fulfill your orders.<br /><br />Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href=\"https://href.li/?https://woocommerce.com/shipping\" target=\"_blank\">WooCommerce Shipping</a>.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(9, 'wc-square-apple-pay-boost-sales', 'marketing', 'en_US', 'Boost sales with Apple Pay', 'Now that you accept Apple Pay® with Square you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(10, 'wc-square-apple-pay-grow-your-business', 'marketing', 'en_US', 'Grow your business with Square and Apple Pay ', 'Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(11, 'wcpay-apple-pay-is-now-available', 'marketing', 'en_US', 'Apple Pay is now available with WooCommerce Payments!', 'Increase your conversion rate by offering a fast and secure checkout with <a href=\"https://woocommerce.com/apple-pay/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay\" target=\"_blank\">Apple Pay</a>®. It’s free to get started with <a href=\"https://woocommerce.com/payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay\" target=\"_blank\">WooCommerce Payments</a>.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(12, 'wcpay-apple-pay-boost-sales', 'marketing', 'en_US', 'Boost sales with Apple Pay', 'Now that you accept Apple Pay® with WooCommerce Payments you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(13, 'wcpay-apple-pay-grow-your-business', 'marketing', 'en_US', 'Grow your business with WooCommerce Payments and Apple Pay', 'Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(14, 'wc-admin-optimizing-the-checkout-flow', 'info', 'en_US', 'Optimizing the checkout flow', 'It\'s crucial to get your store\'s checkout as smooth as possible to avoid losing sales. Let\'s take a look at how you can optimize the checkout experience for your shoppers.', '{}', 'unactioned', 'woocommerce.com', '2021-07-02 05:22:04', NULL, 0, 'plain', '', 0, 'info'),
(15, 'wc-admin-first-five-things-to-customize', 'info', 'en_US', 'The first 5 things to customize in your store', 'Deciding what to start with first is tricky. To help you properly prioritize, we\'ve put together this short list of the first few things you should customize in WooCommerce.', '{}', 'unactioned', 'woocommerce.com', '2021-06-29 10:09:31', NULL, 0, 'plain', '', 0, 'info'),
(16, 'wc-payments-qualitative-feedback', 'info', 'en_US', 'WooCommerce Payments setup - let us know what you think', 'Congrats on enabling WooCommerce Payments for your store. Please share your feedback in this 2 minute survey to help us improve the setup process.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(17, 'share-your-feedback-on-paypal', 'info', 'en_US', 'Share your feedback on PayPal', 'Share your feedback in this 2 minute survey about how we can make the process of accepting payments more useful for your store.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(18, 'wcpay_instant_deposits_gtm_2021', 'marketing', 'en_US', 'Get paid within minutes – Instant Deposits for WooCommerce Payments', 'Stay flexible with immediate access to your funds when you need them – including nights, weekends, and holidays. With <a href=\"https://woocommerce.com/products/woocommerce-payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_instant_deposits\">WooCommerce Payments\'</a> new Instant Deposits feature, you’re able to transfer your earnings to a debit card within minutes.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(19, 'google_listings_and_ads_install', 'marketing', 'en_US', 'Drive traffic and sales with Google', 'Reach online shoppers to drive traffic and sales for your store by showcasing products across Google, for free or with ads.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(20, 'wc-subscriptions-security-update-3-0-15', 'info', 'en_US', 'WooCommerce Subscriptions security update!', 'We recently released an important security update to WooCommerce Subscriptions. To ensure your site\'s data is protected, please upgrade <strong>WooCommerce Subscriptions to version 3.0.15</strong> or later.<br /><br />Click the button below to view and update to the latest Subscriptions version, or log in to <a href=\"https://woocommerce.com/my-dashboard\">WooCommerce.com Dashboard</a> and navigate to your <strong>Downloads</strong> page.<br /><br />We recommend always using the latest version of WooCommerce Subscriptions, and other software running on your site, to ensure maximum security.<br /><br />If you have any questions we are here to help — just <a href=\"https://woocommerce.com/my-account/create-a-ticket/\">open a ticket</a>.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(21, 'woocommerce-core-update-5-4-0', 'info', 'en_US', 'Update to WooCommerce 5.4.1 now', 'WooCommerce 5.4.1 addresses a checkout issue discovered in WooCommerce 5.4. We recommend upgrading to WooCommerce 5.4.1 as soon as possible.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(22, 'wcpay-promo-2020-11', 'marketing', 'en_US', 'wcpay-promo-2020-11', 'wcpay-promo-2020-11', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(23, 'wcpay-promo-2020-12', 'marketing', 'en_US', 'wcpay-promo-2020-12', 'wcpay-promo-2020-12', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(24, 'wcpay-promo-2021-6-incentive-1', 'marketing', 'en_US', 'Special offer: Save 50% on transaction fees for up to $125,000 in payments', 'Save big when you add <a href=\"https://woocommerce.com/payments/?utm_medium=notification&amp;utm_source=product&amp;utm_campaign=wcpay_exp222\">WooCommerce Payments</a> to your store today.\n                Get a discounted rate of 1.5% + $0.15 on all transactions – that’s 50% off the standard fee on up to $125,000 in processed payments (or six months, whichever comes first). Act now – this offer is available for a limited time only.\n                <br /><br />By clicking \"Get WooCommerce Payments,\" you agree to the promotional <a href=\"https://woocommerce.com/terms-conditions/woocommerce-payments-half-off-six-promotion/?utm_medium=notification&amp;utm_source=product&amp;utm_campaign=wcpay_exp222\">Terms of Service</a>.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(25, 'wcpay-promo-2021-6-incentive-2', 'marketing', 'en_US', 'Special offer: No transaction fees* for up to three months', 'Save big when you add <a href=\"https://woocommerce.com/payments/?utm_medium=notification&amp;utm_source=product&amp;utm_campaign=wcpay_exp233\">WooCommerce Payments</a> to your store today. Pay zero transaction fees* on up to $25,000 in processed payments (or three months, whichever comes first). Act now – this offer is available for a limited time only. *Currency conversion fees excluded.\n                <br /><br />By clicking \"Get WooCommerce Payments,\" you agree to the promotional <a href=\"https://woocommerce.com/terms-conditions/woocommerce-payments-no-transaction-fees-for-three-promotion/?utm_medium=notification&amp;utm_source=product&amp;utm_campaign=wcpay_exp233\">Terms of Service</a>.', '{}', 'pending', 'woocommerce.com', '2021-06-21 07:39:43', NULL, 0, 'plain', '', 0, 'info'),
(26, 'wc-admin-onboarding-email-marketing', 'info', 'en_US', 'Sign up for tips, product updates, and inspiration', 'We\'re here for you - get tips, product updates and inspiration straight to your email box', '{}', 'unactioned', 'woocommerce-admin', '2021-06-21 07:39:44', NULL, 0, 'plain', '', 0, 'info'),
(27, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Connect to WooCommerce.com', 'Connect to get important product notifications and updates.', '{}', 'unactioned', 'woocommerce-admin', '2021-06-21 07:39:44', NULL, 0, 'plain', '', 0, 'info'),
(28, 'wc-admin-selling-online-courses', 'marketing', 'en_US', 'Do you want to sell online courses?', 'Online courses are a great solution for any business that can teach a new skill. Since courses don’t require physical product development or shipping, they’re affordable, fast to create, and can generate passive income for years to come. In this article, we provide you more information about selling courses using WooCommerce.', '{}', 'unactioned', 'woocommerce-admin', '2021-06-21 07:40:50', NULL, 0, 'plain', '', 0, 'info'),
(29, 'wc-admin-learn-more-about-variable-products', 'info', 'en_US', 'Learn more about variable products', 'Variable products are a powerful product type that lets you offer a set of variations on a product, with control over prices, stock, image and more for each variation. They can be used for a product like a shirt, where you can offer a large, medium and small and in different colors.', '{}', 'unactioned', 'woocommerce-admin', '2021-06-29 10:09:30', NULL, 0, 'plain', '', 0, 'info'),
(30, 'wc-admin-test-checkout', 'info', 'en_US', 'Don\'t forget to test your checkout', 'Make sure that your checkout is working properly before you launch your store. Go through your checkout process in its entirety: from adding a product to your cart, choosing a shipping location, and making a payment.', '{}', 'unactioned', 'woocommerce-admin', '2021-06-29 10:25:42', NULL, 0, 'plain', '', 0, 'info'),
(31, 'wc-admin-orders-milestone', 'info', 'en_US', 'First order received', 'Congratulations on getting your first order! Now is a great time to learn how to manage your orders.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:21:37', NULL, 0, 'plain', '', 0, 'info'),
(32, 'wc-admin-mobile-app', 'info', 'en_US', 'Install Woo mobile app', 'Install the WooCommerce mobile app to manage orders, receive sales notifications, and view key metrics — wherever you are.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(33, 'wc-admin-usage-tracking-opt-in', 'info', 'en_US', 'Help WooCommerce improve with usage tracking', 'Gathering usage data allows us to improve WooCommerce. Your store will be considered as we evaluate new features, judge the quality of an update, or determine if an improvement makes sense. You can always visit the <a href=\"http://localhost/wordpress/wp-admin/admin.php?page=wc-settings&#038;tab=advanced&#038;section=woocommerce_com\" target=\"_blank\">Settings</a> and choose to stop sharing data. <a href=\"https://woocommerce.com/usage-tracking\" target=\"_blank\">Read more</a> about what data we collect.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(34, 'wc-admin-marketing-intro', 'info', 'en_US', 'Connect with your audience', 'Grow your customer base and increase your sales with marketing tools built for WooCommerce.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(35, 'wc-admin-insight-first-sale', 'survey', 'en_US', 'Did you know?', 'A WooCommerce powered store needs on average 31 days to get the first sale. You\'re on the right track! Do you find this type of insight useful?', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(36, 'wc-admin-need-some-inspiration', 'info', 'en_US', 'Browse our success stories', 'Learn more about how other entrepreneurs used WooCommerce to build successful businesses.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(37, 'wc-admin-draw-attention', 'info', 'en_US', 'Get noticed: how to draw attention to your online store', 'To get you started, here are seven ways to boost your sales and avoid getting drowned out by similar, mass-produced products competing for the same buyers.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(38, 'wc-admin-choosing-a-theme', 'marketing', 'en_US', 'Choosing a theme?', 'Check out the themes that are compatible with WooCommerce and choose one aligned with your brand and business needs.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(39, 'wc-admin-insight-first-product-and-payment', 'survey', 'en_US', 'Insight', 'More than 80% of new merchants add the first product and have at least one payment method set up during the first week.<br><br>Do you find this type of insight useful?', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(40, 'wc-admin-customizing-product-catalog', 'info', 'en_US', 'How to customize your product catalog', 'You want your product catalog and images to look great and align with your brand. This guide will give you all the tips you need to get your products looking great in your store.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-02 05:22:03', NULL, 0, 'plain', '', 0, 'info'),
(41, 'eu_vat_changes_2021', 'marketing', 'en_US', 'Get your business ready for the new EU tax regulations', 'On July 1, 2021, new taxation rules will come into play when the <a href=\"https://ec.europa.eu/taxation_customs/business/vat/modernising-vat-cross-border-ecommerce_en\">European Union (EU) Value-Added Tax (VAT) eCommerce package</a> takes effect.<br /><br />The new regulations will impact virtually every B2C business involved in cross-border eCommerce trade with the EU.<br /><br />We therefore recommend <a href=\"https://woocommerce.com/posts/new-eu-vat-regulations\">familiarizing yourself with the new updates</a>, and consult with a tax professional to ensure your business is following regulations and best practice.', '{}', 'unactioned', 'woocommerce.com', '2021-07-02 05:22:04', NULL, 0, 'plain', '', 0, 'info'),
(42, 'ppxo-pps-upgrade-paypal-payments-1', 'info', 'en_US', 'Get the latest PayPal extension for WooCommerce', 'Heads up! There\'s a new PayPal on the block!<br /><br />Now is a great time to upgrade to our latest <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal extension</a> to continue to receive support and updates with PayPal.<br /><br />Get access to a full suite of PayPal payment methods, extensive currency and country coverage, and pay later options with the all-new PayPal extension for WooCommerce.', '{}', 'pending', 'woocommerce.com', '2021-07-02 05:22:04', NULL, 0, 'plain', '', 0, 'info'),
(43, 'ppxo-pps-upgrade-paypal-payments-2', 'info', 'en_US', 'Upgrade your PayPal experience!', 'We\'ve developed a whole new <a href=\"https://woocommerce.com/products/woocommerce-paypal-payments/\" target=\"_blank\">PayPal extension for WooCommerce</a> that combines the best features of our many PayPal extensions into just one extension.<br /><br />Get access to a full suite of PayPal payment methods, extensive currency and country coverage, offer subscription and recurring payments, and the new PayPal pay later options.<br /><br />Start using our latest PayPal today to continue to receive support and updates.', '{}', 'pending', 'woocommerce.com', '2021-07-02 05:22:04', NULL, 0, 'plain', '', 0, 'info'),
(44, 'wc-admin-customize-store-with-blocks', 'info', 'en_US', 'Customize your online store with WooCommerce blocks', 'With our blocks, you can select and display products, categories, filters, and more virtually anywhere on your site — no need to use shortcodes or edit lines of code. Learn more about how to use each one of them.', '{}', 'unactioned', 'woocommerce-admin', '2021-07-05 07:40:32', NULL, 0, 'plain', '', 0, 'info');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_admin_note_actions`
--

CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `actioned_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce_action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nonce_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wc_admin_note_actions`
--

INSERT INTO `wp_wc_admin_note_actions` (`action_id`, `note_id`, `name`, `label`, `query`, `status`, `is_primary`, `actioned_text`, `nonce_action`, `nonce_name`) VALUES
(25, 26, 'yes-please', 'Yes please!', 'https://woocommerce.us8.list-manage.com/subscribe/post?u=2c1434dc56f9506bf3c3ecd21&amp;id=13860df971&amp;SIGNUPPAGE=plugin', 'actioned', 0, '', NULL, NULL),
(50, 27, 'connect', 'Connect', '?page=wc-addons&section=helper', 'unactioned', 0, '', NULL, NULL),
(75, 28, 'learn-more', 'Learn more', 'https://woocommerce.com/posts/how-to-sell-online-courses-wordpress/?utm_source=inbox', 'actioned', 1, '', NULL, NULL),
(148, 29, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/variable-product/?utm_source=inbox', 'actioned', 0, '', NULL, NULL),
(173, 30, 'test-checkout', 'Test checkout', 'http://localhost/wordpress/shop/', 'actioned', 0, '', NULL, NULL),
(174, 31, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/managing-orders/?utm_source=inbox', 'actioned', 0, '', NULL, NULL),
(175, 32, 'learn-more', 'Learn more', 'https://woocommerce.com/mobile/', 'actioned', 0, '', NULL, NULL),
(176, 33, 'tracking-opt-in', 'Activate usage tracking', '', 'actioned', 1, '', NULL, NULL),
(177, 34, 'open-marketing-hub', 'Open marketing hub', 'http://localhost/wordpress/wp-admin/admin.php?page=wc-admin&path=/marketing', 'actioned', 0, '', NULL, NULL),
(178, 35, 'affirm-insight-first-sale', 'Yes', '', 'actioned', 0, 'Thanks for your feedback', NULL, NULL),
(179, 35, 'deny-insight-first-sale', 'No', '', 'actioned', 0, 'Thanks for your feedback', NULL, NULL),
(180, 36, 'need-some-inspiration', 'See success stories', 'https://woocommerce.com/success-stories/?utm_source=inbox', 'actioned', 1, '', NULL, NULL),
(181, 37, 'learn-more', 'Learn more', 'https://woocommerce.com/posts/how-to-make-your-online-store-stand-out/?utm_source=inbox', 'actioned', 1, '', NULL, NULL),
(182, 38, 'visit-the-theme-marketplace', 'Visit the theme marketplace', 'https://woocommerce.com/product-category/themes/?utm_source=inbox', 'actioned', 0, '', NULL, NULL),
(183, 39, 'affirm-insight-first-product-and-payment', 'Yes', '', 'actioned', 0, 'Thanks for your feedback', NULL, NULL),
(184, 39, 'affirm-insight-first-product-and-payment', 'No', '', 'actioned', 0, 'Thanks for your feedback', NULL, NULL),
(185, 40, 'day-after-first-product', 'Learn more', 'https://docs.woocommerce.com/document/woocommerce-customizer/?utm_source=inbox', 'actioned', 0, '', NULL, NULL),
(348, 44, 'customize-store-with-blocks', 'Learn more', 'https://woocommerce.com/posts/how-to-customize-your-online-store-with-woocommerce-blocks/?utm_source=inbox', 'actioned', 1, '', NULL, NULL),
(484, 41, 'eu_vat_changes_2021', 'Learn more about the EU tax regulations', 'https://woocommerce.com/posts/new-eu-vat-regulations', 'actioned', 1, '', NULL, NULL),
(485, 1, 'open_wc_paypal_payments_product_page', 'Learn more', 'https://woocommerce.com/products/woocommerce-paypal-payments/', 'actioned', 1, '', NULL, NULL),
(486, 2, 'upgrade_now_facebook_pixel_api', 'Upgrade now', 'plugin-install.php?tab=plugin-information&plugin=&section=changelog', 'actioned', 1, '', NULL, NULL),
(487, 3, 'learn_more_facebook_ec', 'Learn more', 'https://woocommerce.com/products/facebook/', 'unactioned', 1, '', NULL, NULL),
(488, 4, 'set-up-concierge', 'Schedule free session', 'https://wordpress.com/me/concierge', 'actioned', 1, '', NULL, NULL),
(489, 5, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox', 'unactioned', 1, '', NULL, NULL),
(490, 6, 'learn-more-ecomm-unique-shopping-experience', 'Learn more', 'https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox', 'actioned', 1, '', NULL, NULL),
(491, 7, 'watch-the-webinar', 'Watch the webinar', 'https://youtu.be/V_2XtCOyZ7o', 'actioned', 1, '', NULL, NULL),
(492, 8, 'learn-more', 'Learn more', 'https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox', 'actioned', 1, '', NULL, NULL),
(493, 9, 'boost-sales-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-boost-sales', 'actioned', 1, '', NULL, NULL),
(494, 10, 'grow-your-business-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-grow-your-business', 'actioned', 1, '', NULL, NULL),
(495, 11, 'add-apple-pay', 'Add Apple Pay', '/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments', 'actioned', 1, '', NULL, NULL),
(496, 11, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/payments/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay', 'actioned', 1, '', NULL, NULL),
(497, 12, 'boost-sales-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-boost-sales', 'actioned', 1, '', NULL, NULL),
(498, 13, 'grow-your-business-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-grow-your-business', 'actioned', 1, '', NULL, NULL),
(499, 14, 'optimizing-the-checkout-flow', 'Learn more', 'https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox', 'actioned', 1, '', NULL, NULL),
(500, 15, 'learn-more', 'Learn more', 'https://woocommerce.com/posts/first-things-customize-woocommerce/?utm_source=inbox', 'unactioned', 1, '', NULL, NULL),
(501, 16, 'qualitative-feedback-from-new-users', 'Share feedback', 'https://automattic.survey.fm/wc-pay-new', 'actioned', 1, '', NULL, NULL),
(502, 17, 'share-feedback', 'Share feedback', 'http://automattic.survey.fm/paypal-feedback', 'unactioned', 1, '', NULL, NULL),
(503, 18, 'learn-more', 'Learn about Instant Deposits eligibility', 'https://docs.woocommerce.com/document/payments/instant-deposits/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_instant_deposits', 'actioned', 1, '', NULL, NULL),
(504, 19, 'get-started', 'Get started', 'https://woocommerce.com/products/google-listings-and-ads', 'actioned', 1, '', NULL, NULL),
(505, 20, 'update-wc-subscriptions-3-0-15', 'View latest version', 'http://localhost/wordpress/wp-admin/admin.php?page=wc-admin&page=wc-addons&section=helper', 'actioned', 1, '', NULL, NULL),
(506, 21, 'update-wc-core-5-4-0', 'How to update WooCommerce', 'https://docs.woocommerce.com/document/how-to-update-woocommerce/', 'actioned', 1, '', NULL, NULL),
(507, 24, 'get-woo-commerce-payments', 'Get WooCommerce Payments', 'admin.php?page=wc-admin&action=setup-woocommerce-payments', 'actioned', 1, '', NULL, NULL),
(508, 25, 'get-woocommerce-payments', 'Get WooCommerce Payments', 'admin.php?page=wc-admin&action=setup-woocommerce-payments', 'actioned', 1, '', NULL, NULL),
(509, 42, 'ppxo-pps-install-paypal-payments-1', 'View upgrade guide', 'https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/', 'actioned', 1, '', NULL, NULL),
(510, 43, 'ppxo-pps-install-paypal-payments-2', 'View upgrade guide', 'https://docs.woocommerce.com/document/woocommerce-paypal-payments/paypal-payments-upgrade-guide/', 'actioned', 1, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_category_lookup`
--

CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wc_category_lookup`
--

INSERT INTO `wp_wc_category_lookup` (`category_tree_id`, `category_id`) VALUES
(17, 17);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_customer_lookup`
--

CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wc_customer_lookup`
--

INSERT INTO `wp_wc_customer_lookup` (`customer_id`, `user_id`, `username`, `first_name`, `last_name`, `email`, `date_last_active`, `date_registered`, `country`, `postcode`, `city`, `state`) VALUES
(1, 1, 'admin', 'rakesh', 'raju', 'admin@gmail.com', '2021-07-08 18:30:00', '2021-06-21 00:56:19', 'IN', '683520', 'gergreg', 'KL');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_download_log`
--

CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_coupon_lookup`
--

CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_product_lookup`
--

CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT 0,
  `product_gross_revenue` double NOT NULL DEFAULT 0,
  `coupon_amount` double NOT NULL DEFAULT 0,
  `tax_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double NOT NULL DEFAULT 0,
  `shipping_tax_amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wc_order_product_lookup`
--

INSERT INTO `wp_wc_order_product_lookup` (`order_item_id`, `order_id`, `product_id`, `variation_id`, `customer_id`, `date_created`, `product_qty`, `product_net_revenue`, `product_gross_revenue`, `coupon_amount`, `tax_amount`, `shipping_amount`, `shipping_tax_amount`) VALUES
(1, 47, 46, 0, 1, '2021-06-29 10:13:53', 47, 1410, 1410, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_stats`
--

CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT 0,
  `total_sales` double NOT NULL DEFAULT 0,
  `tax_total` double NOT NULL DEFAULT 0,
  `shipping_total` double NOT NULL DEFAULT 0,
  `net_total` double NOT NULL DEFAULT 0,
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wc_order_stats`
--

INSERT INTO `wp_wc_order_stats` (`order_id`, `parent_id`, `date_created`, `date_created_gmt`, `num_items_sold`, `total_sales`, `tax_total`, `shipping_total`, `net_total`, `returning_customer`, `status`, `customer_id`) VALUES
(47, 0, '2021-06-29 10:13:53', '2021-06-29 10:13:53', 47, 1410, 0, 0, 1410, 0, 'wc-cancelled', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_tax_lookup`
--

CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT 0,
  `order_tax` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_product_meta_lookup`
--

CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0,
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wc_product_meta_lookup`
--

INSERT INTO `wp_wc_product_meta_lookup` (`product_id`, `sku`, `virtual`, `downloadable`, `min_price`, `max_price`, `onsale`, `stock_quantity`, `stock_status`, `rating_count`, `average_rating`, `total_sales`, `tax_status`, `tax_class`) VALUES
(46, '', 1, 0, '30.0000', '30.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_reserved_stock`
--

CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_tax_rate_classes`
--

CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_wc_tax_rate_classes`
--

INSERT INTO `wp_wc_tax_rate_classes` (`tax_rate_class_id`, `name`, `slug`) VALUES
(1, 'Reduced rate', 'reduced-rate'),
(2, 'Zero rate', 'zero-rate');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_webhooks`
--

CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_api_keys`
--

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_log`
--

CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_order_itemmeta`
--

INSERT INTO `wp_woocommerce_order_itemmeta` (`meta_id`, `order_item_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_product_id', '46'),
(2, 1, '_variation_id', '0'),
(3, 1, '_qty', '47'),
(4, 1, '_tax_class', ''),
(5, 1, '_line_subtotal', '1410'),
(6, 1, '_line_subtotal_tax', '0'),
(7, 1, '_line_total', '1410'),
(8, 1, '_line_tax', '0'),
(9, 1, '_line_tax_data', 'a:2:{s:5:\"total\";a:0:{}s:8:\"subtotal\";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_order_items`
--

INSERT INTO `wp_woocommerce_order_items` (`order_item_id`, `order_item_name`, `order_item_type`, `order_id`) VALUES
(1, 'osce', 'line_item', 47);

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_sessions`
--

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_sessions`
--

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(22, '1', 'a:7:{s:4:\"cart\";s:415:\"a:1:{s:32:\"d9d4f495e875a2e075a1a4a6e1b9770f\";a:11:{s:3:\"key\";s:32:\"d9d4f495e875a2e075a1a4a6e1b9770f\";s:10:\"product_id\";i:46;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:47;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:1410;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:1410;s:8:\"line_tax\";i:0;}}\";s:11:\"cart_totals\";s:396:\"a:15:{s:8:\"subtotal\";s:4:\"1410\";s:12:\"subtotal_tax\";i:0;s:14:\"shipping_total\";s:1:\"0\";s:12:\"shipping_tax\";i:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";i:0;s:12:\"discount_tax\";i:0;s:19:\"cart_contents_total\";s:4:\"1410\";s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";s:1:\"0\";s:7:\"fee_tax\";i:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";s:4:\"1410\";s:9:\"total_tax\";d:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:795:\"a:26:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:25:\"2021-06-29T10:26:45+00:00\";s:8:\"postcode\";s:6:\"683520\";s:4:\"city\";s:7:\"gergreg\";s:9:\"address_1\";s:9:\"rgfrewgfr\";s:7:\"address\";s:9:\"rgfrewgfr\";s:9:\"address_2\";s:7:\"gregerg\";s:5:\"state\";s:2:\"KL\";s:7:\"country\";s:2:\"IN\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:2:\"KL\";s:16:\"shipping_country\";s:2:\"IN\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:6:\"rakesh\";s:9:\"last_name\";s:4:\"raju\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:13:\"6456546546546\";s:5:\"email\";s:15:\"admin@gmail.com\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";}', 1625812179);

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users_provider` (`id_users_provider`),
  ADD KEY `id_users_customer` (`id_users_customer`),
  ADD KEY `id_services` (`id_services`);

--
-- Indexes for table `ea_consents`
--
ALTER TABLE `ea_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_roles`
--
ALTER TABLE `ea_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  ADD KEY `secretaries_users_provider` (`id_users_provider`);

--
-- Indexes for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_categories` (`id_service_categories`);

--
-- Indexes for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD PRIMARY KEY (`id_users`,`id_services`),
  ADD KEY `services_providers_services` (`id_services`);

--
-- Indexes for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_settings`
--
ALTER TABLE `ea_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indexes for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Indexes for table `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Indexes for table `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Indexes for table `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Indexes for table `wp_bookly_appointments`
--
ALTER TABLE `wp_bookly_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `wp_bookly_categories`
--
ALTER TABLE `wp_bookly_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_customers`
--
ALTER TABLE `wp_bookly_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_customer_appointments`
--
ALTER TABLE `wp_bookly_customer_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `series_id` (`series_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `wp_bookly_holidays`
--
ALTER TABLE `wp_bookly_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `wp_bookly_log`
--
ALTER TABLE `wp_bookly_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_messages`
--
ALTER TABLE `wp_bookly_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_notifications`
--
ALTER TABLE `wp_bookly_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_payments`
--
ALTER TABLE `wp_bookly_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_schedule_item_breaks`
--
ALTER TABLE `wp_bookly_schedule_item_breaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_schedule_item_id` (`staff_schedule_item_id`);

--
-- Indexes for table `wp_bookly_sent_notifications`
--
ALTER TABLE `wp_bookly_sent_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id_idx` (`ref_id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `wp_bookly_series`
--
ALTER TABLE `wp_bookly_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_services`
--
ALTER TABLE `wp_bookly_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `wp_bookly_shop`
--
ALTER TABLE `wp_bookly_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_staff`
--
ALTER TABLE `wp_bookly_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_staff_schedule_items`
--
ALTER TABLE `wp_bookly_staff_schedule_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids_idx` (`staff_id`,`day_index`,`location_id`);

--
-- Indexes for table `wp_bookly_staff_services`
--
ALTER TABLE `wp_bookly_staff_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids_idx` (`staff_id`,`service_id`,`location_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `wp_bookly_stats`
--
ALTER TABLE `wp_bookly_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_bookly_sub_services`
--
ALTER TABLE `wp_bookly_sub_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `sub_service_id` (`sub_service_id`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indexes for table `wp_ea_appointments`
--
ALTER TABLE `wp_ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_location` (`location`),
  ADD KEY `appointments_service` (`service`),
  ADD KEY `appointments_worker` (`worker`);

--
-- Indexes for table `wp_ea_connections`
--
ALTER TABLE `wp_ea_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_to_connection` (`location`),
  ADD KEY `service_to_location` (`service`),
  ADD KEY `worker_to_connection` (`worker`);

--
-- Indexes for table `wp_ea_error_logs`
--
ALTER TABLE `wp_ea_error_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_ea_fields`
--
ALTER TABLE `wp_ea_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_ea_locations`
--
ALTER TABLE `wp_ea_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_ea_meta_fields`
--
ALTER TABLE `wp_ea_meta_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_ea_options`
--
ALTER TABLE `wp_ea_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_ea_services`
--
ALTER TABLE `wp_ea_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_ea_staff`
--
ALTER TABLE `wp_ea_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_latepoint_activities`
--
ALTER TABLE `wp_latepoint_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_latepoint_agents`
--
ALTER TABLE `wp_latepoint_agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_index` (`email`);

--
-- Indexes for table `wp_latepoint_agents_services`
--
ALTER TABLE `wp_latepoint_agents_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id_index` (`agent_id`),
  ADD KEY `service_id_index` (`service_id`),
  ADD KEY `location_id_index` (`location_id`);

--
-- Indexes for table `wp_latepoint_agent_meta`
--
ALTER TABLE `wp_latepoint_agent_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_key_index` (`meta_key`),
  ADD KEY `object_id_index` (`object_id`);

--
-- Indexes for table `wp_latepoint_bookings`
--
ALTER TABLE `wp_latepoint_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `start_date_index` (`start_date`),
  ADD KEY `end_date_index` (`end_date`),
  ADD KEY `status_index` (`status`),
  ADD KEY `customer_id_index` (`customer_id`),
  ADD KEY `service_id_index` (`service_id`),
  ADD KEY `agent_id_index` (`agent_id`),
  ADD KEY `location_id_index` (`location_id`);

--
-- Indexes for table `wp_latepoint_booking_meta`
--
ALTER TABLE `wp_latepoint_booking_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_key_index` (`meta_key`),
  ADD KEY `object_id_index` (`object_id`);

--
-- Indexes for table `wp_latepoint_customers`
--
ALTER TABLE `wp_latepoint_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_index` (`email`),
  ADD KEY `status_index` (`status`),
  ADD KEY `wordpress_user_id_index` (`wordpress_user_id`);

--
-- Indexes for table `wp_latepoint_customer_meta`
--
ALTER TABLE `wp_latepoint_customer_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_key_index` (`meta_key`),
  ADD KEY `object_id_index` (`object_id`);

--
-- Indexes for table `wp_latepoint_custom_prices`
--
ALTER TABLE `wp_latepoint_custom_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id_index` (`agent_id`),
  ADD KEY `service_id_index` (`service_id`),
  ADD KEY `location_id_index` (`location_id`);

--
-- Indexes for table `wp_latepoint_locations`
--
ALTER TABLE `wp_latepoint_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_index` (`status`);

--
-- Indexes for table `wp_latepoint_sent_reminders`
--
ALTER TABLE `wp_latepoint_sent_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id_index` (`booking_id`),
  ADD KEY `reminder_id_index` (`reminder_id`);

--
-- Indexes for table `wp_latepoint_services`
--
ALTER TABLE `wp_latepoint_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id_index` (`category_id`),
  ADD KEY `order_number_index` (`order_number`),
  ADD KEY `status_index` (`status`);

--
-- Indexes for table `wp_latepoint_service_categories`
--
ALTER TABLE `wp_latepoint_service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_number_index` (`order_number`),
  ADD KEY `parent_id_index` (`parent_id`);

--
-- Indexes for table `wp_latepoint_service_meta`
--
ALTER TABLE `wp_latepoint_service_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_key_index` (`meta_key`),
  ADD KEY `object_id_index` (`object_id`);

--
-- Indexes for table `wp_latepoint_sessions`
--
ALTER TABLE `wp_latepoint_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_key` (`session_key`);

--
-- Indexes for table `wp_latepoint_settings`
--
ALTER TABLE `wp_latepoint_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_index` (`name`);

--
-- Indexes for table `wp_latepoint_step_settings`
--
ALTER TABLE `wp_latepoint_step_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `step_index` (`step`),
  ADD KEY `label_index` (`label`);

--
-- Indexes for table `wp_latepoint_transactions`
--
ALTER TABLE `wp_latepoint_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_latepoint_work_periods`
--
ALTER TABLE `wp_latepoint_work_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id_index` (`agent_id`),
  ADD KEY `service_id_index` (`service_id`),
  ADD KEY `location_id_index` (`location_id`),
  ADD KEY `week_day_index` (`week_day`),
  ADD KEY `custom_date_index` (`custom_date`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `wp_wc_admin_notes`
--
ALTER TABLE `wp_wc_admin_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `wp_wc_admin_note_actions`
--
ALTER TABLE `wp_wc_admin_note_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `note_id` (`note_id`);

--
-- Indexes for table `wp_wc_category_lookup`
--
ALTER TABLE `wp_wc_category_lookup`
  ADD PRIMARY KEY (`category_tree_id`,`category_id`);

--
-- Indexes for table `wp_wc_customer_lookup`
--
ALTER TABLE `wp_wc_customer_lookup`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `wp_wc_order_coupon_lookup`
--
ALTER TABLE `wp_wc_order_coupon_lookup`
  ADD PRIMARY KEY (`order_id`,`coupon_id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indexes for table `wp_wc_order_product_lookup`
--
ALTER TABLE `wp_wc_order_product_lookup`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indexes for table `wp_wc_order_stats`
--
ALTER TABLE `wp_wc_order_stats`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `date_created` (`date_created`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status` (`status`(191));

--
-- Indexes for table `wp_wc_order_tax_lookup`
--
ALTER TABLE `wp_wc_order_tax_lookup`
  ADD PRIMARY KEY (`order_id`,`tax_rate_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indexes for table `wp_wc_product_meta_lookup`
--
ALTER TABLE `wp_wc_product_meta_lookup`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `virtual` (`virtual`),
  ADD KEY `downloadable` (`downloadable`),
  ADD KEY `stock_status` (`stock_status`),
  ADD KEY `stock_quantity` (`stock_quantity`),
  ADD KEY `onsale` (`onsale`),
  ADD KEY `min_max_price` (`min_price`,`max_price`);

--
-- Indexes for table `wp_wc_reserved_stock`
--
ALTER TABLE `wp_wc_reserved_stock`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `wp_wc_tax_rate_classes`
--
ALTER TABLE `wp_wc_tax_rate_classes`
  ADD PRIMARY KEY (`tax_rate_class_id`),
  ADD UNIQUE KEY `slug` (`slug`(191));

--
-- Indexes for table `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indexes for table `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(20));

--
-- Indexes for table `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`);

--
-- Indexes for table `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_key` (`session_key`);

--
-- Indexes for table `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Indexes for table `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(2)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(10)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indexes for table `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ea_consents`
--
ALTER TABLE `ea_consents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_roles`
--
ALTER TABLE `ea_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_services`
--
ALTER TABLE `ea_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_settings`
--
ALTER TABLE `ea_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ea_users`
--
ALTER TABLE `ea_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=932;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `wp_bookly_appointments`
--
ALTER TABLE `wp_bookly_appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_categories`
--
ALTER TABLE `wp_bookly_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_bookly_customers`
--
ALTER TABLE `wp_bookly_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_customer_appointments`
--
ALTER TABLE `wp_bookly_customer_appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_holidays`
--
ALTER TABLE `wp_bookly_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wp_bookly_log`
--
ALTER TABLE `wp_bookly_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_messages`
--
ALTER TABLE `wp_bookly_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_notifications`
--
ALTER TABLE `wp_bookly_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `wp_bookly_payments`
--
ALTER TABLE `wp_bookly_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_schedule_item_breaks`
--
ALTER TABLE `wp_bookly_schedule_item_breaks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_sent_notifications`
--
ALTER TABLE `wp_bookly_sent_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_series`
--
ALTER TABLE `wp_bookly_series`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_services`
--
ALTER TABLE `wp_bookly_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_bookly_shop`
--
ALTER TABLE `wp_bookly_shop`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `wp_bookly_staff`
--
ALTER TABLE `wp_bookly_staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_bookly_staff_schedule_items`
--
ALTER TABLE `wp_bookly_staff_schedule_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wp_bookly_staff_services`
--
ALTER TABLE `wp_bookly_staff_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_stats`
--
ALTER TABLE `wp_bookly_stats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_bookly_sub_services`
--
ALTER TABLE `wp_bookly_sub_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_ea_appointments`
--
ALTER TABLE `wp_ea_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_ea_connections`
--
ALTER TABLE `wp_ea_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_ea_error_logs`
--
ALTER TABLE `wp_ea_error_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_ea_fields`
--
ALTER TABLE `wp_ea_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_ea_locations`
--
ALTER TABLE `wp_ea_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_ea_meta_fields`
--
ALTER TABLE `wp_ea_meta_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wp_ea_options`
--
ALTER TABLE `wp_ea_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `wp_ea_services`
--
ALTER TABLE `wp_ea_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_ea_staff`
--
ALTER TABLE `wp_ea_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_latepoint_activities`
--
ALTER TABLE `wp_latepoint_activities`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `wp_latepoint_agents`
--
ALTER TABLE `wp_latepoint_agents`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_latepoint_agents_services`
--
ALTER TABLE `wp_latepoint_agents_services`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wp_latepoint_agent_meta`
--
ALTER TABLE `wp_latepoint_agent_meta`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_latepoint_bookings`
--
ALTER TABLE `wp_latepoint_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `wp_latepoint_booking_meta`
--
ALTER TABLE `wp_latepoint_booking_meta`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_latepoint_customers`
--
ALTER TABLE `wp_latepoint_customers`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_latepoint_customer_meta`
--
ALTER TABLE `wp_latepoint_customer_meta`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_latepoint_custom_prices`
--
ALTER TABLE `wp_latepoint_custom_prices`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_latepoint_locations`
--
ALTER TABLE `wp_latepoint_locations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_latepoint_sent_reminders`
--
ALTER TABLE `wp_latepoint_sent_reminders`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_latepoint_services`
--
ALTER TABLE `wp_latepoint_services`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_latepoint_service_categories`
--
ALTER TABLE `wp_latepoint_service_categories`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_latepoint_service_meta`
--
ALTER TABLE `wp_latepoint_service_meta`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_latepoint_sessions`
--
ALTER TABLE `wp_latepoint_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_latepoint_settings`
--
ALTER TABLE `wp_latepoint_settings`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `wp_latepoint_step_settings`
--
ALTER TABLE `wp_latepoint_step_settings`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `wp_latepoint_transactions`
--
ALTER TABLE `wp_latepoint_transactions`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_latepoint_work_periods`
--
ALTER TABLE `wp_latepoint_work_periods`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2398;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wp_wc_admin_notes`
--
ALTER TABLE `wp_wc_admin_notes`
  MODIFY `note_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `wp_wc_admin_note_actions`
--
ALTER TABLE `wp_wc_admin_note_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;

--
-- AUTO_INCREMENT for table `wp_wc_customer_lookup`
--
ALTER TABLE `wp_wc_customer_lookup`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_wc_tax_rate_classes`
--
ALTER TABLE `wp_wc_tax_rate_classes`
  MODIFY `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_appointments`
--
ALTER TABLE `wp_bookly_appointments`
  ADD CONSTRAINT `wp_bookly_appointments_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_bookly_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_appointments_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_bookly_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_customer_appointments`
--
ALTER TABLE `wp_bookly_customer_appointments`
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `wp_bookly_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `wp_bookly_appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_3` FOREIGN KEY (`series_id`) REFERENCES `wp_bookly_series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_customer_appointments_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `wp_bookly_payments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_holidays`
--
ALTER TABLE `wp_bookly_holidays`
  ADD CONSTRAINT `wp_bookly_holidays_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_bookly_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_schedule_item_breaks`
--
ALTER TABLE `wp_bookly_schedule_item_breaks`
  ADD CONSTRAINT `wp_bookly_schedule_item_breaks_ibfk_1` FOREIGN KEY (`staff_schedule_item_id`) REFERENCES `wp_bookly_staff_schedule_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_sent_notifications`
--
ALTER TABLE `wp_bookly_sent_notifications`
  ADD CONSTRAINT `wp_bookly_sent_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `wp_bookly_notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_services`
--
ALTER TABLE `wp_bookly_services`
  ADD CONSTRAINT `wp_bookly_services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `wp_bookly_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_staff_schedule_items`
--
ALTER TABLE `wp_bookly_staff_schedule_items`
  ADD CONSTRAINT `wp_bookly_staff_schedule_items_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_bookly_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_staff_services`
--
ALTER TABLE `wp_bookly_staff_services`
  ADD CONSTRAINT `wp_bookly_staff_services_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_bookly_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_staff_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_bookly_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_bookly_sub_services`
--
ALTER TABLE `wp_bookly_sub_services`
  ADD CONSTRAINT `wp_bookly_sub_services_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `wp_bookly_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_bookly_sub_services_ibfk_2` FOREIGN KEY (`sub_service_id`) REFERENCES `wp_bookly_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_ea_appointments`
--
ALTER TABLE `wp_ea_appointments`
  ADD CONSTRAINT `wp_ea_appointments_ibfk_1` FOREIGN KEY (`location`) REFERENCES `wp_ea_locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wp_ea_appointments_ibfk_2` FOREIGN KEY (`service`) REFERENCES `wp_ea_services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wp_ea_appointments_ibfk_3` FOREIGN KEY (`worker`) REFERENCES `wp_ea_staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wp_ea_connections`
--
ALTER TABLE `wp_ea_connections`
  ADD CONSTRAINT `wp_ea_connections_ibfk_1` FOREIGN KEY (`location`) REFERENCES `wp_ea_locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wp_ea_connections_ibfk_2` FOREIGN KEY (`service`) REFERENCES `wp_ea_services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wp_ea_connections_ibfk_3` FOREIGN KEY (`worker`) REFERENCES `wp_ea_staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  ADD CONSTRAINT `fk_wp_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `wp_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
