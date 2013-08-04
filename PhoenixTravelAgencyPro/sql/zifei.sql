/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:23:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zifei`
-- ----------------------------
DROP TABLE IF EXISTS `zifei`;
CREATE TABLE `zifei` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '自费节目名称',
  `feiyong` int(11) DEFAULT NULL COMMENT '费用',
  `bizhongId` int(11) DEFAULT NULL COMMENT '币种',
  `chengshiId` int(11) DEFAULT NULL COMMENT '所属城市',
  `kftimeqi` varchar(50) DEFAULT NULL COMMENT '开放时间起',
  `kftimezhi` varchar(50) DEFAULT NULL COMMENT '开放时间止',
  `timekb` int(11) DEFAULT NULL COMMENT '时间是否可变',
  `djaptime` int(11) DEFAULT NULL COMMENT '时间地接安排',
  `miaoshu` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='自费';

-- ----------------------------
-- Records of zifei
-- ----------------------------
INSERT INTO `zifei` VALUES ('1', '1', '1', '9', '12', '1', '1', '1', '1', '1');
INSERT INTO `zifei` VALUES ('2', '2', '2', '9', '31', '2', '2', '2', '2', '2');
INSERT INTO `zifei` VALUES ('3', 'www', null, null, null, null, null, null, null, null);
INSERT INTO `zifei` VALUES ('4', '222', '1', '9', '12', '8', '8', '13', '13', '222');
INSERT INTO `zifei` VALUES ('5', '刚刚', '4445', '9', '12', '早八点半', '晚八点', '13', '13', '对方的改变');
INSERT INTO `zifei` VALUES ('6', '地方', '1', '9', '12', '早八点', '晚五点', '13', '13', '');
INSERT INTO `zifei` VALUES ('7', '1122', '1', '9', '12', '早五点', '晚七点', '13', '14', '多发点');
INSERT INTO `zifei` VALUES ('8', 'ww', '1', '9', '12', '早八点', '晚五点', '13', '13', '');
INSERT INTO `zifei` VALUES ('9', 'ww', '1', '9', '12', '早八点', '晚五点', '13', '13', '丁丁');
INSERT INTO `zifei` VALUES ('10', '1122', '1', '9', '12', '早八', '晚8点', '13', '13', '时的快感');
