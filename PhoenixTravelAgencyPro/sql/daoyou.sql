/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:22:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `daoyou`
-- ----------------------------
DROP TABLE IF EXISTS `daoyou`;
CREATE TABLE `daoyou` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `guojiaId` int(11) DEFAULT NULL COMMENT '国籍（国家）',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `name2` varchar(50) DEFAULT NULL COMMENT '姓名拼音',
  `name3` varchar(50) DEFAULT NULL COMMENT '\r\n            英文名字',
  `zjlx` varchar(50) DEFAULT NULL COMMENT '证件类型',
  `zjhm` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `chengshiId` int(11) DEFAULT NULL COMMENT '常驻地（城市）',
  `dinhua` varchar(50) DEFAULT NULL COMMENT '电话',
  `lxfs1` varchar(50) DEFAULT NULL COMMENT '联系方式1',
  `lxfs2` varchar(50) DEFAULT NULL COMMENT '联系方式2',
  `lxfs3` varchar(50) DEFAULT NULL COMMENT '联系方式3',
  `email` varchar(50) DEFAULT NULL COMMENT 'Email',
  `shouji` varchar(50) DEFAULT NULL COMMENT '手机',
  `fax` varchar(50) DEFAULT NULL COMMENT 'FAX',
  `dyfy` int(11) DEFAULT NULL COMMENT '导游费用',
  `hzjbId` int(11) DEFAULT NULL COMMENT '合作级别id',
  `bz` varchar(500) DEFAULT NULL COMMENT '备注',
  `zhaopian` varchar(20) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='导游';

-- ----------------------------
-- Records of daoyou
-- ----------------------------
INSERT INTO `daoyou` VALUES ('1', '11', '1', '1', '1', '1', '1', '12', '1', '1', '1', '1', '1', '1', '1', '3', '7', '12', '1');
INSERT INTO `daoyou` VALUES ('2', '11', '2888', 'ww', 'w', 'w', 'w', '12', '1', '1', '1', '1', '3', '1', '1', '3', '7', '1', null);
