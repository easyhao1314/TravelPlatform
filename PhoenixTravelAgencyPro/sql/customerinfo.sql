/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:36:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customerinfo`
-- ----------------------------
DROP TABLE IF EXISTS `customerinfo`;
CREATE TABLE `customerinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `tuanNo` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '�ͻ���˾����',
  `lxr` varchar(20) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `age` int(20) DEFAULT NULL,
  `sex` bigint(20) DEFAULT NULL COMMENT 'ְλ',
  `moblePhone` varchar(100) DEFAULT NULL,
  `telePhone` varchar(100) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `msn` varchar(50) DEFAULT NULL,
  `chuanzhen` varchar(50) DEFAULT NULL,
  `sfzn` varchar(50) DEFAULT NULL,
  `jituan` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `zhtime` datetime DEFAULT NULL,
  `city` bigint(50) DEFAULT NULL,
  `daqu` bigint(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `hzjb` bigint(20) DEFAULT NULL,
  `xiaoshou` bigint(20) DEFAULT NULL,
  `cjtime` datetime DEFAULT NULL,
  `lxrs` int(20) DEFAULT NULL,
  `bz` varchar(200) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='�ͻ���Ϣ��';

-- ----------------------------
-- Records of customerinfo
-- ----------------------------
INSERT INTO `customerinfo` VALUES ('2', '22222', '2', '2', '2', '2', '2', '2', '2', '2', '909482221@qq.com', '2', '2', '2', '2', null, '12', '10', '2', '2', '1', null, '2', '2', '32');
INSERT INTO `customerinfo` VALUES ('3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '909482221@qq.com', '3', '3', '3', '3', '2013-07-11 11:44:12', '31', '3', '3', '3', '1', '2013-07-22 11:12:31', '3', '3', '33');
INSERT INTO `customerinfo` VALUES ('4', '4', '4', '4', '4', null, null, '4', '4', '4', '444444@qq.com', '44', '4', '4', '4', null, '12', '10', '4', '4', '4', null, '4', '4', '32');
INSERT INTO `customerinfo` VALUES ('5', '9', '9', '9', '9', '9', '15', '9', '9', '9', '909482221@qq.com', '9999', '9', '9', '9', null, '12', '10', '9', '7', '1', null, '1', '1', '32');
INSERT INTO `customerinfo` VALUES ('6', '9999', '9', '9', '9', '9', '15', '9', '2', '9', '909482221@qq.com', '2', '2', '9', '9', null, '12', '10', '9', '39', null, null, '2', '2', '32');
INSERT INTO `customerinfo` VALUES ('7', 'eeee', 'eeee', '2', '2', '25', '15', '2', '2', '2', '909482221@qq.com', '2', '2', '2', '2', '2013-07-31 00:00:00', '12', '10', '2', '50', null, '2013-07-31 00:00:00', '2', '2', '32');
