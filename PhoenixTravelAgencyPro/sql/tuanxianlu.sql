/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-11 22:13:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tuanxianlu`
-- ----------------------------
DROP TABLE IF EXISTS `tuanxianlu`;
CREATE TABLE `tuanxianlu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tuanNo` varchar(255) DEFAULT NULL,
  `xlid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuanxianlu
-- ----------------------------
INSERT INTO `tuanxianlu` VALUES ('1', '1', '1');
INSERT INTO `tuanxianlu` VALUES ('2', '11', '51');
INSERT INTO `tuanxianlu` VALUES ('3', '11', '51');
INSERT INTO `tuanxianlu` VALUES ('4', '11', '51');
INSERT INTO `tuanxianlu` VALUES ('5', '66', '67');
INSERT INTO `tuanxianlu` VALUES ('6', '111', '70');
INSERT INTO `tuanxianlu` VALUES ('7', '77', '73');
INSERT INTO `tuanxianlu` VALUES ('8', '222', '75');
INSERT INTO `tuanxianlu` VALUES ('9', 'tj122', '77');
INSERT INTO `tuanxianlu` VALUES ('10', '22222', '79');
INSERT INTO `tuanxianlu` VALUES ('11', '123', '81');
