-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tugasweb
CREATE DATABASE IF NOT EXISTS `tugasweb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tugasweb`;

-- Dumping structure for table tugasweb.auth_activation_attempts
CREATE TABLE IF NOT EXISTS `auth_activation_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_activation_attempts: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_activation_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_activation_attempts` ENABLE KEYS */;

-- Dumping structure for table tugasweb.auth_groups
CREATE TABLE IF NOT EXISTS `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_groups: ~2 rows (approximately)
/*!40000 ALTER TABLE `auth_groups` DISABLE KEYS */;
INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
	(1, 'admin', 'Site administrator'),
	(2, 'user', 'User DailyGoods');
/*!40000 ALTER TABLE `auth_groups` ENABLE KEYS */;

-- Dumping structure for table tugasweb.auth_groups_permissions
CREATE TABLE IF NOT EXISTS `auth_groups_permissions` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`),
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_groups_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_groups_permissions` DISABLE KEYS */;
INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 2);
/*!40000 ALTER TABLE `auth_groups_permissions` ENABLE KEYS */;

-- Dumping structure for table tugasweb.auth_groups_users
CREATE TABLE IF NOT EXISTS `auth_groups_users` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`),
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_groups_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_groups_users` DISABLE KEYS */;
INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
	(1, 1),
	(2, 2),
	(2, 3);
/*!40000 ALTER TABLE `auth_groups_users` ENABLE KEYS */;

-- Dumping structure for table tugasweb.auth_logins
CREATE TABLE IF NOT EXISTS `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_logins: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_logins` DISABLE KEYS */;
INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
	(1, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 07:17:18', 1),
	(2, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 08:31:00', 1),
	(3, '::1', 'firlicholeh', NULL, '2020-12-24 09:00:00', 0),
	(4, '::1', 'haikalmoon123@yahoo.com', 3, '2020-12-24 09:00:22', 1),
	(5, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 09:12:02', 1),
	(6, '::1', 'haikalmoon123@yahoo.com', 3, '2020-12-24 09:12:12', 1),
	(7, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 09:12:54', 1),
	(8, '::1', 'haikalmoon123@yahoo.com', 3, '2020-12-24 09:13:06', 1),
	(9, '::1', 'haikalmoon123@yahoo.com', 3, '2020-12-24 09:35:51', 1),
	(10, '::1', 'haikalmoon123@yahoo.com', 3, '2020-12-24 09:37:25', 1),
	(11, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 09:56:15', 1),
	(12, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 10:19:07', 1),
	(13, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 17:13:58', 1),
	(14, '::1', 'haikalmoon123@yahoo.com', 3, '2020-12-24 21:42:17', 1),
	(15, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 21:42:36', 1),
	(16, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 22:17:26', 1),
	(17, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 22:19:58', 1),
	(18, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 22:23:22', 1),
	(19, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-24 22:26:42', 1),
	(20, '::1', 'ihsansaifulhadi7@gmail.com', 1, '2020-12-25 00:17:10', 1),
	(21, '::1', 'haikalmoon123@yahoo.com', 3, '2020-12-25 00:20:07', 1);
/*!40000 ALTER TABLE `auth_logins` ENABLE KEYS */;

-- Dumping structure for table tugasweb.auth_permissions
CREATE TABLE IF NOT EXISTS `auth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_permissions: ~2 rows (approximately)
/*!40000 ALTER TABLE `auth_permissions` DISABLE KEYS */;
INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
	(1, 'manage-users', 'Manage All USers'),
	(2, 'manage-profile', 'Manage user\'s profile');
/*!40000 ALTER TABLE `auth_permissions` ENABLE KEYS */;

-- Dumping structure for table tugasweb.auth_reset_attempts
CREATE TABLE IF NOT EXISTS `auth_reset_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_reset_attempts: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_reset_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_reset_attempts` ENABLE KEYS */;

-- Dumping structure for table tugasweb.auth_tokens
CREATE TABLE IF NOT EXISTS `auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`),
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;

-- Dumping structure for table tugasweb.auth_users_permissions
CREATE TABLE IF NOT EXISTS `auth_users_permissions` (
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`),
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.auth_users_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_users_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_users_permissions` ENABLE KEYS */;

-- Dumping structure for table tugasweb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.migrations: ~1 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
	(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1608803691, 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table tugasweb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT 'default.svg',
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table tugasweb.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `username`, `fullname`, `user_image`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'ihsansaifulhadi7@gmail.com', 'ihsansaiful', 'Ihsan Saiful Hadi', 'default.svg', '$2y$10$04ssdVcSq7BtlGDTBpo/cuWC/Mh9IS6r7kXSgTUFIZwrl68SWwnyW', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2020-12-24 07:12:47', '2020-12-24 07:12:47', NULL),
	(2, 'firlycholeh@gmail.com', 'firlytaufik', NULL, 'default.svg', '$2y$10$pCKSlVeGNWREPaHUzqHWeebf1cz/IebBoeWQZ3WlKnqLWd1xEKoYG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2020-12-24 07:53:38', '2020-12-24 07:53:38', NULL),
	(3, 'haikalmoon123@yahoo.com', 'haikalmoon', NULL, 'default.svg', '$2y$10$EB5LHNpAUALf/yo/.rVdWOwBJp0dwzvNdRj3OQijUg3dRE6O5qv0G', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2020-12-24 07:54:15', '2020-12-24 07:54:15', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
