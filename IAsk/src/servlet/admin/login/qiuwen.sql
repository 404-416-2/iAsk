/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : qiuwen

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-07-03 11:58:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qiuwen_quesanswer
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_quesanswer`;
CREATE TABLE `qiuwen_quesanswer` (
  `q_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `a_text` text NOT NULL,
  `ans_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qiuwen_question
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_question`;
CREATE TABLE `qiuwen_question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(255) DEFAULT '0',
  `q_text` text NOT NULL,
  `follow` int(11) NOT NULL,
  `star_num` int(11) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `sub_time` datetime NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qiuwen_user
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_user`;
CREATE TABLE `qiuwen_user` (
  `nickname` varchar(255) DEFAULT NULL,
  `usr_id` varchar(30) NOT NULL,
  `usr_pwd` varchar(255) DEFAULT NULL,
  `is_ok` int(10) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `age` smallint(140) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qiuwen_userfriend
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_userfriend`;
CREATE TABLE `qiuwen_userfriend` (
  `u_id` varchar(255) NOT NULL,
  `friend_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qiuwen_userstar
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_userstar`;
CREATE TABLE `qiuwen_userstar` (
  `u_id` varchar(255) NOT NULL,
  `q_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
