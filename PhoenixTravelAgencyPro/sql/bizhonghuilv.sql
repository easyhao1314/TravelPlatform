/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:33:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bizhonghuilv`
-- ----------------------------
DROP TABLE IF EXISTS `bizhonghuilv`;
CREATE TABLE `bizhonghuilv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bizhong` varchar(100) DEFAULT NULL COMMENT '币种ID',
  `riqi` datetime DEFAULT NULL COMMENT '日期',
  `xianjinhuilv` double DEFAULT NULL COMMENT '现金汇率',
  `gongshou` double DEFAULT NULL COMMENT '对公收款/换汇汇率',
  `zhonghang` double DEFAULT NULL COMMENT '中行折算价/基准价',
  `zuidihuilv` double DEFAULT NULL COMMENT '公司最低汇率标准',
  `huilv` double DEFAULT NULL COMMENT '汇率',
  `jianxie` varchar(100) DEFAULT NULL COMMENT '简写',
  `jianxiemingchen` varchar(100) DEFAULT NULL COMMENT '简写+全名',
  `danwei` double DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='汇率';

-- ----------------------------
-- Records of bizhonghuilv
-- ----------------------------
INSERT INTO `bizhonghuilv` VALUES ('1', '人民币(RMB)', '2013-08-04 11:57:24', '100', '100', '100', '100', '100', 'RMB', 'rmb-人民币', '100');
