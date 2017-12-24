/*
Navicat MySQL Data Transfer

Source Server         : 47.94.219.10
Source Server Version : 50616
Source Host           : 47.94.219.10:3306
Source Database       : ubm

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2017-12-24 03:54:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for anchor
-- ----------------------------
DROP TABLE IF EXISTS `anchor`;
CREATE TABLE `anchor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(32) DEFAULT NULL,
  `anchor_name` varchar(60) DEFAULT NULL,
  `anchor_dep` varchar(255) DEFAULT NULL,
  `anchor_location` varchar(100) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anchor
-- ----------------------------
INSERT INTO `anchor` VALUES ('1', '0d28da7c13bc75d0c6e0550706934c81', '注册用户', '系统注册', '系统注册', '1');
INSERT INTO `anchor` VALUES ('2', '0d28da7c13bc75d0c6e0550706934c81', '添加应用', '添加应用', '添加应用', '1');
INSERT INTO `anchor` VALUES ('3', '0d28da7c13bc75d0c6e0550706934c81', '监测点添加', '监测点添加', '监测点添加', '1');
INSERT INTO `anchor` VALUES ('4', '0d28da7c13bc75d0c6e0550706934c81', '应用管理访问', '应用管理访问', '应用管理访问', '1');
INSERT INTO `anchor` VALUES ('5', '0d28da7c13bc75d0c6e0550706934c81', 'URI添加', 'URI添加', 'URI添加', '1');
INSERT INTO `anchor` VALUES ('6', '0d28da7c13bc75d0c6e0550706934c81', '登录', '登录', '登录', '1');
INSERT INTO `anchor` VALUES ('7', '0d28da7c13bc75d0c6e0550706934c81', '数据记录参数', '', '', '1');
INSERT INTO `anchor` VALUES ('8', '0d28da7c13bc75d0c6e0550706934c81', '测试点2', '测试点2', '测试点2', '1');

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `app_dep` text,
  `app_key` varchar(32) DEFAULT NULL,
  `datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES ('1', '1', '监控系统', '本监控系统相关的使用监控，测试用例测试用例测试用例测试用例测试用例', '0d28da7c13bc75d0c6e0550706934c81', '2017-12-23 17:53:06');

-- ----------------------------
-- Table structure for baseinfo
-- ----------------------------
DROP TABLE IF EXISTS `baseinfo`;
CREATE TABLE `baseinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(32) DEFAULT NULL,
  `req_uri` varchar(60) DEFAULT NULL,
  `ua_body` text,
  `user` varchar(60) DEFAULT NULL,
  `user_os` varchar(100) DEFAULT NULL,
  `user_device` varchar(100) DEFAULT NULL,
  `user_browser` varchar(100) DEFAULT NULL,
  `user_engine` varchar(100) DEFAULT NULL,
  `anchor_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of baseinfo
-- ----------------------------
INSERT INTO `baseinfo` VALUES ('1', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '6');
INSERT INTO `baseinfo` VALUES ('2', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('3', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '5');
INSERT INTO `baseinfo` VALUES ('4', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/anchor/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '3');
INSERT INTO `baseinfo` VALUES ('5', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/anchor/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'abc', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '1');
INSERT INTO `baseinfo` VALUES ('6', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/anchor/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'abc', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '6');
INSERT INTO `baseinfo` VALUES ('7', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/anchor/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'abc', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('8', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/anchor/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'abc', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('9', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/anchor/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'abc', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '6');
INSERT INTO `baseinfo` VALUES ('10', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/anchor/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'abc', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '5');
INSERT INTO `baseinfo` VALUES ('11', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0_3 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Mobile/15A432 AliApp(DingTalk/4.2.2) com.laiwang.DingTalk/3004872 Channel/201200 language/zh-Hans-CN', 'admin', '{\"name\":\"iOS\",\"version\":\"11.0.3\"}', '{\"vendor\":\"Apple\",\"model\":\"iPhone\",\"type\":\"mobile\"}', '{\"name\":\"WebKit\",\"version\":\"604.1.38\",\"major\":\"604\"}', '{\"name\":\"WebKit\",\"version\":\"604.1.38\"}', '6');
INSERT INTO `baseinfo` VALUES ('12', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '6');
INSERT INTO `baseinfo` VALUES ('13', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('14', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1', 'admin', '{\"name\":\"iOS\",\"version\":\"9.1\"}', '{\"vendor\":\"Apple\",\"model\":\"iPhone\",\"type\":\"mobile\"}', '{\"name\":\"Mobile Safari\",\"version\":\"9.0\",\"major\":\"9\"}', '{\"name\":\"WebKit\",\"version\":\"601.1.46\"}', '4');
INSERT INTO `baseinfo` VALUES ('15', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('16', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('17', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('18', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('19', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('20', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('21', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('22', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"62.0.3202.89\",\"major\":\"62\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('23', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('24', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('25', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('26', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('27', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '6');
INSERT INTO `baseinfo` VALUES ('28', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('29', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Linux; U; Android 5.1.1; zh-CN; MX4 Pro Build/LMY48W) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.2214.89 UCBrowser/11.3.8.909 UWS/2.10.2.11 Mobile Safari/537.36 AliApp(DingTalk/4.2.0) com.alibaba.android.rimet/0 Channel/228200 language/zh-CN', 'admin', '{\"name\":\"Android\",\"version\":\"5.1.1\"}', '{\"type\":\"mobile\"}', '{\"name\":\"UCBrowser\",\"version\":\"11.3.8.909\",\"major\":\"11\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '6');
INSERT INTO `baseinfo` VALUES ('30', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('31', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"IE\",\"version\":\"11.0\",\"major\":\"11\"}', '{\"name\":\"Trident\",\"version\":\"7.0\"}', '6');
INSERT INTO `baseinfo` VALUES ('32', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"IE\",\"version\":\"11.0\",\"major\":\"11\"}', '{\"name\":\"Trident\",\"version\":\"7.0\"}', '6');
INSERT INTO `baseinfo` VALUES ('33', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"IE\",\"version\":\"11.0\",\"major\":\"11\"}', '{\"name\":\"Trident\",\"version\":\"7.0\"}', '6');
INSERT INTO `baseinfo` VALUES ('34', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"IE\",\"version\":\"11.0\",\"major\":\"11\"}', '{\"name\":\"Trident\",\"version\":\"7.0\"}', '6');
INSERT INTO `baseinfo` VALUES ('35', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"IE\",\"version\":\"11.0\",\"major\":\"11\"}', '{\"name\":\"Trident\",\"version\":\"7.0\"}', '6');
INSERT INTO `baseinfo` VALUES ('36', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"IE\",\"version\":\"11.0\",\"major\":\"11\"}', '{\"name\":\"Trident\",\"version\":\"7.0\"}', '6');
INSERT INTO `baseinfo` VALUES ('37', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '6');
INSERT INTO `baseinfo` VALUES ('38', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/anchor/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '3');
INSERT INTO `baseinfo` VALUES ('39', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"IE\",\"version\":\"11.0\",\"major\":\"11\"}', '{\"name\":\"Trident\",\"version\":\"7.0\"}', '6');
INSERT INTO `baseinfo` VALUES ('40', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/login', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"IE\",\"version\":\"11.0\",\"major\":\"11\"}', '{\"name\":\"Trident\",\"version\":\"7.0\"}', '6');
INSERT INTO `baseinfo` VALUES ('41', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('42', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');
INSERT INTO `baseinfo` VALUES ('43', '0d28da7c13bc75d0c6e0550706934c81', 'http://ubm.jswebtest.com/backstage/app/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3218.0 Safari/537.36', 'admin', '{\"name\":\"Windows\",\"version\":\"7\"}', '{}', '{\"name\":\"Chrome\",\"version\":\"63.0.3218.0\",\"major\":\"63\"}', '{\"name\":\"WebKit\",\"version\":\"537.36\"}', '4');

-- ----------------------------
-- Table structure for uri
-- ----------------------------
DROP TABLE IF EXISTS `uri`;
CREATE TABLE `uri` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `uri_body` text,
  `uri_name` varchar(60) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uri
-- ----------------------------
INSERT INTO `uri` VALUES ('1', '/abc', '{\"dddd\":\"ABC\",\"ccccc\":\"dddddd\"}', 'abc', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) DEFAULT NULL,
  `user_pwd` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', 'abc', '123456');
