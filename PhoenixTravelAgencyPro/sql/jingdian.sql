/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:23:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jingdian`
-- ----------------------------
DROP TABLE IF EXISTS `jingdian`;
CREATE TABLE `jingdian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `name2` varchar(50) DEFAULT NULL COMMENT '景点英文名称',
  `chengsiId` int(11) DEFAULT NULL COMMENT '城市id',
  `jiage` int(11) DEFAULT NULL COMMENT '门票价格',
  `bizongId` int(11) DEFAULT NULL COMMENT '币种id',
  `kftimeqi` varchar(50) DEFAULT NULL COMMENT '开发时间起',
  `kftimezhi` varchar(50) DEFAULT NULL COMMENT '开发时间止',
  `timekb` int(11) DEFAULT NULL COMMENT '时间是否可变',
  `lianxiren` varchar(50) DEFAULT NULL COMMENT '联系人',
  `dianhua` varchar(50) DEFAULT NULL COMMENT '电话',
  `chuanzhen` varchar(50) DEFAULT NULL COMMENT '传真',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `dcmr` int(11) DEFAULT NULL COMMENT '是否订车默认景点',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `ywdz` varchar(200) DEFAULT NULL COMMENT '英文地址',
  `jdms` varchar(500) DEFAULT NULL COMMENT '景点描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='景点';

-- ----------------------------
-- Records of jingdian
-- ----------------------------
INSERT INTO `jingdian` VALUES ('1', 'www', 'rrrr', '31', '7', '9', '1', '1', '13', '1', '1', '1', 'eeeee', '14', '1', '1', '1');
INSERT INTO `jingdian` VALUES ('2', 'www', 'eee', '12', '4', '9', '2', '2', '13', '2', '2', '2', '3', '14', '2', '2', '2');
INSERT INTO `jingdian` VALUES ('3', '11', '22', '12', '11', '9', '早八点', '晚八点', '14', '1', '120293333', '1', '1', '14', '1', '1', '1');
