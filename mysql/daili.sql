/*
Navicat MySQL Data Transfer

Source Server         : localmysql
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : daili

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-14 19:45:27
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
INSERT INTO `admin` VALUES ('1', 'admin', 'eyJpdiI6Ink0S0tEemtWN2RzTDhpXC9cLzNlRk5Idz09IiwidmFsdWUiOiJnU1RsK1BpMmtKemlXc2VsUzAyb2xBPT0iLCJtYWMiOiJjMTFiM2RjOTNmYmU3ZjQ4OWM5M2ZhZDgxOTVlNzkyOTNmMmRkNjk5MjMwNzU2NDE0YmRiZDRkYjNhYWI2ZjZlIn0=', '1', '127.0.0.1', '2018-07-09 13:41:55', '2018-09-14 12:22:22', '2018-09-14 12:22:22');
INSERT INTO `admin` VALUES ('2', 'admin11', 'eyJpdiI6IlZBY1wvRXdlM3l3QVp2c0RnK1FqbUZBPT0iLCJ2YWx1ZSI6ImxuRmpMWEtcL0pyajVGK1dxZmRLcDlnPT0iLCJtYWMiOiI2MzViNTJhZjc3ZDQzOTAwNjE5ZTgzMzU4MDM0NjdiYzE0Y2RmMWM3YjUyY2I3MGU3Njc4NGY0M2JmM2EyZjZkIn0=', '0', '127.0.0.1', '2018-07-09 13:41:55', '2018-08-18 18:32:24', '2018-08-31 16:00:49');
INSERT INTO `admin` VALUES ('3', 'admin2', 'eyJpdiI6IlZBY1wvRXdlM3l3QVp2c0RnK1FqbUZBPT0iLCJ2YWx1ZSI6ImxuRmpMWEtcL0pyajVGK1dxZmRLcDlnPT0iLCJtYWMiOiI2MzViNTJhZjc3ZDQzOTAwNjE5ZTgzMzU4MDM0NjdiYzE0Y2RmMWM3YjUyY2I3MGU3Njc4NGY0M2JmM2EyZjZkIn0=', '1', '127.0.0.1', '2018-07-09 13:41:55', '2018-08-18 18:29:04', '2018-08-18 18:29:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deposit
-- ----------------------------
INSERT INTO `deposit` VALUES ('1', '1', '1613216511', '130.00', '1', '1', '1', '159628456132', '赵子龙', '127.0.0.1', '2018-09-14 16:54:57', '2018-09-14 16:54:57');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `member_id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:广告主 2:站长',
  `qq` varchar(50) DEFAULT NULL,
  `balance` decimal(16,2) NOT NULL DEFAULT '0.00',
  `frozen` decimal(16,2) NOT NULL DEFAULT '0.00',
  `personal_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '这个字段只针对站长',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:冻结 1:正常',
  `login_ip` varchar(50) NOT NULL,
  `lastlogined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'adsmember', 'eyJpdiI6Ijd2WVpuOUN4YkNzQ3hQbEpBZmx1bUE9PSIsInZhbHVlIjoiNHNvNm1hZkVSaHVkTTlaYTA3RHh4Zz09IiwibWFjIjoiOWYzMmZiY2JkNjEzZTM5OWU0Mjk4MjFmM2EzYWRlN2IyNmVkZmIzNjZkMWRhZTFiNmMwN2NlNjcyYTM1NTU2ZiJ9', '1', '123213', '540.00', '0.00', '0.00', '1', '127.0.0.1', '2018-09-14 16:54:57', '2018-09-13 15:55:52', '2018-09-14 16:54:57');
INSERT INTO `member` VALUES ('2', 'sitemember', '12312321', '2', '666666', '1000.00', '0.00', '0.12', '1', '127.0.0.1', '2018-09-14 19:12:26', '2018-09-13 18:12:40', '2018-09-14 19:12:26');

-- ----------------------------
-- Table structure for `paytype`
-- ----------------------------
DROP TABLE IF EXISTS `paytype`;
CREATE TABLE `paytype` (
  `paytype_id` int(3) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paytype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paytype
-- ----------------------------
INSERT INTO `paytype` VALUES ('1', '支付宝', '1');
INSERT INTO `paytype` VALUES ('2', '微信', '1');
INSERT INTO `paytype` VALUES ('3', '银行转帐', '1');

-- ----------------------------
-- Table structure for `staticset`
-- ----------------------------
DROP TABLE IF EXISTS `staticset`;
CREATE TABLE `staticset` (
  `set_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `value` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`set_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staticset
-- ----------------------------
INSERT INTO `staticset` VALUES ('1', 'CommissionRate', '佣金比例', '10%', '1', '2018-09-13 13:46:06', '2018-09-13 13:46:06');
INSERT INTO `staticset` VALUES ('2', 'DeductionRate', '全站扣量比例(站长单独设置这个不work)', '15%', '1', '2018-09-13 14:29:23', '2018-09-13 14:29:23');
INSERT INTO `staticset` VALUES ('3', 'MinDeposit', '广告商最少存款', '100', '1', '2018-09-14 14:26:15', '2018-09-14 14:26:15');
INSERT INTO `staticset` VALUES ('4', 'MinWithdraw', '站长最小提款数', '100', '1', '2018-09-14 14:26:58', '2018-09-14 14:26:58');

-- ----------------------------
-- Table structure for `withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `withdraw`;
CREATE TABLE `withdraw` (
  `withdraw_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `money` decimal(16,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未处理 1:处理成功 2:关闭订单',
  `remark` varchar(255) DEFAULT NULL,
  `paytype_id` int(3) NOT NULL,
  `withdraw_account` varchar(255) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `apply_withdraw_ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`withdraw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdraw
-- ----------------------------
INSERT INTO `withdraw` VALUES ('1', '2', '123241961', '120.00', '1', '1', '1', '1583561651', '张飞', '127.0.0.1', '2018-09-14 19:12:26', '2018-09-14 19:12:26');
