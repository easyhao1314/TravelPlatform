/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-07-21 16:21:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `approval`
-- ----------------------------
DROP TABLE IF EXISTS `approval`;
CREATE TABLE `approval` (
  `approvalNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批自增列',
  `shenqingDate` datetime DEFAULT NULL COMMENT '申请日期',
  `shiwu` varchar(20) DEFAULT NULL COMMENT '事物说明',
  `shenqingren` bigint(20) DEFAULT NULL COMMENT '申请人',
  `shenheren` bigint(20) DEFAULT NULL COMMENT '审核人',
  `approvalStatus` int(11) DEFAULT NULL COMMENT '审批状态',
  `shenpiDate` datetime DEFAULT NULL COMMENT '审批日期',
  `beizhu` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`approvalNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='单团散拼审批表';

-- ----------------------------
-- Records of approval
-- ----------------------------
INSERT INTO `approval` VALUES ('1', '2013-07-03 16:37:05', '事物说明', '1', '1', '1', '2013-07-09 16:37:58', 'ddddss');
INSERT INTO `approval` VALUES ('2', '2013-07-06 16:38:36', ' 事物说明', '2', '2', '0', '2013-07-10 16:39:14', 'ddd');

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

-- ----------------------------
-- Table structure for `countryarea`
-- ----------------------------
DROP TABLE IF EXISTS `countryarea`;
CREATE TABLE `countryarea` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�������Զ�����',
  `caName` varchar(100) DEFAULT NULL,
  `caDesc` varchar(100) DEFAULT NULL COMMENT '��������',
  `caType` int(11) DEFAULT NULL COMMENT '��������\r\n            1������������0����������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������ͱ�������';

-- ----------------------------
-- Records of countryarea
-- ----------------------------

-- ----------------------------
-- Table structure for `countrysettingdictionary`
-- ----------------------------
DROP TABLE IF EXISTS `countrysettingdictionary`;
CREATE TABLE `countrysettingdictionary` (
  `csdNo` varchar(50) NOT NULL COMMENT '���',
  `csdName` varchar(100) DEFAULT NULL COMMENT '����',
  `csdEnName` varchar(100) DEFAULT NULL COMMENT 'Ӣ������',
  `stateId` bigint(20) DEFAULT NULL COMMENT '������',
  `areaId` bigint(20) DEFAULT NULL COMMENT '�������',
  `csdCurrency` varchar(50) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`csdNo`),
  KEY `FK_CountryAreaRef` (`areaId`),
  KEY `FK_CountryStateRef` (`stateId`),
  CONSTRAINT `FK_CountryAreaRef` FOREIGN KEY (`areaId`) REFERENCES `countryarea` (`id`),
  CONSTRAINT `FK_CountryStateRef` FOREIGN KEY (`stateId`) REFERENCES `countrystate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ι�������';

-- ----------------------------
-- Records of countrysettingdictionary
-- ----------------------------
INSERT INTO `countrysettingdictionary` VALUES ('1', '中国', null, null, null, null);
INSERT INTO `countrysettingdictionary` VALUES ('2', '美国', null, null, null, null);
INSERT INTO `countrysettingdictionary` VALUES ('3', '韩国', null, null, null, null);
INSERT INTO `countrysettingdictionary` VALUES ('4', '日本', null, null, null, null);

-- ----------------------------
-- Table structure for `countrystate`
-- ----------------------------
DROP TABLE IF EXISTS `countrystate`;
CREATE TABLE `countrystate` (
  `id` bigint(20) NOT NULL COMMENT '�������Զ�����',
  `csName` varchar(100) DEFAULT NULL COMMENT '������',
  `csDesc` varchar(200) DEFAULT NULL COMMENT '�ݵ�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������';

-- ----------------------------
-- Records of countrystate
-- ----------------------------
INSERT INTO `countrystate` VALUES ('1', '北美洲', null);
INSERT INTO `countrystate` VALUES ('2', '非洲', null);
INSERT INTO `countrystate` VALUES ('3', '欧洲', null);

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����  �Զ�����',
  `currencyName` varchar(100) DEFAULT NULL COMMENT '��������',
  `currencyShort` varchar(50) DEFAULT NULL COMMENT '���ּ�д',
  `symbol` varchar(10) DEFAULT NULL,
  `currDesc` varchar(100) DEFAULT NULL COMMENT '����',
  `isUes` varchar(2) DEFAULT NULL COMMENT '�Ƿ�ʹ�� 0����ʹ�ã�1��ʹ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='����';

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES ('1', '人民币', 'RMB', null, '描述', '1');
INSERT INTO `currency` VALUES ('2', '美元', null, null, null, null);
INSERT INTO `currency` VALUES ('3', '欧元', null, null, null, null);
INSERT INTO `currency` VALUES ('4', '韩元', null, null, null, null);
INSERT INTO `currency` VALUES ('5', '日元', null, null, null, null);

-- ----------------------------
-- Table structure for `customerinfo`
-- ----------------------------
DROP TABLE IF EXISTS `customerinfo`;
CREATE TABLE `customerinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�������Զ�����',
  `name` varchar(100) DEFAULT NULL COMMENT '�ͻ���˾����',
  `province` bigint(20) DEFAULT NULL COMMENT '����ʡ��',
  `city` bigint(20) DEFAULT NULL COMMENT '���ڳ���',
  `contact` varchar(100) DEFAULT NULL COMMENT '��ϵ��',
  `post` varchar(100) DEFAULT NULL COMMENT 'ְλ',
  `address` varchar(100) DEFAULT NULL COMMENT '��ַ',
  `moblePhone` varchar(50) DEFAULT NULL COMMENT '�ֻ�',
  `telePhone` varchar(50) DEFAULT NULL COMMENT '����',
  `qq` varchar(50) DEFAULT NULL,
  `msn` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='�ͻ���Ϣ��';

-- ----------------------------
-- Records of customerinfo
-- ----------------------------
INSERT INTO `customerinfo` VALUES ('2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `customerinfo` VALUES ('3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '909482221@qq.con');

-- ----------------------------
-- Table structure for `dantuanxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `dantuanxinxi`;
CREATE TABLE `dantuanxinxi` (
  `tuanNO` varchar(100) NOT NULL COMMENT '�źţ����ݸ������ַ���������',
  `khId` bigint(20) DEFAULT NULL COMMENT '�ͻ�id',
  `tdczlx` varchar(50) DEFAULT NULL COMMENT '�ŶӲ�������',
  `tdm` varchar(100) DEFAULT NULL COMMENT '����',
  `tdjb` varchar(50) DEFAULT NULL COMMENT '�ŶӼ���',
  `tdzt` varchar(50) DEFAULT NULL COMMENT '�Ŷ�״̬',
  `cfrs` bigint(20) DEFAULT NULL COMMENT '��������',
  `cfts` bigint(20) DEFAULT NULL COMMENT '��������',
  `cfgj` varchar(100) DEFAULT NULL COMMENT '���ù���',
  `lyqy` bigint(20) DEFAULT NULL COMMENT '��������',
  `ctsj` datetime DEFAULT NULL COMMENT '����ʱ��',
  `htsj` datetime DEFAULT NULL COMMENT '����ʱ��',
  `xsNo` varchar(50) DEFAULT NULL COMMENT '���۱��',
  `jdNo` varchar(50) DEFAULT NULL COMMENT '�Ƶ����',
  `khjlNo` varchar(50) DEFAULT NULL COMMENT '�ͻ�������',
  `qzlx` varchar(50) DEFAULT NULL COMMENT 'ǩ֤���ͣ���������ֵ���',
  `xbqz` varchar(200) DEFAULT NULL COMMENT '���ǩ֤',
  `xbyq` varchar(200) DEFAULT NULL COMMENT '�������',
  `jdbzNo` varchar(50) DEFAULT NULL COMMENT '�Ƶ��׼�����ֶ���',
  `zcNo` varchar(50) DEFAULT NULL COMMENT '��ͱ�׼�����ֵ���',
  `zhongcNo` varchar(50) DEFAULT NULL COMMENT '�вͱ�׼�����ֶ���',
  `wcNo` varchar(50) DEFAULT NULL COMMENT '��ͱ�׼',
  `bssdNo` varchar(50) DEFAULT NULL COMMENT '��ʿ˾��',
  `cheXingNo` varchar(50) DEFAULT NULL COMMENT '����',
  `jdbjNo` varchar(50) DEFAULT NULL COMMENT '�Ƶ걨�۱�׼,���ֶ���',
  `bsbjNo` varchar(50) DEFAULT NULL COMMENT '��ʿ���۱�׼�����ֶ���',
  `ycbjNo` varbinary(50) DEFAULT NULL COMMENT '�òͱ��۱�׼,���ֶ���',
  `dybjNo` varchar(50) DEFAULT NULL COMMENT '���α��۱�׼�����ֵ���',
  `qtdjDesc` text COMMENT '�����ؽ�Ҫ��',
  `tsDesc` varchar(50) DEFAULT NULL COMMENT '����Ҫ��',
  `shenpi` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tuanNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������Ϣ';

-- ----------------------------
-- Records of dantuanxinxi
-- ----------------------------
INSERT INTO `dantuanxinxi` VALUES ('1', '3', '3', '1', '1', '1', '7', '7', '1', '1', '2013-09-01 00:00:00', '2013-09-09 00:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', null, '1', '33', 0x35332C35302C34342C35332C3535, '11', '1', '1', '1');
INSERT INTO `dantuanxinxi` VALUES ('1212', '1', '2', '2', '2', '2', '2', '2', '2', '2', '2013-07-03 00:00:00', '2013-07-04 00:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1,1', null, '1', '1', 0x31, '1', '1', '1', null);
INSERT INTO `dantuanxinxi` VALUES ('2', '1', '22', '2', '2', '2', '2', '2', '1', '1', '2013-09-01 00:00:00', '2013-05-05 00:00:00', '2', '2', '2', '2', '2', '2', '1', '2', '2', '2', '2,2', null, '2', '2', 0x32, '2', '2', '2', '1');
INSERT INTO `dantuanxinxi` VALUES ('3', '2', '1', '1', '1', '1', '1', '1', '2', '1', '2013-07-03 00:00:00', '2013-07-04 00:00:00', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1,1', null, '1', '1', 0x31, '1', '想过两天大家是否看得见时间了国际法 数据库涉及到开发技术是看见对方离开时间段副教授李款到即发的罚款聚少离多减肥是大家分了可视对讲是否坚实的', '涉及到库房尽快', null);
INSERT INTO `dantuanxinxi` VALUES ('33', '3', '3', '3', '1', '3', '3', '3', '1', '1', '2013-09-01 00:00:00', '2013-09-04 00:00:00', '3', '1', '3', '1', '3', '1', '1', '3', '1', '3', '3,3', null, '1', '33', 0x33, '3', '3', '3', '1');
INSERT INTO `dantuanxinxi` VALUES ('333', '333333', '1', '3', '1', '1', '13', '13', '1', '1', '2013-07-04 00:00:00', '2013-07-17 00:00:00', '1', '1', '1', '1', '3', '2', '1', '1', '1', '1', '12,12', null, '1', '1', 0x3132, '1', '2', '2', null);
INSERT INTO `dantuanxinxi` VALUES ('4', '4', '2', '2', '2', '2', '2', '2', '1', '1', '2013-09-01 00:00:00', '2013-06-14 00:00:00', '2', '2', '2', '2', '2', '2', '1', '2', '2', '2', '2,2', null, '2', '2', 0x32, '2', '2', '2', null);
INSERT INTO `dantuanxinxi` VALUES ('44', '4', '4', '4', '4', '4', '4', '4', '4', '2', '2013-09-01 00:00:00', '2013-05-05 00:00:00', '4', '4', '4', '4', '4', '4', '1', '4', '4', '4', '4,4', null, '4', '4', 0x3434, '4', '4', '4', '0');
INSERT INTO `dantuanxinxi` VALUES ('5', '5', '66', '5', '5', '5', '5', '5', null, null, '2013-09-01 00:00:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `dantuanxinxi` VALUES ('55', '55', '55', '55', '5', '55', '5', '5', '1', '1', '2013-09-01 00:00:00', '2013-06-11 00:00:00', '55', '55', '55', '55', '55', '55', '1', '55', '55', '55', '55,55', null, '55', '55', 0x3535, '55', '55', '55', '0');
INSERT INTO `dantuanxinxi` VALUES ('555', '55', '55', '55', '5', '55', '5', '5', '1', '1', '2013-09-01 00:00:00', '2013-06-11 00:00:00', '55', '55', '55', '55', '55', '55', '1', '55', '55', '55', '55,55', null, '55', '55', 0x3535, '55', '55', '55', null);
INSERT INTO `dantuanxinxi` VALUES ('56', null, '3', null, null, null, null, null, null, null, '2013-09-01 00:00:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `dantuanxinxi` VALUES ('66', '66', '66', '66', '66', '66', '66', '6', '1', '1', '2013-09-01 00:00:00', '2013-06-17 00:00:00', '66', '66', '66', '666', '66', '66', '1', '66', '66', '66', '66,66', null, '66', '66', 0x3636, '66', '66', '66', null);
INSERT INTO `dantuanxinxi` VALUES ('666', '66', '66', '66', '66', '66', '66', '6', '1', '1', '2013-09-01 00:00:00', '2013-06-17 00:00:00', '66', '66', '66', '666', '66', '66', '1', '66', '66', '66', '66,66', null, '66', '66', 0x3636, '66', '66', '66', null);
INSERT INTO `dantuanxinxi` VALUES ('666666666', '66', '6', '6', '6', '6', '6', '6', '2', '2', '2013-09-01 00:00:00', '2013-06-27 00:00:00', '6', '6', '6', '6', '6', '6', '3', '6', '6', '6', '6,6', null, '66', '66', 0x36, '66', '66', '66', null);
INSERT INTO `dantuanxinxi` VALUES ('7', '7', '7', '7', '7', '7', '7', '7', '1', '1', '2013-09-01 00:00:00', '2013-06-14 00:00:00', '7', '7', '7', '7', '7', '7', '1', '7', '7', '7', '7,7', null, '7', '7', 0x37, '7', '7', '7', null);
INSERT INTO `dantuanxinxi` VALUES ('8', '22', '1', '22', '3', '5', '2', '22', '11', '10', '2013-07-02 00:00:00', '2013-07-24 00:00:00', '17', '18', '19', '20', '2', '1', '22', '28', '29', '30', '25,24', null, '23', '26', 0x3237, '21', '2', '2', null);

-- ----------------------------
-- Table structure for `daoyou`
-- ----------------------------
DROP TABLE IF EXISTS `daoyou`;
CREATE TABLE `daoyou` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `guojiaId` int(11) DEFAULT NULL COMMENT '国籍（国家）',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `name2` varchar(50) DEFAULT NULL COMMENT '姓名拼音',
  `name3` varchar(50) DEFAULT NULL COMMENT '\r\n            英文名字',
  `zjlx` varchar(50) DEFAULT NULL COMMENT '证件类型',
  `zjhm` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `chengshiId` int(11) DEFAULT NULL COMMENT '常驻地（城市）',
  `dinhua` varchar(50) DEFAULT NULL COMMENT '电话',
  `lxfs1` varchar(50) DEFAULT NULL COMMENT '联系方式1',
  `lxfs2` varchar(50) DEFAULT NULL COMMENT '联系方式2',
  `lxfs3` varchar(50) DEFAULT NULL COMMENT '联系方式3',
  `email` varchar(50) DEFAULT NULL COMMENT 'Email',
  `shouji` varchar(50) DEFAULT NULL COMMENT '手机',
  `fax` varchar(50) DEFAULT NULL COMMENT 'FAX',
  `dyfy` int(11) DEFAULT NULL COMMENT '导游费用',
  `hzjbId` int(11) DEFAULT NULL COMMENT '合作级别id',
  `bz` varchar(500) DEFAULT NULL COMMENT '备注',
  `zhaopian` varchar(20) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='导游';

-- ----------------------------
-- Records of daoyou
-- ----------------------------
INSERT INTO `daoyou` VALUES ('1', '11', '1', '1', '1', '1', '1', '12', '1', '1', '1', '1', '1', '1', '1', '3', '7', '12', '1');
INSERT INTO `daoyou` VALUES ('2', '11', '2888', 'ww', 'w', 'w', 'w', '12', '1', '1', '1', '1', '3', '1', '1', '3', '7', '1', null);

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�������Զ�����',
  `departNo` varchar(20) DEFAULT NULL COMMENT '���ű��',
  `departName` varchar(100) DEFAULT NULL COMMENT '��������',
  `sortNo` bigint(20) DEFAULT NULL COMMENT '�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ű�';

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for `dictionarydesc`
-- ----------------------------
DROP TABLE IF EXISTS `dictionarydesc`;
CREATE TABLE `dictionarydesc` (
  `dicNo` varchar(50) NOT NULL COMMENT '���',
  `dicName` varchar(100) DEFAULT NULL COMMENT '����',
  `dicHelp` varchar(200) DEFAULT NULL COMMENT '����˵��',
  `dicSortNo` int(11) DEFAULT NULL COMMENT '��ʾ˳��',
  `dicDesc` varchar(200) DEFAULT NULL COMMENT '˵��',
  `dicType` int(11) DEFAULT NULL COMMENT '1����ʿ-�ó������ֵ� 2����ͨ-�˳������ֵ�3�����-�ͱ��ֵ�ά��\r\n            4�����-�ͱ��ֵ�ά�� 5�����-�ͱ��ֵ�ά�� 6������-���������ֵ�\r\n            7������-���������ֵ�� ������չ',
  PRIMARY KEY (`dicNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ŀ�ֵ��';

-- ----------------------------
-- Records of dictionarydesc
-- ----------------------------
INSERT INTO `dictionarydesc` VALUES ('1', '单订房', '', null, '', '1');
INSERT INTO `dictionarydesc` VALUES ('10', '日韩', null, null, null, '6');
INSERT INTO `dictionarydesc` VALUES ('11', '韩国', null, null, null, '7');
INSERT INTO `dictionarydesc` VALUES ('12', '首尔', null, null, null, '8');
INSERT INTO `dictionarydesc` VALUES ('13', '是', null, null, null, '9');
INSERT INTO `dictionarydesc` VALUES ('14', '否', null, null, null, '9');
INSERT INTO `dictionarydesc` VALUES ('15', '男', null, null, null, '10');
INSERT INTO `dictionarydesc` VALUES ('16', '女', null, null, null, '10');
INSERT INTO `dictionarydesc` VALUES ('17', '销售', null, null, null, '11');
INSERT INTO `dictionarydesc` VALUES ('18', '计调', null, null, null, '12');
INSERT INTO `dictionarydesc` VALUES ('19', '客户经理', null, null, null, '13');
INSERT INTO `dictionarydesc` VALUES ('2', '单订车', null, null, null, '1');
INSERT INTO `dictionarydesc` VALUES ('20', '公签', null, null, null, '14');
INSERT INTO `dictionarydesc` VALUES ('21', '导游', null, null, null, '15');
INSERT INTO `dictionarydesc` VALUES ('22', '五星', null, null, null, '16');
INSERT INTO `dictionarydesc` VALUES ('23', '豪华酒店', null, null, null, '17');
INSERT INTO `dictionarydesc` VALUES ('24', '5座轿车-司兼导', null, null, null, '18');
INSERT INTO `dictionarydesc` VALUES ('25', '司导分开', null, null, null, '19');
INSERT INTO `dictionarydesc` VALUES ('26', '豪华巴士', null, null, null, '20');
INSERT INTO `dictionarydesc` VALUES ('27', '普通小吃', null, null, null, '21');
INSERT INTO `dictionarydesc` VALUES ('28', '中式早餐', null, null, null, '22');
INSERT INTO `dictionarydesc` VALUES ('29', '自助午餐', null, null, null, '23');
INSERT INTO `dictionarydesc` VALUES ('3', '确定', null, null, null, '2');
INSERT INTO `dictionarydesc` VALUES ('30', '烛光晚餐', null, null, null, '24');
INSERT INTO `dictionarydesc` VALUES ('31', '东京', null, null, null, '8');
INSERT INTO `dictionarydesc` VALUES ('4', '80%', null, null, null, '2');
INSERT INTO `dictionarydesc` VALUES ('5', '已报价', null, null, null, '3');
INSERT INTO `dictionarydesc` VALUES ('6', '已下单', null, null, null, '3');
INSERT INTO `dictionarydesc` VALUES ('7', 'VIP会员', null, null, null, '4');
INSERT INTO `dictionarydesc` VALUES ('8', '初级合作', null, null, null, '4');
INSERT INTO `dictionarydesc` VALUES ('9', '人民币', null, null, null, '5');

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

-- ----------------------------
-- Table structure for `functionmenu`
-- ----------------------------
DROP TABLE IF EXISTS `functionmenu`;
CREATE TABLE `functionmenu` (
  `id` bigint(20) NOT NULL COMMENT '�������Զ�������',
  `menuNo` varchar(50) DEFAULT NULL COMMENT '�˵�����',
  `meunName` varchar(100) DEFAULT NULL COMMENT '�˵�����',
  `menuType` bigint(20) DEFAULT NULL COMMENT '�˵�����',
  `imagePath` varchar(200) DEFAULT NULL COMMENT '��Ӧͼ��ĵ�·��',
  `parentId` bigint(20) DEFAULT NULL COMMENT '���˵�id',
  `sortNo` bigint(20) DEFAULT NULL COMMENT '�����',
  `menuPath` varchar(200) DEFAULT NULL COMMENT '�˵�·��',
  PRIMARY KEY (`id`),
  KEY `FK_MenuRefMenu` (`parentId`),
  CONSTRAINT `FK_MenuRefMenu` FOREIGN KEY (`parentId`) REFERENCES `functionmenu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ܲ˵�';

-- ----------------------------
-- Records of functionmenu
-- ----------------------------

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

-- ----------------------------
-- Table structure for `hangkong`
-- ----------------------------
DROP TABLE IF EXISTS `hangkong`;
CREATE TABLE `hangkong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `daima` varchar(29) DEFAULT NULL COMMENT '国际航协代码',
  `name` varchar(100) DEFAULT NULL COMMENT '航空公司名称',
  `shui` float DEFAULT NULL COMMENT '税',
  `bizongId` int(11) DEFAULT NULL COMMENT '币种',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hangkong
-- ----------------------------
INSERT INTO `hangkong` VALUES ('1', '1', '1', '1', '9');
INSERT INTO `hangkong` VALUES ('2', '2', '2', '2', '9');
INSERT INTO `hangkong` VALUES ('3', '3', '3', '3', '9');
INSERT INTO `hangkong` VALUES ('4', '4', '4', '4', '9');
INSERT INTO `hangkong` VALUES ('5', '1', '1', '1', '9');
INSERT INTO `hangkong` VALUES ('6', '1', '1', '1', '9');

-- ----------------------------
-- Table structure for `hotelguestroomdictionary`
-- ----------------------------
DROP TABLE IF EXISTS `hotelguestroomdictionary`;
CREATE TABLE `hotelguestroomdictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�������Զ�����',
  `hgrdName` varchar(200) DEFAULT NULL COMMENT '����',
  `hgrdPrint` varchar(100) DEFAULT NULL COMMENT '�������',
  `hgrdDesc` varchar(100) DEFAULT NULL COMMENT 'ʹ��˵��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Ƶ�-�ͻ�����ά��';

-- ----------------------------
-- Records of hotelguestroomdictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `hotlestardictionary`
-- ----------------------------
DROP TABLE IF EXISTS `hotlestardictionary`;
CREATE TABLE `hotlestardictionary` (
  `hsdNo` varchar(50) NOT NULL COMMENT '���',
  `hsbName` varchar(100) DEFAULT NULL COMMENT '����',
  `hsbDesc` varchar(100) DEFAULT NULL,
  `hsbHelp` varchar(100) DEFAULT NULL,
  `hsbSortNo` bigint(20) DEFAULT NULL COMMENT '��ʾѭ��',
  PRIMARY KEY (`hsdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Ƶ�-�Ǽ��ֵ�ά��';

-- ----------------------------
-- Records of hotlestardictionary
-- ----------------------------
INSERT INTO `hotlestardictionary` VALUES ('1', '二星', null, null, null);
INSERT INTO `hotlestardictionary` VALUES ('2', '三星', null, null, null);
INSERT INTO `hotlestardictionary` VALUES ('3', '四星', null, null, null);
INSERT INTO `hotlestardictionary` VALUES ('4', '五星', null, null, null);

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

-- ----------------------------
-- Table structure for `kehuziyuan`
-- ----------------------------
DROP TABLE IF EXISTS `kehuziyuan`;
CREATE TABLE `kehuziyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `shuoming` varchar(200) DEFAULT NULL COMMENT '说明',
  `tishi` varchar(200) DEFAULT NULL COMMENT '帮助提示',
  `type` int(11) DEFAULT NULL COMMENT '资源类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='客户资源';

-- ----------------------------
-- Records of kehuziyuan
-- ----------------------------
INSERT INTO `kehuziyuan` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `kehuziyuan` VALUES ('2', '2', '2', '2', '2');
INSERT INTO `kehuziyuan` VALUES ('3', '3', '3', '3', '3');
INSERT INTO `kehuziyuan` VALUES ('4', '4', '4', '4', '4');
INSERT INTO `kehuziyuan` VALUES ('5', '5', '5', '5', '5');
INSERT INTO `kehuziyuan` VALUES ('6', '6', '6', '6', '6');
INSERT INTO `kehuziyuan` VALUES ('7', '2', '2', '2', '1');
INSERT INTO `kehuziyuan` VALUES ('10', '8', '8', '8', '1');
INSERT INTO `kehuziyuan` VALUES ('11', '4', '4', '4', '1');

-- ----------------------------
-- Table structure for `menupermission`
-- ----------------------------
DROP TABLE IF EXISTS `menupermission`;
CREATE TABLE `menupermission` (
  `id` bigint(20) NOT NULL COMMENT '�������Զ�����',
  `mpNo` varchar(50) DEFAULT NULL COMMENT '�˵�Ȩ�ޱ��',
  `mpName` varchar(100) DEFAULT NULL COMMENT '����',
  `mpDesc` varchar(100) DEFAULT NULL,
  `functionNo` bigint(20) DEFAULT NULL COMMENT '���ܱ��',
  PRIMARY KEY (`id`),
  KEY `FK_FunctionMenuRefMenuPer` (`functionNo`),
  CONSTRAINT `FK_FunctionMenuRefMenuPer` FOREIGN KEY (`functionNo`) REFERENCES `functionmenu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�˵�Ȩ�ޱ�';

-- ----------------------------
-- Records of menupermission
-- ----------------------------

-- ----------------------------
-- Table structure for `pagepermission`
-- ----------------------------
DROP TABLE IF EXISTS `pagepermission`;
CREATE TABLE `pagepermission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�������Զ�����',
  `ppName` varchar(100) DEFAULT NULL COMMENT 'ҳ��Ȩ������',
  `ppDesc` varchar(100) DEFAULT NULL,
  `ppNO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ҳ��Ȩ�ޱ�';

-- ----------------------------
-- Records of pagepermission
-- ----------------------------

-- ----------------------------
-- Table structure for `personalevent`
-- ----------------------------
DROP TABLE IF EXISTS `personalevent`;
CREATE TABLE `personalevent` (
  `id` bigint(20) NOT NULL COMMENT '�������Զ�����',
  `eventDesc` varchar(1000) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '�û�id',
  `eventDate` datetime DEFAULT NULL COMMENT '����ʱ��',
  `eventType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_UserPersonalEventRef` (`userid`),
  CONSTRAINT `FK_UserPersonalEventRef` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����¼���';

-- ----------------------------
-- Records of personalevent
-- ----------------------------

-- ----------------------------
-- Table structure for `provincesettingdictionary`
-- ----------------------------
DROP TABLE IF EXISTS `provincesettingdictionary`;
CREATE TABLE `provincesettingdictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '�������Զ�����',
  `pcdName` varchar(100) DEFAULT NULL COMMENT 'ʡ������',
  `pcdEnName` varchar(100) DEFAULT NULL COMMENT 'ʡ��Ӣ������',
  `pcdPinYin` varchar(100) DEFAULT NULL COMMENT 'ƴ��ȫƴ',
  `pcdJianXie` char(10) DEFAULT NULL COMMENT 'ƴ���д',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ʡ������';

-- ----------------------------
-- Records of provincesettingdictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������Զ�������',
  `roleNo` varchar(100) DEFAULT NULL COMMENT '��ɫ���',
  `roleName` varchar(100) DEFAULT NULL COMMENT '��ɫ����',
  `roleDesc` varchar(100) DEFAULT NULL COMMENT '��ɫ����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫ��';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `roleandmenupermission`
-- ----------------------------
DROP TABLE IF EXISTS `roleandmenupermission`;
CREATE TABLE `roleandmenupermission` (
  `id` bigint(20) NOT NULL,
  `mpid` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MenuPermissionRef` (`mpid`),
  CONSTRAINT `FK_MenuPermissionRef` FOREIGN KEY (`mpid`) REFERENCES `menupermission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫȨ�ޱ�';

-- ----------------------------
-- Records of roleandmenupermission
-- ----------------------------

-- ----------------------------
-- Table structure for `roleandpagepermission`
-- ----------------------------
DROP TABLE IF EXISTS `roleandpagepermission`;
CREATE TABLE `roleandpagepermission` (
  `id` bigint(20) NOT NULL,
  `ppid` bigint(20) DEFAULT NULL COMMENT 'ҳ��Ȩ��id',
  `roleId` bigint(20) DEFAULT NULL COMMENT '��ɫid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫȨ�ޱ�';

-- ----------------------------
-- Records of roleandpagepermission
-- ----------------------------

-- ----------------------------
-- Table structure for `teamprogressstatedictionary`
-- ----------------------------
DROP TABLE IF EXISTS `teamprogressstatedictionary`;
CREATE TABLE `teamprogressstatedictionary` (
  `tpsdNo` varchar(50) NOT NULL COMMENT '���',
  `tpsdName` varchar(100) DEFAULT NULL COMMENT '����',
  `tpsdDesc` varchar(200) DEFAULT NULL COMMENT '˵��',
  `tpsdHelp` varchar(200) DEFAULT NULL COMMENT '���� ��ʾ',
  `tpsdSort` bigint(20) DEFAULT NULL COMMENT '��ʾ˳�� ',
  PRIMARY KEY (`tpsdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Ŷӽ�չ״̬�ֵ�';

-- ----------------------------
-- Records of teamprogressstatedictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userNumber` varchar(50) DEFAULT NULL COMMENT '�û��ı�ţ��������ͨ������������ ',
  `userName` varchar(100) DEFAULT NULL COMMENT '�û���',
  `loginName` varchar(100) DEFAULT NULL COMMENT '��½��',
  `enName` varchar(100) DEFAULT NULL COMMENT 'Ӣ����',
  `sex` varchar(2) DEFAULT NULL COMMENT '�Ա�  1���У�0��Ů',
  `telephone` varchar(100) DEFAULT NULL COMMENT '���� �绰',
  `birthday` datetime DEFAULT NULL COMMENT '�������� ',
  `telephoneExt` varchar(100) DEFAULT NULL COMMENT '�����ֻ���',
  `email` varchar(100) DEFAULT NULL COMMENT '�û���email ',
  `mobilePhone` varchar(100) DEFAULT NULL COMMENT '�ֻ���',
  `msn` varchar(20) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `msn2` varchar(50) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `msn3` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL COMMENT '��˾id���͹�˾�������',
  `departmentId` bigint(20) DEFAULT NULL COMMENT '����id���Ͳ��ű������',
  `jobDescription` varchar(200) DEFAULT NULL COMMENT 'ְλ����',
  `sortNumber` bigint(20) DEFAULT NULL COMMENT 'Ա�������',
  `address` varchar(100) DEFAULT NULL COMMENT '��ַ',
  `zip` varchar(20) DEFAULT NULL COMMENT '�ʱ�',
  `remark` varchar(500) DEFAULT NULL COMMENT '����',
  `imagePath` varchar(300) DEFAULT NULL COMMENT '����ͼƬ��·��',
  `password` varchar(100) DEFAULT NULL COMMENT '�û��ĵ�½����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û����������¼�û���Ϣ��';

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `weihu`
-- ----------------------------
DROP TABLE IF EXISTS `weihu`;
CREATE TABLE `weihu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(100) DEFAULT NULL,
  `xingzhi` varchar(100) DEFAULT NULL,
  `shouzhi` varchar(100) DEFAULT NULL,
  `shuoming` varchar(100) DEFAULT NULL,
  `liucheng` varchar(100) DEFAULT NULL,
  `fulei` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weihu
-- ----------------------------
INSERT INTO `weihu` VALUES ('1', '1', '1', '1', '1', '1', '1');
INSERT INTO `weihu` VALUES ('7', '3', '33', '3', '3', '3', '3');
INSERT INTO `weihu` VALUES ('8', '1', '45', '2', '5', '3', '6');
INSERT INTO `weihu` VALUES ('9', '', '22', '2', '22', '2', '2');
INSERT INTO `weihu` VALUES ('10', '', '2', '2', '2', '2', '2');
INSERT INTO `weihu` VALUES ('11', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `yaoqinghan`
-- ----------------------------
DROP TABLE IF EXISTS `yaoqinghan`;
CREATE TABLE `yaoqinghan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `guoduid` int(11) DEFAULT NULL COMMENT '国度（国家）',
  `miaoshu` varchar(500) DEFAULT NULL COMMENT '描述',
  `chengben` varchar(200) DEFAULT NULL COMMENT '成本',
  `bizhongId` int(11) DEFAULT NULL COMMENT '币种',
  `shiyongid` int(11) DEFAULT NULL COMMENT '是否使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='邀请函成本维护';

-- ----------------------------
-- Records of yaoqinghan
-- ----------------------------
INSERT INTO `yaoqinghan` VALUES ('1', '12', '1', '4', '9', '13');
INSERT INTO `yaoqinghan` VALUES ('2', '31', '2', '5', '9', '14');
INSERT INTO `yaoqinghan` VALUES ('3', '12', '鹅鹅鹅饿饿', '3', '9', '13');

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
