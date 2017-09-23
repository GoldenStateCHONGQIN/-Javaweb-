/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : d607_yinghang

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-10-24 20:29:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_apply`
-- ----------------------------
DROP TABLE IF EXISTS `t_apply`;
CREATE TABLE `t_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `checkStatus` varchar(255) DEFAULT NULL,
  `dicard` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `idtype` varchar(255) DEFAULT NULL,
  `marrage` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `workAddress` varchar(255) DEFAULT NULL,
  `workCompany` varchar(255) DEFAULT NULL,
  `yearIncome` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `dicard` (`dicard`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_apply
-- ----------------------------
INSERT INTO `t_apply` VALUES ('1', '2016-10-21', '321', '312321', '审核通过', '12321', '321', '213', '男', '大幅的', '已婚', '订单', '3123', '3123', '12312', '312321');
INSERT INTO `t_apply` VALUES ('2', '2016-10-21', '1', '2222', '审核通过', '123456', '1', '1', '男', 'eee', '已婚', 'eee', '1', '1', '1', '111');
INSERT INTO `t_apply` VALUES ('3', '2016-10-22', '31', '1985-01-01', '审核通过', '1111111111', '3', '3123', '男', '身份证', '已婚', '张三', '123456789', '123', '12312', '31111');
INSERT INTO `t_apply` VALUES ('4', '2016-10-24', '1', '1', '审核通过', '147', '1', '1', '男', '身份证', '已婚', '娃娃', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `t_bank`
-- ----------------------------
DROP TABLE IF EXISTS `t_bank`;
CREATE TABLE `t_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bank
-- ----------------------------
INSERT INTO `t_bank` VALUES ('1', '工商银行');
INSERT INTO `t_bank` VALUES ('2', '建设银行');

-- ----------------------------
-- Table structure for `t_card`
-- ----------------------------
DROP TABLE IF EXISTS `t_card`;
CREATE TABLE `t_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `points` int(11) NOT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `apply_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cardStatus` varchar(255) DEFAULT NULL,
  `credits` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKCB5B5BFBAC1FE5A8` (`user_id`),
  KEY `FKCB5B5BFBEB334721` (`apply_id`),
  CONSTRAINT `FKCB5B5BFBEB334721` FOREIGN KEY (`apply_id`) REFERENCES `t_apply` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKCB5B5BFBAC1FE5A8` FOREIGN KEY (`user_id`) REFERENCES `t_simple_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_card
-- ----------------------------
INSERT INTO `t_card` VALUES ('1', '109', '111111', '0', '1477016909941', '信用卡', '1', '2', '注销', '100');
INSERT INTO `t_card` VALUES ('3', '880', '111111', '0', '1477056090005', '信用卡', '2', '4', '正常', '0');
INSERT INTO `t_card` VALUES ('4', '50', '111111', '0', '1477094371240', '信用卡', '3', '5', '注销', '5000');
INSERT INTO `t_card` VALUES ('5', '-2200', '111111', '130', '1477297207205', '信用卡', '4', '6', '正常', '5000');
INSERT INTO `t_card` VALUES ('6', '630', '111111', '0', '51477299206237', '银行卡', '4', '6', '正常', '0');

-- ----------------------------
-- Table structure for `t_card_flow`
-- ----------------------------
DROP TABLE IF EXISTS `t_card_flow`;
CREATE TABLE `t_card_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1040A2F2A23582B3` (`card_id`),
  CONSTRAINT `FK1040A2F2A23582B3` FOREIGN KEY (`card_id`) REFERENCES `t_card` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_card_flow
-- ----------------------------
INSERT INTO `t_card_flow` VALUES ('1', '2016-10-21 13:54:20', '100', '存款', '存入', '1');
INSERT INTO `t_card_flow` VALUES ('2', '2016-10-21 13:54:35', '1', '存款', '存入', '1');
INSERT INTO `t_card_flow` VALUES ('3', '2016-10-21 13:55:00', '20', '存款', '存入', '1');
INSERT INTO `t_card_flow` VALUES ('4', '2016-10-21 13:55:00', '20', '自动还款', '转出', '1');
INSERT INTO `t_card_flow` VALUES ('5', '2016-10-21 13:55:18', '100', '存款', '存入', '1');
INSERT INTO `t_card_flow` VALUES ('6', '2016-10-21 13:55:18', '80', '自动还款', '转出', '1');
INSERT INTO `t_card_flow` VALUES ('7', '2016-10-21 21:27:10', '1000', '存款', '存入', '3');
INSERT INTO `t_card_flow` VALUES ('8', '2016-10-22 08:00:17', '100', '存款', '存入', '4');
INSERT INTO `t_card_flow` VALUES ('9', '2016-10-24 16:57:00', '100', '存款', '存入', '5');
INSERT INTO `t_card_flow` VALUES ('10', '2016-10-24 17:12:57', '1000', '存款', '存入', '6');
INSERT INTO `t_card_flow` VALUES ('11', '2016-10-24 20:10:21', '100', '存款', '存入', '6');
INSERT INTO `t_card_flow` VALUES ('12', '2016-10-24 20:10:35', '100', '存款', '存入', '6');

-- ----------------------------
-- Table structure for `t_insurance`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance`;
CREATE TABLE `t_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `endDate` varchar(255) DEFAULT NULL,
  `idcard1` varchar(255) DEFAULT NULL,
  `idcard2` varchar(255) DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL,
  `name2` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `startDate` varchar(255) DEFAULT NULL,
  `insurance_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK233CA0CF5EDCFE36` (`insurance_type_id`),
  CONSTRAINT `FK233CA0CF5EDCFE36` FOREIGN KEY (`insurance_type_id`) REFERENCES `t_insurance_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_insurance
-- ----------------------------
INSERT INTO `t_insurance` VALUES ('2', null, '2020-10-13', '12321', '12321', '订单', '订单', 'BX000002', '2016-10-11', '1');
INSERT INTO `t_insurance` VALUES ('3', null, '2016-11-03', '3213', '3213', '321', '312', 'BX000003', '2016-09-27', '1');

-- ----------------------------
-- Table structure for `t_insurance_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_insurance_type`;
CREATE TABLE `t_insurance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baofei` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `peifu` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_insurance_type
-- ----------------------------
INSERT INTO `t_insurance_type` VALUES ('1', '500', '人身保险', '', '10000');
INSERT INTO `t_insurance_type` VALUES ('2', '1500', '车险', '', '200000');
INSERT INTO `t_insurance_type` VALUES ('3', '15000', '出轨险', '', '2000000');
INSERT INTO `t_insurance_type` VALUES ('4', '15000', '小三险', '', '2000000');

-- ----------------------------
-- Table structure for `t_loan_flow`
-- ----------------------------
DROP TABLE IF EXISTS `t_loan_flow`;
CREATE TABLE `t_loan_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `checked` bit(1) NOT NULL,
  `money` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK82BF8512A23582B3` (`card_id`),
  CONSTRAINT `FK82BF8512A23582B3` FOREIGN KEY (`card_id`) REFERENCES `t_card` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loan_flow
-- ----------------------------
INSERT INTO `t_loan_flow` VALUES ('1', '2016-10-21', '', '1000', '贷款', '1');
INSERT INTO `t_loan_flow` VALUES ('2', '2016-10-21', '', '100', '还款', '1');
INSERT INTO `t_loan_flow` VALUES ('3', '2016-10-22', '', '500', '贷款', '4');
INSERT INTO `t_loan_flow` VALUES ('4', '2016-10-22', '', '100', '还款', '4');
INSERT INTO `t_loan_flow` VALUES ('5', '2016-10-24', '', '1000', '贷款', '5');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `content` longtext,
  `newsType` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '2016-10-21', 'gfdfffffffffffffff<img src=\"http://localhost:8080/yh/resource/1477041178632jpg\" height=\"111\" width=\"111\" alt=\"\" />f', '业务信息', 'dfgfdgdfgd');
INSERT INTO `t_news` VALUES ('2', '2016-10-22', '<p>地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶</p><p><img src=\"http://localhost:8080/yh/resource/1477094755781jpg\" height=\"111\" width=\"111\" alt=\"\" /><br /></p>', '业务信息', '地方顶顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶');

-- ----------------------------
-- Table structure for `t_payment`
-- ----------------------------
DROP TABLE IF EXISTS `t_payment`;
CREATE TABLE `t_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payment
-- ----------------------------
INSERT INTO `t_payment` VALUES ('1', '水费');
INSERT INTO `t_payment` VALUES ('4', '物业费');
INSERT INTO `t_payment` VALUES ('2', '电费');
INSERT INTO `t_payment` VALUES ('3', '网费');

-- ----------------------------
-- Table structure for `t_payment_flow`
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_flow`;
CREATE TABLE `t_payment_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `card_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKBD79A1B246B53261` (`payment_id`),
  KEY `FKBD79A1B2A23582B3` (`card_id`),
  CONSTRAINT `FKBD79A1B2A23582B3` FOREIGN KEY (`card_id`) REFERENCES `t_card` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKBD79A1B246B53261` FOREIGN KEY (`payment_id`) REFERENCES `t_payment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payment_flow
-- ----------------------------
INSERT INTO `t_payment_flow` VALUES ('1', '2016-10-21', '11', '1', '1');
INSERT INTO `t_payment_flow` VALUES ('2', '2016-10-21', '11', '1', '1');
INSERT INTO `t_payment_flow` VALUES ('3', '2016-10-22', '20', '4', '1');
INSERT INTO `t_payment_flow` VALUES ('4', '2016-10-24', '20', '6', '1');

-- ----------------------------
-- Table structure for `t_simple_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_simple_user`;
CREATE TABLE `t_simple_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK99BA02ED78313856` (`userID`),
  CONSTRAINT `FK99BA02ED78313856` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_simple_user
-- ----------------------------
INSERT INTO `t_simple_user` VALUES ('2', '3');
INSERT INTO `t_simple_user` VALUES ('4', '5');
INSERT INTO `t_simple_user` VALUES ('5', '6');
INSERT INTO `t_simple_user` VALUES ('6', '7');

-- ----------------------------
-- Table structure for `t_sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `t_sysuser`;
CREATE TABLE `t_sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK54046F4D78313856` (`userID`),
  CONSTRAINT `FK54046F4D78313856` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysuser
-- ----------------------------
INSERT INTO `t_sysuser` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `t_transfer_local`
-- ----------------------------
DROP TABLE IF EXISTS `t_transfer_local`;
CREATE TABLE `t_transfer_local` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `from_card_id` int(11) DEFAULT NULL,
  `to_card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4D315429A5FF71E` (`from_card_id`),
  KEY `FK4D3154229B88CEF` (`to_card_id`),
  CONSTRAINT `FK4D315429A5FF71E` FOREIGN KEY (`from_card_id`) REFERENCES `t_card` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK4D3154229B88CEF` FOREIGN KEY (`to_card_id`) REFERENCES `t_card` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_transfer_local
-- ----------------------------
INSERT INTO `t_transfer_local` VALUES ('1', '2016-10-21', '100', '3', '1');
INSERT INTO `t_transfer_local` VALUES ('2', '2016-10-22', '10', '4', '3');
INSERT INTO `t_transfer_local` VALUES ('3', '2016-10-24', '10', '6', '3');

-- ----------------------------
-- Table structure for `t_transfer_remote`
-- ----------------------------
DROP TABLE IF EXISTS `t_transfer_remote`;
CREATE TABLE `t_transfer_remote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `poundMoney` double NOT NULL,
  `toName` varchar(255) DEFAULT NULL,
  `tobankid` varchar(255) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `from_card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK9F447D4F6D19A333` (`bank_id`),
  KEY `FK9F447D4F9A5FF71E` (`from_card_id`),
  CONSTRAINT `FK9F447D4F9A5FF71E` FOREIGN KEY (`from_card_id`) REFERENCES `t_card` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK9F447D4F6D19A333` FOREIGN KEY (`bank_id`) REFERENCES `t_bank` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_transfer_remote
-- ----------------------------
INSERT INTO `t_transfer_remote` VALUES ('1', '2016-10-21', '10', '10', 'ff', '2342423423', '1', '3');
INSERT INTO `t_transfer_remote` VALUES ('2', '2016-10-21', '10', '10', '4234', '432', '1', '3');
INSERT INTO `t_transfer_remote` VALUES ('3', '2016-10-22', '10', '10', '鹅鹅鹅', '4324324324', '1', '4');
INSERT INTO `t_transfer_remote` VALUES ('4', '2016-10-24', '30', '10', '48574', '78', '1', '6');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `userAddress` varchar(100) DEFAULT NULL,
  `userBirth` varchar(10) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userGender` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userPassword` varchar(150) NOT NULL,
  `userPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID` (`userID`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', null, null, null, '1', '管理员', 'E10ADC3949BA59ABBE56E057F20F883E', null);
INSERT INTO `t_user` VALUES ('2', 'user1', '', null, '', '1', '111', 'E10ADC3949BA59ABBE56E057F20F883E', '');
INSERT INTO `t_user` VALUES ('3', '12321', null, null, '213', '1', '订单', 'E10ADC3949BA59ABBE56E057F20F883E', '123456789');
INSERT INTO `t_user` VALUES ('5', '123456', null, null, '1', '1', 'eee', 'E10ADC3949BA59ABBE56E057F20F883E', '1');
INSERT INTO `t_user` VALUES ('6', '1111111111', null, null, '3123', '1', '张三', 'E10ADC3949BA59ABBE56E057F20F883E', '123456789');
INSERT INTO `t_user` VALUES ('7', '147', null, null, '1', '1', '娃娃', 'E10ADC3949BA59ABBE56E057F20F883E', '1');
