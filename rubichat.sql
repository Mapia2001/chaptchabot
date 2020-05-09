-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2020 at 07:57 AM
-- Server version: 10.3.17-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `rubichat`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`` PROCEDURE `sp_dlr_report` (`ptrack_id` INT)  READS SQL DATA
BEGIN

-- Example track_id 100177552
-- CALL innov8sms.sp_dlr_report(100000174);

DECLARE track_id INT;

SET track_id=ptrack_id;

DROP TEMPORARY TABLE IF EXISTS tempDlrData;

CREATE TEMPORARY TABLE tempDlrData
(
 id INT auto_increment
 ,mobile bigint(20)
 ,dlr varchar(300)
 ,message_id varchar(20)
 ,primary key(id)
);

INSERT INTO tempDlrData (mobile,dlr,message_id)
select 
`s`.`mobile`
, `d`.`dlr`
, `s`.`message_id` 
from `sent_numbers` `s` left join `dlr` as `d` on `s`.`message_id` = `d`.`message_id`
Where `s`.`track_id` = track_id;

SELECT mobile,dlr,message_id from tempDlrData;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `access_logs`
--

CREATE TABLE `access_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(50) NOT NULL,
  `request_time` varchar(50) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `api` varchar(3000) NOT NULL,
  `status_code` smallint(5) UNSIGNED NOT NULL,
  `update_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 if not updated to sent logs, 1 if updated to sent logs'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `mobile` bigint(20) UNSIGNED NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `dynamic1` varchar(50) DEFAULT NULL,
  `dynamic2` varchar(50) DEFAULT NULL,
  `dynamic3` varchar(50) DEFAULT NULL,
  `dynamic4` varchar(50) DEFAULT NULL,
  `dynamic5` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coverage_list`
--

CREATE TABLE `coverage_list` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `mccmnc` varchar(10) NOT NULL,
  `mcc` varchar(10) NOT NULL,
  `mnc` varchar(10) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `country_code` int(11) NOT NULL,
  `network_code` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  `ISO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `credit_transactions`
--

CREATE TABLE `credit_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL,
  `user_id_to` int(10) UNSIGNED NOT NULL,
  `credits` int(11) NOT NULL,
  `transaction_type` tinyint(3) UNSIGNED NOT NULL,
  `is_postpaid` tinyint(3) UNSIGNED NOT NULL,
  `comment` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlr`
--

CREATE TABLE `dlr` (
  `message_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `dlr` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `smsc_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Mobile_Sync_Details`
--

CREATE TABLE `Mobile_Sync_Details` (
  `id` int(11) NOT NULL,
  `Service_id` varchar(20) NOT NULL,
  `Product_id` varchar(20) NOT NULL,
  `Subscriber_id` varchar(20) NOT NULL,
  `Type` varchar(1) NOT NULL,
  `ServiceList` varchar(20) NOT NULL,
  `Update_type` varchar(2) NOT NULL,
  `Update_time` datetime NOT NULL,
  `Update_desc` text NOT NULL,
  `effective_time` datetime NOT NULL,
  `expiry_time` datetime NOT NULL,
  `Access_code` varchar(10) NOT NULL,
  `Oper_code` varchar(10) NOT NULL,
  `Charge_Mode` int(11) NOT NULL,
  `DSPSUBEXPMODE` int(11) NOT NULL,
  `Object_type` int(11) NOT NULL,
  `Start_time` datetime NOT NULL,
  `isFreePeriod` tinyint(1) NOT NULL DEFAULT 0,
  `Operator_ID` varchar(10) NOT NULL,
  `Pay_Type` int(11) NOT NULL,
  `Transaction_id` varchar(50) NOT NULL,
  `Order_key` varchar(20) NOT NULL,
  `keyword` varchar(20) NOT NULL,
  `cycle_end_time` datetime NOT NULL,
  `DurationOfGracePeriod` int(11) NOT NULL,
  `Service_availability` int(11) NOT NULL,
  `duration_of_suspend_period` int(11) NOT NULL,
  `Fee` double NOT NULL,
  `Service_pay_type` int(11) NOT NULL,
  `Channel_id` int(11) NOT NULL,
  `Trace_unique_id` varchar(30) NOT NULL,
  `rent_success` int(11) NOT NULL,
  `try` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `premuim_delivery_reports_tb`
--

CREATE TABLE `premuim_delivery_reports_tb` (
  `id` int(12) NOT NULL,
  `upload_refid` text NOT NULL,
  `upload_file` text NOT NULL,
  `date_upload` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(12) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `route_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `sqlbox_tablename` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `smsc_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `sender_prefix` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `description` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_data`
--

CREATE TABLE `scheduled_data` (
  `scheduled_id` int(11) NOT NULL,
  `track_id` bigint(20) UNSIGNED NOT NULL,
  `time_to_process` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sent_numbers`
--

CREATE TABLE `sent_numbers` (
  `message_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `track_id` bigint(20) UNSIGNED NOT NULL,
  `mobile` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sent_numbers_dynamic`
--

CREATE TABLE `sent_numbers_dynamic` (
  `message_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `track_id` bigint(20) UNSIGNED NOT NULL,
  `mobile` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `sms_length` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sent_numbers_temp`
--

CREATE TABLE `sent_numbers_temp` (
  `message_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `track_id` bigint(20) UNSIGNED NOT NULL,
  `mobile` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sent_numbers_temp_dynamic`
--

CREATE TABLE `sent_numbers_temp_dynamic` (
  `message_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `track_id` bigint(20) UNSIGNED NOT NULL,
  `mobile` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `sms_length` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sent_routes`
--

CREATE TABLE `sent_routes` (
  `message_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `route_id` smallint(5) UNSIGNED NOT NULL,
  `smsc` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `send_table` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sent_tracks`
--

CREATE TABLE `sent_tracks` (
  `track_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `sender` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sender_prefix` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `route_id` smallint(5) UNSIGNED NOT NULL,
  `total_count` mediumint(8) UNSIGNED NOT NULL,
  `is_spam_checked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_spam` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_scheduled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '*0 - not scheduled, *1 - scheduled, waiting to process, *2 - scheduled, processed, *3 - scheduled cancelled',
  `is_processed` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sms_length` smallint(6) NOT NULL DEFAULT 1,
  `credits_deducted` mediumint(9) NOT NULL DEFAULT 0,
  `sent_type` tinyint(3) UNSIGNED NOT NULL,
  `is_unicode` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sent_types`
--

CREATE TABLE `sent_types` (
  `sent_type_id` smallint(6) NOT NULL,
  `sent_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_temp_tb`
--

CREATE TABLE `sms_temp_tb` (
  `id` int(12) NOT NULL,
  `misidn` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `added_by` int(12) NOT NULL,
  `status` text NOT NULL,
  `upload_name` text NOT NULL,
  `message` text NOT NULL,
  `sender_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `api_password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `route_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `main_login_failed` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `api_login_failed` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_api` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 -> OFF,1 -> ON',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_tb`
--

CREATE TABLE `users_tb` (
  `id` int(12) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` text NOT NULL,
  `contact_no` text NOT NULL,
  `date_registration` text NOT NULL,
  `user_type` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_credits`
--

CREATE TABLE `user_credits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `credits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `threshold` int(10) NOT NULL,
  `smpp_credits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `user_type_id` smallint(6) NOT NULL,
  `user_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_logs`
--
ALTER TABLE `access_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_cod` (`status_code`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `group_id_index` (`group_id`);

--
-- Indexes for table `coverage_list`
--
ALTER TABLE `coverage_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_transactions`
--
ALTER TABLE `credit_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_transactions_user_id_from_index` (`user_id_from`),
  ADD KEY `credit_transactions_user_id_to_index` (`user_id_to`);

--
-- Indexes for table `dlr`
--
ALTER TABLE `dlr`
  ADD KEY `dlr_message_id_index` (`message_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `groupname_user_id` (`user_id`,`group_name`);

--
-- Indexes for table `Mobile_Sync_Details`
--
ALTER TABLE `Mobile_Sync_Details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `premuim_delivery_reports_tb`
--
ALTER TABLE `premuim_delivery_reports_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `scheduled_data`
--
ALTER TABLE `scheduled_data`
  ADD PRIMARY KEY (`scheduled_id`),
  ADD UNIQUE KEY `track_id_unique` (`track_id`),
  ADD KEY `time_to_process_index` (`time_to_process`);

--
-- Indexes for table `sent_numbers`
--
ALTER TABLE `sent_numbers`
  ADD UNIQUE KEY `sent_numbers_message_id_unique` (`message_id`),
  ADD KEY `sent_numbers_track_id_index` (`track_id`);

--
-- Indexes for table `sent_numbers_dynamic`
--
ALTER TABLE `sent_numbers_dynamic`
  ADD UNIQUE KEY `sent_numbers_dynamic_message_id_unique` (`message_id`),
  ADD KEY `sent_numbers_dynamic_track_id_index` (`track_id`);

--
-- Indexes for table `sent_numbers_temp`
--
ALTER TABLE `sent_numbers_temp`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sent_numbers_temp_track_id_index` (`track_id`);

--
-- Indexes for table `sent_numbers_temp_dynamic`
--
ALTER TABLE `sent_numbers_temp_dynamic`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sent_numbers_temp_dynamic_track_id_index` (`track_id`);

--
-- Indexes for table `sent_routes`
--
ALTER TABLE `sent_routes`
  ADD UNIQUE KEY `sent_routes_message_id_unique` (`message_id`);

--
-- Indexes for table `sent_tracks`
--
ALTER TABLE `sent_tracks`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `sent_tracks_user_id_index` (`user_id`),
  ADD KEY `sent_track_index` (`created_at`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `sent_types`
--
ALTER TABLE `sent_types`
  ADD UNIQUE KEY `sent_types_sent_type_id_unique` (`sent_type_id`);

--
-- Indexes for table `sms_temp_tb`
--
ALTER TABLE `sms_temp_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_tb`
--
ALTER TABLE `users_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_credits`
--
ALTER TABLE `user_credits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`user_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD UNIQUE KEY `user_types_user_type_id_unique` (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_logs`
--
ALTER TABLE `access_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT for table `coverage_list`
--
ALTER TABLE `coverage_list`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2096;

--
-- AUTO_INCREMENT for table `credit_transactions`
--
ALTER TABLE `credit_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=613;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Mobile_Sync_Details`
--
ALTER TABLE `Mobile_Sync_Details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `premuim_delivery_reports_tb`
--
ALTER TABLE `premuim_delivery_reports_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `scheduled_data`
--
ALTER TABLE `scheduled_data`
  MODIFY `scheduled_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sent_tracks`
--
ALTER TABLE `sent_tracks`
  MODIFY `track_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183636;

--
-- AUTO_INCREMENT for table `sms_temp_tb`
--
ALTER TABLE `sms_temp_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users_tb`
--
ALTER TABLE `users_tb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_credits`
--
ALTER TABLE `user_credits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `user_type_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;


