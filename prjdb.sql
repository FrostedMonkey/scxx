/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : prjdb

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-08-24 12:42:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_plan
-- ----------------------------
DROP TABLE IF EXISTS `bus_plan`;
CREATE TABLE `bus_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `co_id` int(11) DEFAULT NULL,
  `plan_xh` int(11) NOT NULL COMMENT '生产编号',
  `plan_month` char(7) NOT NULL COMMENT '计划月份\n            格式为：yyyy-MM',
  `plan_num` decimal(10,1) NOT NULL COMMENT '计划产量',
  `plan_type` int(11) DEFAULT NULL COMMENT '1-白布产品 2-染色产品 3-无底色印花产品 4-有底色印花产品',
  `plan_date` date DEFAULT NULL COMMENT '计划下达日期',
  `plan_person` varchar(50) DEFAULT NULL COMMENT '计划登记人',
  `plan_status` int(11) NOT NULL COMMENT '计划状态\n            0-未下达，1-下达',
  PRIMARY KEY (`plan_id`),
  KEY `FK_Relationship_19` (`cus_id`),
  KEY `FK_Relationship_6` (`standard_id`),
  KEY `FK_Relationship_7` (`co_id`),
  CONSTRAINT `bus_plan_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `info_customer` (`cus_id`),
  CONSTRAINT `bus_plan_ibfk_2` FOREIGN KEY (`standard_id`) REFERENCES `info_standard` (`standard_id`),
  CONSTRAINT `bus_plan_ibfk_3` FOREIGN KEY (`co_id`) REFERENCES `info_color` (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='计划表';

-- ----------------------------
-- Records of bus_plan
-- ----------------------------
INSERT INTO `bus_plan` VALUES ('58', '40', '13', '1', '1', '11', '1000.0', '4', '2018-11-01', 'test', '1');

-- ----------------------------
-- Table structure for bus_process
-- ----------------------------
DROP TABLE IF EXISTS `bus_process`;
CREATE TABLE `bus_process` (
  `process_id` int(15) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `process_cus` varchar(50) NOT NULL COMMENT '格式：客户编号|客户名称',
  `process_std` varchar(100) NOT NULL COMMENT '格式：规格编号|规格名称',
  `process_color` varchar(50) NOT NULL COMMENT '格式：花色号编号|花色号名称',
  `group_num` decimal(7,1) NOT NULL COMMENT '布匹数量（米）',
  `group_date` char(20) DEFAULT NULL COMMENT '分组（投坯）时间',
  `group_person` varchar(50) DEFAULT NULL COMMENT '坯布车间登记人',
  `pretreat_num` decimal(7,1) DEFAULT NULL,
  `pretreat_date` char(20) DEFAULT NULL,
  `pretreat_person` varchar(50) DEFAULT NULL,
  `dye_num` decimal(7,1) DEFAULT NULL,
  `dye_date` char(20) DEFAULT NULL,
  `dye_person` varchar(50) DEFAULT NULL,
  `print_num` decimal(7,1) DEFAULT NULL,
  `print_date` char(20) DEFAULT NULL,
  `print_person` varchar(50) DEFAULT NULL,
  `arrange_num` decimal(7,1) DEFAULT NULL,
  `arrange_date` char(20) DEFAULT NULL,
  `arrange_person` varchar(50) DEFAULT NULL,
  `check_num` decimal(7,1) DEFAULT '0.0',
  `check_date` char(20) DEFAULT NULL,
  `check_person` varchar(50) DEFAULT NULL,
  `process_status` char(2) DEFAULT NULL COMMENT '00 未投坯\n            05 已投坯\n            10 已前处理\n            15 已染色\n            20 已印花\n            25 已整理\n            30 质检中\n            35 已质检\n            40 包装中\n            50 已包装\n            55 已部分入库\n            60 已入库\n            65 已部分交货\n            70 已交货',
  PRIMARY KEY (`process_id`),
  KEY `FK_Relationship_9` (`plan_id`),
  CONSTRAINT `bus_process_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `bus_plan` (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='生产过程表';

-- ----------------------------
-- Records of bus_process
-- ----------------------------
INSERT INTO `bus_process` VALUES ('189', '58', '13|梁伟超', '40|梁伟超', '1|黄色', '1000.0', '2018-11-01 16:21:40', 'test', '1000.0', '2018-11-01 16:22:05', 'test', '1000.0', '2018-11-01 16:22:17', 'test', '1000.0', '2018-11-01 16:22:34', 'test', '1000.0', '2018-11-01 16:22:44', null, '1000.0', '2018-11-01 16:22:58', 'test', '40');

-- ----------------------------
-- Table structure for bus_product
-- ----------------------------
DROP TABLE IF EXISTS `bus_product`;
CREATE TABLE `bus_product` (
  `product_id` int(15) NOT NULL AUTO_INCREMENT,
  `process_id` int(15) NOT NULL,
  `product_cus` varchar(50) NOT NULL,
  `product_std` varchar(100) NOT NULL,
  `process_color` varchar(50) NOT NULL,
  `product_level` char(2) NOT NULL COMMENT '表示成品质量，取值如下：\n            01：一等品\n            02：二等品\n            03：三等品\n            04：等外品',
  `product_num` decimal(7,1) NOT NULL DEFAULT '0.0',
  `product_status` char(2) NOT NULL COMMENT '30 质检中\n            35 已质检\n            40 包装中\n            50 已包装\n            55 已部分入库\n            60 已入库\n            65 已部分交货\n            70 已交货',
  PRIMARY KEY (`product_id`),
  KEY `FK_Reference_13` (`process_id`),
  CONSTRAINT `bus_product_ibfk_1` FOREIGN KEY (`process_id`) REFERENCES `bus_process` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_product
-- ----------------------------
INSERT INTO `bus_product` VALUES ('37', '189', '13|梁伟超', '40|梁伟超', '1|黄色', '01', '1000.0', '40');
INSERT INTO `bus_product` VALUES ('38', '189', '13|梁伟超', '40|梁伟超', '1|黄色', '02', '0.0', '35');
INSERT INTO `bus_product` VALUES ('39', '189', '13|梁伟超', '40|梁伟超', '1|黄色', '03', '0.0', '35');
INSERT INTO `bus_product` VALUES ('40', '189', '13|梁伟超', '40|梁伟超', '1|黄色', '04', '0.0', '35');

-- ----------------------------
-- Table structure for bus_store
-- ----------------------------
DROP TABLE IF EXISTS `bus_store`;
CREATE TABLE `bus_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(15) DEFAULT NULL,
  `store_cus` varchar(50) NOT NULL,
  `store_std` varchar(100) NOT NULL,
  `store_color` varchar(50) NOT NULL,
  `store_num` decimal(6,2) NOT NULL DEFAULT '0.00',
  `store_in_date` char(20) DEFAULT NULL,
  `store_per` varchar(50) DEFAULT NULL,
  `store_out_date` char(20) DEFAULT NULL,
  `store_out_per` varchar(50) DEFAULT NULL,
  `store_status` char(2) NOT NULL COMMENT '50 已包装\n            60 已入库\n            70 已提货',
  PRIMARY KEY (`store_id`),
  KEY `FK_Relationship_10` (`product_id`),
  CONSTRAINT `bus_store_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `bus_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_store
-- ----------------------------
INSERT INTO `bus_store` VALUES ('18', '37', '13|梁伟超', '40|梁伟超', '1|黄色', '500.00', null, null, null, null, '50');

-- ----------------------------
-- Table structure for info_color
-- ----------------------------
DROP TABLE IF EXISTS `info_color`;
CREATE TABLE `info_color` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `co_name` varchar(30) NOT NULL,
  `co_remark` varchar(500) DEFAULT NULL,
  `co_status` char(2) NOT NULL COMMENT '状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除',
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_color
-- ----------------------------
INSERT INTO `info_color` VALUES ('1', '黄色', '黄色', '55');
INSERT INTO `info_color` VALUES ('2', '红色', '红色', '55');

-- ----------------------------
-- Table structure for info_customer
-- ----------------------------
DROP TABLE IF EXISTS `info_customer`;
CREATE TABLE `info_customer` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(30) NOT NULL,
  `cus_remark` varchar(500) DEFAULT NULL,
  `cus_status` char(2) NOT NULL COMMENT '状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除',
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_customer
-- ----------------------------
INSERT INTO `info_customer` VALUES ('13', '梁伟超', '梁伟超', '22');
INSERT INTO `info_customer` VALUES ('14', '111', '111', '22');
INSERT INTO `info_customer` VALUES ('15', '112321', '3213123', '22');
INSERT INTO `info_customer` VALUES ('16', '123213', '123213', '22');

-- ----------------------------
-- Table structure for info_standard
-- ----------------------------
DROP TABLE IF EXISTS `info_standard`;
CREATE TABLE `info_standard` (
  `standard_id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_name` varchar(80) NOT NULL COMMENT '规格',
  `standard_remark` varchar(500) DEFAULT NULL,
  `standard_status` char(2) NOT NULL COMMENT '状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除',
  PRIMARY KEY (`standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='产品规格表';

-- ----------------------------
-- Records of info_standard
-- ----------------------------
INSERT INTO `info_standard` VALUES ('40', '梁伟超', '梁伟超', '55');

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `m_id` int(11) NOT NULL COMMENT '模块编号规则：一级模块编号为两位，二级模块编号为一级模块编号+两位编号，三级模块编号为二级模块编号+两位编号，以此类推。',
  `m_pid` int(11) DEFAULT NULL COMMENT '模块编号规则：一级模块编号为两位，二级模块编号为一级模块编号+两位编号，三级模块编号为二级模块编号+两位编号，以此类推。',
  `m_name` varchar(20) NOT NULL COMMENT '模块名称',
  `m_url` varchar(100) DEFAULT NULL COMMENT '模块首地址',
  `m_ismenu` smallint(6) NOT NULL,
  `m_status` char(2) NOT NULL COMMENT '状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除',
  PRIMARY KEY (`m_id`),
  KEY `FK_Relationship_18` (`m_pid`),
  CONSTRAINT `FK_Relationship_18` FOREIGN KEY (`m_pid`) REFERENCES `sys_module` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块功能表';

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('1000', null, '安全管理', '无', '1', '55');
INSERT INTO `sys_module` VALUES ('1005', '1000', '用户登录', '/safty/login_to', '0', '55');
INSERT INTO `sys_module` VALUES ('1010', '1000', '主界面', '/safty/home_to', '0', '55');
INSERT INTO `sys_module` VALUES ('1015', '1000', '用户管理', '/safty/user_to', '1', '55');
INSERT INTO `sys_module` VALUES ('1020', '1000', '角色管理', '/safty/role_to', '1', '55');
INSERT INTO `sys_module` VALUES ('1025', '1000', '密码维护', '/safty/password_to', '0', '55');
INSERT INTO `sys_module` VALUES ('1030', '1000', '安全退出', '/safty/logout_to', '0', '55');
INSERT INTO `sys_module` VALUES ('1500', null, '基础信息管理', '无', '1', '55');
INSERT INTO `sys_module` VALUES ('1505', '1500', '客户信息维护', '/info/customer_to', '1', '55');
INSERT INTO `sys_module` VALUES ('1510', '1500', '花色号维护', '/info/color_to', '1', '55');
INSERT INTO `sys_module` VALUES ('1515', '1500', '产品规格维护', '/info/standard_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2000', null, '计划管理', '无', '1', '55');
INSERT INTO `sys_module` VALUES ('2005', '2000', '计划维护', '/plan/manager_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2500', null, '生产过程管理', '无', '1', '55');
INSERT INTO `sys_module` VALUES ('2505', '2500', '坯布准备', '/process/rawcloth_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2510', '2500', '前处理', '/process/pretreatment_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2515', '2500', '染色', '/process/dye_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2520', '2500', '印花', '/process/print_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2525', '2500', '整理', '/process/arrange_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2530', '2500', '质量检验', '/process/check_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2535', '2500', '成品包装', '/process/pkg_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2540', '2500', '成品入库', '/process/store_to', '1', '55');
INSERT INTO `sys_module` VALUES ('2545', '2500', '成品出库', '/process/out_to', '1', '55');
INSERT INTO `sys_module` VALUES ('3000', null, '统计查询', '无', '1', '55');
INSERT INTO `sys_module` VALUES ('3005', '3000', '计划查询', '/query/plan_to', '1', '55');
INSERT INTO `sys_module` VALUES ('3010', '3000', '生产查询', '/query/producing_to', '1', '55');
INSERT INTO `sys_module` VALUES ('3015', '3000', '车间日报', '/query/workshop_to', '1', '55');
INSERT INTO `sys_module` VALUES ('3020', '3000', '全厂日报', '/query/company_to', '1', '55');

-- ----------------------------
-- Table structure for sys_rm
-- ----------------------------
DROP TABLE IF EXISTS `sys_rm`;
CREATE TABLE `sys_rm` (
  `m_id` int(11) NOT NULL COMMENT '模块编号规则：一级模块编号为两位，二级模块编号为一级模块编号+两位编号，三级模块编号为二级模块编号+两位编号，以此类推。',
  `ro_id` int(11) NOT NULL,
  PRIMARY KEY (`m_id`,`ro_id`),
  KEY `FK_FK_RM_REL_MODU` (`ro_id`),
  CONSTRAINT `FK_FK_RM_REL_MODU` FOREIGN KEY (`ro_id`) REFERENCES `sys_role` (`ro_id`),
  CONSTRAINT `FK_FK_RM_REL_ROLE` FOREIGN KEY (`m_id`) REFERENCES `sys_module` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rm
-- ----------------------------
INSERT INTO `sys_rm` VALUES ('1015', '1');
INSERT INTO `sys_rm` VALUES ('1020', '1');
INSERT INTO `sys_rm` VALUES ('2520', '1');
INSERT INTO `sys_rm` VALUES ('2545', '1');
INSERT INTO `sys_rm` VALUES ('3010', '1');
INSERT INTO `sys_rm` VALUES ('3015', '1');
INSERT INTO `sys_rm` VALUES ('3020', '1');
INSERT INTO `sys_rm` VALUES ('1015', '2');
INSERT INTO `sys_rm` VALUES ('1020', '2');
INSERT INTO `sys_rm` VALUES ('1505', '2');
INSERT INTO `sys_rm` VALUES ('1510', '2');
INSERT INTO `sys_rm` VALUES ('1515', '2');
INSERT INTO `sys_rm` VALUES ('2005', '2');
INSERT INTO `sys_rm` VALUES ('2505', '2');
INSERT INTO `sys_rm` VALUES ('2510', '2');
INSERT INTO `sys_rm` VALUES ('2515', '2');
INSERT INTO `sys_rm` VALUES ('2520', '2');
INSERT INTO `sys_rm` VALUES ('2525', '2');
INSERT INTO `sys_rm` VALUES ('2530', '2');
INSERT INTO `sys_rm` VALUES ('2535', '2');
INSERT INTO `sys_rm` VALUES ('2540', '2');
INSERT INTO `sys_rm` VALUES ('2545', '2');
INSERT INTO `sys_rm` VALUES ('3005', '2');
INSERT INTO `sys_rm` VALUES ('3010', '2');
INSERT INTO `sys_rm` VALUES ('3015', '2');
INSERT INTO `sys_rm` VALUES ('3020', '2');
INSERT INTO `sys_rm` VALUES ('2515', '4');
INSERT INTO `sys_rm` VALUES ('2540', '4');
INSERT INTO `sys_rm` VALUES ('1015', '13');
INSERT INTO `sys_rm` VALUES ('1020', '13');
INSERT INTO `sys_rm` VALUES ('1505', '13');
INSERT INTO `sys_rm` VALUES ('1510', '13');
INSERT INTO `sys_rm` VALUES ('1515', '13');
INSERT INTO `sys_rm` VALUES ('2005', '13');
INSERT INTO `sys_rm` VALUES ('2505', '13');
INSERT INTO `sys_rm` VALUES ('2510', '13');
INSERT INTO `sys_rm` VALUES ('2515', '13');
INSERT INTO `sys_rm` VALUES ('2520', '13');
INSERT INTO `sys_rm` VALUES ('2525', '13');
INSERT INTO `sys_rm` VALUES ('2530', '13');
INSERT INTO `sys_rm` VALUES ('2535', '13');
INSERT INTO `sys_rm` VALUES ('2540', '13');
INSERT INTO `sys_rm` VALUES ('2545', '13');
INSERT INTO `sys_rm` VALUES ('3005', '13');
INSERT INTO `sys_rm` VALUES ('3010', '13');
INSERT INTO `sys_rm` VALUES ('3015', '13');
INSERT INTO `sys_rm` VALUES ('3020', '13');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ro_id` int(11) NOT NULL,
  `ro_name` varchar(50) NOT NULL,
  `ro_remark` varchar(200) DEFAULT NULL,
  `ro_status` char(2) NOT NULL COMMENT '状态 00-未确定 22-确定 55-启用 77-禁用',
  PRIMARY KEY (`ro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员角色', '安全管理、基础信息管理11', '55');
INSERT INTO `sys_role` VALUES ('2', '开发测试角色', '仅供开发测试使用（具有全功能）', '55');
INSERT INTO `sys_role` VALUES ('3', '计划科角色', '生产计划管理', '55');
INSERT INTO `sys_role` VALUES ('4', '坯布车间角色', '坯布准备', '55');
INSERT INTO `sys_role` VALUES ('5', '前处理车间角色', '前处理', '55');
INSERT INTO `sys_role` VALUES ('6', '印染车间角色', '印染', '55');
INSERT INTO `sys_role` VALUES ('7', '整理车间角色', '整理', '55');
INSERT INTO `sys_role` VALUES ('8', '质监科角色', '质量检验', '55');
INSERT INTO `sys_role` VALUES ('9', '成品库角色', '成品入库', '55');
INSERT INTO `sys_role` VALUES ('10', '车间领导角色', '查询统计各车间生产数据和计划数据', '55');
INSERT INTO `sys_role` VALUES ('11', '厂领导角色', '不受限制的统计查询', '55');
INSERT INTO `sys_role` VALUES ('12', '测试思数据', '测试数据', '55');
INSERT INTO `sys_role` VALUES ('13', '管理梁伟超', '管理层', '55');

-- ----------------------------
-- Table structure for sys_ur
-- ----------------------------
DROP TABLE IF EXISTS `sys_ur`;
CREATE TABLE `sys_ur` (
  `u_id` varchar(20) NOT NULL,
  `ro_id` int(11) NOT NULL,
  PRIMARY KEY (`u_id`,`ro_id`),
  KEY `FK_FK_UR_REL_USER` (`ro_id`),
  CONSTRAINT `FK_FK_UR_REL_ROLE` FOREIGN KEY (`u_id`) REFERENCES `sys_user` (`u_id`),
  CONSTRAINT `FK_FK_UR_REL_USER` FOREIGN KEY (`ro_id`) REFERENCES `sys_role` (`ro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_ur
-- ----------------------------
INSERT INTO `sys_ur` VALUES ('002', '1');
INSERT INTO `sys_ur` VALUES ('1000', '1');
INSERT INTO `sys_ur` VALUES ('admin', '1');
INSERT INTO `sys_ur` VALUES ('002', '2');
INSERT INTO `sys_ur` VALUES ('test', '2');
INSERT INTO `sys_ur` VALUES ('1000', '3');
INSERT INTO `sys_ur` VALUES ('002', '4');
INSERT INTO `sys_ur` VALUES ('1000', '5');
INSERT INTO `sys_ur` VALUES ('002', '8');
INSERT INTO `sys_ur` VALUES ('1000', '8');
INSERT INTO `sys_ur` VALUES ('1000', '10');
INSERT INTO `sys_ur` VALUES ('liang', '13');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `u_id` varchar(20) NOT NULL,
  `u_name` varchar(20) NOT NULL,
  `u_pwd` varchar(20) NOT NULL,
  `u_status` char(2) NOT NULL COMMENT '状态 00-未确定 22-确定 55-启用 77-禁用 99-逻辑删除',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('002', 'chenchen', '001', '77');
INSERT INTO `sys_user` VALUES ('1000', 'ceshi02', '0001', '55');
INSERT INTO `sys_user` VALUES ('admin', 'admin', 'admin', '55');
INSERT INTO `sys_user` VALUES ('liang', '梁伟超', '123456', '55');
INSERT INTO `sys_user` VALUES ('test', 'test', 'test', '55');
