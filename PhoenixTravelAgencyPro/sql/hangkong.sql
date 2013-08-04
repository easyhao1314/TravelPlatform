/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:23:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hangkong`
-- ----------------------------
DROP TABLE IF EXISTS `hangkong`;
CREATE TABLE `hangkong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `daima` varchar(29) DEFAULT NULL COMMENT '国际航协代码',
  `name` varchar(100) DEFAULT NULL COMMENT '航空公司名称',
  `shui` float DEFAULT NULL COMMENT '税',
  `bizongId` int(11) DEFAULT NULL COMMENT '币种',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hangkong
-- ----------------------------
INSERT INTO `hangkong` VALUES ('1', '1', '1', '1', '9');
INSERT INTO `hangkong` VALUES ('2', '2', '2', '2', '9');
INSERT INTO `hangkong` VALUES ('3', '3', '3', '3', '9');
INSERT INTO `hangkong` VALUES ('4', '4', '4', '4', '9');
INSERT INTO `hangkong` VALUES ('5', '1', '1', '1', '9');
INSERT INTO `hangkong` VALUES ('6', '1', '1', '1', '9');
