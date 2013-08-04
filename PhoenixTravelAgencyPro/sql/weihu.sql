/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:34:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `weihu`
-- ----------------------------
DROP TABLE IF EXISTS `weihu`;
CREATE TABLE `weihu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(100) DEFAULT NULL COMMENT '编号',
  `xingzhi` varchar(100) DEFAULT NULL COMMENT '付款性质',
  `shouzhi` varchar(100) DEFAULT NULL COMMENT '收支类型',
  `shuoming` varchar(100) DEFAULT NULL COMMENT '费用项说明',
  `liucheng` varchar(100) DEFAULT NULL COMMENT '对应审批流程',
  `fulei` varchar(100) DEFAULT NULL COMMENT '父类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weihu
-- ----------------------------
INSERT INTO `weihu` VALUES ('5', 'erer', 'ererererere', 'erer', '3434', 'erer', '3434');
INSERT INTO `weihu` VALUES ('7', '11111', '111', '11', '11', '11', '1111');
INSERT INTO `weihu` VALUES ('11', '11111', '111', '111', '1111', '111', '1111');
INSERT INTO `weihu` VALUES ('14', '23423', '234234', '234234', '23434', '234234', '234234234');
