/*
Navicat MySQL Data Transfer

Source Server         : 远程代理
Source Server Version : 50557
Source Host           : 156.235.228.219:3306
Source Database       : ads

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2018-12-12 14:00:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `login_ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lastlogined_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'eyJpdiI6Ink0S0tEemtWN2RzTDhpXC9cLzNlRk5Idz09IiwidmFsdWUiOiJnU1RsK1BpMmtKemlXc2VsUzAyb2xBPT0iLCJtYWMiOiJjMTFiM2RjOTNmYmU3ZjQ4OWM5M2ZhZDgxOTVlNzkyOTNmMmRkNjk5MjMwNzU2NDE0YmRiZDRkYjNhYWI2ZjZlIn0=', '1', '127.0.0.1', '2018-07-09 13:41:55', '2018-12-12 13:21:05', '2018-12-12 01:21:05');
INSERT INTO `admin` VALUES ('2', 'admin11', 'eyJpdiI6IlZBY1wvRXdlM3l3QVp2c0RnK1FqbUZBPT0iLCJ2YWx1ZSI6ImxuRmpMWEtcL0pyajVGK1dxZmRLcDlnPT0iLCJtYWMiOiI2MzViNTJhZjc3ZDQzOTAwNjE5ZTgzMzU4MDM0NjdiYzE0Y2RmMWM3YjUyY2I3MGU3Njc4NGY0M2JmM2EyZjZkIn0=', '0', '127.0.0.1', '2018-07-09 13:41:55', '2018-08-18 18:32:24', '2018-08-31 16:00:49');
INSERT INTO `admin` VALUES ('3', 'admin2', 'eyJpdiI6IlZBY1wvRXdlM3l3QVp2c0RnK1FqbUZBPT0iLCJ2YWx1ZSI6ImxuRmpMWEtcL0pyajVGK1dxZmRLcDlnPT0iLCJtYWMiOiI2MzViNTJhZjc3ZDQzOTAwNjE5ZTgzMzU4MDM0NjdiYzE0Y2RmMWM3YjUyY2I3MGU3Njc4NGY0M2JmM2EyZjZkIn0=', '1', '127.0.0.1', '2018-07-09 13:41:55', '2018-08-18 18:29:04', '2018-08-18 18:29:04');

-- ----------------------------
-- Table structure for `ads`
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
  `ads_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL,
  `ads_name` varchar(50) NOT NULL,
  `ads_link` varchar(100) NOT NULL,
  `total_budget` decimal(12,4) DEFAULT NULL,
  `daily_budget` decimal(12,4) DEFAULT NULL,
  `per_cost` decimal(6,4) DEFAULT NULL,
  `ismobile` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:pc端 1:手机端',
  `ads_count_type` int(5) NOT NULL,
  `ads_type` int(5) NOT NULL,
  `more_setting` text,
  `ads_photo` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:待审 1：通过审核 2:用户自己暂停 3:账户余额不足 4:当天预算用完 5:管理员暂停',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ads_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ads
-- ----------------------------
INSERT INTO `ads` VALUES ('8', '1', 'test1', 'http://daili.com', '10000.0000', '100.0000', '0.0010', '1', '7', '5', '{\"time\":{\"starttime\":\"2018-12-09\",\"endtime\":\"2018-12-31\"},\"os_array\":[\"android\"],\"time_array\":null,\"area_array\":null,\"terminal_array\":null,\"switch_browser_array\":null,\"switch_domain_category_array\":null,\"switch_nettype_array\":null,\"switch_network_array\":null}', '[\"10\",\"9\"]', '0', '2018-12-09 22:25:43', '2018-12-09 22:25:43');
INSERT INTO `ads` VALUES ('9', '1', 'test2', 'http://daili.com', '5000.0000', '200.0000', '0.0020', '1', '7', '5', '{\"time\":{\"starttime\":\"\",\"endtime\":\"\"},\"os_array\":[\"android\",\"ios\"],\"time_array\":[\"0_0\",\"0_1\",\"0_2\",\"0_3\",\"1_0\",\"1_1\",\"1_2\",\"1_3\",\"2_0\",\"2_1\",\"2_2\",\"2_3\",\"3_0\",\"3_1\",\"3_2\",\"3_3\",\"4_0\",\"4_1\",\"4_2\",\"4_3\",\"5_0\",\"5_1\",\"5_2\",\"5_3\",\"6_0\",\"6_1\",\"6_2\",\"6_3\"],\"area_array\":[\"14\",\"15\",\"16\",\"17\",\"22\",\"24\"],\"terminal_array\":[\"35\",\"36\",\"38\",\"52\",\"53\"],\"switch_browser_array\":[\"55\",\"60\",\"65\",\"69\"],\"switch_domain_category_array\":[\"71\",\"76\",\"81\"],\"switch_nettype_array\":[\"90\",\"92\",\"95\"],\"switch_network_array\":[\"97\",\"98\",\"99\"]}', '[\"10\"]', '0', '2018-12-09 22:28:37', '2018-12-09 22:28:37');

-- ----------------------------
-- Table structure for `ads_run`
-- ----------------------------
DROP TABLE IF EXISTS `ads_run`;
CREATE TABLE `ads_run` (
  `id` int(11) NOT NULL COMMENT '就是广告的ID移动',
  `total_spent` decimal(10,4) NOT NULL COMMENT '总共',
  `showtime` int(11) NOT NULL,
  `clicktime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='把ads拆分成两个表,redis直接操作这个run表不会覆盖用户设置内容，而用户修改设置的时候可以直接实时覆盖设置';

-- ----------------------------
-- Records of ads_run
-- ----------------------------

-- ----------------------------
-- Table structure for `bank`
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `bank_id` int(3) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('1', '中国工商银行', '1');
INSERT INTO `bank` VALUES ('2', '招商银行', '1');
INSERT INTO `bank` VALUES ('3', '中国农业银行', '1');
INSERT INTO `bank` VALUES ('4', '中国建设银行', '1');
INSERT INTO `bank` VALUES ('5', '中国银行', '1');
INSERT INTO `bank` VALUES ('6', '青岛银行', '1');
INSERT INTO `bank` VALUES ('7', '华夏银行', '1');
INSERT INTO `bank` VALUES ('8', '农村商业银行', '1');
INSERT INTO `bank` VALUES ('9', '交通银行', '1');
INSERT INTO `bank` VALUES ('10', '光大银行', '1');
INSERT INTO `bank` VALUES ('11', '民生银行', '1');
INSERT INTO `bank` VALUES ('12', '深圳发展银行', '1');
INSERT INTO `bank` VALUES ('13', '兴业银行', '1');
INSERT INTO `bank` VALUES ('14', '中信银行', '1');
INSERT INTO `bank` VALUES ('15', '上海浦东发展银行', '1');
INSERT INTO `bank` VALUES ('16', '上海银行', '1');
INSERT INTO `bank` VALUES ('17', '平安银行', '1');
INSERT INTO `bank` VALUES ('18', '恒丰银行', '1');
INSERT INTO `bank` VALUES ('19', '广发银行', '1');
INSERT INTO `bank` VALUES ('20', '重庆三峡银行', '1');
INSERT INTO `bank` VALUES ('21', '北京银行', '1');
INSERT INTO `bank` VALUES ('22', '济宁银行', '1');
INSERT INTO `bank` VALUES ('23', '华润银行', '1');
INSERT INTO `bank` VALUES ('24', '甘肃银行', '1');
INSERT INTO `bank` VALUES ('25', '邢台银行', '1');
INSERT INTO `bank` VALUES ('26', '长沙银行', '1');

-- ----------------------------
-- Table structure for `deposit`
-- ----------------------------
DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit` (
  `deposit_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `money` decimal(16,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未处理 1:处理成功 2:用户未充值 3:admin关闭',
  `remark` varchar(255) DEFAULT NULL,
  `paytype_id` int(3) NOT NULL,
  `payaccount` varchar(255) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `pay_ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`deposit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deposit
-- ----------------------------
INSERT INTO `deposit` VALUES ('1', '1', '1613216511', '130.00', '1', '1', '1', '159628456132', '赵子龙', '127.0.0.1', '2018-09-14 16:54:57', '2018-09-14 16:54:57');

-- ----------------------------
-- Table structure for `material`
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settinggroup` varchar(50) NOT NULL,
  `ads_id` int(8) NOT NULL,
  `image` varchar(250) NOT NULL,
  `tag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:系统自带 1:用户上传',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未审核 1已审核 2不通过',
  `filesize` varchar(20) DEFAULT NULL,
  `size` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('9', '54', '1', '/public/uploads/20181208/15442817966wkJC.gif', '1', '1', '65', '640x150', '2018-12-08 23:10:26', '2018-12-08 23:09:58');
INSERT INTO `material` VALUES ('10', '54', '1', '/public/uploads/20181208/1544281819lxJHy.gif', '1', '1', '101', '640x200', '2018-12-08 23:10:27', '2018-12-08 23:10:20');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `member_id` int(6) NOT NULL AUTO_INCREMENT,
  `parent_daili_id` int(6) DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:广告主 2:站长',
  `qq` varchar(50) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `frozen` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:冻结 1:正常',
  `login_ip` varchar(50) NOT NULL,
  `lastlogined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '0', 'adsmember@qq.com', 'eyJpdiI6Impvd1Rta1kyNHgreHZNRDlGRXFVaUE9PSIsInZhbHVlIjoiTG1NZFRMSDBQRTAzS2VFclFGMWlrZz09IiwibWFjIjoiOTZjZTBhYmZkYTk3ODFjNzJlYmIxODk0Zjc5YWEzZTYzMjFhM2M4OTljMjlhYjU1MjZiNWRlYWI5ZmM4MzIwZiJ9', '1', '9879789', '123123123', '0.0000', '1', '112.206.200.214', '2018-12-12 12:39:41', '2018-09-13 15:55:52', '2018-12-12 00:39:41');
INSERT INTO `member` VALUES ('2', '0', 'sitemember@qq.com', 'eyJpdiI6Ik5ERWpUbzA5d1hrWGRVWHdzUXRLMmc9PSIsInZhbHVlIjoiSlg3ZmZRN2xUb3p5QWNDQ2o2Y05xZz09IiwibWFjIjoiNjUwN2I2NjcyMjczNzQzN2RiYzYxNDQ2NTRmMTcwYWRhN2U4NTgxMDM3ZTY5M2ZhOGJlNTZjMTIwMTI4N2QwZiJ9', '2', '789768', '15963598651', '100.0000', '1', '127.0.0.1', '2018-12-12 01:20:39', '2018-09-13 18:12:40', '2018-12-12 13:20:39');

-- ----------------------------
-- Table structure for `member_balance`
-- ----------------------------
DROP TABLE IF EXISTS `member_balance`;
CREATE TABLE `member_balance` (
  `id` int(11) NOT NULL,
  `balance` decimal(10,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_balance
-- ----------------------------
INSERT INTO `member_balance` VALUES ('1', '800.0000');
INSERT INTO `member_balance` VALUES ('2', '890.0000');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `msg_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_type` tinyint(1) DEFAULT '2' COMMENT '1:广告主 2:站长',
  `message_title` varchar(255) DEFAULT NULL,
  `message_content` text,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:不显示 1显示',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-05 15:47:47', '2018-12-11 20:59:16');
INSERT INTO `message` VALUES ('2', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-05 15:48:04', '2018-12-11 20:59:17');
INSERT INTO `message` VALUES ('3', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-05 15:48:16', '2018-12-11 20:59:17');
INSERT INTO `message` VALUES ('4', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-11 20:59:09', '2018-12-11 20:59:12');
INSERT INTO `message` VALUES ('5', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-11 20:59:21', '2018-12-11 20:59:18');
INSERT INTO `message` VALUES ('6', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-11 20:59:37', '2018-12-11 20:59:41');
INSERT INTO `message` VALUES ('7', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-11 20:59:51', '2018-12-11 20:59:53');
INSERT INTO `message` VALUES ('8', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-11 21:00:02', '2018-12-11 21:00:04');
INSERT INTO `message` VALUES ('9', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-11 21:00:11', '2018-12-11 21:00:13');
INSERT INTO `message` VALUES ('10', '2', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '18年1月29日-18年2月4日的媒体佣金已支付，预计到账时间为1-2个工作日，请各网站主查收核实', '1', '2018-12-11 21:00:21', '2018-12-11 21:00:24');

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `set_id` int(5) NOT NULL AUTO_INCREMENT,
  `settinggroup` varchar(50) NOT NULL,
  `skey` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`set_id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('5', 'adsType', '', 'topbanner', '顶部横幅', '1');
INSERT INTO `setting` VALUES ('6', 'adsType', '', 'bothsides', '对联', '1');
INSERT INTO `setting` VALUES ('7', 'countType', '', 'cpc', '按点击计费', '1');
INSERT INTO `setting` VALUES ('8', 'countType', '', 'cpm', '按千次展示', '1');
INSERT INTO `setting` VALUES ('9', 'countType', '', 'cpv', '单次展示', '1');
INSERT INTO `setting` VALUES ('10', 'countType', '', 'cps', '按订单', '1');
INSERT INTO `setting` VALUES ('11', 'payType', '', 'alipay', '支付宝', '1');
INSERT INTO `setting` VALUES ('12', 'payType', '', 'wechat', '微信', '1');
INSERT INTO `setting` VALUES ('13', 'memberType', '', '1', '广告主', '1');
INSERT INTO `setting` VALUES ('14', 'memberType', '', '2', '站长', '1');
INSERT INTO `setting` VALUES ('15', 'websiteStatus', '', '0', '审核中', '1');
INSERT INTO `setting` VALUES ('16', 'websiteStatus', '', '1', '审核通过', '1');
INSERT INTO `setting` VALUES ('17', 'websiteStatus', '', '2', '管理员禁止', '1');
INSERT INTO `setting` VALUES ('18', 'websiteStatus', '', '3', '站长禁止', '1');
INSERT INTO `setting` VALUES ('19', 'defaultValue', 'CommissionRate', '10', '佣金', '1');
INSERT INTO `setting` VALUES ('20', 'defaultValue', 'DeductionRate', '15', '优惠', '1');
INSERT INTO `setting` VALUES ('21', 'defaultValue', 'MinDeposit', '100', '最低存款', '1');
INSERT INTO `setting` VALUES ('22', 'defaultValue', 'MinWithdraw', '100', '最低提款', '1');
INSERT INTO `setting` VALUES ('23', 'websiteType', '', '0', '审核中', '1');
INSERT INTO `setting` VALUES ('24', 'websiteType', '', '1', '审核通过', '1');
INSERT INTO `setting` VALUES ('34', 'Android', '', 'Meizu', '魅族', '1');
INSERT INTO `setting` VALUES ('29', 'dayset', '', 'Tuesday', '星期二', '1');
INSERT INTO `setting` VALUES ('27', 'dayset', '', 'Sunday', '星期日', '1');
INSERT INTO `setting` VALUES ('28', 'dayset', '', 'Monday', '星期一', '1');
INSERT INTO `setting` VALUES ('30', 'dayset', null, 'Wednesday', '星期三', '1');
INSERT INTO `setting` VALUES ('31', 'dayset', null, 'Thursday', '星期四', '1');
INSERT INTO `setting` VALUES ('32', 'dayset', null, 'Friday', '星期五', '1');
INSERT INTO `setting` VALUES ('33', 'dayset', null, 'Saturday', '星期六', '1');
INSERT INTO `setting` VALUES ('35', 'Android', 'mobile', 'Xiaomi', '小米', '1');
INSERT INTO `setting` VALUES ('36', 'Android', 'mobile', 'Samsung', '三星', '1');
INSERT INTO `setting` VALUES ('37', 'Android', 'mobile', 'Lenovo', '联想', '1');
INSERT INTO `setting` VALUES ('38', 'Android', 'mobile', 'HTC', 'HTC', '1');
INSERT INTO `setting` VALUES ('39', 'Android', 'mobile', 'Huawei', '华为', '1');
INSERT INTO `setting` VALUES ('40', 'Android', 'mobile', 'VIVO', 'VIVO', '1');
INSERT INTO `setting` VALUES ('41', 'Android', 'mobile', 'OPPO', 'OPPO', '1');
INSERT INTO `setting` VALUES ('42', 'Android', 'mobile', 'SmartPhone', 'SmartPhone', '1');
INSERT INTO `setting` VALUES ('43', 'Android', 'mobile', 'Jinli', '金立', '1');
INSERT INTO `setting` VALUES ('44', 'Android', 'mobile', 'TCL', 'TCL', '1');
INSERT INTO `setting` VALUES ('45', 'Android', 'mobile', 'Hammer', '锤子', '1');
INSERT INTO `setting` VALUES ('46', 'Android', 'mobile', 'Meitu', '美图', '1');
INSERT INTO `setting` VALUES ('47', 'Android', 'mobile', 'LG', 'LG', '1');
INSERT INTO `setting` VALUES ('48', 'Android', 'mobile', '360', '360', '1');
INSERT INTO `setting` VALUES ('49', 'Android', 'mobile', 'Oneplus', '一加', '1');
INSERT INTO `setting` VALUES ('50', 'Android', 'mobile', 'LeTV', '乐视', '1');
INSERT INTO `setting` VALUES ('51', 'Android', 'mobile', 'Nokia', '诺基亚', '1');
INSERT INTO `setting` VALUES ('52', 'IOS', 'mobile', 'iphone', 'iphone', '1');
INSERT INTO `setting` VALUES ('53', 'IOS', 'mobile', 'iPad', 'iPad', '1');
INSERT INTO `setting` VALUES ('54', 'Android', 'Browser', 'Oppo', 'Oppo浏览器', '1');
INSERT INTO `setting` VALUES ('55', 'Android', 'Browser', 'QQ', 'QQ浏览器', '1');
INSERT INTO `setting` VALUES ('56', 'Android', 'Browser', 'UC', 'UC浏览器', '1');
INSERT INTO `setting` VALUES ('57', 'Android', 'Browser', 'vivo', 'vivo浏览器', '1');
INSERT INTO `setting` VALUES ('58', 'Android', 'Browser', 'xiaomi', '小米浏览器', '1');
INSERT INTO `setting` VALUES ('59', 'Android', 'Browser', 'weixin', '微信内置浏览器', '1');
INSERT INTO `setting` VALUES ('60', 'Android', 'Browser', 'mobilebaidu', '手机百度浏览器', '1');
INSERT INTO `setting` VALUES ('61', 'Android', 'Browser', 'baidu', '百度浏览器', '1');
INSERT INTO `setting` VALUES ('62', 'Android', 'Browser', 'Chrome', '谷歌浏览器', '1');
INSERT INTO `setting` VALUES ('63', 'IOS', 'Browser', 'QQ', 'QQ浏览器', '1');
INSERT INTO `setting` VALUES ('64', 'IOS', 'Browser', 'UC', 'UC浏览器', '1');
INSERT INTO `setting` VALUES ('65', 'IOS', 'Browser', 'weixin', '微信内置浏览器', '1');
INSERT INTO `setting` VALUES ('66', 'IOS', 'Browser', 'mobilebaidu', '手机百度浏览器', '1');
INSERT INTO `setting` VALUES ('67', 'IOS', 'Browser', 'baidu', '百度浏览器', '1');
INSERT INTO `setting` VALUES ('68', 'IOS', 'Browser', 'Safari', '苹果浏览器', '1');
INSERT INTO `setting` VALUES ('69', 'IOS', 'Browser', 'Chrome', '谷歌浏览器', '1');
INSERT INTO `setting` VALUES ('70', 'WebType', null, '1', '综合门户', '1');
INSERT INTO `setting` VALUES ('71', 'WebType', null, '1', '新闻资讯', '1');
INSERT INTO `setting` VALUES ('72', 'WebType', null, '1', '体育竞技', '1');
INSERT INTO `setting` VALUES ('73', 'WebType', null, '1', '图片网站', '1');
INSERT INTO `setting` VALUES ('74', 'WebType', null, '1', '明星八卦', '1');
INSERT INTO `setting` VALUES ('75', 'WebType', null, '1', '小说网站', '1');
INSERT INTO `setting` VALUES ('76', 'WebType', null, '1', '聊天社区', '1');
INSERT INTO `setting` VALUES ('77', 'WebType', null, '1', '动漫漫画', '1');
INSERT INTO `setting` VALUES ('78', 'WebType', null, '1', '游戏娱乐', '1');
INSERT INTO `setting` VALUES ('79', 'WebType', null, '1', '女性时尚', '1');
INSERT INTO `setting` VALUES ('80', 'WebType', null, '1', '美食购物', '1');
INSERT INTO `setting` VALUES ('81', 'WebType', null, '1', '生活旅游', '1');
INSERT INTO `setting` VALUES ('82', 'WebType', null, '1', '行业相关', '1');
INSERT INTO `setting` VALUES ('83', 'WebType', null, '1', '电脑软件', '1');
INSERT INTO `setting` VALUES ('84', 'WebType', null, '1', '银行金融', '1');
INSERT INTO `setting` VALUES ('85', 'WebType', null, '1', '教育教学', '1');
INSERT INTO `setting` VALUES ('86', 'WebType', null, '1', '婚恋交友', '1');
INSERT INTO `setting` VALUES ('87', 'WebType', null, '1', '政治军事', '1');
INSERT INTO `setting` VALUES ('88', 'WebType', null, '1', '影视类', '1');
INSERT INTO `setting` VALUES ('89', 'WebType', null, '1', '其他网站', '1');
INSERT INTO `setting` VALUES ('90', 'NetworkType', null, '1', '移动网络', '1');
INSERT INTO `setting` VALUES ('91', 'NetworkType', null, '1', 'wifi网络', '1');
INSERT INTO `setting` VALUES ('92', 'NetworkType', null, '1', '以太网', '1');
INSERT INTO `setting` VALUES ('93', 'NetworkType', null, '1', '2G', '1');
INSERT INTO `setting` VALUES ('94', 'NetworkType', null, '1', '3G', '1');
INSERT INTO `setting` VALUES ('95', 'NetworkType', null, '1', '4G', '1');
INSERT INTO `setting` VALUES ('96', 'NetworkType', null, '1', '5G', '1');
INSERT INTO `setting` VALUES ('97', 'Operator', null, '1', '移动', '1');
INSERT INTO `setting` VALUES ('98', 'Operator', null, '1', '联通', '1');
INSERT INTO `setting` VALUES ('99', 'Operator', null, '1', '电信', '1');
INSERT INTO `setting` VALUES ('100', 'Operator', null, '1', '其它', '1');
INSERT INTO `setting` VALUES ('101', 'adsType', null, 'onlyword', '网摘', '1');

-- ----------------------------
-- Table structure for `setting_group`
-- ----------------------------
DROP TABLE IF EXISTS `setting_group`;
CREATE TABLE `setting_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '上级分组id',
  `name` varchar(50) NOT NULL COMMENT '用这个字段来分类例如adstype,即相当于以前的ads_type表',
  `remark` varchar(50) NOT NULL COMMENT '这个表group是什么,中文的例如 "广告类型"',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting_group
-- ----------------------------
INSERT INTO `setting_group` VALUES ('1', '0', 'adsType', '广告模式');
INSERT INTO `setting_group` VALUES ('2', '0', 'countType', '计费模式');
INSERT INTO `setting_group` VALUES ('3', '0', 'payType', '支付方式');
INSERT INTO `setting_group` VALUES ('4', '0', 'memberType', '会员类型');
INSERT INTO `setting_group` VALUES ('5', '0', 'websiteStatus', '网站状态');
INSERT INTO `setting_group` VALUES ('6', '0', 'defaultValue', '默认数据');
INSERT INTO `setting_group` VALUES ('7', '0', 'websiteType', '网站类型');
INSERT INTO `setting_group` VALUES ('8', '0', 'depositStatus', '存款状态');
INSERT INTO `setting_group` VALUES ('9', '0', 'withdrawStatus', '提款状态');
INSERT INTO `setting_group` VALUES ('10', '0', 'memberStatus', '会员状态');
INSERT INTO `setting_group` VALUES ('11', '0', 'summaryType', '数据总结类型');
INSERT INTO `setting_group` VALUES ('12', '0', 'materialType', '素材类型');
INSERT INTO `setting_group` VALUES ('13', '0', 'china', '全国地区');
INSERT INTO `setting_group` VALUES ('14', '13', 'guangdong', '广东');
INSERT INTO `setting_group` VALUES ('15', '13', 'beijing', '北京');
INSERT INTO `setting_group` VALUES ('16', '13', 'jilin', '吉林');
INSERT INTO `setting_group` VALUES ('17', '13', 'fujian', '福建');
INSERT INTO `setting_group` VALUES ('18', '13', 'yunnan', '云南');
INSERT INTO `setting_group` VALUES ('19', '13', 'xinjiang', '新疆');
INSERT INTO `setting_group` VALUES ('20', '13', 'tianjin', '天津');
INSERT INTO `setting_group` VALUES ('21', '13', 'heilongjiang', '黑龙江');
INSERT INTO `setting_group` VALUES ('22', '13', 'jiangxi', '江西');
INSERT INTO `setting_group` VALUES ('23', '13', 'guangxi', '广西');
INSERT INTO `setting_group` VALUES ('24', '13', 'xizang', '西藏');
INSERT INTO `setting_group` VALUES ('25', '13', 'hebei', '河北');
INSERT INTO `setting_group` VALUES ('26', '13', 'shanghai', '上海');
INSERT INTO `setting_group` VALUES ('27', '13', 'shandong', '山东');
INSERT INTO `setting_group` VALUES ('28', '13', 'hainan', '海南');
INSERT INTO `setting_group` VALUES ('29', '13', 'shaanxi', '陕西');
INSERT INTO `setting_group` VALUES ('30', '13', 'shanxi', '山西');
INSERT INTO `setting_group` VALUES ('31', '13', 'jiangsu', '江苏');
INSERT INTO `setting_group` VALUES ('32', '13', 'henan', '河南');
INSERT INTO `setting_group` VALUES ('33', '13', 'chongqing', '重庆');
INSERT INTO `setting_group` VALUES ('34', '13', 'gansu', '甘肃');
INSERT INTO `setting_group` VALUES ('35', '13', 'neimenggu', '内蒙古');
INSERT INTO `setting_group` VALUES ('36', '13', 'zhejiang', '浙江');
INSERT INTO `setting_group` VALUES ('37', '13', 'hubei', '湖北');
INSERT INTO `setting_group` VALUES ('38', '13', 'sichuan', '四川');
INSERT INTO `setting_group` VALUES ('39', '13', 'qinghai', '青海');
INSERT INTO `setting_group` VALUES ('40', '13', 'liaoning', '辽宁');
INSERT INTO `setting_group` VALUES ('41', '13', 'anhui', '安徽');
INSERT INTO `setting_group` VALUES ('42', '13', 'hunan', '湖南');
INSERT INTO `setting_group` VALUES ('43', '13', 'guizhou', '贵州');
INSERT INTO `setting_group` VALUES ('44', '13', 'ningxia', '宁夏');
INSERT INTO `setting_group` VALUES ('45', '0', 'dayset', '投放日期');
INSERT INTO `setting_group` VALUES ('46', '0', 'system', '投放设备系统');
INSERT INTO `setting_group` VALUES ('47', '46', 'Android', '安卓');
INSERT INTO `setting_group` VALUES ('48', '46', 'IOS', '苹果');
INSERT INTO `setting_group` VALUES ('49', '0', 'WebType', '网站类型');
INSERT INTO `setting_group` VALUES ('50', '0', 'NetworkType', '网络类型');
INSERT INTO `setting_group` VALUES ('51', '0', 'Operator', '网络运营商');
INSERT INTO `setting_group` VALUES ('52', '0', 'ImageType', '图片素材类型');
INSERT INTO `setting_group` VALUES ('53', '52', 'jiaoyou', '正规交友');
INSERT INTO `setting_group` VALUES ('54', '52', 'mobilegame', '手机游戏');
INSERT INTO `setting_group` VALUES ('55', '52', 'webearn', '网赚');
INSERT INTO `setting_group` VALUES ('56', '52', 'Ecommerce', '电商');
INSERT INTO `setting_group` VALUES ('57', '52', 'creditcard', '信用卡');
INSERT INTO `setting_group` VALUES ('58', '52', 'adult', '成人用品');
INSERT INTO `setting_group` VALUES ('59', '52', 'mobileappication', '手机安全应用');
INSERT INTO `setting_group` VALUES ('60', '52', 'cosmetic', '化妆品');
INSERT INTO `setting_group` VALUES ('61', '52', 'casualgames', '休闲游戏');
INSERT INTO `setting_group` VALUES ('62', '52', 'lottery', '彩票');
INSERT INTO `setting_group` VALUES ('63', '52', 'novel', '小说');
INSERT INTO `setting_group` VALUES ('64', '52', 'live', '直播');
INSERT INTO `setting_group` VALUES ('65', '53', 'anime', '动漫');

-- ----------------------------
-- Table structure for `statistics`
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics` (
  `statistics_id` bigint(9) NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) NOT NULL,
  `come_url` varchar(100) NOT NULL COMMENT '来路',
  `ads_id` int(8) NOT NULL,
  `click_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:浏览 1:点击',
  `region` varchar(30) DEFAULT NULL,
  `region_id` int(8) DEFAULT NULL,
  `visit_time` int(10) NOT NULL,
  `ismobile` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:pc 1:手机',
  `vistor_system` varchar(50) DEFAULT NULL,
  `vistor_exploer` varchar(50) DEFAULT NULL,
  `earn_money` tinyint(1) NOT NULL DEFAULT '0' COMMENT '扣量变量，0:不扣量 1:表示这个要扣一来',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `web_id` int(11) NOT NULL,
  PRIMARY KEY (`statistics_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics
-- ----------------------------

-- ----------------------------
-- Table structure for `summary`
-- ----------------------------
DROP TABLE IF EXISTS `summary`;
CREATE TABLE `summary` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '暂时只分为website和ads(把这两个加入到setting group)',
  `date` date NOT NULL,
  `amount` decimal(10,4) NOT NULL COMMENT '站长赚钱是正数，广告商支出是负数',
  `forid` int(11) NOT NULL COMMENT 'adsid或者是websiteid'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台调用这个表可以历史统计，这个表后台无需做修改';

-- ----------------------------
-- Records of summary
-- ----------------------------

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1705 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'test');
INSERT INTO `test` VALUES ('2', 'test');
INSERT INTO `test` VALUES ('3', 'test');
INSERT INTO `test` VALUES ('4', 'test');
INSERT INTO `test` VALUES ('5', 'test');
INSERT INTO `test` VALUES ('6', 'test');
INSERT INTO `test` VALUES ('7', 'test');
INSERT INTO `test` VALUES ('8', 'test');
INSERT INTO `test` VALUES ('9', 'test');
INSERT INTO `test` VALUES ('10', 'test');
INSERT INTO `test` VALUES ('11', 'test');
INSERT INTO `test` VALUES ('12', 'test');
INSERT INTO `test` VALUES ('13', 'test');
INSERT INTO `test` VALUES ('14', 'test');
INSERT INTO `test` VALUES ('15', 'test');
INSERT INTO `test` VALUES ('16', 'test');
INSERT INTO `test` VALUES ('17', 'test');
INSERT INTO `test` VALUES ('18', 'test');
INSERT INTO `test` VALUES ('19', 'test');
INSERT INTO `test` VALUES ('20', 'test');
INSERT INTO `test` VALUES ('21', 'test');
INSERT INTO `test` VALUES ('22', 'test');
INSERT INTO `test` VALUES ('23', 'test');
INSERT INTO `test` VALUES ('24', 'test');
INSERT INTO `test` VALUES ('25', 'test');
INSERT INTO `test` VALUES ('26', 'test');
INSERT INTO `test` VALUES ('27', 'test');
INSERT INTO `test` VALUES ('28', 'test');
INSERT INTO `test` VALUES ('29', 'test');
INSERT INTO `test` VALUES ('30', 'test');
INSERT INTO `test` VALUES ('31', 'test');
INSERT INTO `test` VALUES ('32', 'test');
INSERT INTO `test` VALUES ('33', 'test');
INSERT INTO `test` VALUES ('34', 'test');
INSERT INTO `test` VALUES ('35', 'test');
INSERT INTO `test` VALUES ('36', 'test');
INSERT INTO `test` VALUES ('37', 'test');
INSERT INTO `test` VALUES ('38', 'test');
INSERT INTO `test` VALUES ('39', 'test');
INSERT INTO `test` VALUES ('40', 'test');
INSERT INTO `test` VALUES ('41', 'test');
INSERT INTO `test` VALUES ('42', 'test');
INSERT INTO `test` VALUES ('43', 'test');
INSERT INTO `test` VALUES ('44', 'test');
INSERT INTO `test` VALUES ('45', 'test');
INSERT INTO `test` VALUES ('46', 'test');
INSERT INTO `test` VALUES ('47', 'test');
INSERT INTO `test` VALUES ('48', 'test');
INSERT INTO `test` VALUES ('49', 'test');
INSERT INTO `test` VALUES ('50', 'test');
INSERT INTO `test` VALUES ('51', 'test');
INSERT INTO `test` VALUES ('52', 'test');
INSERT INTO `test` VALUES ('53', 'test');
INSERT INTO `test` VALUES ('54', 'test');
INSERT INTO `test` VALUES ('55', 'test');
INSERT INTO `test` VALUES ('56', 'test');
INSERT INTO `test` VALUES ('57', 'test');
INSERT INTO `test` VALUES ('58', 'test');
INSERT INTO `test` VALUES ('59', 'test');
INSERT INTO `test` VALUES ('60', 'test');
INSERT INTO `test` VALUES ('61', 'test');
INSERT INTO `test` VALUES ('62', 'test');
INSERT INTO `test` VALUES ('63', 'test');
INSERT INTO `test` VALUES ('64', 'test');
INSERT INTO `test` VALUES ('65', 'test');
INSERT INTO `test` VALUES ('66', 'test');
INSERT INTO `test` VALUES ('67', 'test');
INSERT INTO `test` VALUES ('68', 'test');
INSERT INTO `test` VALUES ('69', 'test');
INSERT INTO `test` VALUES ('70', 'test');
INSERT INTO `test` VALUES ('71', 'test');
INSERT INTO `test` VALUES ('72', 'test');
INSERT INTO `test` VALUES ('73', 'test');
INSERT INTO `test` VALUES ('74', 'test');
INSERT INTO `test` VALUES ('75', 'test');
INSERT INTO `test` VALUES ('76', 'test');
INSERT INTO `test` VALUES ('77', 'test');
INSERT INTO `test` VALUES ('78', 'test');
INSERT INTO `test` VALUES ('79', 'test');
INSERT INTO `test` VALUES ('80', 'test');
INSERT INTO `test` VALUES ('81', 'test');
INSERT INTO `test` VALUES ('82', 'test');
INSERT INTO `test` VALUES ('83', 'test');
INSERT INTO `test` VALUES ('84', 'test');
INSERT INTO `test` VALUES ('85', 'test');
INSERT INTO `test` VALUES ('86', 'test');
INSERT INTO `test` VALUES ('87', 'test');
INSERT INTO `test` VALUES ('88', 'test');
INSERT INTO `test` VALUES ('89', 'test');
INSERT INTO `test` VALUES ('90', 'test');
INSERT INTO `test` VALUES ('91', 'test');
INSERT INTO `test` VALUES ('92', 'test');
INSERT INTO `test` VALUES ('93', 'test');
INSERT INTO `test` VALUES ('94', 'test');
INSERT INTO `test` VALUES ('95', 'test');
INSERT INTO `test` VALUES ('96', 'test');
INSERT INTO `test` VALUES ('97', 'test');
INSERT INTO `test` VALUES ('98', 'test');
INSERT INTO `test` VALUES ('99', 'test');
INSERT INTO `test` VALUES ('100', 'test');
INSERT INTO `test` VALUES ('101', 'test');
INSERT INTO `test` VALUES ('102', 'test');
INSERT INTO `test` VALUES ('103', 'test');
INSERT INTO `test` VALUES ('104', 'test');
INSERT INTO `test` VALUES ('105', 'test');
INSERT INTO `test` VALUES ('106', 'test');
INSERT INTO `test` VALUES ('107', 'test');
INSERT INTO `test` VALUES ('108', 'test');
INSERT INTO `test` VALUES ('109', 'test');
INSERT INTO `test` VALUES ('110', 'test');
INSERT INTO `test` VALUES ('111', 'test');
INSERT INTO `test` VALUES ('112', 'test');
INSERT INTO `test` VALUES ('113', 'test');
INSERT INTO `test` VALUES ('114', 'test');
INSERT INTO `test` VALUES ('115', 'test');
INSERT INTO `test` VALUES ('116', 'test');
INSERT INTO `test` VALUES ('117', 'test');
INSERT INTO `test` VALUES ('118', 'test');
INSERT INTO `test` VALUES ('119', 'test');
INSERT INTO `test` VALUES ('120', 'test');
INSERT INTO `test` VALUES ('121', 'test');
INSERT INTO `test` VALUES ('122', 'test');
INSERT INTO `test` VALUES ('123', 'test');
INSERT INTO `test` VALUES ('124', 'test');
INSERT INTO `test` VALUES ('125', 'test');
INSERT INTO `test` VALUES ('126', 'test');
INSERT INTO `test` VALUES ('127', 'test');
INSERT INTO `test` VALUES ('128', 'test');
INSERT INTO `test` VALUES ('129', 'test');
INSERT INTO `test` VALUES ('130', 'test');
INSERT INTO `test` VALUES ('131', 'test');
INSERT INTO `test` VALUES ('132', 'test');
INSERT INTO `test` VALUES ('133', 'test');
INSERT INTO `test` VALUES ('134', 'test');
INSERT INTO `test` VALUES ('135', 'test');
INSERT INTO `test` VALUES ('136', 'test');
INSERT INTO `test` VALUES ('137', 'test');
INSERT INTO `test` VALUES ('138', 'test');
INSERT INTO `test` VALUES ('139', 'test');
INSERT INTO `test` VALUES ('140', 'test');
INSERT INTO `test` VALUES ('141', 'test');
INSERT INTO `test` VALUES ('142', 'test');
INSERT INTO `test` VALUES ('143', 'test');
INSERT INTO `test` VALUES ('144', 'test');
INSERT INTO `test` VALUES ('145', 'test');
INSERT INTO `test` VALUES ('146', 'test');
INSERT INTO `test` VALUES ('147', 'test');
INSERT INTO `test` VALUES ('148', 'test');
INSERT INTO `test` VALUES ('149', 'test');
INSERT INTO `test` VALUES ('150', 'test');
INSERT INTO `test` VALUES ('151', 'test');
INSERT INTO `test` VALUES ('152', 'test');
INSERT INTO `test` VALUES ('153', 'test');
INSERT INTO `test` VALUES ('154', 'test');
INSERT INTO `test` VALUES ('155', 'test');
INSERT INTO `test` VALUES ('156', 'test');
INSERT INTO `test` VALUES ('157', 'test');
INSERT INTO `test` VALUES ('158', 'test');
INSERT INTO `test` VALUES ('159', 'test');
INSERT INTO `test` VALUES ('160', 'test');
INSERT INTO `test` VALUES ('161', 'test');
INSERT INTO `test` VALUES ('162', 'test');
INSERT INTO `test` VALUES ('163', 'test');
INSERT INTO `test` VALUES ('164', 'test');
INSERT INTO `test` VALUES ('165', 'test');
INSERT INTO `test` VALUES ('166', 'test');
INSERT INTO `test` VALUES ('167', 'test');
INSERT INTO `test` VALUES ('168', 'test');
INSERT INTO `test` VALUES ('169', 'test');
INSERT INTO `test` VALUES ('170', 'test');
INSERT INTO `test` VALUES ('171', 'test');
INSERT INTO `test` VALUES ('172', 'test');
INSERT INTO `test` VALUES ('173', 'test');
INSERT INTO `test` VALUES ('174', 'test');
INSERT INTO `test` VALUES ('175', 'test');
INSERT INTO `test` VALUES ('176', 'test');
INSERT INTO `test` VALUES ('177', 'test');
INSERT INTO `test` VALUES ('178', 'test');
INSERT INTO `test` VALUES ('179', 'test');
INSERT INTO `test` VALUES ('180', 'test');
INSERT INTO `test` VALUES ('181', 'test');
INSERT INTO `test` VALUES ('182', 'test');
INSERT INTO `test` VALUES ('183', 'test');
INSERT INTO `test` VALUES ('184', 'test');
INSERT INTO `test` VALUES ('185', 'test');
INSERT INTO `test` VALUES ('186', 'test');
INSERT INTO `test` VALUES ('187', 'test');
INSERT INTO `test` VALUES ('188', 'test');
INSERT INTO `test` VALUES ('189', 'test');
INSERT INTO `test` VALUES ('190', 'test');
INSERT INTO `test` VALUES ('191', 'test');
INSERT INTO `test` VALUES ('192', 'test');
INSERT INTO `test` VALUES ('193', 'test');
INSERT INTO `test` VALUES ('194', 'test');
INSERT INTO `test` VALUES ('195', 'test');
INSERT INTO `test` VALUES ('196', 'test');
INSERT INTO `test` VALUES ('197', 'test');
INSERT INTO `test` VALUES ('198', 'test');
INSERT INTO `test` VALUES ('199', 'test');
INSERT INTO `test` VALUES ('200', 'test');
INSERT INTO `test` VALUES ('201', 'test');
INSERT INTO `test` VALUES ('202', 'test');
INSERT INTO `test` VALUES ('203', 'test');
INSERT INTO `test` VALUES ('204', 'test');
INSERT INTO `test` VALUES ('205', 'test');
INSERT INTO `test` VALUES ('206', 'test');
INSERT INTO `test` VALUES ('207', 'test');
INSERT INTO `test` VALUES ('208', 'test');
INSERT INTO `test` VALUES ('209', 'test');
INSERT INTO `test` VALUES ('210', 'test');
INSERT INTO `test` VALUES ('211', 'test');
INSERT INTO `test` VALUES ('212', 'test');
INSERT INTO `test` VALUES ('213', 'test');
INSERT INTO `test` VALUES ('214', 'test');
INSERT INTO `test` VALUES ('215', 'test');
INSERT INTO `test` VALUES ('216', 'test');
INSERT INTO `test` VALUES ('217', 'test');
INSERT INTO `test` VALUES ('218', 'test');
INSERT INTO `test` VALUES ('219', 'test');
INSERT INTO `test` VALUES ('220', 'test');
INSERT INTO `test` VALUES ('221', 'test');
INSERT INTO `test` VALUES ('222', 'test');
INSERT INTO `test` VALUES ('223', 'test');
INSERT INTO `test` VALUES ('224', 'test');
INSERT INTO `test` VALUES ('225', 'test');
INSERT INTO `test` VALUES ('226', 'test');
INSERT INTO `test` VALUES ('227', 'test');
INSERT INTO `test` VALUES ('228', 'test');
INSERT INTO `test` VALUES ('229', 'test');
INSERT INTO `test` VALUES ('230', 'test');
INSERT INTO `test` VALUES ('231', 'test');
INSERT INTO `test` VALUES ('232', 'test');
INSERT INTO `test` VALUES ('233', 'test');
INSERT INTO `test` VALUES ('234', 'test');
INSERT INTO `test` VALUES ('235', 'test');
INSERT INTO `test` VALUES ('236', 'test');
INSERT INTO `test` VALUES ('237', 'test');
INSERT INTO `test` VALUES ('238', 'test');
INSERT INTO `test` VALUES ('239', 'test');
INSERT INTO `test` VALUES ('240', 'test');
INSERT INTO `test` VALUES ('241', 'test');
INSERT INTO `test` VALUES ('242', 'test');
INSERT INTO `test` VALUES ('243', 'test');
INSERT INTO `test` VALUES ('244', 'test');
INSERT INTO `test` VALUES ('245', 'test');
INSERT INTO `test` VALUES ('246', 'test');
INSERT INTO `test` VALUES ('247', 'test');
INSERT INTO `test` VALUES ('248', 'test');
INSERT INTO `test` VALUES ('249', 'test');
INSERT INTO `test` VALUES ('250', 'test');
INSERT INTO `test` VALUES ('251', 'test');
INSERT INTO `test` VALUES ('252', 'test');
INSERT INTO `test` VALUES ('253', 'test');
INSERT INTO `test` VALUES ('254', 'test');
INSERT INTO `test` VALUES ('255', 'test');
INSERT INTO `test` VALUES ('256', 'test');
INSERT INTO `test` VALUES ('257', 'test');
INSERT INTO `test` VALUES ('258', 'test');
INSERT INTO `test` VALUES ('259', 'test');
INSERT INTO `test` VALUES ('260', 'test');
INSERT INTO `test` VALUES ('261', 'test');
INSERT INTO `test` VALUES ('262', 'test');
INSERT INTO `test` VALUES ('263', 'test');
INSERT INTO `test` VALUES ('264', 'test');
INSERT INTO `test` VALUES ('265', 'test');
INSERT INTO `test` VALUES ('266', 'test');
INSERT INTO `test` VALUES ('267', 'test');
INSERT INTO `test` VALUES ('268', 'test');
INSERT INTO `test` VALUES ('269', 'test');
INSERT INTO `test` VALUES ('270', 'test');
INSERT INTO `test` VALUES ('271', 'test');
INSERT INTO `test` VALUES ('272', 'test');
INSERT INTO `test` VALUES ('273', 'test');
INSERT INTO `test` VALUES ('274', 'test');
INSERT INTO `test` VALUES ('275', 'test');
INSERT INTO `test` VALUES ('276', 'test');
INSERT INTO `test` VALUES ('277', 'test');
INSERT INTO `test` VALUES ('278', 'test');
INSERT INTO `test` VALUES ('279', 'test');
INSERT INTO `test` VALUES ('280', 'test');
INSERT INTO `test` VALUES ('281', 'test');
INSERT INTO `test` VALUES ('282', 'test');
INSERT INTO `test` VALUES ('283', 'test');
INSERT INTO `test` VALUES ('284', 'test');
INSERT INTO `test` VALUES ('285', 'test');
INSERT INTO `test` VALUES ('286', 'test');
INSERT INTO `test` VALUES ('287', 'test');
INSERT INTO `test` VALUES ('288', 'test');
INSERT INTO `test` VALUES ('289', 'test');
INSERT INTO `test` VALUES ('290', 'test');
INSERT INTO `test` VALUES ('291', 'test');
INSERT INTO `test` VALUES ('292', 'test');
INSERT INTO `test` VALUES ('293', 'test');
INSERT INTO `test` VALUES ('294', 'test');
INSERT INTO `test` VALUES ('295', 'test');
INSERT INTO `test` VALUES ('296', 'test');
INSERT INTO `test` VALUES ('297', 'test');
INSERT INTO `test` VALUES ('298', 'test');
INSERT INTO `test` VALUES ('299', 'test');
INSERT INTO `test` VALUES ('300', 'test');
INSERT INTO `test` VALUES ('301', 'test');
INSERT INTO `test` VALUES ('302', 'test');
INSERT INTO `test` VALUES ('303', 'test');
INSERT INTO `test` VALUES ('304', 'test');
INSERT INTO `test` VALUES ('305', 'test');
INSERT INTO `test` VALUES ('306', 'test');
INSERT INTO `test` VALUES ('307', 'test');
INSERT INTO `test` VALUES ('308', 'test');
INSERT INTO `test` VALUES ('309', 'test');
INSERT INTO `test` VALUES ('310', 'test');
INSERT INTO `test` VALUES ('311', 'test');
INSERT INTO `test` VALUES ('312', 'test');
INSERT INTO `test` VALUES ('313', 'test');
INSERT INTO `test` VALUES ('314', 'test');
INSERT INTO `test` VALUES ('315', 'test');
INSERT INTO `test` VALUES ('316', 'test');
INSERT INTO `test` VALUES ('317', 'test');
INSERT INTO `test` VALUES ('318', 'test');
INSERT INTO `test` VALUES ('319', 'test');
INSERT INTO `test` VALUES ('320', 'test');
INSERT INTO `test` VALUES ('321', 'test');
INSERT INTO `test` VALUES ('322', 'test');
INSERT INTO `test` VALUES ('323', 'test');
INSERT INTO `test` VALUES ('324', 'test');
INSERT INTO `test` VALUES ('325', 'test');
INSERT INTO `test` VALUES ('326', 'test');
INSERT INTO `test` VALUES ('327', 'test');
INSERT INTO `test` VALUES ('328', 'test');
INSERT INTO `test` VALUES ('329', 'test');
INSERT INTO `test` VALUES ('330', 'test');
INSERT INTO `test` VALUES ('331', 'test');
INSERT INTO `test` VALUES ('332', 'test');
INSERT INTO `test` VALUES ('333', 'test');
INSERT INTO `test` VALUES ('334', 'test');
INSERT INTO `test` VALUES ('335', 'test');
INSERT INTO `test` VALUES ('336', 'test');
INSERT INTO `test` VALUES ('337', 'test');
INSERT INTO `test` VALUES ('338', 'test');
INSERT INTO `test` VALUES ('339', 'test');
INSERT INTO `test` VALUES ('340', 'test');
INSERT INTO `test` VALUES ('341', 'test');
INSERT INTO `test` VALUES ('342', 'test');
INSERT INTO `test` VALUES ('343', 'test');
INSERT INTO `test` VALUES ('344', 'test');
INSERT INTO `test` VALUES ('345', 'test');
INSERT INTO `test` VALUES ('346', 'test');
INSERT INTO `test` VALUES ('347', 'test');
INSERT INTO `test` VALUES ('348', 'test');
INSERT INTO `test` VALUES ('349', 'test');
INSERT INTO `test` VALUES ('350', 'test');
INSERT INTO `test` VALUES ('351', 'test');
INSERT INTO `test` VALUES ('352', 'test');
INSERT INTO `test` VALUES ('353', 'test');
INSERT INTO `test` VALUES ('354', 'test');
INSERT INTO `test` VALUES ('355', 'test');
INSERT INTO `test` VALUES ('356', 'test');
INSERT INTO `test` VALUES ('357', 'test');
INSERT INTO `test` VALUES ('358', 'test');
INSERT INTO `test` VALUES ('359', 'test');
INSERT INTO `test` VALUES ('360', 'test');
INSERT INTO `test` VALUES ('361', 'test');
INSERT INTO `test` VALUES ('362', 'test');
INSERT INTO `test` VALUES ('363', 'test');
INSERT INTO `test` VALUES ('364', 'test');
INSERT INTO `test` VALUES ('365', 'test');
INSERT INTO `test` VALUES ('366', 'test');
INSERT INTO `test` VALUES ('367', 'test');
INSERT INTO `test` VALUES ('368', 'test');
INSERT INTO `test` VALUES ('369', 'test');
INSERT INTO `test` VALUES ('370', 'test');
INSERT INTO `test` VALUES ('371', 'test');
INSERT INTO `test` VALUES ('372', 'test');
INSERT INTO `test` VALUES ('373', 'test');
INSERT INTO `test` VALUES ('374', 'test');
INSERT INTO `test` VALUES ('375', 'test');
INSERT INTO `test` VALUES ('376', 'test');
INSERT INTO `test` VALUES ('377', 'test');
INSERT INTO `test` VALUES ('378', 'test');
INSERT INTO `test` VALUES ('379', 'test');
INSERT INTO `test` VALUES ('380', 'test');
INSERT INTO `test` VALUES ('381', 'test');
INSERT INTO `test` VALUES ('382', 'test');
INSERT INTO `test` VALUES ('383', 'test');
INSERT INTO `test` VALUES ('384', 'test');
INSERT INTO `test` VALUES ('385', 'test');
INSERT INTO `test` VALUES ('386', 'test');
INSERT INTO `test` VALUES ('387', 'test');
INSERT INTO `test` VALUES ('388', 'test');
INSERT INTO `test` VALUES ('389', 'test');
INSERT INTO `test` VALUES ('390', 'test');
INSERT INTO `test` VALUES ('391', 'test');
INSERT INTO `test` VALUES ('392', 'test');
INSERT INTO `test` VALUES ('393', 'test');
INSERT INTO `test` VALUES ('394', 'test');
INSERT INTO `test` VALUES ('395', 'test');
INSERT INTO `test` VALUES ('396', 'test');
INSERT INTO `test` VALUES ('397', 'test');
INSERT INTO `test` VALUES ('398', 'test');
INSERT INTO `test` VALUES ('399', 'test');
INSERT INTO `test` VALUES ('400', 'test');
INSERT INTO `test` VALUES ('401', 'test');
INSERT INTO `test` VALUES ('402', 'test');
INSERT INTO `test` VALUES ('403', 'test');
INSERT INTO `test` VALUES ('404', 'test');
INSERT INTO `test` VALUES ('405', 'test');
INSERT INTO `test` VALUES ('406', 'test');
INSERT INTO `test` VALUES ('407', 'test');
INSERT INTO `test` VALUES ('408', 'test');
INSERT INTO `test` VALUES ('409', 'test');
INSERT INTO `test` VALUES ('410', 'test');
INSERT INTO `test` VALUES ('411', 'test');
INSERT INTO `test` VALUES ('412', 'test');
INSERT INTO `test` VALUES ('413', 'test');
INSERT INTO `test` VALUES ('414', 'test');
INSERT INTO `test` VALUES ('415', 'test');
INSERT INTO `test` VALUES ('416', 'test');
INSERT INTO `test` VALUES ('417', 'test');
INSERT INTO `test` VALUES ('418', 'test');
INSERT INTO `test` VALUES ('419', 'test');
INSERT INTO `test` VALUES ('420', 'test');
INSERT INTO `test` VALUES ('421', 'test');
INSERT INTO `test` VALUES ('422', 'test');
INSERT INTO `test` VALUES ('423', 'test');
INSERT INTO `test` VALUES ('424', 'test');
INSERT INTO `test` VALUES ('425', 'test');
INSERT INTO `test` VALUES ('426', 'test');
INSERT INTO `test` VALUES ('427', 'test');
INSERT INTO `test` VALUES ('428', 'test');
INSERT INTO `test` VALUES ('429', 'test');
INSERT INTO `test` VALUES ('430', 'test');
INSERT INTO `test` VALUES ('431', 'test');
INSERT INTO `test` VALUES ('432', 'test');
INSERT INTO `test` VALUES ('433', 'test');
INSERT INTO `test` VALUES ('434', 'test');
INSERT INTO `test` VALUES ('435', 'test');
INSERT INTO `test` VALUES ('436', 'test');
INSERT INTO `test` VALUES ('437', 'test');
INSERT INTO `test` VALUES ('438', 'test');
INSERT INTO `test` VALUES ('439', 'test');
INSERT INTO `test` VALUES ('440', 'test');
INSERT INTO `test` VALUES ('441', 'test');
INSERT INTO `test` VALUES ('442', 'test');
INSERT INTO `test` VALUES ('443', 'test');
INSERT INTO `test` VALUES ('444', 'test');
INSERT INTO `test` VALUES ('445', 'test');
INSERT INTO `test` VALUES ('446', 'test');
INSERT INTO `test` VALUES ('447', 'test');
INSERT INTO `test` VALUES ('448', 'test');
INSERT INTO `test` VALUES ('449', 'test');
INSERT INTO `test` VALUES ('450', 'test');
INSERT INTO `test` VALUES ('451', 'test');
INSERT INTO `test` VALUES ('452', 'test');
INSERT INTO `test` VALUES ('453', 'test');
INSERT INTO `test` VALUES ('454', 'test');
INSERT INTO `test` VALUES ('455', 'test');
INSERT INTO `test` VALUES ('456', 'test');
INSERT INTO `test` VALUES ('457', 'test');
INSERT INTO `test` VALUES ('458', 'test');
INSERT INTO `test` VALUES ('459', 'test');
INSERT INTO `test` VALUES ('460', 'test');
INSERT INTO `test` VALUES ('461', 'test');
INSERT INTO `test` VALUES ('462', 'test');
INSERT INTO `test` VALUES ('463', 'test');
INSERT INTO `test` VALUES ('464', 'test');
INSERT INTO `test` VALUES ('465', 'test');
INSERT INTO `test` VALUES ('466', 'test');
INSERT INTO `test` VALUES ('467', 'test');
INSERT INTO `test` VALUES ('468', 'test');
INSERT INTO `test` VALUES ('469', 'test');
INSERT INTO `test` VALUES ('470', 'test');
INSERT INTO `test` VALUES ('471', 'test');
INSERT INTO `test` VALUES ('472', 'test');
INSERT INTO `test` VALUES ('473', 'test');
INSERT INTO `test` VALUES ('474', 'test');
INSERT INTO `test` VALUES ('475', 'test');
INSERT INTO `test` VALUES ('476', 'test');
INSERT INTO `test` VALUES ('477', 'test');
INSERT INTO `test` VALUES ('478', 'test');
INSERT INTO `test` VALUES ('479', 'test');
INSERT INTO `test` VALUES ('480', 'test');
INSERT INTO `test` VALUES ('481', 'test');
INSERT INTO `test` VALUES ('482', 'test');
INSERT INTO `test` VALUES ('483', 'test');
INSERT INTO `test` VALUES ('484', 'test');
INSERT INTO `test` VALUES ('485', 'test');
INSERT INTO `test` VALUES ('486', 'test');
INSERT INTO `test` VALUES ('487', 'test');
INSERT INTO `test` VALUES ('488', 'test');
INSERT INTO `test` VALUES ('489', 'test');
INSERT INTO `test` VALUES ('490', 'test');
INSERT INTO `test` VALUES ('491', 'test');
INSERT INTO `test` VALUES ('492', 'test');
INSERT INTO `test` VALUES ('493', 'test');
INSERT INTO `test` VALUES ('494', 'test');
INSERT INTO `test` VALUES ('495', 'test');
INSERT INTO `test` VALUES ('496', 'test');
INSERT INTO `test` VALUES ('497', 'test');
INSERT INTO `test` VALUES ('498', 'test');
INSERT INTO `test` VALUES ('499', 'test');
INSERT INTO `test` VALUES ('500', 'test');
INSERT INTO `test` VALUES ('501', 'test');
INSERT INTO `test` VALUES ('502', 'test');
INSERT INTO `test` VALUES ('503', 'test');
INSERT INTO `test` VALUES ('504', 'test');
INSERT INTO `test` VALUES ('505', 'test');
INSERT INTO `test` VALUES ('506', 'test');
INSERT INTO `test` VALUES ('507', 'test');
INSERT INTO `test` VALUES ('508', 'test');
INSERT INTO `test` VALUES ('509', 'test');
INSERT INTO `test` VALUES ('510', 'test');
INSERT INTO `test` VALUES ('511', 'test');
INSERT INTO `test` VALUES ('512', 'test');
INSERT INTO `test` VALUES ('513', 'test');
INSERT INTO `test` VALUES ('514', 'test');
INSERT INTO `test` VALUES ('515', 'test');
INSERT INTO `test` VALUES ('516', 'test');
INSERT INTO `test` VALUES ('517', 'test');
INSERT INTO `test` VALUES ('518', 'test');
INSERT INTO `test` VALUES ('519', 'test');
INSERT INTO `test` VALUES ('520', 'test');
INSERT INTO `test` VALUES ('521', 'test');
INSERT INTO `test` VALUES ('522', 'test');
INSERT INTO `test` VALUES ('523', 'test');
INSERT INTO `test` VALUES ('524', 'test');
INSERT INTO `test` VALUES ('525', 'test');
INSERT INTO `test` VALUES ('526', 'test');
INSERT INTO `test` VALUES ('527', 'test');
INSERT INTO `test` VALUES ('528', 'test');
INSERT INTO `test` VALUES ('529', 'test');
INSERT INTO `test` VALUES ('530', 'test');
INSERT INTO `test` VALUES ('531', 'test');
INSERT INTO `test` VALUES ('532', 'test');
INSERT INTO `test` VALUES ('533', 'test');
INSERT INTO `test` VALUES ('534', 'test');
INSERT INTO `test` VALUES ('535', 'test');
INSERT INTO `test` VALUES ('536', 'test');
INSERT INTO `test` VALUES ('537', 'test');
INSERT INTO `test` VALUES ('538', 'test');
INSERT INTO `test` VALUES ('539', 'test');
INSERT INTO `test` VALUES ('540', 'test');
INSERT INTO `test` VALUES ('541', 'test');
INSERT INTO `test` VALUES ('542', 'test');
INSERT INTO `test` VALUES ('543', 'test');
INSERT INTO `test` VALUES ('544', 'test');
INSERT INTO `test` VALUES ('545', 'test');
INSERT INTO `test` VALUES ('546', 'test');
INSERT INTO `test` VALUES ('547', 'test');
INSERT INTO `test` VALUES ('548', 'test');
INSERT INTO `test` VALUES ('549', 'test');
INSERT INTO `test` VALUES ('550', 'test');
INSERT INTO `test` VALUES ('551', 'test');
INSERT INTO `test` VALUES ('552', 'test');
INSERT INTO `test` VALUES ('553', 'test');
INSERT INTO `test` VALUES ('554', 'test');
INSERT INTO `test` VALUES ('555', 'test');
INSERT INTO `test` VALUES ('556', 'test');
INSERT INTO `test` VALUES ('557', 'test');
INSERT INTO `test` VALUES ('558', 'test');
INSERT INTO `test` VALUES ('559', 'test');
INSERT INTO `test` VALUES ('560', 'test');
INSERT INTO `test` VALUES ('561', 'test');
INSERT INTO `test` VALUES ('562', 'test');
INSERT INTO `test` VALUES ('563', 'test');
INSERT INTO `test` VALUES ('564', 'test');
INSERT INTO `test` VALUES ('565', 'test');
INSERT INTO `test` VALUES ('566', 'test');
INSERT INTO `test` VALUES ('567', 'test');
INSERT INTO `test` VALUES ('568', 'test');
INSERT INTO `test` VALUES ('569', 'test');
INSERT INTO `test` VALUES ('570', 'test');
INSERT INTO `test` VALUES ('571', 'test');
INSERT INTO `test` VALUES ('572', 'test');
INSERT INTO `test` VALUES ('573', 'test');
INSERT INTO `test` VALUES ('574', 'test');
INSERT INTO `test` VALUES ('575', 'test');
INSERT INTO `test` VALUES ('576', 'test');
INSERT INTO `test` VALUES ('577', 'test');
INSERT INTO `test` VALUES ('578', 'test');
INSERT INTO `test` VALUES ('579', 'test');
INSERT INTO `test` VALUES ('580', 'test');
INSERT INTO `test` VALUES ('581', 'test');
INSERT INTO `test` VALUES ('582', 'test');
INSERT INTO `test` VALUES ('583', 'test');
INSERT INTO `test` VALUES ('584', 'test');
INSERT INTO `test` VALUES ('585', 'test');
INSERT INTO `test` VALUES ('586', 'test');
INSERT INTO `test` VALUES ('587', 'test');
INSERT INTO `test` VALUES ('588', 'test');
INSERT INTO `test` VALUES ('589', 'test');
INSERT INTO `test` VALUES ('590', 'test');
INSERT INTO `test` VALUES ('591', 'test');
INSERT INTO `test` VALUES ('592', 'test');
INSERT INTO `test` VALUES ('593', 'test');
INSERT INTO `test` VALUES ('594', 'test');
INSERT INTO `test` VALUES ('595', 'test');
INSERT INTO `test` VALUES ('596', 'test');
INSERT INTO `test` VALUES ('597', 'test');
INSERT INTO `test` VALUES ('598', 'test');
INSERT INTO `test` VALUES ('599', 'test');
INSERT INTO `test` VALUES ('600', 'test');
INSERT INTO `test` VALUES ('601', 'test');
INSERT INTO `test` VALUES ('602', 'test');
INSERT INTO `test` VALUES ('603', 'test');
INSERT INTO `test` VALUES ('604', 'test');
INSERT INTO `test` VALUES ('605', 'test');
INSERT INTO `test` VALUES ('606', 'test');
INSERT INTO `test` VALUES ('607', 'test');
INSERT INTO `test` VALUES ('608', 'test');
INSERT INTO `test` VALUES ('609', 'test');
INSERT INTO `test` VALUES ('610', 'test');
INSERT INTO `test` VALUES ('611', 'test');
INSERT INTO `test` VALUES ('612', 'test');
INSERT INTO `test` VALUES ('613', 'test');
INSERT INTO `test` VALUES ('614', 'test');
INSERT INTO `test` VALUES ('615', 'test');
INSERT INTO `test` VALUES ('616', 'test');
INSERT INTO `test` VALUES ('617', 'test');
INSERT INTO `test` VALUES ('618', 'test');
INSERT INTO `test` VALUES ('619', 'test');
INSERT INTO `test` VALUES ('620', 'test');
INSERT INTO `test` VALUES ('621', 'test');
INSERT INTO `test` VALUES ('622', 'test');
INSERT INTO `test` VALUES ('623', 'test');
INSERT INTO `test` VALUES ('624', 'test');
INSERT INTO `test` VALUES ('625', 'test');
INSERT INTO `test` VALUES ('626', 'test');
INSERT INTO `test` VALUES ('627', 'test');
INSERT INTO `test` VALUES ('628', 'test');
INSERT INTO `test` VALUES ('629', 'test');
INSERT INTO `test` VALUES ('630', 'test');
INSERT INTO `test` VALUES ('631', 'test');
INSERT INTO `test` VALUES ('632', 'test');
INSERT INTO `test` VALUES ('633', 'test');
INSERT INTO `test` VALUES ('634', 'test');
INSERT INTO `test` VALUES ('635', 'test');
INSERT INTO `test` VALUES ('636', 'test');
INSERT INTO `test` VALUES ('637', 'test');
INSERT INTO `test` VALUES ('638', 'test');
INSERT INTO `test` VALUES ('639', 'test');
INSERT INTO `test` VALUES ('640', 'test');
INSERT INTO `test` VALUES ('641', 'test');
INSERT INTO `test` VALUES ('642', 'test');
INSERT INTO `test` VALUES ('643', 'test');
INSERT INTO `test` VALUES ('644', 'test');
INSERT INTO `test` VALUES ('645', 'test');
INSERT INTO `test` VALUES ('646', 'test');
INSERT INTO `test` VALUES ('647', 'test');
INSERT INTO `test` VALUES ('648', 'test');
INSERT INTO `test` VALUES ('649', 'test');
INSERT INTO `test` VALUES ('650', 'test');
INSERT INTO `test` VALUES ('651', 'test');
INSERT INTO `test` VALUES ('652', 'test');
INSERT INTO `test` VALUES ('653', 'test');
INSERT INTO `test` VALUES ('654', 'test');
INSERT INTO `test` VALUES ('655', 'test');
INSERT INTO `test` VALUES ('656', 'test');
INSERT INTO `test` VALUES ('657', 'test');
INSERT INTO `test` VALUES ('658', 'test');
INSERT INTO `test` VALUES ('659', 'test');
INSERT INTO `test` VALUES ('660', 'test');
INSERT INTO `test` VALUES ('661', 'test');
INSERT INTO `test` VALUES ('662', 'test');
INSERT INTO `test` VALUES ('663', 'test');
INSERT INTO `test` VALUES ('664', 'test');
INSERT INTO `test` VALUES ('665', 'test');
INSERT INTO `test` VALUES ('666', 'test');
INSERT INTO `test` VALUES ('667', 'test');
INSERT INTO `test` VALUES ('668', 'test');
INSERT INTO `test` VALUES ('669', 'test');
INSERT INTO `test` VALUES ('670', 'test');
INSERT INTO `test` VALUES ('671', 'test');
INSERT INTO `test` VALUES ('672', 'test');
INSERT INTO `test` VALUES ('673', 'test');
INSERT INTO `test` VALUES ('674', 'test');
INSERT INTO `test` VALUES ('675', 'test');
INSERT INTO `test` VALUES ('676', 'test');
INSERT INTO `test` VALUES ('677', 'test');
INSERT INTO `test` VALUES ('678', 'test');
INSERT INTO `test` VALUES ('679', 'test');
INSERT INTO `test` VALUES ('680', 'test');
INSERT INTO `test` VALUES ('681', 'test');
INSERT INTO `test` VALUES ('682', 'test');
INSERT INTO `test` VALUES ('683', 'test');
INSERT INTO `test` VALUES ('684', 'test');
INSERT INTO `test` VALUES ('685', 'test');
INSERT INTO `test` VALUES ('686', 'test');
INSERT INTO `test` VALUES ('687', 'test');
INSERT INTO `test` VALUES ('688', 'test');
INSERT INTO `test` VALUES ('689', 'test');
INSERT INTO `test` VALUES ('690', 'test');
INSERT INTO `test` VALUES ('691', 'test');
INSERT INTO `test` VALUES ('692', 'test');
INSERT INTO `test` VALUES ('693', 'test');
INSERT INTO `test` VALUES ('694', 'test');
INSERT INTO `test` VALUES ('695', 'test');
INSERT INTO `test` VALUES ('696', 'test');
INSERT INTO `test` VALUES ('697', 'test');
INSERT INTO `test` VALUES ('698', 'test');
INSERT INTO `test` VALUES ('699', 'test');
INSERT INTO `test` VALUES ('700', 'test');
INSERT INTO `test` VALUES ('701', 'test');
INSERT INTO `test` VALUES ('702', 'test');
INSERT INTO `test` VALUES ('703', 'test');
INSERT INTO `test` VALUES ('704', 'test');
INSERT INTO `test` VALUES ('705', 'test');
INSERT INTO `test` VALUES ('706', 'test');
INSERT INTO `test` VALUES ('707', 'test');
INSERT INTO `test` VALUES ('708', 'test');
INSERT INTO `test` VALUES ('709', 'test');
INSERT INTO `test` VALUES ('710', 'test');
INSERT INTO `test` VALUES ('711', 'test');
INSERT INTO `test` VALUES ('712', 'test');
INSERT INTO `test` VALUES ('713', 'test');
INSERT INTO `test` VALUES ('714', 'test');
INSERT INTO `test` VALUES ('715', 'test');
INSERT INTO `test` VALUES ('716', 'test');
INSERT INTO `test` VALUES ('717', 'test');
INSERT INTO `test` VALUES ('718', 'test');
INSERT INTO `test` VALUES ('719', 'test');
INSERT INTO `test` VALUES ('720', 'test');
INSERT INTO `test` VALUES ('721', 'test');
INSERT INTO `test` VALUES ('722', 'test');
INSERT INTO `test` VALUES ('723', 'test');
INSERT INTO `test` VALUES ('724', 'test');
INSERT INTO `test` VALUES ('725', 'test');
INSERT INTO `test` VALUES ('726', 'test');
INSERT INTO `test` VALUES ('727', 'test');
INSERT INTO `test` VALUES ('728', 'test');
INSERT INTO `test` VALUES ('729', 'test');
INSERT INTO `test` VALUES ('730', 'test');
INSERT INTO `test` VALUES ('731', 'test');
INSERT INTO `test` VALUES ('732', 'test');
INSERT INTO `test` VALUES ('733', 'test');
INSERT INTO `test` VALUES ('734', 'test');
INSERT INTO `test` VALUES ('735', 'test');
INSERT INTO `test` VALUES ('736', 'test');
INSERT INTO `test` VALUES ('737', 'test');
INSERT INTO `test` VALUES ('738', 'test');
INSERT INTO `test` VALUES ('739', 'test');
INSERT INTO `test` VALUES ('740', 'test');
INSERT INTO `test` VALUES ('741', 'test');
INSERT INTO `test` VALUES ('742', 'test');
INSERT INTO `test` VALUES ('743', 'test');
INSERT INTO `test` VALUES ('744', 'test');
INSERT INTO `test` VALUES ('745', 'test');
INSERT INTO `test` VALUES ('746', 'test');
INSERT INTO `test` VALUES ('747', 'test');
INSERT INTO `test` VALUES ('748', 'test');
INSERT INTO `test` VALUES ('749', 'test');
INSERT INTO `test` VALUES ('750', 'test');
INSERT INTO `test` VALUES ('751', 'test');
INSERT INTO `test` VALUES ('752', 'test');
INSERT INTO `test` VALUES ('753', 'test');
INSERT INTO `test` VALUES ('754', 'test');
INSERT INTO `test` VALUES ('755', 'test');
INSERT INTO `test` VALUES ('756', 'test');
INSERT INTO `test` VALUES ('757', 'test');
INSERT INTO `test` VALUES ('758', 'test');
INSERT INTO `test` VALUES ('759', 'test');
INSERT INTO `test` VALUES ('760', 'test');
INSERT INTO `test` VALUES ('761', 'test');
INSERT INTO `test` VALUES ('762', 'test');
INSERT INTO `test` VALUES ('763', 'test');
INSERT INTO `test` VALUES ('764', 'test');
INSERT INTO `test` VALUES ('765', 'test');
INSERT INTO `test` VALUES ('766', 'test');
INSERT INTO `test` VALUES ('767', 'test');
INSERT INTO `test` VALUES ('768', 'test');
INSERT INTO `test` VALUES ('769', 'test');
INSERT INTO `test` VALUES ('770', 'test');
INSERT INTO `test` VALUES ('771', 'test');
INSERT INTO `test` VALUES ('772', 'test');
INSERT INTO `test` VALUES ('773', 'test');
INSERT INTO `test` VALUES ('774', 'test');
INSERT INTO `test` VALUES ('775', 'test');
INSERT INTO `test` VALUES ('776', 'test');
INSERT INTO `test` VALUES ('777', 'test');
INSERT INTO `test` VALUES ('778', 'test');
INSERT INTO `test` VALUES ('779', 'test');
INSERT INTO `test` VALUES ('780', 'test');
INSERT INTO `test` VALUES ('781', 'test');
INSERT INTO `test` VALUES ('782', 'test');
INSERT INTO `test` VALUES ('783', 'test');
INSERT INTO `test` VALUES ('784', 'test');
INSERT INTO `test` VALUES ('785', 'test');
INSERT INTO `test` VALUES ('786', 'test');
INSERT INTO `test` VALUES ('787', 'test');
INSERT INTO `test` VALUES ('788', 'test');
INSERT INTO `test` VALUES ('789', 'test');
INSERT INTO `test` VALUES ('790', 'test');
INSERT INTO `test` VALUES ('791', 'test');
INSERT INTO `test` VALUES ('792', 'test');
INSERT INTO `test` VALUES ('793', 'test');
INSERT INTO `test` VALUES ('794', 'test');
INSERT INTO `test` VALUES ('795', 'test');
INSERT INTO `test` VALUES ('796', 'test');
INSERT INTO `test` VALUES ('797', 'test');
INSERT INTO `test` VALUES ('798', 'test');
INSERT INTO `test` VALUES ('799', 'test');
INSERT INTO `test` VALUES ('800', 'test');
INSERT INTO `test` VALUES ('801', 'test');
INSERT INTO `test` VALUES ('802', 'test');
INSERT INTO `test` VALUES ('803', 'test');
INSERT INTO `test` VALUES ('804', 'test');
INSERT INTO `test` VALUES ('805', 'test');
INSERT INTO `test` VALUES ('806', 'test');
INSERT INTO `test` VALUES ('807', 'test');
INSERT INTO `test` VALUES ('808', 'test');
INSERT INTO `test` VALUES ('809', 'test');
INSERT INTO `test` VALUES ('810', 'test');
INSERT INTO `test` VALUES ('811', 'test');
INSERT INTO `test` VALUES ('812', 'test');
INSERT INTO `test` VALUES ('813', 'test');
INSERT INTO `test` VALUES ('814', 'test');
INSERT INTO `test` VALUES ('815', 'test');
INSERT INTO `test` VALUES ('816', 'test');
INSERT INTO `test` VALUES ('817', 'test');
INSERT INTO `test` VALUES ('818', 'test');
INSERT INTO `test` VALUES ('819', 'test');
INSERT INTO `test` VALUES ('820', 'test');
INSERT INTO `test` VALUES ('821', 'test');
INSERT INTO `test` VALUES ('822', 'test');
INSERT INTO `test` VALUES ('823', 'test');
INSERT INTO `test` VALUES ('824', 'test');
INSERT INTO `test` VALUES ('825', 'test');
INSERT INTO `test` VALUES ('826', 'test');
INSERT INTO `test` VALUES ('827', 'test');
INSERT INTO `test` VALUES ('828', 'test');
INSERT INTO `test` VALUES ('829', 'test');
INSERT INTO `test` VALUES ('830', 'test');
INSERT INTO `test` VALUES ('831', 'test');
INSERT INTO `test` VALUES ('832', 'test');
INSERT INTO `test` VALUES ('833', 'test');
INSERT INTO `test` VALUES ('834', 'test');
INSERT INTO `test` VALUES ('835', 'test');
INSERT INTO `test` VALUES ('836', 'test');
INSERT INTO `test` VALUES ('837', 'test');
INSERT INTO `test` VALUES ('838', 'test');
INSERT INTO `test` VALUES ('839', 'test');
INSERT INTO `test` VALUES ('840', 'test');
INSERT INTO `test` VALUES ('841', 'test');
INSERT INTO `test` VALUES ('842', 'test');
INSERT INTO `test` VALUES ('843', 'test');
INSERT INTO `test` VALUES ('844', 'test');
INSERT INTO `test` VALUES ('845', 'test');
INSERT INTO `test` VALUES ('846', 'test');
INSERT INTO `test` VALUES ('847', 'test');
INSERT INTO `test` VALUES ('848', 'test');
INSERT INTO `test` VALUES ('849', 'test');
INSERT INTO `test` VALUES ('850', 'test');
INSERT INTO `test` VALUES ('851', 'test');
INSERT INTO `test` VALUES ('852', 'test');
INSERT INTO `test` VALUES ('853', 'test');
INSERT INTO `test` VALUES ('854', 'test');
INSERT INTO `test` VALUES ('855', 'test');
INSERT INTO `test` VALUES ('856', 'test');
INSERT INTO `test` VALUES ('857', 'test');
INSERT INTO `test` VALUES ('858', 'test');
INSERT INTO `test` VALUES ('859', 'test');
INSERT INTO `test` VALUES ('860', 'test');
INSERT INTO `test` VALUES ('861', 'test');
INSERT INTO `test` VALUES ('862', 'test');
INSERT INTO `test` VALUES ('863', 'test');
INSERT INTO `test` VALUES ('864', 'test');
INSERT INTO `test` VALUES ('865', 'test');
INSERT INTO `test` VALUES ('866', 'test');
INSERT INTO `test` VALUES ('867', 'test');
INSERT INTO `test` VALUES ('868', 'test');
INSERT INTO `test` VALUES ('869', 'test');
INSERT INTO `test` VALUES ('870', 'test');
INSERT INTO `test` VALUES ('871', 'test');
INSERT INTO `test` VALUES ('872', 'test');
INSERT INTO `test` VALUES ('873', 'test');
INSERT INTO `test` VALUES ('874', 'test');
INSERT INTO `test` VALUES ('875', 'test');
INSERT INTO `test` VALUES ('876', 'test');
INSERT INTO `test` VALUES ('877', 'test');
INSERT INTO `test` VALUES ('878', 'test');
INSERT INTO `test` VALUES ('879', 'test');
INSERT INTO `test` VALUES ('880', 'test');
INSERT INTO `test` VALUES ('881', 'test');
INSERT INTO `test` VALUES ('882', 'test');
INSERT INTO `test` VALUES ('883', 'test');
INSERT INTO `test` VALUES ('884', 'test');
INSERT INTO `test` VALUES ('885', 'test');
INSERT INTO `test` VALUES ('886', 'test');
INSERT INTO `test` VALUES ('887', 'test');
INSERT INTO `test` VALUES ('888', 'test');
INSERT INTO `test` VALUES ('889', 'test');
INSERT INTO `test` VALUES ('890', 'test');
INSERT INTO `test` VALUES ('891', 'test');
INSERT INTO `test` VALUES ('892', 'test');
INSERT INTO `test` VALUES ('893', 'test');
INSERT INTO `test` VALUES ('894', 'test');
INSERT INTO `test` VALUES ('895', 'test');
INSERT INTO `test` VALUES ('896', 'test');
INSERT INTO `test` VALUES ('897', 'test');
INSERT INTO `test` VALUES ('898', 'test');
INSERT INTO `test` VALUES ('899', 'test');
INSERT INTO `test` VALUES ('900', 'test');
INSERT INTO `test` VALUES ('901', 'test');
INSERT INTO `test` VALUES ('902', 'test');
INSERT INTO `test` VALUES ('903', 'test');
INSERT INTO `test` VALUES ('904', 'test');
INSERT INTO `test` VALUES ('905', 'test');
INSERT INTO `test` VALUES ('906', 'test');
INSERT INTO `test` VALUES ('907', 'test');
INSERT INTO `test` VALUES ('908', 'test');
INSERT INTO `test` VALUES ('909', 'test');
INSERT INTO `test` VALUES ('910', 'test');
INSERT INTO `test` VALUES ('911', 'test');
INSERT INTO `test` VALUES ('912', 'test');
INSERT INTO `test` VALUES ('913', 'test');
INSERT INTO `test` VALUES ('914', 'test');
INSERT INTO `test` VALUES ('915', 'test');
INSERT INTO `test` VALUES ('916', 'test');
INSERT INTO `test` VALUES ('917', 'test');
INSERT INTO `test` VALUES ('918', 'test');
INSERT INTO `test` VALUES ('919', 'test');
INSERT INTO `test` VALUES ('920', 'test');
INSERT INTO `test` VALUES ('921', 'test');
INSERT INTO `test` VALUES ('922', 'test');
INSERT INTO `test` VALUES ('923', 'test');
INSERT INTO `test` VALUES ('924', 'test');
INSERT INTO `test` VALUES ('925', 'test');
INSERT INTO `test` VALUES ('926', 'test');
INSERT INTO `test` VALUES ('927', 'test');
INSERT INTO `test` VALUES ('928', 'test');
INSERT INTO `test` VALUES ('929', 'test');
INSERT INTO `test` VALUES ('930', 'test');
INSERT INTO `test` VALUES ('931', 'test');
INSERT INTO `test` VALUES ('932', 'test');
INSERT INTO `test` VALUES ('933', 'test');
INSERT INTO `test` VALUES ('934', 'test');
INSERT INTO `test` VALUES ('935', 'test');
INSERT INTO `test` VALUES ('936', 'test');
INSERT INTO `test` VALUES ('937', 'test');
INSERT INTO `test` VALUES ('938', 'test');
INSERT INTO `test` VALUES ('939', 'test');
INSERT INTO `test` VALUES ('940', 'test');
INSERT INTO `test` VALUES ('941', 'test');
INSERT INTO `test` VALUES ('942', 'test');
INSERT INTO `test` VALUES ('943', 'test');
INSERT INTO `test` VALUES ('944', 'test');
INSERT INTO `test` VALUES ('945', 'test');
INSERT INTO `test` VALUES ('946', 'test');
INSERT INTO `test` VALUES ('947', 'test');
INSERT INTO `test` VALUES ('948', 'test');
INSERT INTO `test` VALUES ('949', 'test');
INSERT INTO `test` VALUES ('950', 'test');
INSERT INTO `test` VALUES ('951', 'test');
INSERT INTO `test` VALUES ('952', 'test');
INSERT INTO `test` VALUES ('953', 'test');
INSERT INTO `test` VALUES ('954', 'test');
INSERT INTO `test` VALUES ('955', 'test');
INSERT INTO `test` VALUES ('956', 'test');
INSERT INTO `test` VALUES ('957', 'test');
INSERT INTO `test` VALUES ('958', 'test');
INSERT INTO `test` VALUES ('959', 'test');
INSERT INTO `test` VALUES ('960', 'test');
INSERT INTO `test` VALUES ('961', 'test');
INSERT INTO `test` VALUES ('962', 'test');
INSERT INTO `test` VALUES ('963', 'test');
INSERT INTO `test` VALUES ('964', 'test');
INSERT INTO `test` VALUES ('965', 'test');
INSERT INTO `test` VALUES ('966', 'test');
INSERT INTO `test` VALUES ('967', 'test');
INSERT INTO `test` VALUES ('968', 'test');
INSERT INTO `test` VALUES ('969', 'test');
INSERT INTO `test` VALUES ('970', 'test');
INSERT INTO `test` VALUES ('971', 'test');
INSERT INTO `test` VALUES ('972', 'test');
INSERT INTO `test` VALUES ('973', 'test');
INSERT INTO `test` VALUES ('974', 'test');
INSERT INTO `test` VALUES ('975', 'test');
INSERT INTO `test` VALUES ('976', 'test');
INSERT INTO `test` VALUES ('977', 'test');
INSERT INTO `test` VALUES ('978', 'test');
INSERT INTO `test` VALUES ('979', 'test');
INSERT INTO `test` VALUES ('980', 'test');
INSERT INTO `test` VALUES ('981', 'test');
INSERT INTO `test` VALUES ('982', 'test');
INSERT INTO `test` VALUES ('983', 'test');
INSERT INTO `test` VALUES ('984', 'test');
INSERT INTO `test` VALUES ('985', 'test');
INSERT INTO `test` VALUES ('986', 'test');
INSERT INTO `test` VALUES ('987', 'test');
INSERT INTO `test` VALUES ('988', 'test');
INSERT INTO `test` VALUES ('989', 'test');
INSERT INTO `test` VALUES ('990', 'test');
INSERT INTO `test` VALUES ('991', 'test');
INSERT INTO `test` VALUES ('992', 'test');
INSERT INTO `test` VALUES ('993', 'test');
INSERT INTO `test` VALUES ('994', 'test');
INSERT INTO `test` VALUES ('995', 'test');
INSERT INTO `test` VALUES ('996', 'test');
INSERT INTO `test` VALUES ('997', 'test');
INSERT INTO `test` VALUES ('998', 'test');
INSERT INTO `test` VALUES ('999', 'test');
INSERT INTO `test` VALUES ('1000', 'test');
INSERT INTO `test` VALUES ('1001', 'test');
INSERT INTO `test` VALUES ('1002', 'test');
INSERT INTO `test` VALUES ('1003', 'test');
INSERT INTO `test` VALUES ('1004', 'test');
INSERT INTO `test` VALUES ('1005', 'test');
INSERT INTO `test` VALUES ('1006', 'test');
INSERT INTO `test` VALUES ('1007', 'test');
INSERT INTO `test` VALUES ('1008', 'test');
INSERT INTO `test` VALUES ('1009', 'test');
INSERT INTO `test` VALUES ('1010', 'test');
INSERT INTO `test` VALUES ('1011', 'test');
INSERT INTO `test` VALUES ('1012', 'test');
INSERT INTO `test` VALUES ('1013', 'test');
INSERT INTO `test` VALUES ('1014', 'test');
INSERT INTO `test` VALUES ('1015', 'test');
INSERT INTO `test` VALUES ('1016', 'test');
INSERT INTO `test` VALUES ('1017', 'test');
INSERT INTO `test` VALUES ('1018', 'test');
INSERT INTO `test` VALUES ('1019', 'test');
INSERT INTO `test` VALUES ('1020', 'test');
INSERT INTO `test` VALUES ('1021', 'test');
INSERT INTO `test` VALUES ('1022', 'test');
INSERT INTO `test` VALUES ('1023', 'test');
INSERT INTO `test` VALUES ('1024', 'test');
INSERT INTO `test` VALUES ('1025', 'test');
INSERT INTO `test` VALUES ('1026', 'test');
INSERT INTO `test` VALUES ('1027', 'test');
INSERT INTO `test` VALUES ('1028', 'test');
INSERT INTO `test` VALUES ('1029', 'test');
INSERT INTO `test` VALUES ('1030', 'test');
INSERT INTO `test` VALUES ('1031', 'test');
INSERT INTO `test` VALUES ('1032', 'test');
INSERT INTO `test` VALUES ('1033', 'test');
INSERT INTO `test` VALUES ('1034', 'test');
INSERT INTO `test` VALUES ('1035', 'test');
INSERT INTO `test` VALUES ('1036', 'test');
INSERT INTO `test` VALUES ('1037', 'test');
INSERT INTO `test` VALUES ('1038', 'test');
INSERT INTO `test` VALUES ('1039', 'test');
INSERT INTO `test` VALUES ('1040', 'test');
INSERT INTO `test` VALUES ('1041', 'test');
INSERT INTO `test` VALUES ('1042', 'test');
INSERT INTO `test` VALUES ('1043', 'test');
INSERT INTO `test` VALUES ('1044', 'test');
INSERT INTO `test` VALUES ('1045', 'test');
INSERT INTO `test` VALUES ('1046', 'test');
INSERT INTO `test` VALUES ('1047', 'test');
INSERT INTO `test` VALUES ('1048', 'test');
INSERT INTO `test` VALUES ('1049', 'test');
INSERT INTO `test` VALUES ('1050', 'test');
INSERT INTO `test` VALUES ('1051', 'test');
INSERT INTO `test` VALUES ('1052', 'test');
INSERT INTO `test` VALUES ('1053', 'test');
INSERT INTO `test` VALUES ('1054', 'test');
INSERT INTO `test` VALUES ('1055', 'test');
INSERT INTO `test` VALUES ('1056', 'test');
INSERT INTO `test` VALUES ('1057', 'test');
INSERT INTO `test` VALUES ('1058', 'test');
INSERT INTO `test` VALUES ('1059', 'test');
INSERT INTO `test` VALUES ('1060', 'test');
INSERT INTO `test` VALUES ('1061', 'test');
INSERT INTO `test` VALUES ('1062', 'test');
INSERT INTO `test` VALUES ('1063', 'test');
INSERT INTO `test` VALUES ('1064', 'test');
INSERT INTO `test` VALUES ('1065', 'test');
INSERT INTO `test` VALUES ('1066', 'test');
INSERT INTO `test` VALUES ('1067', 'test');
INSERT INTO `test` VALUES ('1068', 'test');
INSERT INTO `test` VALUES ('1069', 'test');
INSERT INTO `test` VALUES ('1070', 'test');
INSERT INTO `test` VALUES ('1071', 'test');
INSERT INTO `test` VALUES ('1072', 'test');
INSERT INTO `test` VALUES ('1073', 'test');
INSERT INTO `test` VALUES ('1074', 'test');
INSERT INTO `test` VALUES ('1075', 'test');
INSERT INTO `test` VALUES ('1076', 'test');
INSERT INTO `test` VALUES ('1077', 'test');
INSERT INTO `test` VALUES ('1078', 'test');
INSERT INTO `test` VALUES ('1079', 'test');
INSERT INTO `test` VALUES ('1080', 'test');
INSERT INTO `test` VALUES ('1081', 'test');
INSERT INTO `test` VALUES ('1082', 'test');
INSERT INTO `test` VALUES ('1083', 'test');
INSERT INTO `test` VALUES ('1084', 'test');
INSERT INTO `test` VALUES ('1085', 'test');
INSERT INTO `test` VALUES ('1086', 'test');
INSERT INTO `test` VALUES ('1087', 'test');
INSERT INTO `test` VALUES ('1088', 'test');
INSERT INTO `test` VALUES ('1089', 'test');
INSERT INTO `test` VALUES ('1090', 'test');
INSERT INTO `test` VALUES ('1091', 'test');
INSERT INTO `test` VALUES ('1092', 'test');
INSERT INTO `test` VALUES ('1093', 'test');
INSERT INTO `test` VALUES ('1094', 'test');
INSERT INTO `test` VALUES ('1095', 'test');
INSERT INTO `test` VALUES ('1096', 'test');
INSERT INTO `test` VALUES ('1097', 'test');
INSERT INTO `test` VALUES ('1098', 'test');
INSERT INTO `test` VALUES ('1099', 'test');
INSERT INTO `test` VALUES ('1100', 'test');
INSERT INTO `test` VALUES ('1101', 'test');
INSERT INTO `test` VALUES ('1102', 'test');
INSERT INTO `test` VALUES ('1103', 'test');
INSERT INTO `test` VALUES ('1104', 'test');
INSERT INTO `test` VALUES ('1105', 'test');
INSERT INTO `test` VALUES ('1106', 'test');
INSERT INTO `test` VALUES ('1107', 'test');
INSERT INTO `test` VALUES ('1108', 'test');
INSERT INTO `test` VALUES ('1109', 'test');
INSERT INTO `test` VALUES ('1110', 'test');
INSERT INTO `test` VALUES ('1111', 'test');
INSERT INTO `test` VALUES ('1112', 'test');
INSERT INTO `test` VALUES ('1113', 'test');
INSERT INTO `test` VALUES ('1114', 'test');
INSERT INTO `test` VALUES ('1115', 'test');
INSERT INTO `test` VALUES ('1116', 'test');
INSERT INTO `test` VALUES ('1117', 'test');
INSERT INTO `test` VALUES ('1118', 'test');
INSERT INTO `test` VALUES ('1119', 'test');
INSERT INTO `test` VALUES ('1120', 'test');
INSERT INTO `test` VALUES ('1121', 'test');
INSERT INTO `test` VALUES ('1122', 'test');
INSERT INTO `test` VALUES ('1123', 'test');
INSERT INTO `test` VALUES ('1124', 'test');
INSERT INTO `test` VALUES ('1125', 'test');
INSERT INTO `test` VALUES ('1126', 'test');
INSERT INTO `test` VALUES ('1127', 'test');
INSERT INTO `test` VALUES ('1128', 'test');
INSERT INTO `test` VALUES ('1129', 'test');
INSERT INTO `test` VALUES ('1130', 'test');
INSERT INTO `test` VALUES ('1131', 'test');
INSERT INTO `test` VALUES ('1132', 'test');
INSERT INTO `test` VALUES ('1133', 'test');
INSERT INTO `test` VALUES ('1134', 'test');
INSERT INTO `test` VALUES ('1135', 'test');
INSERT INTO `test` VALUES ('1136', 'test');
INSERT INTO `test` VALUES ('1137', 'test');
INSERT INTO `test` VALUES ('1138', 'test');
INSERT INTO `test` VALUES ('1139', 'test');
INSERT INTO `test` VALUES ('1140', 'test');
INSERT INTO `test` VALUES ('1141', 'test');
INSERT INTO `test` VALUES ('1142', 'test');
INSERT INTO `test` VALUES ('1143', 'test');
INSERT INTO `test` VALUES ('1144', 'test');
INSERT INTO `test` VALUES ('1145', 'test');
INSERT INTO `test` VALUES ('1146', 'test');
INSERT INTO `test` VALUES ('1147', 'test');
INSERT INTO `test` VALUES ('1148', 'test');
INSERT INTO `test` VALUES ('1149', 'test');
INSERT INTO `test` VALUES ('1150', 'test');
INSERT INTO `test` VALUES ('1151', 'test');
INSERT INTO `test` VALUES ('1152', 'test');
INSERT INTO `test` VALUES ('1153', 'test');
INSERT INTO `test` VALUES ('1154', 'test');
INSERT INTO `test` VALUES ('1155', 'test');
INSERT INTO `test` VALUES ('1156', 'test');
INSERT INTO `test` VALUES ('1157', 'test');
INSERT INTO `test` VALUES ('1158', 'test');
INSERT INTO `test` VALUES ('1159', 'test');
INSERT INTO `test` VALUES ('1160', 'test');
INSERT INTO `test` VALUES ('1161', 'test');
INSERT INTO `test` VALUES ('1162', 'test');
INSERT INTO `test` VALUES ('1163', 'test');
INSERT INTO `test` VALUES ('1164', 'test');
INSERT INTO `test` VALUES ('1165', 'test');
INSERT INTO `test` VALUES ('1166', 'test');
INSERT INTO `test` VALUES ('1167', 'test');
INSERT INTO `test` VALUES ('1168', 'test');
INSERT INTO `test` VALUES ('1169', 'test');
INSERT INTO `test` VALUES ('1170', 'test');
INSERT INTO `test` VALUES ('1171', 'test');
INSERT INTO `test` VALUES ('1172', 'test');
INSERT INTO `test` VALUES ('1173', 'test');
INSERT INTO `test` VALUES ('1174', 'test');
INSERT INTO `test` VALUES ('1175', 'test');
INSERT INTO `test` VALUES ('1176', 'test');
INSERT INTO `test` VALUES ('1177', 'test');
INSERT INTO `test` VALUES ('1178', 'test');
INSERT INTO `test` VALUES ('1179', 'test');
INSERT INTO `test` VALUES ('1180', 'test');
INSERT INTO `test` VALUES ('1181', 'test');
INSERT INTO `test` VALUES ('1182', 'test');
INSERT INTO `test` VALUES ('1183', 'test');
INSERT INTO `test` VALUES ('1184', 'test');
INSERT INTO `test` VALUES ('1185', 'test');
INSERT INTO `test` VALUES ('1186', 'test');
INSERT INTO `test` VALUES ('1187', 'test');
INSERT INTO `test` VALUES ('1188', 'test');
INSERT INTO `test` VALUES ('1189', 'test');
INSERT INTO `test` VALUES ('1190', 'test');
INSERT INTO `test` VALUES ('1191', 'test');
INSERT INTO `test` VALUES ('1192', 'test');
INSERT INTO `test` VALUES ('1193', 'test');
INSERT INTO `test` VALUES ('1194', 'test');
INSERT INTO `test` VALUES ('1195', 'test');
INSERT INTO `test` VALUES ('1196', 'test');
INSERT INTO `test` VALUES ('1197', 'test');
INSERT INTO `test` VALUES ('1198', 'test');
INSERT INTO `test` VALUES ('1199', 'test');
INSERT INTO `test` VALUES ('1200', 'test');
INSERT INTO `test` VALUES ('1201', 'test');
INSERT INTO `test` VALUES ('1202', 'test');
INSERT INTO `test` VALUES ('1203', 'test');
INSERT INTO `test` VALUES ('1204', 'test');
INSERT INTO `test` VALUES ('1205', 'test');
INSERT INTO `test` VALUES ('1206', 'test');
INSERT INTO `test` VALUES ('1207', 'test');
INSERT INTO `test` VALUES ('1208', 'test');
INSERT INTO `test` VALUES ('1209', 'test');
INSERT INTO `test` VALUES ('1210', 'test');
INSERT INTO `test` VALUES ('1211', 'test');
INSERT INTO `test` VALUES ('1212', 'test');
INSERT INTO `test` VALUES ('1213', 'test');
INSERT INTO `test` VALUES ('1214', 'test');
INSERT INTO `test` VALUES ('1215', 'test');
INSERT INTO `test` VALUES ('1216', 'test');
INSERT INTO `test` VALUES ('1217', 'test');
INSERT INTO `test` VALUES ('1218', 'test');
INSERT INTO `test` VALUES ('1219', 'test');
INSERT INTO `test` VALUES ('1220', 'test');
INSERT INTO `test` VALUES ('1221', 'test');
INSERT INTO `test` VALUES ('1222', 'test');
INSERT INTO `test` VALUES ('1223', 'test');
INSERT INTO `test` VALUES ('1224', 'test');
INSERT INTO `test` VALUES ('1225', 'test');
INSERT INTO `test` VALUES ('1226', 'test');
INSERT INTO `test` VALUES ('1227', 'test');
INSERT INTO `test` VALUES ('1228', 'test');
INSERT INTO `test` VALUES ('1229', 'test');
INSERT INTO `test` VALUES ('1230', 'test');
INSERT INTO `test` VALUES ('1231', 'test');
INSERT INTO `test` VALUES ('1232', 'test');
INSERT INTO `test` VALUES ('1233', 'test');
INSERT INTO `test` VALUES ('1234', 'test');
INSERT INTO `test` VALUES ('1235', 'test');
INSERT INTO `test` VALUES ('1236', 'test');
INSERT INTO `test` VALUES ('1237', 'test');
INSERT INTO `test` VALUES ('1238', 'test');
INSERT INTO `test` VALUES ('1239', 'test');
INSERT INTO `test` VALUES ('1240', 'test');
INSERT INTO `test` VALUES ('1241', 'test');
INSERT INTO `test` VALUES ('1242', 'test');
INSERT INTO `test` VALUES ('1243', 'test');
INSERT INTO `test` VALUES ('1244', 'test');
INSERT INTO `test` VALUES ('1245', 'test');
INSERT INTO `test` VALUES ('1246', 'test');
INSERT INTO `test` VALUES ('1247', 'test');
INSERT INTO `test` VALUES ('1248', 'test');
INSERT INTO `test` VALUES ('1249', 'test');
INSERT INTO `test` VALUES ('1250', 'test');
INSERT INTO `test` VALUES ('1251', 'test');
INSERT INTO `test` VALUES ('1252', 'test');
INSERT INTO `test` VALUES ('1253', 'test');
INSERT INTO `test` VALUES ('1254', 'test');
INSERT INTO `test` VALUES ('1255', 'test');
INSERT INTO `test` VALUES ('1256', 'test');
INSERT INTO `test` VALUES ('1257', 'test');
INSERT INTO `test` VALUES ('1258', 'test');
INSERT INTO `test` VALUES ('1259', 'test');
INSERT INTO `test` VALUES ('1260', 'test');
INSERT INTO `test` VALUES ('1261', 'test');
INSERT INTO `test` VALUES ('1262', 'test');
INSERT INTO `test` VALUES ('1263', 'test');
INSERT INTO `test` VALUES ('1264', 'test');
INSERT INTO `test` VALUES ('1265', 'test');
INSERT INTO `test` VALUES ('1266', 'test');
INSERT INTO `test` VALUES ('1267', 'test');
INSERT INTO `test` VALUES ('1268', 'test');
INSERT INTO `test` VALUES ('1269', 'test');
INSERT INTO `test` VALUES ('1270', 'test');
INSERT INTO `test` VALUES ('1271', 'test');
INSERT INTO `test` VALUES ('1272', 'test');
INSERT INTO `test` VALUES ('1273', 'test');
INSERT INTO `test` VALUES ('1274', 'test');
INSERT INTO `test` VALUES ('1275', 'test');
INSERT INTO `test` VALUES ('1276', 'test');
INSERT INTO `test` VALUES ('1277', 'test');
INSERT INTO `test` VALUES ('1278', 'test');
INSERT INTO `test` VALUES ('1279', 'test');
INSERT INTO `test` VALUES ('1280', 'test');
INSERT INTO `test` VALUES ('1281', 'test');
INSERT INTO `test` VALUES ('1282', 'test');
INSERT INTO `test` VALUES ('1283', 'test');
INSERT INTO `test` VALUES ('1284', 'test');
INSERT INTO `test` VALUES ('1285', 'test');
INSERT INTO `test` VALUES ('1286', 'test');
INSERT INTO `test` VALUES ('1287', 'test');
INSERT INTO `test` VALUES ('1288', 'test');
INSERT INTO `test` VALUES ('1289', 'test');
INSERT INTO `test` VALUES ('1290', 'test');
INSERT INTO `test` VALUES ('1291', 'test');
INSERT INTO `test` VALUES ('1292', 'test');
INSERT INTO `test` VALUES ('1293', 'test');
INSERT INTO `test` VALUES ('1294', 'test');
INSERT INTO `test` VALUES ('1295', 'test');
INSERT INTO `test` VALUES ('1296', 'test');
INSERT INTO `test` VALUES ('1297', 'test');
INSERT INTO `test` VALUES ('1298', 'test');
INSERT INTO `test` VALUES ('1299', 'test');
INSERT INTO `test` VALUES ('1300', 'test');
INSERT INTO `test` VALUES ('1301', 'test');
INSERT INTO `test` VALUES ('1302', 'test');
INSERT INTO `test` VALUES ('1303', 'test');
INSERT INTO `test` VALUES ('1304', 'test');
INSERT INTO `test` VALUES ('1305', 'test');
INSERT INTO `test` VALUES ('1306', 'test');
INSERT INTO `test` VALUES ('1307', 'test');
INSERT INTO `test` VALUES ('1308', 'test');
INSERT INTO `test` VALUES ('1309', 'test');
INSERT INTO `test` VALUES ('1310', 'test');
INSERT INTO `test` VALUES ('1311', 'test');
INSERT INTO `test` VALUES ('1312', 'test');
INSERT INTO `test` VALUES ('1313', 'test');
INSERT INTO `test` VALUES ('1314', 'test');
INSERT INTO `test` VALUES ('1315', 'test');
INSERT INTO `test` VALUES ('1316', 'test');
INSERT INTO `test` VALUES ('1317', 'test');
INSERT INTO `test` VALUES ('1318', 'test');
INSERT INTO `test` VALUES ('1319', 'test');
INSERT INTO `test` VALUES ('1320', 'test');
INSERT INTO `test` VALUES ('1321', 'test');
INSERT INTO `test` VALUES ('1322', 'test');
INSERT INTO `test` VALUES ('1323', 'test');
INSERT INTO `test` VALUES ('1324', 'test');
INSERT INTO `test` VALUES ('1325', 'test');
INSERT INTO `test` VALUES ('1326', 'test');
INSERT INTO `test` VALUES ('1327', 'test');
INSERT INTO `test` VALUES ('1328', 'test');
INSERT INTO `test` VALUES ('1329', 'test');
INSERT INTO `test` VALUES ('1330', 'test');
INSERT INTO `test` VALUES ('1331', 'test');
INSERT INTO `test` VALUES ('1332', 'test');
INSERT INTO `test` VALUES ('1333', 'test');
INSERT INTO `test` VALUES ('1334', 'test');
INSERT INTO `test` VALUES ('1335', 'test');
INSERT INTO `test` VALUES ('1336', 'test');
INSERT INTO `test` VALUES ('1337', 'test');
INSERT INTO `test` VALUES ('1338', 'test');
INSERT INTO `test` VALUES ('1339', 'test');
INSERT INTO `test` VALUES ('1340', 'test');
INSERT INTO `test` VALUES ('1341', 'test');
INSERT INTO `test` VALUES ('1342', 'test');
INSERT INTO `test` VALUES ('1343', 'test');
INSERT INTO `test` VALUES ('1344', 'test');
INSERT INTO `test` VALUES ('1345', 'test');
INSERT INTO `test` VALUES ('1346', 'test');
INSERT INTO `test` VALUES ('1347', 'test');
INSERT INTO `test` VALUES ('1348', 'test');
INSERT INTO `test` VALUES ('1349', 'test');
INSERT INTO `test` VALUES ('1350', 'test');
INSERT INTO `test` VALUES ('1351', 'test');
INSERT INTO `test` VALUES ('1352', 'test');
INSERT INTO `test` VALUES ('1353', 'test');
INSERT INTO `test` VALUES ('1354', 'test');
INSERT INTO `test` VALUES ('1355', 'test');
INSERT INTO `test` VALUES ('1356', 'test');
INSERT INTO `test` VALUES ('1357', 'test');
INSERT INTO `test` VALUES ('1358', 'test');
INSERT INTO `test` VALUES ('1359', 'test');
INSERT INTO `test` VALUES ('1360', 'test');
INSERT INTO `test` VALUES ('1361', 'test');
INSERT INTO `test` VALUES ('1362', 'test');
INSERT INTO `test` VALUES ('1363', 'test');
INSERT INTO `test` VALUES ('1364', 'test');
INSERT INTO `test` VALUES ('1365', 'test');
INSERT INTO `test` VALUES ('1366', 'test');
INSERT INTO `test` VALUES ('1367', 'test');
INSERT INTO `test` VALUES ('1368', 'test');
INSERT INTO `test` VALUES ('1369', 'test');
INSERT INTO `test` VALUES ('1370', 'test');
INSERT INTO `test` VALUES ('1371', 'test');
INSERT INTO `test` VALUES ('1372', 'test');
INSERT INTO `test` VALUES ('1373', 'test');
INSERT INTO `test` VALUES ('1374', 'test');
INSERT INTO `test` VALUES ('1375', 'test');
INSERT INTO `test` VALUES ('1376', 'test');
INSERT INTO `test` VALUES ('1377', 'test');
INSERT INTO `test` VALUES ('1378', 'test');
INSERT INTO `test` VALUES ('1379', 'test');
INSERT INTO `test` VALUES ('1380', 'test');
INSERT INTO `test` VALUES ('1381', 'test');
INSERT INTO `test` VALUES ('1382', 'test');
INSERT INTO `test` VALUES ('1383', 'test');
INSERT INTO `test` VALUES ('1384', 'test');
INSERT INTO `test` VALUES ('1385', 'test');
INSERT INTO `test` VALUES ('1386', 'test');
INSERT INTO `test` VALUES ('1387', 'test');
INSERT INTO `test` VALUES ('1388', 'test');
INSERT INTO `test` VALUES ('1389', 'test');
INSERT INTO `test` VALUES ('1390', 'test');
INSERT INTO `test` VALUES ('1391', 'test');
INSERT INTO `test` VALUES ('1392', 'test');
INSERT INTO `test` VALUES ('1393', 'test');
INSERT INTO `test` VALUES ('1394', 'test');
INSERT INTO `test` VALUES ('1395', 'test');
INSERT INTO `test` VALUES ('1396', 'test');
INSERT INTO `test` VALUES ('1397', 'test');
INSERT INTO `test` VALUES ('1398', 'test');
INSERT INTO `test` VALUES ('1399', 'test');
INSERT INTO `test` VALUES ('1400', 'test');
INSERT INTO `test` VALUES ('1401', 'test');
INSERT INTO `test` VALUES ('1402', 'test');
INSERT INTO `test` VALUES ('1403', 'test');
INSERT INTO `test` VALUES ('1404', 'test');
INSERT INTO `test` VALUES ('1405', 'test');
INSERT INTO `test` VALUES ('1406', 'test');
INSERT INTO `test` VALUES ('1407', 'test');
INSERT INTO `test` VALUES ('1408', 'test');
INSERT INTO `test` VALUES ('1409', 'test');
INSERT INTO `test` VALUES ('1410', 'test');
INSERT INTO `test` VALUES ('1411', 'test');
INSERT INTO `test` VALUES ('1412', 'test');
INSERT INTO `test` VALUES ('1413', 'test');
INSERT INTO `test` VALUES ('1414', 'test');
INSERT INTO `test` VALUES ('1415', 'test');
INSERT INTO `test` VALUES ('1416', 'test');
INSERT INTO `test` VALUES ('1417', 'test');
INSERT INTO `test` VALUES ('1418', 'test');
INSERT INTO `test` VALUES ('1419', 'test');
INSERT INTO `test` VALUES ('1420', 'test');
INSERT INTO `test` VALUES ('1421', 'test');
INSERT INTO `test` VALUES ('1422', 'test');
INSERT INTO `test` VALUES ('1423', 'test');
INSERT INTO `test` VALUES ('1424', 'test');
INSERT INTO `test` VALUES ('1425', 'test');
INSERT INTO `test` VALUES ('1426', 'test');
INSERT INTO `test` VALUES ('1427', 'test');
INSERT INTO `test` VALUES ('1428', 'test');
INSERT INTO `test` VALUES ('1429', 'test');
INSERT INTO `test` VALUES ('1430', 'test');
INSERT INTO `test` VALUES ('1431', 'test');
INSERT INTO `test` VALUES ('1432', 'test');
INSERT INTO `test` VALUES ('1433', 'test');
INSERT INTO `test` VALUES ('1434', 'test');
INSERT INTO `test` VALUES ('1435', 'test');
INSERT INTO `test` VALUES ('1436', 'test');
INSERT INTO `test` VALUES ('1437', 'test');
INSERT INTO `test` VALUES ('1438', 'test');
INSERT INTO `test` VALUES ('1439', 'test');
INSERT INTO `test` VALUES ('1440', 'test');
INSERT INTO `test` VALUES ('1441', 'test');
INSERT INTO `test` VALUES ('1442', 'test');
INSERT INTO `test` VALUES ('1443', 'test');
INSERT INTO `test` VALUES ('1444', 'test');
INSERT INTO `test` VALUES ('1445', 'test');
INSERT INTO `test` VALUES ('1446', 'test');
INSERT INTO `test` VALUES ('1447', 'test');
INSERT INTO `test` VALUES ('1448', 'test');
INSERT INTO `test` VALUES ('1449', 'test');
INSERT INTO `test` VALUES ('1450', 'test');
INSERT INTO `test` VALUES ('1451', 'test');
INSERT INTO `test` VALUES ('1452', 'test');
INSERT INTO `test` VALUES ('1453', 'test');
INSERT INTO `test` VALUES ('1454', 'test');
INSERT INTO `test` VALUES ('1455', 'test');
INSERT INTO `test` VALUES ('1456', 'test');
INSERT INTO `test` VALUES ('1457', 'test');
INSERT INTO `test` VALUES ('1458', 'test');
INSERT INTO `test` VALUES ('1459', 'test');
INSERT INTO `test` VALUES ('1460', 'test');
INSERT INTO `test` VALUES ('1461', 'test');
INSERT INTO `test` VALUES ('1462', 'test');
INSERT INTO `test` VALUES ('1463', 'test');
INSERT INTO `test` VALUES ('1464', 'test');
INSERT INTO `test` VALUES ('1465', 'test');
INSERT INTO `test` VALUES ('1466', 'test');
INSERT INTO `test` VALUES ('1467', 'test');
INSERT INTO `test` VALUES ('1468', 'test');
INSERT INTO `test` VALUES ('1469', 'test');
INSERT INTO `test` VALUES ('1470', 'test');
INSERT INTO `test` VALUES ('1471', 'test');
INSERT INTO `test` VALUES ('1472', 'test');
INSERT INTO `test` VALUES ('1473', 'test');
INSERT INTO `test` VALUES ('1474', 'test');
INSERT INTO `test` VALUES ('1475', 'test');
INSERT INTO `test` VALUES ('1476', 'test');
INSERT INTO `test` VALUES ('1477', 'test');
INSERT INTO `test` VALUES ('1478', 'test');
INSERT INTO `test` VALUES ('1479', 'test');
INSERT INTO `test` VALUES ('1480', 'test');
INSERT INTO `test` VALUES ('1481', 'test');
INSERT INTO `test` VALUES ('1482', 'test');
INSERT INTO `test` VALUES ('1483', 'test');
INSERT INTO `test` VALUES ('1484', 'test');
INSERT INTO `test` VALUES ('1485', 'test');
INSERT INTO `test` VALUES ('1486', 'test');
INSERT INTO `test` VALUES ('1487', 'test');
INSERT INTO `test` VALUES ('1488', 'test');
INSERT INTO `test` VALUES ('1489', 'test');
INSERT INTO `test` VALUES ('1490', 'test');
INSERT INTO `test` VALUES ('1491', 'test');
INSERT INTO `test` VALUES ('1492', 'test');
INSERT INTO `test` VALUES ('1493', 'test');
INSERT INTO `test` VALUES ('1494', 'test');
INSERT INTO `test` VALUES ('1495', 'test');
INSERT INTO `test` VALUES ('1496', 'test');
INSERT INTO `test` VALUES ('1497', 'test');
INSERT INTO `test` VALUES ('1498', 'test');
INSERT INTO `test` VALUES ('1499', 'test');
INSERT INTO `test` VALUES ('1500', 'test');
INSERT INTO `test` VALUES ('1501', 'test');
INSERT INTO `test` VALUES ('1502', 'test');
INSERT INTO `test` VALUES ('1503', 'test');
INSERT INTO `test` VALUES ('1504', 'test');
INSERT INTO `test` VALUES ('1505', 'test');
INSERT INTO `test` VALUES ('1506', 'test');
INSERT INTO `test` VALUES ('1507', 'test');
INSERT INTO `test` VALUES ('1508', 'test');
INSERT INTO `test` VALUES ('1509', 'test');
INSERT INTO `test` VALUES ('1510', 'test');
INSERT INTO `test` VALUES ('1511', 'test');
INSERT INTO `test` VALUES ('1512', 'test');
INSERT INTO `test` VALUES ('1513', 'test');
INSERT INTO `test` VALUES ('1514', 'test');
INSERT INTO `test` VALUES ('1515', 'test');
INSERT INTO `test` VALUES ('1516', 'test');
INSERT INTO `test` VALUES ('1517', 'test');
INSERT INTO `test` VALUES ('1518', 'test');
INSERT INTO `test` VALUES ('1519', 'test');
INSERT INTO `test` VALUES ('1520', 'test');
INSERT INTO `test` VALUES ('1521', 'test');
INSERT INTO `test` VALUES ('1522', 'test');
INSERT INTO `test` VALUES ('1523', 'test');
INSERT INTO `test` VALUES ('1524', 'test');
INSERT INTO `test` VALUES ('1525', 'test');
INSERT INTO `test` VALUES ('1526', 'test');
INSERT INTO `test` VALUES ('1527', 'test');
INSERT INTO `test` VALUES ('1528', 'test');
INSERT INTO `test` VALUES ('1529', 'test');
INSERT INTO `test` VALUES ('1530', 'test');
INSERT INTO `test` VALUES ('1531', 'test');
INSERT INTO `test` VALUES ('1532', 'test');
INSERT INTO `test` VALUES ('1533', 'test');
INSERT INTO `test` VALUES ('1534', 'test');
INSERT INTO `test` VALUES ('1535', 'test');
INSERT INTO `test` VALUES ('1536', 'test');
INSERT INTO `test` VALUES ('1537', 'test');
INSERT INTO `test` VALUES ('1538', 'test');
INSERT INTO `test` VALUES ('1539', 'test');
INSERT INTO `test` VALUES ('1540', 'test');
INSERT INTO `test` VALUES ('1541', 'test');
INSERT INTO `test` VALUES ('1542', 'test');
INSERT INTO `test` VALUES ('1543', 'test');
INSERT INTO `test` VALUES ('1544', 'test');
INSERT INTO `test` VALUES ('1545', 'test');
INSERT INTO `test` VALUES ('1546', 'test');
INSERT INTO `test` VALUES ('1547', 'test');
INSERT INTO `test` VALUES ('1548', 'test');
INSERT INTO `test` VALUES ('1549', 'test');
INSERT INTO `test` VALUES ('1550', 'test');
INSERT INTO `test` VALUES ('1551', 'test');
INSERT INTO `test` VALUES ('1552', 'test');
INSERT INTO `test` VALUES ('1553', 'test');
INSERT INTO `test` VALUES ('1554', 'test');
INSERT INTO `test` VALUES ('1555', 'test');
INSERT INTO `test` VALUES ('1556', 'test');
INSERT INTO `test` VALUES ('1557', 'test');
INSERT INTO `test` VALUES ('1558', 'test');
INSERT INTO `test` VALUES ('1559', 'test');
INSERT INTO `test` VALUES ('1560', 'test');
INSERT INTO `test` VALUES ('1561', 'test');
INSERT INTO `test` VALUES ('1562', 'test');
INSERT INTO `test` VALUES ('1563', 'test');
INSERT INTO `test` VALUES ('1564', 'test');
INSERT INTO `test` VALUES ('1565', 'test');
INSERT INTO `test` VALUES ('1566', 'test');
INSERT INTO `test` VALUES ('1567', 'test');
INSERT INTO `test` VALUES ('1568', 'test');
INSERT INTO `test` VALUES ('1569', 'test');
INSERT INTO `test` VALUES ('1570', 'test');
INSERT INTO `test` VALUES ('1571', 'test');
INSERT INTO `test` VALUES ('1572', 'test');
INSERT INTO `test` VALUES ('1573', 'test');
INSERT INTO `test` VALUES ('1574', 'test');
INSERT INTO `test` VALUES ('1575', 'test');
INSERT INTO `test` VALUES ('1576', 'test');
INSERT INTO `test` VALUES ('1577', 'test');
INSERT INTO `test` VALUES ('1578', 'test');
INSERT INTO `test` VALUES ('1579', 'test');
INSERT INTO `test` VALUES ('1580', 'test');
INSERT INTO `test` VALUES ('1581', 'test');
INSERT INTO `test` VALUES ('1582', 'test');
INSERT INTO `test` VALUES ('1583', 'test');
INSERT INTO `test` VALUES ('1584', 'test');
INSERT INTO `test` VALUES ('1585', 'test');
INSERT INTO `test` VALUES ('1586', 'test');
INSERT INTO `test` VALUES ('1587', 'test');
INSERT INTO `test` VALUES ('1588', 'test');
INSERT INTO `test` VALUES ('1589', 'test');
INSERT INTO `test` VALUES ('1590', 'test');
INSERT INTO `test` VALUES ('1591', 'test');
INSERT INTO `test` VALUES ('1592', 'test');
INSERT INTO `test` VALUES ('1593', 'test');
INSERT INTO `test` VALUES ('1594', 'test');
INSERT INTO `test` VALUES ('1595', 'test');
INSERT INTO `test` VALUES ('1596', 'test');
INSERT INTO `test` VALUES ('1597', 'test');
INSERT INTO `test` VALUES ('1598', 'test');
INSERT INTO `test` VALUES ('1599', 'test');
INSERT INTO `test` VALUES ('1600', 'test');
INSERT INTO `test` VALUES ('1601', 'test');
INSERT INTO `test` VALUES ('1602', 'test');
INSERT INTO `test` VALUES ('1603', 'test');
INSERT INTO `test` VALUES ('1604', 'test');
INSERT INTO `test` VALUES ('1605', 'test');
INSERT INTO `test` VALUES ('1606', 'test');
INSERT INTO `test` VALUES ('1607', 'test');
INSERT INTO `test` VALUES ('1608', 'test');
INSERT INTO `test` VALUES ('1609', 'test');
INSERT INTO `test` VALUES ('1610', 'test');
INSERT INTO `test` VALUES ('1611', 'test');
INSERT INTO `test` VALUES ('1612', 'test');
INSERT INTO `test` VALUES ('1613', 'test');
INSERT INTO `test` VALUES ('1614', 'test');
INSERT INTO `test` VALUES ('1615', 'test');
INSERT INTO `test` VALUES ('1616', 'test');
INSERT INTO `test` VALUES ('1617', 'test');
INSERT INTO `test` VALUES ('1618', 'test');
INSERT INTO `test` VALUES ('1619', 'test');
INSERT INTO `test` VALUES ('1620', 'test');
INSERT INTO `test` VALUES ('1621', 'test');
INSERT INTO `test` VALUES ('1622', 'test');
INSERT INTO `test` VALUES ('1623', 'test');
INSERT INTO `test` VALUES ('1624', 'test');
INSERT INTO `test` VALUES ('1625', 'test');
INSERT INTO `test` VALUES ('1626', 'test');
INSERT INTO `test` VALUES ('1627', 'test');
INSERT INTO `test` VALUES ('1628', 'test');
INSERT INTO `test` VALUES ('1629', 'test');
INSERT INTO `test` VALUES ('1630', 'test');
INSERT INTO `test` VALUES ('1631', 'test');
INSERT INTO `test` VALUES ('1632', 'test');
INSERT INTO `test` VALUES ('1633', 'test');
INSERT INTO `test` VALUES ('1634', 'test');
INSERT INTO `test` VALUES ('1635', 'test');
INSERT INTO `test` VALUES ('1636', 'test');
INSERT INTO `test` VALUES ('1637', 'test');
INSERT INTO `test` VALUES ('1638', 'test');
INSERT INTO `test` VALUES ('1639', 'test');
INSERT INTO `test` VALUES ('1640', 'test');
INSERT INTO `test` VALUES ('1641', 'test');
INSERT INTO `test` VALUES ('1642', 'test');
INSERT INTO `test` VALUES ('1643', 'test');
INSERT INTO `test` VALUES ('1644', 'test');
INSERT INTO `test` VALUES ('1645', 'test');
INSERT INTO `test` VALUES ('1646', 'test');
INSERT INTO `test` VALUES ('1647', 'test');
INSERT INTO `test` VALUES ('1648', 'test');
INSERT INTO `test` VALUES ('1649', 'test');
INSERT INTO `test` VALUES ('1650', 'test');
INSERT INTO `test` VALUES ('1651', 'test');
INSERT INTO `test` VALUES ('1652', 'test');
INSERT INTO `test` VALUES ('1653', 'test');
INSERT INTO `test` VALUES ('1654', 'test');
INSERT INTO `test` VALUES ('1655', 'test');
INSERT INTO `test` VALUES ('1656', 'test');
INSERT INTO `test` VALUES ('1657', 'test');
INSERT INTO `test` VALUES ('1658', 'test');
INSERT INTO `test` VALUES ('1659', 'test');
INSERT INTO `test` VALUES ('1660', 'test');
INSERT INTO `test` VALUES ('1661', 'test');
INSERT INTO `test` VALUES ('1662', 'test');
INSERT INTO `test` VALUES ('1663', 'test');
INSERT INTO `test` VALUES ('1664', 'test');
INSERT INTO `test` VALUES ('1665', 'test');
INSERT INTO `test` VALUES ('1666', 'test');
INSERT INTO `test` VALUES ('1667', 'test');
INSERT INTO `test` VALUES ('1668', 'test');
INSERT INTO `test` VALUES ('1669', 'test');
INSERT INTO `test` VALUES ('1670', 'test');
INSERT INTO `test` VALUES ('1671', 'test');
INSERT INTO `test` VALUES ('1672', 'test');
INSERT INTO `test` VALUES ('1673', 'test');
INSERT INTO `test` VALUES ('1674', 'test');
INSERT INTO `test` VALUES ('1675', 'test');
INSERT INTO `test` VALUES ('1676', 'test');
INSERT INTO `test` VALUES ('1677', 'test');
INSERT INTO `test` VALUES ('1678', 'test');
INSERT INTO `test` VALUES ('1679', 'test');
INSERT INTO `test` VALUES ('1680', 'test');
INSERT INTO `test` VALUES ('1681', 'test');
INSERT INTO `test` VALUES ('1682', 'test');
INSERT INTO `test` VALUES ('1683', 'test');
INSERT INTO `test` VALUES ('1684', 'test');
INSERT INTO `test` VALUES ('1685', 'test');
INSERT INTO `test` VALUES ('1686', 'test');
INSERT INTO `test` VALUES ('1687', 'test');
INSERT INTO `test` VALUES ('1688', 'test');
INSERT INTO `test` VALUES ('1689', 'test');
INSERT INTO `test` VALUES ('1690', 'test');
INSERT INTO `test` VALUES ('1691', 'test');
INSERT INTO `test` VALUES ('1692', 'test');
INSERT INTO `test` VALUES ('1693', 'test');
INSERT INTO `test` VALUES ('1694', 'test');
INSERT INTO `test` VALUES ('1695', 'test');
INSERT INTO `test` VALUES ('1696', 'test');
INSERT INTO `test` VALUES ('1697', 'test');
INSERT INTO `test` VALUES ('1698', 'test');
INSERT INTO `test` VALUES ('1699', 'test');
INSERT INTO `test` VALUES ('1700', 'test');
INSERT INTO `test` VALUES ('1701', 'test');
INSERT INTO `test` VALUES ('1702', 'test');
INSERT INTO `test` VALUES ('1703', 'test');
INSERT INTO `test` VALUES ('1704', 'test');

-- ----------------------------
-- Table structure for `webmaster_apply_ads`
-- ----------------------------
DROP TABLE IF EXISTS `webmaster_apply_ads`;
CREATE TABLE `webmaster_apply_ads` (
  `webmaster_ads_id` int(5) NOT NULL AUTO_INCREMENT,
  `webmaster_id` int(8) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ads_type` int(5) NOT NULL COMMENT '广告类型',
  `ads_count_type` int(5) NOT NULL COMMENT '计费类型',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0审核中1已审核2审核没通过',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`webmaster_ads_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webmaster_apply_ads
-- ----------------------------
INSERT INTO `webmaster_apply_ads` VALUES ('1', '2', '测试广告位1', '5', '9', '1', '2018-12-11 14:45:19', '2018-12-11 14:45:19');
INSERT INTO `webmaster_apply_ads` VALUES ('2', '2', '测试广告位2', '5', '7', '1', '2018-12-11 14:47:48', '2018-12-11 14:47:48');

-- ----------------------------
-- Table structure for `website_earn`
-- ----------------------------
DROP TABLE IF EXISTS `website_earn`;
CREATE TABLE `website_earn` (
  `id` int(11) NOT NULL,
  `earn` decimal(10,4) NOT NULL COMMENT '当天赚',
  `total_earn` decimal(10,4) NOT NULL COMMENT '总共赚'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_earn
-- ----------------------------

-- ----------------------------
-- Table structure for `websites`
-- ----------------------------
DROP TABLE IF EXISTS `websites`;
CREATE TABLE `websites` (
  `web_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) DEFAULT NULL,
  `web_name` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `icp` varchar(50) DEFAULT NULL,
  `webtype` int(5) DEFAULT '1' COMMENT '0:视频站 1:普通站',
  `status` tinyint(1) DEFAULT '1' COMMENT '0:审核中 1:通过审核 2:没有通过审核',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`web_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of websites
-- ----------------------------
INSERT INTO `websites` VALUES ('2', '2', '发达大网', 'http://www.baidu.com', '41561', '72', '0', '2018-12-11 12:48:32', '2018-12-11 12:48:32');

-- ----------------------------
-- Table structure for `withdraw_info`
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_info`;
CREATE TABLE `withdraw_info` (
  `withdraw_info_id` int(5) NOT NULL AUTO_INCREMENT,
  `webmember_id` int(8) NOT NULL,
  `bank_id` int(3) NOT NULL,
  `bank_branch` varchar(200) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `bank_number` varchar(50) NOT NULL,
  `province_id` int(3) NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常 2删除',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`withdraw_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdraw_info
-- ----------------------------
INSERT INTO `withdraw_info` VALUES ('1', '2', '1', '的说法是对方受到福斯的方式地方', '柘城在', '234234234', '15', '1', '2018-12-11 20:28:58', '2018-12-11 20:27:58');

-- ----------------------------
-- Table structure for `withdraw_order`
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_order`;
CREATE TABLE `withdraw_order` (
  `withdraw_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL,
  `withdraw_info_id` int(5) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `money` decimal(16,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未处理 1:处理成功 2:提款不通过',
  `remark` varchar(255) DEFAULT NULL,
  `apply_withdraw_ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`withdraw_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdraw_order
-- ----------------------------
INSERT INTO `withdraw_order` VALUES ('2', '2', '1', '154452709613', '100.00', '0', null, '127.0.0.1', '2018-12-11 19:18:16', '2018-12-11 19:18:16');
