-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2021 at 06:56 AM
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

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
