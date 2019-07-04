/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : qiuwen

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-07-04 15:33:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qiuwen_quesanswer
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_quesanswer`;
CREATE TABLE `qiuwen_quesanswer` (
  `q_id` int(11) NOT NULL,
  `u_id` varchar(255) NOT NULL,
  `a_text` text NOT NULL,
  `ans_time` datetime NOT NULL,
  KEY `user_answer` (`u_id`),
  KEY `ques_answer` (`q_id`),
  CONSTRAINT `ques_answer` FOREIGN KEY (`q_id`) REFERENCES `qiuwen_question` (`q_id`) ON DELETE CASCADE,
  CONSTRAINT `user_answer` FOREIGN KEY (`u_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiuwen_quesanswer
-- ----------------------------

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
  PRIMARY KEY (`q_id`),
  KEY `user_ques` (`u_id`),
  CONSTRAINT `user_ques` FOREIGN KEY (`u_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiuwen_question
-- ----------------------------
INSERT INTO `qiuwen_question` VALUES ('1', '1029789014@qq.com', '如何理解梯度和方向导数？', '0', '0', '0', '2019-07-04 11:27:43', 'math');
INSERT INTO `qiuwen_question` VALUES ('2', '1029789014@qq.com', '如何理解大数定理？', '0', '0', '0', '2019-07-04 11:29:38', 'math');
INSERT INTO `qiuwen_question` VALUES ('3', '1171078496@qq.com', '如何评价詹姆斯？', '0', '0', '0', '2019-07-04 11:30:30', 'pe');
INSERT INTO `qiuwen_question` VALUES ('4', '1171078496@qq.com', '如何入门C++', '0', '0', '0', '2019-07-04 11:31:16', 'computer');
INSERT INTO `qiuwen_question` VALUES ('5', '1171078496@qq.com', '如何入门Python？', '0', '0', '0', '2019-07-04 11:31:56', 'computer');

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
-- Records of qiuwen_user
-- ----------------------------
INSERT INTO `qiuwen_user` VALUES ('曲卓涵', '1029789014@qq.com', '123456', '1', '1', '21', '西北工业大学', '软件1班');
INSERT INTO `qiuwen_user` VALUES ('史嘉辉', '1171078496@qq.com', '123456', '1', '1', '21', '西北工业大学', '404宿舍');
INSERT INTO `qiuwen_user` VALUES ('吕炳旭', '2461677579@qq.com', '123456', '1', '1', '21', '西北工业大学', '舍长');
INSERT INTO `qiuwen_user` VALUES ('谢子昆', '287706314@qq.com', '123456', '1', '1', '21', '西北工业大学', '白毛浮绿水，我会打排球');
INSERT INTO `qiuwen_user` VALUES ('孙启星', '3292160950@qq.com', '123456', '1', '1', '21', '西北工业大学', '软件3班');
INSERT INTO `qiuwen_user` VALUES ('杨洁', '380279801@qq.com', '123456', '1', '1', '12', '西北工业大学', '这个人很懒，木有介绍');
INSERT INTO `qiuwen_user` VALUES ('马嘉伟', '764155839@qq.com', '123456', '1', '1', '21', '西北工业大学', '宁夏马子哥');
INSERT INTO `qiuwen_user` VALUES ('摇摇子', '982069087@qq.com', '123456', '1', '1', '21', '西北工业大学', '416宿舍');

-- ----------------------------
-- Table structure for qiuwen_userfriend
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_userfriend`;
CREATE TABLE `qiuwen_userfriend` (
  `u_id` varchar(255) NOT NULL,
  `friend_id` varchar(255) NOT NULL,
  KEY `user` (`u_id`),
  KEY `friend` (`friend_id`),
  CONSTRAINT `friend` FOREIGN KEY (`friend_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE,
  CONSTRAINT `user` FOREIGN KEY (`u_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiuwen_userfriend
-- ----------------------------

-- ----------------------------
-- Table structure for qiuwen_userstar
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_userstar`;
CREATE TABLE `qiuwen_userstar` (
  `u_id` varchar(255) NOT NULL,
  `q_id` int(11) NOT NULL,
  KEY `uuser` (`u_id`),
  KEY `qques` (`q_id`),
  CONSTRAINT `qques` FOREIGN KEY (`q_id`) REFERENCES `qiuwen_question` (`q_id`) ON DELETE CASCADE,
  CONSTRAINT `uuser` FOREIGN KEY (`u_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiuwen_userstar
-- ----------------------------
