/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:34:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `shenfen`
-- ----------------------------
DROP TABLE IF EXISTS `shenfen`;
CREATE TABLE `shenfen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shenfen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='身份';

-- ----------------------------
-- Records of shenfen
-- ----------------------------
INSERT INTO `shenfen` VALUES ('1', '单团');
INSERT INTO `shenfen` VALUES ('2', '散拼');
INSERT INTO `shenfen` VALUES ('3', '计调');
