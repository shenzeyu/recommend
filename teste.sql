/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : teste

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-03-06 15:30:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for advertise
-- ----------------------------
DROP TABLE IF EXISTS `advertise`;
CREATE TABLE `advertise` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '广告id',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `subject` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `pic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `place_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `place` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 'c' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  `is_good_type_id` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '是否关联商品类型【父类频道页面广告位】',
  `area_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `area_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advertise_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of advertise
-- ----------------------------
INSERT INTO `advertise` VALUES ('E7F3D170EB31F170E8D269C14ACC51DF', 'AD201306250001', 'log', 0x3C503E266E6273703B3C2F503E0A3C503E266E6273703B3C2F503E0A3C503E266E6273703B3C2F503E0A3C503E266E6273703B3C2F503E, '8BE9306DB19F5BE961C18FD5750B5EA4', '/pic/AdvertisePic/20130625/8BE9306DB19F5BE961C18FD5750B5EA4.jpg', null, 'LOG', null, null, '1', 'admin', '2013-06-25 00:00:00', null, null, '2013-06-25 08:55:27', 'c', '', '', null, null);

-- ----------------------------
-- Table structure for apply_to_cash
-- ----------------------------
DROP TABLE IF EXISTS `apply_to_cash`;
CREATE TABLE `apply_to_cash` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `to_cash_amount` decimal(18,2) DEFAULT NULL,
  `bank_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `account_holder` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `handler_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `handler_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `dept_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of apply_to_cash
-- ----------------------------
INSERT INTO `apply_to_cash` VALUES ('D268DAA42782DB802E4D56AA3AC2697E', 'D59F75F037977E98C25A7B6469EAA68B', '罗平1', '100.00', '中国工商', '罗平', '430703199140524896321', '', null, null, null, null, 'D59F75F037977E98C25A7B6469EAA68B', null, '2012-01-03 15:10:30', null, null, null, 'c');

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '地区id',
  `parent_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '父亲id',
  `code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '地区编码',
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '地区名称',
  `level` int(11) DEFAULT NULL COMMENT '层级 1:一级 2:二级  3:三级',
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `area_id` (`id`),
  KEY `area_code` (`code`),
  KEY `area_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地区';

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('08BB7CB9A9A22FC6F44A492EB567F9EB', 'D48CF659D93EDCDFE691C6A1E6F1023B', 'DQ010301', '武汉市', '3', '13', '1', 'admin', '2011-10-09 17:36:51', '1', 'admin', '2011-10-09 17:37:59', 's');
INSERT INTO `area` VALUES ('1E01499922ACE0EF9148E6CF3893308E', '394C3BE7E3080599F14431A208FB8710', 'DQ01010103', '越秀区', '4', '6', '1', 'admin', '2011-10-09 17:33:53', null, null, null, 's');
INSERT INTO `area` VALUES ('227E1F08A9BFED9B1D424F51874E3606', '70C1FF219A4CF241B77524186524AFC1', 'DQ01030301', '黄冈区', '4', '20', '1', 'admin', '2012-03-03 17:05:45', null, null, null, 's');
INSERT INTO `area` VALUES ('26E8B8B9E643E94AAAE016E1B6C44DB1', 'CDE18151F90FFFEB2B0660CDD5E9AFEB', 'DQ0101', '广东省', '2', '1', '1', 'admin', '2011-09-19 17:30:09', null, null, null, 's');
INSERT INTO `area` VALUES ('28385F6832FF317B46FCA2038A92710C', '26E8B8B9E643E94AAAE016E1B6C44DB1', 'DQ010103', '东莞', '3', '22', '1', 'admin', '2013-01-30 13:23:57', null, null, null, 's');
INSERT INTO `area` VALUES ('2FC26597C54C0B93CA90187603B60E56', '394C3BE7E3080599F14431A208FB8710', 'DQ01010104', '白云区', '4', '7', '1', 'admin', '2011-10-09 17:34:05', null, null, null, 's');
INSERT INTO `area` VALUES ('36D5DB8F82E7F497A9D3556F0B42718B', '9949D9FCE10D753A2BFEC497563E0EF2', 'DQ010204', '衡阳市', '3', '16', '1', 'admin', '2012-02-29 13:32:09', null, null, null, 's');
INSERT INTO `area` VALUES ('394C3BE7E3080599F14431A208FB8710', '26E8B8B9E643E94AAAE016E1B6C44DB1', 'DQ010101', '广州市', '3', '3', '1', 'admin', '2011-09-19 17:33:44', null, null, null, 's');
INSERT INTO `area` VALUES ('577D77D7A90A25BD8D668E4DAFA5F40C', '394C3BE7E3080599F14431A208FB8710', 'DQ01010115', '天河区', '4', '23', '1', 'admin', '2013-01-29 20:47:50', null, null, null, 's');
INSERT INTO `area` VALUES ('58E382BB8B614A6ECDD9DDAEAD840009', '66315D63751E1928E122720538F66AFE', 'DQ01010201', '沙龙区', '4', '18', '1', 'admin', '2012-03-03 17:04:43', null, null, null, 's');
INSERT INTO `area` VALUES ('66315D63751E1928E122720538F66AFE', '26E8B8B9E643E94AAAE016E1B6C44DB1', 'DQ010102', '深圳市', '3', '9', '1', 'admin', '2011-10-09 17:35:02', null, null, null, 's');
INSERT INTO `area` VALUES ('70C1FF219A4CF241B77524186524AFC1', 'D48CF659D93EDCDFE691C6A1E6F1023B', 'DQ010303', '黄冈市', '3', '15', '1', 'admin', '2011-10-09 17:37:37', null, null, null, 's');
INSERT INTO `area` VALUES ('7F4B7609B6B4A36D02903BE6F9E7380E', '9949D9FCE10D753A2BFEC497563E0EF2', 'DQ010202', '株洲市', '3', '10', '1', 'admin', '2011-10-09 17:36:06', '1', 'admin', '2011-10-09 17:37:46', 's');
INSERT INTO `area` VALUES ('857C8D5027F62D1FD06BF21819C636F9', '9949D9FCE10D753A2BFEC497563E0EF2', 'DQ010201', '长沙市', '3', '8', '1', 'admin', '2011-10-09 17:34:50', null, null, null, 's');
INSERT INTO `area` VALUES ('9949D9FCE10D753A2BFEC497563E0EF2', 'CDE18151F90FFFEB2B0660CDD5E9AFEB', 'DQ0102', '湖南省', '2', '2', '1', 'admin', '2011-09-19 17:31:29', null, null, null, 's');
INSERT INTO `area` VALUES ('9F0D6CA186B4AAC4111012A0C1D4F286', '08BB7CB9A9A22FC6F44A492EB567F9EB', 'DQ01030101', '江口区', '4', '19', '1', 'admin', '2012-03-03 17:05:22', null, null, null, 's');
INSERT INTO `area` VALUES ('A0A869F73C214090EEF653DE73F998BF', '857C8D5027F62D1FD06BF21819C636F9', 'DQ01020101', '岳麓区', '4', '21', '1', 'admin', '2012-03-03 17:06:06', null, null, null, 's');
INSERT INTO `area` VALUES ('C4A5A7A7055A5F0FBEF7FF9FBC15F8E4', 'D48CF659D93EDCDFE691C6A1E6F1023B', 'DQ010302', '荆州市', '3', '14', '1', 'admin', '2011-10-09 17:37:01', '1', 'admin', '2011-10-09 17:38:05', 's');
INSERT INTO `area` VALUES ('CDE18151F90FFFEB2B0660CDD5E9AFEB', '', 'DQ01', '中国', '1', '0', '1', 'admin', '2011-09-19 17:18:04', null, null, null, 's');
INSERT INTO `area` VALUES ('D48CF659D93EDCDFE691C6A1E6F1023B', 'CDE18151F90FFFEB2B0660CDD5E9AFEB', 'DQ0103', '湖北省', '2', '12', '1', 'admin', '2011-10-09 17:36:38', null, null, null, 's');
INSERT INTO `area` VALUES ('DB32918724AE74C48A17B1A0AE0CC2F0', '36D5DB8F82E7F497A9D3556F0B42718B', 'DQ01020401', '衡南县', '4', '17', '1', 'admin', '2012-02-29 13:36:49', null, null, null, 's');
INSERT INTO `area` VALUES ('DDE998A57CE27CEF2E83BEE0C8F968D2', '9949D9FCE10D753A2BFEC497563E0EF2', 'DQ010203', '怀化市', '3', '11', '1', 'admin', '2011-10-09 17:36:27', '1', 'admin', '2011-10-09 17:37:53', 's');
INSERT INTO `area` VALUES ('F1395901B6874A819B2DC1E0FC9BC282', '394C3BE7E3080599F14431A208FB8710', 'DQ01010119', '黄浦区', '4', '22', '1', 'admin', '2013-01-29 21:01:01', null, null, null, 's');

-- ----------------------------
-- Table structure for bank_account
-- ----------------------------
DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `account` varchar(32) DEFAULT NULL,
  `money` decimal(18,2) DEFAULT NULL,
  `account_holder` varchar(32) DEFAULT NULL,
  `bank` varchar(128) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `bank_account_id` (`id`),
  KEY `bank_account_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_account
-- ----------------------------
INSERT INTO `bank_account` VALUES ('1DE6A2DA900F17C564C339C050890FC3', 'cash', '现金', '现金', '225874.00', '无', '无', '', '1', 'admin', '2011-09-21 14:42:17', '', '', null, 's');
INSERT INTO `bank_account` VALUES ('5024679FB2A36AC90E2713B421825341', '01', '转账', '4569236598856213', null, '而', '而', '娃儿', '1', 'admin', '2013-04-12 11:21:47', '', '', null, 's');
INSERT INTO `bank_account` VALUES ('EF1FF3B6F9F569D67892327C3C78520C', 'gs', '网上银行', '6388239239282837', '200322.01', '李四', '天府路支行', '支付货款用', '1', 'admin', '2011-09-21 14:41:10', '', '', null, 's');

-- ----------------------------
-- Table structure for browse
-- ----------------------------
DROP TABLE IF EXISTS `browse`;
CREATE TABLE `browse` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `state` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `good_name` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `good_pic` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `good_price` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of browse
-- ----------------------------
INSERT INTO `browse` VALUES ('084F25290406C69EB63C7EEBC6713847', 'A57C594647AA70524E089F495DD5BD19', 'CAFCEFC45E06F771DE0DC20DD7F60C1D', '2013-06-01 16:45:25', null, '新款贴皮苹果iphone4手机壳iphone4s手机壳iphone4外壳4代配件潮', '/pic/Good/20130529/BDD8B62CA52A8CF06B3CE774BC3BEA8C.jpg', '10');
INSERT INTO `browse` VALUES ('160338F06F4AB2758A3B35E2558EEA64', '6094FF4D3B6D06258A442CDE6B97A8D6', '10D4D386D2058D089857902C636A3A76', '2016-02-19 21:46:58', null, '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '/pic/Good/20130529/907B42609D7DCE00F1491F1ABEF596AA.jpg', '299');
INSERT INTO `browse` VALUES ('1DBE11FD0C90EB74C5AF3FE9D64D9790', '6094FF4D3B6D06258A442CDE6B97A8D6', 'C7A867F54327A355FAC7204CC1509992', '2016-02-19 21:42:39', null, 'MacBook Air笔记本电脑Pro配件HDMI转接线TV苹果高清线电视转接线', '/pic/Good/20130529/218F524114B7EE878E0D96358E2723F6.jpg', '78');
INSERT INTO `browse` VALUES ('20B36E46F4106CBDF314BD1613DABF82', '0111', 'A1461B2408974E05BAA2D9AEB942AC99', '2013-07-31 15:27:32', null, '小米2s手机保护壳小米2手机保护壳 手机壳小米2s配件M2保护套包邮', '/pic/Good/20130529/8FF9FA67B1A5E18F4D98016AC1A54C0C.jpg', '0');
INSERT INTO `browse` VALUES ('50F4B6C1A90130648CD33FBE2A25BB26', 'A57C594647AA70524E089F495DD5BD19', '352AAA65A4ABD234548388103F997858', '2013-06-01 16:31:02', null, '酷奇 数码产品清洁套装 笔记本电脑 液晶电视屏幕清洁剂 数码配件', '/pic/Good/20130529/E18C6DCDB90874746D688C66C095AAC7.jpg', '19');
INSERT INTO `browse` VALUES ('892E6A411CA59ECE84C41A56847159E2', '64A9B48C2F520698498B8EDE9B182CAF', 'C7A867F54327A355FAC7204CC1509992', '2016-02-19 15:57:42', null, 'MacBook Air笔记本电脑Pro配件HDMI转接线TV苹果高清线电视转接线', '/pic/Good/20130529/218F524114B7EE878E0D96358E2723F6.jpg', '78');
INSERT INTO `browse` VALUES ('98AC6BED087481639A43E704E355BF03', '64A9B48C2F520698498B8EDE9B182CAF', '0E1CDDD8CD9B22019119D80452312CDD', '2016-02-19 15:56:33', null, '小米2s手机保护壳 配件 小米2手机保护壳 手机壳小米2 手机 后盖', '/pic/Good/20130529/7BF2244E325D22D9E263FDE70B073CFD.jpg', '0');
INSERT INTO `browse` VALUES ('B19D33D06EA3CEF1386DF55B196A61E7', 'A57C594647AA70524E089F495DD5BD19', '10D4D386D2058D089857902C636A3A76', '2013-06-01 16:30:53', null, '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '/pic/Good/20130529/907B42609D7DCE00F1491F1ABEF596AA.jpg', '299');
INSERT INTO `browse` VALUES ('C15ACD7195ED663CD7EE0F2331C40551', '0111', '0E1CDDD8CD9B22019119D80452312CDD', '2013-07-31 15:25:19', null, '小米2s手机保护壳 配件 小米2手机保护壳 手机壳小米2 手机 后盖', '/pic/Good/20130529/7BF2244E325D22D9E263FDE70B073CFD.jpg', '28');
INSERT INTO `browse` VALUES ('DCD2B38B4D543F8BAFD75637EA37A301', 'A57C594647AA70524E089F495DD5BD19', 'C7A867F54327A355FAC7204CC1509992', '2013-06-01 16:31:11', null, 'MacBook Air笔记本电脑Pro配件HDMI转接线TV苹果高清线电视转接线', '/pic/Good/20130529/218F524114B7EE878E0D96358E2723F6.jpg', '78');
INSERT INTO `browse` VALUES ('DF55FCA5EF8C65C218D20C36F2141992', '6094FF4D3B6D06258A442CDE6B97A8D6', '352AAA65A4ABD234548388103F997858', '2016-02-19 21:42:47', null, '酷奇 数码产品清洁套装 笔记本电脑 液晶电视屏幕清洁剂 数码配件', '/pic/Good/20130529/E18C6DCDB90874746D688C66C095AAC7.jpg', '19');
INSERT INTO `browse` VALUES ('F9247FFCC0893DB8F5B63F9EE404BA88', '64A9B48C2F520698498B8EDE9B182CAF', 'CAFCEFC45E06F771DE0DC20DD7F60C1D', '2016-02-23 22:26:34', null, 'Java核心技术（卷1）：基础知识（原书第9版） [Core Java Volume I—Fundamentals (Ninth Edition)]', '/pic/Good/20160221/95132C043036A001D6D8BEC3AD561164.jpg', null);

-- ----------------------------
-- Table structure for browse_buy
-- ----------------------------
DROP TABLE IF EXISTS `browse_buy`;
CREATE TABLE `browse_buy` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_name` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `good_price` decimal(18,0) DEFAULT NULL,
  `good_pic` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `good_type_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_type_name` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `buy_number` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of browse_buy
-- ----------------------------

-- ----------------------------
-- Table structure for browse_others
-- ----------------------------
DROP TABLE IF EXISTS `browse_others`;
CREATE TABLE `browse_others` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_name` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `good_price` decimal(18,2) DEFAULT NULL,
  `good_pic` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `good_type_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_type_name` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `click_number` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of browse_others
-- ----------------------------

-- ----------------------------
-- Table structure for cash_item
-- ----------------------------
DROP TABLE IF EXISTS `cash_item`;
CREATE TABLE `cash_item` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `bank_account_code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `account` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `money` decimal(18,2) DEFAULT NULL,
  `account_holder` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cash_item
-- ----------------------------

-- ----------------------------
-- Table structure for combined
-- ----------------------------
DROP TABLE IF EXISTS `combined`;
CREATE TABLE `combined` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0:组合单1:拆分单',
  `warehouse_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ware_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ware_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ware_count` int(11) DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of combined
-- ----------------------------

-- ----------------------------
-- Table structure for combined_ware
-- ----------------------------
DROP TABLE IF EXISTS `combined_ware`;
CREATE TABLE `combined_ware` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ware_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ware_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ware_count` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`order_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`order_id`) REFERENCES `combined` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of combined_ware
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` varchar(32) NOT NULL,
  `type` varchar(32) DEFAULT NULL COMMENT '0: 普通会员    1:联盟店会员  2:企业会员',
  `name` varchar(64) DEFAULT NULL,
  `card_number` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `account` varchar(32) DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `payables` decimal(18,2) DEFAULT NULL,
  `vip_level_id` varchar(32) DEFAULT NULL,
  `vip_level_name` varchar(64) DEFAULT NULL,
  `credits` decimal(18,0) DEFAULT NULL,
  `company_name` varchar(128) DEFAULT NULL,
  `company_address` varchar(128) DEFAULT NULL,
  `linkman` varchar(64) DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `area_ids` varchar(128) DEFAULT NULL,
  `area_names` varchar(256) DEFAULT NULL,
  `street` varchar(256) DEFAULT NULL,
  `zip_code` varchar(8) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `warehouse_Id` varchar(64) DEFAULT NULL,
  `warehouse_Name` varchar(64) DEFAULT NULL,
  `maritalstatus` varchar(50) DEFAULT NULL COMMENT '婚姻状况',
  `schooling` varchar(50) DEFAULT NULL COMMENT '受教育程度',
  `salary` varchar(50) DEFAULT NULL COMMENT '月收入',
  `is_pinlessmobile` varchar(1) DEFAULT NULL COMMENT '是否绑定手机  0未绑定   1已绑定',
  `is_pinlessemail` varchar(1) DEFAULT NULL COMMENT '是否绑定邮箱   0为绑定  1已绑定',
  `pic` varchar(500) DEFAULT NULL,
  `pic_id` varchar(500) DEFAULT NULL,
  `id_card` varchar(30) DEFAULT NULL,
  `card_endtime` date DEFAULT NULL,
  `card_address` varchar(50) DEFAULT NULL,
  `inner_picId` varchar(500) DEFAULT NULL,
  `inner_pic` varchar(500) DEFAULT NULL,
  `inner_name` varchar(64) DEFAULT NULL,
  `inner_area` varchar(1) DEFAULT NULL,
  `inner_introduce` varchar(500) DEFAULT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`uid`),
  KEY `customer_id` (`id`),
  KEY `customer_area_id` (`area_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('0111', null, null, null, '123', null, null, '123', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 's', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `customer` VALUES ('64A9B48C2F520698498B8EDE9B182CAF', '0', 'dallas', null, 'dallas', null, null, '123456', '0.00', null, null, '0', null, null, null, null, null, '', null, null, null, null, null, null, null, '2016-02-19 15:15:51', null, null, null, 's', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, '2');
INSERT INTO `customer` VALUES ('6094FF4D3B6D06258A442CDE6B97A8D6', '0', 'dallas110', null, 'dallas110', null, null, '123456', '0.00', null, null, '0', null, null, null, null, null, 'test@test.com', null, null, null, null, null, null, null, '2016-02-19 21:26:32', null, null, null, 's', null, null, null, null, null, '0', '0', null, null, null, null, null, null, null, null, null, null, '3');

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE `customer_address` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `zip_code` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `is_default` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否是默认地址',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `areaRegion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `whether_ordrer` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of customer_address
-- ----------------------------
INSERT INTO `customer_address` VALUES ('3555115B88BF2087D5E0AEDA6253CA2F', 'A57C594647AA70524E089F495DD5BD19', 'yan', '13526998588', '广东省-广州市-天河区', '202020', null, null, 'xxx', null, '020-12569852', '1');
INSERT INTO `customer_address` VALUES ('80110C9D76AB0231C8EC85E9F5E91C9F', '0111', '123', '13698745621', '天津-北辰-北辰', '524101', null, null, 'wlkejfldsaf', null, '020-25478411', '0');
INSERT INTO `customer_address` VALUES ('8D14C8D46243ADA30CBD41069D1CD61C', 'BCC8A9130BD201DDD396E77D95C27729', '何前锋', '13642356987', '广东省-广州市-白云区', '422012', null, null, '1qu', null, null, '1');
INSERT INTO `customer_address` VALUES ('9D5A8CE1BA3582534EB5AB67066D51DC', 'A57C594647AA70524E089F495DD5BD19', '8888', '13569856236', '台湾-桃园-桃园', '767676', null, null, 'ooooooo', null, '202-36985623', '0');
INSERT INTO `customer_address` VALUES ('BF2421B039D381616360EC9589CFD14C', '47A9792A8B7AB1563E4B7A99567C849B', 'wioe', '13767895647', '广东省-广州市-白云区', '345678', null, null, 'jdeer', null, '324234', '0');
INSERT INTO `customer_address` VALUES ('CD71AF1537273B8843BFA36277CE4C32', '5763DB389F94706D5FF2A425D42902EC', '刘勇', '13512345678', '湖南省-长沙市-岳麓区', '123456', null, null, '洞天福地0111', null, null, '1');
INSERT INTO `customer_address` VALUES ('D32431AC219B9FF3856F22A87D97913A', 'C8DC43A1E70F67C8B984996538DB1DD4', '刘勇', '15817032702', '湖南省-长沙市-岳麓区', '441500', null, null, '15415411111', null, null, '1');
INSERT INTO `customer_address` VALUES ('D6DFF19C35389715E7000A9DB6F65540', '48655591CFBC31B536BA070A2FC88DA4', '张光三', '18922744668', '广东省-广州市-天河区', '510650', null, null, '中山大道230号', null, null, '1');
INSERT INTO `customer_address` VALUES ('E27D4DC774141C9AB4715DDE56CFB0FC', '999E4D23BFEDA7A540B34628C1D15C9C', '陈军', '13711219353', '广东省-广州市-天河区', '510000', null, null, '黄村', null, null, '0');
INSERT INTO `customer_address` VALUES ('F3697492B1F194F4D01BE45048E4E7AE', '47A9792A8B7AB1563E4B7A99567C849B', 'xxx', '13569887569', '广东省-广州市-天河区', '202020', null, null, 'xxxxxxx', null, '11111', '1');
INSERT INTO `customer_address` VALUES ('F8BD61FC98A77D91B24FDBF56DD03E9A', 'A57C594647AA70524E089F495DD5BD19', '11111', '13562986532', '北京-朝阳-朝阳-', '020202', '1', null, '020202', null, null, null);

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `delivery_fee` decimal(18,2) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `delivery_id` (`id`),
  KEY `delivery_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES ('3493A80ACD622FAC33CDB708C3CC4B9B', 'A01', '物流', '0.10', '啊啊', '1', 'admin', '2013-01-30 13:13:24', '', '', null, 's');
INSERT INTO `delivery` VALUES ('5D3FD9FCEE2AB84586590C15AEFF9624', 'A02', '公司配送', '0.10', '0.2', '1', 'admin', '2013-01-30 13:15:52', '', '', null, 's');
INSERT INTO `delivery` VALUES ('A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0.20', 'ieo', '1', 'admin', '2013-01-30 13:16:29', '', '', null, 's');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL,
  `creator_name` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier_id` varchar(32) DEFAULT NULL,
  `modifier_name` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('0D2DCCC1967C6BE08FB6FD892EF33E70', 'xs', '销售部', '1', 'admin', '2012-02-22 17:05:52', '1', 'admin', '2012-04-09 18:21:11', 's');
INSERT INTO `department` VALUES ('0EE07A96BAB47E9434CDF1401FA76807', 'gl', '管理部', '1', 'admin', '2012-02-22 16:01:18', '', '', null, 's');
INSERT INTO `department` VALUES ('1', 'kh', '客服部', '1', 'admin', '2012-02-22 12:05:37', '1', 'admin', '2012-02-22 15:51:50', 's');
INSERT INTO `department` VALUES ('343598FA71083CE6D938BDBDE9744593', 'cg', '采购部', '1', 'admin', '2012-02-22 17:06:24', '', '', null, 's');
INSERT INTO `department` VALUES ('7D5885FC18123639C42CEE719FCD2868', 'tg', '推广部', '1', 'admin', '2012-02-22 17:05:19', '', '', null, 's');
INSERT INTO `department` VALUES ('872B350AF7B93B9731908C9D85AD5704', 'rs', '人事部', '1', 'admin', '2012-04-09 15:29:54', '', '', null, 's');
INSERT INTO `department` VALUES ('C45C82002FA8C2A4341B50E9763D8263', 'ck', '仓库部', '1', 'admin', '2012-02-22 15:51:24', '', '', null, 's');
INSERT INTO `department` VALUES ('D855CF90BFF20C15C715AE266281FA60', 'cw', '财务部', '1', 'admin', '2012-02-22 17:06:10', '', '', null, 's');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;提交d:删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `AK_dictionary_i_code` (`code`),
  KEY `dictionary_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据字典';

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('96BA661840AC70BFF1D6B445FB2EA278', '001', '费用', '1', 'c');
INSERT INTO `dictionary` VALUES ('D47BB7F8C9AC56D70D5D74344F85A79B', '003', '测试', '1001', 'c');

-- ----------------------------
-- Table structure for dictionary_item
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_item`;
CREATE TABLE `dictionary_item` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `dictionary_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dictionary_item_id` (`id`),
  KEY `dictionary_item_dictionary_id` (`dictionary_id`),
  CONSTRAINT `FK_dictionary_item_dictionary` FOREIGN KEY (`dictionary_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典项';

-- ----------------------------
-- Records of dictionary_item
-- ----------------------------
INSERT INTO `dictionary_item` VALUES ('23F532A481DB0DCC56837811587B330E', '96BA661840AC70BFF1D6B445FB2EA278', '001', '费用', '1');
INSERT INTO `dictionary_item` VALUES ('D400E9A7015EC675A96A0D887534694C', '96BA661840AC70BFF1D6B445FB2EA278', '5122', '经营费用', '11111');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `favorite_id` (`id`),
  KEY `favorite_good_id` (`good_id`),
  KEY `favorite_creator_id` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('3E6C589B012C7C74B517D295C1F40C20', '0E1CDDD8CD9B22019119D80452312CDD', '小米2s手机保护壳 配件 小米2手机保护壳 手机壳小米2 手机 后盖', 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-05-30 15:03:06');
INSERT INTO `favorite` VALUES ('6C49053F354C29CE297A28075CAAE45F', 'A3ED6A46B57F318380FB0E56B9E056AE', '001普', 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-03-25 10:11:56');
INSERT INTO `favorite` VALUES ('8BC6C3C3B0DAED6BA3354A9692325A4E', '4DE562655D5C7D0BE7DBF2012DB2FF0A', '皇冠空调02', 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-05-30 15:03:02');

-- ----------------------------
-- Table structure for file_upload
-- ----------------------------
DROP TABLE IF EXISTS `file_upload`;
CREATE TABLE `file_upload` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '文件id',
  `app_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '业务id',
  `app_type` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `postfix` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '文件后缀',
  `original_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `relative_path` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_upload_id` (`id`),
  KEY `file_upload_app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文件';

-- ----------------------------
-- Records of file_upload
-- ----------------------------
INSERT INTO `file_upload` VALUES ('0351B2BE08708340CCED334BAA861EAD', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/0351B2BE08708340CCED334BAA861EAD.jpg');
INSERT INTO `file_upload` VALUES ('03FD79BAEB06152A3C25B084802EA7E9', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/03FD79BAEB06152A3C25B084802EA7E9.jpg');
INSERT INTO `file_upload` VALUES ('044C845A0E7B2DA7C1D73FE6C9F62985', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', '2013_3_29_19_46_7_8680.jpg', '/pic/GoodAlbum/20130413/044C845A0E7B2DA7C1D73FE6C9F62985.jpg');
INSERT INTO `file_upload` VALUES ('0488003A2AC81AB82F3577E02708A78F', null, 'GoodBrand', '2013-02-22 00:00:00', 'jpg', '6.jpg', '/pic/GoodBrand/20130222/0488003A2AC81AB82F3577E02708A78F.jpg');
INSERT INTO `file_upload` VALUES ('04C2BD61EA64B8796FB494FFC5FB5B23', null, 'Good', '2013-02-25 00:00:00', 'jpg', '130_2.jpg', '/pic/Good/20130225/04C2BD61EA64B8796FB494FFC5FB5B23.jpg');
INSERT INTO `file_upload` VALUES ('058A2ECEC126E966FA622E5E3C15E7D0', 'A1461B2408974E05BAA2D9AEB942AC99', 'Good', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/Good/20160220/058A2ECEC126E966FA622E5E3C15E7D0.jpg');
INSERT INTO `file_upload` VALUES ('05C20CC86EBCF3914745BBB595482AB4', 'E7F3D170EB31F170E8D269C14ACC51DF', 'AdvertisePic', '2013-06-25 00:00:00', 'jpg', 'logo2.jpg', '/pic/AdvertisePic/20130625/05C20CC86EBCF3914745BBB595482AB4.jpg');
INSERT INTO `file_upload` VALUES ('062B2F4FA9E5696E290DC176CDDCCADE', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/062B2F4FA9E5696E290DC176CDDCCADE.jpg');
INSERT INTO `file_upload` VALUES ('080EF4BA976D408C67B0E942EE9F0546', null, 'AdvertisePic', '2013-02-23 00:00:00', 'jpg', 'a22.jpg', '/pic/AdvertisePic/20130223/080EF4BA976D408C67B0E942EE9F0546.jpg');
INSERT INTO `file_upload` VALUES ('08E947C8357679FA298B6FE18E5DF09F', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/08E947C8357679FA298B6FE18E5DF09F.jpg');
INSERT INTO `file_upload` VALUES ('0A2E5C0BE4CF7EBC15E181E5730C2D38', 'D52DF3A08B067EA8F8E7EB04B655FBF6', 'goodType', '2013-02-22 00:00:00', 'jpg', 't.jpg', '/pic/goodType/20130222/0A2E5C0BE4CF7EBC15E181E5730C2D38.jpg');
INSERT INTO `file_upload` VALUES ('0ADACC2A239121422C2955ECCB214C16', null, 'GoodSpecificationVal', '2013-05-27 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodSpecificationVal/20130527/0ADACC2A239121422C2955ECCB214C16.jpg');
INSERT INTO `file_upload` VALUES ('0B24425AA713207B39C70AD3237232BA', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/0B24425AA713207B39C70AD3237232BA.jpg');
INSERT INTO `file_upload` VALUES ('0F49C5674A5C4B997D6CCC3059560A3F', null, 'GoodSpecificationVal', '2013-05-27 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodSpecificationVal/20130527/0F49C5674A5C4B997D6CCC3059560A3F.jpg');
INSERT INTO `file_upload` VALUES ('0F6C08FDEFA96841A262E3C87F5652A0', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '1-1.jpg', '/pic/Customer/20130323/0F6C08FDEFA96841A262E3C87F5652A0.jpg');
INSERT INTO `file_upload` VALUES ('0FEED9E6FCFF02CF5F3D34E441561430', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/0FEED9E6FCFF02CF5F3D34E441561430.jpg');
INSERT INTO `file_upload` VALUES ('10187BE12DCAE6DD6ACEF6B96DD87356', null, 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T23bYkXgpbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130529/10187BE12DCAE6DD6ACEF6B96DD87356.jpg');
INSERT INTO `file_upload` VALUES ('1172CA246803373116D41C0398AC1915', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/1172CA246803373116D41C0398AC1915.jpg');
INSERT INTO `file_upload` VALUES ('12076FF50A6C2AB3C551B37B694BD1A7', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/12076FF50A6C2AB3C551B37B694BD1A7.jpg');
INSERT INTO `file_upload` VALUES ('17610F8CDC51E1422F136EF3C0D1E0F2', 'C7A867F54327A355FAC7204CC1509992', 'Good', '2016-02-21 00:00:00', 'jpg', 'O\'Reilly：Head First Java（中文版 第2版 涵盖Java5.0）.jpg', '/pic/Good/20160221/17610F8CDC51E1422F136EF3C0D1E0F2.jpg');
INSERT INTO `file_upload` VALUES ('177BC5F3A3A7B3C790099A4D5AC4B291', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Desert.jpg', '/pic/Good/20130413/177BC5F3A3A7B3C790099A4D5AC4B291.jpg');
INSERT INTO `file_upload` VALUES ('17AE8D3775241D4B0D2F12ED4875C65D', null, 'AdvertisePic', '2013-03-23 00:00:00', 'jpg', '01.jpg', '/pic/AdvertisePic/20130323/17AE8D3775241D4B0D2F12ED4875C65D.jpg');
INSERT INTO `file_upload` VALUES ('188E8E0A7ED1E7DBA42538B81A82BFF4', 'C7A867F54327A355FAC7204CC1509992', 'Good', '2016-02-21 00:00:00', 'jpg', 'O\'Reilly：Head First Java（中文版 第2版 涵盖Java5.0）.jpg', '/pic/Good/20160221/188E8E0A7ED1E7DBA42538B81A82BFF4.jpg');
INSERT INTO `file_upload` VALUES ('18BC76CD97D27819ED4A7413FB5B50CF', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/18BC76CD97D27819ED4A7413FB5B50CF.jpg');
INSERT INTO `file_upload` VALUES ('1C0B30E024AAD2A14AB79ED48EB4DED2', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_1.jpg', '/pic/Customer/20130323/1C0B30E024AAD2A14AB79ED48EB4DED2.jpg');
INSERT INTO `file_upload` VALUES ('1D51E66542AA4A59705F33A18D4303FE', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2O4DFXjpaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/1D51E66542AA4A59705F33A18D4303FE.jpg');
INSERT INTO `file_upload` VALUES ('218F524114B7EE878E0D96358E2723F6', 'C7A867F54327A355FAC7204CC1509992', 'Good', '2013-05-29 00:00:00', 'jpg', 'T1RHhLXvdiXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/Good/20130529/218F524114B7EE878E0D96358E2723F6.jpg');
INSERT INTO `file_upload` VALUES ('24A439439ED5D4D648779E63B9D7484A', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Penguins.jpg', '/pic/Good/20130413/24A439439ED5D4D648779E63B9D7484A.jpg');
INSERT INTO `file_upload` VALUES ('24A5FAC18CC4FB3A526D83FDD5D7470C', 'CAFCEFC45E06F771DE0DC20DD7F60C1D', 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T1fSCNXzVbXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/GoodAlbum/20130529/24A5FAC18CC4FB3A526D83FDD5D7470C.jpg');
INSERT INTO `file_upload` VALUES ('256611E5309FD39DE299D6315C45F7FA', null, 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T2ouvDXoXXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130529/256611E5309FD39DE299D6315C45F7FA.jpg');
INSERT INTO `file_upload` VALUES ('28C7791461F1F73105B6ED7FBC7A6995', null, 'Customer', '2013-05-31 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Customer/20130531/28C7791461F1F73105B6ED7FBC7A6995.jpg');
INSERT INTO `file_upload` VALUES ('28DCE7783E4D765F3A64EE3ACD1F2006', null, 'Good', '2013-04-17 00:00:00', 'jpg', 'Koala.jpg', '/pic/Good/20130417/28DCE7783E4D765F3A64EE3ACD1F2006.jpg');
INSERT INTO `file_upload` VALUES ('29424EF25A6C87B95C82FD43C3C5E9B3', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/29424EF25A6C87B95C82FD43C3C5E9B3.jpg');
INSERT INTO `file_upload` VALUES ('297161602AEED29ECEDE86412C56CED2', null, 'GoodAlbum', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/GoodAlbum/20160220/297161602AEED29ECEDE86412C56CED2.jpg');
INSERT INTO `file_upload` VALUES ('2B470E711128F38B790A226AB35508C9', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '1-5.jpg', '/pic/Customer/20130323/2B470E711128F38B790A226AB35508C9.jpg');
INSERT INTO `file_upload` VALUES ('2C3FA26CD793F773446FF2EA0BB68735', null, 'GoodSpecificationVal', '2013-05-27 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodSpecificationVal/20130527/2C3FA26CD793F773446FF2EA0BB68735.jpg');
INSERT INTO `file_upload` VALUES ('2D98E7CC337613DC93528FEBF8BF1F65', null, 'Good', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/Good/20160220/2D98E7CC337613DC93528FEBF8BF1F65.jpg');
INSERT INTO `file_upload` VALUES ('2DE9767956A1FB80CF7171DA3CFF7819', null, 'Good', '2013-02-22 00:00:00', 'jpg', '130_3.jpg', '/pic/Good/20130222/2DE9767956A1FB80CF7171DA3CFF7819.jpg');
INSERT INTO `file_upload` VALUES ('2F12E2CD8AFB42E6E5AC91C788D103BA', null, 'AdvertisePic', '2013-04-13 00:00:00', 'jpg', 'Tulips.jpg', '/pic/AdvertisePic/20130413/2F12E2CD8AFB42E6E5AC91C788D103BA.jpg');
INSERT INTO `file_upload` VALUES ('304BB5E36A2E4BC0D9A3DEA3B0210336', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/304BB5E36A2E4BC0D9A3DEA3B0210336.jpg');
INSERT INTO `file_upload` VALUES ('317246454FFD9CDD7AA004B37A35BF5E', null, 'Good', '2013-02-22 00:00:00', 'jpg', '130_7.jpg', '/pic/Good/20130222/317246454FFD9CDD7AA004B37A35BF5E.jpg');
INSERT INTO `file_upload` VALUES ('32570A562C2552A2DB2C6FD7A102AE48', null, 'Ware', '2013-06-01 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130601/32570A562C2552A2DB2C6FD7A102AE48.jpg');
INSERT INTO `file_upload` VALUES ('3500EF6D037698F82692480683E4FE16', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', 'u=442913618,3801160223&fm=23&gp=0.jpg', '/pic/GoodAlbum/20130413/3500EF6D037698F82692480683E4FE16.jpg');
INSERT INTO `file_upload` VALUES ('35444DA1501B4944C4FDBD06128CBD64', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/35444DA1501B4944C4FDBD06128CBD64.jpg');
INSERT INTO `file_upload` VALUES ('35A8C0C5311EAB7D9F630174976FD353', null, 'GoodSpecificationVal', '2013-05-27 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodSpecificationVal/20130527/35A8C0C5311EAB7D9F630174976FD353.jpg');
INSERT INTO `file_upload` VALUES ('36A2DD730FA0E06DC8F6B2A55A043D91', null, 'GoodAlbum', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/GoodAlbum/20160220/36A2DD730FA0E06DC8F6B2A55A043D91.jpg');
INSERT INTO `file_upload` VALUES ('36E32EA24C3BFC24FD1C834BDFAC47D8', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/36E32EA24C3BFC24FD1C834BDFAC47D8.jpg');
INSERT INTO `file_upload` VALUES ('3754FC167D7FAD025F48F696DA2473E9', null, 'GoodBrand', '2013-05-30 00:00:00', 'gif', '105.gif', '/pic/GoodBrand/20130530/3754FC167D7FAD025F48F696DA2473E9.gif');
INSERT INTO `file_upload` VALUES ('3871A323D27FA7674C6AB7F123DD5190', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/3871A323D27FA7674C6AB7F123DD5190.jpg');
INSERT INTO `file_upload` VALUES ('38E94FA0B7182122F3AA3660D22D949B', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '1-6.jpg', '/pic/Customer/20130323/38E94FA0B7182122F3AA3660D22D949B.jpg');
INSERT INTO `file_upload` VALUES ('3A368B31ECC14D24AEDAF0D55C524DC6', null, 'Good', '2013-02-22 00:00:00', 'jpg', '130_7.jpg', '/pic/Good/20130222/3A368B31ECC14D24AEDAF0D55C524DC6.jpg');
INSERT INTO `file_upload` VALUES ('3AE99857AB9C9DA4638BD833EE2735E0', null, 'GoodSpecificationVal', '2013-05-28 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodSpecificationVal/20130528/3AE99857AB9C9DA4638BD833EE2735E0.jpg');
INSERT INTO `file_upload` VALUES ('3AEE5C1EB7E681CA275D8ADD20891FAC', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/3AEE5C1EB7E681CA275D8ADD20891FAC.jpg');
INSERT INTO `file_upload` VALUES ('3BA61AA8276B177D1273FB9A64DFCCF3', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_2.jpg', '/pic/Customer/20130323/3BA61AA8276B177D1273FB9A64DFCCF3.jpg');
INSERT INTO `file_upload` VALUES ('3C49919A16F6F8861E64AF821EC9D7E3', null, 'Ware', '2013-06-01 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130601/3C49919A16F6F8861E64AF821EC9D7E3.jpg');
INSERT INTO `file_upload` VALUES ('3E8DEEF693236E385FCC19E27AFB7B97', null, 'GoodSpecificationVal', '2013-05-28 00:00:00', 'jpg', 'T2ouvDXoXXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodSpecificationVal/20130528/3E8DEEF693236E385FCC19E27AFB7B97.jpg');
INSERT INTO `file_upload` VALUES ('3EB318C72656322F0072003416F62F04', null, 'Good', '2013-02-22 00:00:00', 'jpg', '130_7.jpg', '/pic/Good/20130222/3EB318C72656322F0072003416F62F04.jpg');
INSERT INTO `file_upload` VALUES ('3F6ADF64F8B605E2A54C4FAF1402FEB3', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Tulips.jpg', '/pic/Good/20130413/3F6ADF64F8B605E2A54C4FAF1402FEB3.jpg');
INSERT INTO `file_upload` VALUES ('41B5668BA5C888FC9EDB1A0EB96FE29A', null, 'GoodBrand', '2013-05-30 00:00:00', 'gif', '105.gif', '/pic/GoodBrand/20130530/41B5668BA5C888FC9EDB1A0EB96FE29A.gif');
INSERT INTO `file_upload` VALUES ('41CDFE69BDD875A2865C9D6F90B38586', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', '2013_3_29_18_57_9_8232.jpg', '/pic/GoodAlbum/20130413/41CDFE69BDD875A2865C9D6F90B38586.jpg');
INSERT INTO `file_upload` VALUES ('44320A25595808A74EC808624D14F7B4', null, 'Good', '2013-05-27 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130527/44320A25595808A74EC808624D14F7B4.jpg');
INSERT INTO `file_upload` VALUES ('4538B0DD3EDB4AAA37564E96DB567757', null, 'AdvertisePic', '2013-04-13 00:00:00', 'jpg', 'Koala.jpg', '/pic/AdvertisePic/20130413/4538B0DD3EDB4AAA37564E96DB567757.jpg');
INSERT INTO `file_upload` VALUES ('47F15266AF0CF111649286D21EAC5BB1', null, 'Customer', '2013-03-23 00:00:00', 'jpg', 'a16.jpg', '/pic/Customer/20130323/47F15266AF0CF111649286D21EAC5BB1.jpg');
INSERT INTO `file_upload` VALUES ('488F2E597C7027B50EFB9D60177682F0', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/488F2E597C7027B50EFB9D60177682F0.jpg');
INSERT INTO `file_upload` VALUES ('4A433F17DC674322DD212FD0631F9619', '352AAA65A4ABD234548388103F997858', 'Good', '2016-02-21 00:00:00', 'jpg', '疯狂Java讲义（第3版 附光盘）.jpg', '/pic/Good/20160221/4A433F17DC674322DD212FD0631F9619.jpg');
INSERT INTO `file_upload` VALUES ('4BB86F36D43C87761764113F6CA89A72', null, 'Good', '2013-05-27 00:00:00', 'jpg', 'T23bYkXgpbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130527/4BB86F36D43C87761764113F6CA89A72.jpg');
INSERT INTO `file_upload` VALUES ('4BDEE6BC38B8E2DFC0DA83317789FA1F', 'A1461B2408974E05BAA2D9AEB942AC99', 'Good', '2016-02-21 00:00:00', 'jpg', '软件开发视频大讲堂：Java从入门到精通（第3版 附光盘）.jpg', '/pic/Good/20160221/4BDEE6BC38B8E2DFC0DA83317789FA1F.jpg');
INSERT INTO `file_upload` VALUES ('4C9DC7DA97BD6730E7FF0016F941D789', null, 'GoodAlbum', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/GoodAlbum/20160220/4C9DC7DA97BD6730E7FF0016F941D789.jpg');
INSERT INTO `file_upload` VALUES ('4E32C7BC8C83636D22DD7C46FA68D23D', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Tulips.jpg', '/pic/Good/20130413/4E32C7BC8C83636D22DD7C46FA68D23D.jpg');
INSERT INTO `file_upload` VALUES ('4F1E00944D87967C8543FC3CB7435E29', null, 'AdvertisePic', '2013-02-23 00:00:00', 'jpg', 'a23.jpg', '/pic/AdvertisePic/20130223/4F1E00944D87967C8543FC3CB7435E29.jpg');
INSERT INTO `file_upload` VALUES ('4F6E170BF15E8EFB2138C80ED7392A84', 'DF616139DA54062B9DB2E2E603C4F190', 'goodType', '2013-02-22 00:00:00', 'jpg', 'r.jpg', '/pic/goodType/20130222/4F6E170BF15E8EFB2138C80ED7392A84.jpg');
INSERT INTO `file_upload` VALUES ('510F106F8BA44A5FA5EDAAD4E87526CE', null, 'Good', '2013-03-05 00:00:00', 'jpg', 'cpxq_1.jpg', '/pic/Good/20130305/510F106F8BA44A5FA5EDAAD4E87526CE.jpg');
INSERT INTO `file_upload` VALUES ('514D94294AAD56EC7CFF81A0F864BDDA', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/514D94294AAD56EC7CFF81A0F864BDDA.jpg');
INSERT INTO `file_upload` VALUES ('516F0AE09B43844ED481ABF36FF17819', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/516F0AE09B43844ED481ABF36FF17819.jpg');
INSERT INTO `file_upload` VALUES ('5258931E24A998D98E9BE70D6B2E6583', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/5258931E24A998D98E9BE70D6B2E6583.jpg');
INSERT INTO `file_upload` VALUES ('5464268F88AC7581BBBF2B4807F11BCB', null, 'GoodBrand', '2013-02-22 00:00:00', 'jpg', '25.jpg', '/pic/GoodBrand/20130222/5464268F88AC7581BBBF2B4807F11BCB.jpg');
INSERT INTO `file_upload` VALUES ('554799B7E9474639741A6B488EA864C2', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/554799B7E9474639741A6B488EA864C2.jpg');
INSERT INTO `file_upload` VALUES ('561558491D67D8618B4F477947B651DD', null, 'Good', '2013-02-22 00:00:00', 'jpg', '130_1.jpg', '/pic/Good/20130222/561558491D67D8618B4F477947B651DD.jpg');
INSERT INTO `file_upload` VALUES ('56A19E823D386390FD022BEA18AC9A18', null, 'Good', '2013-03-04 00:00:00', 'jpg', 'cpxq_1.jpg', '/pic/Good/20130304/56A19E823D386390FD022BEA18AC9A18.jpg');
INSERT INTO `file_upload` VALUES ('5881D4C6111121D79656CD73770D1B32', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/5881D4C6111121D79656CD73770D1B32.jpg');
INSERT INTO `file_upload` VALUES ('5915685BBDBD426374256BF8A14B7AB5', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/5915685BBDBD426374256BF8A14B7AB5.jpg');
INSERT INTO `file_upload` VALUES ('59E09E7705CEF3941307961427572DC1', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/59E09E7705CEF3941307961427572DC1.jpg');
INSERT INTO `file_upload` VALUES ('5AC560A7F82ED7B279EC374A43A6D561', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/5AC560A7F82ED7B279EC374A43A6D561.jpg');
INSERT INTO `file_upload` VALUES ('5BE83EAF02F35FEAFCA5874719E81B00', 'A1461B2408974E05BAA2D9AEB942AC99', 'Good', '2016-02-21 00:00:00', 'jpg', '软件开发视频大讲堂：Java从入门到精通（第3版 附光盘）.jpg', '/pic/Good/20160221/5BE83EAF02F35FEAFCA5874719E81B00.jpg');
INSERT INTO `file_upload` VALUES ('5CEF9887340BB6DA4763D95373CC090E', null, 'Good', '2013-03-05 00:00:00', 'jpg', 'hgg2.jpg', '/pic/Good/20130305/5CEF9887340BB6DA4763D95373CC090E.jpg');
INSERT INTO `file_upload` VALUES ('5D110EB110E042858A1B7A2D31C4EADC', '940FDF890B797DE5BDD59F47457C415C', 'goodType', '2013-02-22 00:00:00', 'jpg', 'w.jpg', '/pic/goodType/20130222/5D110EB110E042858A1B7A2D31C4EADC.jpg');
INSERT INTO `file_upload` VALUES ('5D587FAA35CA64EC15AFCD04AFB52154', null, 'Good', '2013-03-25 00:00:00', 'jpg', '1-8.jpg', '/pic/Good/20130325/5D587FAA35CA64EC15AFCD04AFB52154.jpg');
INSERT INTO `file_upload` VALUES ('5DC69ED6F9ED3FB47E1B55E7AF199392', null, 'Good', '2013-03-05 00:00:00', 'jpg', 'cptp.jpg', '/pic/Good/20130305/5DC69ED6F9ED3FB47E1B55E7AF199392.jpg');
INSERT INTO `file_upload` VALUES ('5E5576A80EA5C41F1201BA2282771FE3', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/5E5576A80EA5C41F1201BA2282771FE3.jpg');
INSERT INTO `file_upload` VALUES ('5E6C24BC4288B0339DADAA73EE27619C', null, 'GoodBrand', '2013-05-30 00:00:00', 'gif', '104.gif', '/pic/GoodBrand/20130530/5E6C24BC4288B0339DADAA73EE27619C.gif');
INSERT INTO `file_upload` VALUES ('5F095772C0C05E100725F79613D97C6F', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/5F095772C0C05E100725F79613D97C6F.jpg');
INSERT INTO `file_upload` VALUES ('61D61679D0E6C9136FEA56BF75F81B29', null, 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130529/61D61679D0E6C9136FEA56BF75F81B29.jpg');
INSERT INTO `file_upload` VALUES ('622866F7E63B0737E0DF6A988EC4B511', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Hydrangeas.jpg', '/pic/Good/20130413/622866F7E63B0737E0DF6A988EC4B511.jpg');
INSERT INTO `file_upload` VALUES ('630DC88CA3D8BD9CB781B318413F510E', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/630DC88CA3D8BD9CB781B318413F510E.jpg');
INSERT INTO `file_upload` VALUES ('648D50B3607B4FBDB86E5A2954C06F97', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2ouvDXoXXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/648D50B3607B4FBDB86E5A2954C06F97.jpg');
INSERT INTO `file_upload` VALUES ('652E090C75ED251C3710BD28F450767B', null, 'Good', '2013-04-17 00:00:00', 'jpg', 'Lighthouse.jpg', '/pic/Good/20130417/652E090C75ED251C3710BD28F450767B.jpg');
INSERT INTO `file_upload` VALUES ('65D43784821DFF726B11C6A7A7453039', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_2.jpg', '/pic/Customer/20130323/65D43784821DFF726B11C6A7A7453039.jpg');
INSERT INTO `file_upload` VALUES ('67A7A6475AFB884619E669B051A68DE3', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/67A7A6475AFB884619E669B051A68DE3.jpg');
INSERT INTO `file_upload` VALUES ('695201F81C78AA0F9C94A7B362EC9E37', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/695201F81C78AA0F9C94A7B362EC9E37.jpg');
INSERT INTO `file_upload` VALUES ('6BD0F203DCAECB60B7CB78AED1F698C6', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/6BD0F203DCAECB60B7CB78AED1F698C6.jpg');
INSERT INTO `file_upload` VALUES ('6C24E169B9514A004714DA36488DC306', null, 'Good', '2013-05-27 00:00:00', 'jpg', 'T23bYkXgpbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130527/6C24E169B9514A004714DA36488DC306.jpg');
INSERT INTO `file_upload` VALUES ('6C8CFA97A3779F99FC6BD24E6813847F', null, 'Ware', '2013-06-01 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130601/6C8CFA97A3779F99FC6BD24E6813847F.jpg');
INSERT INTO `file_upload` VALUES ('6D184248B90CA2143C4657C29EBC4AF4', null, 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130529/6D184248B90CA2143C4657C29EBC4AF4.jpg');
INSERT INTO `file_upload` VALUES ('6DD648E8CF601D611CDFA773119626AB', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/6DD648E8CF601D611CDFA773119626AB.jpg');
INSERT INTO `file_upload` VALUES ('6DE84B96E05BBFCB69DC141DFA9A0177', '2CACEFC94CA008D2791F5846F035AB2D', 'goodType', '2013-02-22 00:00:00', 'jpg', 'z.jpg', '/pic/goodType/20130222/6DE84B96E05BBFCB69DC141DFA9A0177.jpg');
INSERT INTO `file_upload` VALUES ('6F32A3CC59DDFCD336986B5999AEA92C', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/6F32A3CC59DDFCD336986B5999AEA92C.jpg');
INSERT INTO `file_upload` VALUES ('708783226BE0D1F44D488620A9C87285', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/708783226BE0D1F44D488620A9C87285.jpg');
INSERT INTO `file_upload` VALUES ('70DE658CDD1F16133C24F7E061AA599C', null, 'GoodAlbum', '2013-05-28 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130528/70DE658CDD1F16133C24F7E061AA599C.jpg');
INSERT INTO `file_upload` VALUES ('717A46B34520FACA791B23408AF21CE6', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/717A46B34520FACA791B23408AF21CE6.jpg');
INSERT INTO `file_upload` VALUES ('72CB91B991C4B08985766CD78E25AB3B', 'C3AC024C8ECC02D0859A4E68F83B9022', 'goodType', '2013-02-22 00:00:00', 'jpg', 'e.jpg', '/pic/goodType/20130222/72CB91B991C4B08985766CD78E25AB3B.jpg');
INSERT INTO `file_upload` VALUES ('73BF30417374E22CA36789CC3FFF1ABD', null, 'AdvertisePic', '2013-03-23 00:00:00', 'jpg', '02.jpg', '/pic/AdvertisePic/20130323/73BF30417374E22CA36789CC3FFF1ABD.jpg');
INSERT INTO `file_upload` VALUES ('756086F1D6CFD526139AC94DBBE13957', '372594FE6A0C5B6BFBBC65E3073166B1', 'goodType', '2013-02-22 00:00:00', 'jpg', 'ss.jpg', '/pic/goodType/20130222/756086F1D6CFD526139AC94DBBE13957.jpg');
INSERT INTO `file_upload` VALUES ('7A2BFC1A540DA38D2BCFB260B195FA0E', null, 'Good', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130528/7A2BFC1A540DA38D2BCFB260B195FA0E.jpg');
INSERT INTO `file_upload` VALUES ('7A37DCF209E4301D7D3361AE58E8EB52', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/7A37DCF209E4301D7D3361AE58E8EB52.jpg');
INSERT INTO `file_upload` VALUES ('7B5C407CC6202638733AC6CB6E660010', '10D4D386D2058D089857902C636A3A76', 'GoodAlbum', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/GoodAlbum/20160220/7B5C407CC6202638733AC6CB6E660010.jpg');
INSERT INTO `file_upload` VALUES ('7BF2244E325D22D9E263FDE70B073CFD', '0E1CDDD8CD9B22019119D80452312CDD', 'Good', '2013-05-29 00:00:00', 'jpg', 'T1jCWMXtpdXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/Good/20130529/7BF2244E325D22D9E263FDE70B073CFD.jpg');
INSERT INTO `file_upload` VALUES ('7C316D30F7714365EBE8508EA4F862B8', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/7C316D30F7714365EBE8508EA4F862B8.jpg');
INSERT INTO `file_upload` VALUES ('7D2906D2DBD87F7BB4EFC18879EE2D3D', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/7D2906D2DBD87F7BB4EFC18879EE2D3D.jpg');
INSERT INTO `file_upload` VALUES ('7F1D0FC5AFDCD21AAE33D325F95DD7BA', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '1-3.jpg', '/pic/Customer/20130323/7F1D0FC5AFDCD21AAE33D325F95DD7BA.jpg');
INSERT INTO `file_upload` VALUES ('800F77C164565752BAC309D20858181C', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Tulips.jpg', '/pic/Good/20130413/800F77C164565752BAC309D20858181C.jpg');
INSERT INTO `file_upload` VALUES ('80B8EF0F492166653993877571E44F37', null, 'GoodBrand', '2013-05-30 00:00:00', 'gif', '103.gif', '/pic/GoodBrand/20130530/80B8EF0F492166653993877571E44F37.gif');
INSERT INTO `file_upload` VALUES ('819058AF05C0AA976E4684C1B8740620', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/819058AF05C0AA976E4684C1B8740620.jpg');
INSERT INTO `file_upload` VALUES ('82DFDCEAF5FE90417A8754BA571C20A0', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/82DFDCEAF5FE90417A8754BA571C20A0.jpg');
INSERT INTO `file_upload` VALUES ('84F7C53D8C884A511D504FA8D765E9ED', 'DAFFCE97E19311801108E5B952AFD9CF', 'goodType', '2013-02-22 00:00:00', 'jpg', 'q.jpg', '/pic/goodType/20130222/84F7C53D8C884A511D504FA8D765E9ED.jpg');
INSERT INTO `file_upload` VALUES ('8624CEEDADCBE969389AB6D0A45CF52A', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/8624CEEDADCBE969389AB6D0A45CF52A.jpg');
INSERT INTO `file_upload` VALUES ('870BAA816529260159EC0A7BA748FF70', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/870BAA816529260159EC0A7BA748FF70.jpg');
INSERT INTO `file_upload` VALUES ('87CBF16B5146773C1ECAE2C22D74706E', '0E1CDDD8CD9B22019119D80452312CDD', 'Good', '2016-02-21 00:00:00', 'jpg', 'C++ Primer中文版 第5版+Java编程思想 第4版.jpg', '/pic/Good/20160221/87CBF16B5146773C1ECAE2C22D74706E.jpg');
INSERT INTO `file_upload` VALUES ('8A4506A9A28DE9FE729B92D2FD3A6A5F', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/8A4506A9A28DE9FE729B92D2FD3A6A5F.jpg');
INSERT INTO `file_upload` VALUES ('8B6774C9276862EDDA7355C206684FFF', 'C7A867F54327A355FAC7204CC1509992', 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T1RHhLXvdiXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/GoodAlbum/20130529/8B6774C9276862EDDA7355C206684FFF.jpg');
INSERT INTO `file_upload` VALUES ('8BE9306DB19F5BE961C18FD5750B5EA4', 'E7F3D170EB31F170E8D269C14ACC51DF', 'AdvertisePic', '2013-06-25 00:00:00', 'jpg', 'logo2-1.jpg', '/pic/AdvertisePic/20130625/8BE9306DB19F5BE961C18FD5750B5EA4.jpg');
INSERT INTO `file_upload` VALUES ('8E446FA9BA0D95829FE0E8C9E84A1FB8', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2ouvDXoXXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/8E446FA9BA0D95829FE0E8C9E84A1FB8.jpg');
INSERT INTO `file_upload` VALUES ('8FBF9C0A9326A7F4CD1C8E686B99058D', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Chrysanthemum.jpg', '/pic/Good/20130413/8FBF9C0A9326A7F4CD1C8E686B99058D.jpg');
INSERT INTO `file_upload` VALUES ('8FF9FA67B1A5E18F4D98016AC1A54C0C', 'A1461B2408974E05BAA2D9AEB942AC99', 'Good', '2013-05-29 00:00:00', 'jpg', 'T1VIiTXrNeXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/Good/20130529/8FF9FA67B1A5E18F4D98016AC1A54C0C.jpg');
INSERT INTO `file_upload` VALUES ('907B42609D7DCE00F1491F1ABEF596AA', '10D4D386D2058D089857902C636A3A76', 'Good', '2013-05-29 00:00:00', 'jpg', 'T1Fn8sXsVaXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/Good/20130529/907B42609D7DCE00F1491F1ABEF596AA.jpg');
INSERT INTO `file_upload` VALUES ('9096CF25FD844F55DB74348EBDF20711', null, 'Good', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/Good/20160220/9096CF25FD844F55DB74348EBDF20711.jpg');
INSERT INTO `file_upload` VALUES ('91308204043847BD16C62B1554DF9C96', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/91308204043847BD16C62B1554DF9C96.jpg');
INSERT INTO `file_upload` VALUES ('926AEA4438572021AA88ED29D81CA5DA', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/926AEA4438572021AA88ED29D81CA5DA.jpg');
INSERT INTO `file_upload` VALUES ('92CE12EF57090B8217E8CA43E28A8640', null, 'Good', '2013-05-27 00:00:00', 'jpg', 'T2ouvDXoXXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130527/92CE12EF57090B8217E8CA43E28A8640.jpg');
INSERT INTO `file_upload` VALUES ('93271D7A46D418D5C5A396642A067AB0', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/93271D7A46D418D5C5A396642A067AB0.jpg');
INSERT INTO `file_upload` VALUES ('94D656A8EDEC10B912065E3BE0DF9926', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', '2013_3_29_19_46_43_8992.jpg', '/pic/GoodAlbum/20130413/94D656A8EDEC10B912065E3BE0DF9926.jpg');
INSERT INTO `file_upload` VALUES ('95132C043036A001D6D8BEC3AD561164', 'CAFCEFC45E06F771DE0DC20DD7F60C1D', 'Good', '2016-02-21 00:00:00', 'jpg', 'Java核心技术（卷1）：基础知识（原书第9版）.jpg', '/pic/Good/20160221/95132C043036A001D6D8BEC3AD561164.jpg');
INSERT INTO `file_upload` VALUES ('952DC6BFDB4CF21F5F0FC7649D13D3B3', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/952DC6BFDB4CF21F5F0FC7649D13D3B3.jpg');
INSERT INTO `file_upload` VALUES ('9753B8C330804CF5F0AD6057D5124273', null, 'Good', '2013-02-22 00:00:00', 'jpg', '130_7.jpg', '/pic/Good/20130222/9753B8C330804CF5F0AD6057D5124273.jpg');
INSERT INTO `file_upload` VALUES ('992A1991E4017487BB5CAA8FA5F5504E', null, 'Good', '2013-02-22 00:00:00', 'jpg', '130_2.jpg', '/pic/Good/20130222/992A1991E4017487BB5CAA8FA5F5504E.jpg');
INSERT INTO `file_upload` VALUES ('997EA486B66A181691A96C63AA5B9060', null, 'Good', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/Good/20160220/997EA486B66A181691A96C63AA5B9060.jpg');
INSERT INTO `file_upload` VALUES ('9A510F8F919330F217044E213744A2EE', null, 'GoodAlbum', '2013-02-26 00:00:00', 'gif', '460.gif', '/pic/GoodAlbum/20130226/9A510F8F919330F217044E213744A2EE.gif');
INSERT INTO `file_upload` VALUES ('9AE0FCF1E5ECC0FC224BD440EB42ABF3', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/9AE0FCF1E5ECC0FC224BD440EB42ABF3.jpg');
INSERT INTO `file_upload` VALUES ('9B2ED7940DFCDDA4CE2DF4EFF0E3D7C9', '6B89B47FFEEA5A3377631C60DE4631ED', 'goodType', '2013-02-22 00:00:00', 'jpg', 'y.jpg', '/pic/goodType/20130222/9B2ED7940DFCDDA4CE2DF4EFF0E3D7C9.jpg');
INSERT INTO `file_upload` VALUES ('9B649AF7AC3EFAFA8F1B237C04CEC6AB', null, 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130529/9B649AF7AC3EFAFA8F1B237C04CEC6AB.jpg');
INSERT INTO `file_upload` VALUES ('9B7DE68716691D2BCA0765DD7B79B0D0', 'DF616139DA54062B9DB2E2E603C4F190', 'goodType', '2013-02-26 00:00:00', 'gif', '460.gif', '/pic/goodType/20130226/9B7DE68716691D2BCA0765DD7B79B0D0.gif');
INSERT INTO `file_upload` VALUES ('9BC20315F36BFA6EBF250E427C812974', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/9BC20315F36BFA6EBF250E427C812974.jpg');
INSERT INTO `file_upload` VALUES ('9BCB2DF17E91491045A60EE12DC33CEB', '10D4D386D2058D089857902C636A3A76', 'Good', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/Good/20160220/9BCB2DF17E91491045A60EE12DC33CEB.jpg');
INSERT INTO `file_upload` VALUES ('A0AD96420836A3AAA95271846AFED67A', null, 'Good', '2013-05-27 00:00:00', 'jpg', 'T23bYkXgpbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130527/A0AD96420836A3AAA95271846AFED67A.jpg');
INSERT INTO `file_upload` VALUES ('A0CBD4FED5B42D5E58A8FA2DA30790F8', null, 'GoodAlbum', '2013-03-18 00:00:00', 'JPG', '白奶油_yy.JPG', '/pic/GoodAlbum/20130318/A0CBD4FED5B42D5E58A8FA2DA30790F8.JPG');
INSERT INTO `file_upload` VALUES ('A0E5E55C5C78B17BB56438471A792D39', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/A0E5E55C5C78B17BB56438471A792D39.jpg');
INSERT INTO `file_upload` VALUES ('A261F0C0234E67A43A73EFD2DB057FA6', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/A261F0C0234E67A43A73EFD2DB057FA6.jpg');
INSERT INTO `file_upload` VALUES ('A3F5F4AC78371060765C7088E2941793', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/A3F5F4AC78371060765C7088E2941793.jpg');
INSERT INTO `file_upload` VALUES ('A5C893AF17DA3654510BD5DA7E8EACF3', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/A5C893AF17DA3654510BD5DA7E8EACF3.jpg');
INSERT INTO `file_upload` VALUES ('A79B83D143F18900743D3482A3C0892D', null, 'Good', '2013-05-27 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130527/A79B83D143F18900743D3482A3C0892D.jpg');
INSERT INTO `file_upload` VALUES ('A84ECA3033D405BF497A72DA39D975CD', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/A84ECA3033D405BF497A72DA39D975CD.jpg');
INSERT INTO `file_upload` VALUES ('A8C649CBFDFEAE443D3A70741D4DF3B4', null, 'AdvertisePic', '2013-02-23 00:00:00', 'jpg', 'a12.jpg', '/pic/AdvertisePic/20130223/A8C649CBFDFEAE443D3A70741D4DF3B4.jpg');
INSERT INTO `file_upload` VALUES ('A964E3D5DA096F491D15D1AA4E7FD946', null, 'GoodBrand', '2013-02-22 00:00:00', 'jpg', '8.jpg', '/pic/GoodBrand/20130222/A964E3D5DA096F491D15D1AA4E7FD946.jpg');
INSERT INTO `file_upload` VALUES ('AAA4FBDAF21DA2D6A876589270B81D7D', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/AAA4FBDAF21DA2D6A876589270B81D7D.jpg');
INSERT INTO `file_upload` VALUES ('AF2694DEAC6B327AC8B8AD11EF06DE22', null, 'Good', '2013-05-28 00:00:00', 'jpg', 'T2O4DFXjpaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130528/AF2694DEAC6B327AC8B8AD11EF06DE22.jpg');
INSERT INTO `file_upload` VALUES ('AF6D28B0C436F5F26D40045D778F1299', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/AF6D28B0C436F5F26D40045D778F1299.jpg');
INSERT INTO `file_upload` VALUES ('B04944B5E5AB6EF4AE5A9A24B2A8180D', null, 'Good', '2013-05-27 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130527/B04944B5E5AB6EF4AE5A9A24B2A8180D.jpg');
INSERT INTO `file_upload` VALUES ('B0B670039293AAE8951625FC8629CB92', '0BCD023CEB1659C6C6CE691157C35C8B', 'goodType', '2013-02-22 00:00:00', 'jpg', 's.jpg', '/pic/goodType/20130222/B0B670039293AAE8951625FC8629CB92.jpg');
INSERT INTO `file_upload` VALUES ('B1159EECC1D09BC570FAED9EC5EC1BCB', null, 'GoodAlbum', '2013-02-26 00:00:00', 'gif', 'grey.gif', '/pic/GoodAlbum/20130226/B1159EECC1D09BC570FAED9EC5EC1BCB.gif');
INSERT INTO `file_upload` VALUES ('B16BAF1EBDB4B049D29858D9A3A27699', null, 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130529/B16BAF1EBDB4B049D29858D9A3A27699.jpg');
INSERT INTO `file_upload` VALUES ('B1C02E7ED55C13558572137B95F65D9A', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/B1C02E7ED55C13558572137B95F65D9A.jpg');
INSERT INTO `file_upload` VALUES ('B495774B03FDC34273CFC96787AC598C', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/B495774B03FDC34273CFC96787AC598C.jpg');
INSERT INTO `file_upload` VALUES ('B5171A74DE964737496BCFE57E72D622', null, 'Good', '2013-05-27 00:00:00', 'jpg', 'T23bYkXgpbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130527/B5171A74DE964737496BCFE57E72D622.jpg');
INSERT INTO `file_upload` VALUES ('B5FC701E3B626F0B839F512038BB4A30', 'CAFCEFC45E06F771DE0DC20DD7F60C1D', 'Good', '2016-02-21 00:00:00', 'jpg', 'Java核心技术（卷1）：基础知识（原书第9版）.jpg', '/pic/Good/20160221/B5FC701E3B626F0B839F512038BB4A30.jpg');
INSERT INTO `file_upload` VALUES ('B77BB60EAAF1D9DF0DCF705A2F26608B', null, 'AdvertisePic', '2013-04-13 00:00:00', 'jpg', 'Jellyfish.jpg', '/pic/AdvertisePic/20130413/B77BB60EAAF1D9DF0DCF705A2F26608B.jpg');
INSERT INTO `file_upload` VALUES ('B8A7F4F666A97B538A70C0CDD6DF73B7', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/B8A7F4F666A97B538A70C0CDD6DF73B7.jpg');
INSERT INTO `file_upload` VALUES ('B9E83DCF13896D13F23EDA9DD2890DBB', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/B9E83DCF13896D13F23EDA9DD2890DBB.jpg');
INSERT INTO `file_upload` VALUES ('BA1FA12E48D7889BE22B010A8F697718', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Penguins.jpg', '/pic/Good/20130413/BA1FA12E48D7889BE22B010A8F697718.jpg');
INSERT INTO `file_upload` VALUES ('BAEB19290F0E8E13BA93C6B709EDDE23', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', 'u=3287916865,2465782&fm=21&gp=0.jpg', '/pic/GoodAlbum/20130413/BAEB19290F0E8E13BA93C6B709EDDE23.jpg');
INSERT INTO `file_upload` VALUES ('BC74D7DF1A55A95D474DA32C8F966AFA', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/BC74D7DF1A55A95D474DA32C8F966AFA.jpg');
INSERT INTO `file_upload` VALUES ('BD2228A874C471084A94B4E2C15F6DCE', null, 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130529/BD2228A874C471084A94B4E2C15F6DCE.jpg');
INSERT INTO `file_upload` VALUES ('BD6DA328FE256E0E33D9E00EAFB4C827', null, 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/GoodAlbum/20130529/BD6DA328FE256E0E33D9E00EAFB4C827.jpg');
INSERT INTO `file_upload` VALUES ('BDD2007A294A872388B701D8F4D6A571', null, 'Good', '2013-04-13 00:00:00', 'jpg', '2013_3_29_18_57_9_8232.jpg', '/pic/Good/20130413/BDD2007A294A872388B701D8F4D6A571.jpg');
INSERT INTO `file_upload` VALUES ('BDD856290A645124826E7E8AD22F429E', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Desert.jpg', '/pic/Good/20130413/BDD856290A645124826E7E8AD22F429E.jpg');
INSERT INTO `file_upload` VALUES ('BDD8B62CA52A8CF06B3CE774BC3BEA8C', 'CAFCEFC45E06F771DE0DC20DD7F60C1D', 'Good', '2013-05-29 00:00:00', 'jpg', 'T1fSCNXzVbXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/Good/20130529/BDD8B62CA52A8CF06B3CE774BC3BEA8C.jpg');
INSERT INTO `file_upload` VALUES ('BE2528A58B640FA78295D90B1F6BC58A', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/BE2528A58B640FA78295D90B1F6BC58A.jpg');
INSERT INTO `file_upload` VALUES ('BE70381CC972F36A1F1D73DCD773E0EF', null, 'GoodAlbum', '2013-03-18 00:00:00', 'JPG', '20升极品液态酥油胶罐_yy.JPG', '/pic/GoodAlbum/20130318/BE70381CC972F36A1F1D73DCD773E0EF.JPG');
INSERT INTO `file_upload` VALUES ('BE74E7A0075847FD3DD14B99513353BC', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/BE74E7A0075847FD3DD14B99513353BC.jpg');
INSERT INTO `file_upload` VALUES ('BF67ECB9A8B8B7D1BFA333AB0E12E06F', 'A1461B2408974E05BAA2D9AEB942AC99', 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T1VIiTXrNeXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/GoodAlbum/20130529/BF67ECB9A8B8B7D1BFA333AB0E12E06F.jpg');
INSERT INTO `file_upload` VALUES ('C3504A8EDAB1762B4DECE45E010C94FB', '0E1CDDD8CD9B22019119D80452312CDD', 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T1jCWMXtpdXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/GoodAlbum/20130529/C3504A8EDAB1762B4DECE45E010C94FB.jpg');
INSERT INTO `file_upload` VALUES ('C5CF5A96D8F40814A36FE5B01EB7DDA0', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2NvzbXdNbXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/C5CF5A96D8F40814A36FE5B01EB7DDA0.jpg');
INSERT INTO `file_upload` VALUES ('C5F1339C6BCA09446ECC2FAC17692B07', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_1.jpg', '/pic/Customer/20130323/C5F1339C6BCA09446ECC2FAC17692B07.jpg');
INSERT INTO `file_upload` VALUES ('CB582C564C944E8B3479423A565E7887', 'E7F3D170EB31F170E8D269C14ACC51DF', 'AdvertisePic', '2013-06-25 00:00:00', 'jpg', 'logo2_1_1.jpg', '/pic/AdvertisePic/20130625/CB582C564C944E8B3479423A565E7887.jpg');
INSERT INTO `file_upload` VALUES ('CCB53F26FF17377C4ECDB56DA5F99092', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/CCB53F26FF17377C4ECDB56DA5F99092.jpg');
INSERT INTO `file_upload` VALUES ('CD4EA4ABF61890F4DBB3226ACB136DA2', null, 'Good', '2013-05-29 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Good/20130529/CD4EA4ABF61890F4DBB3226ACB136DA2.jpg');
INSERT INTO `file_upload` VALUES ('CD7C04D5ABA652CA6EFCA669D6E25329', 'C8341CD25D5D145A3F444C7DA5D049A0', 'goodType', '2013-02-22 00:00:00', 'jpg', 'a.jpg', '/pic/goodType/20130222/CD7C04D5ABA652CA6EFCA669D6E25329.jpg');
INSERT INTO `file_upload` VALUES ('CE77629F97F1B647918461B1BB26C151', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '13-964-001.jpg', '/pic/Customer/20130323/CE77629F97F1B647918461B1BB26C151.jpg');
INSERT INTO `file_upload` VALUES ('D045C3DE858B5CD2F154710D47AD0CE8', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/D045C3DE858B5CD2F154710D47AD0CE8.jpg');
INSERT INTO `file_upload` VALUES ('D22AF03045B1D7A5B9872F1AAF70CF14', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Hydrangeas.jpg', '/pic/Good/20130413/D22AF03045B1D7A5B9872F1AAF70CF14.jpg');
INSERT INTO `file_upload` VALUES ('D6118C9329D75D23CE099581E4FF5F32', 'A1461B2408974E05BAA2D9AEB942AC99', 'Good', '2016-02-21 00:00:00', 'jpg', '软件开发视频大讲堂：Java从入门到精通（第3版 附光盘）.jpg', '/pic/Good/20160221/D6118C9329D75D23CE099581E4FF5F32.jpg');
INSERT INTO `file_upload` VALUES ('D6D212916223CED7C5092A9517108BBC', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/D6D212916223CED7C5092A9517108BBC.jpg');
INSERT INTO `file_upload` VALUES ('D71CA935ACA753D334934853AF941A42', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', 'u=3674912722,711831530&fm=15&gp=0.jpg', '/pic/GoodAlbum/20130413/D71CA935ACA753D334934853AF941A42.jpg');
INSERT INTO `file_upload` VALUES ('D7C8A1BFD113A963CD58E2B440268478', null, 'Ware', '2013-06-01 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130601/D7C8A1BFD113A963CD58E2B440268478.jpg');
INSERT INTO `file_upload` VALUES ('D802812BAE9D5AD1F8AC77A8CC81E89B', null, 'Good', '2013-03-04 00:00:00', 'jpg', 'ty.jpg', '/pic/Good/20130304/D802812BAE9D5AD1F8AC77A8CC81E89B.jpg');
INSERT INTO `file_upload` VALUES ('DA6B7761A06FE8B8755280AB7571F404', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/DA6B7761A06FE8B8755280AB7571F404.jpg');
INSERT INTO `file_upload` VALUES ('DC56E54BFF01C4AFE33B8E78DDB93015', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', '2013_3_29_19_47_2_6376.jpg', '/pic/GoodAlbum/20130413/DC56E54BFF01C4AFE33B8E78DDB93015.jpg');
INSERT INTO `file_upload` VALUES ('DCA2EB16DE84B6211167265772202957', null, 'GoodAlbum', '2016-02-20 00:00:00', 'jpg', '数据结构与算法分析：Java语言描述（第2版）.jpg', '/pic/GoodAlbum/20160220/DCA2EB16DE84B6211167265772202957.jpg');
INSERT INTO `file_upload` VALUES ('DCD54D5E0D24AFABED8BAD100EDC5109', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', '2013_3_29_19_0_32_9078.jpg', '/pic/GoodAlbum/20130413/DCD54D5E0D24AFABED8BAD100EDC5109.jpg');
INSERT INTO `file_upload` VALUES ('DCF7DE181FD70162B2922C19EA161277', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/DCF7DE181FD70162B2922C19EA161277.jpg');
INSERT INTO `file_upload` VALUES ('DD46CFC43E974176E6F1C0E2F98291AC', '53194D71C63D87D51CF37D075F3269E2', 'goodType', '2013-02-22 00:00:00', 'jpg', 'x.jpg', '/pic/goodType/20130222/DD46CFC43E974176E6F1C0E2F98291AC.jpg');
INSERT INTO `file_upload` VALUES ('E099D7231943DB83EBD6D1D12F7DCF67', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '1-4.jpg', '/pic/Customer/20130323/E099D7231943DB83EBD6D1D12F7DCF67.jpg');
INSERT INTO `file_upload` VALUES ('E18C6DCDB90874746D688C66C095AAC7', '352AAA65A4ABD234548388103F997858', 'Good', '2013-05-29 00:00:00', 'jpg', 'T149FLXwFbXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/Good/20130529/E18C6DCDB90874746D688C66C095AAC7.jpg');
INSERT INTO `file_upload` VALUES ('E1ABF34684E7C02A8F1B6C177AA10E19', null, 'Good', '2016-02-21 00:00:00', 'jpg', '轻量级Java EE企业应用实战：Struts2+Spring4+Hibernate整合开发（第4版 附CD光盘）.jpg', '/pic/Good/20160221/E1ABF34684E7C02A8F1B6C177AA10E19.jpg');
INSERT INTO `file_upload` VALUES ('E3582E4398BF942F1DD7A2603A9C97D9', '0E1CDDD8CD9B22019119D80452312CDD', 'Good', '2016-02-21 00:00:00', 'jpg', 'C++ Primer中文版 第5版+Java编程思想 第4版.jpg', '/pic/Good/20160221/E3582E4398BF942F1DD7A2603A9C97D9.jpg');
INSERT INTO `file_upload` VALUES ('E48497EC324DB1AEF516FF3819375440', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Lighthouse.jpg', '/pic/Good/20130413/E48497EC324DB1AEF516FF3819375440.jpg');
INSERT INTO `file_upload` VALUES ('E533A7708CECDD2AA266B35504CF3EF6', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2v3bDXedaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/E533A7708CECDD2AA266B35504CF3EF6.jpg');
INSERT INTO `file_upload` VALUES ('E80436B09C659D539825F50B15FC1B6B', 'E7F3D170EB31F170E8D269C14ACC51DF', 'AdvertisePic', '2013-06-25 00:00:00', 'jpg', 'logo2_1_1.jpg', '/pic/AdvertisePic/20130625/E80436B09C659D539825F50B15FC1B6B.jpg');
INSERT INTO `file_upload` VALUES ('E90A265FFF29A3DEDEC65FA01EDD3E02', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_2.jpg', '/pic/Customer/20130323/E90A265FFF29A3DEDEC65FA01EDD3E02.jpg');
INSERT INTO `file_upload` VALUES ('E91E3DD0F4FD3BE9DE1F22E66526A1FB', null, 'GoodBrand', '2013-03-05 00:00:00', 'png', 'ketec.png', '/pic/GoodBrand/20130305/E91E3DD0F4FD3BE9DE1F22E66526A1FB.png');
INSERT INTO `file_upload` VALUES ('E92C5CBC4F0A1E34DD0BF334C01F4234', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', '2013_3_29_19_47_20_2345.jpg', '/pic/GoodAlbum/20130413/E92C5CBC4F0A1E34DD0BF334C01F4234.jpg');
INSERT INTO `file_upload` VALUES ('E989894E1F6223DB6BDCCF15D55FA78A', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/E989894E1F6223DB6BDCCF15D55FA78A.jpg');
INSERT INTO `file_upload` VALUES ('EB1CF3C028F9037157C4A15C51EE73A0', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2LBDGXaNaXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/EB1CF3C028F9037157C4A15C51EE73A0.jpg');
INSERT INTO `file_upload` VALUES ('EE0B1966EDCBC4E6A592336944F9113D', '352AAA65A4ABD234548388103F997858', 'Good', '2016-02-21 00:00:00', 'jpg', '疯狂Java讲义（第3版 附光盘）.jpg', '/pic/Good/20160221/EE0B1966EDCBC4E6A592336944F9113D.jpg');
INSERT INTO `file_upload` VALUES ('EF197FFAF2F582E7D223EF928DCDC517', null, 'GoodAlbum', '2013-04-13 00:00:00', 'jpg', 'u=2161325518,4003046571&fm=15&gp=0.jpg', '/pic/GoodAlbum/20130413/EF197FFAF2F582E7D223EF928DCDC517.jpg');
INSERT INTO `file_upload` VALUES ('EFF684C655BF1A855C1A8E27406258D5', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/EFF684C655BF1A855C1A8E27406258D5.jpg');
INSERT INTO `file_upload` VALUES ('F020129789641CCB2E0A71B4EDAEC99E', null, 'Customer', '2013-03-25 00:00:00', 'jpg', 'a37.jpg', '/pic/Customer/20130325/F020129789641CCB2E0A71B4EDAEC99E.jpg');
INSERT INTO `file_upload` VALUES ('F1F5EF63132AA1A22F4B658908EF2E91', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/F1F5EF63132AA1A22F4B658908EF2E91.jpg');
INSERT INTO `file_upload` VALUES ('F2BAAAA5C2B869E0C3E54D0F77F6C932', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Koala.jpg', '/pic/Good/20130413/F2BAAAA5C2B869E0C3E54D0F77F6C932.jpg');
INSERT INTO `file_upload` VALUES ('F4E3B83CFEF2B78160D2DF87FC0D7094', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2YNFYXX8eXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/F4E3B83CFEF2B78160D2DF87FC0D7094.jpg');
INSERT INTO `file_upload` VALUES ('F7F50E2B09F3E04E9650D55B41915685', '352AAA65A4ABD234548388103F997858', 'GoodAlbum', '2013-05-29 00:00:00', 'jpg', 'T149FLXwFbXXXXXXXX_!!0-item_pic.jpg_230x230.jpg', '/pic/GoodAlbum/20130529/F7F50E2B09F3E04E9650D55B41915685.jpg');
INSERT INTO `file_upload` VALUES ('F88B76B8FC5ECF986B648F09DFBFBEFB', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '1-7.jpg', '/pic/Customer/20130323/F88B76B8FC5ECF986B648F09DFBFBEFB.jpg');
INSERT INTO `file_upload` VALUES ('F97BF0F1E9BF12B95ACD2485FBB8E531', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_2.jpg', '/pic/Customer/20130323/F97BF0F1E9BF12B95ACD2485FBB8E531.jpg');
INSERT INTO `file_upload` VALUES ('F9E6F7A226E1EFB5423073B980EAE02E', null, 'Ware', '2013-05-28 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130528/F9E6F7A226E1EFB5423073B980EAE02E.jpg');
INSERT INTO `file_upload` VALUES ('FAD4FECAF446CC63C631682710706F4B', null, 'Customer', '2013-03-23 00:00:00', 'jpg', '50_3.jpg', '/pic/Customer/20130323/FAD4FECAF446CC63C631682710706F4B.jpg');
INSERT INTO `file_upload` VALUES ('FC85ECCAE705163C82AE83F75EB512C3', null, 'Ware', '2013-05-29 00:00:00', 'jpg', 'T2WurDXmxXXXXXXXXX_!!679104775_jpg_310x310.jpg', '/pic/Ware/20130529/FC85ECCAE705163C82AE83F75EB512C3.jpg');
INSERT INTO `file_upload` VALUES ('FE88987499DF662E020022C27E616CC4', null, 'GoodBrand', '2013-02-22 00:00:00', 'jpg', '1.jpg', '/pic/GoodBrand/20130222/FE88987499DF662E020022C27E616CC4.jpg');
INSERT INTO `file_upload` VALUES ('FEC6BE249C249E5D757DD098C5DA1B53', null, 'Good', '2013-04-13 00:00:00', 'jpg', 'Koala.jpg', '/pic/Good/20130413/FEC6BE249C249E5D757DD098C5DA1B53.jpg');

-- ----------------------------
-- Table structure for gift
-- ----------------------------
DROP TABLE IF EXISTS `gift`;
CREATE TABLE `gift` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `order_money` decimal(18,2) DEFAULT NULL,
  `gift_id` varchar(32) DEFAULT NULL,
  `gift_name` varchar(64) DEFAULT NULL,
  `gift_price` varchar(32) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `pic_id` varchar(32) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `intro` text,
  `vip_level_id` varchar(256) DEFAULT NULL,
  `vip_level_name` varchar(256) DEFAULT NULL,
  `amount` int(8) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL,
  `creator_name` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier_id` varchar(32) DEFAULT NULL,
  `modifier_name` varchar(62) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gift
-- ----------------------------

-- ----------------------------
-- Table structure for gift_good
-- ----------------------------
DROP TABLE IF EXISTS `gift_good`;
CREATE TABLE `gift_good` (
  `id` varchar(32) NOT NULL,
  `promote_id` varchar(64) DEFAULT NULL,
  `good_id` varchar(32) DEFAULT NULL,
  `good_name` varchar(64) DEFAULT NULL,
  `price_market` decimal(18,0) DEFAULT NULL,
  `price_promote` decimal(18,0) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gift_good
-- ----------------------------

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `code` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品编码',
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '品名',
  `good_type_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别编码',
  `good_type_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别名称',
  `good_kind_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_kind_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别名称',
  `brand_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `brand_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `supplier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `supplier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `unit` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `purchase_price` decimal(18,2) DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `price_market` decimal(18,2) DEFAULT NULL,
  `price_group_buy` decimal(18,2) DEFAULT NULL COMMENT '团购价',
  `credits` int(11) DEFAULT '0' COMMENT '积分',
  `pic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片',
  `tag` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `begin_sale_time` datetime DEFAULT NULL COMMENT '上架时间',
  `end_sale_time` datetime DEFAULT NULL COMMENT '下架时间',
  `order_multiple` int(11) DEFAULT NULL,
  `total_sales` int(11) DEFAULT NULL,
  `daily_net_sales` int(11) DEFAULT NULL,
  `purchase_num` int(11) DEFAULT NULL,
  `total_cost_inventory` decimal(18,2) DEFAULT NULL,
  `average_cost_inventory` decimal(18,2) DEFAULT NULL,
  `inventory_min` int(11) DEFAULT NULL,
  `inventory_max` int(11) DEFAULT NULL,
  `index_show` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0或空:不显示 1:显示 ',
  `barcode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:下架',
  `is_inventory` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0普通 1团购',
  `initialNum` decimal(18,0) DEFAULT NULL COMMENT '期初初始数量',
  `tax_rate` decimal(10,2) DEFAULT NULL COMMENT '税率',
  `tax_price` decimal(10,2) DEFAULT NULL COMMENT '含税单价',
  `property` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商品属性',
  `remark` varchar(160) COLLATE utf8_bin DEFAULT NULL,
  `area_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `click_number` decimal(18,2) DEFAULT NULL,
  `delivery_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `payment_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL COMMENT '商品的评论数',
  `sort` int(11) DEFAULT NULL,
  `group_number` int(11) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL COMMENT '开始团购时间/开始抢购时间/开始秒杀时间',
  `end_time` datetime DEFAULT NULL COMMENT ' 结束团购时间/结束抢购时间/结束秒杀时间',
  `is_next` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '下期预告',
  `return_rate` decimal(18,2) DEFAULT NULL COMMENT '返点比率',
  `return_price` decimal(18,2) DEFAULT NULL COMMENT '返点价格',
  `activit_number` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '活动商品上架多少件',
  `total_num` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '抢购/秒杀数量',
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`iid`),
  KEY `good_id` (`id`),
  KEY `good_code` (`code`),
  KEY `good_supplier_id` (`supplier_id`),
  KEY `good_good_type_id` (`good_type_id`),
  KEY `good_good_kind_id` (`good_kind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('0E1CDDD8CD9B22019119D80452312CDD', 'GH1548648', 'C++ Primer中文版 第5版+Java编程思想 第4版', '0EB02017DD33A710AAF0BC67A2A12E05', 'J2EE', null, null, null, null, null, null, null, null, null, null, null, null, 'E3582E4398BF942F1DD7A2603A9C97D9', '/pic/Good/20160221/E3582E4398BF942F1DD7A2603A9C97D9.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2016-03-05 09:31:00', '1', 'admin', '2016-03-05 09:31:00', 's', '0', null, null, null, '2, ', '', null, null, null, null, null, null, null, null, null, null, null, null, null, '5000', '1');
INSERT INTO `good` VALUES ('10D4D386D2058D089857902C636A3A76', 'GH03264', '数据结构与算法分析：Java语言描述（第2版） [Data structures and algorithm analysis in java second edition]', '87BD2799AA6746E676B754B2668E0394', '计算机基础', 'D2BF1F476215407116DB2E21D1443D2A', '电视影音', null, null, null, null, null, null, null, null, null, null, '9BCB2DF17E91491045A60EE12DC33CEB', '/pic/Good/20160220/9BCB2DF17E91491045A60EE12DC33CEB.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2016-02-23 10:50:00', '1', 'admin', '2016-02-23 10:50:00', 's', '0', null, null, null, '2, 2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, '5000', '2');
INSERT INTO `good` VALUES ('352AAA65A4ABD234548388103F997858', 'GH123154651', '疯狂Java讲义（第3版 附光盘）', '0EB02017DD33A710AAF0BC67A2A12E05', 'J2EE', 'D2BF1F476215407116DB2E21D1443D2A', '电视影音', null, null, null, null, null, null, null, null, null, null, '4A433F17DC674322DD212FD0631F9619', '/pic/Good/20160221/4A433F17DC674322DD212FD0631F9619.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2016-02-23 10:34:00', '1', 'admin', '2016-02-23 10:34:00', 's', '0', null, null, null, '2, ', '', null, null, null, null, null, null, null, null, null, null, null, null, null, '10000', '3');
INSERT INTO `good` VALUES ('A1461B2408974E05BAA2D9AEB942AC99', 'GH165486546', '软件开发视频大讲堂：Java从入门到精通（第3版 附光盘）', '98BBC7983B0AC5D1B93BACF1038979B6', 'Java', null, null, null, null, null, null, null, null, null, null, null, null, '4BDEE6BC38B8E2DFC0DA83317789FA1F', '/pic/Good/20160221/4BDEE6BC38B8E2DFC0DA83317789FA1F.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2016-02-23 10:50:00', '1', 'admin', '2016-02-23 10:50:00', 's', '0', null, null, null, '2, 2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, '5000', '4');
INSERT INTO `good` VALUES ('C7A867F54327A355FAC7204CC1509992', 'GH67484', 'O\'Reilly：Head First Java（中文版 第2版 涵盖Java5.0）', '0EB02017DD33A710AAF0BC67A2A12E05', 'J2EE', 'D2BF1F476215407116DB2E21D1443D2A', '电视影音', null, null, null, null, null, null, null, null, null, null, '188E8E0A7ED1E7DBA42538B81A82BFF4', '/pic/Good/20160221/188E8E0A7ED1E7DBA42538B81A82BFF4.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2016-02-23 10:49:00', '1', 'admin', '2016-02-23 10:49:00', 's', '0', null, null, null, '2, 2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, '5000', '5');
INSERT INTO `good` VALUES ('CAFCEFC45E06F771DE0DC20DD7F60C1D', 'GH2154548', 'Java核心技术（卷1）：基础知识（原书第9版） [Core Java Volume I—Fundamentals (Ninth Edition)]', '98BBC7983B0AC5D1B93BACF1038979B6', 'Java', null, null, null, null, null, null, null, null, null, null, null, null, '95132C043036A001D6D8BEC3AD561164', '/pic/Good/20160221/95132C043036A001D6D8BEC3AD561164.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', 'admin', '2016-02-23 10:50:00', '1', 'admin', '2016-02-23 10:50:00', 's', '0', null, null, null, '2, 4', '', null, null, null, null, null, null, null, null, null, null, null, null, null, '500', '6');

-- ----------------------------
-- Table structure for goodking_val
-- ----------------------------
DROP TABLE IF EXISTS `goodking_val`;
CREATE TABLE `goodking_val` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `goodKing_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `remark` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goodking_val
-- ----------------------------
INSERT INTO `goodking_val` VALUES ('02F132E65BAC1A288502DF99B01EA293', '520F7D85B1679EBDCA78C118C0480F79', '3p', null, 0x3C503E266E6273703B3C2F503E);
INSERT INTO `goodking_val` VALUES ('6AEC658C9BEABD3482C7167841CE0D59', '0A29C35BDA280104D47CE748E7BD7ADD', 'df', null, 0x3C503E266E6273703B3C2F503E);
INSERT INTO `goodking_val` VALUES ('869D11A5B477E678BC18DBB2DE8229F3', '520F7D85B1679EBDCA78C118C0480F79', '1p', null, 0x3C503E266E6273703B3C2F503E0A3C503E266E6273703B3C2F503E);
INSERT INTO `goodking_val` VALUES ('AF353C49C9F97B4F1E4452617EBD0C5B', '520F7D85B1679EBDCA78C118C0480F79', '2p', null, 0x3C503E266E6273703B3C2F503E);

-- ----------------------------
-- Table structure for good_attr
-- ----------------------------
DROP TABLE IF EXISTS `good_attr`;
CREATE TABLE `good_attr` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `good_kind_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `input_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '输入类型 0: 字符串 1:日期 2:整型 3:双精度 4:单选',
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `value` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '可选值',
  PRIMARY KEY (`id`),
  KEY `good_attr_id` (`id`),
  KEY `good_attr_good_kind_id` (`good_kind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_attr
-- ----------------------------
INSERT INTO `good_attr` VALUES ('0A29C35BDA280104D47CE748E7BD7ADD', 'E7866D5A6D74048BB92B6B7A17F81571', '001', 'sdf', '0', null, '', 's', null);
INSERT INTO `good_attr` VALUES ('520F7D85B1679EBDCA78C118C0480F79', 'D2BF1F476215407116DB2E21D1443D2A', '001', 'a', '0', null, '', 's', null);
INSERT INTO `good_attr` VALUES ('67A6F8ED99F052796D20B2CF895CB6E4', 'D2BF1F476215407116DB2E21D1443D2A', '003', 'c', '0', null, '', 's', null);
INSERT INTO `good_attr` VALUES ('A8BBE0830CF48B944E61ED918F0D0C76', 'E7866D5A6D74048BB92B6B7A17F81571', '002', 'bb', '0', null, '', 's', null);
INSERT INTO `good_attr` VALUES ('F7382EA0D273FB6DA3224F13EC37BBFB', 'D2BF1F476215407116DB2E21D1443D2A', '002', 'b', '0', null, '', 's', null);

-- ----------------------------
-- Table structure for good_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `good_attr_value`;
CREATE TABLE `good_attr_value` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_attr_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `attr_value` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`),
  KEY `good_attr_value_id` (`id`),
  KEY `good_attr_value_good_id` (`good_id`),
  KEY `good_attr_value_good_attr_id` (`good_attr_id`),
  CONSTRAINT `FK_good_attr_value_rf_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_attr_value
-- ----------------------------
INSERT INTO `good_attr_value` VALUES ('212A9B4335C19DD14C79A23C3448DC28', 'C7A867F54327A355FAC7204CC1509992', '520F7D85B1679EBDCA78C118C0480F79', '2p', '0');
INSERT INTO `good_attr_value` VALUES ('636B31F340AF809022748F80738A9715', '352AAA65A4ABD234548388103F997858', '520F7D85B1679EBDCA78C118C0480F79', '3p', '0');
INSERT INTO `good_attr_value` VALUES ('9B8FE1A8C15444CCA3FCAF6895E8E75B', '10D4D386D2058D089857902C636A3A76', '520F7D85B1679EBDCA78C118C0480F79', '1p', '0');

-- ----------------------------
-- Table structure for good_brand
-- ----------------------------
DROP TABLE IF EXISTS `good_brand`;
CREATE TABLE `good_brand` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `parent_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '父亲id,0:根节点',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `level` int(11) DEFAULT NULL COMMENT '层级 1:一级 2:二级  3:三级',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `pic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `is_inventory` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `is_selected` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '''yes''代表选中，''no''代表未选中',
  `brand` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_brand
-- ----------------------------
INSERT INTO `good_brand` VALUES ('0BCD023CEB1659C6C6CE691157C35C8B', null, '042', '企业IT', '1', null, '9', '1', 'admin', '2013-02-22 14:45:38', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('2CACEFC94CA008D2791F5846F035AB2D', null, '037', '数据库', '1', null, '5', '1', 'admin', '2013-02-22 14:42:28', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('372594FE6A0C5B6BFBBC65E3073166B1', null, '043', '其他', '1', null, '10', '1', 'admin', '2013-02-22 14:45:46', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('53194D71C63D87D51CF37D075F3269E2', null, '039', '设计，产品，测试', '1', null, '7', '1', 'admin', '2013-02-22 14:43:15', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('6B89B47FFEEA5A3377631C60DE4631ED', null, '032', '智能硬件，物联网', '1', null, '0', '1', 'admin', '2013-02-22 14:40:43', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('940FDF890B797DE5BDD59F47457C415C', null, '040', '移动开发', '1', null, '9', '1', 'admin', '2013-02-23 04:43:29', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('C3AC024C8ECC02D0859A4E68F83B9022', null, '034', '基础知识', '1', null, '2', '1', 'admin', '2013-02-22 14:41:33', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('C8341CD25D5D145A3F444C7DA5D049A0', null, '036', '云计算，大数据', '1', null, '4', '1', 'admin', '2013-02-22 14:41:57', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('D52DF3A08B067EA8F8E7EB04B655FBF6', null, '038', '认证考试', '1', null, '6', '1', 'admin', '2013-02-22 14:42:51', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('DAFFCE97E19311801108E5B952AFD9CF', null, '035', '后端开发', '1', null, '3', '1', 'admin', '2013-02-22 14:41:43', null, null, null, null, null, null, null, null, null);
INSERT INTO `good_brand` VALUES ('DF616139DA54062B9DB2E2E603C4F190', null, '041', '前端开发', '1', null, '10', '1', 'admin', '2013-02-23 04:43:55', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for good_compose
-- ----------------------------
DROP TABLE IF EXISTS `good_compose`;
CREATE TABLE `good_compose` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `compose_good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `price_discount` decimal(18,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `good_compose_id` (`id`),
  KEY `good_compose_good_id` (`good_id`),
  KEY `FK_good_compose_rf_c_good` (`compose_good_id`),
  CONSTRAINT `FK_good_compose_rf_c_good` FOREIGN KEY (`compose_good_id`) REFERENCES `good` (`id`),
  CONSTRAINT `FK_good_compose_rf_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_compose
-- ----------------------------

-- ----------------------------
-- Table structure for good_extend
-- ----------------------------
DROP TABLE IF EXISTS `good_extend`;
CREATE TABLE `good_extend` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `intro_brief` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `intro` text COLLATE utf8_bin,
  `intro_wholesale` text COLLATE utf8_bin,
  `intro_delivery` text COLLATE utf8_bin,
  `afterSale` text COLLATE utf8_bin COMMENT '售后保障',
  `practiceGuidelinesFAQS` text COLLATE utf8_bin COMMENT '实用指南',
  `seo_title` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `seo_keywords` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `seo_description` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `groupgood_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `good_extend_id` (`id`),
  KEY `good_extend_good_id` (`good_id`),
  CONSTRAINT `FK_good_extend_rf_good_id` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_extend
-- ----------------------------
INSERT INTO `good_extend` VALUES ('123AE983CDD466E5E83FF4D9E5EE4504', 'A1461B2408974E05BAA2D9AEB942AC99', '', 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, null, null, null, null);
INSERT INTO `good_extend` VALUES ('8FB1EFEDA5DEDCA203596B4C9FBEC12F', '0E1CDDD8CD9B22019119D80452312CDD', '', 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, null, null, null, null);
INSERT INTO `good_extend` VALUES ('A367E32CC4940365A5F4BB34C17E7E0E', 'C7A867F54327A355FAC7204CC1509992', '', 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, null, null, null, null);
INSERT INTO `good_extend` VALUES ('A871C97BE9B08CF4223A847B237A4DB0', 'CAFCEFC45E06F771DE0DC20DD7F60C1D', '', 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, null, null, null, null);
INSERT INTO `good_extend` VALUES ('B85517FB8278784BB9A7E089DDEE2B38', '352AAA65A4ABD234548388103F997858', '', 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, null, null, null, null);
INSERT INTO `good_extend` VALUES ('C7126E3FE18FB32784CC8472F0DEBB61', '10D4D386D2058D089857902C636A3A76', '', 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, 0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E, null, null, null, null);

-- ----------------------------
-- Table structure for good_kind
-- ----------------------------
DROP TABLE IF EXISTS `good_kind`;
CREATE TABLE `good_kind` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `code` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `good_type_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_type_name` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `good_kind_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_kind
-- ----------------------------
INSERT INTO `good_kind` VALUES ('D2BF1F476215407116DB2E21D1443D2A', '020', '电视影音', '940FDF890B797DE5BDD59F47457C415C', '电视、影音', null, '', '1', 'admin', '2013-03-09 14:26:14', '1', 'admin', '2013-03-09 14:27:31', 's');
INSERT INTO `good_kind` VALUES ('E7866D5A6D74048BB92B6B7A17F81571', '019', 'aa', 'DF616139DA54062B9DB2E2E603C4F190', '空调', null, '', '1', 'admin', '2013-03-09 11:37:37', null, null, null, 's');

-- ----------------------------
-- Table structure for good_price
-- ----------------------------
DROP TABLE IF EXISTS `good_price`;
CREATE TABLE `good_price` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '通过代码区分价格类型,如团购价、促销价、会员价之类。\r\n            特殊价格:批发价有多个,且需要输入数量和排序信息',
  `area_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `area_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '普通商品id',
  `good_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL COMMENT '优惠金额',
  `sort` int(11) DEFAULT NULL,
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '首页显示，0：不显示；1：显示',
  `property` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `tag` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_price
-- ----------------------------

-- ----------------------------
-- Table structure for good_relate
-- ----------------------------
DROP TABLE IF EXISTS `good_relate`;
CREATE TABLE `good_relate` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `relate_good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `good_relate_id` (`id`),
  KEY `good_relate_good_id` (`good_id`),
  KEY `good_relate_r_good_id` (`relate_good_id`),
  CONSTRAINT `FK_good_relate_rf_m_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`),
  CONSTRAINT `FK_good_relate_rf_r_good` FOREIGN KEY (`relate_good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_relate
-- ----------------------------

-- ----------------------------
-- Table structure for good_specification
-- ----------------------------
DROP TABLE IF EXISTS `good_specification`;
CREATE TABLE `good_specification` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `code` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `show_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0:文字 1:图片',
  `show_way` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '0:平铺 1:下拉',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `good_specification_id` (`id`),
  KEY `good_specification_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_specification
-- ----------------------------
INSERT INTO `good_specification` VALUES ('5626F0C822B413F4F5E492A08A7199B1', '020', '型号', '0', '1', '', null, '1', 'admin', '2013-05-27 10:39:35', null, null, null, 's');
INSERT INTO `good_specification` VALUES ('A27B1F540522D38215CCA0207F48DCC6', '019', '颜色', '1', '1', '', null, '1', 'admin', '2013-05-27 10:32:41', '1', 'admin', '2013-05-27 10:35:34', 's');
INSERT INTO `good_specification` VALUES ('BD60FAC01415BFCC46196989F454A40C', '022', '大小', '0', '1', '', null, '1', 'admin', '2013-05-29 11:31:46', null, null, null, 's');

-- ----------------------------
-- Table structure for good_specification_val
-- ----------------------------
DROP TABLE IF EXISTS `good_specification_val`;
CREATE TABLE `good_specification_val` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `good_specification_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `good_specification_val_id` (`id`),
  KEY `good_specification_val_gs_id` (`good_specification_id`),
  CONSTRAINT `FK_good_specification_val_rf_gs` FOREIGN KEY (`good_specification_id`) REFERENCES `good_specification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of good_specification_val
-- ----------------------------
INSERT INTO `good_specification_val` VALUES ('06FA815284B58BBBD8F07031FA4C2D83', 'BD60FAC01415BFCC46196989F454A40C', '大', null, '');
INSERT INTO `good_specification_val` VALUES ('16803C297D28BC4F4DC8BD3905FD81BE', 'A27B1F540522D38215CCA0207F48DCC6', '蓝色', null, '');
INSERT INTO `good_specification_val` VALUES ('6338FD98B57E19C94E95A24EF85A93A5', '5626F0C822B413F4F5E492A08A7199B1', '中码', null, '');
INSERT INTO `good_specification_val` VALUES ('6768270831E813A7335FF7B3F0240698', 'A27B1F540522D38215CCA0207F48DCC6', '绿色', null, '');
INSERT INTO `good_specification_val` VALUES ('6DD3E28322C1AE74FF0F7B3A14ADBD34', 'BD60FAC01415BFCC46196989F454A40C', '小', null, '');
INSERT INTO `good_specification_val` VALUES ('8B61B34A6F517371CE083D3EDE5C2AA6', 'A27B1F540522D38215CCA0207F48DCC6', '红色', null, '');
INSERT INTO `good_specification_val` VALUES ('D47BDD5535A193273D56C2C7C46E9D62', '5626F0C822B413F4F5E492A08A7199B1', '小码', null, '');
INSERT INTO `good_specification_val` VALUES ('DD438C6E12D4AF0779184C8480D23301', '5626F0C822B413F4F5E492A08A7199B1', '大码', null, '');
INSERT INTO `good_specification_val` VALUES ('F0136D7149ACB3B0D061A2DA6A183124', 'A27B1F540522D38215CCA0207F48DCC6', '黄色', null, '');
INSERT INTO `good_specification_val` VALUES ('FA53E705B645FAAE828CCA5B1C5962C7', '5626F0C822B413F4F5E492A08A7199B1', '均码', null, '');

-- ----------------------------
-- Table structure for good_type
-- ----------------------------
DROP TABLE IF EXISTS `good_type`;
CREATE TABLE `good_type` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `parent_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '父亲id,0:根节点',
  `code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `level` int(11) DEFAULT NULL COMMENT '层级 1:一级 2:二级  3:三级',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `pic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `is_inventory` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `listShow` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `payment_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delivery_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isParent` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `delivery_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `good_type_id` (`id`),
  KEY `good_type_code` (`code`),
  KEY `good_type_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品类别';

-- ----------------------------
-- Records of good_type
-- ----------------------------
INSERT INTO `good_type` VALUES ('0BCD023CEB1659C6C6CE691157C35C8B', '', '042', '企业IT', '1', '', '9', '1', 'admin', '2013-02-22 14:45:38', '1', 'admin', '2013-02-22 14:56:03', 's', 'B0B670039293AAE8951625FC8629CB92', '/pic/goodType/20130222/B0B670039293AAE8951625FC8629CB92.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('0EB02017DD33A710AAF0BC67A2A12E05', 'DAFFCE97E19311801108E5B952AFD9CF', '035003', 'J2EE', '2', '', '18', '1', 'admin', '2013-02-22 15:17:07', null, null, '2013-02-22 15:17:10', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('17E41E5EBF964B3AEACBFB660CF36ECE', '0BCD023CEB1659C6C6CE691157C35C8B', '042003', '运维管理', '2', '', '47', '1', 'admin', '2013-02-22 15:31:25', null, null, '2013-02-22 15:31:28', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('1A18C4ACCB3F3520E47B1A922A0B5844', '6B89B47FFEEA5A3377631C60DE4631ED', '032002', '硬件架构', '2', '', '32', '1', 'admin', '2013-02-22 15:27:08', null, null, '2013-02-22 15:27:10', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('26E5E1844AA0C3910C980EEF3DFF33A4', '341EB6286A0CFF4977535EDA00ED66D7', '041021005', 'Typescript', '3', '', '52', '1', 'admin', '2013-02-22 15:38:49', null, null, '2013-02-22 15:38:51', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('2CACEFC94CA008D2791F5846F035AB2D', '', '037', '数据库', '1', '', '5', '1', 'admin', '2013-02-22 14:42:28', '1', 'admin', '2013-02-22 14:57:18', 's', '6DE84B96E05BBFCB69DC141DFA9A0177', '/pic/goodType/20130222/6DE84B96E05BBFCB69DC141DFA9A0177.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('2DE8AB0D04978012724A9BDD5F309F2A', 'C8341CD25D5D145A3F444C7DA5D049A0', '036006', '云计算', '2', '', '40', '1', 'admin', '2013-02-22 15:29:28', null, null, '2013-02-22 15:29:30', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('30A18C6B1E51FDD28746F7F10EBDA361', 'D52DF3A08B067EA8F8E7EB04B655FBF6', '038001', '计算机考试', '2', '', '19', '1', 'admin', '2013-02-22 15:17:44', null, null, '2013-02-22 15:17:48', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('341EB6286A0CFF4977535EDA00ED66D7', 'DF616139DA54062B9DB2E2E603C4F190', '041021', '前端进阶', '2', '', '29', '1', 'admin', '2013-02-22 15:26:23', null, null, '2013-02-22 15:26:25', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('372594FE6A0C5B6BFBBC65E3073166B1', '', '043', '其他', '1', '', '10', '1', 'admin', '2013-02-22 14:45:46', '1', 'admin', '2013-02-22 14:55:35', 's', '756086F1D6CFD526139AC94DBBE13957', '/pic/goodType/20130222/756086F1D6CFD526139AC94DBBE13957.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('447CDF390BA52EAB84E77DB5B079D0A4', 'C5A0DD84FFA450547E76203E50F7BFD8', '041022004', 'JavaScript', '3', '', '56', '1', 'admin', '2013-02-22 15:39:48', '1', 'admin', '2013-03-25 09:56:05', 's', null, null, null, null, '', '', '', '1', '');
INSERT INTO `good_type` VALUES ('4B09D67F69D75F6454051D933F2418CC', '940FDF890B797DE5BDD59F47457C415C', '040003', '常用框架', '2', '', '25', '1', 'admin', '2013-02-22 15:19:16', null, null, '2013-02-22 15:19:18', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('5297ABCA8062412192366D0FF7F6F7C8', 'DAFFCE97E19311801108E5B952AFD9CF', '035002', 'ASP.NET', '2', '', '17', '1', 'admin', '2013-02-22 15:16:49', null, null, '2013-02-22 15:16:52', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('5300E3567928D26D3F6439B0213BADF1', '940FDF890B797DE5BDD59F47457C415C', '040001', '电视', '2', '', '23', '1', 'admin', '2013-02-22 15:18:50', null, null, '2013-02-22 15:18:53', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('53194D71C63D87D51CF37D075F3269E2', '', '039', '设计，产品，测试', '1', '', '7', '1', 'admin', '2013-02-22 14:43:15', '1', 'admin', '2013-02-22 14:56:49', 's', 'DD46CFC43E974176E6F1C0E2F98291AC', '/pic/goodType/20130222/DD46CFC43E974176E6F1C0E2F98291AC.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('5B53F7AEC7D39170399E7CCEB365774F', 'C8341CD25D5D145A3F444C7DA5D049A0', '036001', '大数据', '2', '', '35', '1', 'admin', '2013-02-22 15:27:57', null, null, '2013-02-22 15:27:59', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('5D91A0E569007B8AEF8BACBC815892BF', 'D52DF3A08B067EA8F8E7EB04B655FBF6', '038002', '二级Java', '2', '', '20', '1', 'admin', '2013-02-22 15:18:02', null, null, '2013-02-22 15:18:04', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('5E7A2C0EBA1FCDE77BEB6F6520996A28', '6B89B47FFEEA5A3377631C60DE4631ED', '032004', '物联网', '2', '', '34', '1', 'admin', '2013-02-22 15:27:31', null, null, '2013-02-22 15:27:33', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('5F4E95CA5BEA5D3B604DB3CF412DB8AA', '940FDF890B797DE5BDD59F47457C415C', '040004', '游戏开发', '2', '', '26', '1', 'admin', '2013-02-22 15:19:28', null, null, '2013-02-22 15:19:31', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('61A55BF6CA8593F5611A5A4B1AB6C242', '341EB6286A0CFF4977535EDA00ED66D7', '041021008', '前段安全', '3', '', '55', '1', 'admin', '2013-02-22 15:39:36', null, null, '2013-02-22 15:39:38', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('6459A56FCC25FD635B1C85313897A564', 'DAFFCE97E19311801108E5B952AFD9CF', '035001', 'Python', '2', '', '16', '1', 'admin', '2013-02-22 15:16:38', null, null, '2013-02-22 15:16:41', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('67F0A80B23A20EDCB75E184B2260AA28', 'C8341CD25D5D145A3F444C7DA5D049A0', '036003', '虚拟化', '2', '', '37', '1', 'admin', '2013-02-22 15:28:29', null, null, '2013-02-22 15:28:31', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('6942F2C33E644BB9A5C612DE93A4985B', 'E299A8685A117A3666FDFE5A2D999A57', '040005001', 'Android', '3', '', '60', '1', 'admin', '2013-03-26 16:20:27', null, null, '2013-03-26 16:20:41', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('697D973E05ECC5D4E3A4A3C775EE2D66', 'C3AC024C8ECC02D0859A4E68F83B9022', '034011', '基础语言', '2', '', '15', '1', 'admin', '2013-02-22 15:16:01', null, null, '2013-02-22 15:16:04', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('6980F1C07B94C29A1B8D7463694E92DC', '2CACEFC94CA008D2791F5846F035AB2D', '037003', 'MySQL', '2', '', '50', '1', 'admin', '2013-02-22 15:32:23', null, null, '2013-02-22 15:32:26', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('6B89B47FFEEA5A3377631C60DE4631ED', '', '032', '智能硬件，物联网', '1', '', '0', '1', 'admin', '2013-02-22 14:40:43', '1', 'admin', '2013-02-22 14:57:29', 's', '9B2ED7940DFCDDA4CE2DF4EFF0E3D7C9', '/pic/goodType/20130222/9B2ED7940DFCDDA4CE2DF4EFF0E3D7C9.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('6D7FF508D2605BA9E323FCF79F8EA2C2', 'A559BBD3965F833723CFBA08FE544B05', '041020003', 'JQuery UI', '3', '', '51', '1', 'admin', '2013-02-22 15:38:23', null, null, '2013-02-22 15:38:31', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('7DAA735F77B85200AB0225F973D948A1', '6B89B47FFEEA5A3377631C60DE4631ED', '032003', '开源硬件平台', '2', '', '33', '1', 'admin', '2013-02-22 15:27:18', null, null, '2013-02-22 15:27:20', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('80BC1002E34AA4D5EE8BD84AFEDC01EA', '0BCD023CEB1659C6C6CE691157C35C8B', '042002', '操作系统', '2', '', '46', '1', 'admin', '2013-02-22 15:31:03', null, null, '2013-02-22 15:31:06', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('81B91DC257573B8ACA059B777DABD0BC', '341EB6286A0CFF4977535EDA00ED66D7', '041021006', '项目实践', '3', '', '53', '1', 'admin', '2013-02-22 15:39:07', null, null, '2013-02-22 15:39:09', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('87BD2799AA6746E676B754B2668E0394', 'C3AC024C8ECC02D0859A4E68F83B9022', '034008', '计算机基础', '2', '', '12', '1', 'admin', '2013-02-22 15:15:28', null, null, '2013-02-22 15:15:31', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('8C6531346654097B09E3CF6397D3291E', 'C3AC024C8ECC02D0859A4E68F83B9022', '034007', '开发基础', '2', '', '11', '1', 'admin', '2013-02-22 15:15:16', null, null, '2013-02-22 15:15:20', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('93148350EE5DF2C042DC0AF8393913CD', '341EB6286A0CFF4977535EDA00ED66D7', '041021007', '技术前瞻', '3', '', '54', '1', 'admin', '2013-02-22 15:39:20', null, null, '2013-02-22 15:39:23', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('940FDF890B797DE5BDD59F47457C415C', '', '040', '移动开发', '1', null, '8', '1', 'admin', '2013-02-22 14:43:29', '1', 'admin', '2016-02-22 12:19:13', 's', '5D110EB110E042858A1B7A2D31C4EADC', '/pic/goodType/20130222/5D110EB110E042858A1B7A2D31C4EADC.jpg', '0', null, '15CC1CDE29061045FBC7C739776F2156,E9F4618DAA40560130F949E5631A32C4,002CD639B3EA69BA3EBBAC2743F06F18,', '信用卡,支付宝,在线支付,', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('98BBC7983B0AC5D1B93BACF1038979B6', '697D973E05ECC5D4E3A4A3C775EE2D66', '034011001', 'Java', '3', '', '59', '1', 'admin', '2013-02-27 09:55:43', null, null, '2013-02-27 09:55:57', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('9A64226C4BAF0F5558EE42D9775192E2', '940FDF890B797DE5BDD59F47457C415C', '040002', '音响', '2', '', '24', '1', 'admin', '2013-02-22 15:19:02', null, null, '2013-02-22 15:19:05', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('9EFE09E1B326B35A761C66A65CA1BAA6', '53194D71C63D87D51CF37D075F3269E2', '039002', '设计基础', '2', '', '42', '1', 'admin', '2013-02-22 15:30:10', null, null, '2013-02-22 15:30:12', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('A2E46FA82BA28A3116D908D8C1DA2C09', 'C3AC024C8ECC02D0859A4E68F83B9022', '034010', '开发工具', '2', '', '14', '1', 'admin', '2013-02-22 15:15:50', null, null, '2013-02-22 15:15:53', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('A310B18EAC890B0CADB55C13FFA8C536', 'C3AC024C8ECC02D0859A4E68F83B9022', '034009', '开放标准', '2', '', '13', '1', 'admin', '2013-02-22 15:15:39', null, null, '2013-02-22 15:15:42', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('A35D0A5582993F981708E661D0AA5BBD', 'D52DF3A08B067EA8F8E7EB04B655FBF6', '038004', 'Linux认证', '2', '', '22', '1', 'admin', '2013-02-22 15:18:31', null, null, '2013-02-22 15:18:34', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('A559BBD3965F833723CFBA08FE544B05', 'DF616139DA54062B9DB2E2E603C4F190', '041020', '前端框架', '2', '', '28', '1', 'admin', '2013-02-22 15:26:12', null, null, '2013-02-22 15:26:15', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('A779B77DD585507D38282574DF7CFE57', 'C5A0DD84FFA450547E76203E50F7BFD8', '041022005', 'HTML5', '3', '', '57', '1', 'admin', '2013-02-22 15:40:01', null, null, '2013-02-22 15:40:03', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('BC94F6B2B988EBCD8953BB0EC333E016', 'C5A0DD84FFA450547E76203E50F7BFD8', '041022006', 'CSS3', '3', '', '58', '1', 'admin', '2013-02-22 15:40:12', '1', 'admin', '2013-02-26 11:27:26', 's', null, null, null, null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('BFE826FD023E1E2368656F121CF6B9BB', '2CACEFC94CA008D2791F5846F035AB2D', '037001', 'Oracle', '2', '', '48', '1', 'admin', '2013-02-22 15:31:46', null, null, '2013-02-22 15:31:49', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('C0871BA6086ADA88AFB6E1C546B3C8F9', 'D52DF3A08B067EA8F8E7EB04B655FBF6', '038003', '思科认证', '2', '', '21', '1', 'admin', '2013-02-22 15:18:16', null, null, '2013-02-22 15:18:19', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('C3AC024C8ECC02D0859A4E68F83B9022', '', '034', '基础知识', '1', '', '2', '1', 'admin', '2013-02-22 14:41:33', '1', 'admin', '2013-02-22 14:58:23', 's', '72CB91B991C4B08985766CD78E25AB3B', '/pic/goodType/20130222/72CB91B991C4B08985766CD78E25AB3B.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('C5A0DD84FFA450547E76203E50F7BFD8', 'DF616139DA54062B9DB2E2E603C4F190', '041022', '前端基础', '2', '', '30', '1', 'admin', '2013-02-22 15:26:37', '1', 'admin', '2013-03-01 09:26:14', 's', null, null, null, '0', '15CC1CDE29061045FBC7C739776F2156,E9F4618DAA40560130F949E5631A32C4,002CD639B3EA69BA3EBBAC2743F06F18,', '信用卡,支付宝,在线支付,', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('C8341CD25D5D145A3F444C7DA5D049A0', '', '036', '云计算，大数据', '1', '', '4', '1', 'admin', '2013-02-22 14:41:57', '1', 'admin', '2013-02-22 14:57:46', 's', 'CD7C04D5ABA652CA6EFCA669D6E25329', '/pic/goodType/20130222/CD7C04D5ABA652CA6EFCA669D6E25329.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('D52DF3A08B067EA8F8E7EB04B655FBF6', '', '038', '认证考试', '1', '', '6', '1', 'admin', '2013-02-22 14:42:51', '1', 'admin', '2013-02-22 14:57:02', 's', '0A2E5C0BE4CF7EBC15E181E5730C2D38', '/pic/goodType/20130222/0A2E5C0BE4CF7EBC15E181E5730C2D38.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('DAFFCE97E19311801108E5B952AFD9CF', '', '035', '后端开发', '1', null, '3', '1', 'admin', '2013-02-22 14:41:43', '1', 'admin', '2016-02-22 12:18:59', 's', '84F7C53D8C884A511D504FA8D765E9ED', '/pic/goodType/20130222/84F7C53D8C884A511D504FA8D765E9ED.jpg', '0', null, '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('DF616139DA54062B9DB2E2E603C4F190', '', '041', '前端开发', '1', null, '9', '1', 'admin', '2013-02-22 14:43:55', '1', 'admin', '2016-02-22 12:18:51', 's', '9B7DE68716691D2BCA0765DD7B79B0D0', '/pic/goodType/20130226/9B7DE68716691D2BCA0765DD7B79B0D0.gif', '0', null, '15CC1CDE29061045FBC7C739776F2156,E9F4618DAA40560130F949E5631A32C4,002CD639B3EA69BA3EBBAC2743F06F18,', '信用卡,支付宝,在线支付,', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('E299A8685A117A3666FDFE5A2D999A57', '940FDF890B797DE5BDD59F47457C415C', '040005', '应用开发', '2', '', '27', '1', 'admin', '2013-02-22 15:19:45', null, null, '2013-02-22 15:19:48', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '1', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('E568056E834620CB744599C20D4E4D46', '6B89B47FFEEA5A3377631C60DE4631ED', '032001', '通信链路技术', '2', '', '31', '1', 'admin', '2013-02-22 15:26:57', null, null, '2013-02-22 15:26:59', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('EBD9161D47BB16D5EC519647DE0A408E', '372594FE6A0C5B6BFBBC65E3073166B1', '043001', '影音导航', '2', '', '43', '1', 'admin', '2013-02-22 15:30:23', null, null, '2013-02-22 15:30:26', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('F0EAFC06A853C56ED5DD4A49E146ABAE', '53194D71C63D87D51CF37D075F3269E2', '039001', '游戏设计', '2', '', '41', '1', 'admin', '2013-02-22 15:29:50', null, null, '2013-02-22 15:30:01', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('F112262DDD8B9971CA8177239CD0380A', '0BCD023CEB1659C6C6CE691157C35C8B', '042001', '企业服务', '2', '', '45', '1', 'admin', '2013-02-22 15:30:53', null, null, '2013-02-22 15:30:55', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('F7A8015F4DD01BD7269B869B99550DC5', '2CACEFC94CA008D2791F5846F035AB2D', '037002', 'MangoDB', '2', '', '49', '1', 'admin', '2013-02-22 15:32:00', null, null, '2013-02-22 15:32:02', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');
INSERT INTO `good_type` VALUES ('FE1CEC14C231A291695FC7BE0FEB8DD0', '372594FE6A0C5B6BFBBC65E3073166B1', '043002', '电源/电器', '2', '', '44', '1', 'admin', '2013-02-22 15:30:36', null, null, '2013-02-22 15:30:40', 's', null, null, null, '0', '', '', 'A001A54F19382714765406FD8E8BAAF4,5D3FD9FCEE2AB84586590C15AEFF9624,3493A80ACD622FAC33CDB708C3CC4B9B,', '0', '快递,公司配送,物流,');

-- ----------------------------
-- Table structure for greeting_card
-- ----------------------------
DROP TABLE IF EXISTS `greeting_card`;
CREATE TABLE `greeting_card` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of greeting_card
-- ----------------------------

-- ----------------------------
-- Table structure for group_good
-- ----------------------------
DROP TABLE IF EXISTS `group_good`;
CREATE TABLE `group_good` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `code` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品编码',
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '品名',
  `good_type_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别编码',
  `good_type_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别名称',
  `good_kind_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_kind_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类别名称',
  `brand_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `brand_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `supplier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `supplier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `unit` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `purchase_price` decimal(18,2) DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `price_market` decimal(18,2) DEFAULT NULL,
  `price_group_buy` decimal(18,2) DEFAULT NULL COMMENT '团购价',
  `credits` int(11) DEFAULT '0' COMMENT '积分',
  `pic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片',
  `tag` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `begin_sale_time` datetime DEFAULT NULL COMMENT '上架时间',
  `end_sale_time` datetime DEFAULT NULL COMMENT '下架时间',
  `order_multiple` int(11) DEFAULT NULL,
  `total_sales` int(11) DEFAULT NULL,
  `daily_net_sales` int(11) DEFAULT NULL,
  `purchase_num` int(11) DEFAULT NULL,
  `total_cost_inventory` decimal(18,2) DEFAULT NULL,
  `average_cost_inventory` decimal(18,2) DEFAULT NULL,
  `inventory_min` int(11) DEFAULT NULL,
  `inventory_max` int(11) DEFAULT NULL,
  `index_show` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0或空:不显示 1:显示 ',
  `barcode` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:下架',
  `is_inventory` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0普通 1团购',
  `initialNum` decimal(18,0) DEFAULT NULL COMMENT '期初初始数量',
  `tax_rate` decimal(10,2) DEFAULT NULL COMMENT '税率',
  `tax_price` decimal(10,2) DEFAULT NULL COMMENT '含税单价',
  `property` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商品属性',
  `remark` varchar(160) COLLATE utf8_bin DEFAULT NULL,
  `area_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `click_number` decimal(18,0) DEFAULT NULL,
  `delivery_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `payment_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL COMMENT '商品的评论数',
  `group_number` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL COMMENT '开始团购时间/开始抢购时间/开始秒杀时间',
  `is_next` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '下期预告',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of group_good
-- ----------------------------

-- ----------------------------
-- Table structure for group_good_type
-- ----------------------------
DROP TABLE IF EXISTS `group_good_type`;
CREATE TABLE `group_good_type` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `parent_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '父亲id,0:根节点',
  `code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `level` int(11) DEFAULT NULL COMMENT '层级 1:一级 2:二级  3:三级',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `pic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `good_type_id` (`id`),
  KEY `good_type_code` (`code`),
  KEY `good_type_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品类别';

-- ----------------------------
-- Records of group_good_type
-- ----------------------------

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '信息类别，公告：0，新闻：1，资讯：2',
  `title` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `area_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `area_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `regulation_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '规则类型：  0团购规则  1抢购规则  2秒杀规则   3优惠卷规则',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('063E8FAA8AF001D274F5E6AE8E87E4DD', 'NR009', '3', '购物指南', 0x3C503E266E6273703BE8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D973C2F503E0A3C503E266E6273703B3C2F503E0A3C503EE8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D973C2F503E0A3C503E266E6273703B3C2F503E0A3C503EE8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D97E8B4ADE789A9E68C87E58D973C2F503E, '1', 'admin', '2013-06-05 00:00:00', null, null, null, 'c', '394C3BE7E3080599F14431A208FB8710', '广东省广州市', null);
INSERT INTO `information` VALUES ('40DBC74094C860CC5310A421FB7BDB1E', 'GZ018', '9', 'tuantuan', 0x3C503EE59BA2E59BA2E59BA2266E6273703B3C2F503E, '1', 'admin', '2013-03-06 00:00:00', null, null, null, 'c', '', '', '0');
INSERT INTO `information` VALUES ('92C0F559DDB7F195BBB65EB8A9923008', 'GZ020', '9', 'qiangqiang', 0x3C503EE68AA2E68AA2E68AA2266E6273703B3C2F503E, '1', 'admin', '2013-03-06 00:00:00', null, null, null, 'c', '', '', '1');
INSERT INTO `information` VALUES ('9C6022825E19F162B495783FEA7A46BA', 'GZ016', '9', 'sdf', 0x3C503E736466736673647364667364667366736466266E6273703B3C2F503E, '1', 'admin', '2013-03-04 00:00:00', null, null, null, 'c', '', '', '2');
INSERT INTO `information` VALUES ('B4CBCADD8C08FE07BAA148CB2BC84C94', 'AM023', '0', '欢迎来到上理在线学院，入学须知', 0x3C703E7364666666666666666666666666666666666666666666666666666673646464646464646464646464646466666666666666666666666666666666666666666665656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656566666666666666666666666666666665656565656573666666666666666666666666666666666666666665656565656565737373737373737373656565737366266E6273703B3C2F703E3C703E3C62723E3C2F703E, '1', 'admin', '2013-03-09 00:00:00', null, null, null, 'c', '', '', null);
INSERT INTO `information` VALUES ('DC63D6B1CBB553C98295E6640183E4AB', 'AM025', '0', '选课指南', 0x3C703E323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323C2F703E3C703E3232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232266E6273703B3C2F703E3C703E3C62723E3C2F703E, '1', 'admin', '2013-03-09 00:00:00', null, null, null, 'c', '', '', null);

-- ----------------------------
-- Table structure for magazine
-- ----------------------------
DROP TABLE IF EXISTS `magazine`;
CREATE TABLE `magazine` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `instruction` text COLLATE utf8_bin,
  `document_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `document_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of magazine
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `message_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `reply_state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0:未回复\r\n            1:已回复',
  `state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'c:咨询   s:留言',
  `type` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`),
  KEY `Index_2` (`message_id`),
  KEY `Index_3` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for packaging
-- ----------------------------
DROP TABLE IF EXISTS `packaging`;
CREATE TABLE `packaging` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '广告id',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '包装名称',
  `packaging_fee` decimal(18,2) DEFAULT NULL,
  `min_for_free` decimal(18,2) DEFAULT NULL,
  `package_description` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `pic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 'c' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of packaging
-- ----------------------------
INSERT INTO `packaging` VALUES ('37610D75A22FC46FDC3BD89062F000C4', 'PK201209200002', '发送到', '1.00', '12.00', '对双方都', '', '', '1', 'admin', '2012-09-20 15:50:04', null, null, null, 'c');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `payment_fee` decimal(18,2) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `payment_id` (`id`),
  KEY `payment_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', '0.00', '', '1', 'admin', '2011-09-21 09:37:24', '1', 'admin', '2013-01-23 15:26:58', 's');
INSERT INTO `payment` VALUES ('15CC1CDE29061045FBC7C739776F2156', '1001', '信用卡', '0.00', '', '1', 'admin', '2013-01-29 10:53:01', '', '', null, 's');
INSERT INTO `payment` VALUES ('E9F4618DAA40560130F949E5631A32C4', 'alipay', '支付宝', '0.00', '', '1', 'admin', '2011-09-21 09:49:41', '', '', null, 's');

-- ----------------------------
-- Table structure for prepaid
-- ----------------------------
DROP TABLE IF EXISTS `prepaid`;
CREATE TABLE `prepaid` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `prepaid_money` decimal(18,2) DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `handler_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `handler_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `dept_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of prepaid
-- ----------------------------
INSERT INTO `prepaid` VALUES ('5C84B0B5E25B0171124791ECDA682B5F', 'CZ201201030002', 'D59F75F037977E98C25A7B6469EAA68B', '罗平1', '1000.00', 'nihao ', '1', 'admin', null, null, '1', 'admin', '2012-01-03 00:00:00', '1', 'admin', '2012-01-03 11:16:54', 's', null);
INSERT INTO `prepaid` VALUES ('9787A7039E483712AEFA7361138DDCDD', 'CZ201203140002', 'CA794EC39F0C4337693997A066DEB333', '王冰', '321.00', '', '1', 'admin', null, null, '1', 'admin', '2012-03-14 00:00:00', null, null, null, 'c', null);
INSERT INTO `prepaid` VALUES ('B697E167994B5AC7002B61C671711B30', 'CZ201203140001', 'CA794EC39F0C4337693997A066DEB333', '王冰', '200.00', '', '1', 'admin', null, null, '1', 'admin', '2012-03-14 00:00:00', null, null, null, 'c', null);
INSERT INTO `prepaid` VALUES ('E2C052D6F8A95A1249A7CE935D8F2F9B', 'CZ201202160002', 'A78ECE1A2D985FC55FD10E6034B68214', 'jobto', '100.00', '', '1', 'admin', null, null, '1', 'admin', '2012-02-16 00:00:00', null, null, null, 'c', null);
INSERT INTO `prepaid` VALUES ('EA8CE70FDBB8F7074E1223F3C2B61F97', 'CZ201203140003', 'CA794EC39F0C4337693997A066DEB333', '王冰', '554.00', '', '1', 'admin', null, null, '1', 'admin', '2012-03-14 00:00:00', null, null, null, 'c', null);
INSERT INTO `prepaid` VALUES ('FC5B10399B8097EFCC0F48D4CBDFBEA0', 'CZ201204180001', '0CB59EDFF323A86CBAADE19A3FB0A002', 'show123', '100.00', '', '1', 'admin', null, null, '1', 'admin', '2012-04-18 00:00:00', null, null, null, 'c', null);

-- ----------------------------
-- Table structure for promotecolumn
-- ----------------------------
DROP TABLE IF EXISTS `promotecolumn`;
CREATE TABLE `promotecolumn` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column_No` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `describes` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of promotecolumn
-- ----------------------------

-- ----------------------------
-- Table structure for promote_good
-- ----------------------------
DROP TABLE IF EXISTS `promote_good`;
CREATE TABLE `promote_good` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `promote_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `price_market` decimal(18,2) DEFAULT NULL,
  `price_promote` decimal(18,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`promote_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`promote_id`) REFERENCES `promote_topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of promote_good
-- ----------------------------

-- ----------------------------
-- Table structure for promote_topic
-- ----------------------------
DROP TABLE IF EXISTS `promote_topic`;
CREATE TABLE `promote_topic` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `subject` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `intro` text COLLATE utf8_bin,
  `pic` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `pic_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `column_No` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `column_Name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `describes` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `uri` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 'c' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `goodType_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `goodType_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of promote_topic
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_activity`;
CREATE TABLE `promotion_activity` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `intro` text COLLATE utf8_bin,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `pic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片',
  `vip_level_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `vip_level_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 'c' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of promotion_activity
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_activity_good
-- ----------------------------
DROP TABLE IF EXISTS `promotion_activity_good`;
CREATE TABLE `promotion_activity_good` (
  `id` varchar(32) NOT NULL,
  `promote_id` varchar(64) DEFAULT NULL,
  `good_id` varchar(32) DEFAULT NULL,
  `good_name` varchar(64) DEFAULT NULL,
  `price_market` decimal(18,0) DEFAULT NULL,
  `price_promote` decimal(18,0) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of promotion_activity_good
-- ----------------------------

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `iid` int(11) DEFAULT NULL,
  `value` int(5) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `good_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES ('1', '1', '2', '3', '2016-02-21 15:49:58', '10D4D386D2058D089857902C636A3A76');
INSERT INTO `recommend` VALUES ('2', '2', '2', '2', '2016-02-21 15:50:15', '10D4D386D2058D089857902C636A3A76');
INSERT INTO `recommend` VALUES ('3', '5', '2', '3', '2016-02-21 15:50:22', '10D4D386D2058D089857902C636A3A76');
INSERT INTO `recommend` VALUES ('29', '1', '1', '5', '2016-02-21 16:18:53', '0E1CDDD8CD9B22019119D80452312CDD');
INSERT INTO `recommend` VALUES ('30', '1', '3', '2', '2016-02-21 16:18:53', '352AAA65A4ABD234548388103F997858');
INSERT INTO `recommend` VALUES ('31', '2', '1', '2', '2016-02-21 16:18:53', '0E1CDDD8CD9B22019119D80452312CDD');
INSERT INTO `recommend` VALUES ('32', '2', '3', '5', '2016-02-21 16:18:53', '352AAA65A4ABD234548388103F997858');
INSERT INTO `recommend` VALUES ('33', '2', '4', '2', '2016-02-21 16:18:53', 'A1461B2408974E05BAA2D9AEB942AC99');
INSERT INTO `recommend` VALUES ('34', '3', '1', '2', '2016-02-21 16:18:54', '0E1CDDD8CD9B22019119D80452312CDD');
INSERT INTO `recommend` VALUES ('35', '3', '4', '4', '2016-02-21 16:18:54', 'A1461B2408974E05BAA2D9AEB942AC99');
INSERT INTO `recommend` VALUES ('36', '3', '5', '4', '2016-02-21 16:18:54', 'C7A867F54327A355FAC7204CC1509992');
INSERT INTO `recommend` VALUES ('38', '4', '1', '5', '2016-02-21 16:18:54', '0E1CDDD8CD9B22019119D80452312CDD');
INSERT INTO `recommend` VALUES ('39', '4', '3', '3', '2016-02-21 16:18:54', '352AAA65A4ABD234548388103F997858');
INSERT INTO `recommend` VALUES ('40', '4', '4', '4', '2016-02-21 16:18:54', 'A1461B2408974E05BAA2D9AEB942AC99');
INSERT INTO `recommend` VALUES ('41', '4', '6', '4', '2016-02-21 16:18:54', 'CAFCEFC45E06F771DE0DC20DD7F60C1D');
INSERT INTO `recommend` VALUES ('42', '5', '1', '4', '2016-02-21 16:18:54', '0E1CDDD8CD9B22019119D80452312CDD');
INSERT INTO `recommend` VALUES ('43', '5', '3', '2', '2016-02-21 16:18:54', '352AAA65A4ABD234548388103F997858');
INSERT INTO `recommend` VALUES ('44', '5', '4', '4', '2016-02-21 16:18:54', 'A1461B2408974E05BAA2D9AEB942AC99');
INSERT INTO `recommend` VALUES ('45', '5', '5', '3', '2016-02-21 16:18:54', 'C7A867F54327A355FAC7204CC1509992');
INSERT INTO `recommend` VALUES ('46', '5', '6', '4', '2016-02-21 16:18:54', 'CAFCEFC45E06F771DE0DC20DD7F60C1D');
INSERT INTO `recommend` VALUES ('47', '6', '2', '4', '2016-02-21 16:18:54', '10D4D386D2058D089857902C636A3A76');
INSERT INTO `recommend` VALUES ('48', '6', '3', '2', '2016-02-21 16:18:54', '352AAA65A4ABD234548388103F997858');
INSERT INTO `recommend` VALUES ('49', '6', '5', '3', '2016-02-21 16:18:54', 'C7A867F54327A355FAC7204CC1509992');

-- ----------------------------
-- Table structure for sale_collection
-- ----------------------------
DROP TABLE IF EXISTS `sale_collection`;
CREATE TABLE `sale_collection` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `money_account` decimal(18,2) DEFAULT NULL,
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `linkman` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `payment_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `payment_code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `payment_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `payment_state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0,未收款\r\n            1,已收款',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `handler_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `handler_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `dept_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 t:临时 c:草稿 s;审核 d:撤销',
  PRIMARY KEY (`id`),
  KEY `sale_collection_id` (`id`),
  KEY `sale_collection_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sale_collection
-- ----------------------------

-- ----------------------------
-- Table structure for sale_collection_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_collection_item`;
CREATE TABLE `sale_collection_item` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `collection_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `money_account` decimal(18,2) DEFAULT NULL,
  `money_already_received` decimal(18,2) DEFAULT NULL,
  `money_current_received` decimal(18,2) DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sale_collection_item
-- ----------------------------

-- ----------------------------
-- Table structure for sale_delivery
-- ----------------------------
DROP TABLE IF EXISTS `sale_delivery`;
CREATE TABLE `sale_delivery` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `money_account` decimal(18,2) DEFAULT NULL,
  `money_received` decimal(18,2) DEFAULT NULL,
  `delivery_cost` decimal(18,2) DEFAULT NULL,
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `linkman` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `delivery_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `delivery_code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `delivery_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `delivery_state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0未发货\r\n            1,已发货',
  `payment_state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0,未收款\r\n            1,已付部分\r\n            2,已付清',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `handler_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `handler_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `dept_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 t:临时 c:草稿 s;审核 d:撤销',
  PRIMARY KEY (`id`),
  KEY `sale_delivery_id` (`id`),
  KEY `sale_delivery_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sale_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0:商城订单 1:线下订单',
  `warehouse_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `price_discount` decimal(18,2) DEFAULT NULL,
  `order_money` decimal(18,2) DEFAULT NULL,
  `linkman` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `zip_code` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `payment_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `payment_code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `payment_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `delivery_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `delivery_code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `delivery_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `delivery_date` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0:仅工作日 1:任意日期 2:仅休息日',
  `delivery_cost` decimal(18,2) DEFAULT NULL,
  `order_state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0,未审核\r\n            1，已审核',
  `payment_state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0,未收款\r\n            1,已付部分\r\n            2,已付清',
  `delivery_state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0未发货\r\n            1,已发货',
  `delivery_time` datetime DEFAULT NULL,
  `collection_time` datetime DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `handler_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `handler_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `dept_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 t:临时 c:草稿 s;审核 d:撤销',
  `invoice_type` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `invoice_payable` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `invoice_content` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `total_credits` decimal(18,0) DEFAULT NULL COMMENT '总积分',
  `zfb_trade_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '支付宝号',
  `tax_Amount` double(10,2) unsigned DEFAULT '0.00' COMMENT '含税金额',
  `iscancel` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `orderstate_time` datetime DEFAULT NULL COMMENT '审核时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `return_time` datetime DEFAULT NULL COMMENT '退货日期',
  `cancel_time` datetime DEFAULT NULL COMMENT '取消订单时间',
  `bank_code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_order_id` (`id`),
  KEY `order_code` (`code`),
  KEY `order_customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES ('00E3BF7B9F2ECA4B6F5A0317719CB19A', 'DH201305310739', '0', null, null, null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '0.00', '309.00', 'yan', '广东省-广州市-天河区xxx', '13526998588', '020-12569852', '1021904426@qq.com', '202020', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', '3493A80ACD622FAC33CDB708C3CC4B9B', 'A01', '物流', '0', '10.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-05-31 10:51:47', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'ICBCB2C');
INSERT INTO `sale_order` VALUES ('07231B305812D6B0239F2D1A45B58490', 'DH201307310746', '0', null, null, null, null, '0111', null, '0.00', '12.10', '123', '天津-北辰-北辰wlkejfldsaf', '13698745621', '020-25478411', null, '524101', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '12.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, '0111', null, '2013-07-31 15:30:13', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'ZFB');
INSERT INTO `sale_order` VALUES ('18B1065F786A7F7AACF245C69BB6444E', 'DH201306010744', '0', null, null, null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '0.00', '311.00', '8888', '台湾-桃园-桃园ooooooo', '13569856236', '202-36985623', '1021904426@qq.com', '767676', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '12.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-06-01 17:50:32', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'CMB');
INSERT INTO `sale_order` VALUES ('39744A89B44210AB1AB3115D17252517', 'DH201305310740', '0', null, null, null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '0.00', '31.00', 'yan', '广东省-广州市-天河区xxx', '13526998588', '020-12569852', '1021904426@qq.com', '202020', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '12.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-05-31 10:58:51', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'ICBCB2C');
INSERT INTO `sale_order` VALUES ('6BF05DFE17766C160AFB403CCD02A008', 'DH201306010741', '0', null, null, null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '0.00', '311.00', '8888', '台湾-桃园-桃园ooooooo', '13569856236', '202-36985623', '1021904426@qq.com', '767676', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '12.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-06-01 14:44:00', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'ICBCB2C');
INSERT INTO `sale_order` VALUES ('8B9DA2A2310C759FF8EDF5DB5B7F4A9D', 'DH201602190748', '0', null, null, null, null, '6094FF4D3B6D06258A442CDE6B97A8D6', 'dallas110', '0.00', '299.20', null, '', null, null, null, null, '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '0.20', '0', '0', '0', null, null, null, '1', 'admin', null, null, '6094FF4D3B6D06258A442CDE6B97A8D6', 'dallas110', '2016-02-19 21:47:17', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'ICBCB2C');
INSERT INTO `sale_order` VALUES ('8E51B12FE6369212BDC050F7197C021D', 'DH201306010743', '0', null, null, null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '0.00', '311.00', '8888', '台湾-桃园-桃园ooooooo', '13569856236', '202-36985623', '1021904426@qq.com', '767676', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '12.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-06-01 17:44:00', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'ICBCB2C');
INSERT INTO `sale_order` VALUES ('BC1E8D5577B95B9471BE470C9342DD2F', 'DH201306010742', '0', null, null, null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '0.00', '311.00', '8888', '台湾-桃园-桃园ooooooo', '13569856236', '202-36985623', '1021904426@qq.com', '767676', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '12.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-06-01 14:51:05', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'ICBCB2C');
INSERT INTO `sale_order` VALUES ('BF4AC4EA0CB67DFAD74CB47E29AE5C42', 'DH201306010745', '0', null, null, null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '0.00', '90.00', '8888', '台湾-桃园-桃园ooooooo', '13569856236', '202-36985623', '1021904426@qq.com', '767676', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '12.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-06-01 17:58:19', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'CMB');
INSERT INTO `sale_order` VALUES ('F8314E2CD34B037528DDA56A5372604B', 'DH201305310738', '0', null, null, null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '0.00', '311.00', 'yan', '广东省-广州市-天河区xxx', '13526998588', '020-12569852', '1021904426@qq.com', '202020', '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '12.00', '0', '0', '0', null, null, null, '1', 'admin', null, null, 'A57C594647AA70524E089F495DD5BD19', 'yanlijiao', '2013-05-31 10:48:55', null, null, null, 's', null, null, null, '0', null, '0.00', '0', null, null, null, null, 'CMB');
INSERT INTO `sale_order` VALUES ('FFEC7AB76B2FA2C20400A33B8FC56AF1', 'DH201602190747', '0', null, null, null, null, '6094FF4D3B6D06258A442CDE6B97A8D6', 'dallas110', '0.00', '97.20', null, '', null, null, null, null, '002CD639B3EA69BA3EBBAC2743F06F18', 'payonline', '在线支付', 'A001A54F19382714765406FD8E8BAAF4', 'A03', '快递', '0', '0.20', '0', '0', '0', null, null, null, '1', 'admin', null, null, '6094FF4D3B6D06258A442CDE6B97A8D6', 'dallas110', '2016-02-19 21:42:59', null, null, null, 's', null, null, null, '0', null, '0.00', '1', null, null, null, '2016-02-19 21:46:39', 'ICBCB2C');

-- ----------------------------
-- Table structure for sale_return
-- ----------------------------
DROP TABLE IF EXISTS `sale_return`;
CREATE TABLE `sale_return` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `bank_account_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `money_account` decimal(18,2) DEFAULT NULL,
  `delivery_cost` decimal(18,2) DEFAULT NULL,
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `customer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `linkman` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `delivery_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `delivery_code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `delivery_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `return_state` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0未发货\r\n            1,已发货',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `handler_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `handler_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `dept_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 t:临时 c:草稿 s;审核 d:撤销',
  `returntype` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT ' //0:返修  1:换货  2:退货',
  `returnContent` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '原因',
  `isinvoice` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '有无发票',
  `returngoodtype` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `deliveryAddress` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地址，省市区',
  `street` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '街道 ',
  `intro_delivery` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '附件，商品的包装清单  0,有   1，无',
  `orderstate_time` datetime DEFAULT NULL COMMENT '审核时间',
  `return_time` datetime DEFAULT NULL COMMENT '退货时间',
  `receive_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_delivery_id` (`id`),
  KEY `sale_delivery_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sale_return
-- ----------------------------

-- ----------------------------
-- Table structure for sale_ware
-- ----------------------------
DROP TABLE IF EXISTS `sale_ware`;
CREATE TABLE `sale_ware` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0:销售  1发货 2退货',
  `sale_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ware_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_position_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_position_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `order_number` decimal(18,2) DEFAULT NULL,
  `good_price` decimal(18,2) DEFAULT NULL,
  `money` decimal(18,2) DEFAULT NULL,
  `credits` decimal(18,0) DEFAULT NULL,
  `price_discount` decimal(18,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `return_rate` decimal(18,2) DEFAULT NULL,
  `return_money` decimal(18,2) DEFAULT NULL,
  `ware_specification` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_ware_id` (`id`),
  KEY `sale_ware_sale_id` (`sale_id`),
  KEY `sale_ware_ware_id` (`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sale_ware
-- ----------------------------
INSERT INTO `sale_ware` VALUES ('0BA3BFBBE637396A5B5CE456B612B1A8', '0', '39744A89B44210AB1AB3115D17252517', '6BD93E890B38F183D701426C3BC2090B', null, null, '1.00', '19.00', '19.00', null, '0.00', '0', null, null, null);
INSERT INTO `sale_ware` VALUES ('29C7FFAC1D82639DA56E000FCB2C34E8', '0', 'F8314E2CD34B037528DDA56A5372604B', '1836EC821891BE53888A0787A70EF873', null, null, '1.00', '299.00', '299.00', null, '0.00', '0', null, null, null);
INSERT INTO `sale_ware` VALUES ('2CAE2ABF84269409943CFACC69C66A9F', '0', 'BC1E8D5577B95B9471BE470C9342DD2F', '1836EC821891BE53888A0787A70EF873', null, null, '1.00', '299.00', '299.00', null, '0.00', '0', null, null, '红色,大');
INSERT INTO `sale_ware` VALUES ('2F578D4D42DD0D3FEA851C16356CF72C', '0', '07231B305812D6B0239F2D1A45B58490', '201367C4FE81312C5BF96228F2F5DB7B', null, null, '1.00', '0.10', '0.10', null, '0.00', '0', null, null, '');
INSERT INTO `sale_ware` VALUES ('3F9054F21CD07D5BD6A55749B7940938', '0', '00E3BF7B9F2ECA4B6F5A0317719CB19A', '1836EC821891BE53888A0787A70EF873', null, null, '1.00', '299.00', '299.00', null, '0.00', '0', null, null, null);
INSERT INTO `sale_ware` VALUES ('63D3056E687D7D58D3ABD4D2029290DE', '0', 'FFEC7AB76B2FA2C20400A33B8FC56AF1', '6BD93E890B38F183D701426C3BC2090B', null, null, '1.00', '19.00', '19.00', null, '0.00', '1', null, null, '');
INSERT INTO `sale_ware` VALUES ('657334143D9C75C38B202666B39F9903', '0', '18B1065F786A7F7AACF245C69BB6444E', 'A8C8B8DAC7E98A64204D0FBDB9D7A389', null, null, '1.00', '299.00', '299.00', null, '0.00', '0', null, null, '红色,小');
INSERT INTO `sale_ware` VALUES ('7E130A23B75D89C053B08A0C4778231E', '0', '8B9DA2A2310C759FF8EDF5DB5B7F4A9D', '1836EC821891BE53888A0787A70EF873', null, null, '1.00', '299.00', '299.00', null, '0.00', '0', null, null, '红色,大');
INSERT INTO `sale_ware` VALUES ('894EF661D77A274E13CB698795B743A0', '0', '8E51B12FE6369212BDC050F7197C021D', '1836EC821891BE53888A0787A70EF873', null, null, '1.00', '299.00', '299.00', null, '0.00', '0', null, null, '红色,大');
INSERT INTO `sale_ware` VALUES ('B5DFC44CFC42F2362CBDBC3D9D619AAE', '0', '6BF05DFE17766C160AFB403CCD02A008', '1836EC821891BE53888A0787A70EF873', null, null, '1.00', '299.00', '299.00', null, '0.00', '0', null, null, null);
INSERT INTO `sale_ware` VALUES ('D327ADD7FDBD08ECAD77B07E2B6795C5', '0', 'FFEC7AB76B2FA2C20400A33B8FC56AF1', '21E7079035BB929F096D9CDF526B175D', null, null, '1.00', '78.00', '78.00', null, '0.00', '0', null, null, '');
INSERT INTO `sale_ware` VALUES ('E4032B75CD87481344E3D819AE55BF34', '0', 'BF4AC4EA0CB67DFAD74CB47E29AE5C42', '21E7079035BB929F096D9CDF526B175D', null, null, '1.00', '78.00', '78.00', null, '0.00', '0', null, null, '');

-- ----------------------------
-- Table structure for serial_number
-- ----------------------------
DROP TABLE IF EXISTS `serial_number`;
CREATE TABLE `serial_number` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `app_type` varchar(18) COLLATE utf8_bin NOT NULL,
  `serial_date` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serial_number_id` (`id`),
  KEY `serial_app_type` (`app_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流水号';

-- ----------------------------
-- Records of serial_number
-- ----------------------------
INSERT INTO `serial_number` VALUES ('0167BA0B5873C5E38264CE75CEF0939E', '电脑系列', null, '2');
INSERT INTO `serial_number` VALUES ('0238DC2733C26D54AD63D1ECF52C8FA2', 'Good001003', null, '3');
INSERT INTO `serial_number` VALUES ('04831D40CEE8DC3F1EAE70B3C8D7FCB3', '面膜系列', null, '1');
INSERT INTO `serial_number` VALUES ('05F706C24833D53BFAB73779C68ABCA8', 'saleCollection', '2013-04-25 00:00:00', '8');
INSERT INTO `serial_number` VALUES ('066AA6E61BD0C0FB76F49DC8AA3AF847', 'GoodBrand团购旅游2', null, '2');
INSERT INTO `serial_number` VALUES ('080EEBD365EA5B85D5B0F7177F6C09C8', '手机', null, '5');
INSERT INTO `serial_number` VALUES ('08A91F777EFCB3CF350553A2B2A39CB2', '外套', null, '1');
INSERT INTO `serial_number` VALUES ('0A0E457403EAD453E6449055FC83E0F8', '洗衣机罩', null, '1');
INSERT INTO `serial_number` VALUES ('0C6118B076DAD9E5F4574607BA8EA348', '单肩', null, '3');
INSERT INTO `serial_number` VALUES ('0E7B59221D07FF7D143EF7EDB55B8DB4', '电视', null, '1');
INSERT INTO `serial_number` VALUES ('0E9576C79B383D721A81A751E160B6F1', 'Good005001001', null, '3');
INSERT INTO `serial_number` VALUES ('0F30B28E0A4EB0E58391AA4965811F37', '包包', null, '1');
INSERT INTO `serial_number` VALUES ('1068EB203D8718C5514C8EB7AE931739', 'Warehouse', null, '11');
INSERT INTO `serial_number` VALUES ('123C046533566FD5853898D90470CA4E', '骑车用品', null, '1');
INSERT INTO `serial_number` VALUES ('132DE63732A1400B4EE68601566E4557', 'Good007001002', null, '2');
INSERT INTO `serial_number` VALUES ('170BD968296DD6C57DE00936BE18A623', 'InformationAM0', null, '25');
INSERT INTO `serial_number` VALUES ('1982CB1FACAAC6B6C53F65629E9882DC', '电子教育', null, '3');
INSERT INTO `serial_number` VALUES ('1AA4F690F59A73039A6C4B108B53802A', 'Good008001003', null, '1');
INSERT INTO `serial_number` VALUES ('1B54744706F9B7E2F8133F4152FB00EB', 'aa', null, '2');
INSERT INTO `serial_number` VALUES ('1D038EEFA12A5B4789D9C515CA488A71', 'GoodBrand饰品', null, '2');
INSERT INTO `serial_number` VALUES ('1F40C18E80EF3CC70F53EE93DF137C64', 'advertise', '2013-06-25 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('1F937ED8645A294BD39E01CBF35FBF41', '打火机系列', null, '1');
INSERT INTO `serial_number` VALUES ('208EAAF5153F20A550329CBD07D06B65', 'Good009006', null, '8');
INSERT INTO `serial_number` VALUES ('209240E2086A00083AC6D8604092CDBE', 'Good008002002', null, '3');
INSERT INTO `serial_number` VALUES ('2188F26655D2E64AF7B04B73175266D5', '经理助手', null, '1');
INSERT INTO `serial_number` VALUES ('227B850B24575A5D299CD2FD392E5B03', 'Good009009003', null, '3');
INSERT INTO `serial_number` VALUES ('2301DF025163022C0BBE8E90CC87B01D', '笔记本', null, '4');
INSERT INTO `serial_number` VALUES ('2310C14CF07A848A61CF742E00D3F040', '中国', null, '3');
INSERT INTO `serial_number` VALUES ('2533C6DFD2601703AFE99320FE1250E4', '非主流', null, '4');
INSERT INTO `serial_number` VALUES ('25B46026817AE6B58CB611E0C659FB73', 'packaging', '2012-09-20 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('2620E874953EC8227AA363D5E92B91D4', 'InformationNW1', null, '6');
INSERT INTO `serial_number` VALUES ('28A093F4C2DC5DF28D1D1AAA3858304C', '电视影音', null, '3');
INSERT INTO `serial_number` VALUES ('292EF380E0DE9ADEC39E6855CB62397E', '商用风管机', null, '1');
INSERT INTO `serial_number` VALUES ('29958D68215C1F859E431CA88C08429C', '移动开发', null, '3');
INSERT INTO `serial_number` VALUES ('2A418D88CB6550B81CD3DEE88318118F', 'BuyPay', '2012-04-09 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('2A8F9622C9B881686A75EF004FFDC095', 'Good004005001', null, '7');
INSERT INTO `serial_number` VALUES ('2B41F41F55098C796C93D5870D6F0EBC', 'promotionActivity', '2012-11-19 00:00:00', '3');
INSERT INTO `serial_number` VALUES ('2B4F994BEC8975FD6C974A58E6C536D5', 'GoodBrand空调', null, '8');
INSERT INTO `serial_number` VALUES ('2BDDA3B7C5D3D499E189ACF48EF56B33', '洗衣机', null, '4');
INSERT INTO `serial_number` VALUES ('2EAC07EB93D12AAC08BA5B97DF845008', 'collection', '2021-03-21 00:00:00', '3');
INSERT INTO `serial_number` VALUES ('30FD95F845C4DB70361EFF5FF9A2290C', 'GoodBrand化妆品', null, '3');
INSERT INTO `serial_number` VALUES ('31192251F8E687E726386B8E30B67ED0', 'null', null, '34');
INSERT INTO `serial_number` VALUES ('3226D8D767196CDE40BF1BEA2390143C', '服饰鞋帽', null, '5');
INSERT INTO `serial_number` VALUES ('32C23C738755D1DB89867FE1F47A48BD', '裤子', null, '2');
INSERT INTO `serial_number` VALUES ('3477B56AAE07C6494F3806C4DC19BDC5', '湖南省', null, '4');
INSERT INTO `serial_number` VALUES ('3481578285F6CBEA50CCA65E20F240F3', '彩妆', null, '1');
INSERT INTO `serial_number` VALUES ('36E0D2E9627E277BEA03FEB5C882D74B', 'wwwwww', null, '2');
INSERT INTO `serial_number` VALUES ('36EAA198E5E54F9DA4E9D4864ED048E1', 'greetingCard', '2012-04-18 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('391DCBBFD4AAA3F9AFD276FED3738912', 'priceAdjust0', '2022-03-22 00:00:00', '7');
INSERT INTO `serial_number` VALUES ('3C1B0D15B0CAB7C82120C1230A0E7EB0', 'gift', '2012-11-19 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('3DBF0412EFEECA0D916E5F92308DBED7', 'GoodBrand数码', null, '13');
INSERT INTO `serial_number` VALUES ('3DC6C0559154D9D6D06EDACC99C9F4DE', 'Good001001', null, '6');
INSERT INTO `serial_number` VALUES ('3FE1441B826392FFC12FA3089CF75FE9', '环境电器', null, '2');
INSERT INTO `serial_number` VALUES ('403FEA1E43584347F5E8281B57349F21', '34343', null, '1');
INSERT INTO `serial_number` VALUES ('412DFF1609F54FF76C79F6F18F14A6B2', 'saleOrder', '2020-09-25 00:00:00', '748');
INSERT INTO `serial_number` VALUES ('41DEFEE6F9731780DE5675013BD53081', 'Good007003', null, '1');
INSERT INTO `serial_number` VALUES ('42241ECF2644856C65A2EBA8A715B700', 'BuyOrder', '2012-04-16 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('42D2D46DEB88E66E49DF85C2F6EB0853', '童装系列', null, '3');
INSERT INTO `serial_number` VALUES ('4459E5462EA95505B509875115654A3A', '房产开发', null, '1');
INSERT INTO `serial_number` VALUES ('4509C22E9EED33E896925CF37E405347', 'priceAdjust0', '2011-12-30 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('452A6AEC8AED123422092DF180FFAC71', '真皮包', null, '3');
INSERT INTO `serial_number` VALUES ('453A9E186A115DE9829688BF9CBC48AA', 'pay', '2012-03-29 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('46A88A1FB92E33375B727EAD17D3D68C', '家用空调', null, '8');
INSERT INTO `serial_number` VALUES ('48930995FA2FCA093AEC838C067495A9', 'Good007001001', null, '2');
INSERT INTO `serial_number` VALUES ('48AD1A73AB0A77549A3BB005119B8E06', '男装系列', null, '4');
INSERT INTO `serial_number` VALUES ('48D01A07DFD50461FF10925F51942B26', 'gift', '2011-12-21 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('49B8E84CF133453FF598A451AABD0A62', 'Good004001', null, '1');
INSERT INTO `serial_number` VALUES ('4AE4F42BBD85B2B9C2303C7E9B7F6552', 'saleReturn', '2013-01-23 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('4B03B6C4A4A8A18B3500AEFDFC92E0DC', '减肥怡', null, '2');
INSERT INTO `serial_number` VALUES ('4C60D88B1388DA70B3D55FBF8131B985', 'InformationTP4', null, '4');
INSERT INTO `serial_number` VALUES ('4D905AFB2971F6CAE04403E0A25A6FED', 'WarehouseInto0', '2012-04-12 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('4D94B6D29FAABED1895C17A1D94BE019', '项链', null, '3');
INSERT INTO `serial_number` VALUES ('4E1C702E7D49A7FEE58281AB0205B172', 'Good007002002', null, '1');
INSERT INTO `serial_number` VALUES ('4EECE51B29B6AA00C2F7ECF5F279FD11', 'warehouseMove', '2012-02-06 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('4F2F1946DE6F8F3BB534FB63C017CDC4', 'Split', '2012-04-10 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('4FFDE8A1415D3D08CF3B0A9DF19D2253', '大家电', null, '4');
INSERT INTO `serial_number` VALUES ('504925BC9913C17D72ED166519B84C68', 'CostAdjust', '2012-03-20 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('512B6953FA20892C6DEC8172823BA487', '商用空调', null, '6');
INSERT INTO `serial_number` VALUES ('5138ABF827C5B8AC5FCFFFE57C22AAC4', 'Good004003002', null, '1');
INSERT INTO `serial_number` VALUES ('51CA0B44FD5160DCFA0ECD2F401D7A8B', '特殊商品套餐', null, '4');
INSERT INTO `serial_number` VALUES ('522C2FA09037E47C82F5E0C730C539A3', 'GoodBrand创意坊', null, '2');
INSERT INTO `serial_number` VALUES ('530749571077079363D199A5B92ADD05', 'Good008002003', null, '1');
INSERT INTO `serial_number` VALUES ('54407E19FC6FF92F1C396904684AEFA7', 'InformationAM0', null, '1');
INSERT INTO `serial_number` VALUES ('549C5C5144FB2A8AB319A5880D679503', 'Good009008001', null, '1');
INSERT INTO `serial_number` VALUES ('565187F1B5594AFD6024F3680F7E3D75', 'InformationGZ9', null, '20');
INSERT INTO `serial_number` VALUES ('56C812F2A758A4C3E262369193BDFF5F', 'Good008001', null, '4');
INSERT INTO `serial_number` VALUES ('578BF8988D2C0874C03659005B665762', 'InformationIF2', null, '8');
INSERT INTO `serial_number` VALUES ('57C53E780AC71E4A5919B8CD58A4C98C', '数码', null, '4');
INSERT INTO `serial_number` VALUES ('5BB68D107B04F100CCA1AAD6ADCB2172', 'Good004002002', null, '36');
INSERT INTO `serial_number` VALUES ('5CF74992AA448B791DE3B9AF7AAF9F89', 'sfsf', null, '1');
INSERT INTO `serial_number` VALUES ('608CC74FB3407C307046523BCC31F5B0', 'InformationHC6', null, '4');
INSERT INTO `serial_number` VALUES ('62EA31459065BB05DF859218B9B3679C', 'GoodBrand女包', null, '3');
INSERT INTO `serial_number` VALUES ('630A6110AB74084BC990B046D5CE977C', '女包', null, '3');
INSERT INTO `serial_number` VALUES ('636908087CE8D9CDA735148B4E49F44D', '汽车用品', null, '1');
INSERT INTO `serial_number` VALUES ('64B27E9EC83062605DE5877865D41054', '屌丝系列', null, '2');
INSERT INTO `serial_number` VALUES ('656CD1EECA68346755D83A98CCD43F9F', 'promote', '2013-01-25 00:00:00', '5');
INSERT INTO `serial_number` VALUES ('674DBF472916BAEA8A251C016613E882', 'prepaid', '2012-12-31 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('67EE0DF4775A5EA75DE3A6CBC1ABAAD9', 'Good004002001', null, '47');
INSERT INTO `serial_number` VALUES ('6853CC0D900F73A8284294E7AA9FE347', '箱包名表', null, '4');
INSERT INTO `serial_number` VALUES ('689F972C1B49BC379B3BE0DAEA2D85DB', '塑料杯子', null, '1');
INSERT INTO `serial_number` VALUES ('6C1C1F02D65D1C7CB165181C646A3B78', '酒店旅游', null, '2');
INSERT INTO `serial_number` VALUES ('6F2C9091B7B2FD1064747860865062B4', 'Good004006001', null, '1');
INSERT INTO `serial_number` VALUES ('6FE765BB57D2ADBC02A206B270FE2908', 'promotionActivity', '2011-12-26 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('70C53774E11D9E4FC223CE0DE65D09B1', '2级', null, '1');
INSERT INTO `serial_number` VALUES ('7409BAE0EADE0EC6364F185604160AC6', '电脑办公1', null, '1');
INSERT INTO `serial_number` VALUES ('782360718AC44088A4EF5F7090362226', 'WarehouseInto1', '2012-04-10 00:00:00', '3');
INSERT INTO `serial_number` VALUES ('789682E9F5169E71D2465E0D913D7B89', 'GoodBrand环境电器', null, '3');
INSERT INTO `serial_number` VALUES ('792022B82ACA9931BB334AB3A819682A', 'InformationLN8', null, '4');
INSERT INTO `serial_number` VALUES ('7ACDB6A68FF2D2BF5532BA9E4B958DA6', 'GoodBrand美容护发', null, '2');
INSERT INTO `serial_number` VALUES ('7AFC6936FD5EC96D2F7A9D3AAA7DD3FA', 'InformationCP7', null, '2');
INSERT INTO `serial_number` VALUES ('7B9D5A39AD3C8005BCB8F2437AD405C5', 'saleDelivery', '2201-07-07 00:00:00', '383');
INSERT INTO `serial_number` VALUES ('7C349F873F045726A1BDF6B35873AF22', 'GoodBrand日用品', null, '1');
INSERT INTO `serial_number` VALUES ('7C97A274AD833140370F62CECFA7576C', 'GoodBrand电视、影音', null, '8');
INSERT INTO `serial_number` VALUES ('7CDBD48E81AECCF89BB38BF16A9F38A4', 'Good023', null, '1');
INSERT INTO `serial_number` VALUES ('7DB84D97CB09BDBE21C4059689722848', 'InformationMS5', null, '4');
INSERT INTO `serial_number` VALUES ('7E292C7BD5328EBCD5E5E41F4C756A44', '电视、影音', null, '5');
INSERT INTO `serial_number` VALUES ('7F3322E803949A6117D4DBFF0130A148', '电脑办公2', null, '1');
INSERT INTO `serial_number` VALUES ('7F9F00503DBFC7E2235B962E7394F87E', '广州市', null, '19');
INSERT INTO `serial_number` VALUES ('7FF3CFE3FA03EB52C7DE40ED230EB86F', '广东省', null, '3');
INSERT INTO `serial_number` VALUES ('80237C732FA1EB455229EE298EA9BB68', 'BuyOrder', '0001-12-22 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('8034144372359D30D46889CED094DFE3', 'Good005003001', null, '3');
INSERT INTO `serial_number` VALUES ('81294DF70866F50EB6D68B6AE4577462', '功率', null, '2');
INSERT INTO `serial_number` VALUES ('838012E7C347B41AB4AD6B632D2CD284', 'GoodBrand特殊商品', null, '2');
INSERT INTO `serial_number` VALUES ('8403D0333AC0A1C5DEF6A640BE50FE5A', '手链', null, '3');
INSERT INTO `serial_number` VALUES ('843D6649B1B6FD8F098B2993FDA8EBA7', 'vipCoupon', '2013-04-11 00:00:00', '8');
INSERT INTO `serial_number` VALUES ('87CF9DF38BE283523A72673843C17AA8', '衣服', null, '1');
INSERT INTO `serial_number` VALUES ('887F56898E2068F495573C2DAD1C9CF8', 'Good004003003', null, '1');
INSERT INTO `serial_number` VALUES ('897B2FE001B4029D24E7A0310468E241', 'GoodBrand小家电', null, '1');
INSERT INTO `serial_number` VALUES ('8AB0A690B9628366D9AF3BA030DD03A5', 'Good008003001', null, '1');
INSERT INTO `serial_number` VALUES ('8D816AE21B369852035535D2228C1309', '黄冈市', null, '1');
INSERT INTO `serial_number` VALUES ('910FB558FA603E7BCC7B4D1CBD256000', 'fee', '2012-03-29 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('94E82702B7F3107A16BC3E86877BBADD', '美发', null, '1');
INSERT INTO `serial_number` VALUES ('96F39DDD6CB4425CAF7ED04083B2826B', '数码电脑', null, '5');
INSERT INTO `serial_number` VALUES ('98C9E1BBB41771F3C4BC41BD8B1E6273', '风幕机', null, '3');
INSERT INTO `serial_number` VALUES ('9968F6902B7FDD960485F222A248855B', 'WarehouseInto', '2012-04-02 00:00:00', '15');
INSERT INTO `serial_number` VALUES ('9A0294D13F6003F3813C371A6B2B9B3D', 'BuyPay', '2012-01-05 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('9AE8C73026F169F1D36BD84423105158', 'GoodBrand厨卫电器', null, '2');
INSERT INTO `serial_number` VALUES ('9B0C429100F8CE0E596F2A4C875160B6', 'Good007002', null, '2');
INSERT INTO `serial_number` VALUES ('9E21B18FAFF06F1CEFDBEAC6CE3F6DEB', '化妆品', null, '9');
INSERT INTO `serial_number` VALUES ('9E3D9E21058D3587B2C89FCF326B5504', 'GoodType', null, '45');
INSERT INTO `serial_number` VALUES ('9E88A4E84398C88639493C3E7AD4C93E', 'rebate', '2012-04-19 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('A0AE919803A973A4BA0D6ACB9A4244EA', 'Good011', null, '5');
INSERT INTO `serial_number` VALUES ('A1789D64AC37CDC967BB48B60C8B56EB', '饰品', null, '3');
INSERT INTO `serial_number` VALUES ('A1FA87962DEAF2F189FE84123FF8F843', 'priceAdjust2', '2012-04-01 00:00:00', '4');
INSERT INTO `serial_number` VALUES ('A3832E6A72ED0BDD4DB691C590C3CCDC', 'goodKind', null, '20');
INSERT INTO `serial_number` VALUES ('A3CE3C59BB70AACD69174B5A0E9FA68A', 'Good020001', null, '1');
INSERT INTO `serial_number` VALUES ('A45D108DC12E8609D007CF3CFFCBF673', '体育用品类', null, '2');
INSERT INTO `serial_number` VALUES ('A47916C0278FF3119410FA7ACE5BA6DC', 'Good024016001', null, '1');
INSERT INTO `serial_number` VALUES ('A49D2FC142D81A23A2FA8CCAF131D936', '上衣', null, '4');
INSERT INTO `serial_number` VALUES ('A55CB02E20483AA015B47C28BB37884F', 'Good018001', null, '1');
INSERT INTO `serial_number` VALUES ('A5A1043AABBA8D31CD39DD5A2AB1CCE1', '武汉市', null, '1');
INSERT INTO `serial_number` VALUES ('A6193C1B270D6198E4D7B24F72C3A6C2', 'InformationNR3', null, '9');
INSERT INTO `serial_number` VALUES ('A6D67C167CF941D828F26D6F5563EF23', 'Good012001001', null, '2');
INSERT INTO `serial_number` VALUES ('A77850F6D0480A48A91D278422670196', '小家电', null, '4');
INSERT INTO `serial_number` VALUES ('A783336A71B7D96EBC86EFE770CCD3DC', 'Good006002001', null, '2');
INSERT INTO `serial_number` VALUES ('A7C6301326A92788356E4D896B8848C3', 'Good007002001', null, '1');
INSERT INTO `serial_number` VALUES ('A850D020749EB036C285FC8BEFE00A38', 'InformationNR3', null, '1');
INSERT INTO `serial_number` VALUES ('A8F7253889803765AF08652F550162C9', 'GoodBrand大家电', null, '4');
INSERT INTO `serial_number` VALUES ('AA668106E3A22FB237589F15EFEB8D2C', '护肤', null, '2');
INSERT INTO `serial_number` VALUES ('B0B0EBF8629542522B3323A8ABFA6F1A', 'Good007001003', null, '1');
INSERT INTO `serial_number` VALUES ('B16273BF7483EEE3B3BBD7F31A026060', 'Good024014001', null, '1');
INSERT INTO `serial_number` VALUES ('B41BA7A3EABDF68A6B19A91E8DEDF526', '生活服务', null, '3');
INSERT INTO `serial_number` VALUES ('B6F6A0C970B9F6DF67AB75E5E68E6646', 'message', '2011-12-22 00:00:00', '5');
INSERT INTO `serial_number` VALUES ('B84C1DE37D90DD6213B91FC88B3474C5', 'GoodBrand数码电脑', null, '1');
INSERT INTO `serial_number` VALUES ('B9B6878D70B88A5E77A5165F1F6E4CD7', 'Good004002', null, '16');
INSERT INTO `serial_number` VALUES ('BB7B23A316CFC2D94543BC5366F54F42', '音响设备', null, '1');
INSERT INTO `serial_number` VALUES ('BD1AC1E1171C98240181E2B98147D8C0', 'Good011005', null, '1');
INSERT INTO `serial_number` VALUES ('BD1BA37DD0AA7BB3280CE7A670DDF028', 'Good008001001', null, '2');
INSERT INTO `serial_number` VALUES ('BF29E5DA2D0DEC09347D42875B0DEE52', '钱包', null, '3');
INSERT INTO `serial_number` VALUES ('BFAF309E8201E7F18C0B5655C9693A99', 'Area', null, '2');
INSERT INTO `serial_number` VALUES ('C037A714D36DF137643C3DF2CB945428', '干洗机', null, '1');
INSERT INTO `serial_number` VALUES ('C044DB3C07AE909CC4E7A32282B2A899', '特殊商品', null, '5');
INSERT INTO `serial_number` VALUES ('C0A49816F0D361725F54AE9CE85BF0BD', '香水彩妆', null, '4');
INSERT INTO `serial_number` VALUES ('C22E524C7498C505A5F456CE65C2DE74', 'CostAdjust', '2012-02-13 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('C2E0ED16FC5D2ABF995CF65CF81938C6', 'Good009006002', null, '2');
INSERT INTO `serial_number` VALUES ('C65A437B10EB778F0B5A9FFF57BF9460', 'Good004001002', null, '18');
INSERT INTO `serial_number` VALUES ('C673675CE9A3642DCABEA20B1CB5BA55', 'Good007003002', null, '6');
INSERT INTO `serial_number` VALUES ('C7048E51DEB722EA0F59E4B187064D58', '厨卫', null, '3');
INSERT INTO `serial_number` VALUES ('C7DAC979B7082771A15F231620E23B7D', '女装系列', null, '6');
INSERT INTO `serial_number` VALUES ('C8B7B9A46C0C48ADF35A6BD5B67290A0', '创意坊', null, '3');
INSERT INTO `serial_number` VALUES ('C925DBCEA64E9FB22D513F78DBC72273', '线材配件', null, '1');
INSERT INTO `serial_number` VALUES ('CA37E6035D22112ACF196ACE1D4BB78B', '长沙市', null, '1');
INSERT INTO `serial_number` VALUES ('CA8F10E2B7E676DF6523E8F633C7CF7F', 'pay', '2012-03-21 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('CA9F565E5836A47157D4738D7D0786C8', 'BuyReturn', '2015-04-10 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('CB23ED4035451108C673C60E7421C59A', 'priceAdjust1', '2012-03-30 00:00:00', '2');
INSERT INTO `serial_number` VALUES ('CC3238DF86C33163DFBA240D1C9FD17A', '手镯', null, '3');
INSERT INTO `serial_number` VALUES ('CE09EFCCD02BC9B397BACBB20C33CF74', 'priceAdjust1', '2012-02-06 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('CE5CBA5BDDC0E30D2A815CB50369B571', '空调', null, '22');
INSERT INTO `serial_number` VALUES ('CEBC4601B57582AAF843350A768A1CE2', 'Good007001', null, '3');
INSERT INTO `serial_number` VALUES ('CECC5EACDCF265AE49DCF4B4E8CC5624', '男士专区', null, '3');
INSERT INTO `serial_number` VALUES ('CEEA59928BEF081066ED22B9B914334A', '金镯子', null, '2');
INSERT INTO `serial_number` VALUES ('CEF71AE5D80196753F7D0B7FA5034D36', '清洗机', null, '1');
INSERT INTO `serial_number` VALUES ('D243965E1054E648B4702B17CF760780', '团购旅游', null, '2');
INSERT INTO `serial_number` VALUES ('D3943E9262BC4E2D21D296ED01FA5110', 'Good004001001', null, '13');
INSERT INTO `serial_number` VALUES ('D3F560B87C8911E96DD4CADE35A2D67D', 'Good009009001', null, '2');
INSERT INTO `serial_number` VALUES ('D4C21744C2F340ED4620FF3D143A6223', '商品团购', null, '1');
INSERT INTO `serial_number` VALUES ('D6430250586EA37E9A2B6E4670EF44DD', 'WarehouseInto3', '2012-04-10 00:00:00', '4');
INSERT INTO `serial_number` VALUES ('D81A64EC90C1EE8423A26594B09B8D3B', 'saleCollection', '2011-12-22 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('D9918B61CCB30CAE31A568EC08F14AF8', '超大内存', null, '4');
INSERT INTO `serial_number` VALUES ('DA1B745E8CDBB1BC60BB0784D3DB5122', '冰洗', null, '11');
INSERT INTO `serial_number` VALUES ('DAF127B184C75EC6214FD18F10C1F2C2', 'rebate', '2012-02-28 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('DD2A603F38CFEC9E82DEF6F777A15629', 'Good022002', null, '13');
INSERT INTO `serial_number` VALUES ('DD40D8EC12C46FFF9083F16CEE1A3109', '深圳市', null, '1');
INSERT INTO `serial_number` VALUES ('DDAFF0E58EBF7A2730DCDDFFCA37ACC6', '服装', null, '7');
INSERT INTO `serial_number` VALUES ('DDBA9D9F18F5EA5FA251ADD7550E19CF', 'Good012001', null, '5');
INSERT INTO `serial_number` VALUES ('DDFE39202C7D6173F1CE674527F72B19', 'GoodBrand冰洗', null, '7');
INSERT INTO `serial_number` VALUES ('DE71572758F607027D7B53BA4E06D029', '体育用品', null, '2');
INSERT INTO `serial_number` VALUES ('DE7EA0CB095BA703632C6522870F7145', '电脑办公3', null, '1');
INSERT INTO `serial_number` VALUES ('DEC6DD5942C16EEC212DC70649006F2A', 'Good004002003', null, '10');
INSERT INTO `serial_number` VALUES ('DFFB71489AF600463905EF04AF0AA70D', 'WarehouseInto2', '2013-04-13 00:00:00', '8');
INSERT INTO `serial_number` VALUES ('E0447E6BB79930FE463F7916984EADA8', '湖北省', null, '3');
INSERT INTO `serial_number` VALUES ('E164C04406DD876A6A45F8424366E517', 'Good004003001', null, '1');
INSERT INTO `serial_number` VALUES ('E253EAD19BBB3AB75BF1BE1A58BA6411', 'Specification', null, '22');
INSERT INTO `serial_number` VALUES ('E374FFFBBF84B5B1EA0514D1A1634B53', 'Good007003003', null, '1');
INSERT INTO `serial_number` VALUES ('E5890E806A76C9B39E840BF631EF16C2', '1级', null, '1');
INSERT INTO `serial_number` VALUES ('E59754A1727F8D6F9A73C66ABA6FB99D', 'Good011005001', null, '2');
INSERT INTO `serial_number` VALUES ('E59E12A8F0CD70E70037CC761EEC7289', 'GoodBrand团购旅游3', null, '4');
INSERT INTO `serial_number` VALUES ('E5D886D7E221463F8D179E7A682EA01F', 'Good005002', null, '2');
INSERT INTO `serial_number` VALUES ('E7151CC2B2A746F6D2585A84B2FA7BD1', 'Supplier', null, '14');
INSERT INTO `serial_number` VALUES ('EB3CB04C42671963E36BD55C6C4D4E88', 'xxx', null, '1');
INSERT INTO `serial_number` VALUES ('EBBEC2721F8F8F46CE9B97AF09360CEE', '文化用品', null, '2');
INSERT INTO `serial_number` VALUES ('EC592E6E2D8AF89C93219C57855D9690', 'GoodBrand服装', null, '4');
INSERT INTO `serial_number` VALUES ('EE752B5A58A42B654F9DCFDC80546EAB', 'saleOrder', '2011-12-22 00:00:00', '1');
INSERT INTO `serial_number` VALUES ('EF7D7AFA274C26ACBD66AD65C215BE5E', 'Good004001003', null, '1');
INSERT INTO `serial_number` VALUES ('EFCF2C261570ABF9E176D93F03C766DD', '手机数码', null, '4');
INSERT INTO `serial_number` VALUES ('F00D6046DE445E9754FFFC221B5A288D', 'BuyInto', '2012-04-13 00:00:00', '3');
INSERT INTO `serial_number` VALUES ('F07F2BE48AC29CBA2181A0E6CAE14F12', '日用品', null, '1');
INSERT INTO `serial_number` VALUES ('F3A54E4FC06C8F745EDB1DE6492FC555', 'Good004005002', null, '4');
INSERT INTO `serial_number` VALUES ('F493128D7FBAC3E96E73DD706D62EA64', 'Good008002', null, '3');
INSERT INTO `serial_number` VALUES ('F571E5C69C77E743B0EB3D7C97430862', 'GoodBrand团购旅游', null, '3');
INSERT INTO `serial_number` VALUES ('F68323B2014D8E4034D6CD57AE31DF92', '经理', null, '1');
INSERT INTO `serial_number` VALUES ('F8C4D4AB8A88E7B71E616D1C5952A21B', '护肤精品', null, '2');
INSERT INTO `serial_number` VALUES ('F9539EBE3E3D2526F7B91E9CADD7B59B', '电脑办公', null, '6');
INSERT INTO `serial_number` VALUES ('FA937D46377FB4939AA35FD27515345B', '衡阳市', null, '1');
INSERT INTO `serial_number` VALUES ('FB6074736B9D600F43D285BE7F4C9919', '汽车用品专区', null, '2');
INSERT INTO `serial_number` VALUES ('FCEBD90B74CF1C57CCB02707EB2638F0', '美容护发', null, '3');
INSERT INTO `serial_number` VALUES ('FEAA206B7F30F90824F43CA311C22195', 'GoodBrand服饰鞋帽', null, '4');

-- ----------------------------
-- Table structure for store_set
-- ----------------------------
DROP TABLE IF EXISTS `store_set`;
CREATE TABLE `store_set` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `content` text,
  `creator_id` varchar(32) DEFAULT NULL,
  `creator_name` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier_id` varchar(32) DEFAULT NULL,
  `modifier_name` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store_set
-- ----------------------------
INSERT INTO `store_set` VALUES ('3DEFB3CB653A22CA65C6C7ECDCCCD92E', 'SS201112080003', '商城设置', '<P><IMG style=\"WIDTH: 122px; HEIGHT: 127px\" alt=\"\" src=\"/mi/pic/StoreSet/20111208/4EA1E5655925F5D21BA672F0E0937EAB.jpg\" data-cke-saved-src=\"/mi/pic/StoreSet/20111208/4EA1E5655925F5D21BA672F0E0937EAB.jpg\">&nbsp;</P>', '1', 'admin', '2011-12-08 00:00:00', null, null, null, 'c');
INSERT INTO `store_set` VALUES ('EF564007A54463F896600102569F5039', 'AD201112080001', '23', '<P><IMG style=\"WIDTH: 175px; HEIGHT: 175px\" alt=\"\" src=\"http://localhost:8081/mi/pic/StoreSet/20111208/54D4EE9237B8646C72EBCD4654BAE906.jpg\" data-cke-saved-src=\"/mi/pic/StoreSet/20111208/54D4EE9237B8646C72EBCD4654BAE906.jpg\">3214</P>\n<P>&nbsp;</P>\n<P>&nbsp;</P>', '1', 'admin', '2011-12-08 00:00:00', null, null, null, 's');

-- ----------------------------
-- Table structure for sys_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_power`;
CREATE TABLE `sys_power` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??id',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '????',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '????',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '???id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '?????',
  `create_time` datetime DEFAULT NULL COMMENT '????',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '???id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '?????',
  `modify_time` datetime DEFAULT NULL COMMENT '????',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '???? c:?? s;?? d:??',
  PRIMARY KEY (`id`),
  KEY `sys_power_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????';

-- ----------------------------
-- Records of sys_power
-- ----------------------------
INSERT INTO `sys_power` VALUES ('077416C00B911F41DD0108C48EEE7EAB', 'good', '商品管理', '1', 'admin', '2011-06-15 19:25:54', '1', 'admin', '2011-06-21 15:27:56', 'c');
INSERT INTO `sys_power` VALUES ('1', 'system', '系统管理', '', '', '2011-04-26 00:00:00', '1', 'admin', '2011-06-21 15:17:03', 'c');
INSERT INTO `sys_power` VALUES ('2', 'desktop', '我的桌面', '1', 'admin', '2011-05-04 16:41:15', '1', 'admin', '2012-02-22 18:13:39', 'c');
INSERT INTO `sys_power` VALUES ('2D2DAC90DC59346EAD7E958510226784', 'warehouse', '仓库管理', '1', 'admin', '2012-02-16 10:55:49', '', '', null, 's');
INSERT INTO `sys_power` VALUES ('3D1514C21CB6BB6E26E04582CC25F8B5', 'dataflow', '流量统计', '1', 'admin', '2012-03-05 16:03:02', '', '', null, 's');
INSERT INTO `sys_power` VALUES ('44BD4C17BB1959DE26B31EC93BD84CF6', 'market', '营销活动', '1', 'admin', '2012-02-16 10:58:11', '', '', null, 's');
INSERT INTO `sys_power` VALUES ('5B8E340910E5BF2FEF9E40AD2D221ABE', 'formcenter', '报表中心', '1', 'admin', '2012-03-05 16:00:38', '', '', null, 's');
INSERT INTO `sys_power` VALUES ('75C8EA87F3B06122BAD0578932C9B9FF', 'information', '资讯管理', '1', 'admin', '2012-02-16 10:54:11', '', '', null, 's');
INSERT INTO `sys_power` VALUES ('7A39E535092A009506662CC156905265', 'baseinfo', '基本信息', '1', 'admin', '2012-02-20 16:17:58', '1', 'admin', '2012-02-22 18:13:13', 's');
INSERT INTO `sys_power` VALUES ('875951E61CA0CE4854785B205D194E5E', 'mall', '商城设置', '1', 'admin', '2012-02-16 10:51:16', '', '', null, 's');
INSERT INTO `sys_power` VALUES ('8D4CD4A33F563DA644F1E7AF70B300F0', 'buy', '促销管理', '1', 'admin', '2012-02-16 10:47:35', '1', 'admin', '2012-02-16 10:55:09', 's');
INSERT INTO `sys_power` VALUES ('D5B704E1F6CEE97D0593DAE1BD737E72', 'order', '销售管理', '1', 'admin', '2012-02-11 11:04:40', '1', 'admin', '2012-02-16 10:48:38', 's');
INSERT INTO `sys_power` VALUES ('DE354787C7E095862F9C7B935F310A40', 'customer', '会员管理', '1', 'admin', '2011-09-19 11:51:30', '', '', null, 's');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??id',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '????',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '????',
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '???id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '?????',
  `create_time` datetime DEFAULT NULL COMMENT '????',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '???id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '?????',
  `modify_time` datetime DEFAULT NULL COMMENT '????',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '???? c:?? s;?? d:??',
  PRIMARY KEY (`id`),
  KEY `sys_role_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', 'Admin', '1', '系统管理员', '2011-04-29 21:51:21', '1', 'admin', '2011-06-16 15:07:15', 'c');
INSERT INTO `sys_role` VALUES ('335C747226153F59D1FB49C6A76D7E99', 'cw', '辅导员', '1', 'admin', '2012-02-11 11:03:37', '', '', null, 's');
INSERT INTO `sys_role` VALUES ('59A4B795E8C1E3A98596F391851DD66C', 'tset', '会员', '1', 'admin', '2012-03-22 14:17:30', '', '', null, 's');
INSERT INTO `sys_role` VALUES ('ADB8A5AB9EEBBA74B8F0BA5F20BCE78F', 'user', '发货员', '1', 'admin', '2012-02-07 16:38:17', '', '', null, 's');
INSERT INTO `sys_role` VALUES ('B85DBDEA7C3B21184E9CC9859FCF0177', 'ck', '仓库人员', '1', 'admin', '2012-02-24 14:52:37', '', '', null, 's');
INSERT INTO `sys_role` VALUES ('BB20A90636B609814D846677F43228F7', 'cur', '客服', '1', 'admin', '2012-02-20 14:36:21', '', '', null, 's');
INSERT INTO `sys_role` VALUES ('F43A98A2B05DEB793B71EB0ACDEDEA59', 'xs', '销售人员', '1', 'admin', '2012-02-29 10:20:17', '', '', null, 's');
INSERT INTO `sys_role` VALUES ('F9BAC7DA3436A5B5D759092839FDF34B', 'cg', '采购人员', '1', 'admin', '2012-02-22 11:57:21', '', '', null, 's');

-- ----------------------------
-- Table structure for sys_role_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_power`;
CREATE TABLE `sys_role_power` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??????id',
  `role_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??id',
  `power_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??id',
  `power_insert` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `power_delete` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `power_select` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `power_update` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '??',
  PRIMARY KEY (`id`),
  KEY `sys_role_power_id` (`role_id`),
  KEY `sys_role_power_r_role_id` (`role_id`),
  KEY `sys_role_power_r_power_id` (`power_id`),
  CONSTRAINT `FK_sys_role_power_r_sys_power` FOREIGN KEY (`power_id`) REFERENCES `sys_power` (`id`),
  CONSTRAINT `FK_sys_role_power_r_sys_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='??????';

-- ----------------------------
-- Records of sys_role_power
-- ----------------------------
INSERT INTO `sys_role_power` VALUES ('06BA743186A72BDFAC92735C2324CC71', '335C747226153F59D1FB49C6A76D7E99', '7A39E535092A009506662CC156905265', '1', '1', '1', '1', '2');
INSERT INTO `sys_role_power` VALUES ('0AD9F4F12F9CA468803F70A6917D04EF', '335C747226153F59D1FB49C6A76D7E99', '875951E61CA0CE4854785B205D194E5E', '1', '1', '1', '1', '0');
INSERT INTO `sys_role_power` VALUES ('220068CFA6708757A35532A55F42A3DB', 'B85DBDEA7C3B21184E9CC9859FCF0177', 'DE354787C7E095862F9C7B935F310A40', '0', '0', '0', '0', '2');
INSERT INTO `sys_role_power` VALUES ('2531C5AFA6894915EAB63BE5A6E247E8', 'ADB8A5AB9EEBBA74B8F0BA5F20BCE78F', 'D5B704E1F6CEE97D0593DAE1BD737E72', '1', '1', '1', '1', '3');
INSERT INTO `sys_role_power` VALUES ('2832898654578E4BF5D16BD7A0A58349', 'B85DBDEA7C3B21184E9CC9859FCF0177', 'D5B704E1F6CEE97D0593DAE1BD737E72', '0', '0', '1', '1', '0');
INSERT INTO `sys_role_power` VALUES ('3204DF6A4734E27CCD7871867EC78EB0', '1', '5B8E340910E5BF2FEF9E40AD2D221ABE', '1', '1', '1', '1', '11');
INSERT INTO `sys_role_power` VALUES ('36B3F161C2822180261BCD78A80A9597', 'F43A98A2B05DEB793B71EB0ACDEDEA59', 'DE354787C7E095862F9C7B935F310A40', '1', '1', '1', '1', '1');
INSERT INTO `sys_role_power` VALUES ('3996E4275EBAB6D42913F98EA3B9A1D5', '1', 'DE354787C7E095862F9C7B935F310A40', '1', '1', '1', '1', '1');
INSERT INTO `sys_role_power` VALUES ('479F756A1C15DEF4FF4D8B6C5C87D18C', 'ADB8A5AB9EEBBA74B8F0BA5F20BCE78F', '8D4CD4A33F563DA644F1E7AF70B300F0', '1', '1', '1', '1', '2');
INSERT INTO `sys_role_power` VALUES ('5AE200C7E77FB2F21999D4B7F0F3152D', '1', '75C8EA87F3B06122BAD0578932C9B9FF', '1', '1', '1', '1', '6');
INSERT INTO `sys_role_power` VALUES ('63A8F54E426AFE5E1E8E178D2DCC3839', '59A4B795E8C1E3A98596F391851DD66C', 'D5B704E1F6CEE97D0593DAE1BD737E72', '1', '1', '1', '1', '0');
INSERT INTO `sys_role_power` VALUES ('69DE5915DFF6A5EA27B9471027C172FA', 'BB20A90636B609814D846677F43228F7', '75C8EA87F3B06122BAD0578932C9B9FF', '1', '1', '1', '1', '2');
INSERT INTO `sys_role_power` VALUES ('6B873971D80B8612ED5AF71C19F7BB95', '335C747226153F59D1FB49C6A76D7E99', 'DE354787C7E095862F9C7B935F310A40', '1', '1', '1', '1', '3');
INSERT INTO `sys_role_power` VALUES ('74FB5E0771BEE2CD92B9C199FD670C5F', '1', '8D4CD4A33F563DA644F1E7AF70B300F0', '1', '1', '1', '1', '8');
INSERT INTO `sys_role_power` VALUES ('7A8EDEDC6BC0CE40439B6C728B59BFEB', '1', '3D1514C21CB6BB6E26E04582CC25F8B5', '1', '1', '1', '1', '10');
INSERT INTO `sys_role_power` VALUES ('852EB8633A62622F01FBEE0D7C49DDD9', 'F43A98A2B05DEB793B71EB0ACDEDEA59', '2', '1', '1', '1', '1', '2');
INSERT INTO `sys_role_power` VALUES ('85F1A6B55AAE6C6F345B4CB0679F92FA', '1', '875951E61CA0CE4854785B205D194E5E', '1', '1', '1', '1', '7');
INSERT INTO `sys_role_power` VALUES ('87C8963A58557CF54459E5834F2FDDC5', '1', '2D2DAC90DC59346EAD7E958510226784', '1', '1', '1', '1', '5');
INSERT INTO `sys_role_power` VALUES ('90BF925B8B3E76D74980DDBDE66F66B3', '1', '44BD4C17BB1959DE26B31EC93BD84CF6', '1', '1', '1', '1', '4');
INSERT INTO `sys_role_power` VALUES ('9349A5C6A33858D8FEC0D80F54BAADD5', 'F43A98A2B05DEB793B71EB0ACDEDEA59', 'D5B704E1F6CEE97D0593DAE1BD737E72', '1', '1', '1', '1', '0');
INSERT INTO `sys_role_power` VALUES ('9EA94C44494CE5B2310BD33331DF6868', 'ADB8A5AB9EEBBA74B8F0BA5F20BCE78F', '75C8EA87F3B06122BAD0578932C9B9FF', '1', '1', '1', '1', '0');
INSERT INTO `sys_role_power` VALUES ('9F29E273D78177E2400D2B260CAD78B9', 'ADB8A5AB9EEBBA74B8F0BA5F20BCE78F', '875951E61CA0CE4854785B205D194E5E', '1', '1', '1', '1', '1');
INSERT INTO `sys_role_power` VALUES ('A2C93E0A539CC8A2FA526360FDAA824B', '1', '1', '1', '1', '1', '1', '0');
INSERT INTO `sys_role_power` VALUES ('A915D5671CCAE21EF3C06E44B4E9280A', '335C747226153F59D1FB49C6A76D7E99', 'D5B704E1F6CEE97D0593DAE1BD737E72', '1', '1', '1', '1', '1');
INSERT INTO `sys_role_power` VALUES ('B1E41F01D9063BCAEF18D76D4964B068', '1', '077416C00B911F41DD0108C48EEE7EAB', '1', '1', '1', '1', '2');
INSERT INTO `sys_role_power` VALUES ('B8ACD57609857562730C24C395CA8EDE', 'B85DBDEA7C3B21184E9CC9859FCF0177', '2D2DAC90DC59346EAD7E958510226784', '1', '1', '1', '1', '1');
INSERT INTO `sys_role_power` VALUES ('BBB8D8D4AD44725A2958F86F02DFD266', '1', 'D5B704E1F6CEE97D0593DAE1BD737E72', '1', '1', '1', '1', '9');
INSERT INTO `sys_role_power` VALUES ('C4E0E3848BA768E40EA003597DA2363F', 'F9BAC7DA3436A5B5D759092839FDF34B', '2D2DAC90DC59346EAD7E958510226784', '1', '1', '1', '1', '0');
INSERT INTO `sys_role_power` VALUES ('C502A471C75AAD56DE9A9C53804C2FC6', '1', '7A39E535092A009506662CC156905265', '1', '1', '1', '1', '3');
INSERT INTO `sys_role_power` VALUES ('D6391A41FB0452151906E5A57C68C782', 'BB20A90636B609814D846677F43228F7', '44BD4C17BB1959DE26B31EC93BD84CF6', '1', '1', '1', '1', '0');
INSERT INTO `sys_role_power` VALUES ('DCB8BB40B0811F3E01035F357CBD2F5C', 'BB20A90636B609814D846677F43228F7', '2D2DAC90DC59346EAD7E958510226784', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '??id',
  `code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '????',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '???',
  `role_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `role_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '????',
  `role_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `pwd` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '????',
  `telphone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(96) COLLATE utf8_bin DEFAULT NULL,
  `company` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `dept_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '???id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '?????',
  `create_time` datetime DEFAULT NULL COMMENT '????',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '???id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '?????',
  `modify_time` datetime DEFAULT NULL COMMENT '????',
  `state` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 's' COMMENT '???? c:?? s;?? d:??',
  `warehouse_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `begin` date DEFAULT '2013-01-01',
  `end` date DEFAULT NULL,
  PRIMARY KEY (`id`,`state`),
  KEY `sys_user_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '1', 'admin', 'Admin', '123456', '82223333', '13800138000', 'kuqu_service@163.com', null, null, '1', '管理部', null, null, null, null, null, null, 'c', null, null, '2013-06-25', '2013-06-26');
INSERT INTO `sys_user` VALUES ('161C8EB1170DAF0AEFBB61EEB3CB3950', 'NBA', 'admin', '335C747226153F59D1FB49C6A76D7E99', 'cw', '辅导员', '123456', '020-86595244', '1325452121', 'kuqu_service@163.com', '', '', 'D855CF90BFF20C15C715AE266281FA60', '财务部', '1', 'admin', '2012-02-27 16:29:00', '1', 'admin', '2016-02-23 16:09:00', 's', 'B6DF60BDBE3C56FA718AE1AE01A47D05', '海珠仓库', null, null);
INSERT INTO `sys_user` VALUES ('8BAD0B755A99498D887D632CF1B70195', 'user007', '007', 'F9BAC7DA3436A5B5D759092839FDF34B', 'cg', '采购人员', '123456', '020-85855632', '13254215411', 'kuqu_service@163.com', 'tsete', 'setet', '343598FA71083CE6D938BDBDE9744593', '采购部', '1', 'admin', '2012-02-22 16:43:02', '1', 'admin', '2012-02-22 17:14:31', 's', 'B6DF60BDBE3C56FA718AE1AE01A47D05', '海珠仓库', null, null);
INSERT INTO `sys_user` VALUES ('8CA5EEF621CDA37CF3CF33B8EA75D273', 'wp2', 'wangping3', 'F43A98A2B05DEB793B71EB0ACDEDEA59', 'xs', '销售人员', '123456', '020-12341234', '12345612345', 'eee@ee.com', '', '', '0D2DCCC1967C6BE08FB6FD892EF33E70', '销售部', '1', 'admin', '2012-03-22 15:32:13', '1', 'admin', '2013-06-03 16:50:55', 's', '', '', null, null);
INSERT INTO `sys_user` VALUES ('97384AA90395E6A9570D1558E1277778', 'lxiaoq', 'liquan', 'ADB8A5AB9EEBBA74B8F0BA5F20BCE78F', 'user', '发货员', 'liquan', '', '2222222', '', '', '', 'C45C82002FA8C2A4341B50E9763D8263', '仓库部', '1', 'admin', '2012-05-30 15:50:41', '1', 'admin', '2013-06-03 16:23:54', 's', '', '', null, null);

-- ----------------------------
-- Table structure for vip_coupon
-- ----------------------------
DROP TABLE IF EXISTS `vip_coupon`;
CREATE TABLE `vip_coupon` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `money` decimal(18,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `vip_level_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `vip_level_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `min_buy` decimal(18,2) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  `customer_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `saleOrder_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单id',
  `customer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of vip_coupon
-- ----------------------------
INSERT INTO `vip_coupon` VALUES ('1C68275774D2FB53A50F701795930C6A', 'YHJ201304110008', 'cx', '100.00', '1', 'C1EE428B084315079BC27F7B07D38D84', '普通会员', '50.00', '2013-04-11 00:00:00', '2013-05-11 00:00:00', '', '1', 'admin', '2013-04-11 00:00:00', '1', 'admin', '2013-04-11 15:03:47', 'd', 'A57C594647AA70524E089F495DD5BD19', 'CBE175C63A797956AAE5DA2CE910FAA1', 'yanlijiao');
INSERT INTO `vip_coupon` VALUES ('572732DE13B9AB876904AE65D71E4D15', 'YHJ201304110005', 'cx', '100.00', '1', 'C1EE428B084315079BC27F7B07D38D84', '普通会员', '50.00', '2013-04-11 00:00:00', '2013-05-11 00:00:00', '', '1', 'admin', '2013-04-11 00:00:00', '1', 'admin', '2013-04-11 15:04:01', 's', 'A57C594647AA70524E089F495DD5BD19', null, 'yanlijiao');
INSERT INTO `vip_coupon` VALUES ('A2F08398111390E08848AE10977333ED', 'YHJ201304110007', 'cx', '100.00', '1', 'C1EE428B084315079BC27F7B07D38D84', '普通会员', '50.00', '2013-04-11 00:00:00', '2013-05-11 00:00:00', '', '1', 'admin', '2013-04-11 00:00:00', '1', 'admin', '2013-04-11 15:04:14', 's', 'A57C594647AA70524E089F495DD5BD19', null, 'yanlijiao');
INSERT INTO `vip_coupon` VALUES ('B0977700E17B6028CB21E5CC0D1C2107', 'YHJ201304110006', 'cx', '100.00', '1', 'C1EE428B084315079BC27F7B07D38D84', '普通会员', '50.00', '2013-04-11 00:00:00', '2013-05-11 00:00:00', '', '1', 'admin', '2013-04-11 00:00:00', '1', 'admin', '2013-04-11 15:04:28', 's', 'A57C594647AA70524E089F495DD5BD19', null, 'yanlijiao');
INSERT INTO `vip_coupon` VALUES ('EEE41296241C5A6C375036AF163A6516', 'YHJ201304110004', 'cx', '100.00', '1', 'C1EE428B084315079BC27F7B07D38D84', '普通会员', '50.00', '2013-04-11 00:00:00', '2013-05-11 00:00:00', '', '1', 'admin', '2013-04-11 00:00:00', '1', 'admin', '2013-04-11 15:04:37', 's', 'A57C594647AA70524E089F495DD5BD19', null, 'yanlijiao');

-- ----------------------------
-- Table structure for vip_coupon_ware
-- ----------------------------
DROP TABLE IF EXISTS `vip_coupon_ware`;
CREATE TABLE `vip_coupon_ware` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `vip_coupon_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `vip_coupon_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ware_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ware_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`vip_coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of vip_coupon_ware
-- ----------------------------
INSERT INTO `vip_coupon_ware` VALUES ('14770C1134AB39C5402ADCCB33A8994D', 'A2F08398111390E08848AE10977333ED', 'cx', '', '团购1', '0');

-- ----------------------------
-- Table structure for vip_level
-- ----------------------------
DROP TABLE IF EXISTS `vip_level`;
CREATE TABLE `vip_level` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `required_consumption_amount` decimal(18,2) DEFAULT NULL,
  `vip_discount` double DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of vip_level
-- ----------------------------
INSERT INTO `vip_level` VALUES ('13A2106A77A97359552B5EAFCF077841', 'DJ201111100017', '钻石会员', '10000.00', '8', '测试用的', '1', 'admin', '2011-11-10 00:00:00', '1', 'admin', '2011-11-10 10:41:38', 's');
INSERT INTO `vip_level` VALUES ('B689F7301387D5417918BF90854126DC', 'DJ201112070002', 'VIP会员', '3000.00', '9', '', '1', 'admin', '2011-12-07 00:00:00', null, null, null, 'c');
INSERT INTO `vip_level` VALUES ('C1EE428B084315079BC27F7B07D38D84', 'DJ201201050001', '普通会员', '100.00', '0', '', '1', 'admin', '2012-01-05 00:00:00', null, null, null, 'c');
INSERT INTO `vip_level` VALUES ('F55C1FD78F775457A1A8ECAFC66318E2', 'DJ201111100018', '黄金会员', '5000.00', '8.5', '测试所用', '1', 'admin', '2011-11-10 00:00:00', '1', 'admin', '2011-11-10 10:41:30', 's');

-- ----------------------------
-- Table structure for ware
-- ----------------------------
DROP TABLE IF EXISTS `ware`;
CREATE TABLE `ware` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `good_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `groupgood_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price_discount` decimal(18,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `pic` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `pic_id` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `good_val_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_val` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ware_id` (`id`),
  KEY `ware_good_id` (`good_id`),
  KEY `ware_code` (`code`),
  CONSTRAINT `FK_ware_rf_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ware
-- ----------------------------
INSERT INTO `ware` VALUES ('1836EC821891BE53888A0787A70EF873', '10D4D386D2058D089857902C636A3A76', null, 'GH03264-1', '2000', null, '0', '/pic/Ware/20130601/32570A562C2552A2DB2C6FD7A102AE48.jpg', '32570A562C2552A2DB2C6FD7A102AE48', '8B61B34A6F517371CE083D3EDE5C2AA6', '红色');
INSERT INTO `ware` VALUES ('2F37FAF808576043ACE6D084C0F83570', '10D4D386D2058D089857902C636A3A76', null, 'GH03264-4', '5000', null, '3', '/pic/Ware/20130601/3C49919A16F6F8861E64AF821EC9D7E3.jpg', '3C49919A16F6F8861E64AF821EC9D7E3', 'F0136D7149ACB3B0D061A2DA6A183124', '黄色');
INSERT INTO `ware` VALUES ('5CC02083F11091B989B8088431987233', '10D4D386D2058D089857902C636A3A76', null, 'GH03264-3', '4000', null, '2', '/pic/Ware/20130601/D7C8A1BFD113A963CD58E2B440268478.jpg', 'D7C8A1BFD113A963CD58E2B440268478', 'F0136D7149ACB3B0D061A2DA6A183124', '黄色');
INSERT INTO `ware` VALUES ('A8C8B8DAC7E98A64204D0FBDB9D7A389', '10D4D386D2058D089857902C636A3A76', null, 'GH03264-2', '3000', null, '1', '/pic/Ware/20130601/6C8CFA97A3779F99FC6BD24E6813847F.jpg', '6C8CFA97A3779F99FC6BD24E6813847F', '8B61B34A6F517371CE083D3EDE5C2AA6', '红色');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `area_id` varchar(32) DEFAULT NULL,
  `area_name` varchar(32) DEFAULT NULL,
  `total_cost_inventory` decimal(18,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`id`),
  KEY `warehouse_code` (`code`),
  KEY `warehouse_area_id` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('4935F503DA0D0B7AE9BB008008CA2693', '011', '天河仓', '394C3BE7E3080599F14431A208FB8710', '广州市', '35600.00', null, '00', '1', 'admin', '2013-04-17 15:29:35', null, null, null, 's');
INSERT INTO `warehouse` VALUES ('56027E1ABB2012852A02644694B10F9A', '010', '天河仓', '394C3BE7E3080599F14431A208FB8710', '广东省广州市', '3600.00', null, null, '1', 'admin', null, null, null, null, 's');
INSERT INTO `warehouse` VALUES ('8769A21E6CF31B0EE9FE12622C29AC88', '010', '广州仓', '394C3BE7E3080599F14431A208FB8710', '广东省广州市', '6134.00', null, '', '1', 'admin', '2013-04-10 14:21:38', null, null, null, 's');

-- ----------------------------
-- Table structure for warehouse_into
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_into`;
CREATE TABLE `warehouse_into` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '入库单类型：商品入库单 ：0，赠品入库单：1，其他入库单：2',
  `order_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `handler_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `handler_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dept_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `dept_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `warehouse_into_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of warehouse_into
-- ----------------------------

-- ----------------------------
-- Table structure for warehouse_into_ware
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_into_ware`;
CREATE TABLE `warehouse_into_ware` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `warehouse_into_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_position_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_position_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ware_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ware_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `into_num` int(11) DEFAULT NULL,
  `price_in` decimal(18,2) DEFAULT NULL,
  `money_in` decimal(18,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`),
  KEY `Index_2` (`warehouse_into_id`),
  CONSTRAINT `FK_warehouse_into_ware_rf_whi` FOREIGN KEY (`warehouse_into_id`) REFERENCES `warehouse_into` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of warehouse_into_ware
-- ----------------------------
INSERT INTO `warehouse_into_ware` VALUES ('0621AF7EEF32A9B6C0E8D9EE9BA72E5B', null, '56027E1ABB2012852A02644694B10F9A', '', '1C827FAE49DC5A2936A873B82F67F1A6', '测试商品qq', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('076154E80C0667CB7120403027484812', null, '', null, '6DD8F13416829A20C5C71A4810144E8F', 'qwwqwqw', '60', null, '60.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('09AEE637F8A6FDF697F86C35749A54A8', null, '', null, 'CB9FF154998066D9B1ADE062F27A5F2C', 'qwwqwqw', '50', null, '50.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('0BA31BD3579B0CAE7A1D88284465D988', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '11FE2A8C2F42C520A4ACCE550B5706EA', '美的空调1', '25', null, '25.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('1003820C5DB917CB8D53CB331C892531', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', 'E3EC14EAD7D8A913E27809FA79D8F592', '美的空调04', '14', null, '14.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('11E6D569CEB203C1FE1C5EFA83264FC5', null, '', null, '3F867FF0E8C768CF8AEA9386B18C4F6F', 'qwwqwqw', '10', null, '10.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('15E9B44C19E4E11DF56BCFBCA90FBEBD', null, '', null, 'DC471A1B3D17CE2491F55323CB8B98E2', 'qwwqwqw', '0', null, '0.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('171E261C36DD28EE9819CDFAD1564887', null, '', null, '7BB071311D5F6FB622F24EDE16A210CB', 'qwwqwqw', '10', null, '10.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('17DABE81BBE0A6789D9B533EB5E342D9', null, '', null, '253694587B3329EA015B75A958541181', '002普', '40', null, '40.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('19CCCF9F44B526116F8526BE222708BC', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', 'CA6163A6CBF2ABA7A77434A19532478D', '松下空调03', '12', null, '12.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('19ED9B6382E4C123593997FDF680E8B2', null, '', null, 'B45E4A12FBD6F18F42B833B52595A665', 'qwwqwqw', '400', null, '400.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('26E4B49623152246566F84CD18BE25E7', null, '', '', '3A0902B3C0D373926D2867AA1F6E1354', '002普', '10000', null, '10000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('2E2110C475722B03DFFB08A6DEA34692', null, '', null, 'A5058F603A5BEE4A97CBA9F0F6D540C9', 'qwwqwqw', '100', null, '100.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('2E7BE0822D1D57673481DA3D0679AF87', null, '8159FA756E33FF9E432482468E19B980', 'thc01', '201367C4FE81312C5BF96228F2F5DB7B', '小米2s手机保护壳小米2手机保护壳 手机壳小米2s配件M2保护套包邮', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('36373056C42C08ED06935CA50AE5A3CD', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', 'C1EC8F0E8AEBD4CD0335612E209AD230', '美的空调03', '25', null, '25.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('396A3AD8D8DC62251057629A74A93028', null, '', null, '2EADE672AF14D191D2D827ABBA00293B', '抢购商品qq', '70', null, '70.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('39F8A6D8CBC2F193B93877C3E98B4736', null, '', null, '5CC02083F11091B989B8088431987233', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '4000', null, '4000.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('3CEC1BFA838E6F9958D2730BEB98EEE8', null, '', null, 'FBA283C566267C638B84A325B38E6008', 'qwwqwqw', '70', null, '70.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('3EF49957FFDC6DD8A6402B12C637EA58', null, '', null, 'A62F1E0225C5A46F5BFFCB99E7946D8D', 'qwwqwqw', '400', null, '400.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('3F12B90BDBB812D92281E0F38BCCB670', null, '56027E1ABB2012852A02644694B10F9A', 'As01', '1F8E0773A1BCFB49158FF2D886745A61', 'qwwqwqw', '234', null, '234.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('3F9129AB539A0177B11A2E5D5D456283', null, '', null, 'B041DB7906A99782CBC54CFAC4572AA2', 'qwwqwqw', '600', null, '600.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('4177A0166C2907907A77AE2AA3641ACF', null, '', null, '403A34523C266C1CA19A0AC98D2689D6', 'qwwqwqw', '50', null, '50.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('43280ED3260181DF47CB5674837A90E6', null, '', null, '8D1DC6EABFD3679D41056F50A6C78917', '抢购商品qq', '10', null, '10.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('44A3B0424D2259688FCFB37002C9500E', null, '', null, '908F891F718AF1A0F68DABE12B0CB47D', 'qwwqwqw', '10', null, '10.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('4573FD0C74510F6A163CDBBDBCFACEE3', null, '', null, 'F6F59C85948AC49FE0DF15C17D174B90', '美的空调02', '300', null, '300.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('46EFFAD7DC3D81B40512E3B1C22A68D9', null, '', null, 'C204617C23E03D890875F8C3EF8BD548', 'qwwqwqw', '55', null, '55.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('499ECA402C511E99766D38351B9D2F35', null, '', null, 'CDBC57573F4FBFB99F2D49F30C2BA8BF', 'qwwqwqw', '100', null, '100.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('4D45D24F67A9D5FED0065D810B7E2643', null, '', null, 'F743147105E44933495984CCDCBE84D2', 'qwwqwqw', '10', null, '10.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('4EBC5DCCD31FD6FBC3D0AE35EB0BC297', null, '', null, 'CBE48B132A00C2EC736EEC59FD11DB69', 'qwwqwqw', '500', null, '500.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('566FC8BC247FABB0AC7C21C2B2DB6CC5', null, '', null, 'C8C0B910E30D50BF4872306069D06E61', 'qwwqwqw', '600', null, '600.00', '5');
INSERT INTO `warehouse_into_ware` VALUES ('59EF26C4106F5E4EAB90E3882808898B', null, '', '', 'EF10D3D0BC55645091F6E23056AF5A51', '001普', '10000', null, '10000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('5DBDE6F6BCB7C99DEE04D9ED06C1A0C3', null, '', null, '08896316512D855301C4DE57AA0D52EC', 'qwwqwqw', '110', null, '110.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('6412699507ACBB63B30AF98A14BB1993', null, '', null, '3C50847AF3550F9B95103D042EAE4A15', 'qwwqwqw', '70', null, '70.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('65E09685CE58315EBDDFAF79FBAC9387', null, '', null, '0E630FDD25F68135230A36A360881A5B', 'qwwqwqw', '70', null, '70.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('6F097007870E07AD1D1881AAFDED060E', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '37008BBC48D7CD12D822D734CAF65DF7', '美的空调02', '36', null, '36.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('72E267AE9A302DB97296760AE8A5DED9', null, '', null, '1692539CE0BC5822622914F69AF0F96C', 'qwwqwqw', '50', null, '50.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('7A683F43CC76E6647DB7D806F6608E40', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '31282C00C6D1108337014E7843526B95', '松下空调03', '36', null, '36.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('7ABB24B021701279B756AA5A5BE4D3B4', null, '8159FA756E33FF9E432482468E19B980', 'thc01', '6BD93E890B38F183D701426C3BC2090B', '酷奇 数码产品清洁套装 笔记本电脑 液晶电视屏幕清洁剂 数码配件', '10000', null, '10000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('7CB26023F8D4CE17B642E917D32B3BE8', null, '', null, '6D15312E4BD5DB1DC756255A78B6978B', 'qwwqwqw', '100', null, '100.00', '8');
INSERT INTO `warehouse_into_ware` VALUES ('7FF87BC386E4F06FB9915F90C54716CC', null, '8159FA756E33FF9E432482468E19B980', 'thc01', '1836EC821891BE53888A0787A70EF873', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('832B3D9638F2682D1BBA1230014A6ABF', null, '', null, '2562E6A23A8142158BEB7983F46FFE0E', 'qwwqwqw', '10', null, '10.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('84AD1D945E64E7EEBE72EF86B151DD2D', null, '', null, 'CF4F35E9B8A2F3EFCE7D7F1CCBAE76D1', 'qwwqwqw', '100', null, '100.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('88E7898F5621783DF124990A0CDD656B', null, '', null, 'BEB2ECCEF27A147F4336C3DEBEC1FB86', 'qwwqwqw', '400', null, '400.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('8CBC71E067B4BB4CAB0E1146ACDF3114', null, '', null, 'D104FA9CF5BCCA54FFCC2DE4073EDF16', 'qwwqwqw', '100', null, '100.00', '6');
INSERT INTO `warehouse_into_ware` VALUES ('907FB6E10C9A85D9E660DD324066337B', null, '', null, 'FEFBBD2244D50DF7F29E5C3D10085B39', '美的空调02', '36', null, '36.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('91222DDBA9B0307274489E13C67E21C8', null, '', null, 'BD98431FA85ED345F5C5937B7AA14F07', 'qwwqwqw', '1000', null, '1000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('92C7EA1DA1D00C713B1D299FE28A397F', null, '', null, 'A8C8B8DAC7E98A64204D0FBDB9D7A389', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '3000', null, '3000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('98CB0A5D50A8C23F68523ECE9B6C9881', null, '', null, '60E9A2EC5751E932D447FF97B695F42A', 'qwwqwqw', '41', null, '41.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('98E4BC81F9AB91FFA3845E55AA974FAF', null, '', '', 'DC33ACC100D4D904550CCBDE330C1854', '抢购', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('9AEBD1F21594EE4F9CB80E7CF1FBCD4C', null, '', null, 'DD4D7418794B103FB4A6998A0559256E', 'qwwqwqw', '100', null, '100.00', '5');
INSERT INTO `warehouse_into_ware` VALUES ('9E19559EA84920D15BAE9F869E11B556', null, '', null, '2A43E1BEA5A2C970A689EE8F4F961736', 'qwwqwqw', '100', null, '100.00', '4');
INSERT INTO `warehouse_into_ware` VALUES ('9E639B7DEB7749A9DFF854F0E7F34274', null, '8159FA756E33FF9E432482468E19B980', 'thc01', 'B22E9C1164A4C64455CDA8CF85E6D2F9', '新款贴皮苹果iphone4手机壳iphone4s手机壳iphone4外壳4代配件潮', '500', null, '500.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('A0D5BE80E765975F02E527AC7984469E', null, '8159FA756E33FF9E432482468E19B980', 'thc01', 'B35217C170062BA27B81CDA91C2E7448', '小米2s手机保护壳 配件 小米2手机保护壳 手机壳小米2 手机 后盖', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('A1CD7330E87682BCD286288FCAB4D9C2', null, '', null, '26E98F65476B5BC235758F4F8A98945D', 'qwwqwqw', '100', null, '100.00', '7');
INSERT INTO `warehouse_into_ware` VALUES ('A3DEEA753E8C2BFA1E1A1474734214B5', null, '', null, 'FFC0A27B086F244FDD6B1A812B6C5D65', 'qwwqwqw', '300', null, '300.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('A3EDEDA5B19A50818B42CE29DD3A2F09', null, '', '', '9A01A7A7139FAD56018C1DE729BB69A9', '团购1', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('A9AB1C1BE4C1877A24F1449BE8E7E0F4', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '64DB090D38ED216B47DB328707F4264E', '皇冠空调02', '15', null, '15.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('AC1FC191C89FE24588059BF6F035E20E', null, '', null, '259738E20CE1F837F84F32CEA253E423', '001普', '80', null, '80.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('AE7D585EBA8B111383742F6638BA3F3B', null, '', '', '1E06C2A7403B57DB055D87FE7A12A178', '测试商品2', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('B05D34668D7DC304FB187EA0AA48CB8A', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', 'F53393D846D8AB577BD2EF392E538736', '皇冠空调01', '15', null, '15.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('B34F6EA07DCD88B4839BF59C04A1793C', null, '', null, 'BBFD91599CEA4D130AAAB35DA6C16E39', '002普', '70', null, '70.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('B5114ADBE93716DBE2F35E7345724A78', null, '', '', 'E82B4732A137231C8296C2220FE40410', '测试商品1', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('B9456B028D3419861F67EC288F9346C3', null, '8159FA756E33FF9E432482468E19B980', 'thc01', '21E7079035BB929F096D9CDF526B175D', 'MacBook Air笔记本电脑Pro配件HDMI转接线TV苹果高清线电视转接线', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('BDE55436861F5674BF81F167DB81FB1C', null, '', '', '92D756D491B38230060E80FAE0C4E4E1', '测试商品1', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('BE455CEBCCA72D19E8BA65215C44DDD6', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '8142AC52224B4D938A3C9FD546100ADF', '皇冠空调03', '51', null, '51.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('C0F85D8BA4CD413C2683E1FD2D6BBA0B', null, '', '', '5516D697ECF6BC953A7D86052ABCE545', '测试商品jj', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('C670EBB824DBD18D8D5080AF46A3EEEF', null, '', null, '6F2672E1057D39B09029C3A2F4F9A58A', 'qwwqwqw', '500', null, '500.00', '2');
INSERT INTO `warehouse_into_ware` VALUES ('C7E74F751CF780E5429CB16ACAF534F7', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '04DEC06648C8F70DD5964B9861DF79C2', '喜欢商品01', '5641', null, '5641.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('D570ED1E67FDD8A594340631E82B7A90', null, '', null, 'E4F36ECCF2E2F8420E81EE6B13A11F05', '002普', '40', null, '40.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('D5EB1A9B316672962C56D3EA53B508C2', null, '', '3', '9CCD613BC199A1AF2F17E674CE460CD6', '秒杀3', '3', null, '3.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('D70CADC95F0B2E37F6D14A2A00581B70', null, '', null, '6F05EDDB3D0EDEC5D092DE9A36BFF7B6', 'qwwqwqw', '200', null, '200.00', '4');
INSERT INTO `warehouse_into_ware` VALUES ('D8FF08A9DEBC7C7C47671DE53B8183C3', null, '', null, '4D877520344C786F8885694190D738EA', 'qwwqwqw', '400', null, '400.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('DA760427579B0F278E3DC04AA8A3185C', null, '', null, '2F37FAF808576043ACE6D084C0F83570', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '5000', null, '5000.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('DF006D1749EF4A0521BC5BA4A045E0BD', null, '', null, 'FFDF2F8EB58661611CBCDAC16DE499E3', '美的空调02', '100', null, '100.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('DFF9D80E1603549908A9DD5C7D1C2CDF', null, '', null, '7A70B2AD4A42D2EF0B6A48D9A8DC30EB', '抢购商品qq', '50', null, '50.00', '3');
INSERT INTO `warehouse_into_ware` VALUES ('E3C0EEA6B5A5FD361C06DED45B55E16A', null, '', null, '68B62ABB8FDBFBB050761A30E7E5B49D', 'qwwqwqw', '400', null, '400.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('F27EF417966272D4BF1756ED4B1917F1', null, '', null, '987978774D815366B42416857355377C', '美的空调02', '500', null, '500.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('F7BBA1884FF8518C75EF75AB1CA36B60', null, '', null, '74FF77913DE1242AA3A6EDC1CF428F76', 'qwwqwqw', '40', null, '40.00', '1');
INSERT INTO `warehouse_into_ware` VALUES ('FC239C6452276FE8E37244FB661AB0DE', null, 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '4F1C179096E45FA43CA9880595FA26FF', '松下空调1', '30', null, '30.00', '1');

-- ----------------------------
-- Table structure for warehouse_move
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_move`;
CREATE TABLE `warehouse_move` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `f_warehouse_id` varchar(32) DEFAULT NULL,
  `f_warehouse_name` varchar(64) DEFAULT NULL,
  `s_warehouse_id` varchar(32) DEFAULT NULL,
  `s_warehouse_name` varchar(64) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `handler_id` varchar(32) DEFAULT NULL,
  `handler_name` varchar(64) DEFAULT NULL,
  `dept_id` varchar(32) DEFAULT NULL,
  `dept_name` varchar(64) DEFAULT NULL,
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `warehouse_move_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse_move
-- ----------------------------

-- ----------------------------
-- Table structure for warehouse_move_ware
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_move_ware`;
CREATE TABLE `warehouse_move_ware` (
  `id` varchar(32) NOT NULL,
  `warehouse_move_id` varchar(32) DEFAULT NULL,
  `f_warehouse_position_id` varchar(32) DEFAULT NULL,
  `f_warehouse_position_name` varchar(64) DEFAULT NULL,
  `ware_id` varchar(32) DEFAULT NULL,
  `ware_name` varchar(128) DEFAULT NULL,
  `s_warehouse_position_id` varchar(32) DEFAULT NULL,
  `s_warehouse_position_name` varchar(64) DEFAULT NULL,
  `move_num` int(11) DEFAULT NULL,
  `price_out` decimal(18,2) DEFAULT NULL,
  `money_out` decimal(18,2) DEFAULT NULL,
  `price_in` decimal(18,2) DEFAULT NULL,
  `money_in` decimal(18,2) DEFAULT NULL,
  `price_sale` decimal(18,2) DEFAULT NULL,
  `money_sale` decimal(18,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`),
  KEY `Index_2` (`warehouse_move_id`),
  CONSTRAINT `FK_warehouse_move_ware_rf_whm` FOREIGN KEY (`warehouse_move_id`) REFERENCES `warehouse_move` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse_move_ware
-- ----------------------------

-- ----------------------------
-- Table structure for warehouse_position
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_position`;
CREATE TABLE `warehouse_position` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` varchar(1) COLLATE utf8_bin DEFAULT 's' COMMENT '数据状态 c:草稿 s;审核 d:删除',
  PRIMARY KEY (`id`),
  KEY `warehouse_positon_id` (`id`),
  KEY `warehouse_positon_wh_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of warehouse_position
-- ----------------------------
INSERT INTO `warehouse_position` VALUES ('56027E1ABB2012852A02644694B10F9A', '01', 'As01', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1', '1', 'admin', null, '1', 'admin', '2013-04-17 15:18:59', 's');
INSERT INTO `warehouse_position` VALUES ('8159FA756E33FF9E432482468E19B980', '01', 'thc01', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1', '1', 'admin', '2013-04-17 15:30:20', null, null, null, 's');
INSERT INTO `warehouse_position` VALUES ('B7D4111F43932910B8E48A3E2F1B22CB', '02', 'As02', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1', '1', 'admin', '2013-04-13 14:18:11', '1', 'admin', '2013-04-17 15:18:47', 's');
INSERT INTO `warehouse_position` VALUES ('SXKTlfjajlfjaljflajdlweoiuo', '01', 'gzc', '56027E1ABB2012852A02644694B10F9A', '广州仓', '1', '1', 'admin', '2013-04-17 12:00:45', '1', 'admin', '2013-04-17 15:22:55', 's');

-- ----------------------------
-- Table structure for warehouse_positon_ware
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_positon_ware`;
CREATE TABLE `warehouse_positon_ware` (
  `id` varchar(32) NOT NULL,
  `warehouse_position_id` varchar(32) DEFAULT NULL,
  `warehouse_position_name` varchar(64) DEFAULT NULL,
  `ware_id` varchar(32) DEFAULT NULL,
  `ware_name` varchar(128) DEFAULT NULL,
  `ware_count` int(11) DEFAULT NULL,
  `warehouse_id` varchar(32) DEFAULT NULL,
  `warehouse_name` varchar(64) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_ware_id` (`id`),
  KEY `warehouse_ware_wh_id` (`warehouse_id`),
  KEY `warehouse_ware_wh_p_id` (`warehouse_position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse_positon_ware
-- ----------------------------
INSERT INTO `warehouse_positon_ware` VALUES ('009494F310BE1F312303D683EA5736A2', '', null, '4D877520344C786F8885694190D738EA', 'qwwqwqw', '400', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('04103C8A9CB8DFB4976B7E0677C8D60B', '8159FA756E33FF9E432482468E19B980', 'thc01', '1836EC821891BE53888A0787A70EF873', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '5000', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('049A37133CF4FF44122B28D96818DE09', '', null, '3C50847AF3550F9B95103D042EAE4A15', 'qwwqwqw', '70', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('04E87FE5139AD84625ED74EBC0A0F37A', '', null, '6D15312E4BD5DB1DC756255A78B6978B', 'qwwqwqw', '100', '', null, '8');
INSERT INTO `warehouse_positon_ware` VALUES ('06B6DDA1CBF7A3982F83DEC17C73279F', '', null, '1692539CE0BC5822622914F69AF0F96C', 'qwwqwqw', '50', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('06B846EB1C83930EA2723A4FFAC570AB', '', '', '3A0902B3C0D373926D2867AA1F6E1354', '002普', '10000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('0C6FA7B01E9B0EBE8871B1986D1F5502', '', null, 'BD98431FA85ED345F5C5937B7AA14F07', 'qwwqwqw', '1000', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('11AA64268E93F6EC79DF6E2B9B66C551', '', null, 'FEFBBD2244D50DF7F29E5C3D10085B39', '美的空调02', '36', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('14C6FD9AD0107784244940DCF8486F19', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', 'CA6163A6CBF2ABA7A77434A19532478D', '松下空调03', '12', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('1915CFE7D4530FB3BDA8EA352F77A1C7', '', null, '5CC02083F11091B989B8088431987233', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '4000', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('1as5d34s5f4rd5g4r5d4df5ge4r1', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '1C827FAE49DC5A2936A873B82F67F1A6', '抢购商品qq', '200', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('1CCC69EFDA99219F4362C5948AF397DB', '', null, '60E9A2EC5751E932D447FF97B695F42A', 'qwwqwqw', '41', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('1E0CDDC0BE81E88542CA72BB6D871BFC', '', null, 'DC471A1B3D17CE2491F55323CB8B98E2', 'qwwqwqw', '0', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('1E6C366982D2187A74733E2F4257EC3F', '', null, '253694587B3329EA015B75A958541181', '002普', '40', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('201A87F58EDE1D76765FC70C974DB4B1', '', null, 'CF4F35E9B8A2F3EFCE7D7F1CCBAE76D1', 'qwwqwqw', '100', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('25B0CE1DDFCCECBB49AE320FF267D6D5', '', null, '908F891F718AF1A0F68DABE12B0CB47D', 'qwwqwqw', '10', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('3808944E18969A70332B2B0224403895', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '31282C00C6D1108337014E7843526B95', '松下空调03', '36', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('3A5B5E584669ADD4145C6B250BEB08B8', '8159FA756E33FF9E432482468E19B980', 'thc01', '21E7079035BB929F096D9CDF526B175D', 'MacBook Air笔记本电脑Pro配件HDMI转接线TV苹果高清线电视转接线', '5000', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('3CAFF95A4C9E4830F7B33632DAEF53A7', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '64DB090D38ED216B47DB328707F4264E', '皇冠空调02', '15', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('3D5F0F0DBB18BC3FD0022452DF4E3E40', '', null, 'F6F59C85948AC49FE0DF15C17D174B90', '美的空调02', '300', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('3D7C3D596D8CBC12BEF459B44C9E6345', '', null, '2A43E1BEA5A2C970A689EE8F4F961736', 'qwwqwqw', '100', '', null, '4');
INSERT INTO `warehouse_positon_ware` VALUES ('4280BA7C678EE1438CB5A7C38A988BA5', '', '', '1E06C2A7403B57DB055D87FE7A12A178', '测试商品2', '5000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('431DD0DE7070135076C1223616B94A0E', '', null, 'E4F36ECCF2E2F8420E81EE6B13A11F05', '002普', '40', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('44508967CE58B58E0AA5D28F444BF6EC', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '4F1C179096E45FA43CA9880595FA26FF', '松下空调1', '30', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('455BCF8BDB020CCAACD7BA4091ECBF34', '', null, 'FFC0A27B086F244FDD6B1A812B6C5D65', 'qwwqwqw', '300', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('460991BF8A120602C98417A9901CE1D3', '56027E1ABB2012852A02644694B10F9A', 'As01', '1F8E0773A1BCFB49158FF2D886745A61', 'qwwqwqw', '234', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('5697420E2781C5E19BBF7D54212C6965', '', '', '92D756D491B38230060E80FAE0C4E4E1', '测试商品1', '5000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('57429716D67D7FE3B33507E575F28762', '', null, 'A62F1E0225C5A46F5BFFCB99E7946D8D', 'qwwqwqw', '400', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('5AE6B2195CA677C3B1F2E71F572637A5', '', null, 'C8C0B910E30D50BF4872306069D06E61', 'qwwqwqw', '600', '', null, '5');
INSERT INTO `warehouse_positon_ware` VALUES ('5BDBD17941B747288D338794122BE361', '', '', 'E82B4732A137231C8296C2220FE40410', '测试商品1', '5000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('5C09456D8C2F3C22E8187A7C607EABC8', '', null, '68B62ABB8FDBFBB050761A30E7E5B49D', 'qwwqwqw', '400', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('638B26E183D7C018B5913E04196B7FBB', '', null, 'CB9FF154998066D9B1ADE062F27A5F2C', 'qwwqwqw', '50', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('63C879420C373629CFA7F422E052DDAE', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '04DEC06648C8F70DD5964B9861DF79C2', '喜欢商品01', '5640', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('6884F9494DAFDE8AC55EFCF73FC5FC23', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '8142AC52224B4D938A3C9FD546100ADF', '皇冠空调03', '51', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('68AB19A3C312776E3BA4CEF6A524E599', '', null, 'FBA283C566267C638B84A325B38E6008', 'qwwqwqw', '70', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('6B6BDDC7BD8EFD7220D1978861B15F79', '', null, 'B45E4A12FBD6F18F42B833B52595A665', 'qwwqwqw', '400', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('6CE1808B20A138A06830F4E45A92AD0B', '', null, 'F743147105E44933495984CCDCBE84D2', 'qwwqwqw', '10', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('6D154AAAD19201DEE098EEC26AFBD2DE', '', null, 'BEB2ECCEF27A147F4336C3DEBEC1FB86', 'qwwqwqw', '400', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('708AB78C41F4E86897EBF2EBBBB39578', '', null, '2EADE672AF14D191D2D827ABBA00293B', '抢购商品qq', '70', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('71123F17C8C68A7F05DE05B603757952', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '37008BBC48D7CD12D822D734CAF65DF7', '美的空调02', '36', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('7370E130AC97F4F335702F073BC69CA9', '', null, 'A5058F603A5BEE4A97CBA9F0F6D540C9', 'qwwqwqw', '100', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('782D771C25A607A0861A8A178F8DC155', '', null, '3F867FF0E8C768CF8AEA9386B18C4F6F', 'qwwqwqw', '10', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('7A8C905C8027C6C8039771A6CB463502', '', null, '6F2672E1057D39B09029C3A2F4F9A58A', 'qwwqwqw', '500', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('7C0B932355B7E1A27084E8F01E28BE34', '', null, 'FFDF2F8EB58661611CBCDAC16DE499E3', '美的空调02', '100', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('7D4A57777B0E70FAC1086F77BB15879A', '8159FA756E33FF9E432482468E19B980', 'thc01', 'B35217C170062BA27B81CDA91C2E7448', '小米2s手机保护壳 配件 小米2手机保护壳 手机壳小米2 手机 后盖', '5000', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('860117ED919670787B5A7E10A47F7DB0', '', '', '5516D697ECF6BC953A7D86052ABCE545', '测试商品jj', '5000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('883B159A8BC2334AA48314D069E1312A', '', null, '7A70B2AD4A42D2EF0B6A48D9A8DC30EB', '抢购商品qq', '50', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('88DC13117B43195881F23F55344F9A06', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', 'C1EC8F0E8AEBD4CD0335612E209AD230', '美的空调03', '25', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('88ED94FA845658CAEA6990F264DC916E', '', null, '2562E6A23A8142158BEB7983F46FFE0E', 'qwwqwqw', '10', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('8BD2E720FA7D4D4191A8380C4917DED5', '', '', '9A01A7A7139FAD56018C1DE729BB69A9', '团购1', '5000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('8DD766F8705F29BB45B6339C6045934B', '', null, 'BBFD91599CEA4D130AAAB35DA6C16E39', '002普', '70', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('90A0F3A79205EAFAD609CFB94DFE05C3', '', null, 'C204617C23E03D890875F8C3EF8BD548', 'qwwqwqw', '55', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('90A6F3304A0CB23524F6DEA84B2A0813', '8159FA756E33FF9E432482468E19B980', 'thc01', '6BD93E890B38F183D701426C3BC2090B', '酷奇 数码产品清洁套装 笔记本电脑 液晶电视屏幕清洁剂 数码配件', '10000', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('910B1C07A1EE4FCEC92ECD774F4BE307', '', null, 'A8C8B8DAC7E98A64204D0FBDB9D7A389', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '3000', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('916CDB6C4C9E8F497188F8EB9A7CC793', '', null, '6F05EDDB3D0EDEC5D092DE9A36BFF7B6', 'qwwqwqw', '200', '', null, '4');
INSERT INTO `warehouse_positon_ware` VALUES ('95338783B6901BBE4330AED8B131546F', '', '3', '9CCD613BC199A1AF2F17E674CE460CD6', '秒杀3', '3', '', '3', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('9E0AA7749A3D7F7E3E728D3BDFBA07BC', '', null, '987978774D815366B42416857355377C', '美的空调02', '500', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('A35F7CB18C03D95456482110E5977947', '8159FA756E33FF9E432482468E19B980', 'thc01', 'B22E9C1164A4C64455CDA8CF85E6D2F9', '新款贴皮苹果iphone4手机壳iphone4s手机壳iphone4外壳4代配件潮', '500', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('A38BE11041F2601A6427E69C8CE68159', '', '', 'DC33ACC100D4D904550CCBDE330C1854', '抢购', '5000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('AA877C3A5B436B0E9C5B37E2871E2CFF', '', null, '8D1DC6EABFD3679D41056F50A6C78917', '抢购商品qq', '10', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('AABB099A0EA02B6B14C8E578E9042D80', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', 'E3EC14EAD7D8A913E27809FA79D8F592', '美的空调04', '14', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('AE375084BD86E1B4613D4DB5DC616E8D', '', null, 'DD4D7418794B103FB4A6998A0559256E', 'qwwqwqw', '100', '', null, '5');
INSERT INTO `warehouse_positon_ware` VALUES ('B4431D07F0378A270BD467B8BBE42309', '', null, '26E98F65476B5BC235758F4F8A98945D', 'qwwqwqw', '100', '', null, '7');
INSERT INTO `warehouse_positon_ware` VALUES ('bibibibidfjldfadfa', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '31282C00C6D1108337014E7843526B95', '松下空调03', '100', '56027E1ABB2012852A02644694B10F9A', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('C021AABEAB6B788C9E626B78DC818FDA', '', '', 'EF10D3D0BC55645091F6E23056AF5A51', '001普', '10000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('C026FE0A3CC7E4942C829541F632C84A', '', null, '403A34523C266C1CA19A0AC98D2689D6', 'qwwqwqw', '50', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('C7A904941A038AB0CF6C8BCD7293D7AB', '', '', '1C827FAE49DC5A2936A873B82F67F1A6', '测试商品qq', '5000', '', '', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('C87FC1085D48E1547007ED6CD85F36F0', '', null, 'CDBC57573F4FBFB99F2D49F30C2BA8BF', 'qwwqwqw', '100', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('C8CE1868CA10C5B8936E16F7C23998B6', '', null, '7BB071311D5F6FB622F24EDE16A210CB', 'qwwqwqw', '10', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('CD50E94B74A6D3D3F35F02AADC6C1CFE', '', null, '74FF77913DE1242AA3A6EDC1CF428F76', 'qwwqwqw', '40', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('D42CA976F91481AED603677970EC28B7', '8159FA756E33FF9E432482468E19B980', 'thc01', '201367C4FE81312C5BF96228F2F5DB7B', '小米2s手机保护壳小米2手机保护壳 手机壳小米2s配件M2保护套包邮', '5000', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('D4611EEED46BFC74A6F801BFCEBA94E6', '', null, '259738E20CE1F837F84F32CEA253E423', '001普', '80', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('D523E2D8453C338438B9F687150F3DF1', '', null, 'D104FA9CF5BCCA54FFCC2DE4073EDF16', 'qwwqwqw', '100', '', null, '6');
INSERT INTO `warehouse_positon_ware` VALUES ('E0C6C0148B3A139B03AB9CEF16B83215', '', null, 'B041DB7906A99782CBC54CFAC4572AA2', 'qwwqwqw', '600', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('EA00BFBF27EF210D3530B075F8D273E4', '', null, '08896316512D855301C4DE57AA0D52EC', 'qwwqwqw', '110', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('EDA68C3169CFB8264CC73F82CB221DE3', '', null, '2F37FAF808576043ACE6D084C0F83570', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '5000', '', null, '3');
INSERT INTO `warehouse_positon_ware` VALUES ('F26B8577738F2CFCEE7F70D3B9429602', '', null, 'CBE48B132A00C2EC736EEC59FD11DB69', 'qwwqwqw', '500', '', null, '1');
INSERT INTO `warehouse_positon_ware` VALUES ('F40AC081FC3E37AF3FF5B88A9480DE86', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '11FE2A8C2F42C520A4ACCE550B5706EA', '美的空调1', '25', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('F8791CC6EDE9621B8607D9E4AD12818B', '', null, '6DD8F13416829A20C5C71A4810144E8F', 'qwwqwqw', '60', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('FD566F0E39966A949AA2167A2459F745', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', 'F53393D846D8AB577BD2EF392E538736', '皇冠空调01', '15', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('FE7E5EEA5D737E3516CB4CE5635ED9BB', '', null, '0E630FDD25F68135230A36A360881A5B', 'qwwqwqw', '70', '', null, '2');
INSERT INTO `warehouse_positon_ware` VALUES ('fjdsjflawoeuouUOUOUONN', '8159FA756E33FF9E432482468E19B980', 'thc01', '04DEC06648C8F70DD5964B9861DF79C2', '喜欢商品01', '539', '56027E1ABB2012852A02644694B10F9A', '天河仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('JASDJLAADadfadgeweqweqr', '56027E1ABB2012852A02644694B10F9A', 'thc01', 'F53393D846D8AB577BD2EF392E538736', '皇冠空调01', '6540', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('sxkt03dlajflajdlfjaldjfldf', 'SXKTlfjajlfjaljflajdlweoiuo', '001', '31282C00C6D1108337014E7843526B95', '松下空调03', '6520', '56027E1ABB2012852A02644694B10F9A', '广州仓', '1');
INSERT INTO `warehouse_positon_ware` VALUES ('sxtkjdljdjajflaj;dlfkjaldkfjadf', 'B7D4111F43932910B8E48A3E2F1B22CB', '001', '31282C00C6D1108337014E7843526B95', '松下空调03', '300', '56027E1ABB2012852A02644694B10F9A', '广州仓', '1');

-- ----------------------------
-- Table structure for warehouse_ware
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_ware`;
CREATE TABLE `warehouse_ware` (
  `id` varchar(32) NOT NULL,
  `warehouse_id` varchar(32) DEFAULT NULL,
  `warehouse_name` varchar(64) DEFAULT NULL,
  `ware_id` varchar(32) DEFAULT NULL,
  `ware_name` varchar(128) DEFAULT NULL,
  `ware_count` int(11) DEFAULT NULL,
  `average_cost_inventory` decimal(18,2) DEFAULT NULL,
  `total_cost_inventory` decimal(18,2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_ware_id` (`id`),
  KEY `warehouse_ware_wh_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse_ware
-- ----------------------------
INSERT INTO `warehouse_ware` VALUES ('008D35557304CADE46D864A611C41A70', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '11FE2A8C2F42C520A4ACCE550B5706EA', '美的空调1', '25', null, '25.00', '1');
INSERT INTO `warehouse_ware` VALUES ('02A9527D5E20CCA05980DF91605F252E', '', null, 'B041DB7906A99782CBC54CFAC4572AA2', 'qwwqwqw', '600', null, '600.00', '3');
INSERT INTO `warehouse_ware` VALUES ('04100966FCA8C99A69376B609CC33272', '', null, '987978774D815366B42416857355377C', '美的空调02', '500', null, '500.00', '1');
INSERT INTO `warehouse_ware` VALUES ('04B8A5007BE039880D611A397E499852', '', null, 'A5058F603A5BEE4A97CBA9F0F6D540C9', 'qwwqwqw', '100', null, '100.00', '2');
INSERT INTO `warehouse_ware` VALUES ('057738FBF16A2E6496C3F4540FF53419', '', null, '08896316512D855301C4DE57AA0D52EC', 'qwwqwqw', '110', null, '110.00', '3');
INSERT INTO `warehouse_ware` VALUES ('06FA4765FF171C8D00BC2BC2277F549B', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '1836EC821891BE53888A0787A70EF873', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('10532245ABFF544EDBBE7BD6769FD021', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1C827FAE49DC5A2936A873B82F67F1A6', null, '-2', '-1.00', '2.00', '1');
INSERT INTO `warehouse_ware` VALUES ('118A15B699F1B22170FDB6717D87D00A', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '1F8E0773A1BCFB49158FF2D886745A61', 'qwwqwqw', '234', null, '234.00', '1');
INSERT INTO `warehouse_ware` VALUES ('1221D5117EEC01DEE1000A78EC364F3D', '', '', '92D756D491B38230060E80FAE0C4E4E1', '测试商品1', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('145E1B2BEB2AF283BCD8B87228989711', '', null, 'C8C0B910E30D50BF4872306069D06E61', 'qwwqwqw', '600', null, '600.00', '5');
INSERT INTO `warehouse_ware` VALUES ('14EF70982839C914EBA67034A5A763B4', '', null, '2EADE672AF14D191D2D827ABBA00293B', '抢购商品qq', '70', null, '70.00', '2');
INSERT INTO `warehouse_ware` VALUES ('15285E031DBC8BBD54F4813A82504C22', '', null, 'CBE48B132A00C2EC736EEC59FD11DB69', 'qwwqwqw', '500', null, '500.00', '1');
INSERT INTO `warehouse_ware` VALUES ('15D6B90DB58426C5C73FADD6050A7AFF', '', null, '68B62ABB8FDBFBB050761A30E7E5B49D', 'qwwqwqw', '400', null, '400.00', '1');
INSERT INTO `warehouse_ware` VALUES ('187D151B68F2BA140F0BC2C01C2E2FC7', '', null, 'F6F59C85948AC49FE0DF15C17D174B90', '美的空调02', '300', null, '300.00', '1');
INSERT INTO `warehouse_ware` VALUES ('188CF552261C1EE6154A5D001C7EF2B3', '', null, '2A43E1BEA5A2C970A689EE8F4F961736', 'qwwqwqw', '100', null, '100.00', '4');
INSERT INTO `warehouse_ware` VALUES ('1D54B368C3194FF4C71FB337C0F02B09', '', null, 'FFDF2F8EB58661611CBCDAC16DE499E3', '美的空调02', '100', null, '100.00', '1');
INSERT INTO `warehouse_ware` VALUES ('2091810E3F300E9D77A0E945A71776A7', '', null, '6F05EDDB3D0EDEC5D092DE9A36BFF7B6', 'qwwqwqw', '200', null, '200.00', '4');
INSERT INTO `warehouse_ware` VALUES ('26E90B19C67A3AFC5F23CC37E30049AA', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', 'CA6163A6CBF2ABA7A77434A19532478D', '松下空调03', '12', null, '12.00', '1');
INSERT INTO `warehouse_ware` VALUES ('2D844421D64B231B4B82D79F7970B9B6', '', null, '0E630FDD25F68135230A36A360881A5B', 'qwwqwqw', '70', null, '70.00', '2');
INSERT INTO `warehouse_ware` VALUES ('326B46F7191640654FAE9D2B0A4058DC', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '4F1C179096E45FA43CA9880595FA26FF', '松下空调1', '30', null, '30.00', '1');
INSERT INTO `warehouse_ware` VALUES ('32F059A634200C44A1437B1EE4F80D02', '', null, 'B45E4A12FBD6F18F42B833B52595A665', 'qwwqwqw', '400', null, '400.00', '1');
INSERT INTO `warehouse_ware` VALUES ('33C9D66F5F1D74C1055B0F444A89AFA4', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '37008BBC48D7CD12D822D734CAF65DF7', '美的空调02', '36', null, '36.00', '1');
INSERT INTO `warehouse_ware` VALUES ('349496D46E63098ED65DB2C7BAFD7283', '', '', '1C827FAE49DC5A2936A873B82F67F1A6', '测试商品qq', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('3C4198399901993FE9FAB4C6AE0CC870', '', '3', '9CCD613BC199A1AF2F17E674CE460CD6', '秒杀3', '3', null, '3.00', '1');
INSERT INTO `warehouse_ware` VALUES ('3F9D6EA4B201ADED5B772F58B0B53D8A', '', null, '2562E6A23A8142158BEB7983F46FFE0E', 'qwwqwqw', '10', null, '10.00', '3');
INSERT INTO `warehouse_ware` VALUES ('409BBE626F1EA4B46EE063E75DC54196', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', 'F53393D846D8AB577BD2EF392E538736', '皇冠空调01', '15', null, '15.00', '1');
INSERT INTO `warehouse_ware` VALUES ('4C697DEDD9E12CF4FB3AF26D7F128DEB', '', '', '5516D697ECF6BC953A7D86052ABCE545', '测试商品jj', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('4F6C24CB0A3BF4C5286948CC3151B7DE', '', null, '2F37FAF808576043ACE6D084C0F83570', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '5000', null, '5000.00', '3');
INSERT INTO `warehouse_ware` VALUES ('53EC1FB86C4C7AE31CA87ADCB8A80D88', '', null, 'BEB2ECCEF27A147F4336C3DEBEC1FB86', 'qwwqwqw', '400', null, '400.00', '2');
INSERT INTO `warehouse_ware` VALUES ('5449717A56A75DFEC33A43705A1C7D3D', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', 'E3EC14EAD7D8A913E27809FA79D8F592', '美的空调04', '14', null, '14.00', '1');
INSERT INTO `warehouse_ware` VALUES ('550BEA6351283BB550FA261693B2FB54', '', null, 'BBFD91599CEA4D130AAAB35DA6C16E39', '002普', '70', null, '70.00', '2');
INSERT INTO `warehouse_ware` VALUES ('5A2538B5D2D68181B794EE2AD6E978E9', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', 'B35217C170062BA27B81CDA91C2E7448', '小米2s手机保护壳 配件 小米2手机保护壳 手机壳小米2 手机 后盖', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('5CFEBC43F23DBE4E8EE71D09DF355D22', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '6BD93E890B38F183D701426C3BC2090B', '酷奇 数码产品清洁套装 笔记本电脑 液晶电视屏幕清洁剂 数码配件', '10000', null, '10000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('60A1C0F09C52EEE7EC305DF636A75363', '', null, '74FF77913DE1242AA3A6EDC1CF428F76', 'qwwqwqw', '40', null, '40.00', '1');
INSERT INTO `warehouse_ware` VALUES ('60AE5EA7C3C4AFD6FA9C9E61C8E62894', '', null, 'A62F1E0225C5A46F5BFFCB99E7946D8D', 'qwwqwqw', '400', null, '400.00', '2');
INSERT INTO `warehouse_ware` VALUES ('63D06D52BF3D6DF127EFA599218C3442', '', null, '60E9A2EC5751E932D447FF97B695F42A', 'qwwqwqw', '41', null, '41.00', '2');
INSERT INTO `warehouse_ware` VALUES ('64144145F339093125B7B44593D35CF1', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', 'B22E9C1164A4C64455CDA8CF85E6D2F9', '新款贴皮苹果iphone4手机壳iphone4s手机壳iphone4外壳4代配件潮', '500', null, '500.00', '1');
INSERT INTO `warehouse_ware` VALUES ('64E36F1D6686297B26AAC2D09502644E', '56027E1ABB2012852A02644694B10F9A', '天河仓库', '04DEC06648C8F70DD5964B9861DF79C2', null, '-2', '-1.00', '2.00', '2');
INSERT INTO `warehouse_ware` VALUES ('665B24337F73B93F03CC786E4C057094', '', null, '3C50847AF3550F9B95103D042EAE4A15', 'qwwqwqw', '70', null, '70.00', '3');
INSERT INTO `warehouse_ware` VALUES ('6B98760BF10D0C4AE0219B4605789EBF', '', null, '6D15312E4BD5DB1DC756255A78B6978B', 'qwwqwqw', '100', null, '100.00', '8');
INSERT INTO `warehouse_ware` VALUES ('6F391C6CCE590113DAC8A1E0BAEBC5EF', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '04DEC06648C8F70DD5964B9861DF79C2', '喜欢商品01', '5641', null, '5641.00', '1');
INSERT INTO `warehouse_ware` VALUES ('74D2108F374B8939BF1F416BBB440E8A', '', null, '908F891F718AF1A0F68DABE12B0CB47D', 'qwwqwqw', '10', null, '10.00', '1');
INSERT INTO `warehouse_ware` VALUES ('76285DFB1BAA2CE52F79D5F1A8F1CB19', '', '', 'DC33ACC100D4D904550CCBDE330C1854', '抢购', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('76FC57F4CCB7E288C0AB3EC9CC088E1D', '', null, 'CDBC57573F4FBFB99F2D49F30C2BA8BF', 'qwwqwqw', '100', null, '100.00', '2');
INSERT INTO `warehouse_ware` VALUES ('7E97DAE0FFEE5C4AFC2B6282DF3C70B5', '', null, '4D877520344C786F8885694190D738EA', 'qwwqwqw', '400', null, '400.00', '1');
INSERT INTO `warehouse_ware` VALUES ('7F10AA88C08F6538867441BE9DB90EBE', '', null, '403A34523C266C1CA19A0AC98D2689D6', 'qwwqwqw', '50', null, '50.00', '3');
INSERT INTO `warehouse_ware` VALUES ('85F0177EEDAC94CC060F528ACADDE02D', '', null, 'C204617C23E03D890875F8C3EF8BD548', 'qwwqwqw', '55', null, '55.00', '3');
INSERT INTO `warehouse_ware` VALUES ('8BA673D3626774512C98797AE3543A42', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '9A01A7A7139FAD56018C1DE729BB69A9', null, '-1', '-1.00', '1.00', '13');
INSERT INTO `warehouse_ware` VALUES ('8D532871E17D137F9F3392774A630E1C', '', null, '26E98F65476B5BC235758F4F8A98945D', 'qwwqwqw', '100', null, '100.00', '7');
INSERT INTO `warehouse_ware` VALUES ('90067C00D474F521E5981743FEF36AE5', '', null, 'DD4D7418794B103FB4A6998A0559256E', 'qwwqwqw', '100', null, '100.00', '5');
INSERT INTO `warehouse_ware` VALUES ('90FC490C896BF2385D74A490916A0190', '', null, '259738E20CE1F837F84F32CEA253E423', '001普', '80', null, '80.00', '1');
INSERT INTO `warehouse_ware` VALUES ('914F676D08BCF69F26E1F2576CE78721', '', null, 'BD98431FA85ED345F5C5937B7AA14F07', 'qwwqwqw', '1000', null, '1000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('9EF3A0C5560F3F8AA07CEDDA3A27D440', '', null, '7A70B2AD4A42D2EF0B6A48D9A8DC30EB', '抢购商品qq', '50', null, '50.00', '3');
INSERT INTO `warehouse_ware` VALUES ('A1AF55AB7B30083A7B334F3FBD5D016F', '', null, 'FEFBBD2244D50DF7F29E5C3D10085B39', '美的空调02', '36', null, '36.00', '1');
INSERT INTO `warehouse_ware` VALUES ('A449F80ADD2E1DE4D57D4FA23EBD0D29', '', null, 'F743147105E44933495984CCDCBE84D2', 'qwwqwqw', '10', null, '10.00', '2');
INSERT INTO `warehouse_ware` VALUES ('A527B41594B7FC9AB0F2BDA526E12CA9', '', null, '253694587B3329EA015B75A958541181', '002普', '40', null, '40.00', '1');
INSERT INTO `warehouse_ware` VALUES ('A7947E46D568D63A88532AAA62D5524B', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', 'C1EC8F0E8AEBD4CD0335612E209AD230', '美的空调03', '25', null, '25.00', '1');
INSERT INTO `warehouse_ware` VALUES ('B45D7C01963DD6750E88F9D2E94A7A50', '', null, 'CB9FF154998066D9B1ADE062F27A5F2C', 'qwwqwqw', '50', null, '50.00', '1');
INSERT INTO `warehouse_ware` VALUES ('B514380BD31EFDDE651DFA638DDC9BC5', '', '', 'EF10D3D0BC55645091F6E23056AF5A51', '001普', '10000', null, '10000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('B79CC3B884F5C8CC8C7190237F74B96C', '', null, '1692539CE0BC5822622914F69AF0F96C', 'qwwqwqw', '50', null, '50.00', '2');
INSERT INTO `warehouse_ware` VALUES ('B7DEE32CB3E0FD270D1801C5F028ECB5', '', null, 'CF4F35E9B8A2F3EFCE7D7F1CCBAE76D1', 'qwwqwqw', '100', null, '100.00', '3');
INSERT INTO `warehouse_ware` VALUES ('B87AA455D335FCD624A3575294AC135D', '', null, '6F2672E1057D39B09029C3A2F4F9A58A', 'qwwqwqw', '500', null, '500.00', '2');
INSERT INTO `warehouse_ware` VALUES ('BA41589304D90F274700EC55418FD628', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '64DB090D38ED216B47DB328707F4264E', '皇冠空调02', '15', null, '15.00', '1');
INSERT INTO `warehouse_ware` VALUES ('BD7B04344626967645269DD842E1FA25', '', null, '5CC02083F11091B989B8088431987233', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '4000', null, '4000.00', '2');
INSERT INTO `warehouse_ware` VALUES ('BE2D221E540CD84E9E2C80709B2DB16C', '', null, '6DD8F13416829A20C5C71A4810144E8F', 'qwwqwqw', '60', null, '60.00', '2');
INSERT INTO `warehouse_ware` VALUES ('BE54D2F8353AA1FCFC50A2A898E0BC9E', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '201367C4FE81312C5BF96228F2F5DB7B', '小米2s手机保护壳小米2手机保护壳 手机壳小米2s配件M2保护套包邮', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('BECA1BD681BE2FC19A93D97DA23FA363', '', null, 'FBA283C566267C638B84A325B38E6008', 'qwwqwqw', '70', null, '70.00', '3');
INSERT INTO `warehouse_ware` VALUES ('BF9BBD0E74E8BB45FF8D5BB82116AEE1', '', '', '1E06C2A7403B57DB055D87FE7A12A178', '测试商品2', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('CE789C2912753B52830ACC2EEB8573EC', '', '', '9A01A7A7139FAD56018C1DE729BB69A9', '团购1', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('D217753290CCC8F8C55009B44F007C20', '', null, 'FFC0A27B086F244FDD6B1A812B6C5D65', 'qwwqwqw', '300', null, '300.00', '3');
INSERT INTO `warehouse_ware` VALUES ('D4E2B2970327DA1107E7987C2E8D8CC6', '', null, 'D104FA9CF5BCCA54FFCC2DE4073EDF16', 'qwwqwqw', '100', null, '100.00', '6');
INSERT INTO `warehouse_ware` VALUES ('D94E9D8CCE0E2F5E5C3B8E6E0D71DB5C', '', '', '3A0902B3C0D373926D2867AA1F6E1354', '002普', '10000', null, '10000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('DDD27DCF3878B9B36A01D0129523BEEA', '4935F503DA0D0B7AE9BB008008CA2693', '天河仓', '21E7079035BB929F096D9CDF526B175D', 'MacBook Air笔记本电脑Pro配件HDMI转接线TV苹果高清线电视转接线', '5000', null, '5000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('DE8DEFDBDDF3D6990F465DC04471A635', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '31282C00C6D1108337014E7843526B95', '松下空调03', '36', null, '36.00', '1');
INSERT INTO `warehouse_ware` VALUES ('DFC47AC4B95AAF01F9C9A4E2CEE52A6C', '', null, '7BB071311D5F6FB622F24EDE16A210CB', 'qwwqwqw', '10', null, '10.00', '1');
INSERT INTO `warehouse_ware` VALUES ('E2030E3726CD2A382FC7A39DEC2D467E', '', null, 'DC471A1B3D17CE2491F55323CB8B98E2', 'qwwqwqw', '0', null, '0.00', '1');
INSERT INTO `warehouse_ware` VALUES ('EE7EE57769A73FE1FA3FB047841709D2', '', null, '3F867FF0E8C768CF8AEA9386B18C4F6F', 'qwwqwqw', '10', null, '10.00', '1');
INSERT INTO `warehouse_ware` VALUES ('EEBF7A32BFEB02DB34F82ED483536A45', '', null, '8D1DC6EABFD3679D41056F50A6C78917', '抢购商品qq', '10', null, '10.00', '1');
INSERT INTO `warehouse_ware` VALUES ('EF795C4CAC11367AF39680A508D35B33', '', null, 'A8C8B8DAC7E98A64204D0FBDB9D7A389', '天钻CMMB iPhone ipad用移动数字电视接收器苹果iOS配件特价包邮', '3000', null, '3000.00', '1');
INSERT INTO `warehouse_ware` VALUES ('EF7C5D08BCA7F7215F76DBD00552F0A0', '56027E1ABB2012852A02644694B10F9A', '天河仓', '11FE2A8C2F42C520A4ACCE550B5706EA', null, '-1', '-1.00', '1.00', '3');
INSERT INTO `warehouse_ware` VALUES ('F2E67DCC5CB712B6293FC5F3B905ED94', '56027E1ABB2012852A02644694B10F9A', '天河仓库', '8142AC52224B4D938A3C9FD546100ADF', null, '-1', '-1.00', '1.00', '1');
INSERT INTO `warehouse_ware` VALUES ('F46FE02EC35DC5A2422752FA189E265D', '', null, 'E4F36ECCF2E2F8420E81EE6B13A11F05', '002普', '40', null, '40.00', '3');
INSERT INTO `warehouse_ware` VALUES ('F6D90979B382178681AC7CEF463A18CC', '8769A21E6CF31B0EE9FE12622C29AC88', '广州仓', '8142AC52224B4D938A3C9FD546100ADF', '皇冠空调03', '51', null, '51.00', '1');
INSERT INTO `warehouse_ware` VALUES ('F95B9CBF4934FBF9381883F5CAE15F02', '', '', 'E82B4732A137231C8296C2220FE40410', '测试商品1', '5000', null, '5000.00', '1');

-- ----------------------------
-- Table structure for ware_comment
-- ----------------------------
DROP TABLE IF EXISTS `ware_comment`;
CREATE TABLE `ware_comment` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `ware_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '在此项目中，这个字段不存货物id，存放商品id',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0：差评；1：中评；2：好评；3：回复评论',
  `comment_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `creator_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `modifier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sort` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL COMMENT '评论等级值 :  1~5分',
  `state` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`id`),
  KEY `Index_2` (`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ware_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ware_specification_val
-- ----------------------------
DROP TABLE IF EXISTS `ware_specification_val`;
CREATE TABLE `ware_specification_val` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '类别id',
  `ware_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `good_specification_val_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`),
  KEY `FK_ware_specification_val_rf_ware` (`ware_id`),
  CONSTRAINT `FK_ware_specification_val_rf_ware` FOREIGN KEY (`ware_id`) REFERENCES `ware` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ware_specification_val
-- ----------------------------
INSERT INTO `ware_specification_val` VALUES ('02EAEA5F0CD3D2B7E838C668EF26709E', '1836EC821891BE53888A0787A70EF873', '8B61B34A6F517371CE083D3EDE5C2AA6', '1');
INSERT INTO `ware_specification_val` VALUES ('113F19C6B4022EDA29D4E73D286D5DAA', '2F37FAF808576043ACE6D084C0F83570', 'F0136D7149ACB3B0D061A2DA6A183124', '1');
INSERT INTO `ware_specification_val` VALUES ('1DC9F0E5927C00CC4AE006D0E3C62183', '5CC02083F11091B989B8088431987233', '06FA815284B58BBBD8F07031FA4C2D83', '2');
INSERT INTO `ware_specification_val` VALUES ('740A5FA623B470E1DA3535281A3D0E29', 'A8C8B8DAC7E98A64204D0FBDB9D7A389', '8B61B34A6F517371CE083D3EDE5C2AA6', '1');
INSERT INTO `ware_specification_val` VALUES ('8094069F7B91A3781588600647C84B5B', '2F37FAF808576043ACE6D084C0F83570', '6DD3E28322C1AE74FF0F7B3A14ADBD34', '2');
INSERT INTO `ware_specification_val` VALUES ('9B8B24FC5D72AFE9047B25294B0FC767', '5CC02083F11091B989B8088431987233', 'F0136D7149ACB3B0D061A2DA6A183124', '1');
INSERT INTO `ware_specification_val` VALUES ('D82425BBA3C7C5C1DD38259F58DA7FA5', '1836EC821891BE53888A0787A70EF873', '06FA815284B58BBBD8F07031FA4C2D83', '2');
INSERT INTO `ware_specification_val` VALUES ('F22B0CF36B4DBADD3A8561244A49D0EF', 'A8C8B8DAC7E98A64204D0FBDB9D7A389', '6DD3E28322C1AE74FF0F7B3A14ADBD34', '2');
