/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : fenghuangdb

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2013-08-11 16:50:40
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `functionmenu`
-- ----------------------------
DROP TABLE IF EXISTS `functionmenu`;
CREATE TABLE `functionmenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长列',
  `menuNo` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `meunName` varchar(100) DEFAULT NULL COMMENT '菜单名字',
  `menuType` bigint(20) DEFAULT NULL COMMENT '菜单类型',
  `imagePath` varchar(200) DEFAULT NULL COMMENT '对应图标的的路径',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父菜单id',
  `sortNo` bigint(20) DEFAULT NULL COMMENT '排序号',
  `menuPath` varchar(200) DEFAULT NULL COMMENT '菜单路径',
  PRIMARY KEY (`id`),
  KEY `FK_MenuRefMenu` (`parentId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='功能菜单';



-- ----------------------------
-- Table structure for `menupermission`
-- ----------------------------
DROP TABLE IF EXISTS `menupermission`;
CREATE TABLE `menupermission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长',
  `mpNo` varchar(50) DEFAULT NULL COMMENT '菜单权限编号',
  `mpName` varchar(100) DEFAULT NULL COMMENT '名称',
  `mpDesc` varchar(100) DEFAULT NULL,
  `functionNo` bigint(20) DEFAULT NULL COMMENT '功能编号',
  PRIMARY KEY (`id`),
  KEY `FK_FunctionMenuRefMenuPer` (`functionNo`),
  CONSTRAINT `FK_FunctionMenuRefMenuPer` FOREIGN KEY (`functionNo`) REFERENCES `functionmenu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';



-- ----------------------------
-- Table structure for `pagepermission`
-- ----------------------------
DROP TABLE IF EXISTS `pagepermission`;
CREATE TABLE `pagepermission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长',
  `ppName` varchar(100) DEFAULT NULL COMMENT '页面权限名称',
  `ppDesc` varchar(100) DEFAULT NULL,
  `ppNO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='页面权限表';

-- ----------------------------
-- Records of pagepermission
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长列',
  `roleNo` varchar(100) DEFAULT NULL COMMENT '角色编号',
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `roleDesc` varchar(100) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';


-- ----------------------------
-- Table structure for `roleandmenupermission`
-- ----------------------------
DROP TABLE IF EXISTS `roleandmenupermission`;
CREATE TABLE `roleandmenupermission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mpid` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MenuPermissionRef` (`mpid`),
  CONSTRAINT `FK_MenuPermissionRef` FOREIGN KEY (`mpid`) REFERENCES `menupermission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色权限表';



-- ----------------------------
-- Table structure for `roleandpagepermission`
-- ----------------------------
DROP TABLE IF EXISTS `roleandpagepermission`;
CREATE TABLE `roleandpagepermission` (
  `id` bigint(20) NOT NULL,
  `ppid` bigint(20) DEFAULT NULL COMMENT '页面权限id',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='脚色权限表';

-- ----------------------------
-- Records of roleandpagepermission
-- ----------------------------

-- ----------------------------
-- Table structure for `usersandrole`
-- ----------------------------
DROP TABLE IF EXISTS `usersandrole`;
CREATE TABLE `usersandrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `roleCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


