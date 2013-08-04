/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:22:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gouwu`
-- ----------------------------
DROP TABLE IF EXISTS `gouwu`;
CREATE TABLE `gouwu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lianxiren` varchar(50) DEFAULT NULL COMMENT '联系人',
  `name` varchar(100) DEFAULT NULL COMMENT '购物店名称',
  `chuanzhen` varchar(50) DEFAULT NULL COMMENT '传真',
  `chengshiId` int(11) DEFAULT NULL COMMENT '城市',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `dianhua` varchar(50) DEFAULT NULL COMMENT '电话',
  `shouji` varchar(50) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `hzjbId` int(11) DEFAULT NULL COMMENT '合作级别',
  `bz` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='购物店';

-- ----------------------------
-- Records of gouwu
-- ----------------------------
INSERT INTO `gouwu` VALUES ('1', '1', '1', '1', '31', '1', '1', '1', '1', '7', '喂喂喂');
INSERT INTO `gouwu` VALUES ('2', '2', '222', '2', '12', '2', '2', '2', '2', '7', '柔柔弱弱');
