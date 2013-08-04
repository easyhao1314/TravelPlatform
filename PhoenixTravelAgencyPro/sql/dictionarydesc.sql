/*
Navicat MySQL Data Transfer

Source Server         : localhost_3301
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : fenghuang

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-08-04 15:15:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dictionarydesc`
-- ----------------------------
DROP TABLE IF EXISTS `dictionarydesc`;
CREATE TABLE `dictionarydesc` (
  `dicNo` int(11) NOT NULL AUTO_INCREMENT,
  `dicName` varchar(100) DEFAULT NULL COMMENT '����',
  `dicHelp` varchar(200) DEFAULT NULL COMMENT '����˵��',
  `dicSortNo` int(11) DEFAULT NULL COMMENT '��ʾ˳��',
  `dicDesc` varchar(200) DEFAULT NULL COMMENT '˵��',
  `dicType` int(11) DEFAULT NULL COMMENT '1����ʿ-�ó������ֵ� 2����ͨ-�˳������ֵ�3�����-�ͱ��ֵ�ά��\r\n            4�����-�ͱ��ֵ�ά�� 5�����-�ͱ��ֵ�ά�� 6������-���������ֵ�\r\n            7������-���������ֵ�� ������չ',
  PRIMARY KEY (`dicNo`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='��Ŀ�ֵ��';

-- ----------------------------
-- Records of dictionarydesc
-- ----------------------------
INSERT INTO `dictionarydesc` VALUES ('1', '单订房', '', null, '', '1');
INSERT INTO `dictionarydesc` VALUES ('2', '单订车', null, null, null, '1');
INSERT INTO `dictionarydesc` VALUES ('3', '确定', null, null, null, '2');
INSERT INTO `dictionarydesc` VALUES ('4', '80%', null, null, null, '2');
INSERT INTO `dictionarydesc` VALUES ('5', '已报价', null, null, null, '3');
INSERT INTO `dictionarydesc` VALUES ('6', '已下单', null, null, null, '3');
INSERT INTO `dictionarydesc` VALUES ('7', 'VIP会员', null, null, null, '4');
INSERT INTO `dictionarydesc` VALUES ('8', '初级合作', null, null, null, '4');
INSERT INTO `dictionarydesc` VALUES ('9', '人民币', null, null, null, '5');
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
INSERT INTO `dictionarydesc` VALUES ('30', '烛光晚餐', null, null, null, '24');
INSERT INTO `dictionarydesc` VALUES ('31', '东京', null, null, null, '8');
INSERT INTO `dictionarydesc` VALUES ('32', '单团', null, null, null, '25');
INSERT INTO `dictionarydesc` VALUES ('33', '散拼', null, null, null, '25');
INSERT INTO `dictionarydesc` VALUES ('34', '注册资金以下20万', null, null, null, '26');
INSERT INTO `dictionarydesc` VALUES ('35', '注册资金以下40万', null, null, null, '26');
INSERT INTO `dictionarydesc` VALUES ('36', '白金（采购5-10万）', null, null, null, '27');
INSERT INTO `dictionarydesc` VALUES ('37', '白银（采购1-2万）', null, null, null, '27');
INSERT INTO `dictionarydesc` VALUES ('38', '11', '11', '1', '11', '32');
INSERT INTO `dictionarydesc` VALUES ('39', '1111', '1', '0', '2', '4');
INSERT INTO `dictionarydesc` VALUES ('44', '4', null, '0', '333', '13');
INSERT INTO `dictionarydesc` VALUES ('45', '2', '', '0', '', '4');
INSERT INTO `dictionarydesc` VALUES ('46', '2', '', '0', '', '4');
INSERT INTO `dictionarydesc` VALUES ('47', '1', '', '0', '', '4');
INSERT INTO `dictionarydesc` VALUES ('48', '1', '', '0', '', '4');
INSERT INTO `dictionarydesc` VALUES ('49', '22', '22', '0', '22', '4');
INSERT INTO `dictionarydesc` VALUES ('50', '22', '22', '0', '2', '4');
INSERT INTO `dictionarydesc` VALUES ('53', '4', '4', '0', '4', '26');
INSERT INTO `dictionarydesc` VALUES ('55', '地接社', null, null, null, '28');
INSERT INTO `dictionarydesc` VALUES ('56', '外事办', null, null, null, '28');
INSERT INTO `dictionarydesc` VALUES ('60', '东北', null, '0', '哈尔滨', '6');
INSERT INTO `dictionarydesc` VALUES ('61', 'VIP', null, null, null, '29');
INSERT INTO `dictionarydesc` VALUES ('62', '非VIP', null, null, null, '29');
