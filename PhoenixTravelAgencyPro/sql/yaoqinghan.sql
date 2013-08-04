/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:23:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yaoqinghan`
-- ----------------------------
DROP TABLE IF EXISTS `yaoqinghan`;
CREATE TABLE `yaoqinghan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `guoduid` int(11) DEFAULT NULL COMMENT '国度（国家）',
  `miaoshu` varchar(500) DEFAULT NULL COMMENT '描述',
  `chengben` varchar(200) DEFAULT NULL COMMENT '成本',
  `bizhongId` int(11) DEFAULT NULL COMMENT '币种',
  `shiyongid` int(11) DEFAULT NULL COMMENT '是否使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='邀请函成本维护';

-- ----------------------------
-- Records of yaoqinghan
-- ----------------------------
INSERT INTO `yaoqinghan` VALUES ('1', '12', '1', '4', '9', '13');
INSERT INTO `yaoqinghan` VALUES ('2', '31', '2', '5', '9', '14');
INSERT INTO `yaoqinghan` VALUES ('3', '12', '鹅鹅鹅饿饿', '3', '9', '13');
