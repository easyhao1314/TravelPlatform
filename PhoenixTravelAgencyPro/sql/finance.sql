/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:33:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `finance`
-- ----------------------------
DROP TABLE IF EXISTS `finance`;
CREATE TABLE `finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL COMMENT '审批状态',
  `review` int(11) DEFAULT NULL COMMENT '财务审核',
  `confirmed` int(11) DEFAULT NULL COMMENT '财务确认',
  `cashier` int(11) DEFAULT NULL COMMENT '出纳确认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finance
-- ----------------------------
INSERT INTO `finance` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `finance` VALUES ('2', '1', '2', '1', '1');
INSERT INTO `finance` VALUES ('3', '2', '2', '1', '1');
INSERT INTO `finance` VALUES ('4', '2', '2', '2', '1');
INSERT INTO `finance` VALUES ('5', '2', '2', '2', '2');
INSERT INTO `finance` VALUES ('6', null, null, '2', null);
INSERT INTO `finance` VALUES ('7', null, null, '2', null);
