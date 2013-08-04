/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:23:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jiaotong`
-- ----------------------------
DROP TABLE IF EXISTS `jiaotong`;
CREATE TABLE `jiaotong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `lianxiren` varchar(20) DEFAULT NULL COMMENT '联系人',
  `chengshiId` int(11) DEFAULT NULL COMMENT '城市Id\r\n            ',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `dianhua` int(11) DEFAULT NULL COMMENT '电话',
  `shouji` int(11) DEFAULT NULL COMMENT '手机',
  `Email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `chuanzhen` varchar(20) DEFAULT NULL COMMENT '传真',
  `wangzhi` varchar(100) DEFAULT NULL COMMENT '网址',
  `jiage` int(11) DEFAULT NULL COMMENT '价格',
  `hzjbId` int(11) DEFAULT NULL COMMENT '合作级别Id',
  `whfsid` int(11) DEFAULT NULL COMMENT '外呼方式id',
  `beizhu` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jiaotong
-- ----------------------------
INSERT INTO `jiaotong` VALUES ('1', '1', '1', '31', '1', '1', '1', null, '1', '1', '1', '8', '1', '1');
INSERT INTO `jiaotong` VALUES ('4', '3', '3', '12', '3', '3', '3', null, '3', '3', '3', '7', '3', '3');
