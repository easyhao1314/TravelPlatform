/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:22:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `canyin`
-- ----------------------------
DROP TABLE IF EXISTS `canyin`;
CREATE TABLE `canyin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `chengshiId` int(11) DEFAULT NULL COMMENT '城市',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `lianxiren` varchar(50) DEFAULT NULL COMMENT '联系人',
  `dianhua` varchar(50) DEFAULT NULL COMMENT '电话',
  `shouji` varchar(50) DEFAULT NULL COMMENT '手机',
  `chuanzhen` varchar(50) DEFAULT NULL COMMENT '传真',
  `Email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `fkfsId` int(11) DEFAULT NULL COMMENT '付款方式',
  `hzjbId` int(11) DEFAULT NULL COMMENT '合作级别',
  `cbwu` int(11) DEFAULT NULL COMMENT '餐标五菜一汤',
  `cbliu` int(11) DEFAULT NULL COMMENT '餐标六菜一汤',
  `cbqi` int(11) DEFAULT NULL COMMENT '餐标七菜一汤',
  `cbba` int(11) DEFAULT NULL COMMENT '餐标八菜一汤',
  `yecf` int(11) DEFAULT NULL COMMENT '幼儿餐费',
  `yenlsm` varchar(200) DEFAULT NULL COMMENT '幼儿年龄说明',
  `etcf` int(11) DEFAULT NULL COMMENT '儿童餐费',
  `etcfsm` varchar(200) DEFAULT NULL COMMENT '儿童餐费说明',
  `cgczs` int(11) DEFAULT NULL COMMENT '餐馆餐桌数',
  `rnrs` int(11) DEFAULT NULL COMMENT '容纳人数',
  `mfzdsm` varchar(500) DEFAULT NULL COMMENT '免费制度说明',
  `sfxydw` int(11) DEFAULT NULL COMMENT '是否协议单位',
  `sffxdw` int(11) DEFAULT NULL COMMENT '是否付现单位',
  `beizhu` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='餐饮供应商';

-- ----------------------------
-- Records of canyin
-- ----------------------------
INSERT INTO `canyin` VALUES ('1', '12', '1', '1', '1', '1', '1', '1', '', '1', '8', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '13', '13', '1');
INSERT INTO `canyin` VALUES ('2', '31', '222', '2', '2', '2', '2', '2', '', '2', '7', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '13', '14', '2');
INSERT INTO `canyin` VALUES ('3', '12', '1', '1', '1', '1', '1', '1', '1', '1', '7', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '13', '13', '1');
INSERT INTO `canyin` VALUES ('4', '12', '1', '1', '1', '1', '1', '1', '1', '1', '8', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '13', '14', '1');
