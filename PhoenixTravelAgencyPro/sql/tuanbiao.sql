/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:34:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tuanbiao`
-- ----------------------------
DROP TABLE IF EXISTS `tuanbiao`;
CREATE TABLE `tuanbiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment` datetime DEFAULT NULL COMMENT '付款日期',
  `team` varchar(100) DEFAULT NULL COMMENT '团号ID',
  `suppliers` varchar(100) DEFAULT NULL COMMENT '供应商ID',
  `caozuo` varchar(100) DEFAULT NULL COMMENT '操作',
  `xiaoshou` varchar(100) DEFAULT NULL COMMENT '销售人员',
  `caiwuid` int(11) DEFAULT NULL COMMENT '财务id',
  `zhanghaoid` int(11) DEFAULT NULL COMMENT '账号id',
  `shenfenid` int(11) DEFAULT NULL COMMENT '身份id',
  `chutuantime` datetime DEFAULT NULL COMMENT '出团时间',
  `huituantime` datetime DEFAULT NULL COMMENT '回团日期',
  `yingshou` double DEFAULT NULL COMMENT '应收',
  `yishou` double DEFAULT NULL COMMENT '已收',
  `yifu` double DEFAULT NULL COMMENT '已付',
  `tuikuan` double DEFAULT NULL COMMENT '退款',
  `fanyong` double DEFAULT NULL COMMENT '返佣',
  `yujilirun` double DEFAULT NULL COMMENT '预计利润',
  `shijilirun` double DEFAULT NULL COMMENT '实际利润',
  `danhao` varchar(100) DEFAULT NULL COMMENT '单号',
  `fukuantime` datetime DEFAULT NULL COMMENT '付款日期',
  `yushoutime` datetime DEFAULT NULL COMMENT '预收日期',
  `huilvID` int(11) DEFAULT '1' COMMENT '汇率',
  `ykfp` int(11) DEFAULT NULL COMMENT '已开发票',
  `fpxk` int(11) DEFAULT NULL COMMENT '发票许可',
  `fuzeren` varchar(100) DEFAULT NULL COMMENT '负责人',
  `zhuangtai` int(11) DEFAULT NULL COMMENT '状态',
  `ysyfID` int(11) DEFAULT NULL COMMENT '应收款应付款统计身份',
  `khmc` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `kxsm` int(11) DEFAULT NULL COMMENT '款项说明',
  `renshu` int(11) DEFAULT NULL COMMENT '人数',
  `ddje` double DEFAULT NULL COMMENT '订单金额',
  `fankuan` double DEFAULT NULL COMMENT '返款',
  `yajin` double DEFAULT NULL COMMENT '押金',
  `cgje` double DEFAULT NULL COMMENT '采购金额',
  `cglr` double DEFAULT NULL COMMENT '采购利润',
  `zhichu` double DEFAULT NULL COMMENT '支出',
  `maoli` double DEFAULT NULL COMMENT '毛利',
  `maolilv` double DEFAULT NULL COMMENT '毛利率',
  `beizhu` varchar(100) DEFAULT NULL COMMENT '备注',
  `yfk` double DEFAULT NULL COMMENT '应付',
  `baojia` double DEFAULT NULL COMMENT '报价',
  `chengben` double DEFAULT NULL COMMENT '成本',
  `tuanduimc` varchar(100) DEFAULT NULL COMMENT '团队名称',
  `shanchu` int(11) DEFAULT NULL COMMENT '删除的身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='团队信息';

-- ----------------------------
-- Records of tuanbiao
-- ----------------------------
INSERT INTO `tuanbiao` VALUES ('1', '2013-08-04 11:26:47', '1', '11', '1', '1', '1', '1', '1', '2013-08-04 11:27:05', '2013-08-04 11:27:09', '1', '1', '1', '1', '1', '1', '1', '1', '2013-08-04 11:27:56', '2013-08-04 11:27:22', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `tuanbiao` VALUES ('2', '2013-08-04 11:28:22', '2', '2', '2', '2', '2', '2', '2', '2013-08-04 11:28:33', '2013-08-04 11:28:40', '2', '2', '2', '2', '2', '2', '2', '2', '2013-08-04 11:28:49', '2013-08-04 11:28:53', '1', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `tuanbiao` VALUES ('3', '2013-08-04 11:29:25', '3', '3', '3', '3', '3', '3', '3', '2013-08-04 11:30:49', '2013-08-04 11:30:45', '3', '3', '3', '3', '3', '3', '3', '3', '2013-08-04 11:29:49', '2013-08-04 11:29:55', '1', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3');
