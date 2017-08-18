/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost
 Source Database       : admin_mybrooks

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 08/18/2017 20:01:30 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `ApplicationLog`
-- ----------------------------
DROP TABLE IF EXISTS `ApplicationLog`;
CREATE TABLE `ApplicationLog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `EquipmentLog`
-- ----------------------------
DROP TABLE IF EXISTS `EquipmentLog`;
CREATE TABLE `EquipmentLog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `EquipmentLog`
-- ----------------------------
BEGIN;
INSERT INTO `EquipmentLog` VALUES ('4', 'test2', '2017-08-19 02:00:58', '2017-08-19 02:00:58');
COMMIT;

-- ----------------------------
--  Table structure for `JobInfo`
-- ----------------------------
DROP TABLE IF EXISTS `JobInfo`;
CREATE TABLE `JobInfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Date` varchar(255) DEFAULT NULL,
  `Grower` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `FarmName` varchar(255) DEFAULT NULL,
  `FieldName` varchar(255) DEFAULT NULL,
  `AppType` varchar(255) DEFAULT NULL,
  `EquipID` varchar(255) DEFAULT NULL,
  `Acres` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `JobInfo`
-- ----------------------------
BEGIN;
INSERT INTO `JobInfo` VALUES ('1', 'Date', 'Grower', '2017-08-16 23:49:36', '2017-08-16 23:49:36', 'FarmName', 'FieldName', 'AppType', '0', 'Acres'), ('2', 'Date', 'Grower', '2017-08-16 23:49:55', '2017-08-16 23:49:55', 'FarmName', 'FieldName', 'AppType', '0', 'Acres'), ('3', 'Xd', 'Sdf', '2017-08-17 00:08:03', '2017-08-17 00:08:03', 'Sd', 'Dfdsf', 'Sdf', 'Hhh', '');
COMMIT;

-- ----------------------------
--  Table structure for `LoginInfo`
-- ----------------------------
DROP TABLE IF EXISTS `LoginInfo`;
CREATE TABLE `LoginInfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `LoginInfo`
-- ----------------------------
BEGIN;
INSERT INTO `LoginInfo` VALUES ('12', 'Ttes', 'test', '2017-08-17 00:07:24', '2017-08-17 00:07:24');
COMMIT;

-- ----------------------------
--  Table structure for `TaskReminder`
-- ----------------------------
DROP TABLE IF EXISTS `TaskReminder`;
CREATE TABLE `TaskReminder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `TaskReminder`
-- ----------------------------
BEGIN;
INSERT INTO `TaskReminder` VALUES ('3', 'test2', '2017-08-19 02:01:01', '2017-08-19 02:01:01');
COMMIT;

-- ----------------------------
--  Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `role_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`admin_id`),
  KEY `admin_role_admin_id_foreign` (`admin_id`),
  CONSTRAINT `admin_role_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `admin_role`
-- ----------------------------
BEGIN;
INSERT INTO `admin_role` VALUES ('1', '1'), ('2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  KEY `admins_activation_code_index` (`activation_code`),
  KEY `admins_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `admins`
-- ----------------------------
BEGIN;
INSERT INTO `admins` VALUES ('1', 'admin@aladdin.com', '$2y$10$5vHfImCBrtCTazXpvAGo0eNE1jlUhnUpK5THelX9yJPIlvnIFkFFO', 'QhlnxjNxIIMbKtouOAWiOtH0BWo22YFOlCP9iIuCPSpVNYgBtPR6jlWQvE0m', '0', '', '2016-07-05 14:46:39', '2016-07-22 21:25:28', null, null, 'NxibusYBkIMw8UauPyfstcLWA4Pi88J5NGYxjG9kxC0aluKGAMt3HlZxmRHp', 'Admin', null, '2017-08-16 03:10:04'), ('2', 'reviewer@aladdin.com', '$2y$10$5vHfImCBrtCTazXpvAGo0eNE1jlUhnUpK5THelX9yJPIlvnIFkFFO', 'cz17Bw1mfH9hHtXZAFKAJQVmnhBz6fIaaOQoCqTbZ3iUqH8RmDFVq8TfuaBG', '0', '', '2016-07-06 01:50:56', '2016-07-08 00:11:37', null, null, null, 'Review', null, '2017-08-16 01:25:22');
COMMIT;

-- ----------------------------
--  Table structure for `links`
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `display` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `main` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `links`
-- ----------------------------
BEGIN;
INSERT INTO `links` VALUES ('1', 'Admins', 'Admin', null, '2016-07-05 14:46:39', '1'), ('4', 'Users List', 'LoginInfo', '2017-08-16 01:42:36', '2017-08-16 01:42:36', null), ('5', 'Application Log', 'JobInfo', '2017-08-16 23:36:33', '2017-08-16 23:36:33', null), ('7', 'Equipment Log', 'EquipmentLog', '2017-08-19 01:04:35', '2017-08-19 01:04:35', null), ('8', 'Task Reminder', 'TaskReminder', '2017-08-19 01:04:44', '2017-08-19 01:04:44', null);
COMMIT;

-- ----------------------------
--  Table structure for `pingcontent`
-- ----------------------------
DROP TABLE IF EXISTS `pingcontent`;
CREATE TABLE `pingcontent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` int(10) DEFAULT NULL,
  `trace_id` int(10) unsigned DEFAULT NULL,
  `ping_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_of_ip` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_of_ip` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ping_delay` float(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `pingcontent`
-- ----------------------------
BEGIN;
INSERT INTO `pingcontent` VALUES ('1', '1', '1', '172.20.0.228', ' ', '??', '0.00', '2016-09-19 15:59:32', '2016-09-19 15:59:32'), ('2', '2', '1', '172.20.2.1', ' ', '??', '1.13', '2016-09-19 15:59:32', '2016-09-19 15:59:32'), ('3', '3', '1', '124.127.64.1', '??? ', '??', '1.91', '2016-09-19 15:59:32', '2016-09-19 15:59:32'), ('4', '4', '1', '106.120.252.137', '??? ', '??', '2.13', '2016-09-19 15:59:32', '2016-09-19 15:59:32'), ('5', '5', '1', '106.120.254.102', '??? ', '??', '2.20', '2016-09-19 15:59:32', '2016-09-19 15:59:32'), ('6', '6', '1', '220.181.111.188', '??? ', '????', '2.91', '2016-09-19 15:59:32', '2016-09-19 15:59:32'), ('7', '1', '2', '172.20.0.228', ' ', '??', '0.00', '2016-09-19 16:15:48', '2016-09-19 16:15:48'), ('8', '2', '2', '172.20.2.1', ' ', '??', '33.90', '2016-09-19 16:15:48', '2016-09-19 16:15:48'), ('9', '3', '2', '124.127.64.1', '??? ', '??', '2.75', '2016-09-19 16:15:48', '2016-09-19 16:15:48'), ('10', '4', '2', '106.120.235.193', '??? ', '??', '55.00', '2016-09-19 16:15:48', '2016-09-19 16:15:48'), ('11', '5', '2', '220.181.112.244', '??? ', '??', '3.31', '2016-09-19 16:15:48', '2016-09-19 16:15:48'), ('12', '1', '3', '172.20.0.228', ' ', '??', '0.00', '2016-09-19 16:44:34', '2016-09-19 16:44:34'), ('13', '2', '3', '172.20.2.1', ' ', '??', '88.40', '2016-09-19 16:44:34', '2016-09-19 16:44:34'), ('14', '3', '3', '124.127.64.1', '??? ', '??', '98.80', '2016-09-19 16:44:34', '2016-09-19 16:44:34'), ('15', '4', '3', '106.120.252.137', '??? ', '??', '82.40', '2016-09-19 16:44:34', '2016-09-19 16:44:34'), ('16', '5', '3', '220.181.111.188', '??? ', '????', '3.08', '2016-09-19 16:44:34', '2016-09-19 16:44:34'), ('17', '1', '4', '172.20.0.228', ' ', '??', '0.00', '2016-09-19 16:46:14', '2016-09-19 16:46:14'), ('18', '2', '4', '172.20.2.1', ' ', '??', '98.40', '2016-09-19 16:46:14', '2016-09-19 16:46:14'), ('19', '3', '4', '124.127.64.1', '??? ', '??', '56.00', '2016-09-19 16:46:14', '2016-09-19 16:46:14'), ('20', '4', '4', '106.120.252.137', '??? ', '??', '3.45', '2016-09-19 16:46:14', '2016-09-19 16:46:14'), ('21', '5', '4', '220.181.111.188', '??? ', '????', '49.10', '2016-09-19 16:46:14', '2016-09-19 16:46:14'), ('22', '1', '5', '172.20.0.228', ' ', '??', '0.00', '2016-09-19 16:47:13', '2016-09-19 16:47:13'), ('23', '2', '5', '172.20.2.1', ' ', '??', '15.30', '2016-09-19 16:47:13', '2016-09-19 16:47:13'), ('24', '3', '5', '124.127.64.1', '??? ', '??', '81.00', '2016-09-19 16:47:13', '2016-09-19 16:47:13'), ('25', '4', '5', '106.120.252.137', '??? ', '??', '72.50', '2016-09-19 16:47:13', '2016-09-19 16:47:13'), ('26', '5', '5', '220.181.111.188', '??? ', '????', '64.80', '2016-09-19 16:47:13', '2016-09-19 16:47:13'), ('27', '1', '6', '172.20.0.228', ' ', '??', '0.00', '2016-09-19 16:49:42', '2016-09-19 16:49:42'), ('28', '2', '6', '172.20.2.1', ' ', '??', '1.33', '2016-09-19 16:49:42', '2016-09-19 16:49:42'), ('29', '3', '6', '124.127.64.1', '??? ', '??', '3.12', '2016-09-19 16:49:42', '2016-09-19 16:49:42'), ('30', '4', '6', '106.120.252.137', '??? ', '??', '2.06', '2016-09-19 16:49:42', '2016-09-19 16:49:42'), ('31', '5', '6', '220.181.111.188', '??? ', '????', '2.95', '2016-09-19 16:49:42', '2016-09-19 16:49:42'), ('32', '1', '7', '172.20.0.228', ' ', '??', '0.00', '2016-09-19 19:52:51', '2016-09-19 19:52:51'), ('33', '2', '7', '172.20.2.1', ' ', '??', '81.80', '2016-09-19 19:52:51', '2016-09-19 19:52:51'), ('34', '3', '7', '124.127.64.1', '??? ', '??', '2.87', '2016-09-19 19:52:51', '2016-09-19 19:52:51'), ('35', '4', '7', '106.120.235.193', '??? ', '??', '109.00', '2016-09-19 19:52:51', '2016-09-19 19:52:51'), ('36', '5', '7', '180.149.132.151', '??? ', '??????', '132.00', '2016-09-19 19:52:51', '2016-09-19 19:52:51'), ('37', '1', '8', '172.20.2.126', ' ', '??', '0.00', '2016-10-05 10:44:19', '2016-10-05 10:44:19'), ('38', '2', '8', '172.20.2.1', ' ', '??', '250.00', '2016-10-05 10:44:19', '2016-10-05 10:44:19'), ('39', '3', '8', '115.171.92.1', '?? ', '??CDMA', '85.80', '2016-10-05 10:44:19', '2016-10-05 10:44:19'), ('40', '4', '8', '106.120.254.117', '?? ', '??', '75.30', '2016-10-05 10:44:19', '2016-10-05 10:44:19'), ('41', '5', '8', '202.97.53.89', '?? ', '??????????', '83.90', '2016-10-05 10:44:19', '2016-10-05 10:44:19'), ('42', '6', '8', '220.181.65.233', '?? ', '??', '54.50', '2016-10-05 10:44:19', '2016-10-05 10:44:19'), ('43', '1', '9', '172.20.2.126', ' ', '??', '0.00', '2016-10-05 10:55:12', '2016-10-05 10:55:12'), ('44', '2', '9', '172.20.2.1', ' ', '??', '6.51', '2016-10-05 10:55:12', '2016-10-05 10:55:12'), ('45', '3', '9', '124.127.64.1', '?? ', '??', '59.50', '2016-10-05 10:55:12', '2016-10-05 10:55:12'), ('46', '4', '9', '106.120.252.137', '?? ', '??', '46.50', '2016-10-05 10:55:12', '2016-10-05 10:55:12'), ('47', '5', '9', '220.181.65.233', '?? ', '??', '9.03', '2016-10-05 10:55:12', '2016-10-05 10:55:12'), ('48', '1', '10', '172.20.2.126', ' ', '??', '0.00', '2016-10-05 11:14:57', '2016-10-05 11:14:57'), ('49', '2', '10', '172.20.2.1', ' ', '??', '114.00', '2016-10-05 11:14:57', '2016-10-05 11:14:57'), ('50', '3', '10', '124.127.64.1', '?? ', '??', '101.00', '2016-10-05 11:14:57', '2016-10-05 11:14:57'), ('51', '4', '10', '106.120.252.137', '?? ', '??', '76.30', '2016-10-05 11:14:57', '2016-10-05 11:14:57'), ('52', '5', '10', '220.181.65.233', '?? ', '??', '31.60', '2016-10-05 11:14:57', '2016-10-05 11:14:57'), ('53', '1', '11', '172.20.2.126', ' ', '??', '0.00', '2016-10-05 11:17:00', '2016-10-05 11:17:00'), ('54', '2', '11', '172.20.2.1', ' ', '??', '11.80', '2016-10-05 11:17:00', '2016-10-05 11:17:00'), ('55', '3', '11', '124.127.64.1', '?? ', '??', '60.70', '2016-10-05 11:17:00', '2016-10-05 11:17:00'), ('56', '4', '11', '106.120.254.117', '?? ', '??', '33.90', '2016-10-05 11:17:00', '2016-10-05 11:17:00'), ('57', '5', '11', '202.97.53.89', '?? ', '??', '2.89', '2016-10-05 11:17:00', '2016-10-05 11:17:00'), ('58', '6', '11', '220.181.112.244', '?? ', '??', '86.40', '2016-10-05 11:17:00', '2016-10-05 11:17:00'), ('59', '1', '12', '172.20.2.126', ' ', '??', '0.00', '2016-10-12 23:13:20', '2016-10-12 23:13:20'), ('60', '2', '12', '172.20.2.1', ' ', '??', '101.00', '2016-10-12 23:13:20', '2016-10-12 23:13:20'), ('61', '3', '12', '106.37.66.1', '?? ', '??', '200.00', '2016-10-12 23:13:20', '2016-10-12 23:13:20'), ('62', '4', '12', '106.120.235.193', '?? ', '??', '29.20', '2016-10-12 23:13:20', '2016-10-12 23:13:20'), ('63', '5', '12', '180.149.131.76', '?? ', '??', '11.20', '2016-10-12 23:13:20', '2016-10-12 23:13:20'), ('64', '1', '13', '172.20.2.126', ' ', '??', '0.00', '2016-10-12 23:15:26', '2016-10-12 23:15:26'), ('65', '2', '13', '172.20.2.1', ' ', '??', '66.60', '2016-10-12 23:15:26', '2016-10-12 23:15:26'), ('66', '3', '13', '106.37.66.1', '?? ', '??', '36.50', '2016-10-12 23:15:26', '2016-10-12 23:15:26'), ('67', '4', '13', '106.120.235.193', '?? ', '??', '35.30', '2016-10-12 23:15:26', '2016-10-12 23:15:26'), ('68', '5', '13', '220.181.111.188', '?? ', '??', '95.60', '2016-10-12 23:15:26', '2016-10-12 23:15:26'), ('69', '1', '14', '172.20.2.41', ' ', '', '0.00', '2016-10-24 23:14:03', '2016-10-24 23:14:03'), ('70', '2', '14', '172.20.2.1', ' ', '', '1.14', '2016-10-24 23:14:03', '2016-10-24 23:14:03'), ('71', '3', '14', '106.38.148.1', ' ', '', '1.78', '2016-10-24 23:14:03', '2016-10-24 23:14:03'), ('72', '4', '14', '106.120.252.137', ' ', '', '40.40', '2016-10-24 23:14:03', '2016-10-24 23:14:03'), ('73', '5', '14', '220.181.112.244', ' ', '', '2.71', '2016-10-24 23:14:03', '2016-10-24 23:14:03'), ('74', '1', '15', '172.20.2.41', ' ', '', '0.00', '2016-10-24 23:21:49', '2016-10-24 23:21:49'), ('75', '2', '15', '172.20.2.1', ' ', '', '1.20', '2016-10-24 23:21:49', '2016-10-24 23:21:49'), ('76', '3', '15', '106.38.148.1', ' ', '', '1.80', '2016-10-24 23:21:49', '2016-10-24 23:21:49'), ('77', '4', '15', '106.120.252.137', ' ', '', '2.40', '2016-10-24 23:21:49', '2016-10-24 23:21:49'), ('78', '5', '15', '220.181.112.244', ' ', '', '2.51', '2016-10-24 23:21:49', '2016-10-24 23:21:49'), ('79', '1', '16', '172.20.2.38', ' ', '??', '0.00', '2016-11-05 00:35:53', '2016-11-05 00:35:53'), ('80', '2', '16', '172.20.2.1', ' ', '??', '8.93', '2016-11-05 00:35:53', '2016-11-05 00:35:53'), ('81', '3', '16', '219.142.152.1', '?? ', '??', '7.93', '2016-11-05 00:35:53', '2016-11-05 00:35:53'), ('82', '4', '16', '106.120.252.137', '?? ', '??', '6.81', '2016-11-05 00:35:53', '2016-11-05 00:35:53'), ('83', '5', '16', '220.181.111.188', '?? ', '??', '7.01', '2016-11-05 00:35:53', '2016-11-05 00:35:53'), ('84', '1', '17', '172.20.2.38', ' ', '??', '0.00', '2016-11-05 00:55:03', '2016-11-05 00:55:03'), ('85', '2', '17', '172.20.2.1', ' ', '??', '2.20', '2016-11-05 00:55:03', '2016-11-05 00:55:03'), ('86', '3', '17', '219.142.152.1', '?? ', '??', '6.79', '2016-11-05 00:55:03', '2016-11-05 00:55:03'), ('87', '4', '17', '106.120.254.117', '?? ', '??', '7.28', '2016-11-05 00:55:03', '2016-11-05 00:55:03'), ('88', '5', '17', '219.141.147.230', '?? ', '??', '9.16', '2016-11-05 00:55:03', '2016-11-05 00:55:03'), ('89', '6', '17', '220.181.112.244', '?? ', '??', '7.57', '2016-11-05 00:55:03', '2016-11-05 00:55:03'), ('90', '1', '18', '172.20.2.38', ' ', '??', '0.00', '2016-11-05 01:21:47', '2016-11-05 01:21:47'), ('91', '2', '18', '172.20.2.1', ' ', '??', '5.48', '2016-11-05 01:21:47', '2016-11-05 01:21:47'), ('92', '3', '18', '219.142.152.1', '?? ', '??', '6.87', '2016-11-05 01:21:47', '2016-11-05 01:21:47'), ('93', '4', '18', '106.120.254.117', '?? ', '??', '6.42', '2016-11-05 01:21:47', '2016-11-05 01:21:47'), ('94', '5', '18', '219.141.147.230', '?? ', '??', '11.20', '2016-11-05 01:21:47', '2016-11-05 01:21:47'), ('95', '6', '18', '220.181.112.244', '?? ', '??', '6.98', '2016-11-05 01:21:47', '2016-11-05 01:21:47');
COMMIT;

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `roles`
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('1', 'super', 'This group has all permissions', null, null), ('2', 'reviewer', 'This group is allowed only to review', '2016-07-06 01:59:11', '2016-07-06 01:59:14');
COMMIT;

-- ----------------------------
--  Table structure for `server`
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `server`
-- ----------------------------
BEGIN;
INSERT INTO `server` VALUES ('1', 'www.baidu.com', '2016-10-04 20:42:07', '2016-10-12 23:14:28');
COMMIT;

-- ----------------------------
--  Table structure for `trace`
-- ----------------------------
DROP TABLE IF EXISTS `trace`;
CREATE TABLE `trace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(65) COLLATE utf8_unicode_ci DEFAULT '',
  `wifi` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `local_ip` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_ip` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_of_ip` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_of_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_of_check` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_of_check` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isTable3Item` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `isTable4Item` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `trace`
-- ----------------------------
BEGIN;
INSERT INTO `trace` VALUES ('1', '', 'hananet2_5g', '172.20.0.228', '124.127.77.126', '??? ', '??', '??? ', '??', 'Y', 'N', '', '2016-09-19 15:59:32', '2016-09-19 15:59:32'), ('2', '', 'hananet2_5g', '172.20.0.228', '124.127.77.126', '??? ', '??', '??? ', '??', 'Y', 'N', '', '2016-09-19 16:15:48', '2016-09-19 16:15:48'), ('3', '', 'hananet2_5g', '172.20.0.228', '124.127.77.126', '??? ', '??', '??? ', '??', 'Y', 'N', '', '2016-09-19 16:44:34', '2016-09-19 16:44:34'), ('4', '', 'hananet2_5g', '172.20.0.228', '124.127.77.126', '??? ', '??', '??? ', '??', 'Y', 'N', '', '2016-09-19 16:46:14', '2016-09-19 16:46:14'), ('5', '', 'hananet2_5g', '172.20.0.228', '124.127.77.126', '??? ', '??', '??? ', '??', 'Y', 'N', '', '2016-09-19 16:47:13', '2016-09-19 16:47:13'), ('6', '', 'hananet2_5g', '172.20.0.228', '124.127.77.126', '??? ', '??', '??? ', '??', 'Y', 'N', '', '2016-09-19 16:49:42', '2016-09-19 16:49:42'), ('7', '', 'hananet2_5g', '172.20.0.228', '124.127.77.126', '??? ', '??', '?? ???????', '??', 'N', 'N', '', '2016-09-19 19:52:51', '2016-09-19 19:52:51'), ('8', '', 'hananet2', '172.20.2.126', '115.171.92.184', '?? ', '??CDMA', '?? ', '??', 'N', 'N', '', '2016-10-05 10:44:19', '2016-10-05 10:44:19'), ('9', '', 'hananet2', '172.20.2.126', '124.127.69.116', '?? ', '??', '?? ', '??', 'N', 'N', '', '2016-10-05 10:55:12', '2016-10-05 10:55:12'), ('10', '', 'hananet2', '172.20.2.126', '124.127.69.116', '?? ', '??', '?? ', '??', 'N', 'N', '', '2016-10-05 11:14:57', '2016-10-05 11:14:57'), ('11', '', 'hananet2', '172.20.2.126', '124.127.69.116', '?? ', '??', '?? ', '??', 'N', 'N', '', '2016-10-05 11:17:00', '2016-10-05 11:17:00'), ('12', '', 'hananet2', '172.20.2.126', '106.37.66.188', '?? ', '??', '?? ', '??', 'N', 'N', '', '2016-10-12 23:13:20', '2016-10-12 23:13:20'), ('13', '', 'hananet2', '172.20.2.126', '106.37.66.188', '?? ', '??', '?? ', '??', 'N', 'N', '', '2016-10-12 23:15:26', '2016-10-12 23:15:26'), ('14', '', 'hananet2_5g', '172.20.2.41', '106.38.148.64', ' ', '', '???? ??', '???', 'N', 'N', '', '2016-10-24 23:14:03', '2016-10-24 23:14:03'), ('15', '', 'hananet2_5g', '172.20.2.41', '106.38.148.64', ' ', '', '?? ???', '??', 'N', 'N', '', '2016-10-24 23:21:49', '2016-10-24 23:21:49'), ('16', '', 'hananet2_5g', '172.20.2.38', '219.142.155.58', '?? ', '??', '?? ', '??', 'Y', 'N', '', '2016-11-05 00:35:53', '2016-11-05 00:35:53'), ('17', '', 'hananet2_5g', '172.20.2.38', '219.142.155.58', '?? ', '??', '?? ???', '??', 'Y', 'N', '', '2016-11-05 00:55:03', '2016-11-05 00:55:03'), ('18', '', 'hananet2_5g', '172.20.2.38', '219.142.155.58', '?? ', '??', '?? ', '???', 'Y', 'N', '', '2016-11-05 01:21:47', '2016-11-05 01:21:47');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
