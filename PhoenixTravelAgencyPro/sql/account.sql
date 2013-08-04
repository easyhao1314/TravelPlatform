/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fhgl

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 16:30:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receivables` varchar(100) DEFAULT NULL COMMENT '收款账号',
  `payments` varbinary(100) DEFAULT NULL COMMENT '付款账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------

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

-- ----------------------------
-- Table structure for `finance`
-- ----------------------------
DROP TABLE IF EXISTS `finance`;
CREATE TABLE `finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL COMMENT '审批状态',
  `review` int(11) DEFAULT NULL COMMENT '财务审核',
  `confirmed` int(11) DEFAULT NULL COMMENT '财务确认',
  `cashier` int(11) DEFAULT NULL COMMENT '出纳确认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finance
-- ----------------------------
INSERT INTO `finance` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `finance` VALUES ('2', '1', '2', '1', '1');
INSERT INTO `finance` VALUES ('3', '2', '2', '1', '1');
INSERT INTO `finance` VALUES ('4', '2', '2', '2', '1');
INSERT INTO `finance` VALUES ('5', '2', '2', '2', '2');
INSERT INTO `finance` VALUES ('6', null, null, '2', null);
INSERT INTO `finance` VALUES ('7', null, null, '2', null);

-- ----------------------------
-- Table structure for `fukuanfangshi`
-- ----------------------------
DROP TABLE IF EXISTS `fukuanfangshi`;
CREATE TABLE `fukuanfangshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fukuanfangshi` varchar(100) DEFAULT NULL COMMENT '付款方式名称',
  `miaoshu` varchar(100) DEFAULT NULL COMMENT '付款方式描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fukuanfangshi
-- ----------------------------
INSERT INTO `fukuanfangshi` VALUES ('3', '1212', '1212');
INSERT INTO `fukuanfangshi` VALUES ('4', '11', '111');
INSERT INTO `fukuanfangshi` VALUES ('5', '1111111', '111');
INSERT INTO `fukuanfangshi` VALUES ('6', '342332234234', '234324');

-- ----------------------------
-- Table structure for `fukuanxiang`
-- ----------------------------
DROP TABLE IF EXISTS `fukuanxiang`;
CREATE TABLE `fukuanxiang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='付款说明';

-- ----------------------------
-- Records of fukuanxiang
-- ----------------------------
INSERT INTO `fukuanxiang` VALUES ('1', '酒店');
INSERT INTO `fukuanxiang` VALUES ('2', '酒店首款');
INSERT INTO `fukuanxiang` VALUES ('3', '酒店尾款');
INSERT INTO `fukuanxiang` VALUES ('4', '合同酒店');

-- ----------------------------
-- Table structure for `shenfen`
-- ----------------------------
DROP TABLE IF EXISTS `shenfen`;
CREATE TABLE `shenfen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shenfen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='身份';

-- ----------------------------
-- Records of shenfen
-- ----------------------------
INSERT INTO `shenfen` VALUES ('1', '单团');
INSERT INTO `shenfen` VALUES ('2', '散拼');
INSERT INTO `shenfen` VALUES ('3', '计调');

-- ----------------------------
-- Table structure for `shoukuanxiang`
-- ----------------------------
DROP TABLE IF EXISTS `shoukuanxiang`;
CREATE TABLE `shoukuanxiang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='应收款';

-- ----------------------------
-- Records of shoukuanxiang
-- ----------------------------
INSERT INTO `shoukuanxiang` VALUES ('1', '团款');
INSERT INTO `shoukuanxiang` VALUES ('2', '团款收款');
INSERT INTO `shoukuanxiang` VALUES ('3', '团款尾款');
INSERT INTO `shoukuanxiang` VALUES ('4', '退款团款');

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

-- ----------------------------
-- Table structure for `weihu`
-- ----------------------------
DROP TABLE IF EXISTS `weihu`;
CREATE TABLE `weihu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(100) DEFAULT NULL COMMENT '编号',
  `xingzhi` varchar(100) DEFAULT NULL COMMENT '付款性质',
  `shouzhi` varchar(100) DEFAULT NULL COMMENT '收支类型',
  `shuoming` varchar(100) DEFAULT NULL COMMENT '费用项说明',
  `liucheng` varchar(100) DEFAULT NULL COMMENT '对应审批流程',
  `fulei` varchar(100) DEFAULT NULL COMMENT '父类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weihu
-- ----------------------------
INSERT INTO `weihu` VALUES ('5', 'erer', 'ererererere', 'erer', '3434', 'erer', '3434');
INSERT INTO `weihu` VALUES ('7', '11111', '111', '11', '11', '11', '1111');
INSERT INTO `weihu` VALUES ('11', '11111', '111', '111', '1111', '111', '1111');
INSERT INTO `weihu` VALUES ('14', '23423', '234234', '234234', '23434', '234234', '234234234');
