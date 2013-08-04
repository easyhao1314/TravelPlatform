/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:34:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fukuanxiang`
-- ----------------------------
DROP TABLE IF EXISTS `fukuanxiang`;
CREATE TABLE `fukuanxiang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='付款说明';

-- ----------------------------
-- Records of fukuanxiang
-- ----------------------------
INSERT INTO `fukuanxiang` VALUES ('1', '酒店');
INSERT INTO `fukuanxiang` VALUES ('2', '酒店首款');
INSERT INTO `fukuanxiang` VALUES ('3', '酒店尾款');
INSERT INTO `fukuanxiang` VALUES ('4', '合同酒店');
