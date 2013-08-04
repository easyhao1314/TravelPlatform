/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:22:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dijie`
-- ----------------------------
DROP TABLE IF EXISTS `dijie`;
CREATE TABLE `dijie` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `ywname` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `chengshiId` int(11) DEFAULT NULL COMMENT '城市Id',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `hzjbId` int(11) DEFAULT NULL COMMENT '合作级别Id',
  `lianxiren` varchar(50) DEFAULT NULL COMMENT '联系人\r\n            ',
  `dianhua` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `shouji` varchar(50) DEFAULT NULL COMMENT '手机',
  `chuanzhen` varchar(50) DEFAULT NULL COMMENT '传真',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `skype` varchar(50) DEFAULT NULL COMMENT 'SKYPE',
  `msn` varchar(50) DEFAULT NULL COMMENT 'MSN',
  `yahoo` varchar(50) DEFAULT NULL COMMENT 'YAHOO',
  `wangzhi` varchar(100) DEFAULT NULL COMMENT '网址',
  `kaihu` varchar(100) DEFAULT NULL COMMENT '代理人开户银',
  `dlrzh` varchar(100) DEFAULT NULL COMMENT '代理人账号',
  `yhdz` varchar(200) DEFAULT NULL COMMENT '银行地址',
  `skrzh` varchar(100) DEFAULT NULL COMMENT '收款人账号',
  `skrxm` varchar(50) DEFAULT NULL COMMENT '收款人姓名',
  `skrdz` varchar(200) DEFAULT NULL COMMENT '收款人地址',
  `ywqyId` int(11) DEFAULT NULL COMMENT '业务覆盖区域Id（洲）',
  `djsms` varchar(500) DEFAULT NULL COMMENT '地接社描述',
  `xjb` varchar(500) DEFAULT NULL COMMENT '性价比',
  `youshi` varchar(500) DEFAULT NULL COMMENT '优势',
  `bz` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='地接供应商';

-- ----------------------------
-- Records of dijie
-- ----------------------------
INSERT INTO `dijie` VALUES ('1', '1', '1', '12', '1', '8', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', null, null, null, null, null, '2');
INSERT INTO `dijie` VALUES ('2', '2', '2', '31', '2', '7', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '4', '4', '4', '4', '4', '2');
INSERT INTO `dijie` VALUES ('3', '2', '2', '31', '2', '8', 'ww', '2', '2', 'w', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2');
