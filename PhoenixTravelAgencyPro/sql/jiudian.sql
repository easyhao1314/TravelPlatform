/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:23:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jiudian`
-- ----------------------------
DROP TABLE IF EXISTS `jiudian`;
CREATE TABLE `jiudian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `chengshi` int(11) DEFAULT NULL COMMENT '城市',
  `name` varchar(100) DEFAULT NULL COMMENT '酒店供应商名称',
  `fangjian` int(11) DEFAULT NULL COMMENT '房间数',
  `hzjb` varchar(50) DEFAULT NULL COMMENT '合作级别',
  `whr` varchar(50) DEFAULT NULL COMMENT '维护人',
  `xjbz` varchar(10) DEFAULT NULL COMMENT '星级标准',
  `dianhua` int(11) DEFAULT NULL COMMENT '电话',
  `chuanzhen` varchar(50) DEFAULT NULL COMMENT '传真',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `guanwang` varchar(100) DEFAULT NULL COMMENT '官网',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `pingjia` varchar(500) DEFAULT NULL COMMENT '评价',
  `tishi` varchar(500) DEFAULT NULL COMMENT '提示',
  `danjijia` int(11) DEFAULT NULL COMMENT '淡季价',
  `wangjijia` int(11) DEFAULT NULL COMMENT '旺季价',
  `jgsm` varchar(500) DEFAULT NULL COMMENT '价格说明',
  `bz` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jiudian
-- ----------------------------
INSERT INTO `jiudian` VALUES ('1', '31', '北京烤鸭', '21', '7', '丁丁', '22', '100', '120293333', '909482221', 'www.kaoya.com', '北三环', '很好', '提示', '100', '150', '说明', '备注');
INSERT INTO `jiudian` VALUES ('2', '31', 'ww', '8', '7', '1', '22', '6', '1', '1', '1', '1', '1', '1', '6', '4', '1', '1');
INSERT INTO `jiudian` VALUES ('10', '31', '3', '1', '7', '1', '22', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `jiudian` VALUES ('11', '31', '1122', '1', '7', '1', '22', '333', '1', '1', '1', '1', '1', '1', '333', '13', '1', '1');
INSERT INTO `jiudian` VALUES ('12', '31', '22', '1', '7', '', '22', '1', '', '', '', '', '', '', '1', '1', '2', '2');
INSERT INTO `jiudian` VALUES ('13', '12', '', '0', '7', '', '22', '1', '', '', '', '', '', '', '1', '0', '', '');
INSERT INTO `jiudian` VALUES ('14', '12', 'eee', '2', '7', '', '22', '1', '', '', '', '', '', '', '1', '1', '', '');
INSERT INTO `jiudian` VALUES ('16', '12', '', '1', '7', '', '22', '1', '', '', '', '', '', '', '1', '1', '', '');
INSERT INTO `jiudian` VALUES ('17', '12', 'www', '1', '', '', '', '1', '', '', '', '', '', '', '1', '1', '', '');
INSERT INTO `jiudian` VALUES ('18', '12', 'rr', '23', '7', '1', '22', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `jiudian` VALUES ('19', '12', 'eee', '1', '7', '', '22', '1', '', '', '', '', '', '', '1', '0', '', '');
INSERT INTO `jiudian` VALUES ('20', '12', '', '1', '7', '', '22', '0', '', '', '', '', '', '', '0', '0', '', '');
INSERT INTO `jiudian` VALUES ('21', '12', 'asaasa', '1', '7', '', '22', '1', '', '', '', '', '', '', '1', '1', '', '');
INSERT INTO `jiudian` VALUES ('22', '12', 'ssssss', '1', '7', '', '22', '0', '', '', '', '', '', '', '0', '0', '', '');
INSERT INTO `jiudian` VALUES ('23', '12', 'ddddddddddd', '1', '7', '', '22', '1', '', '', '', '', '', '', '1', '11', '', '');
INSERT INTO `jiudian` VALUES ('24', '12', 'ccc', '1', '7', '1', '22', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `jiudian` VALUES ('25', '12', '', '0', '', '', '22', '0', '', '', '', '', '', '', '0', '0', '', '');
INSERT INTO `jiudian` VALUES ('26', '12', 'rrrrr', '0', '', '', '', '0', '', '', '', '', '', '', '0', '0', '', '');
INSERT INTO `jiudian` VALUES ('27', '31', 'fffffff', '0', '', '', '', '0', '', '', '', '', '', '', '0', '0', '', '');
INSERT INTO `jiudian` VALUES ('28', '31', 'bbbb', '0', '', '', '', '0', '', '', '', '', '', '', '0', '0', '', '');
