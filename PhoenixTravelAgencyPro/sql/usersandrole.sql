/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : fenghuangdb

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2013-08-11 16:38:03
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `usersandrole`
-- ----------------------------
DROP TABLE IF EXISTS `usersandrole`;
CREATE TABLE `usersandrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `roleCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usersandrole
-- ----------------------------

