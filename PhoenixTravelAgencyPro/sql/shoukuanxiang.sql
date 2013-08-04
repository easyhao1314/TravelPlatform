/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:34:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `shoukuanxiang`
-- ----------------------------
DROP TABLE IF EXISTS `shoukuanxiang`;
CREATE TABLE `shoukuanxiang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='应收款';

-- ----------------------------
-- Records of shoukuanxiang
-- ----------------------------
INSERT INTO `shoukuanxiang` VALUES ('1', '团款');
INSERT INTO `shoukuanxiang` VALUES ('2', '团款收款');
INSERT INTO `shoukuanxiang` VALUES ('3', '团款尾款');
INSERT INTO `shoukuanxiang` VALUES ('4', '退款团款');
