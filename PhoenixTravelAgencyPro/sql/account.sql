/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-10 11:20:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhanghaoming` varchar(100) DEFAULT NULL COMMENT '账号名称',
  `yongtu` int(11) DEFAULT NULL COMMENT '用途',
  `bizhongid` int(11) DEFAULT '1' COMMENT '币种',
  `huming` varchar(100) DEFAULT NULL COMMENT '帐号名',
  `zhanghao` varchar(100) DEFAULT NULL COMMENT '账号',
  `kaihuhang` varchar(100) DEFAULT NULL COMMENT '开户地址',
  `shiyongshuoming` varchar(100) DEFAULT NULL COMMENT '使用说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='首付款账号维护';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `account` VALUES ('2', '2', '22', '1', '2', '2', '2', '2');
INSERT INTO `account` VALUES ('3', '3', '3', '1', '3', '3', '3', '3');
INSERT INTO `account` VALUES ('4', '1', '0', '1', null, null, null, null);
