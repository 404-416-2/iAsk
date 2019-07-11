/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : qiuwen

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2019-07-11 13:51:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `qiuwen_quesanswer`
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_quesanswer`;
CREATE TABLE `qiuwen_quesanswer` (
  `q_id` int(11) NOT NULL,
  `u_id` varchar(255) NOT NULL,
  `ans_text` text NOT NULL,
  `ans_time` datetime NOT NULL,
  PRIMARY KEY (`q_id`,`u_id`),
  KEY `user_answer` (`u_id`),
  KEY `ques_answer` (`q_id`),
  CONSTRAINT `ques_answer` FOREIGN KEY (`q_id`) REFERENCES `qiuwen_question` (`q_id`) ON DELETE CASCADE,
  CONSTRAINT `user_answer` FOREIGN KEY (`u_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiuwen_quesanswer
-- ----------------------------
INSERT INTO `qiuwen_quesanswer` VALUES ('1', '287706314@qq.com', '你是猪', '2019-07-02 13:21:06');
INSERT INTO `qiuwen_quesanswer` VALUES ('1', '3292160950@qq.com', '你说的不对', '2019-07-11 23:27:31');
INSERT INTO `qiuwen_quesanswer` VALUES ('1', '380279801@qq.com', '你是后', '2019-07-01 13:21:45');
INSERT INTO `qiuwen_quesanswer` VALUES ('1', '764155839@qq.com', '你是我的嗯', '2019-07-01 13:22:04');
INSERT INTO `qiuwen_quesanswer` VALUES ('1', '982069087@qq.com', '你是王子吗', '2019-06-06 13:22:28');
INSERT INTO `qiuwen_quesanswer` VALUES ('2', '1171078496@qq.com', '删除了', '2019-07-03 13:23:00');
INSERT INTO `qiuwen_quesanswer` VALUES ('2', '2461677579@qq.com', '你在胡扯', '2019-07-10 12:51:20');
INSERT INTO `qiuwen_quesanswer` VALUES ('2', '3292160950@qq.com', '删除的是寂寞', '2019-07-09 13:23:47');
INSERT INTO `qiuwen_quesanswer` VALUES ('2', '380279801@qq.com', '删除的不是我', '2019-07-02 13:23:30');
INSERT INTO `qiuwen_quesanswer` VALUES ('3', '287706314@qq.com', '不可以不可以', '2019-07-03 13:24:57');
INSERT INTO `qiuwen_quesanswer` VALUES ('3', '3292160950@qq.com', '花火花火', '2019-07-02 13:24:28');
INSERT INTO `qiuwen_quesanswer` VALUES ('3', '982069087@qq.com', '我第一次来', '2019-06-04 13:25:22');
INSERT INTO `qiuwen_quesanswer` VALUES ('4', '1171078496@qq.com', '我要参与这个', '2019-07-09 13:26:44');
INSERT INTO `qiuwen_quesanswer` VALUES ('4', '3292160950@qq.com', '我i也来了', '2019-07-03 13:25:58');
INSERT INTO `qiuwen_quesanswer` VALUES ('5', '287706314@qq.com', 'I Ask是干嘛的', '2019-07-03 13:28:03');
INSERT INTO `qiuwen_quesanswer` VALUES ('5', '3292160950@qq.com', '我要回答问题', '2019-07-05 13:27:43');
INSERT INTO `qiuwen_quesanswer` VALUES ('5', '982069087@qq.com', '我第一次来到这个论坛', '2019-04-04 13:28:38');
INSERT INTO `qiuwen_quesanswer` VALUES ('6', '3292160950@qq.com', '很强啊吗啡', '2019-07-03 13:29:22');
INSERT INTO `qiuwen_quesanswer` VALUES ('7', '1171078496@qq.com', '我会跳舞', '2019-07-10 13:30:01');
INSERT INTO `qiuwen_quesanswer` VALUES ('7', '2461677579@qq.com', '不会跳舞不如跳舞', '2019-07-08 13:30:21');
INSERT INTO `qiuwen_quesanswer` VALUES ('7', '764155839@qq.com', 'QQ炫舞虚炫舞炫舞', '2019-07-03 13:30:46');
INSERT INTO `qiuwen_quesanswer` VALUES ('8', '3292160950@qq.com', '客观客观回答问题', '2019-07-02 13:33:17');
INSERT INTO `qiuwen_quesanswer` VALUES ('9', '3292160950@qq.com', '自问自答', '2019-07-10 13:34:08');
INSERT INTO `qiuwen_quesanswer` VALUES ('9', '764155839@qq.com', '沃尔沃是好车', '2019-06-05 13:34:40');
INSERT INTO `qiuwen_quesanswer` VALUES ('9', '982069087@qq.com', '我又来啦小宝贝', '2019-04-17 13:35:06');
INSERT INTO `qiuwen_quesanswer` VALUES ('10', '982069087@qq.com', '最后一次回答', '2019-08-01 13:35:30');

-- ----------------------------
-- Table structure for `qiuwen_question`
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiuwen_question
-- ----------------------------
INSERT INTO `qiuwen_question` VALUES ('1', '287706314@qq.com', '我是谁？', '5', '2', '1', '2019-07-10 11:52:40', '生活');
INSERT INTO `qiuwen_question` VALUES ('2', '982069087@qq.com', '这个问题被删除了？', '4', '3', '1', '2019-07-09 13:20:19', '其他');
INSERT INTO `qiuwen_question` VALUES ('3', '2461677579@qq.com', '如何评价才徐坤', '3', '5', '0', '2019-07-09 23:26:15', '学习');
INSERT INTO `qiuwen_question` VALUES ('4', '1171078496@qq.com', '如何入门C++和java', '2', '4', '1', '2019-07-09 17:16:47', '工作');
INSERT INTO `qiuwen_question` VALUES ('5', '1171078496@qq.com', '如何入门Python？', '3', '4', '0', '2019-07-04 11:31:56', '其他');
INSERT INTO `qiuwen_question` VALUES ('6', '3292160950@qq.com', '如何评级六小龄童', '1', '3', '1', '2019-07-11 01:59:36', '生活');
INSERT INTO `qiuwen_question` VALUES ('7', '3292160950@qq.com', '什么是街舞', '3', '1', '0', '2019-07-11 02:04:40', '学习');
INSERT INTO `qiuwen_question` VALUES ('8', '3292160950@qq.com', '我们明天会相爱吗', '2', '2', '1', '2019-07-11 09:49:50', '工作');
INSERT INTO `qiuwen_question` VALUES ('9', '3292160950@qq.com', '我是小哥哥吗', '3', '3', '1', '2019-07-03 12:43:54', '生活');
INSERT INTO `qiuwen_question` VALUES ('10', '3292160950@qq.com', '主键是否唯一', '1', '1', '1', '2019-07-02 12:44:37', '学习');

-- ----------------------------
-- Table structure for `qiuwen_user`
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
INSERT INTO `qiuwen_user` VALUES ('史嘉辉', '1171078496@qq.com', '123456', '1', '1', '21', '西北工业大学', '404宿舍');
INSERT INTO `qiuwen_user` VALUES ('吕炳旭', '2461677579@qq.com', '123456', '1', '1', '21', '西北工业大学', '舍长');
INSERT INTO `qiuwen_user` VALUES ('谢子昆', '287706314@qq.com', '123456', '1', '1', '21', '西北工业大学', '白毛浮绿水，我会打排球');
INSERT INTO `qiuwen_user` VALUES ('孙启星', '3292160950@qq.com', '123456', '1', '1', '29', '北京工业大学', '软件5班');
INSERT INTO `qiuwen_user` VALUES ('杨洁', '380279801@qq.com', '123456', '1', '1', '12', '西北工业大学', '这个人很懒，木有介绍');
INSERT INTO `qiuwen_user` VALUES ('马嘉伟', '764155839@qq.com', '123456', '1', '1', '21', '西北工业大学', '宁夏马子哥');
INSERT INTO `qiuwen_user` VALUES ('摇摇子', '982069087@qq.com', '123456', '1', '1', '21', '西北工业大学', '416宿舍');

-- ----------------------------
-- Table structure for `qiuwen_userfriend`
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_userfriend`;
CREATE TABLE `qiuwen_userfriend` (
  `u_id` varchar(255) NOT NULL,
  `friend_id` varchar(255) NOT NULL,
  PRIMARY KEY (`u_id`,`friend_id`),
  KEY `user` (`u_id`),
  KEY `friend` (`friend_id`),
  CONSTRAINT `friend` FOREIGN KEY (`friend_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE,
  CONSTRAINT `user` FOREIGN KEY (`u_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiuwen_userfriend
-- ----------------------------
INSERT INTO `qiuwen_userfriend` VALUES ('1171078496@qq.com', '2461677579@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('1171078496@qq.com', '287706314@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('1171078496@qq.com', '3292160950@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('2461677579@qq.com', '1171078496@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('2461677579@qq.com', '287706314@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('2461677579@qq.com', '3292160950@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('3292160950@qq.com', '1171078496@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('3292160950@qq.com', '287706314@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('3292160950@qq.com', '380279801@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('3292160950@qq.com', '764155839@qq.com');
INSERT INTO `qiuwen_userfriend` VALUES ('3292160950@qq.com', '982069087@qq.com');

-- ----------------------------
-- Table structure for `qiuwen_userstar`
-- ----------------------------
DROP TABLE IF EXISTS `qiuwen_userstar`;
CREATE TABLE `qiuwen_userstar` (
  `u_id` varchar(255) NOT NULL,
  `q_id` int(11) NOT NULL,
  PRIMARY KEY (`u_id`,`q_id`),
  KEY `uuser` (`u_id`),
  KEY `qques` (`q_id`),
  CONSTRAINT `qques` FOREIGN KEY (`q_id`) REFERENCES `qiuwen_question` (`q_id`) ON DELETE CASCADE,
  CONSTRAINT `uuser` FOREIGN KEY (`u_id`) REFERENCES `qiuwen_user` (`usr_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiuwen_userstar
-- ----------------------------
INSERT INTO `qiuwen_userstar` VALUES ('1171078496@qq.com', '1');
INSERT INTO `qiuwen_userstar` VALUES ('3292160950@qq.com', '1');
INSERT INTO `qiuwen_userstar` VALUES ('287706314@qq.com', '2');
INSERT INTO `qiuwen_userstar` VALUES ('3292160950@qq.com', '2');
INSERT INTO `qiuwen_userstar` VALUES ('764155839@qq.com', '2');
INSERT INTO `qiuwen_userstar` VALUES ('1171078496@qq.com', '3');
INSERT INTO `qiuwen_userstar` VALUES ('2461677579@qq.com', '3');
INSERT INTO `qiuwen_userstar` VALUES ('287706314@qq.com', '3');
INSERT INTO `qiuwen_userstar` VALUES ('3292160950@qq.com', '3');
INSERT INTO `qiuwen_userstar` VALUES ('380279801@qq.com', '3');
INSERT INTO `qiuwen_userstar` VALUES ('1171078496@qq.com', '4');
INSERT INTO `qiuwen_userstar` VALUES ('287706314@qq.com', '4');
INSERT INTO `qiuwen_userstar` VALUES ('380279801@qq.com', '4');
INSERT INTO `qiuwen_userstar` VALUES ('764155839@qq.com', '4');
INSERT INTO `qiuwen_userstar` VALUES ('1171078496@qq.com', '5');
INSERT INTO `qiuwen_userstar` VALUES ('2461677579@qq.com', '5');
INSERT INTO `qiuwen_userstar` VALUES ('287706314@qq.com', '5');
INSERT INTO `qiuwen_userstar` VALUES ('982069087@qq.com', '5');
INSERT INTO `qiuwen_userstar` VALUES ('287706314@qq.com', '6');
INSERT INTO `qiuwen_userstar` VALUES ('3292160950@qq.com', '6');
INSERT INTO `qiuwen_userstar` VALUES ('982069087@qq.com', '6');
INSERT INTO `qiuwen_userstar` VALUES ('1171078496@qq.com', '7');
INSERT INTO `qiuwen_userstar` VALUES ('1171078496@qq.com', '8');
INSERT INTO `qiuwen_userstar` VALUES ('2461677579@qq.com', '8');
INSERT INTO `qiuwen_userstar` VALUES ('1171078496@qq.com', '9');
INSERT INTO `qiuwen_userstar` VALUES ('764155839@qq.com', '9');
INSERT INTO `qiuwen_userstar` VALUES ('982069087@qq.com', '9');
INSERT INTO `qiuwen_userstar` VALUES ('1171078496@qq.com', '10');
