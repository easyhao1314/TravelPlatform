/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:34:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fukuanfangshi`
-- ----------------------------
DROP TABLE IF EXISTS `fukuanfangshi`;
CREATE TABLE `fukuanfangshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fukuanfangshi` varchar(100) DEFAULT NULL COMMENT '付款方式名称',
  `miaoshu` varchar(100) DEFAULT NULL COMMENT '付款方式描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fukuanfangshi
-- ----------------------------
INSERT INTO `fukuanfangshi` VALUES ('3', '1212', '1212');
INSERT INTO `fukuanfangshi` VALUES ('4', '11', '111');
INSERT INTO `fukuanfangshi` VALUES ('5', '1111111', '111');
INSERT INTO `fukuanfangshi` VALUES ('6', '342332234234', '234324');
