/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : work_manager

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 16/07/2024 11:21:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add user data', 6, 'add_userdata');
INSERT INTO `auth_permission` VALUES (22, 'Can change user data', 6, 'change_userdata');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user data', 6, 'delete_userdata');
INSERT INTO `auth_permission` VALUES (24, 'Can view user data', 6, 'view_userdata');
INSERT INTO `auth_permission` VALUES (25, 'Can add job', 7, 'add_job');
INSERT INTO `auth_permission` VALUES (26, 'Can change job', 7, 'change_job');
INSERT INTO `auth_permission` VALUES (27, 'Can delete job', 7, 'delete_job');
INSERT INTO `auth_permission` VALUES (28, 'Can view job', 7, 'view_job');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_my_auth_userdata_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_my_auth_userdata_id` FOREIGN KEY (`user_id`) REFERENCES `my_auth_userdata` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2024-01-14 07:16:01.136973', '1', 'Job object (1)', 1, '[{\"added\": {}}]', 7, 5);
INSERT INTO `django_admin_log` VALUES (2, '2024-01-14 07:16:15.176051', '1', 'Job object (1)', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 7, 5);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'job', 'job');
INSERT INTO `django_content_type` VALUES (6, 'my_auth', 'userdata');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-01-13 07:24:54.898392');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-01-13 07:24:54.916080');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-01-13 07:24:54.996227');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-01-13 07:24:55.017128');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-01-13 07:24:55.021126');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-01-13 07:24:55.025128');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-01-13 07:24:55.030125');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-01-13 07:24:55.031127');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-01-13 07:24:55.035128');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-01-13 07:24:55.038288');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-01-13 07:24:55.043837');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-01-13 07:24:55.049836');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-01-13 07:24:55.053834');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-01-13 07:24:55.057835');
INSERT INTO `django_migrations` VALUES (15, 'my_auth', '0001_initial', '2024-01-13 07:24:55.146514');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2024-01-13 07:24:55.199139');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-01-13 07:24:55.204138');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-13 07:24:55.210141');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2024-01-13 07:24:55.223441');
INSERT INTO `django_migrations` VALUES (20, 'my_auth', '0002_alter_userdata_address', '2024-01-13 07:39:23.037521');
INSERT INTO `django_migrations` VALUES (21, 'my_auth', '0003_alter_userdata_tel', '2024-01-13 07:42:45.594523');
INSERT INTO `django_migrations` VALUES (22, 'job', '0001_initial', '2024-01-14 07:06:39.011428');
INSERT INTO `django_migrations` VALUES (23, 'my_auth', '0004_userdata_is_staff', '2024-01-14 07:15:29.778366');
INSERT INTO `django_migrations` VALUES (24, 'job', '0002_job_budget_job_original_image_url_and_more', '2024-01-24 10:00:10.396122');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('p7ntdcoydnxft06kvgq4p0klyrno2vau', '.eJxVjEsOwjAMBe-SNYrcyCk1S_acIXJslxZQIvWzqrg7VOoCtm9m3uYSr8uQ1tmmNKq7uOhOv1tmeVrZgT643KuXWpZpzH5X_EFnf6tqr-vh_h0MPA_fWlgRIAsyQcjQRRRQFGyoFwKAc2wDGhCT9pG4CdQbdMGwQ1Rss3t_ANvGN2Y:1rOufD:DdWXVSaIuCYEAv9HgC94-ORcACSsNx-6DnnayMJnigU', '2024-01-28 07:12:11.107984');

-- ----------------------------
-- Table structure for job_job
-- ----------------------------
DROP TABLE IF EXISTS `job_job`;
CREATE TABLE `job_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `car_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `charger` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `deadline` date NULL DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `is_client_unread` tinyint(1) NOT NULL,
  `is_admin_unread` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  `budget` int NOT NULL,
  `original_image_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `result_image_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_job_user_id_bab12bbc_fk_my_auth_userdata_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `job_job_user_id_bab12bbc_fk_my_auth_userdata_id` FOREIGN KEY (`user_id`) REFERENCES `my_auth_userdata` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_job
-- ----------------------------
INSERT INTO `job_job` VALUES (1, 'sdafads1078', 'asd', 1, '2024-01-23', '2024-01-14 07:16:01.132972', 0, 0, 5, 0, 'happy.jpg', 'avartar7.jpg', '');
INSERT INTO `job_job` VALUES (2, '1', 'charger1', 1, '2024-01-19', '2024-01-14 07:25:22.636733', 0, 0, 3, 0, 'girl2.png', 'happy_AjuE2qI.jpg', '');
INSERT INTO `job_job` VALUES (3, '2222', '', 1, NULL, '2024-01-14 07:26:02.822398', 0, 0, 2, 0, 'snapedit_1685545260406_hfqv9Jn.jpg', 'avartar7.png', '');
INSERT INTO `job_job` VALUES (4, '2222', 'asd', 1, NULL, '2024-01-14 07:30:01.640611', 0, 0, 2, 0, 'a-1_rtrmydh.jpg', 'bluesky_xmyfIEP.jpg', '');
INSERT INTO `job_job` VALUES (5, '2222', 'asd', 1, NULL, '2024-01-14 07:30:16.728426', 0, 0, 2, 0, 'a-1.jpg', 'bluesky_VwQiLyi.jpg', '');
INSERT INTO `job_job` VALUES (6, '2', 'charger', 1, NULL, '2024-01-14 07:30:53.337571', 0, 0, 3, 0, 'a-1_mwPrN4H.jpg', 'bluesky_E5LPlEr.jpg', '');
INSERT INTO `job_job` VALUES (7, '3', 'charger1', 1, '2024-01-19', '2024-01-14 07:31:22.763733', 0, 0, 3, 0, 'a-1_IdZCVAJ.jpg', 'bluesky_uuVbyHt.jpg', '');

-- ----------------------------
-- Table structure for my_auth_userdata
-- ----------------------------
DROP TABLE IF EXISTS `my_auth_userdata`;
CREATE TABLE `my_auth_userdata`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_auth_userdata
-- ----------------------------
INSERT INTO `my_auth_userdata` VALUES (1, 'pbkdf2_sha256$600000$hSJSWDBE0eqnCnV5uI2suj$rb3lDk6StHOKpcFZHf0ddMVSEUKmufJiVoj6MEhHjPw=', NULL, 0, 'test@test.com', '11', '11', '11', 1, '2024-01-13 07:44:52.817919', '2024-01-25 15:38:15.461735', 1);
INSERT INTO `my_auth_userdata` VALUES (2, 'pbkdf2_sha256$600000$hSJSWDBE0eqnCnV5uI2suj$rb3lDk6StHOKpcFZHf0ddMVSEUKmufJiVoj6MEhHjPw=', NULL, 0, 'test@test.com1', '1', '1', '1', 1, '2024-01-13 07:45:36.516613', '2024-01-25 15:38:04.233478', 1);
INSERT INTO `my_auth_userdata` VALUES (3, 'pbkdf2_sha256$600000$hSJSWDBE0eqnCnV5uI2suj$rb3lDk6StHOKpcFZHf0ddMVSEUKmufJiVoj6MEhHjPw=', NULL, 0, 'test1@test.com', '2', '2', '2', 1, '2024-01-13 07:46:36.359910', '2024-01-25 15:38:31.637446', 1);
INSERT INTO `my_auth_userdata` VALUES (4, 'pbkdf2_sha256$600000$hSJSWDBE0eqnCnV5uI2suj$rb3lDk6StHOKpcFZHf0ddMVSEUKmufJiVoj6MEhHjPw=', NULL, 0, 'test2@test.com', 'wertw', '324213', 'wretwre', 1, '2024-01-13 07:51:00.312762', '2024-01-25 16:50:38.806894', 1);
INSERT INTO `my_auth_userdata` VALUES (5, 'pbkdf2_sha256$600000$hSJSWDBE0eqnCnV5uI2suj$rb3lDk6StHOKpcFZHf0ddMVSEUKmufJiVoj6MEhHjPw=', '2024-01-14 07:12:11.101848', 1, 'info@test.com', 'テキスト', '１２３２１３', 'テキスト', 1, '2024-01-14 06:48:46.068162', '2024-01-24 17:25:47.296794', 1);
INSERT INTO `my_auth_userdata` VALUES (6, 'pbkdf2_sha256$600000$hSJSWDBE0eqnCnV5uI2suj$rb3lDk6StHOKpcFZHf0ddMVSEUKmufJiVoj6MEhHjPw=', NULL, 0, 'adreson@test.com', '', '', '', 1, '2024-01-15 08:23:01.042551', '2024-01-15 08:23:01.368547', 1);
INSERT INTO `my_auth_userdata` VALUES (7, 'pbkdf2_sha256$600000$hSJSWDBE0eqnCnV5uI2suj$rb3lDk6StHOKpcFZHf0ddMVSEUKmufJiVoj6MEhHjPw=', NULL, 1, 'admin@test.com', '', '', '', 1, '2024-07-15 17:19:40.747097', '2024-07-15 17:19:40.747097', 1);

-- ----------------------------
-- Table structure for my_auth_userdata_groups
-- ----------------------------
DROP TABLE IF EXISTS `my_auth_userdata_groups`;
CREATE TABLE `my_auth_userdata_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userdata_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `my_auth_userdata_groups_userdata_id_group_id_3c7268f4_uniq`(`userdata_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `my_auth_userdata_groups_group_id_f7f16ec7_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `my_auth_userdata_gro_userdata_id_6ced9c68_fk_my_auth_u` FOREIGN KEY (`userdata_id`) REFERENCES `my_auth_userdata` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `my_auth_userdata_groups_group_id_f7f16ec7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_auth_userdata_groups
-- ----------------------------

-- ----------------------------
-- Table structure for my_auth_userdata_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `my_auth_userdata_user_permissions`;
CREATE TABLE `my_auth_userdata_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userdata_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `my_auth_userdata_user_pe_userdata_id_permission_i_520de5ac_uniq`(`userdata_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `my_auth_userdata_use_permission_id_1a3ef634_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `my_auth_userdata_use_permission_id_1a3ef634_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `my_auth_userdata_use_userdata_id_d5a2b35d_fk_my_auth_u` FOREIGN KEY (`userdata_id`) REFERENCES `my_auth_userdata` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_auth_userdata_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
