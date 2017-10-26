/*
Navicat MySQL Data Transfer

Source Server         : aiyang
Source Server Version : 50715
Source Host           : rm-2ze62dlmyfar7ty10o.mysql.rds.aliyuncs.com:3306
Source Database       : aiyangkeji

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-07-10 09:00:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(64) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `type` varchar(255) DEFAULT NULL COMMENT '状态 0=超级管理  1=营养师用户 2=商家用户',
  `ctime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '012012', '0', null);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '地址',
  `name` varchar(255) NOT NULL COMMENT '二级菜单名',
  `list_id` int(11) NOT NULL COMMENT '关联字段',
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------

-- ----------------------------
-- Table structure for ask_additional
-- ----------------------------
DROP TABLE IF EXISTS `ask_additional`;
CREATE TABLE `ask_additional` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asktoken` varchar(255) DEFAULT NULL COMMENT '问题标识',
  `token` varchar(255) DEFAULT NULL COMMENT '用户追问',
  `token_con` varchar(255) DEFAULT NULL COMMENT '用户追问内容（营养师回答时可为空）',
  `dietitian` varchar(255) DEFAULT NULL COMMENT '营养师追答',
  `dietitian_con` varchar(255) DEFAULT NULL COMMENT '营养师追答内容（用户追问时可为空）',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `type` int(11) DEFAULT NULL COMMENT '状态1：追问2：追答',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ask_additional
-- ----------------------------
INSERT INTO `ask_additional` VALUES ('130', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '嗯嗯，知道了', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1495534315', '1');
INSERT INTO `ask_additional` VALUES ('131', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '好的', '1495534356', '2');
INSERT INTO `ask_additional` VALUES ('132', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '还想知道点东西', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1495534368', '1');
INSERT INTO `ask_additional` VALUES ('133', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '你好', '1495534467', '2');
INSERT INTO `ask_additional` VALUES ('134', 'Ask201705232137344', '9b4858060a5997e2369bbd16b34788c069e90d1d', '每次运动量特大，以后我需要注意啦', '7f2b33c54a1cf1805d0f2e449332add59d863e46', null, '1495546872', '1');
INSERT INTO `ask_additional` VALUES ('135', 'Ask201705232137344', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, '7f2b33c54a1cf1805d0f2e449332add59d863e46', '好滴，一定要注意不剧烈运动', '1495546929', '2');
INSERT INTO `ask_additional` VALUES ('136', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '你是一家集研发', '1495547788', '2');
INSERT INTO `ask_additional` VALUES ('137', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', '还吃什么', 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', null, '1495547799', '1');
INSERT INTO `ask_additional` VALUES ('138', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', '想吃的壮一些', 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', null, '1495547818', '1');
INSERT INTO `ask_additional` VALUES ('139', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '嗯', '1495547819', '2');
INSERT INTO `ask_additional` VALUES ('140', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', '最近特别爱吃冷食，常吃影响身体吗？？？', 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', null, '1495591447', '1');
INSERT INTO `ask_additional` VALUES ('141', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '阿德', '1495712857', '2');
INSERT INTO `ask_additional` VALUES ('142', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '了诶', '1495712862', '2');
INSERT INTO `ask_additional` VALUES ('143', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '回来来咯大', '1495712870', '2');
INSERT INTO `ask_additional` VALUES ('144', 'Ask201705232155352', 'e970ef250c37356236dd9338e12752d3c1673093', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '了饿了咯哦路', '1495712877', '2');
INSERT INTO `ask_additional` VALUES ('145', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '就算了', '1495781438', '2');
INSERT INTO `ask_additional` VALUES ('146', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '好好好', '1495781452', '2');
INSERT INTO `ask_additional` VALUES ('147', 'Ask201705261507333', '9b4858060a5997e2369bbd16b34788c069e90d1d', '这边显示1.1', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495784097', '1');
INSERT INTO `ask_additional` VALUES ('148', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '我肚子疼', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1495793611', '1');
INSERT INTO `ask_additional` VALUES ('149', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', '看看', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495856779', '1');
INSERT INTO `ask_additional` VALUES ('150', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', '明', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495856788', '1');
INSERT INTO `ask_additional` VALUES ('151', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', '咯啦咯看监控', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495856800', '1');
INSERT INTO `ask_additional` VALUES ('152', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', '两家啦', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495856829', '1');
INSERT INTO `ask_additional` VALUES ('153', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'loo呕吐', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857583', '1');
INSERT INTO `ask_additional` VALUES ('154', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '啊的历史', '1495857601', '2');
INSERT INTO `ask_additional` VALUES ('155', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '考虑贴膜旅途', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857613', '1');
INSERT INTO `ask_additional` VALUES ('156', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '来咯啦ill愤怒PLL', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857642', '1');
INSERT INTO `ask_additional` VALUES ('157', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'hook旅途哦哦哦APP', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857648', '1');
INSERT INTO `ask_additional` VALUES ('158', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '来了句同', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857685', '1');
INSERT INTO `ask_additional` VALUES ('159', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'KKK里SUV', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857696', '1');
INSERT INTO `ask_additional` VALUES ('160', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'all去他们图', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857707', '1');
INSERT INTO `ask_additional` VALUES ('161', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '好咯里咯', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857724', '1');
INSERT INTO `ask_additional` VALUES ('162', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '扣扣兔兔', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495857735', '1');
INSERT INTO `ask_additional` VALUES ('163', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '和恶露魔力', '1495857747', '2');
INSERT INTO `ask_additional` VALUES ('164', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '哈哈哈', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1495875526', '1');
INSERT INTO `ask_additional` VALUES ('165', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'dssg', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496283480', '1');
INSERT INTO `ask_additional` VALUES ('166', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦啦啦', '1496651692', '2');
INSERT INTO `ask_additional` VALUES ('167', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '推荐', '1496651697', '2');
INSERT INTO `ask_additional` VALUES ('168', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦啦啦', '1496651700', '2');
INSERT INTO `ask_additional` VALUES ('169', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦咯啦咯啦咯', '1496651706', '2');
INSERT INTO `ask_additional` VALUES ('170', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '繁荣提供关于人体', '1496652670', '2');
INSERT INTO `ask_additional` VALUES ('171', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '风格让他发短信', '1496652677', '2');
INSERT INTO `ask_additional` VALUES ('172', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦咯啦咯啦咯', '1496662459', '2');
INSERT INTO `ask_additional` VALUES ('173', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '今年', '1496662469', '2');
INSERT INTO `ask_additional` VALUES ('174', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '今年', '1496663015', '2');
INSERT INTO `ask_additional` VALUES ('175', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '流量', '1496663029', '2');
INSERT INTO `ask_additional` VALUES ('176', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦啦啦', '1496663032', '2');
INSERT INTO `ask_additional` VALUES ('177', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦啦啦', '1496663036', '2');
INSERT INTO `ask_additional` VALUES ('178', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '发发发发发', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496663048', '1');
INSERT INTO `ask_additional` VALUES ('179', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '掏空了快乐', '1496663280', '2');
INSERT INTO `ask_additional` VALUES ('180', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦咯啦咯啦咯', '1496663299', '2');
INSERT INTO `ask_additional` VALUES ('181', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦咯啦咯啦咯', '1496663320', '2');
INSERT INTO `ask_additional` VALUES ('182', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '你好', '1496663337', '2');
INSERT INTO `ask_additional` VALUES ('183', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'a95058840ac4335364ebebab048d94fa358012df', '在吗？', '1496713263', '2');
INSERT INTO `ask_additional` VALUES ('184', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'a95058840ac4335364ebebab048d94fa358012df', '你好', '1496713278', '2');
INSERT INTO `ask_additional` VALUES ('185', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'a95058840ac4335364ebebab048d94fa358012df', '你好', '1496713400', '2');
INSERT INTO `ask_additional` VALUES ('186', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'a95058840ac4335364ebebab048d94fa358012df', '你好', '1496713678', '2');
INSERT INTO `ask_additional` VALUES ('187', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'a95058840ac4335364ebebab048d94fa358012df', '萝莉控', '1496713831', '2');
INSERT INTO `ask_additional` VALUES ('188', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'a95058840ac4335364ebebab048d94fa358012df', '呃呃呃', '1496713954', '2');
INSERT INTO `ask_additional` VALUES ('189', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', '咯啦咯看监控', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496714083', '1');
INSERT INTO `ask_additional` VALUES ('190', 'Ask201705232137344', '9b4858060a5997e2369bbd16b34788c069e90d1d', '你好', '7f2b33c54a1cf1805d0f2e449332add59d863e46', null, '1496716328', '1');
INSERT INTO `ask_additional` VALUES ('191', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '而温柔', '1496716875', '2');
INSERT INTO `ask_additional` VALUES ('192', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'sdfssfdsdfsds[em_49]', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496716953', '1');
INSERT INTO `ask_additional` VALUES ('193', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '55', '1496718046', '2');
INSERT INTO `ask_additional` VALUES ('194', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '66', '1496718053', '2');
INSERT INTO `ask_additional` VALUES ('195', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', '测试下', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496726835', '1');
INSERT INTO `ask_additional` VALUES ('196', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '三四十', '1496726877', '2');
INSERT INTO `ask_additional` VALUES ('197', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'dsdfdsf', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496729851', '1');
INSERT INTO `ask_additional` VALUES ('198', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '试试', '1496732276', '2');
INSERT INTO `ask_additional` VALUES ('199', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '超出', '1496732407', '2');
INSERT INTO `ask_additional` VALUES ('200', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '超出', '1496732412', '2');
INSERT INTO `ask_additional` VALUES ('201', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '的', '1496732642', '2');
INSERT INTO `ask_additional` VALUES ('202', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '发', '1496732647', '2');
INSERT INTO `ask_additional` VALUES ('203', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '呃', '1496732681', '2');
INSERT INTO `ask_additional` VALUES ('204', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '呃', '1496732701', '2');
INSERT INTO `ask_additional` VALUES ('205', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'fsfsd', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496734457', '1');
INSERT INTO `ask_additional` VALUES ('206', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', '[em_7]dsfsdf', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496738199', '1');
INSERT INTO `ask_additional` VALUES ('207', 'Ask201705261507333', '9b4858060a5997e2369bbd16b34788c069e90d1d', '[em_2][em_39][em_19]哈哈哈测试下', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496738659', '1');
INSERT INTO `ask_additional` VALUES ('208', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_6][em_8][em_11]', '1496739410', '2');
INSERT INTO `ask_additional` VALUES ('209', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_8]', '1496739533', '2');
INSERT INTO `ask_additional` VALUES ('210', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_6]', '1496739825', '2');
INSERT INTO `ask_additional` VALUES ('211', 'Ask201705261341959', '9b4858060a5997e2369bbd16b34788c069e90d1d', '[em_8]sdfsfdsfsfd', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496740174', '1');
INSERT INTO `ask_additional` VALUES ('212', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_7]', '1496740269', '2');
INSERT INTO `ask_additional` VALUES ('213', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_38]', '1496742127', '2');
INSERT INTO `ask_additional` VALUES ('214', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_9]水电费干活', '1496742393', '2');
INSERT INTO `ask_additional` VALUES ('215', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '[em_19][em_22]', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496742397', '1');
INSERT INTO `ask_additional` VALUES ('216', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_7]说的', '1496742454', '2');
INSERT INTO `ask_additional` VALUES ('217', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '[em_23]', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496742937', '1');
INSERT INTO `ask_additional` VALUES ('218', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_36]', '1496743140', '2');
INSERT INTO `ask_additional` VALUES ('219', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_36]', '1496803283', '2');
INSERT INTO `ask_additional` VALUES ('220', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_56]', '1496804928', '2');
INSERT INTO `ask_additional` VALUES ('221', 'Ask201706071714727', '78aefc5d028112baf32d9ae0ec447cc207542c8e', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '你好', '1496827225', '2');
INSERT INTO `ask_additional` VALUES ('222', 'Ask201706071714727', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '默默', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496827281', '1');
INSERT INTO `ask_additional` VALUES ('223', 'Ask201706071714727', '78aefc5d028112baf32d9ae0ec447cc207542c8e', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '噢噢', '1496827294', '2');
INSERT INTO `ask_additional` VALUES ('224', 'Ask201706071714727', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '服务态度好', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496827313', '1');
INSERT INTO `ask_additional` VALUES ('225', 'Ask201706071714727', '78aefc5d028112baf32d9ae0ec447cc207542c8e', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '好的', '1496827321', '2');
INSERT INTO `ask_additional` VALUES ('226', 'Ask201706071714727', '78aefc5d028112baf32d9ae0ec447cc207542c8e', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '谢谢', '1496827325', '2');
INSERT INTO `ask_additional` VALUES ('227', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '回家吃饭吗？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496827680', '1');
INSERT INTO `ask_additional` VALUES ('228', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_22][em_56][em_43]', '1496885291', '2');
INSERT INTO `ask_additional` VALUES ('229', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '试一试第一次发能进去吗', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496887010', '1');
INSERT INTO `ask_additional` VALUES ('230', 'Ask201705261507333', '9b4858060a5997e2369bbd16b34788c069e90d1d', '[em_18]', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496887338', '1');
INSERT INTO `ask_additional` VALUES ('231', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_67][em_68]', '1496887751', '2');
INSERT INTO `ask_additional` VALUES ('232', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_69][em_70]', '1496887910', '2');
INSERT INTO `ask_additional` VALUES ('233', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '国家经济[em_27][em_19]', '1496888130', '2');
INSERT INTO `ask_additional` VALUES ('234', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '哈咯爱情[em_8][em_23]', '1496888165', '2');
INSERT INTO `ask_additional` VALUES ('235', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_20]', '1496888228', '2');
INSERT INTO `ask_additional` VALUES ('236', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_20]', '1496888257', '2');
INSERT INTO `ask_additional` VALUES ('237', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '[em_65]', '1496888368', '2');
INSERT INTO `ask_additional` VALUES ('238', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '啦啦图[em_22]', '1496888626', '2');
INSERT INTO `ask_additional` VALUES ('239', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '好个个个个个', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496889059', '1');
INSERT INTO `ask_additional` VALUES ('240', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '说什么[em_23]', '1496890697', '2');
INSERT INTO `ask_additional` VALUES ('241', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '个个好好好', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496892121', '1');
INSERT INTO `ask_additional` VALUES ('242', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '个个好好好uuxuxhx', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496892129', '1');
INSERT INTO `ask_additional` VALUES ('243', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '个个好好好uuxuxhx', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496892134', '1');
INSERT INTO `ask_additional` VALUES ('244', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '个个好好好uuxuxhx', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496892174', '1');
INSERT INTO `ask_additional` VALUES ('245', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '你好', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496892315', '1');
INSERT INTO `ask_additional` VALUES ('246', 'Ask201706071714727', '78aefc5d028112baf32d9ae0ec447cc207542c8e', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'dfgrtfd', '1496892353', '2');
INSERT INTO `ask_additional` VALUES ('247', 'Ask201706071714727', '78aefc5d028112baf32d9ae0ec447cc207542c8e', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'fgff', '1496892359', '2');
INSERT INTO `ask_additional` VALUES ('248', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '你好啊', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496892387', '1');
INSERT INTO `ask_additional` VALUES ('249', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'drgftrgrt', '1496892429', '2');
INSERT INTO `ask_additional` VALUES ('250', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'fwe', '1496892436', '2');
INSERT INTO `ask_additional` VALUES ('251', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'drgftrgrt', '1496892439', '2');
INSERT INTO `ask_additional` VALUES ('252', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '今天想吃什么？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496892500', '1');
INSERT INTO `ask_additional` VALUES ('253', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '试下看看结果', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496892509', '1');
INSERT INTO `ask_additional` VALUES ('254', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦啦啦', '1496893096', '2');
INSERT INTO `ask_additional` VALUES ('255', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '嘎嘎嘎嘎', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893127', '1');
INSERT INTO `ask_additional` VALUES ('256', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '嘎嘎嘎嘎', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893131', '1');
INSERT INTO `ask_additional` VALUES ('257', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '今天想吃什么？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893162', '1');
INSERT INTO `ask_additional` VALUES ('258', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893408', '1');
INSERT INTO `ask_additional` VALUES ('259', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '123123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893713', '1');
INSERT INTO `ask_additional` VALUES ('260', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '123123123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893734', '1');
INSERT INTO `ask_additional` VALUES ('261', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '123123123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893736', '1');
INSERT INTO `ask_additional` VALUES ('262', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '烦烦烦', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893809', '1');
INSERT INTO `ask_additional` VALUES ('263', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '不不好好好', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496893828', '1');
INSERT INTO `ask_additional` VALUES ('264', 'Ask201705231739973', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496894085', '1');
INSERT INTO `ask_additional` VALUES ('265', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496894203', '1');
INSERT INTO `ask_additional` VALUES ('266', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '胡建国或均获国计', '1496894234', '2');
INSERT INTO `ask_additional` VALUES ('267', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '123', '1496894303', '2');
INSERT INTO `ask_additional` VALUES ('268', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '好好好好个', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496894343', '1');
INSERT INTO `ask_additional` VALUES ('269', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '今天想吃什么？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496894358', '1');
INSERT INTO `ask_additional` VALUES ('270', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '好个咯啦咯啦', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496894375', '1');
INSERT INTO `ask_additional` VALUES ('271', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '123', '1496894669', '2');
INSERT INTO `ask_additional` VALUES ('272', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496894692', '1');
INSERT INTO `ask_additional` VALUES ('273', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '刚刚通过提高也同样', '1496894719', '2');
INSERT INTO `ask_additional` VALUES ('274', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'ertyrty', '1496894750', '2');
INSERT INTO `ask_additional` VALUES ('275', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'hjgj', '1496894758', '2');
INSERT INTO `ask_additional` VALUES ('276', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '123123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496894908', '1');
INSERT INTO `ask_additional` VALUES ('277', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦啦啦', '1496894924', '2');
INSERT INTO `ask_additional` VALUES ('278', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'sdasd', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496894932', '1');
INSERT INTO `ask_additional` VALUES ('279', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '啦咯啦咯啦咯', '1496894963', '2');
INSERT INTO `ask_additional` VALUES ('280', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '空军建军节', '1496894978', '2');
INSERT INTO `ask_additional` VALUES ('281', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '奖励你明', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496901317', '1');
INSERT INTO `ask_additional` VALUES ('282', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '来咯弄咯啦咯看监控', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496901331', '1');
INSERT INTO `ask_additional` VALUES ('283', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '咯啦咯来咯哦哦', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496901351', '1');
INSERT INTO `ask_additional` VALUES ('284', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '我看下', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496902443', '1');
INSERT INTO `ask_additional` VALUES ('285', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '[em_5][em_19]', '1496902466', '2');
INSERT INTO `ask_additional` VALUES ('286', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '[em_23]', '1496902488', '2');
INSERT INTO `ask_additional` VALUES ('287', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '[em_8][em_9][em_52]', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496902504', '1');
INSERT INTO `ask_additional` VALUES ('288', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '[em_20]', '1496902518', '2');
INSERT INTO `ask_additional` VALUES ('289', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '[em_21][em_52]', '1496902554', '2');
INSERT INTO `ask_additional` VALUES ('290', 'Ask201705261805193', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '[em_6][em_21][em_24][em_6][em_35][em_37]', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', null, '1496902560', '1');
INSERT INTO `ask_additional` VALUES ('291', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '看看', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496902775', '1');
INSERT INTO `ask_additional` VALUES ('292', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '测试下', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496903432', '1');
INSERT INTO `ask_additional` VALUES ('293', 'Ask201705271141207', '9b4858060a5997e2369bbd16b34788c069e90d1d', '好的', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', null, '1496903438', '1');
INSERT INTO `ask_additional` VALUES ('294', 'Ask201706211050525', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '哥哥会好好过', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', null, '1498259346', '1');
INSERT INTO `ask_additional` VALUES ('295', 'Ask201706241725645', '78aefc5d028112baf32d9ae0ec447cc207542c8e', null, '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '您好', '1498651918', '2');
INSERT INTO `ask_additional` VALUES ('296', 'Ask201706211050525', '78aefc5d028112baf32d9ae0ec447cc207542c8e', null, '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '您好', '1498651973', '2');
INSERT INTO `ask_additional` VALUES ('297', 'Ask201707041101765', '661b61a6d3e2ac56f5ce42b11f3655faedccc7a5', null, 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '可以给孩子喝梨水，百合水，绿豆汤都可以喝点，有痰也有可能是上火，喝点绿豆汤能去除火气。', '1499178563', '2');
INSERT INTO `ask_additional` VALUES ('298', 'Ask201707041101765', '661b61a6d3e2ac56f5ce42b11f3655faedccc7a5', null, 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '您还在吗', '1499243022', '2');

-- ----------------------------
-- Table structure for ask_conslist
-- ----------------------------
DROP TABLE IF EXISTS `ask_conslist`;
CREATE TABLE `ask_conslist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL COMMENT '用户名',
  `timg` varchar(255) DEFAULT NULL,
  `token_con` text CHARACTER SET utf8mb4,
  `dietitian` varchar(255) DEFAULT NULL,
  `dname` varchar(255) DEFAULT NULL COMMENT '营养师名',
  `dimg` varchar(255) DEFAULT NULL,
  `dietitian_con` text CHARACTER SET utf8mb4,
  `ctime` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` int(255) DEFAULT NULL COMMENT '1：用户说   2：营养师说',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ask_conslist
-- ----------------------------
INSERT INTO `ask_conslist` VALUES ('81', '2017052317294362', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '聊天', 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', null, '1495531884', '1');
INSERT INTO `ask_conslist` VALUES ('82', '2017052317294362', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', '这种难以言表', '1495531890', '2');
INSERT INTO `ask_conslist` VALUES ('83', '2017052317294362', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '我的身体发胖怎么办', 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', null, '1495531902', '1');
INSERT INTO `ask_conslist` VALUES ('84', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '你好', '1495534889', '2');
INSERT INTO `ask_conslist` VALUES ('85', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '你好', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1495535034', '1');
INSERT INTO `ask_conslist` VALUES ('86', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '您木木木莫咯了', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1495538367', '1');
INSERT INTO `ask_conslist` VALUES ('87', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '额下坡路', '1495538420', '2');
INSERT INTO `ask_conslist` VALUES ('88', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '嗯看空间', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1495538432', '1');
INSERT INTO `ask_conslist` VALUES ('89', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '╮(╯▽╰)╭', '1495538445', '2');
INSERT INTO `ask_conslist` VALUES ('90', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1495538470', '1');
INSERT INTO `ask_conslist` VALUES ('91', '2017052319036951', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '壹+1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIq4qkq3h7AjjYEXhMPcKps7byuJlvHOYwM2GQArg1xzRPE0kgCEgPHAtkicLjD2RQLDaH7FfTv2VQ/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '你好', '1495538537', '2');
INSERT INTO `ask_conslist` VALUES ('92', '2017052319036951', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '壹+1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIq4qkq3h7AjjYEXhMPcKps7byuJlvHOYwM2GQArg1xzRPE0kgCEgPHAtkicLjD2RQLDaH7FfTv2VQ/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '某些', '1495538592', '2');
INSERT INTO `ask_conslist` VALUES ('93', '2017052320251912', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', '懂不', '1495542495', '2');
INSERT INTO `ask_conslist` VALUES ('94', '2017052317294362', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '想快速减肥啊，有点难', 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', null, '1495542534', '1');
INSERT INTO `ask_conslist` VALUES ('95', '2017052321456766', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '你好', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '陈正義', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', null, '1495547204', '1');
INSERT INTO `ask_conslist` VALUES ('96', '2017052321456766', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, '7f2b33c54a1cf1805d0f2e449332add59d863e46', '陈正義', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', '你好，很高兴为你服务', '1495547208', '2');
INSERT INTO `ask_conslist` VALUES ('97', '2017052321456766', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '怎样才能保持身', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '陈正義', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', null, '1495547231', '1');
INSERT INTO `ask_conslist` VALUES ('98', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '不好好个个', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1495612531', '1');
INSERT INTO `ask_conslist` VALUES ('99', '2017052317294362', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', '咯哦哦了', '1495711598', '2');
INSERT INTO `ask_conslist` VALUES ('100', '2017052317294362', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', '看见了', '1495711604', '2');
INSERT INTO `ask_conslist` VALUES ('101', '2017052317294362', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', '阿德', '1495711613', '2');
INSERT INTO `ask_conslist` VALUES ('102', '2017052317294362', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b94c4f09e854e67cfa4b7f1e8fef75a11935efc7', '张露', 'http://api.shoumeikeji.cn/picture/14957820402405.jpg', '辣的', '1495711625', '2');
INSERT INTO `ask_conslist` VALUES ('103', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '测测评分', '1495765459', '2');
INSERT INTO `ask_conslist` VALUES ('104', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '怎么聊', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495778522', '1');
INSERT INTO `ask_conslist` VALUES ('105', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '我也不知道', '1495778539', '2');
INSERT INTO `ask_conslist` VALUES ('106', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '看看再说', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495778555', '1');
INSERT INTO `ask_conslist` VALUES ('107', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '服务好评', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495778573', '1');
INSERT INTO `ask_conslist` VALUES ('108', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '给五星好评哦亲', '1495778583', '2');
INSERT INTO `ask_conslist` VALUES ('109', '2017052614027719', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '亲', '1495778595', '2');
INSERT INTO `ask_conslist` VALUES ('110', '2017052614027719', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '哈哈哈哈', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495778615', '1');
INSERT INTO `ask_conslist` VALUES ('111', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '我再看看头像', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495779693', '1');
INSERT INTO `ask_conslist` VALUES ('112', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '小伙', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495779709', '1');
INSERT INTO `ask_conslist` VALUES ('113', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '哈喽', '1495780297', '2');
INSERT INTO `ask_conslist` VALUES ('114', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '来一个', '1495780856', '2');
INSERT INTO `ask_conslist` VALUES ('115', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '来来来', '1495780862', '2');
INSERT INTO `ask_conslist` VALUES ('116', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '干嘛呢', '1495781404', '2');
INSERT INTO `ask_conslist` VALUES ('117', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '测试呢', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495781505', '1');
INSERT INTO `ask_conslist` VALUES ('118', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '累', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1495781698', '1');
INSERT INTO `ask_conslist` VALUES ('119', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '真累', '1495781752', '2');
INSERT INTO `ask_conslist` VALUES ('120', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1495781900', '2');
INSERT INTO `ask_conslist` VALUES ('121', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '对啊', '1495781941', '2');
INSERT INTO `ask_conslist` VALUES ('122', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '干嘛呢', '1495781967', '2');
INSERT INTO `ask_conslist` VALUES ('123', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '图灵', '1495782010', '2');
INSERT INTO `ask_conslist` VALUES ('124', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '掏空了快乐', '1495782014', '2');
INSERT INTO `ask_conslist` VALUES ('125', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '阿里郎', '1495782023', '2');
INSERT INTO `ask_conslist` VALUES ('126', '2017052319036951', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '壹+1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIq4qkq3h7AjjYEXhMPcKps7byuJlvHOYwM2GQArg1xzRPE0kgCEgPHAtkicLjD2RQLDaH7FfTv2VQ/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1495782062', '2');
INSERT INTO `ask_conslist` VALUES ('127', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '兔兔', '1495782108', '2');
INSERT INTO `ask_conslist` VALUES ('128', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1495782287', '2');
INSERT INTO `ask_conslist` VALUES ('129', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '黑八', '1495782288', '2');
INSERT INTO `ask_conslist` VALUES ('130', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '吐了咯', '1495782302', '2');
INSERT INTO `ask_conslist` VALUES ('131', '2017052614027719', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '好的好的好好的', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495783498', '1');
INSERT INTO `ask_conslist` VALUES ('132', '2017052614027719', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '嘿嘿嘿嘿嘿慧', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495783506', '1');
INSERT INTO `ask_conslist` VALUES ('133', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '测试下', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1495794553', '1');
INSERT INTO `ask_conslist` VALUES ('134', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '咯啦咯看监控', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495849666', '1');
INSERT INTO `ask_conslist` VALUES ('135', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '，尼莫', '1495850536', '2');
INSERT INTO `ask_conslist` VALUES ('136', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '尼莫', '1495850540', '2');
INSERT INTO `ask_conslist` VALUES ('137', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '不过一个人', '1495850775', '2');
INSERT INTO `ask_conslist` VALUES ('138', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '看看泼墨', '1495856715', '2');
INSERT INTO `ask_conslist` VALUES ('139', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '，高科技', '1495856728', '2');
INSERT INTO `ask_conslist` VALUES ('140', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', 'ice 啦啦啦', '1495856742', '2');
INSERT INTO `ask_conslist` VALUES ('141', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '啦咯JS', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495857009', '1');
INSERT INTO `ask_conslist` VALUES ('142', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', 'loo涂抹all', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495857016', '1');
INSERT INTO `ask_conslist` VALUES ('143', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', 'KKK你mix', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495857038', '1');
INSERT INTO `ask_conslist` VALUES ('144', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '来咯理科班', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495857536', '1');
INSERT INTO `ask_conslist` VALUES ('145', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '可寂寞兔兔', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495857542', '1');
INSERT INTO `ask_conslist` VALUES ('146', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '啦旅途同', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495857553', '1');
INSERT INTO `ask_conslist` VALUES ('147', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', 'tools啦饿了', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495857560', '1');
INSERT INTO `ask_conslist` VALUES ('148', '2017052715517120', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '爱样@阿海', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '收到了没', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', null, '1495872340', '1');
INSERT INTO `ask_conslist` VALUES ('149', '2017052715517120', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '爱样@阿海', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '收到了', '1495872455', '2');
INSERT INTO `ask_conslist` VALUES ('150', '2017052715517120', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '爱样@阿海', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', null, 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '牛角尖', '1495872479', '2');
INSERT INTO `ask_conslist` VALUES ('151', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '还能聊吗', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496288294', '1');
INSERT INTO `ask_conslist` VALUES ('152', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '二哈', '1496663508', '2');
INSERT INTO `ask_conslist` VALUES ('153', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '二哈', '1496663768', '2');
INSERT INTO `ask_conslist` VALUES ('154', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '流量', '1496664178', '2');
INSERT INTO `ask_conslist` VALUES ('155', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '开始', '1496664183', '2');
INSERT INTO `ask_conslist` VALUES ('156', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '你好', '1496713172', '2');
INSERT INTO `ask_conslist` VALUES ('157', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496713281', '1');
INSERT INTO `ask_conslist` VALUES ('158', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '拉开距离', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496713309', '1');
INSERT INTO `ask_conslist` VALUES ('159', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '图了了了', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496713313', '1');
INSERT INTO `ask_conslist` VALUES ('160', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1496748700', '2');
INSERT INTO `ask_conslist` VALUES ('161', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1496748705', '2');
INSERT INTO `ask_conslist` VALUES ('162', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1496748709', '2');
INSERT INTO `ask_conslist` VALUES ('163', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '可得', '1496748715', '2');
INSERT INTO `ask_conslist` VALUES ('164', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '看看', '1496748741', '2');
INSERT INTO `ask_conslist` VALUES ('165', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1496886891', '2');
INSERT INTO `ask_conslist` VALUES ('166', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'uuyyy', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496886928', '1');
INSERT INTO `ask_conslist` VALUES ('167', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '吐了咯', '1496886988', '2');
INSERT INTO `ask_conslist` VALUES ('168', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1496887041', '2');
INSERT INTO `ask_conslist` VALUES ('169', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '看看', '1496887053', '2');
INSERT INTO `ask_conslist` VALUES ('170', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'a95058840ac4335364ebebab048d94fa358012df', '李达', 'http://api.shoumeikeji.cn/aiyang.jpg', '第一次', '1496887084', '2');
INSERT INTO `ask_conslist` VALUES ('171', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'a95058840ac4335364ebebab048d94fa358012df', '李达', 'http://api.shoumeikeji.cn/aiyang.jpg', '这是设么原因', '1496887132', '2');
INSERT INTO `ask_conslist` VALUES ('172', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '123123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496887848', '1');
INSERT INTO `ask_conslist` VALUES ('173', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '掏空了快乐', '1496887869', '2');
INSERT INTO `ask_conslist` VALUES ('174', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'qweqwe', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496887885', '1');
INSERT INTO `ask_conslist` VALUES ('175', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1496887977', '2');
INSERT INTO `ask_conslist` VALUES ('176', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '123123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496887994', '1');
INSERT INTO `ask_conslist` VALUES ('177', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'wreewrwer', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496888086', '1');
INSERT INTO `ask_conslist` VALUES ('178', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', 'VB你', '1496888155', '2');
INSERT INTO `ask_conslist` VALUES ('179', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '呵呵哈哈哈', '1496888172', '2');
INSERT INTO `ask_conslist` VALUES ('180', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'qweqwe', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496888567', '1');
INSERT INTO `ask_conslist` VALUES ('181', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '巨龙', '1496888648', '2');
INSERT INTO `ask_conslist` VALUES ('182', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '123123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496888650', '1');
INSERT INTO `ask_conslist` VALUES ('183', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1496888664', '2');
INSERT INTO `ask_conslist` VALUES ('184', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'qweqwe', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1496888679', '1');
INSERT INTO `ask_conslist` VALUES ('185', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1496888689', '2');
INSERT INTO `ask_conslist` VALUES ('186', '2017052320332595', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', null, 'a95058840ac4335364ebebab048d94fa358012df', '李达', 'http://api.shoumeikeji.cn/aiyang.jpg', '真是不好的兆头', '1496903132', '2');
INSERT INTO `ask_conslist` VALUES ('187', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '巨龙', '1497436103', '2');
INSERT INTO `ask_conslist` VALUES ('188', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1497436108', '2');
INSERT INTO `ask_conslist` VALUES ('189', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1497436133', '2');
INSERT INTO `ask_conslist` VALUES ('190', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'ghhh', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497436136', '1');
INSERT INTO `ask_conslist` VALUES ('191', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1497436138', '2');
INSERT INTO `ask_conslist` VALUES ('192', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '空军建军节', '1497436170', '2');
INSERT INTO `ask_conslist` VALUES ('193', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1497436269', '2');
INSERT INTO `ask_conslist` VALUES ('194', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '来看看', '1497436413', '2');
INSERT INTO `ask_conslist` VALUES ('195', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', 'ok\\ue04a', '1497691373', '2');
INSERT INTO `ask_conslist` VALUES ('196', '2017061710022104', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '213123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497693138', '1');
INSERT INTO `ask_conslist` VALUES ('197', '2017061710022104', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'qweqwe', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497693143', '1');
INSERT INTO `ask_conslist` VALUES ('198', '2017061710022104', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'qweqwe', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497693146', '1');
INSERT INTO `ask_conslist` VALUES ('199', '2017061710022104', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '123123123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497693165', '1');
INSERT INTO `ask_conslist` VALUES ('200', '2017061710022104', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'ADSADASDASDASDASDASD<img src=\"images/35.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497693196', '1');
INSERT INTO `ask_conslist` VALUES ('201', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '测试标签表情<img src=\"images/35.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497923836', '1');
INSERT INTO `ask_conslist` VALUES ('202', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '', '1497952638', '2');
INSERT INTO `ask_conslist` VALUES ('203', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈哈哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497958597', '1');
INSERT INTO `ask_conslist` VALUES ('204', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '12555', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497958603', '1');
INSERT INTO `ask_conslist` VALUES ('205', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1497958624', '2');
INSERT INTO `ask_conslist` VALUES ('206', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1497958664', '2');
INSERT INTO `ask_conslist` VALUES ('207', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'hhhhhh', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497959723', '1');
INSERT INTO `ask_conslist` VALUES ('208', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈哈哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1497959758', '1');
INSERT INTO `ask_conslist` VALUES ('209', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1497959948', '2');
INSERT INTO `ask_conslist` VALUES ('210', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', 'ff', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498010779', '1');
INSERT INTO `ask_conslist` VALUES ('211', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', 'ff', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498010779', '1');
INSERT INTO `ask_conslist` VALUES ('212', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', 'ff', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498010780', '1');
INSERT INTO `ask_conslist` VALUES ('213', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', 'ff', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498010782', '1');
INSERT INTO `ask_conslist` VALUES ('214', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', 'ff', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498010795', '1');
INSERT INTO `ask_conslist` VALUES ('215', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498013532', '1');
INSERT INTO `ask_conslist` VALUES ('216', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498013539', '1');
INSERT INTO `ask_conslist` VALUES ('217', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498013546', '1');
INSERT INTO `ask_conslist` VALUES ('218', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '可苦了', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498013667', '1');
INSERT INTO `ask_conslist` VALUES ('219', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '1444', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498013694', '1');
INSERT INTO `ask_conslist` VALUES ('220', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '叫姐姐uuuuu', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498013733', '1');
INSERT INTO `ask_conslist` VALUES ('221', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1498013760', '2');
INSERT INTO `ask_conslist` VALUES ('222', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1498013770', '2');
INSERT INTO `ask_conslist` VALUES ('223', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', 'uhhhg', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498013772', '1');
INSERT INTO `ask_conslist` VALUES ('224', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '空军建军节', '1498013790', '2');
INSERT INTO `ask_conslist` VALUES ('225', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '风风光光', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498013830', '1');
INSERT INTO `ask_conslist` VALUES ('226', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '今天想吃什么？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498014802', '1');
INSERT INTO `ask_conslist` VALUES ('227', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/60.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498015054', '1');
INSERT INTO `ask_conslist` VALUES ('228', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈哈哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498015062', '1');
INSERT INTO `ask_conslist` VALUES ('229', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023423', '1');
INSERT INTO `ask_conslist` VALUES ('230', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023458', '1');
INSERT INTO `ask_conslist` VALUES ('231', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '回家吃饭吗？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023498', '1');
INSERT INTO `ask_conslist` VALUES ('232', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '今天想吃什么？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023526', '1');
INSERT INTO `ask_conslist` VALUES ('233', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/10.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023818', '1');
INSERT INTO `ask_conslist` VALUES ('234', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023825', '1');
INSERT INTO `ask_conslist` VALUES ('235', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/23.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023905', '1');
INSERT INTO `ask_conslist` VALUES ('236', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '今天想吃什么？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023979', '1');
INSERT INTO `ask_conslist` VALUES ('237', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '<img src=\"images/33.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498023995', '1');
INSERT INTO `ask_conslist` VALUES ('238', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '回家吃饭吗？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498024017', '1');
INSERT INTO `ask_conslist` VALUES ('239', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '回家吃饭吗？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498024032', '1');
INSERT INTO `ask_conslist` VALUES ('240', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '今天想吃什么？', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498024036', '1');
INSERT INTO `ask_conslist` VALUES ('241', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/50.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498024040', '1');
INSERT INTO `ask_conslist` VALUES ('242', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '是', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498024047', '1');
INSERT INTO `ask_conslist` VALUES ('243', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '任天堂', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498024067', '1');
INSERT INTO `ask_conslist` VALUES ('244', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '<img src=\"images/21.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498024123', '1');
INSERT INTO `ask_conslist` VALUES ('245', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '流量', '1498024618', '2');
INSERT INTO `ask_conslist` VALUES ('246', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '流量啦啦啦', '1498024633', '2');
INSERT INTO `ask_conslist` VALUES ('247', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1498029080', '2');
INSERT INTO `ask_conslist` VALUES ('248', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/33.gif\"><img src=\"images/33.gif\">啦咯考虑咯了', '1498029098', '2');
INSERT INTO `ask_conslist` VALUES ('249', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '推荐<img src=\"images/45.gif\">', '1498029194', '2');
INSERT INTO `ask_conslist` VALUES ('250', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/44.gif\">', '1498038150', '2');
INSERT INTO `ask_conslist` VALUES ('251', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/48.gif\">', '1498038174', '2');
INSERT INTO `ask_conslist` VALUES ('252', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/47.gif\">', '1498040028', '2');
INSERT INTO `ask_conslist` VALUES ('253', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/10.gif\">', '1498040071', '2');
INSERT INTO `ask_conslist` VALUES ('254', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498040732', '1');
INSERT INTO `ask_conslist` VALUES ('255', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/61.gif\">', '1498098615', '2');
INSERT INTO `ask_conslist` VALUES ('256', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/48.gif\"><img src=\"images/34.gif\"><img src=\"images/58.gif\"><img src=\"images/49.gif\">', '1498098663', '2');
INSERT INTO `ask_conslist` VALUES ('257', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/9.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498138011', '1');
INSERT INTO `ask_conslist` VALUES ('258', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '在不是是是', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498214666', '1');
INSERT INTO `ask_conslist` VALUES ('259', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '<img src=\"images/35.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498214670', '1');
INSERT INTO `ask_conslist` VALUES ('260', 'Ask2017060917045779', null, null, null, null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/18.gif\">', '1498215299', '2');
INSERT INTO `ask_conslist` VALUES ('261', 'Ask2017060917045779', null, null, null, null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '<img src=\"images/18.gif\">', '1498215303', '2');
INSERT INTO `ask_conslist` VALUES ('262', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈喽', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221032', '1');
INSERT INTO `ask_conslist` VALUES ('263', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈喽', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221033', '1');
INSERT INTO `ask_conslist` VALUES ('264', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221053', '1');
INSERT INTO `ask_conslist` VALUES ('265', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/35.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221058', '1');
INSERT INTO `ask_conslist` VALUES ('266', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/35.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221059', '1');
INSERT INTO `ask_conslist` VALUES ('267', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '&nbsp;哈喽', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221117', '1');
INSERT INTO `ask_conslist` VALUES ('268', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/24.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221126', '1');
INSERT INTO `ask_conslist` VALUES ('269', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/49.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\"><img src=\"images/37.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221135', '1');
INSERT INTO `ask_conslist` VALUES ('270', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/49.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\"><img src=\"images/37.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221135', '1');
INSERT INTO `ask_conslist` VALUES ('271', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/35.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\"><img src=\"images/52.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221179', '1');
INSERT INTO `ask_conslist` VALUES ('272', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/50.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221191', '1');
INSERT INTO `ask_conslist` VALUES ('273', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/52.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221204', '1');
INSERT INTO `ask_conslist` VALUES ('274', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '<img src=\"images/52.gif\" style=\"-webkit-touch-callout: none; -webkit-user-select: none;\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498221204', '1');
INSERT INTO `ask_conslist` VALUES ('275', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498222888', '1');
INSERT INTO `ask_conslist` VALUES ('276', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哥', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498222901', '1');
INSERT INTO `ask_conslist` VALUES ('277', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498223038', '1');
INSERT INTO `ask_conslist` VALUES ('278', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈喽聚聚', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498223114', '1');
INSERT INTO `ask_conslist` VALUES ('279', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '哦哦哦', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498275001', '1');
INSERT INTO `ask_conslist` VALUES ('280', 'Ask2017060917045779', null, null, null, null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1498275026', '2');
INSERT INTO `ask_conslist` VALUES ('281', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1498275049', '2');
INSERT INTO `ask_conslist` VALUES ('282', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1498275061', '2');
INSERT INTO `ask_conslist` VALUES ('283', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '<img src=\"images/24.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498275630', '1');
INSERT INTO `ask_conslist` VALUES ('284', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦咯啦咯啦咯', '1498275903', '2');
INSERT INTO `ask_conslist` VALUES ('285', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啊啊啊', '1498275907', '2');
INSERT INTO `ask_conslist` VALUES ('286', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '<img src=\"images/21.gif\"><img src=\"images/33.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498277105', '1');
INSERT INTO `ask_conslist` VALUES ('287', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '啦啦啦', '1498278293', '2');
INSERT INTO `ask_conslist` VALUES ('288', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '噢噢噢哦哦', '1498278303', '2');
INSERT INTO `ask_conslist` VALUES ('289', 'Ask2017062019362172', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '哈哈哈', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498441316', '1');
INSERT INTO `ask_conslist` VALUES ('290', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐～', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', null, 'c500928716b50c07534f4f8f49a345adfc8664cd', '葛璐', 'http://api.shoumeikeji.cn/picture/14985505708637.jpg', '<img src=\"images/65.gif\"><img src=\"images/36.gif\">', '1498557363', '2');
INSERT INTO `ask_conslist` VALUES ('291', '2017060917043597', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '111', '1498892178', '2');
INSERT INTO `ask_conslist` VALUES ('292', '2017060917043597', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '11111', '1498892185', '2');
INSERT INTO `ask_conslist` VALUES ('293', '2017060917043597', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '111', '1498892197', '2');
INSERT INTO `ask_conslist` VALUES ('294', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江哥', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '<img src=\"images/34.gif\">', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1498992557', '1');
INSERT INTO `ask_conslist` VALUES ('295', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '吧VB你把你吧二本', '1499418412', '2');
INSERT INTO `ask_conslist` VALUES ('296', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '23123', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1499418420', '1');
INSERT INTO `ask_conslist` VALUES ('297', 'Ask2017060917045779', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', null, 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', 'VC吧分VB发的vgfdxdsf&nbsp;<div>】‘</div><div><br></div><div><br><br></div><div>是多少存在</div><div>撒地方色反而</div><div>放大后不符合</div><div>小GV发的GV</div><div><br></div>', '1499418439', '2');
INSERT INTO `ask_conslist` VALUES ('298', 'Ask2017070716238885', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '句号。', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG6ZkDXfRNGLiaXjWC1NdzBSYOOEdDzNNiakw88icicWJBFRWs0jAFBpXVNZaiaEnS1pYBPUnKNDJnbTs9/0', null, '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '爱样', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '你就', '1499418542', '2');
INSERT INTO `ask_conslist` VALUES ('299', 'Ask2017070716238885', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '句号。', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG6ZkDXfRNGLiaXjWC1NdzBSYOOEdDzNNiakw88icicWJBFRWs0jAFBpXVNZaiaEnS1pYBPUnKNDJnbTs9/0', null, '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '爱样', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '图咯啦有业务', '1499418547', '2');
INSERT INTO `ask_conslist` VALUES ('300', 'Ask2017070716238885', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '句号。', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG6ZkDXfRNGLiaXjWC1NdzBSYOOEdDzNNiakw88icicWJBFRWs0jAFBpXVNZaiaEnS1pYBPUnKNDJnbTs9/0', '头像咋这样', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '爱样', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', null, '1499418579', '1');
INSERT INTO `ask_conslist` VALUES ('301', 'Ask2017070716238885', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '句号。', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG6ZkDXfRNGLiaXjWC1NdzBSYOOEdDzNNiakw88icicWJBFRWs0jAFBpXVNZaiaEnS1pYBPUnKNDJnbTs9/0', null, '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '爱样', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '刘浩宇的头像', '1499418597', '2');
INSERT INTO `ask_conslist` VALUES ('302', 'Ask2017070716238885', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '句号。', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG6ZkDXfRNGLiaXjWC1NdzBSYOOEdDzNNiakw88icicWJBFRWs0jAFBpXVNZaiaEnS1pYBPUnKNDJnbTs9/0', null, '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '爱样', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '认证了营养师', '1499418611', '2');
INSERT INTO `ask_conslist` VALUES ('303', 'Ask2017070716238885', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '句号。', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG6ZkDXfRNGLiaXjWC1NdzBSYOOEdDzNNiakw88icicWJBFRWs0jAFBpXVNZaiaEnS1pYBPUnKNDJnbTs9/0', '图有问题', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '爱样', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', null, '1499418620', '1');
INSERT INTO `ask_conslist` VALUES ('304', 'Ask2017070716238885', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '句号。', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG6ZkDXfRNGLiaXjWC1NdzBSYOOEdDzNNiakw88icicWJBFRWs0jAFBpXVNZaiaEnS1pYBPUnKNDJnbTs9/0', null, '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '爱样', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '嗯是的', '1499418639', '2');
INSERT INTO `ask_conslist` VALUES ('305', 'Ask2017070220003600', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '爱样@阿海', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '哦看看咯哦', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1499504961', '1');
INSERT INTO `ask_conslist` VALUES ('306', 'Ask2017070220003600', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '爱样@阿海', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '啦啦啦咯啦', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', null, '1499504970', '1');

-- ----------------------------
-- Table structure for ask_consult
-- ----------------------------
DROP TABLE IF EXISTS `ask_consult`;
CREATE TABLE `ask_consult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atoken` varchar(255) DEFAULT NULL COMMENT '聊天列表标识符',
  `dietitian` varchar(255) DEFAULT NULL COMMENT '被提问者',
  `dietitian_img` varchar(255) DEFAULT NULL,
  `dietitian_name` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL COMMENT '提问者',
  `token_img` varchar(255) DEFAULT NULL,
  `token_name` varchar(255) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '是否查看 1 未看 2 看过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ask_consult
-- ----------------------------
INSERT INTO `ask_consult` VALUES ('47', 'Ask2017060917045779', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14958748252148.jpg', '李淑君', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14958754402615.jpg', '周长江', '1496999084', null);
INSERT INTO `ask_consult` VALUES ('48', 'Ask2017062019362172', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14958748252148.jpg', '李淑君', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '璐～', '1497958574', null);
INSERT INTO `ask_consult` VALUES ('49', 'Ask2017062718364082', '7f2b33c54a1cf1805d0f2e449332add59d863e46', 'http://api.shoumeikeji.cn/picture/14985457749710.jpg', '陈正義', 'e970ef250c37356236dd9338e12752d3c1673093', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUv4ZAaydmQDybfQj2oUV0lTx0ibP0nBvlXYjtXicS0ibBHnoboAHaSzqB4JWm9U8Yw0XzcTd01VO1ViblVSlO6bhrX/0', '爱样', '1498559812', null);
INSERT INTO `ask_consult` VALUES ('50', 'Ask2017070220003600', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', '1498996848', null);
INSERT INTO `ask_consult` VALUES ('51', 'Ask2017070220029115', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', 'e970ef250c37356236dd9338e12752d3c1673093', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUv4ZAaydmQDybfQj2oUV0lTx0ibP0nBvlXYjtXicS0ibBHnoboAHaSzqB4JWm9U8Yw0XzcTd01VO1ViblVSlO6bhrX/0', '爱样', '1498996964', null);
INSERT INTO `ask_consult` VALUES ('52', 'Ask2017070716238885', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '爱样', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK5VUdVVVQIwIYeDHuWzIJZJDR5uU32mNOxmjlWtRz1bNcUsEff0Ve9CCBCEXDHZUnvz9nerJtOTngGIJHFecJhXM94kzVWrxk/0', '句号。', '1499415814', null);
INSERT INTO `ask_consult` VALUES ('53', 'Ask2017070716275940', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '爱样', '81fc18ecac44ec9ebaab056b236a8159f007f40f', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg5dAm2dc9DR3icwETxicpjDXehib9h3MtFUXbN9vuM0eGVRbCnWPZ9uTrnicbmib7mY6Fuyz7ZMyw1Vqy/0', '漂亮野记', '1499416030', null);

-- ----------------------------
-- Table structure for ask_list
-- ----------------------------
DROP TABLE IF EXISTS `ask_list`;
CREATE TABLE `ask_list` (
  `id` bigint(23) unsigned NOT NULL AUTO_INCREMENT,
  `asktoken` varchar(255) DEFAULT NULL COMMENT '问答标识',
  `price` int(11) DEFAULT '100' COMMENT '金额',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `token_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `token_name` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `dietitian` varchar(255) DEFAULT NULL COMMENT '营养师标识',
  `dietitian_img` varchar(255) DEFAULT NULL COMMENT '营养师免冠照片',
  `dietitian_name` varchar(255) DEFAULT NULL COMMENT '营养师名称',
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `grade` varchar(255) DEFAULT NULL COMMENT '营养师级别',
  `type` int(11) DEFAULT NULL COMMENT '1:回答 2：未回答',
  `txt` varchar(255) DEFAULT NULL COMMENT '问题内容',
  `num` int(11) DEFAULT '0' COMMENT '收听人数',
  `cid` int(11) DEFAULT NULL COMMENT '营养分类ID',
  `seconds` int(11) DEFAULT NULL COMMENT '录音秒数',
  `asktime` varchar(255) DEFAULT NULL COMMENT '回答时间',
  `askurl` varchar(255) DEFAULT NULL COMMENT '营养师语音回答',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '提问订单',
  `status` int(11) DEFAULT NULL COMMENT '订单状态 1 提交订单 2 完成支付 ',
  `paytime` varchar(255) DEFAULT NULL COMMENT '确认支付时间',
  `third` varchar(255) DEFAULT NULL COMMENT '第三方订单号',
  `state` int(11) DEFAULT NULL COMMENT '状态1：普通提问，2：营养师一对一提问，3：重复回答',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ask_list
-- ----------------------------
INSERT INTO `ask_list` VALUES ('512', 'Ask201705231729530', '100', '1495531764', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '1', '我长期坐着肚子长了很多肉，我该怎么减肥呀', '0', '20', '34', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052317462921.mp3', '201705231729249392', '2', '1495531779', 'wx20170523172926f3225ff4930805484598', '1');
INSERT INTO `ask_list` VALUES ('514', 'Ask201705231739973', '2000', '1495532361', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '1', '我老婆产后发胖该怎么减肥，', '2', '1', '43', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052318112084.mp3', '201705231739211006', '2', '1495532372', 'wx2017052317392305a0f446c80667073737', '2');
INSERT INTO `ask_list` VALUES ('519', 'Ask201705231943947', '100', '1495539808', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', '7f2b33c54a1cf1805d0f2e449332add59d863e46', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', '陈正義', '清华大学', 'ACI国际注册营养师', '1', '最近加班太累，想参加锻炼，请推荐下，我该怎么锻炼', '3', '20', '14', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052319442543.mp3', '201705231943289057', '2', '1495539824', 'wx201705231943309c564cfdf30086583116', '1');
INSERT INTO `ask_list` VALUES ('520', 'Ask201705231954640', '990', '1495540440', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', '7f2b33c54a1cf1805d0f2e449332add59d863e46', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', '陈正義', '清华大学', 'ACI国际注册营养师', '1', '运动完晚上睡觉容易腿抽筋，是怎么回事', '1', '20', '6', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052319543353.mp3', '201705231954009944', '2', '1495540451', 'wx201705231954020daf8cd8910406503890', '1');
INSERT INTO `ask_list` VALUES ('524', 'Ask201705232042308', '100', '1495543345', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', '7f2b33c54a1cf1805d0f2e449332add59d863e46', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', '陈正義', '清华大学', 'ACI国际注册营养师', '1', '运动前拉伸好，还是运动后拉伸好？', '1', '20', '23', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052320432989.mp3', '201705232042256251', '2', '1495543358', 'wx20170523204227ea6797065b0777643874', '1');
INSERT INTO `ask_list` VALUES ('527', 'Ask201705232113428', '100', '1495545224', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', '7f2b33c54a1cf1805d0f2e449332add59d863e46', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', '陈正義', '清华大学', 'ACI国际注册营养师', '1', '运动后能立即喝水吗？', '1', '20', '20', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052321142767.mp3', '201705232113445324', '2', '1495545237', 'wx20170523211346cf0ab6ccd40592949811', '1');
INSERT INTO `ask_list` VALUES ('529', 'Ask201705232122348', '100', '1495545768', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', '7f2b33c54a1cf1805d0f2e449332add59d863e46', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', '陈正義', '清华大学', 'ACI国际注册营养师', '1', '我低血糖，能大量运动吗？', '3', '20', '18', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052321234349.mp3', '201705232122484370', '2', '1495545781', 'wx20170523212249d3b1afc1090047319415', '1');
INSERT INTO `ask_list` VALUES ('530', 'Ask201705232137344', '100', '1495546652', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', '7f2b33c54a1cf1805d0f2e449332add59d863e46', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', '陈正義', '清华大学', 'ACI国际注册营养师', '1', '剧烈运动对身体有影响吗？？', '2', '20', '23', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052321385171.mp3', '201705232137325565', '2', '1495546666', 'wx20170523213733602d49cb040505426494', '2');
INSERT INTO `ask_list` VALUES ('536', 'Ask201705261341959', '100', '1495777288', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '张璐', '清华大学', '一级公共营养师', '1', '最近营养跟不上，有点憔悴，怎么整', '4', '1', '7', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052613423286.mp3', '201705261341281325', '2', '1495777314', 'wx20170526134130b3ddd9a1160055411316', '1');
INSERT INTO `ask_list` VALUES ('537', 'Ask201705261455382', '100', '1495781705', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '张璐', '清华大学', '一级公共营养师', '1', '想快速瘦身，怎么解决', '1', '3', '12', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052614565075.mp3', '201705261455055413', '2', '1495781716', 'wx20170526145506ab700bb2b40598157858', '1');
INSERT INTO `ask_list` VALUES ('538', 'Ask201705261507333', '1100', '1495782454', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '张璐', '清华大学', '一级公共营养师', '1', '怎样能快速减肥呢，麻烦推荐下', '5', '1', '8', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052615083663.mp3', '201705261507347657', '2', '1495782471', 'wx201705261507364980ccb2b30099881902', '1');
INSERT INTO `ask_list` VALUES ('540', 'Ask201705261805193', '100', '1495793153', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '1', '我有点胖，我想快速减肥，', '3', '1', '20', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052618131281.mp3', '201705261805531317', '2', '1495793167', 'wx201705261805554bf1cc794b0477432744', '2');
INSERT INTO `ask_list` VALUES ('559', 'Ask201705261823186', '100', '1495794238', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '1', '我想速度减肥，', '1', '20', '19', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052618311899.mp3', '201705261823584632', '2', '1495794249', 'wx2017052618240037498cbbfc0151443766', '1');
INSERT INTO `ask_list` VALUES ('561', 'Ask201705261834759', '100', '1495794886', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834465279', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('562', 'Ask201705261834533', '100', '1495794887', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834473522', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('563', 'Ask201705261834636', '100', '1495794887', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834472369', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('564', 'Ask201705261834931', '100', '1495794887', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834473600', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('565', 'Ask201705261834115', '100', '1495794887', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834473444', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('566', 'Ask201705261834609', '100', '1495794887', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834479917', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('567', 'Ask201705261834696', '100', '1495794887', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834474483', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('568', 'Ask201705261834643', '100', '1495794887', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834473750', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('569', 'Ask201705261834433', '100', '1495794888', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834485677', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('570', 'Ask201705261834327', '100', '1495794888', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834484694', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('571', 'Ask201705261834728', '100', '1495794888', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834482618', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('572', 'Ask201705261834597', '100', '1495794888', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834481675', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('573', 'Ask201705261834464', '100', '1495794888', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834489085', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('574', 'Ask201705261834135', '100', '1495794888', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834489014', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('575', 'Ask201705261834589', '100', '1495794888', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834486942', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('576', 'Ask201705261834427', '100', '1495794889', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', null, null, null, null, null, '2', '咯啦咯看监', '0', '3', null, null, null, '201705261834496827', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('578', 'Ask201705261835830', '100', '1495794914', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835148863', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('579', 'Ask201705261835387', '100', '1495794914', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835143129', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('580', 'Ask201705261835836', '100', '1495794914', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835143851', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('581', 'Ask201705261835781', '100', '1495794914', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835149399', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('582', 'Ask201705261835322', '100', '1495794914', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835144426', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('583', 'Ask201705261835912', '100', '1495794914', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835147437', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('584', 'Ask201705261835516', '100', '1495794915', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835155731', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('585', 'Ask201705261835950', '100', '1495794915', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835159610', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('586', 'Ask201705261835190', '100', '1495794915', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835154628', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('587', 'Ask201705261835374', '100', '1495794915', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', null, null, null, null, null, '2', '啦啦啦啦', '0', '3', null, null, null, '201705261835157515', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('589', 'Ask201705261835829', '100', '1495794946', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', null, null, null, null, null, '2', '啦啦啦', '0', '1', null, null, null, '201705261835463789', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('590', 'Ask201705261835737', '100', '1495794946', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', null, null, null, null, null, '2', '啦啦啦', '0', '1', null, null, null, '201705261835462832', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('591', 'Ask201705261835667', '100', '1495794946', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', null, null, null, null, null, '2', '啦啦啦', '0', '1', null, null, null, '201705261835465235', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('593', 'Ask201705261838428', '100', '1495795127', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', null, null, null, null, null, '2', '最近身体状况不好，体寒，是什么原因', '0', '3', null, null, null, '201705261838478265', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('594', 'Ask201705261838948', '100', '1495795127', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', null, null, null, null, null, '2', '最近身体状况不好，体寒，是什么原因', '0', '3', null, null, null, '201705261838479156', '1', null, null, '1');
INSERT INTO `ask_list` VALUES ('625', 'Ask201705261847631', '100', '1495795629', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '1', '怎样才能快速增胖', '1', '2', '7', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052618485097.mp3', '201705261847095628', '2', '1495795647', 'wx20170526184710ab20d3919a0355511961', '1');
INSERT INTO `ask_list` VALUES ('676', 'Ask201705271136776', '100', '1495856181', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '张璐', '清华大学', '一级公共营养师', '1', '运动健身拉伸伤了身体，怎么修养', '2', '20', '0', null, '', '201705271136214479', '2', '1495856194', 'wx20170527113623b147a1a4970787047299', '1');
INSERT INTO `ask_list` VALUES ('677', 'Ask201705271141207', '1100', '1495856475', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', '张璐', '清华大学', '一级公共营养师', '1', '运动完能直接休息吗？？', '1', '1', '27', null, 'http://opq1i9mlg.bkt.clouddn.com/2017052711421183.mp3', '201705271141158988', '2', '1495856487', 'wx201705271141163e42c80e3c0850930419', '1');
INSERT INTO `ask_list` VALUES ('678', 'Ask201706071714727', '100', '1496826880', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '1', '我最近胃口不好，应该怎么调理', '0', '1', '19', null, 'http://opq1i9mlg.bkt.clouddn.com/2017060717185175.mp3', '201706071714406782', '2', '1496826892', 'wx2017060717144130b5d411810060021454', '2');
INSERT INTO `ask_list` VALUES ('681', 'Ask201706211050525', '100', '1498013423', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '爱样', '北京大学（硕士）', '二级公共营养师', '1', '天气热了，宝宝最近老是挑食，胃口也不好。', '0', '2', '34', null, 'http://opq1i9mlg.bkt.clouddn.com/2017062112002482.mp3', '201706211050233137', '2', '1498013431', 'wx20170621105024bff10da2100387382958', '2');
INSERT INTO `ask_list` VALUES ('686', 'Ask201706241725645', '100', '1498296322', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '爱样', '北京大学（硕士）', '二级公共营养师', '1', '孕期呕吐很严重，胃口也不好', '0', '2', '1', null, 'http://opq1i9mlg.bkt.clouddn.com/2017062715265364.mp3', '201706241725226465', '2', '1498296329', 'wx2017062417252318b9fdd82f0043123258', '2');
INSERT INTO `ask_list` VALUES ('688', 'Ask201706261737756', '100', '1498469830', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'ed748cde5a37e9064e8cc511e80bacc945781a23', 'http://api.shoumeikeji.cn/picture/14958985189779.jpg', '于洋', '河北医科大学', '二级公共营养师', '1', '身体偏瘦，厌食，如何调理增肌增肥？', '0', '20', '3', null, 'http://opq1i9mlg.bkt.clouddn.com/2017062914382226.mp3', '201706261737101897', '2', '1498469842', 'wx20170626173710c8f289fc900242937003', '1');
INSERT INTO `ask_list` VALUES ('689', 'Ask201706271122823', '100', '1498533778', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '2', '我媳妇孕期害喜。该怎么补充营养', '0', '1', '5', '', 'http://opq1i9mlg.bkt.clouddn.com/2017070218050439.mp3', '201706271122584596', '2', '1498533788', 'wx201706271122582d338705ee0821774860', '2');
INSERT INTO `ask_list` VALUES ('690', 'Ask201706271409981', '1000', '1498543741', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '爱样', '北京大学（硕士）', '二级公共营养师', '1', '肠胃不好，最近脸色也不是很好，怎么回事', '0', '2', '2', null, 'http://opq1i9mlg.bkt.clouddn.com/2017062717204971.mp3', '201706271409012815', '2', '1498543749', 'wx20170627140901176abd88870529868619', '2');
INSERT INTO `ask_list` VALUES ('691', 'Ask201706291454240', '100', '1498719250', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '2', '我身体偏瘦，该怎么增加营养', '0', '20', '0', '', '', '201706291454109422', '2', '1498719261', 'wx2017062914541102d426aa960467312787', '2');
INSERT INTO `ask_list` VALUES ('693', 'Ask201706301054587', '100', '1498791258', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '2', '我身体偏瘦，该怎么增加营养', '0', '20', '7', null, 'http://opq1i9mlg.bkt.clouddn.com/2017070412035657.mp3', '201706301054183084', '2', '1498791268', 'wx20170630105419c911dbb76f0953779768', '2');
INSERT INTO `ask_list` VALUES ('694', 'Ask201706301055648', '100', '1498791309', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'c500928716b50c07534f4f8f49a345adfc8664cd', 'http://api.shoumeikeji.cn/picture/14985505708637.jpg', '葛璐', '北京中医药大学', '三级公共营养师', '2', '我很瘦，运动用缺氧，是不是缺乏什么营养', '0', '20', '0', '', '', '201706301055095461', '2', '1498791319', 'wx201706301055095c81c6b41d0290458224', '2');
INSERT INTO `ask_list` VALUES ('695', 'Ask201706301055649', '100', '1498791359', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', '2bdb2930a26213934d04f33c172342c31bf6c258', 'http://api.shoumeikeji.cn/picture/14962961413888.jpg', '杨松会', '北京大学', '一级公共营养师', '1', '我很瘦了，想运动，但是很累怎么补充营养', '0', '20', '29', null, 'http://opq1i9mlg.bkt.clouddn.com/2017070412423385.mp3', '201706301055594329', '2', '1498791366', 'wx20170630105559c7842ebd560257536459', '2');
INSERT INTO `ask_list` VALUES ('697', 'Ask201707021639931', '100', '1498984789', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '北京大学（研究生）', '一级公共营养师', '2', '怀孕期间应该补充那些营养？', '0', '1', '10', null, 'http://opq1i9mlg.bkt.clouddn.com/2017070517202220.mp3', '201707021639494540', '2', '1498791366', 'wx20170630105559c7842ebd560257536459', '2');
INSERT INTO `ask_list` VALUES ('702', 'Ask201707021643998', '100', '1498984988', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', '爱样', '北京大学（硕士）', '二级公共营养师', '2', '怀孕期间应该补充那些营养？。', '0', '1', '48', null, 'http://opq1i9mlg.bkt.clouddn.com/2017070413331388.mp3', '201707021643088497', '2', '1498791366', 'wx20170630105559c7842ebd560257536459', '2');
INSERT INTO `ask_list` VALUES ('703', 'Ask201707021643530', '100', '1498985004', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', '2bdb2930a26213934d04f33c172342c31bf6c258', 'http://api.shoumeikeji.cn/picture/14962961413888.jpg', '杨松会', '北京大学', '一级公共营养师', '1', '怀孕期间应该补充那些营养？', '1', '1', '19', null, 'http://opq1i9mlg.bkt.clouddn.com/2017070412380459.mp3', '201707021643244133', '2', '1498985015', 'wx20170702164324c91bea676c0772357423', '2');
INSERT INTO `ask_list` VALUES ('704', 'Ask201707041101765', '100', '1499137273', '661b61a6d3e2ac56f5ce42b11f3655faedccc7a5', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg3SsvntNQicO0dPmcyoibianqvYhnoyQEWk8ET2V5nwaJ2Du0N379kYz6wXWSNx1gQJhxkHRzeXrkRS/0', '沥', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', 'http://api.shoumeikeji.cn/picture/14966248318419.jpg', '叶凤娟', '承德医学院', '二级公共营养师', '1', '我家宝宝6个月这两天嗓子有痰 可以喝梨水么', '1', '2', '3', null, 'http://opq1i9mlg.bkt.clouddn.com/2017070411020964.mp3', '201707041101135926', '2', '1499137283', 'wx201707041101132e5acb86440250217323', '2');

-- ----------------------------
-- Table structure for ask_order
-- ----------------------------
DROP TABLE IF EXISTS `ask_order`;
CREATE TABLE `ask_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单号',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `asktoken` varchar(255) DEFAULT NULL COMMENT '问答标题',
  `ctime` varchar(255) DEFAULT NULL,
  `third` varchar(255) DEFAULT NULL COMMENT '第三方订单号',
  `status` int(11) DEFAULT NULL COMMENT '订单状态 1 提交订单 2 完成支付 3 发货 4 确认收货',
  `price` int(11) DEFAULT NULL COMMENT '金额',
  `paytime` varchar(255) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ask_order
-- ----------------------------
INSERT INTO `ask_order` VALUES ('215', '201705231822044856', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'Ask201705231739973', '1495534924', 'wx20170523182206a27cf89b520208135753', '2', '1', '1495534936');
INSERT INTO `ask_order` VALUES ('217', '201705231933304840', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', 'Ask201705231729530', '1495539210', 'wx201705231933325cd9221f820089022632', '1', '1', null);
INSERT INTO `ask_order` VALUES ('219', '201705231933413413', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', 'Ask201705231739973', '1495539221', 'wx20170523193343ca9e8c96c20126481152', '1', '1', null);
INSERT INTO `ask_order` VALUES ('222', '201705231947155181', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'Ask201705231943947', '1495540035', 'wx201705231947179d0dd680320924909501', '2', '1', '1495540046');
INSERT INTO `ask_order` VALUES ('223', '201705231947262340', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'Ask201705231943947', '1495540046', 'wx201705231947272b8d66a4650189275491', '1', '1', null);
INSERT INTO `ask_order` VALUES ('224', '201705231948098396', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'Ask201705231943947', '1495540089', 'wx201705231948116fc6c578ca0288467633', '2', '1', '1495540101');
INSERT INTO `ask_order` VALUES ('228', '201705232045037324', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705232042308', '1495543503', 'wx2017052320450326a5e0f0a20530229314', '2', '100', '1495543517');
INSERT INTO `ask_order` VALUES ('229', '201705232124384232', 'e970ef250c37356236dd9338e12752d3c1673093', 'Ask201705232122348', '1495545878', 'wx2017052321243929cbbbb4200510368557', '2', '100', '1495545889');
INSERT INTO `ask_order` VALUES ('231', '201705232128363789', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232122348', '1495546116', 'wx2017052321283687d90ef2a80765584710', '2', '100', '1495546137');
INSERT INTO `ask_order` VALUES ('232', '201705232143132368', 'e970ef250c37356236dd9338e12752d3c1673093', 'Ask201705232137344', '1495546993', 'wx201705232143158f217d82740190338052', '2', '100', '1495547022');
INSERT INTO `ask_order` VALUES ('233', '201705232143429318', 'e970ef250c37356236dd9338e12752d3c1673093', 'Ask201705232137344', '1495547022', 'wx20170523214344f34f5896170344297345', '1', '100', null);
INSERT INTO `ask_order` VALUES ('248', '201705252200187990', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'Ask201705231739973', '1495720818', 'wx201705252200208e9d7cd6d20397804487', '1', '100', null);
INSERT INTO `ask_order` VALUES ('249', '201705252200195590', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'Ask201705231739973', '1495720819', 'wx201705252200208e9d7cd6d20350166682', '1', '100', null);
INSERT INTO `ask_order` VALUES ('260', '201705261357049339', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261341959', '1495778224', 'wx201705261357062809614b390649660935', '2', '100', '1495778236');
INSERT INTO `ask_order` VALUES ('261', '201705261503084304', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261455382', '1495782188', 'wx20170526150309e5b23e66880035375251', '2', '100', '1495782205');
INSERT INTO `ask_order` VALUES ('380', '201705261833347222', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'Ask201705261805193', '1495794814', 'wx20170526183336a2e3194a950676231580', '1', '100', null);
INSERT INTO `ask_order` VALUES ('381', '201705261833494812', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'Ask201705261805193', '1495794829', 'wx20170526183351e6eccd61840348377517', '2', '100', '1495794843');
INSERT INTO `ask_order` VALUES ('382', '201705261834046032', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'Ask201705261805193', '1495794844', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('383', '201705261836044052', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495794964', 'wx20170526183605c033dc71a60747694977', '1', '100', null);
INSERT INTO `ask_order` VALUES ('384', '201705261836045441', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495794964', 'wx201705261836064c99a9e6080970471304', '1', '100', null);
INSERT INTO `ask_order` VALUES ('385', '201705261836099358', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495794969', 'wx201705261836115fe8911b960975991514', '1', '100', null);
INSERT INTO `ask_order` VALUES ('386', '201705261836107483', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495794970', 'wx201705261836115fe8911b960083034210', '1', '100', null);
INSERT INTO `ask_order` VALUES ('387', '201705261836104498', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495794970', 'wx201705261836115fe8911b960008801763', '1', '100', null);
INSERT INTO `ask_order` VALUES ('388', '201705261841422489', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495795302', 'wx2017052618414364985bc6030667818704', '1', '100', null);
INSERT INTO `ask_order` VALUES ('389', '201705261841448745', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495795304', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('390', '201705261841452374', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495795305', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('391', '201705261841459326', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495795305', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('392', '201705261841509313', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495795310', 'wx20170526184152a23af3f5260611197183', '1', '100', null);
INSERT INTO `ask_order` VALUES ('393', '201705261841505056', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495795310', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('394', '201705261841509882', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495795310', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('395', '201705261841501588', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495795310', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('398', '201705261842046038', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1495795324', 'wx201705261842061e3215e05c0396743023', '1', '110', null);
INSERT INTO `ask_order` VALUES ('399', '201705261849233224', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261847631', '1495795763', 'wx20170526184925f9b890b9c90928420663', '2', '100', '1495795777');
INSERT INTO `ask_order` VALUES ('400', '201705261858191057', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796299', 'wx20170526185821634823a6ac0097169818', '1', '110', null);
INSERT INTO `ask_order` VALUES ('401', '201705261858328621', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796312', 'wx20170526185834fe8c03209d0372379365', '1', '110', null);
INSERT INTO `ask_order` VALUES ('402', '201705261858324515', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796312', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('403', '201705261858333668', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796313', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('404', '201705261858331727', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796313', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('405', '201705261858339252', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796313', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('406', '201705261858339061', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796313', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('407', '201705261858473669', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796327', 'wx20170526185847d2f82c8b120063293812', '1', '110', null);
INSERT INTO `ask_order` VALUES ('408', '201705261858476170', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796327', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('409', '201705261858471082', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796327', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('410', '201705261858474169', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796327', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('411', '201705261858486490', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796328', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('412', '201705261859122683', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495796352', 'wx20170526185914c5e8f25dc20411923839', '1', '110', null);
INSERT INTO `ask_order` VALUES ('413', '201705261859369144', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796376', 'wx20170526185936fd343f78950861513641', '1', '100', null);
INSERT INTO `ask_order` VALUES ('414', '201705261859365873', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796376', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('415', '201705261859365316', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796376', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('417', '201705261859403267', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1495796380', 'wx20170526185942fef51648650831141682', '1', '110', null);
INSERT INTO `ask_order` VALUES ('418', '201705261859418591', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1495796381', 'wx20170526185942fef51648650119249661', '1', '110', null);
INSERT INTO `ask_order` VALUES ('420', '201705261859475518', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1495796387', 'wx20170526185949c9685555a50086739377', '1', '110', null);
INSERT INTO `ask_order` VALUES ('421', '201705261859554581', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1495796395', 'wx201705261859563ec86ffd5f0722319692', '1', '100', null);
INSERT INTO `ask_order` VALUES ('422', '201705261859553805', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1495796395', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('423', '201705261900012025', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1495796401', 'wx201705261900028904fb0e9b0801875684', '1', '200', null);
INSERT INTO `ask_order` VALUES ('424', '201705261900017008', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1495796401', null, '1', '200', null);
INSERT INTO `ask_order` VALUES ('425', '201705261900021919', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1495796402', null, '1', '200', null);
INSERT INTO `ask_order` VALUES ('426', '201705261900066487', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796406', 'wx20170526190008ca0325ac360962767525', '1', '100', null);
INSERT INTO `ask_order` VALUES ('427', '201705261900068711', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796406', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('429', '201705261900121235', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1495796412', 'wx201705261900135a6b287cf10133261688', '1', '110', null);
INSERT INTO `ask_order` VALUES ('430', '201705261900121615', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1495796412', 'wx2017052619001461c306c8ef0089016685', '1', '110', null);
INSERT INTO `ask_order` VALUES ('431', '201705261900125041', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1495796412', 'wx2017052619001461c306c8ef0416816488', '1', '110', null);
INSERT INTO `ask_order` VALUES ('432', '201705261900181453', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1495796418', 'wx20170526190020d7a94d2f1f0902028641', '1', '100', null);
INSERT INTO `ask_order` VALUES ('433', '201705261900184834', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1495796418', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('434', '201705261900199071', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1495796419', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('435', '201705261900258323', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1495796425', 'wx201705261900269dc2bf0d6d0423237394', '1', '200', null);
INSERT INTO `ask_order` VALUES ('436', '201705261900252599', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1495796425', null, '1', '200', null);
INSERT INTO `ask_order` VALUES ('437', '201705261900259218', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1495796425', null, '1', '200', null);
INSERT INTO `ask_order` VALUES ('438', '201705261900259931', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1495796425', null, '1', '200', null);
INSERT INTO `ask_order` VALUES ('439', '201705261900303312', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796430', 'wx2017052619003152ac8ae1dc0625203462', '1', '100', null);
INSERT INTO `ask_order` VALUES ('440', '201705261900318009', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796431', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('441', '201705261900315301', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796431', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('442', '201705261900368232', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1495796436', 'wx2017052619003702a0baad9a0379285600', '1', '100', null);
INSERT INTO `ask_order` VALUES ('443', '201705261900379281', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1495796437', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('444', '201705261900377002', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1495796437', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('445', '201705261901104970', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796470', 'wx2017052619011282845f25e00923133130', '1', '100', null);
INSERT INTO `ask_order` VALUES ('446', '201705261901118589', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495796471', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('447', '201705261927152609', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495798035', 'wx2017052619271757e92bcdc20378684357', '1', '100', null);
INSERT INTO `ask_order` VALUES ('448', '201705271123457073', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855425', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('449', '201705271123474479', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855427', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('450', '201705271123479633', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855427', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('451', '201705271123471765', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855427', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('452', '201705271123472967', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855427', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('453', '201705271123477698', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855427', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('454', '201705271123488876', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855428', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('455', '201705271123485141', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855428', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('456', '201705271123527222', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855432', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('457', '201705271123521989', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855432', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('458', '201705271124113231', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855451', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('459', '201705271124112687', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855451', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('460', '201705271124114276', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855451', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('461', '201705271124118205', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855451', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('462', '201705271124119188', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855451', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('463', '201705271124112959', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855451', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('464', '201705271124156098', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855455', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('465', '201705271124188742', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855458', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('466', '201705271124222368', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855462', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('467', '201705271124439475', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855483', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('468', '201705271124454824', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855485', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('469', '201705271124454027', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855485', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('470', '201705271124496233', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855489', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('471', '201705271124514598', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855491', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('472', '201705271124535078', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855493', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('473', '201705271124536633', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855493', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('474', '201705271125054021', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855505', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('475', '201705271125068466', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855506', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('476', '201705271125066245', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855506', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('477', '201705271125072539', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855507', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('478', '201705271125076748', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855507', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('479', '201705271125078814', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855507', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('480', '201705271125078327', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855507', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('481', '201705271125086843', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855508', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('482', '201705271125085236', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855508', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('483', '201705271125082150', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855508', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('484', '201705271125165678', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855516', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('485', '201705271125161227', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855516', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('486', '201705271125163181', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855516', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('487', '201705271125163637', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855516', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('488', '201705271125166722', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855516', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('489', '201705271125176266', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855517', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('490', '201705271125172161', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855517', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('491', '201705271125176984', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855517', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('492', '201705271125176853', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855517', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('493', '201705271125481246', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232113428', '1495855548', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('494', '201705271125593374', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855559', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('495', '201705271126053145', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855565', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('496', '201705271126094960', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855569', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('497', '201705271126259592', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1495855585', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('498', '201705271126369339', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855596', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('499', '201705271126412813', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855601', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('500', '201705271126471870', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232113428', '1495855607', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('501', '201705271126501799', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855610', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('502', '201705271126531276', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855613', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('503', '201705271127033403', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855623', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('504', '201705271127081195', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231954640', '1495855628', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('505', '201705271127153615', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855635', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('506', '201705271127211485', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855641', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('507', '201705271127227372', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855642', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('508', '201705271127221245', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855642', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('509', '201705271127235223', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855643', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('510', '201705271127235209', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855643', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('511', '201705271127235296', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855643', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('512', '201705271127236831', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855643', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('513', '201705271127248825', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855644', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('514', '201705271127242867', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855644', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('515', '201705271127246296', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855644', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('516', '201705271127288438', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855648', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('517', '201705271127294912', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855649', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('518', '201705271127291750', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855649', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('519', '201705271127292703', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855649', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('520', '201705271127301754', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855650', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('521', '201705271127309704', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855650', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('522', '201705271127303485', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855650', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('523', '201705271127306473', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855650', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('524', '201705271127336239', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855653', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('525', '201705271127332386', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855653', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('526', '201705271127338840', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855653', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('527', '201705271127334205', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855653', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('528', '201705271127333509', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855653', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('529', '201705271127337678', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705261507333', '1495855653', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('530', '201705271127353809', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232113428', '1495855655', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('531', '201705271128401270', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855720', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('532', '201705271128415729', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855721', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('533', '201705271128437745', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855723', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('534', '201705271128439799', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855723', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('535', '201705271128438532', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855723', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('536', '201705271128439700', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855723', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('537', '201705271128449787', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855724', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('538', '201705271128452861', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855725', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('539', '201705271128458629', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855725', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('540', '201705271128452352', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855725', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('541', '201705271128456486', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855725', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('542', '201705271128458739', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855725', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('543', '201705271128494694', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855729', 'wx20170527112851dcfd0668040054559109', '1', '100', null);
INSERT INTO `ask_order` VALUES ('544', '201705271128495726', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855729', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('545', '201705271128507084', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855730', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('546', '201705271128514855', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855731', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('547', '201705271128515715', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855731', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('548', '201705271128528994', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855732', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('549', '201705271129026378', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855742', 'wx2017052711290449cf94e6730313212584', '1', '100', null);
INSERT INTO `ask_order` VALUES ('550', '201705271129029429', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855742', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('551', '201705271129035190', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855743', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('552', '201705271129033593', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855743', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('553', '201705271129036768', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855743', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('554', '201705271129038487', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855743', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('555', '201705271129038315', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855743', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('556', '201705271129031027', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855743', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('557', '201705271129049373', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855744', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('558', '201705271129044843', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855744', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('559', '201705271129043905', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855744', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('560', '201705271129045979', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232137344', '1495855744', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('561', '201705271129242933', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855764', 'wx20170527112926eb00bd45f40051975403', '1', '100', null);
INSERT INTO `ask_order` VALUES ('562', '201705271129247813', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855764', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('563', '201705271129258491', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855765', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('564', '201705271129364285', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855776', 'wx20170527112938eaaa986f470766634478', '1', '100', null);
INSERT INTO `ask_order` VALUES ('565', '201705271129364904', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855776', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('566', '201705271129376835', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855777', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('567', '201705271129379628', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855777', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('568', '201705271129375143', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855777', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('569', '201705271129387415', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855778', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('570', '201705271129382085', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495855778', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('571', '201705271138313489', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271136776', '1495856311', 'wx20170527113832027d3aeb850527827095', '1', '100', null);
INSERT INTO `ask_order` VALUES ('572', '201705271138318511', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271136776', '1495856311', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('573', '201705271138315180', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271136776', '1495856311', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('574', '201705271138317665', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271136776', '1495856311', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('575', '201705271138403764', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271136776', '1495856320', 'wx20170527113841492c49483f0041190748', '2', '100', '1495856336');
INSERT INTO `ask_order` VALUES ('576', '201705271138402293', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271136776', '1495856320', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('577', '201705271138403364', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271136776', '1495856320', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('578', '201705271143227108', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271141207', '1495856602', 'wx20170527114324597b699df10313849730', '2', '110', '1495856624');
INSERT INTO `ask_order` VALUES ('579', '201705271143222258', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271141207', '1495856602', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('580', '201705271143225213', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705271141207', '1495856602', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('581', '201705271149436970', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705271141207', '1495856983', 'wx20170527114945bbe8e664e60246608794', '1', '110', null);
INSERT INTO `ask_order` VALUES ('582', '201705271149577033', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705271141207', '1495856997', 'wx20170527114959beb8ed01690829771754', '1', '110', null);
INSERT INTO `ask_order` VALUES ('583', '201705281259186517', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495947558', 'wx20170528125920464f7e88520496675635', '2', '100', '1495947568');
INSERT INTO `ask_order` VALUES ('584', '201705281259287105', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261805193', '1495947568', null, '1', '100', null);
INSERT INTO `ask_order` VALUES ('585', '201705282147066648', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705271136776', '1495979226', 'wx2017052821470879738772a30366659674', '2', '100', '1495979241');
INSERT INTO `ask_order` VALUES ('586', '201705282147306066', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705271141207', '1495979250', 'wx2017052821473276fecaa4350368599193', '1', '110', null);
INSERT INTO `ask_order` VALUES ('587', '201705290821417918', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1496017301', 'wx20170529082143fbecdab7f50558274908', '2', '110', '1496017311');
INSERT INTO `ask_order` VALUES ('588', '201705290821512361', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261507333', '1496017311', null, '1', '110', null);
INSERT INTO `ask_order` VALUES ('589', '201705301623186656', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1496132598', 'wx201705301623201f097b22ed0709042953', '2', '200', '1496132610');
INSERT INTO `ask_order` VALUES ('590', '201705301623291239', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231739973', '1496132609', null, '1', '200', null);
INSERT INTO `ask_order` VALUES ('591', '201706010910281566', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705232137344', '1496279428', 'wx20170601091030746038d84b0292070336', '2', '100', '1496279439');
INSERT INTO `ask_order` VALUES ('592', '201706020949076554', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705232113428', '1496368147', 'wx20170602094908dc34b5a0900648212099', '2', '100', '1496368154');
INSERT INTO `ask_order` VALUES ('593', '201706041103402198', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261823186', '1496545420', 'wx20170604110342348f8afe250108579464', '2', '100', '1496545429');
INSERT INTO `ask_order` VALUES ('594', '201706051920555401', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705231954640', '1496661655', 'wx20170605192057d01e9836dc0271844067', '2', '100', '1496661664');
INSERT INTO `ask_order` VALUES ('595', '201706060620052409', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261341959', '1496701205', 'wx20170606062006c5b8078e5d0416396474', '2', '100', '1496701215');
INSERT INTO `ask_order` VALUES ('596', '201706090948519906', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705232122348', '1496972931', 'wx20170609094851ac09d1597a0645199907', '2', '100', '1496972939');
INSERT INTO `ask_order` VALUES ('597', '201706300917029930', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201706071714727', '1498785422', 'wx20170630091702ae58cbd86d0633382022', '1', '100', null);
INSERT INTO `ask_order` VALUES ('598', '201707021830408934', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705232113428', '1498991440', 'wx20170702183040f85bf36df50755475922', '1', '100', null);
INSERT INTO `ask_order` VALUES ('599', '201707021831086944', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201705231943947', '1498991468', 'wx2017070218310870f3a5d6370650939385', '2', '100', '1498991474');
INSERT INTO `ask_order` VALUES ('600', '201707041436529587', '1eed9332d2d9bf5982d5f4a62616cb14dfa540be', 'Ask201707021643530', '1499150212', 'wx20170704143653a8237013ab0083264184', '1', '100', null);
INSERT INTO `ask_order` VALUES ('601', '201707041437515082', '1eed9332d2d9bf5982d5f4a62616cb14dfa540be', 'Ask201707021643530', '1499150271', 'wx201707041437524dac34e6280712371181', '1', '100', null);
INSERT INTO `ask_order` VALUES ('602', '201707041813019970', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Ask201707041101765', '1499163181', 'wx20170704181301b12f3d7ee30499811152', '1', '100', null);
INSERT INTO `ask_order` VALUES ('603', '201707050342044103', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201707021643530', '1499197324', 'wx201707050342053c87c1b9d60511557948', '2', '100', '1499197332');
INSERT INTO `ask_order` VALUES ('604', '201707050350561916', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201707041101765', '1499197856', 'wx20170705035056a847f387fe0171115831', '2', '100', '1499197862');
INSERT INTO `ask_order` VALUES ('605', '201707092306293753', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Ask201705261455382', '1499612789', 'wx2017070923062924382071760893136420', '1', '100', null);

-- ----------------------------
-- Table structure for ask_voice
-- ----------------------------
DROP TABLE IF EXISTS `ask_voice`;
CREATE TABLE `ask_voice` (
  `id` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '语音路径',
  `serverid` varchar(255) DEFAULT NULL COMMENT '微信语音ID',
  `ctime` varchar(255) DEFAULT NULL COMMENT '生成时间',
  `wtime` varchar(255) DEFAULT NULL COMMENT '转换完成时间',
  `xtime` varchar(255) DEFAULT NULL COMMENT '下载完成',
  `tokne` varchar(255) DEFAULT NULL,
  `asktoken` varchar(255) DEFAULT NULL COMMENT '问题标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ask_voice
-- ----------------------------

-- ----------------------------
-- Table structure for bake_article
-- ----------------------------
DROP TABLE IF EXISTS `bake_article`;
CREATE TABLE `bake_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bktoken` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '类别ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bake_article
-- ----------------------------
INSERT INTO `bake_article` VALUES ('1', 'asdfghjkl1', '3', '看完你会用生命去减肥', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247483702&idx=1&sn=ae22e1308d344bf28349e396527e9946&chksm=97e8a3e6a09f2af0102ecad6ad2359d44dc50694fa6b0f7f66279fc04232ff013aa28401800f#rd/', '为什么人会胖起来呢？？？', 'http://api.shoumeikeji.cn/Bake/20170430009.jpg');
INSERT INTO `bake_article` VALUES ('2', 'asdfghjkl2', '3', '西红柿真的可以减肥吗', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484291&idx=2&sn=8112902030602dfbc93ea1a197d2ae27&chksm=97e8a153a09f2845d156e1e618c3d09673c7c29639a7a3969979a5950c1896d9fe8e6944c788#rd/', '吃西红柿的好处有很多，西红柿不仅是蔬菜，同时也是营养丰富的水果，西红柿的营养价值高，富含维生素C，热量低，100多克就只有十几卡热量，是不可多得减肥圣品。', 'http://api.shoumeikeji.cn/Bake/20170430012.jpg');
INSERT INTO `bake_article` VALUES ('3', 'asdfghjkl3', '3', '这16种减肥食物，你知道吗?', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484291&idx=3&sn=f1b249121d8e2fdf13b8d2fa93617ddf&chksm=97e8a153a09f2845f4e78d01ee92e3903944856f51b34fc815a4b0a1e20d5a78d7ad25bd5dd4#rd/', '黄瓜内含内醇二酸，可抑制糖类食物转化为脂肪，黄瓜还含有丰富的纤维素，能加强胃肠蠕动，通畅大便，且热量含量也较低。', 'http://api.shoumeikeji.cn/Bake/20170430013.jpg');
INSERT INTO `bake_article` VALUES ('4', 'asdfghjkl4', '3', '越吃越瘦的10种杂粮', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484291&idx=4&sn=016b5e584544dd6a737b8579bc7196cf&chksm=97e8a153a09f2845ab11b302abe5f904e865eac7b8ff6a40e1793ddb87faef106353a7832cbe#rd/', '拥有窈窕的身段是每个女人的梦想，市面上介绍的各种减肥方法中，核心宗旨不外乎控制饮食和保持运动。', 'http://api.shoumeikeji.cn/Bake/20170430014.jpg');
INSERT INTO `bake_article` VALUES ('5', 'asdfghjkl5', '3', '减肥食谱一日三餐如何安排？', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484291&idx=5&sn=2247c7309b877e2fd9a86106c75cf2e2&chksm=97e8a153a09f2845883c8160ea609d97d1ae04d931ccc8cb216757fce49499ecc9d1bac9a7be#rd/', '对于减肥，饮食是重中之重，如果不能很好的科学控制饮食的热量，很容易导致身体热量转换成脂肪，导致脂肪堆积，让减肥的效率大大降低。', 'http://api.shoumeikeji.cn/Bake/20170430015.jpg');
INSERT INTO `bake_article` VALUES ('6', 'asdfghjkl6', '25', '脚上这几大特点预示寿命长，你有几个？', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484207&idx=6&sn=69faf52e89eef866f1b3a2648374317f&chksm=97e8a1ffa09f28e93b2385e42c99135180fd2a74b6e0947b1cc64c3955f8b5babe1d25b68055#rd/', '脚实现我们的行走功能，在它上面有很多穴位，跟身体内脏相关', 'http://api.shoumeikeji.cn/Bake/20170430006.jpg');
INSERT INTO `bake_article` VALUES ('7', 'asdfghjkl7', '4', '一向注意个人卫生，怎么还会尿路感染呢？', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484207&idx=8&sn=fd0fe5507d356bfcc8c1e9783e4b639e&chksm=97e8a1ffa09f28e90bb3595c12e50424a9a65f3371383b9b2c2ca2aa4dc69da20ba72376ecd7#rd/', '不少准妈妈在孕中晚期出现尿频、尿急、排尿疼痛等症状，去医院检查后被告知患上尿路感染。', 'http://api.shoumeikeji.cn/Bake/20170430008.jpg');
INSERT INTO `bake_article` VALUES ('8', 'asdfghjkl8', '4', '中医说：脾虚竟然能折寿？（深度好文） ', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484207&idx=2&sn=699133ff3e15b790266c4a97f671a76d&chksm=97e8a1ffa09f28e9c5ce5cb7e00ab49f85a1ea923e73bc733bdfdfdc2aaf716a13049dd49558#rd/', '我们最常说的就是脾虚，可是很多人对脾虚不以为然，往往觉得脾虚不能够实际感受到，脾虚不会影响正常生活，其实，这种想法完全错误的。', 'http://api.shoumeikeji.cn/Bake/20170430002.jpg');
INSERT INTO `bake_article` VALUES ('9', 'asdfghjkl9', '4', '心、肝、脾、肺、肾逐个说，中医精华都在这儿！', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484207&idx=3&sn=cef692db5f1056ee219ed7e680d2f7ed&chksm=97e8a1ffa09f28e9b7381ef31d31f0c2184609ea513dba4f1155840ad51eb7cff69c8d44f776#rd/', '中医有全息的理论，认为在足部或手部分布着体内各个脏器的反射区，如手背对应人体腰部，所以经常腰痛、腰酸的人，应该多拍拍手背。', 'http://api.shoumeikeji.cn/Bake/20170430003.jpg');
INSERT INTO `bake_article` VALUES ('10', 'asdfghjkl10', '4', '一个小动作，能调动全身十二条经络所有的原穴', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484207&idx=4&sn=7bf533290998a9b49cf8bdc27662dfb5&chksm=97e8a1ffa09f28e9c3aba7e2c7324767a10b67d98c12193c7c5e225277da22fe892fd5b3874f#rd/', '小小的功法，却能调动全身十二条经络的原穴。', 'http://api.shoumeikeji.cn/Bake/20170430004.jpg');
INSERT INTO `bake_article` VALUES ('11', 'asdfghjkl11', '4', '女人不健康的8种暗示，不看太可惜了', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484207&idx=5&sn=0acfabce841f9048b419b39a2064296c&chksm=97e8a1ffa09f28e9333c235fe383ff42bcc22d6ce9e0eb3f3d7c2263063005017feae59aae87#rd/', '要是出现下面这八个暗示，说明身体不健康了，可要注意了。', 'http://api.shoumeikeji.cn/Bake/20170430005.jpg');
INSERT INTO `bake_article` VALUES ('12', 'asdfghjkl12', '4', '爱双盘腿对女性的惊人好处，现在知道也不晚哦！', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484207&idx=7&sn=c1c5edf0802e506a1a3f1a803f563ae5&chksm=97e8a1ffa09f28e9a7436374a574dbab2889e518420a48164670a321f0b3ae7c0cf63801e136#rd/', '瑜伽源于印度，经典的体式莲花座，事实上在中国也是已经盛行很久，今天小编结合起来为大家改口一下盘腿+全莲花的好处。', 'http://api.shoumeikeji.cn/Bake/20170430007.jpg');
INSERT INTO `bake_article` VALUES ('13', 'asdfghjkl13', '24', '脚上有1个穴位，是专治糖尿病的奇穴，糖尿病患者都需要', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484207&idx=1&sn=9f18403d11bfe87f566d8d7155ff9374&chksm=97e8a1ffa09f28e9230e76debcaca35ebe6cdbd6aa7b2552bc9d52050e037556dcb44759a704#rd/', '近年来，患高血压、糖尿病的人呈逐年上升趋势，他们成年吃很多的药，还要忌嘴，特别是糖尿病，酸、甜、烂、软的都不敢吃', 'http://api.shoumeikeji.cn/Bake/20170430001.jpg');
INSERT INTO `bake_article` VALUES ('14', 'asdfghjkl14', '25', '健康是一种责任，健康是一种态度。', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247483735&idx=2&sn=e3612d717bf422e0771c3b2fc09e5a4d&chksm=97e8a387a09f2a916f638460d8068452449d65cb11843a2f7380a059e953f303922d518dfd97#rd/', '健康是一种责任，很少人能明白这一点。健康不是一个人的，它是爱人、父母、子女、兄弟姐妹这个大家庭的。', 'http://api.shoumeikeji.cn/Bake/20170430010.jpg');
INSERT INTO `bake_article` VALUES ('15', 'asdfghjkl15', '25', '一个不懂营养健康的人活着就是一场赌博', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247483735&idx=3&sn=f5cf3baf2f28437d1032ff40cc6776cf&chksm=97e8a387a09f2a91a1e66a5476882df127148426abe103851eb711cab323952ba38336547882#rd/', '近年来，英年早逝的企业家和明星名人们，平均每个月至少有1人。触目惊心啊！难道他们没有钱看病吗？', 'http://api.shoumeikeji.cn/Bake/20170430011.jpg');
INSERT INTO `bake_article` VALUES ('16', 'asdfghjkl16', '25', '爱生活，爱家人，从早餐开始', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=100000109&idx=1&sn=1933bdcd4b3e56514fb1c676cc716a2f&chksm=17e8a3bd209f2aabe60c79d76b6ad8329d6cc3b6f07b54bcdbb4767a715800ded16df5f58b63#rd/', '为什么要吃早餐呢？', 'http://api.shoumeikeji.cn/Bake/20170430017.jpg');
INSERT INTO `bake_article` VALUES ('17', 'asdfghjkl17', '3', '减肥低卡路里食物排行榜', 'http://mp.weixin.qq.com/s?__biz=MzIxODQ3ODUyNw==&mid=2247484291&idx=6&sn=9b3dfa5fc9d8b5bd63bdf55b14acd45b&chksm=97e8a153a09f2845685196f9b015640b2356f23a9acf0600d2bb8ce7ce73b6fe0156e840b3e0#rd/', '芹菜的热量非常低，而且含有大量的植物纤维，能有效加速肠胃运转速度，将体内多余的废物排出体外。', 'http://api.shoumeikeji.cn/Bake/20170430016.jpg');
INSERT INTO `bake_article` VALUES ('25', '0fb77209eb8abde9fce71d9ff7af476e419f1231', '1', '「备孕期」为什么要拔智齿？', 'http://mp.weixin.qq.com/s/XLo68seNgKs1G9Hih8DH3A', '之前曾经有条新闻“怀孕7个月时智齿发炎准妈妈险些流产”。说的是一位孕妇，在孕期达 7 个月时，她因突感牙痛难忍到医院检查，被诊断为智齿发炎。', 'http://api.shoumeikeji.cn/Bake/image/20170525/20170525181003_65195.jpg');
INSERT INTO `bake_article` VALUES ('26', '2173dc8d20e72ec2eb7e963185e0f5da689b48fa', '1', '「怀孕期」怀孕初期要注意什么？', 'http://mp.weixin.qq.com/s/g1ljGsxOTj0y7iCeo1WYew', '女性怀孕初期应注意什么？ 妊娠的头三个月，是胚胎迅速发育的时期，也是趋向于形成器官、各系统的重要时期，因此，要加强此期保健，有助于日后胎儿正常发育。', 'http://api.shoumeikeji.cn/Bake/image/20170525/20170525181211_70213.jpg');
INSERT INTO `bake_article` VALUES ('27', 'a2d668a2fe8eb727209ff0766ff06d2e97021b0a', '1', '「坐月子」4大美食教程，让坐月子的妈妈胃口大开', 'http://mp.weixin.qq.com/s/bN7eWz1QzxzYmlX5rWCiAQ', '很多新妈妈一直在纠结，坐月子是在婆家还是回娘家？其实，只要记住了这些，在哪都一样！给大家分享4道月子餐的做法，让妈妈胃口大开！', 'http://api.shoumeikeji.cn/Bake/image/20170525/20170525181825_17908.jpg');
INSERT INTO `bake_article` VALUES ('28', '35ae28abf2353ff21bb71acfc4b1694dd0560d3c', '25', '「爱样营养」做饭到底应该加冷水还是热水？其实大部分人都错了哦', 'http://mp.weixin.qq.com/s/_81vvifYkYOVkW1oiEW53w', '做饭加个水也有这么多学问？\r\n掌握了正确的用水方法，\r\n烹饪才会更顺利更美味哦~', 'http://api.shoumeikeji.cn/Bake/image/20170525/20170525182204_87043.jpg');
INSERT INTO `bake_article` VALUES ('29', '96c2307af48741ef4db6328226e0ba94b77c1f72', '2', '「爱样知识」为什么老二比老大聪明？真相全在这里了！', 'http://mp.weixin.qq.com/s/xqJLupScAfv0g7ifgO81uA', '孩子的智商与个性\r\n跟出生顺序有没有关系\r\n答案是肯定的', 'http://api.shoumeikeji.cn/Bake/image/20170525/20170525182456_82244.jpg');
INSERT INTO `bake_article` VALUES ('30', 'd46c2bc9144440f501e4e7dc59aa28a5730342aa', '2', '「爱样知识」给宝宝买衣服，切记只要对的不选贵的', 'http://mp.weixin.qq.com/s/_ScpOPvTmG2gkujupd1YQg', '不管你信不信，宝宝成长的很快，转眼间就能自己穿衣服了。然而，在此之前，他也可能根本就没有耐心等着你给他把衣服穿好。所以，你最好买容易穿脱的衣服，那么，即使这个小家伙不怎么配合，你也能轻松搞定。', 'http://api.shoumeikeji.cn/Bake/image/20170525/20170525182618_98770.jpg');
INSERT INTO `bake_article` VALUES ('31', 'c7591e74b8e6a3a2a535c5bed1609288cbde297d', '2', '「宝宝辅食」宝宝巧补维生素，妈咪必学3道美食菜', 'http://mp.weixin.qq.com/s/_y647r2ZU-7Vy4Vb81J8Cg', '维生素是人和动物为维持正常的生理功能而必需从食物中获得的一类微量有机物质，虽然含量很少，但是对幼儿的发育成长却有不可忽视的作用。在人体生长、代谢、发育过程中发挥着重要的作用。', 'http://api.shoumeikeji.cn/Bake/image/20170525/20170525182713_36909.jpg');
INSERT INTO `bake_article` VALUES ('32', '20bcae37a29a775ddcb574fe00b9adc4116b236e', '1', '「妈妈圈」不就是带个孩子嘛，能有多累啊！', 'http://mp.weixin.qq.com/s/MHRhAeEKDgrfPCVZo6M8yw', '带娃究竟有多累，\r\n只有当妈的人才能体会……', 'http://api.shoumeikeji.cn/Bake/image/20170525/20170525182808_20390.jpg');
INSERT INTO `bake_article` VALUES ('33', '848beba1378847660e550ba71167d4c22547441b', '2', '「宝宝辅食」孩子在辅食上的禁忌，妈妈们一定要知道！', 'http://mp.weixin.qq.com/s/Z9M7ecMcIsmMMCqD8yaZdQ', '像螃蟹、虾子这类的海鲜很容易诱发宝宝出现过敏情况，所以不建议1岁以下的宝宝食用。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526191622_17773.jpg');
INSERT INTO `bake_article` VALUES ('34', '61d368a40ea7ac2b088b3aca53364ae6248aadb9', '1', '「孕知识」影响宝宝身高的基因，是来自妈妈还是爸爸？', 'https://mp.weixin.qq.com/s/L_Q92EaEIqIjgtSkr6nAiw', '龙生龙，凤生凤，基因实在是太强大了。我们都知道，孩子会遗传父母的很多基因，首先，血型是必须遗传的。\r\n', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526191717_39514.jpg');
INSERT INTO `bake_article` VALUES ('35', '0cf0c03955da5aa6d20b66ddfe42228353bd47a6', '1', '「坐月子」这些老传统，真的都对吗？', 'http://mp.weixin.qq.com/s/N2N2QcilUJMX40zXnu2xlg', '妈妈和月嫂一看我下床就说，“坐月子”就是坐在床上不能下地活动，甚至吃喝都在床上，下地活动以后腰疼，还能造成子宫脱垂。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526191803_89287.jpg');
INSERT INTO `bake_article` VALUES ('36', 'f8c0e5f16ffcb61cdff6bddf568f17217b2108ed', '3', '「减肥瘦身」腹部减肥大作战，跟爱样一起瘦一夏！', 'http://mp.weixin.qq.com/s/ugN38L5d11jQrESU6o-RQw', '很多减肥的朋友都应该知道，肚子上的脂肪是最难减的，有时候发现自己运动了一段时间，发现其他部位有明显的变化了，但是肚子还是那么大 ， 这是为什么呢？ 因为肚子是人体最容易囤积脂肪，最难减的部位\r\n', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526191912_32425.jpg');
INSERT INTO `bake_article` VALUES ('37', '51e12d928d439b1f26e8c91414096c072055312b', '2', '「爱样知识」宝宝要开始学说话了，爸爸妈妈都准备好了吗？', 'http://mp.weixin.qq.com/s/pIX4LZiq6ymNqqpZHWp6Eg', '在宝宝0-5个月的时候，语言发育基本停留在“听”的阶段，他喜欢妈妈的声音，父母需要多跟宝宝说话，在他发出咿咿呀呀的声音时，及时给予回应。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526191950_86953.jpg');
INSERT INTO `bake_article` VALUES ('38', 'ae065f800057ce0e777d6a5977128c52844b302e', '24', '「糖尿病」一生不得糖尿病的方法在这里！不用吃药，简单实用~', 'http://mp.weixin.qq.com/s/Ydo-AvuPkHP-s40qh1bMGQ', '截肢、失明、尿毒症……几乎没有什么疾病可以像糖尿病一样，本身并不可怕却可以引发许多可怕的并发症。它可以引发100多种并发症，是目前已知的并发症最多的一种疾病！\r\n', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526192055_37355.jpg');
INSERT INTO `bake_article` VALUES ('39', '6fddb0d227273f768047610afcf8b7b738f5e092', '2', '「爱样知识」宝宝体重多少才正常？', 'http://mp.weixin.qq.com/s/8MIp-D01LqVmvaEW0L_gwA', '正常足月产的新生宝宝体重为2.5~4kg。如果宝宝体重＜2.5kg，称之为低出生体重儿；而当体重≥4kg，称之为巨大儿。那究竟多重的宝宝才算得上医生眼里的“合格宝宝”呢？', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526192138_61507.jpg');
INSERT INTO `bake_article` VALUES ('40', '6b32a13a03c31b5c080ab91c0c6f68de69640b5f', '2', '「爱样知识」小孩的耳屎能挖吗？家长都应该知道！', 'http://mp.weixin.qq.com/s/Dby5YRo6ha50Z6z8ECD74g', '很多妈妈们有强迫症！看到娃耳朵里有耳屎，就要动手弄一弄！这里中招的妈妈有吗？\r\n', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526192216_86769.jpg');
INSERT INTO `bake_article` VALUES ('41', 'c17b7afedb3856ed231b0802aa2bc6d641a04c35', '2', '『宝宝辅食』如何增进夏季儿童的食欲', 'http://mp.weixin.qq.com/s/59LJp5v--zPXc9WJB2VVZQ', '刚刚进入夏季，天气就越来越热，对于炎热的天气，孩子往往会表现出食欲不振或厌食，但对冷饮的喜爱却是热度不减。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526192817_65138.jpg');
INSERT INTO `bake_article` VALUES ('42', 'b44a4a85cff90e8325c63238f739833783656dd8', '2', '『爱样知识』夏天来了，怎么预防宝宝拉肚子？', 'http://mp.weixin.qq.com/s/snc1l3Od0-JuUoLNAZtfGQ', '随着夏季的来临，新一波腹泻又缠上宝宝了。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526192957_12093.jpg');
INSERT INTO `bake_article` VALUES ('43', '0a193d6c786c265837cbc741d461db2d960cdd50', '1', '『怀孕期』孕妈妈注意，这些物品，可能会导致流产！', 'http://mp.weixin.qq.com/s/phIxDwpLIol5V29o1KH_mQ', '据了解，大约有15%-20%的孕妇最终会流产，在英国有三分之一的妇女遭受过流产。排除年龄因素，研究人员正在看是否还有其他影响因素。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526193047_11226.jpg');
INSERT INTO `bake_article` VALUES ('44', '3fd7e44704ad2b515a1a6788e35cf56fa8e3e5e7', '2', '『爱样知识』宝宝退烧的最全方案，总有一种能帮到你', 'https://mp.weixin.qq.com/s/CIhgwriT6_Jg_0lkFju1dA', '孩子一发烧，麻麻们总是各种揪心、不知所措，所以这份清晰、实用的小儿发热解决方案分享给大家，看完你会知道什么时候什么程度分别该怎么做。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526193129_97518.jpg');
INSERT INTO `bake_article` VALUES ('45', '10cd869439aed87073fcb5442bdd3ab294bb3dc3', '2', '『爱样知识』60秒牢记宝宝各项生理达标指数！推荐收藏', 'http://mp.weixin.qq.com/s/vej7gFjSiGN5HCFflHNDNA', '宝宝从新生儿过渡到婴幼儿，再由婴幼儿过渡到儿童，这是一段漫长的过程。在这段过程中，宝宝的家庭护理、饮食喂养、体格发育等各项指标始终都贯穿其中，怎样使宝宝的各项生理指标都能顺利达标呢？这是所有家长最关心的课题。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526193308_85837.jpg');
INSERT INTO `bake_article` VALUES ('46', 'fa5e365d3b1735459fcfb1527b04454072e97352', '2', '『妈妈圈』打针不哭的宝宝是如何炼成的？', 'http://mp.weixin.qq.com/s/z40F_il-qhaoJZKX9elW3Q', '宝宝成长中难免要生个病，打个针，吃个药的，别的不说，光是预防针就不少了。', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526193400_44861.jpg');
INSERT INTO `bake_article` VALUES ('47', '92658a501172bc61b7300b5dae71fa20e2340ccf', '2', '『爱样知识』妈妈们注意，这5种早餐最伤害孩子!', 'http://mp.weixin.qq.com/s/UeVEYMrNFVfI-5UfnO36AQ', '早餐吃好，中餐吃饱，晚餐吃少，对于正在长身体的孩子来说，当家长的尤其不可以马虎！', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526193451_40533.jpg');
INSERT INTO `bake_article` VALUES ('48', '46cff6920c10f5a0e5cf0550ed6113e3a4154302', '25', '『妈妈圈』一位女医生给女儿画的急救流程图，关键时刻能救命！', 'http://mp.weixin.qq.com/s/qDuPRK3HXK9gksV-Jk0e-w', '几年前，我一个朋友的儿子猝死在家中，她问我：“如果我会做心肺复苏，他是不是还能活着？”', 'http://api.shoumeikeji.cn/Bake/image/20170526/20170526193531_74826.jpg');
INSERT INTO `bake_article` VALUES ('49', '223103c9089aa6971a50d8ff61396ffae6ed1448', '1', '『备孕期』打算要二胎，孕前需要检查什么？', 'http://mp.weixin.qq.com/s/y36bpqBGzhbSc1zNMUeGDQ', '赶上了“单独两孩”的好政策，一些符合条件的妈妈欢呼雀跃，赶上了能生二胎的头班车，别提有多兴奋。她们纷纷涌向医院妇科门诊，询问孕前需要做什么检查。', 'http://api.shoumeikeji.cn/Bake/image/20170527/20170527154855_71592.jpg');
INSERT INTO `bake_article` VALUES ('50', '9edd43e764588cae5f255c83edc0debeefdea215', '1', '『备孕期』这5个生活习惯是怀孕大忌，千万别犯！', 'http://mp.weixin.qq.com/s/cisak8Gkb5GWLmSIMNeN3g', '怀孕对每一个家庭来说，都是一件至关重要的事。很多夫妻为了顺利的怀上宝宝，也做出了许多的努力，但是，往往就有一些不如意的事情，明明夫妻双方体检都正常，怎么就一直怀不上呢？', 'http://api.shoumeikeji.cn/Bake/image/20170527/20170527154940_28651.jpg');
INSERT INTO `bake_article` VALUES ('51', 'b4bd5985bc5121ddd0855f0fd3cb33b866a08c71', '1', '『怀孕期』妈妈要慎吃这些东西，它只会让胎宝宝越来越笨！', 'http://mp.weixin.qq.com/s/b7McAyusi8bsJCvGZ80aBA', '在孕期，孕妈妈的饮食是一大关，孕期吃好了，胎儿才能发育好。但是食物那么多难免有疏忽的，有些适合多吃有些要少吃，其中有几样常见食物，孕妈妈一定要少吃，不仅对自己身体不利，更会影响胎儿的发育。', 'http://api.shoumeikeji.cn/Bake/image/20170527/20170527155018_32859.jpg');
INSERT INTO `bake_article` VALUES ('52', '644b36e8d30322d863690ab4642bb819ba8204a0', '2', '『宝宝辅食』夏天给孩子煲这8种粥，少生病！妈妈们学起来。', 'http://mp.weixin.qq.com/s/RNjcwMKCl57oh58i4qFLMg', '红枣和小米营养价值都很高，熬煮成粥可以补气、清热除湿、养胃健脾、安神健脑，特别适合身体虚弱、睡眠不好的孩子食用。', 'http://api.shoumeikeji.cn/Bake/image/20170527/20170527155056_83545.jpg');
INSERT INTO `bake_article` VALUES ('53', '24c4a35a74a1e6787cc9efb815c29bd53e1ce9bd', '2', '『爱样知识』儿童做家务年龄对照表，这样做，让你的孩子更优秀！', 'http://mp.weixin.qq.com/s/GO2jnZPSAeKZD7uE6Nd4eA', '哈佛大学一项长达20年的研究表明，爱做家务的孩子跟不爱做家务的相比，就业率为15:1，收入比后者高20%，而且婚姻更幸福。\r\n', 'http://api.shoumeikeji.cn/Bake/image/20170527/20170527155130_24137.jpg');
INSERT INTO `bake_article` VALUES ('54', 'db82c2861ad4d290b055921b07e5e302a5ba2824', '2', '『爱样知识』宝宝不穿的旧衣服，千万别扔！', 'http://mp.weixin.qq.com/s/lAC3K2Tdnj4UZ_o6zQuMDg', '这么大、这么诱人的一张毯子，要是买会花不少钱吧！\r\n', 'http://api.shoumeikeji.cn/Bake/image/20170527/20170527155207_59575.jpg');
INSERT INTO `bake_article` VALUES ('55', 'ac4cfcb56075b2cc4263e1dc6384846b17f9dc32', '2', '『宝宝辅食』4~12个月的10道辅食，让宝宝吃好！', 'http://mp.weixin.qq.com/s/c9KSUZWTjR9ismYfcLxkxA', '辅食可以帮助吸收到奶粉或母乳当中没有的营养，有利于宝宝的生长发育。因此，当宝宝4-6个月以后就可以逐渐添加辅食。', 'http://api.shoumeikeji.cn/Bake/image/20170527/20170527155305_87177.jpg');
INSERT INTO `bake_article` VALUES ('56', '45d2864a75f85a36111723fd6472f7b5837fdcdf', '2', '『爱样知识』端午节，多大的宝宝才可以吃粽子？', 'http://mp.weixin.qq.com/s/8cvIHahj7cH3YtzF32QqzQ', '传统节日端午节即将来到，\r\n吃粽子是端午节的代表，\r\n有些妈妈就在想，大人是可以吃粽子，\r\n那宝宝也可以吃吗?', 'http://api.shoumeikeji.cn/Bake/image/20170527/20170527155333_86550.jpg');
INSERT INTO `bake_article` VALUES ('57', '6735096166819cded97301ccbe7bddcae872b2c4', '2', '『爱样知识』0~7岁儿童生长发育参照标准', 'http://mp.weixin.qq.com/s/pJylCXRdPpbXxRlVl0isww', '遗传因素对小儿的生长发育有一定影响。如父母身材的高矮、皮肤的颜色、毛发的多少以及形态等，对子女都有一定程度的影响。', 'http://api.shoumeikeji.cn/Bake/image/20170602/20170602181603_67274.jpg');
INSERT INTO `bake_article` VALUES ('58', '1e58ae531f2ce821ba609c0cd0f3849fcef4e07c', '2', '『宝宝辅食』这些辅食，让宝宝长得更高！', 'http://mp.weixin.qq.com/s/LZ0vYiZI50xatzAWcoGgqw', '一年之中，3-5月眼光充足，温度适宜，户外活动增多，人体新陈代谢旺盛，生长激素分泌增加，维生素D在体内转化，促进钙吸收，是儿童长高的旺季。\r\n', 'http://api.shoumeikeji.cn/Bake/image/20170602/20170602181659_21390.jpg');
INSERT INTO `bake_article` VALUES ('59', 'e5f8331ac600f2acb99f25114b4ae1ad9085e623', '25', '『爱样知识』“穷养儿，富养女”原来是这样！可惜一直没弄懂！', 'http://mp.weixin.qq.com/s/RwjZSgDYmg5FSnH18NOGpg', '穷养儿子，是对男孩一生的投资;富养女儿，是一种文化修养的投资。两者之间的共同点就是培养宝宝自信、自立和智慧。', 'http://api.shoumeikeji.cn/Bake/image/20170602/20170602181758_69378.jpg');
INSERT INTO `bake_article` VALUES ('60', '5b07d6c5b4bdaaad36e718bba0388dda60992670', '1', '『妈妈圈』夏天这样做凉面，一家人都吃的停不下来！', 'http://mp.weixin.qq.com/s/aJycnSiZMKkY7AVj6myfbA', '夏日炎炎吃不下饭，开火做饭又觉得闷热难过。不如来一道酸辣爽口的凉面。简单易做，保你胃口大开哦！', 'http://api.shoumeikeji.cn/Bake/image/20170602/20170602181850_45133.jpg');
INSERT INTO `bake_article` VALUES ('61', '6086ba7863fedd5d73c9122f7a42e6b98fa27267', '2', '『爱样知识』宝宝多大要穿小内裤，男女宝宝私处护理有妙招！', 'http://mp.weixin.qq.com/s/eobdW5BfPciVFybAH3rENw', '其实，关于到底孩子多大就应该穿小内裤并没有什么标准答案，一般来说，只要孩子不穿纸尿裤，就应该穿小内裤了！', 'http://api.shoumeikeji.cn/Bake/image/20170602/20170602181935_65223.jpg');
INSERT INTO `bake_article` VALUES ('62', '3adaaf9f39eaf6a36af5bb66b81e799e8d8b0921', '2', '『爱样知识』很多孩子越长越丑，都是因为这5个坏习惯', 'http://mp.weixin.qq.com/s/aADjq1tOFHL-i9pHkD7pKA', '有人说，美丑一张脸，都是爹妈给的。事实上，长相并不是一出生就注定的，可以说是“七分天注定，三分靠打拼”。', 'http://api.shoumeikeji.cn/Bake/image/20170602/20170602182014_19802.jpg');
INSERT INTO `bake_article` VALUES ('63', 'f2ff355c3452841067ef5b38401ab469bb9efba3', '2', '『爱样知识』给宝宝吃水果，这些知识你要懂', 'http://mp.weixin.qq.com/s/bviF7qe5dIcbvwR3xsfixg', '在所有人的印象中，无论是大人还是宝宝，总觉得吃点水果总是好的，对身体益处多多。', 'http://api.shoumeikeji.cn/Bake/image/20170602/20170602182101_38469.jpg');
INSERT INTO `bake_article` VALUES ('64', '7dc29de0c30d7c0100ba140778cdec7dc562c329', '2', '『爱样知识』让孩子少受罪，趁早保护他的牙齿！90%爸妈都做错了', 'http://mp.weixin.qq.com/s/HO7mh7GJX-xJZOpzmEt84w', '牙不好，吃饭不香不说，看一次牙医，几千块钱就出手了，这让一般的家庭怎么受得了？', 'http://api.shoumeikeji.cn/Bake/image/20170602/20170602182141_93485.jpg');
INSERT INTO `bake_article` VALUES ('65', 'd15f872db981674470af1a7fc73b294f46ea0aa2', '2', '『爱样知识』大夏天，让宝宝多喝水的六个妙招!', 'http://mp.weixin.qq.com/s/VCXX-8XDaoG8OuuL-ICqXA', '经常听到有妈妈抱怨，“真是急死人了，每次喂宝宝喝水都累出一身汗，就像吃苦药一样！”其实，宝宝不爱喝水是一个很普遍的问题，小家伙对淡淡的白开水真是一点兴趣都没有，这该怎么办呢？', 'http://api.shoumeikeji.cn/Bake/image/20170607/20170607173827_15369.jpg');
INSERT INTO `bake_article` VALUES ('66', 'a34f5e1c3c5aae0f03a0e57fa256a2aa87d4703c', '25', '『爱样知识』世界上最著名的12种教育孩子的方法，99%的家长都收藏了！', 'https://mp.weixin.qq.com/s/NZxgsYHvUP4UGkGRQMZYTg', '要想知道孩子眼中的世界是什么样子，得先蹲下来，由孩子的位置和高度去看世界。下面随小编一起看下世界上最著名的教育孩子的12种方法！', 'http://api.shoumeikeji.cn/Bake/image/20170607/20170607174042_23247.jpg');
INSERT INTO `bake_article` VALUES ('67', 'fb45b5ff51cd5a6ea6832e9e188804cad4c722a7', '2', '『爱样知识』孩子发烧一定要去医院吗？', 'http://mp.weixin.qq.com/s/f1gLKxLy8UUsc5Q-3U08-Q', '孩子5岁，前天晚上开始发烧39度，有点流鼻涕，去医院看后退了烧，昨天看着精神还可以，也能吃东西，但还是有点烧，请问怎么办？', 'http://api.shoumeikeji.cn/Bake/image/20170607/20170607174122_25475.jpg');
INSERT INTO `bake_article` VALUES ('68', '501d3be496ad4879500af198fe3f2590af897ec2', '2', '『宝宝辅食』宝宝辅食搭配有讲究，不讲究营养搭配，吃了也白吃！', 'https://mp.weixin.qq.com/s/13CqCfIlivA9DrKa4U8zKw', '大多数宝宝到了四个月以后，家长就开始为他准备辅食，补充更多的营养元素。蔬菜中含有丰富的维生素，是宝宝成长发育的必需品。水果美味又营养，也是辅食制作的重要材料之一，其中同样含有大量的维生素。肉类尤其是鱼肉，蛋白质含量丰富，肉质细腻，美味又健康。', 'http://api.shoumeikeji.cn/Bake/image/20170607/20170607174217_14637.jpg');
INSERT INTO `bake_article` VALUES ('69', 'd66c250d69a80bc89060ef7db35cec93e048f100', '2', '『爱样知识』夏季宝宝常见病，7招教你巧防治！', 'http://mp.weixin.qq.com/s/VeF85-WW3NqQl81qTlI-_g', '如果宝宝烦躁不安，有的宝宝甚至会哭闹，呼吸及脉搏加速，接着会显得倦怠、昏眩、抽搐、或进入昏迷状态，测量体温时可高达39℃以上。那么，宝宝很有可能就是中暑了。', 'http://api.shoumeikeji.cn/Bake/image/20170607/20170607174306_16180.jpg');
INSERT INTO `bake_article` VALUES ('70', '5194437c865a3581261403b87dba7d6246e35944', '1', '『妈妈圈』深度好文！《大树之恩》，很多人都看哭了', 'http://mp.weixin.qq.com/s/kdVBrOFtOHfO0xK46tTYBA', '很久很久以前，有一棵又高又大的树。\r\n一位小男孩，天天到树下来，他爬上去摘果子吃，在树荫下睡觉。他爱大树，大树也爱和他一起玩耍。', 'http://api.shoumeikeji.cn/Bake/image/20170607/20170607174345_23697.jpg');
INSERT INTO `bake_article` VALUES ('71', '80b66a07851c41968ed29ab62485ab07597031d8', '2', '『爱样知识』新生儿打嗝，应该如何处理？', 'http://mp.weixin.qq.com/s/CAs27XCqxj2In-MuOFwTJQ', '由于护理不当，外感风寒，寒热之气逆而不顺，俗话说是“喝了冷风”而诱发打嗝，平素若无其他疾病而突然打嗝，嗝声高亢有力而连续，一般是受寒凉所致。', 'http://api.shoumeikeji.cn/Bake/image/20170607/20170607174429_51376.jpg');
INSERT INTO `bake_article` VALUES ('72', '1420b8ac21cbf106237e6145e081c0f68a2d95c2', '2', '『爱样知识』天气热 宝宝如何睡得舒适，我有这些小妙招！', 'http://mp.weixin.qq.com/s/VcRqJkUObAqH_R5Aa6W3GA', '宝宝的皮肤很柔嫩，如果身上脏会让宝宝觉得不舒服。睡前帮宝宝好好洗—个澡，让宝宝清清爽爽入睡，能大大提高宝宝的睡眠质量。', 'http://api.shoumeikeji.cn/Bake/image/20170607/20170607174512_99799.jpg');
INSERT INTO `bake_article` VALUES ('73', 'b47e96fad24eadb8923c764a08efc7ee544fb1de', '3', '『爱样知识』林心如产后迅速瘦回90斤，那些产后暴瘦的明星都是怎么做到的', 'http://mp.weixin.qq.com/s/KMKszwcXWAubMlfxltzw4w', '我们经常能够看见生完孩子的明星们的身材和产前是一样一样的，为什么明星们产后的身材恢复都那么快？其实也没有什么秘诀，主要还是饮食和调养。', 'http://api.shoumeikeji.cn/Bake/image/20170615/20170615151432_28427.jpg');
INSERT INTO `bake_article` VALUES ('74', 'f341643d508c370def746841a509a0c27895e105', '25', '『爱样知识』中国最牛父亲！子女全是风云人物，教育方式却只有三句话', 'http://mp.weixin.qq.com/s/T1rozUWd50CqzK6WdVning', '说起宋嘉树，可能很少有人知道。但要说起他的六个子女，可能就无人不知、无人不晓了——每一个都是20世纪呼风唤雨的风云人物。', 'http://api.shoumeikeji.cn/Bake/image/20170615/20170615151542_37892.jpg');
INSERT INTO `bake_article` VALUES ('75', '0aeb86d764ba57305159585a0e2c17e705e5db9a', '2', '『爱样知识』育儿常犯的几个错误，当妈的都要看！', 'http://mp.weixin.qq.com/s/9YdHhusDcSQbHRwAB8S4ag', '宝宝出生了，你以为卸完货就OK 了？ 其实，一切才刚刚开始……一大堆的育儿问题让他你措手不及，黄疸了，吐奶了，夜哭了，稀遍了，湿疹了……，一个接着一个，要把新妈妈整疯的节奏啊！ ', 'http://api.shoumeikeji.cn/Bake/image/20170615/20170615151705_48370.jpg');
INSERT INTO `bake_article` VALUES ('76', 'e2d93ed8ea827160978620331c89e33cf93b73d8', '2', '『宝宝辅食』这条鱼，小孩子一定要常吃，刺少肉厚味道鲜，健脑补脑促生长！', 'http://mp.weixin.qq.com/s/4i4RrRBF23YxknNGvygXug', '银鳕鱼是世界上最高级的白肉鱼类，被称为‘海中白金’。富含大量的高蛋白，以及各种维生素，以及钙镁等矿物元素。', 'http://api.shoumeikeji.cn/Bake/image/20170615/20170615151803_68247.jpg');
INSERT INTO `bake_article` VALUES ('77', 'b40d4fe774363b706cbf929c66b0139ea578b7ca', '1', '『爱样知识』关于母乳喂养，妈妈必须知道的这六点！', 'http://mp.weixin.qq.com/s/liYvIkGBXUyCBqLHikEibA', '妈妈们说每次母乳喂养宝宝都很提心吊胆，怕乳房不清洁，怕宝宝吐奶什么的，在这我跟诸位妈妈讲下新生儿母乳喂养要注意些什么。', 'http://api.shoumeikeji.cn/Bake/image/20170615/20170615151904_99617.jpg');
INSERT INTO `bake_article` VALUES ('78', '51e2379155c12a3c1beebf725e22e0018913d953', '2', '『爱样知识』宝宝剃头那些事，你了解多少？', 'http://mp.weixin.qq.com/s/mYTrH1H6p6ByI_p7EHU22A', '科学育儿的口号已经喊了好些年，但是很多人依然坚持着过去的民俗和传统。', 'http://api.shoumeikeji.cn/Bake/image/20170615/20170615151957_31242.jpg');
INSERT INTO `bake_article` VALUES ('79', '62402b52bba92c1972bcfceb500fb83f78ab17d7', '1', '『怀孕期』孕吐居然隐藏这么多信息！孕妈妈都需要知道的孕吐9问题！', 'http://mp.weixin.qq.com/s/JRYiBD3yyQ-0o5tCijfqqw', '孕吐是因人而异的，一般会发生在前三个月，大约从怀孕第5周开始会发生孕吐。特别在早晚会出现恶心，没有任何原因就想呕吐，反应因人而宜，有的反应轻，有的反应重。', 'http://api.shoumeikeji.cn/Bake/image/20170615/20170615152043_56192.jpg');
INSERT INTO `bake_article` VALUES ('80', 'd80400cfe12c92d5d668e33a0f0d08887456c82a', '2', '『爱样知识』婴儿出生第 1 年需要注意的事情', 'http://mp.weixin.qq.com/s/6n0uohyLblgGKkiye4Zzhg', '不要枕枕头，把毛巾折两折枕，三个月后给宝宝枕枕头，枕高3到4厘米.母乳喂奶前后半小时不要喂水，稀释胃液影响消化，睡前不喂水。纯母乳喂养6个月内', 'http://api.shoumeikeji.cn/Bake/image/20170615/20170615152156_34869.jpg');
INSERT INTO `bake_article` VALUES ('81', '6909d7dad721fad6a77cc3cecfd105bf6409d7ef', '2', '夏天宝宝厌食，不吃饭，家长应该追着喂吗？', 'http://mp.weixin.qq.com/s/OMdvSYiCLLzQ4FCAY0C0AA', '夏天来了，很多家长在公众号后台留言说自己家的宝宝越来越不爱吃饭，每次喂饭都要屁股后面追着喂，一顿饭要花费将近1个小时的时间，累觉不爱~~', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621090632_31788.jpg');
INSERT INTO `bake_article` VALUES ('82', 'fba50f4700f7b255827a49d12ca0300212e3e88b', '2', '最适合夏天给宝宝开胃的6道辅食，每道仅需10分钟', 'http://mp.weixin.qq.com/s/7WfBvMYLmrKqOduAFVOaOg', '夏天宝宝不爱吃饭，怎么办？相信一到夏天，有很多家长都在犯愁给孩子喂饭的问题，所以，今天小编特意给家长们分享6道夏季辅食，仅需10分钟，就可以给宝宝制作出营养美味的辅食料理啦！', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621090716_97895.jpg');
INSERT INTO `bake_article` VALUES ('83', '4d98381bbb472cc43f3fc796eb8943a52d0d0c5c', '2', '宝宝的耳屎能挖吗？原来90%的家长都做错了！', 'http://mp.weixin.qq.com/s/MF2sYxVuNCw-THwgwxX99g', '耳屎是外耳道耵聍腺分泌的黏液状物质，很多妈妈看到宝宝耳朵里有耳屎，总是看着不舒服，想要弄出来', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621090756_11332.jpg');
INSERT INTO `bake_article` VALUES ('84', '3f677d77a2f8d9fb596d61a1103d9fc406691dc7', '2', '清凉一夏！推荐5款自制冰淇淋教程，宝宝爱吃又健康', 'http://mp.weixin.qq.com/s/xTkLRYVWpUL1_zQCcplXUg', '牛奶300克、蛋黄4个、淡奶油200克、白糖120克（和蛋黄混合时加70克；和奶油混合时加50克）', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621090855_70437.jpg');
INSERT INTO `bake_article` VALUES ('85', 'aaa6e4a245e55d714432ec54b1728e4e7d81f60f', '1', '孕妈妈注意，这5大类食物，孕妇不能吃！（吐血梳理食物48种）', 'http://mp.weixin.qq.com/s/D_BN8NdAzkNHpbP0HT6qQw', '备孕的妈妈或者已经怀孕的妈妈在大量饮用含有咖啡因的饮品或食物后，均会出现恶心、呕吐、头痛、心跳加快等症状。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621090942_16896.jpg');
INSERT INTO `bake_article` VALUES ('86', '6b3f18fa955131142cd00ee423de1c6000d6aa8b', '2', '夏日保护宝宝大作战——洗澡', 'http://mp.weixin.qq.com/s/gG5go7hEsy0FMmAQXDhJFg', '宝宝打过预防针后，皮肤上会暂时留有肉眼难见的针孔，这时洗澡容易使针孔受到污染。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621092157_61422.jpg');
INSERT INTO `bake_article` VALUES ('87', '1be5570989206fea10a2be0d3c02008ce0af9766', '25', '关于隔夜菜的小知识，尤其是夏天，千万要注意！', 'http://mp.weixin.qq.com/s/ESw_EsGRJY5LXtiBIG-bYw', '入夏后，温度升高，细菌活跃起来，肠道疾病进入高发季，有些菜隔夜后很毒', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621092314_60848.jpg');
INSERT INTO `bake_article` VALUES ('88', 'febb0e661896d37d369f11473648324e567471cd', '2', '宝宝护理：宝宝肠绞痛，妈妈知多少？', 'http://mp.weixin.qq.com/s/lewx1wbNMBjM0QIlI5qmbw', '是什么情况让宝宝哭闹不止？\r\n是什么问题宝宝莫名其妙的哭闹？\r\n是肠绞痛？', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621092402_26766.jpg');
INSERT INTO `bake_article` VALUES ('89', '48485cbc8d9a8a46fc5f726bd74345ff95a56617', '2', '千万别忽视孩子智商高的这20个表现！', 'http://mp.weixin.qq.com/s/p-RSjo0A8GOLihjeTmnDqw', '美国哈佛大学心理学教授霍华德·加德纳通过研究认为，人的基本能力可分为八种类型。小编为父母罗列出孩子在日常生活中的20种表现，千万忽视这些表现！', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621092514_19012.jpg');
INSERT INTO `bake_article` VALUES ('90', 'c9fb0f4d8a61d32bc64d2efc565ca790ee038f9e', '2', '家长绝不能纵容孩子的7件事，出现4条就要小心了！', 'https://mp.weixin.qq.com/s/_QpE1vECjVJEFsaLrh3A7g', '爱孩子，是父母的天性。这份爱中不仅要包含理智与宽存，更应松紧有度，要为儿女们在“可以”和“不可以”之间划一条清楚的界限，使他们的行为有章可循。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621092557_95091.jpg');
INSERT INTO `bake_article` VALUES ('91', '3ede103d9ea8d5320ddcf987742735de1b662b67', '2', '夏季清凉辅食N道，总有一道你家宝喜欢', 'http://mp.weixin.qq.com/s/3WkUKWhrmpFz5nIbOv1A-A', '入夏初始，大量水果蔬菜上市，但是胃口好像没有跟上，今天给大家整理几道清爽的小辅食，清凉补水，大人宝宝都可以吃哦', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621092839_77554.jpg');
INSERT INTO `bake_article` VALUES ('92', '2b9fbd17519ebfd848ba4e90c79aa586d39e49c7', '1', '孕妈是这两种血型的请注意，怀孕后麻烦大了……', 'https://mp.weixin.qq.com/s/boFGefdqKV0lhUmssuFk2w', '经常听说“三观不合”闹分手，“八字不合”不适婚，可你听说过“血型不合”怀孕也事儿多的吗？\r\n爸妈血型不合，孩子可能会溶血？！', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093012_55150.jpg');
INSERT INTO `bake_article` VALUES ('93', 'd4901f330a11aa5f2eed964740c67023308b5d32', '2', '好发愁~宝宝睡偏头了怎么办？如何给宝宝纠正头型呢？', 'http://mp.weixin.qq.com/s/vy5lKgssRD0trEbizhiYqw', '我们知道，新生宝宝的骨骼是较软的，肌肉力量小，只要受力不均匀，头部骨骼就有可能变形。睡眠姿势太单一，头部总是偏向一个方向，宝宝就特别容易睡偏头。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093038_83680.jpg');
INSERT INTO `bake_article` VALUES ('94', 'ed894f26a4f1829f3c47588b0135c3ff54779b7f', '2', '夏天了，妈妈要对宝宝做这些事情！', 'http://mp.weixin.qq.com/s/z0Y7ZnlI7reyhgLC_XP6gg', '进入夏天，天气炎热，妈妈们肯定是想尽量让宝宝舒服些，有的给宝宝剃光头，有的让宝宝穿开裆裤，其实这都是对宝宝健康不利的行为。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093112_71121.jpg');
INSERT INTO `bake_article` VALUES ('95', 'f88cf0085c321acb4b77c227338945f71533663e', '2', '这样养孩子，孩子会越来越笨，父母要警惕！', 'http://mp.weixin.qq.com/s/4PB0E27Hk1RYITJm9aa6dA', '从前，有一位莴苣姑娘，她有一头漂亮的金发，长得非常美丽。她从小就被一位巫婆关在一座高塔上面，巫婆每天都对莴苣说：“你的样子很丑，见到你的人都会感到害怕。”', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093156_44606.jpg');
INSERT INTO `bake_article` VALUES ('96', '2af2c48d0f72cb824f454c9a56efb8e3dd8dd80b', '2', '别傻傻分不清楚 溢奶吐奶不是一回事', 'http://mp.weixin.qq.com/s/BgYNmdLxSRewlGcm9EPbMg', '要想正确对待和处理宝宝的吐奶问题，首先要搞清楚吐奶是怎么回事，而分清溢奶和吐奶是最先需要弄清的事情。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093357_90686.jpg');
INSERT INTO `bake_article` VALUES ('97', '52ac2c1ccadf3f3ba1301e4b62a94a8fee3e270d', '25', '常吃这些蔬菜，有助孩子长高，你知道吗？', 'http://mp.weixin.qq.com/s/VZlWRp-Y2uhjcN0iN56h3w', '菜花又叫花椰菜，有白、绿两种。白菜花和绿菜花的营养价值基本相同，绿菜花比白菜花的胡萝卜素含量要高一些。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093438_98180.jpg');
INSERT INTO `bake_article` VALUES ('98', 'e9b52f620aa6136dfd5a90945e6d077af842f9fb', '25', '孩子的零食有三种级别，这样吃才最健康！建议收藏！', 'http://mp.weixin.qq.com/s/g0iF678TOeXAPqlWOCBD4g', '谁家孩子不爱吃零食？但在父母眼里，零食可不是什么好东西，富含有害身体的添加剂，高油高脂肪还不卫生。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093537_54598.jpg');
INSERT INTO `bake_article` VALUES ('99', '32b94d6aa6b4afe8d9758ef95715b64801c37086', '2', '宝宝体弱不聪明，妈妈怎么办？', 'http://mp.weixin.qq.com/s/dIEnvKFKAOGzRGkbTSYhPw', '铁元素可以促进脑组织的结合，对宝宝的智力发育至关重要，宝宝由于消化系统功能弱，食物单一，而且婴幼儿对铁的需求比成人多，所以最易产生缺铁。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093705_28940.jpg');
INSERT INTO `bake_article` VALUES ('100', '514c61624643c94d25fff136d33d043b8ea339c5', '1', '老话说“月子病月子养”，生二胎能养好“月子病”吗？', 'http://mp.weixin.qq.com/s/zveWmO5Hb1EZGNRub-QU2Q', '生完宝宝，有些妈妈会产生一些不舒服的感觉，比如怕风、怕冷、关节疼痛、腰酸背痛、浑身发沉、身体疲惫等等。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093817_75269.jpg');
INSERT INTO `bake_article` VALUES ('101', 'ae1e659fdc8d99e4a0ec21ee770438518c13c116', '2', '孩子7岁前要学会10种小本领，分享给家长！', 'http://mp.weixin.qq.com/s/yorzjr7ZOelXJra4hwxhhQ', '在孩子上小学之前，特别是在幼儿园里的几年，你知道孩子必须要学会的是什么本领吗？一起看看吧！', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621093938_44948.jpg');
INSERT INTO `bake_article` VALUES ('102', '4a1a992ad9e15ba5294e9b1fe06ef6e22a043b89', '2', '1-3岁宝宝辅食这样吃，靠谱！（附餐桌礼仪要点）', 'http://mp.weixin.qq.com/s/-wrlSAuGplev8PsdocDl6A', '宝宝1岁以后的饮食要从以奶类为主逐步过渡到以谷类食物为主，应增加蛋、肉、鱼、豆制品、蔬菜等食物的种类和数量', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621094033_36639.jpg');
INSERT INTO `bake_article` VALUES ('103', '5d8a3744a4537445c0b0666acdc8d42923b31bd3', '25', '忍不住咽口水的酸辣粉做法，太开胃了~', 'http://mp.weixin.qq.com/s/Mp0tPv1co24tb2m0zAAWaQ', '食材：红薯粉，蒜泥，生抽，老抽，醋，花椒粉，胡椒粉，盐，白糖，麻油，辣椒油，熟芝麻，葱末，浓 汤 宝，熟花生米，酥香黄豆，香菜', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621094109_13227.jpg');
INSERT INTO `bake_article` VALUES ('104', 'b40c899b1e188baa337356b9efc8fc54db689148', '25', '独生子女不能继承父母房产？看完懵了...', 'http://mp.weixin.qq.com/s/SQMIQ-srbSPnkrkjZ8n3wA', '很多人辛苦打拼一辈子，就是为了给家人更好的生活，把财富顺利地留给后代，但最近一条房产继承的消息，刷爆了朋友圈，看过的人都大呼意外', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621094309_71172.jpg');
INSERT INTO `bake_article` VALUES ('105', 'deb4c4779cb973b5bfe85e5477ad1fb31d7b745b', '2', '0～12岁孩子突发事件，七大必备应急预案！', 'http://mp.weixin.qq.com/s/hnSfQaTi7ffRdNP1Hx1U0w', '暑假就要来啦，孩子们在家的时间，独处的时间和户外活动的时间都相应变多，幼儿意外发生的几率也会比其他时段有所增加！', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621094459_77376.jpg');
INSERT INTO `bake_article` VALUES ('106', '57619d6e130a0ec253d402a17f780166a3a868c2', '25', '不要再这样给宝宝喝奶了，营养全没了！众多妈妈血泪总结', 'http://mp.weixin.qq.com/s/R9mRCn26qSqTM0LflBVUaA', '牛奶是孩子成长过程中必不可少的营养品，我们都知道牛奶的营养价值很高，很多妈妈也会选择每天让孩子饮用一定量的牛奶。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621094643_25451.jpg');
INSERT INTO `bake_article` VALUES ('107', '5540faa64faa2b50447411fab3a85156d8c220e3', '25', '妈妈注意，在孩子咳嗽期间，这几大类食物一定不能吃', 'https://mp.weixin.qq.com/s/7MFJCuz4wlCqjx8-DQPHOw', '宝宝在咳嗽期间除了对症处理，还有一个非常重要的方面就是饮食。饮食正确宝宝就能迅速恢复健康。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621094739_87318.jpg');
INSERT INTO `bake_article` VALUES ('108', 'f0608f35155c3ea2fad392a690526028b149c0e6', '25', '经常吃这7种健脑食物，咱家孩子更聪明！', 'http://mp.weixin.qq.com/s/r03x7AS3UfnaMHI2I6AM_g', '孩子的身体健康，是每个爸妈最关心的事儿。不过，爸妈们还有个小心愿，就是希望孩子在健康的同时，越来越聪明，智商若能甩同龄孩子一条街，才叫妙哉!', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621094829_89287.jpg');
INSERT INTO `bake_article` VALUES ('109', 'f0343aa53ee04b00c76ac219fe914996cf89fc1f', '1', '当妈的路上，你中枪了吗？', 'http://mp.weixin.qq.com/s/snLnDaGpAuR_CuZDOipz9A', '孔子曾说：“性相近，习相远”。每个孩子在生命的最初都是一张白纸，关键是看父母给他涂上什么颜色。所以家庭的教育方式直接关系到孩子的教养问题', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621095209_27573.jpg');
INSERT INTO `bake_article` VALUES ('110', 'd16b324f82bb446a8730cd883658d1f521d8d8c6', '2', '为什么带男孩比带女孩累？看了这个，你就明白了！', 'http://mp.weixin.qq.com/s/-U-OAz69awiRoE6KecsiAw', '男孩有多难带，每个生了儿子的妈妈都有一把辛酸泪…', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621095449_40965.jpg');
INSERT INTO `bake_article` VALUES ('111', '71ebda7abcb10adf343116b4f21a297a8985a39b', '2', '孩子应该跟谁睡？一张图看懂!', 'http://mp.weixin.qq.com/s/iVkl0OP7O9u7hF8zTJ6nfw', '孩子从小跟谁睡\r\n不仅仅是孩子和父母能不能休息好\r\n睡眠质量如何的前提\r\n还可能影响孩子的性格哦', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621095600_28084.jpg');
INSERT INTO `bake_article` VALUES ('112', 'b033a3a1f4f7dd51aa7029fccde5f6c4fb1bdc78', '1', '奇闻：英女孩自愿为母亲代孕，这生下的孩子得管她叫姐姐还是妈？', 'http://mp.weixin.qq.com/s/_IYHMWlgWQiVNPg1xoxuqw', '据英国《每日邮报》6月8日报道，英国汉普郡朴茨茅斯市的女子凯瑟琳(Katherine)的爸爸于7年前去世，母亲一直单身。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621095849_87300.jpg');
INSERT INTO `bake_article` VALUES ('113', '9fee00653b3ac7c2a25660b64f5e401589e86f15', '2', '新生儿怎么洗脸 给宝宝洗脸要这样洗', 'http://mp.weixin.qq.com/s/tTYcjS5hyKAF6CuO1C7F8Q', '指甲刀、棉花棒、婴儿油等护理用品都先一并放入篮子里。除了不会时常遗漏小东西，也能在需要的时刻立刻取出，携带也方便。', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621095930_17242.jpg');
INSERT INTO `bake_article` VALUES ('114', '126b1e95fdf5ba70898fccb46affa9305040659e', '2', '都30度了，还给孩子穿纸尿裤？要你管！', 'http://mp.weixin.qq.com/s/fVcBe6brBraDWC6istbQoA', '天气越来越热，妈妈们也有了个疑问：夏天这么热到底要不要继续给孩子用纸尿裤呢？', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621100005_44196.jpg');
INSERT INTO `bake_article` VALUES ('115', '51b1452260d6cbaca83a905acdf462c058feb5b6', '2', '网评最没用的9大母婴产品，第一名每家都有！', 'http://mp.weixin.qq.com/s/twNBS3PL5XbJR81Fy1TpOA', '每个妈妈都想把全世界最好的东西，全都败回家给自己的宝宝。然而，买回来才发现，这些东西居然是！鸡！肋！', 'http://api.shoumeikeji.cn/Bake/image/20170621/20170621100158_25570.jpg');
INSERT INTO `bake_article` VALUES ('117', '401d8b39945617f8c40f247b6f6b5a08fb9b457c', '1', '孕妇遇见小龙虾吃还是不吃！', 'http://mp.weixin.qq.com/s/jE7wE74IpbqyTOiuXypFtQ', '龙虾含蛋白质比较高，含有人体所需的8种必须氨基酸，而其氨基酸组成优于肉类；龙虾脂肪含量比较低，而且大多都是不饱和脂肪酸，易被人体吸收，同时可以防止胆固醇在体内蓄积', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627091600_98821.jpg');
INSERT INTO `bake_article` VALUES ('118', '486d79e1331e82916ac9fadf5e771862fe7d7174', '1', '等我老了，我就这样当婆婆！你呢？', 'http://mp.weixin.qq.com/s/XBcLysAtbjWtvngKhPLl5A', '自从生了儿子，突然觉得身上责任很重。因为，有人说“遇到好婆婆比中500万还幸运！”', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627091849_28948.jpg');
INSERT INTO `bake_article` VALUES ('119', '53bae771865c63c86829b7da3189b8dbdef22f94', '1', '女人，要么像辣椒一样有脾气， 要么像白菜一样有层次', 'http://mp.weixin.qq.com/s/lp3tr4Juup1o7REAxldeTQ', '人，要么像辣椒一样有脾气。\r\n要么像白菜一样有层次。\r\n要么像莲藕一样有心眼。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627092042_33937.jpg');
INSERT INTO `bake_article` VALUES ('120', '9788a6aba7e24a24ca6110ee11ad91a6061df2ec', '1', '一个爸爸用图片记录老婆孩子那些事儿，扎心！', 'http://mp.weixin.qq.com/s/Lg3Jbu_o5J1yIThMiLNhcg', '2014年5月1日，我们结婚了。我的孕爹生涯正是从此开始！', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627092437_59723.jpg');
INSERT INTO `bake_article` VALUES ('121', 'bc55efd9f365f6e400106c380f51559cef8025f8', '1', '宝妈超爱吃的八种面食（面食制作的图片详细教程）', 'http://mp.weixin.qq.com/s/Vz4LnbugK1oVo9rjTxAjbg', '原味馒头是由简单的面粉和酵母粉做成的，是河北、山东等地最常见的主食。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627092605_40772.jpg');
INSERT INTO `bake_article` VALUES ('122', '7eec01a8af7e1852b02bd19464bdb09cb73e7d29', '2', '千万别把孩子教养成一个不受欢迎的人', 'http://mp.weixin.qq.com/s/Gkv3e8Z0bol2vjAXc8Io1w', '早教课上，有那么一个孩子，不遵守秩序，乱抢别人的东西，不是推别的小孩一把，就是打人家一下，还总是抢完东西后朝人家吐口水。整个课堂，除了他的家长，别的家长都对其投之以厌恶的目光……', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627152520_85162.jpg');
INSERT INTO `bake_article` VALUES ('123', '10f5b1c3a1544b445f7008f7076058f2c1282899', '1', '致女人：亲爱的自己，委屈你了', 'http://mp.weixin.qq.com/s/nT5sbiRqjHFYWMSnGvC5kg', '亲爱的自己，从今天起为了自己骄傲的活着吧。好好爱自己，没有人会心疼你。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627153307_33282.jpg');
INSERT INTO `bake_article` VALUES ('124', '039f0f9c32c19d240e3f2d117fd136eaad969a41', '2', '教孩子这样道歉，等于耍流氓！', 'https://mp.weixin.qq.com/s/aXDDmNhtv3Ec32YOldpzqA', '近日，我的一名学生到一所学校去当实习老师，回来之后，她非常感慨的与我分享：现在的孩子很难教。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627154342_62129.jpg');
INSERT INTO `bake_article` VALUES ('125', 'ba2773b7e02345ef34921b27a769faddebb1089c', '2', '乱给孩子剪指甲后果很严重！十个妈妈里面有九个都剪错了！', 'http://mp.weixin.qq.com/s/VooM_oM7nkoFdyHdEDpHPQ', '孩子最近老闹腾，观察发现，孩子大脚趾红肿，指甲嵌进肉里面，经医生诊断孩子患了甲沟炎，而这一切竟然是我乱给孩子剪指甲惹的祸。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627154424_70455.jpg');
INSERT INTO `bake_article` VALUES ('126', 'a6e891d26bc871b8622e614df094b04a96b99250', '1', '怀孕时肚子上那条黑线到底是啥？真恼人！', 'http://mp.weixin.qq.com/s/MZ-w9DniBoTniKfyvxGQLQ', '看着肚皮上日益明显的那条黑线，准妈妈们是否好奇过，它到底是怎么来的，到底有什么用呢？其实，准妈妈怀孕期间出现在腹部中间的那条黑线，就是所谓的妊娠中线。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627155437_69572.jpg');
INSERT INTO `bake_article` VALUES ('127', '5ff79aeed3a1e94ee60e91568e6a30f93edb3dd7', '1', '孕妇洗头不能用吹风机？那我飘逸的长发怎么干？', 'http://mp.weixin.qq.com/s/kHQrz-d25cFgbMKqMaoSzg', '孕期到底能不能用吹风机，相信很多准妈妈都疑惑过，有人觉得吹风机辐射大，有人却觉得这纯属谣言，但是听说吹风机里吹出的石棉纤维微粒会导致宝宝畸形？', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627155653_12573.jpg');
INSERT INTO `bake_article` VALUES ('128', '9142d526149cfce41485cced0d7ec1b84d063a41', '25', '夏日美食之凉拌牛肚', 'http://mp.weixin.qq.com/s/sp9rZdMHZhlqsESZZqTZPg', '牛肚200克、黄瓜80克、色拉油1勺、食盐1勺、葱适量、蒜适量。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627155804_59760.jpg');
INSERT INTO `bake_article` VALUES ('129', 'e169cf5099af12f8c0307183619c5f38774f043a', '25', '和正确的人在一起（写的真好！）', 'http://mp.weixin.qq.com/s/_oV8vqu3kd9rZNlUMthrkA', '在现实生活中，你和谁在一起的确很重要，甚至能改变你的成长轨迹，决定你的人生成败。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627155938_47686.jpg');
INSERT INTO `bake_article` VALUES ('130', '8be4ddb9885a6665fbe4c2bf34958568c8dac9cb', '2', '你挣再多的钱，也挽回不了孩子这几年的缺失！', 'http://mp.weixin.qq.com/s/KbG8HpF7mVxyLD9BozqSJg', '无论你挣了多少钱，事业发展有多顺利，如果孩子的教育不得当，将来老了肯定会后悔。教育孩子不需要我们一门心思扑在孩子身上，但是也绝对不能拿事业繁忙来牺牲孩子。生下他就得负责任啊！', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160025_52284.jpg');
INSERT INTO `bake_article` VALUES ('131', 'fc2ad2794ef383fc0e1b7f05ecbcde6af00e950a', '2', '妈妈请走开，这6件事必须由爸爸来做！', 'http://mp.weixin.qq.com/s/g3DAxQoOU4N7dbK07P9KUw', '婴儿从5个月起，就感受到爸爸妈妈的爱不一样。当爸爸抱他的时候，他已经开始惊奇于爸爸的伟力，因为爸爸把他举得高，让他四肢伸展。所以，父亲是孩子最好的教练。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160122_73927.jpg');
INSERT INTO `bake_article` VALUES ('132', '33a561081024ad38c6c5dba1f38ae9f886913ee1', '2', '育儿小贴士之：如何改善孩子胆小', 'http://mp.weixin.qq.com/s/laBO7oKaT2lSzjhubBjTHQ', '给宝妈们发福利啦，看着人家的孩子自信大方，是不是你的心里像猫在抓呢？良心力作，赶紧围观', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160223_81566.jpg');
INSERT INTO `bake_article` VALUES ('133', '5ab1c65fab4d160ad8426fdb1b9a9e22d99ec35a', '25', '好吃的夏季凉拌菜之爽口素杂拌', 'https://mp.weixin.qq.com/s/XsODei4ueCHKmTyEc-q5ng', '胡萝卜半根、黄瓜半根、木耳（干）1朵、豆腐皮半张、花生50克、生抽2汤勺、香油适量、白醋1汤勺、白糖1/2汤勺、豉油1汤勺', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160408_40961.jpg');
INSERT INTO `bake_article` VALUES ('134', 'fbedde84131b5b490997e0e85050aa64351a6a6c', '2', '孩子的吃相，毫不留情地揭示了他的教养和未来', 'http://mp.weixin.qq.com/s/Md7tGs9fos93irL3VaD_ow', '现代的家庭里，有一些父母样样掐尖儿趋利，培养出“精致利己主义”的孩子；也有一些父母模糊教养和个性的边界，不懂得教孩子处世的礼节和分寸。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160439_69891.jpg');
INSERT INTO `bake_article` VALUES ('135', '507a3a9bd0812c4f6cf889e8fd1297eebd4dabe2', '2', '常喝水的宝宝更聪明，但这四种水千万不能喝！', 'http://mp.weixin.qq.com/s/6od_ByS1IXRm78fYxSQERg', '英国《每日邮报》曾报道：数百名大学生为研究对象，询问他们在考试前是否喝过水。结果发现，喝过水的人，成绩比没喝过的会提高10%。\r\n', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160517_38734.jpg');
INSERT INTO `bake_article` VALUES ('136', 'f6281e94f8ed9eb2d2373d07cfceaec6f6151146', '2', '宝宝身体出现这几种信号，就说明需要补充营养了！', 'https://mp.weixin.qq.com/s/I1HqUp0CvFM8dqxBlfGO7g', '不少爸爸妈妈们在抚养新生的宝宝时都会手足无措，突发情况不断。面对看起来是小毛病的问题，往往随随便便就放任过去，反而给宝宝之后的身体和生活埋下不好的苗子。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160601_41191.jpg');
INSERT INTO `bake_article` VALUES ('137', '237437ed07084fbecb766b35a607399039a249e5', '2', '宝宝睡觉总是蹬腿为什么，是长个？还是缺钙？', 'http://mp.weixin.qq.com/s/_reloT1djKUJkg5cTjTqTw', '宝宝们的睡眠质量，关键到宝宝的身体健康，因此妈妈们都非常紧张宝宝的睡眠质量。然而，宝宝睡觉的时候却开始总是有意无意的蹬腿，是缺钙?还是长个?', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160653_38222.jpg');
INSERT INTO `bake_article` VALUES ('138', '6314fe89e41a7d866b036ee5c2cfa9ba944f2107', '25', '夏日最好吃的凉拌菜之凉拌鸡腿肉', 'https://mp.weixin.qq.com/s/W2nqrJUa2lqj9ZcIiEenwA', '鸡腿2只、黄瓜半根、胡萝卜1小块、红甜椒1个、黄甜椒1个、梨子1个、白糖1茶匙、醋2汤匙、盐少许、香油少许、洋葱1/4个、料酒少许', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160721_76793.jpg');
INSERT INTO `bake_article` VALUES ('139', '9a13b9411b8e7d67f936f1a63eb928214f325b0d', '25', '一年已过半，这半年，你累吗？', 'http://mp.weixin.qq.com/s/2zPJcWXMEmFzHMKRE8n3uw', '大半年下来，有人问你挣了多少钱，却从来没有人问你，最近的日子你累不累', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160759_97804.jpg');
INSERT INTO `bake_article` VALUES ('140', 'd7973baad9c6a7973f256cce1e60a5e5736effd2', '25', '算算你家老公的价格，超过3500元就得看紧了！', 'http://mp.weixin.qq.com/s/pn4SDlaZBqYFiaf-ls-7lg', '任何东西都有自身的价值，甚至是你身边那位也有哦~快来算算自己的老公或者准老公到底值多少钱吧~', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627160916_21252.jpg');
INSERT INTO `bake_article` VALUES ('141', 'f5e056772c3274a30856dd91a0ea44e5e5a05b61', '2', '断奶看月龄，分龄有技巧', 'http://mp.weixin.qq.com/s/PJ3-1ZMBqHSQt_6cgFaWWA', '经历过断奶的妈妈，大多数表示那是一个充满辛酸泪的痛苦经历。但多数妈妈知道这是一个必然的过程，所以选择咬牙挺过去，其实，断母乳有很多技巧在里面，如果觉得痛苦，可能是方法出了问题。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627161003_37406.jpg');
INSERT INTO `bake_article` VALUES ('142', '8b08501129a64e7204e5be1bf441f07688b305e0', '25', '家长聪明还是平庸，10张图告诉你差距在哪？第一张就躺枪！', 'http://mp.weixin.qq.com/s/cVBlHj3Ruk5S4o36j9AoRA', '平心而论，在下面这些图片当中，“普通家长”比“聪明家长”表现得更加卖力和辛苦，但我们反而会更加认同“聪明家长”的教育方法。为什么呢？让我们一起来看看他们的家庭教育差距在哪里吧？', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627161322_61060.jpg');
INSERT INTO `bake_article` VALUES ('143', 'e39d3630e84548ad6bd6751911cef329c5e28e98', '25', '夏季美食之水晶青菜饺', 'http://mp.weixin.qq.com/s/Mf0_g7CKtRo_tXOAt1kD3Q', '一颗包菜或白菜、猪肉、鸡蛋、葱花、食用油、蚝油、盐', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627161439_90035.jpg');
INSERT INTO `bake_article` VALUES ('144', '340423a41a317c01f43b69134807ca70b42a3dee', '25', '夏季多给孩子吃这三样，可比吃肉强多了！', 'http://mp.weixin.qq.com/s/r3K06ebMwemP0LA1sE4SIg', '即将到来的三伏天，是一年中最热的时候，也是一年中宝宝最容易生病的时候。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627161536_14241.jpg');
INSERT INTO `bake_article` VALUES ('145', '1d4eba4548107b388b7cddabdad9ffca61c6ab49', '25', '别让孝顺绑架你的婚姻，夫妻和公婆都看看，家庭就和谐了！', 'https://mp.weixin.qq.com/s/5P0oGnVlVWvwlN2BX5m6gg', '当今社会，好像要求女人孝顺成了男人择偶的必备条件，我就非常不赞同有人找对象，要求别人孝顺自己的父母。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627161647_38386.jpg');
INSERT INTO `bake_article` VALUES ('146', '38aae1be317898b0899c486ab2c7a94c112721c7', '2', '5种“睡觉习惯”让孩子越睡越笨，妈妈们应高度重视！', 'http://mp.weixin.qq.com/s/LpeFrmxBHZBWeV8FfF_Zrg', '不知道宝妈们有没有注意过自家宝宝睡觉时的样子呢？宝宝的睡眠习惯是爸爸妈妈常常会忽略的问题。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627161736_13780.jpg');
INSERT INTO `bake_article` VALUES ('147', 'ea48678562fa39845439d301b9ecdebf85bb3ce3', '1', 'B超不是万能，孕期这些胎儿异常是检查不出来的！', 'http://mp.weixin.qq.com/s/pdDVkuwBKPrdYV4rAn79xQ', '孕期B超是在怀孕之后，孕妈妈一般都会定期的去医院做B超，检测宝宝的生长发育情况。这是一项为了检测胎儿健康发育的常规检查之一。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627161833_44236.jpg');
INSERT INTO `bake_article` VALUES ('148', 'c7adbcdfd8e5f4296cfb1aeca71112aed9c279da', '1', '我为什么要生孩子，这是最美的答案！', 'http://mp.weixin.qq.com/s/phclANVDGIypztjUTYsQEA', '昨天看到一段话，虽然没有几行，但字字珠玑，瞬间在我的心底升腾起暖意', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627161924_49313.jpg');
INSERT INTO `bake_article` VALUES ('149', 'a332485d57f1fb2055479bed8ac8448387310940', '2', '爸妈注意！别让亲友以喜欢的名义伤害孩子！', 'http://mp.weixin.qq.com/s/Tny7M4XvJKHDeISV6i3DeA', '逗孩子喝酒，以捉弄孩子为乐，吃东西时逗孩子。。。对孩子都是有危害的', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627162207_58471.jpg');
INSERT INTO `bake_article` VALUES ('150', '2121121928752905211dcddb5f5c0e5b77b4bb29', '2', '千万不要夸孩子漂亮或者帅气，想知道为什么吗？', 'https://mp.weixin.qq.com/s/gizWEl6550a8Urc9PrO3xA', '聪明与漂亮是先天的优势，而不是值得炫耀的资本和技能，但努力则不然，它是影响孩子一生的可贵品质。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627162342_88485.jpg');
INSERT INTO `bake_article` VALUES ('151', '86e74a0b64b898a151132893c0a3b102f40b38e9', '2', '两岁前不要总是抱孩子，否则孩子可能就毁了', 'https://mp.weixin.qq.com/s/13a1v_NsDBTKFpwsyWM0_w', '父母都往希望寄托在孩子身上，所以非常在乎孩子的。但是现实生活中，不少父母并不懂得怎么教育孩子，往往打着“这都是为他们”好的旗号，剥夺孩子的天性和权利，其实这样做都是在毁掉孩子，是非常失败的教育方式。', 'http://api.shoumeikeji.cn/Bake/image/20170627/20170627162420_34999.jpg');

-- ----------------------------
-- Table structure for bake_case
-- ----------------------------
DROP TABLE IF EXISTS `bake_case`;
CREATE TABLE `bake_case` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bake_case
-- ----------------------------
INSERT INTO `bake_case` VALUES ('1', '孕产期营养');
INSERT INTO `bake_case` VALUES ('2', '婴幼儿营养');
INSERT INTO `bake_case` VALUES ('3', '减肥瘦身');
INSERT INTO `bake_case` VALUES ('4', '慢病调理');
INSERT INTO `bake_case` VALUES ('24', '糖尿病');
INSERT INTO `bake_case` VALUES ('25', '爱样营养');

-- ----------------------------
-- Table structure for chat_log
-- ----------------------------
DROP TABLE IF EXISTS `chat_log`;
CREATE TABLE `chat_log` (
  `id` bigint(64) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL COMMENT '来源方',
  `to` varchar(255) DEFAULT NULL COMMENT '目的方',
  `content` text COMMENT '内容',
  `ctime` varchar(255) DEFAULT NULL,
  `type` int(4) DEFAULT NULL COMMENT '是否查看 1 未看 2 看过',
  `service` varchar(255) DEFAULT NULL COMMENT '服务标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat_log
-- ----------------------------
INSERT INTO `chat_log` VALUES ('1', null, null, null, '1490018471', '1', null);
INSERT INTO `chat_log` VALUES ('2', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u6cd5\\u56fd\\u7684\\u8d1f\\u62c5\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490019116', '2', null);
INSERT INTO `chat_log` VALUES ('3', null, null, 'null', '1490019130', '1', null);
INSERT INTO `chat_log` VALUES ('4', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u9ad8\\u89c4\\u683c\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490019133', '2', null);
INSERT INTO `chat_log` VALUES ('5', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u65b9\\u6cd5\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490019149', '2', null);
INSERT INTO `chat_log` VALUES ('6', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u65b9\\u6cd5\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490019160', '2', null);
INSERT INTO `chat_log` VALUES ('7', null, null, 'null', '1490019165', '1', null);
INSERT INTO `chat_log` VALUES ('8', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"gg \"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490019237', '1', null);
INSERT INTO `chat_log` VALUES ('9', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"ffdfd\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490019248', '2', null);
INSERT INTO `chat_log` VALUES ('10', null, null, 'null', '1490019257', '1', null);
INSERT INTO `chat_log` VALUES ('11', null, null, 'null', '1490019258', '1', null);
INSERT INTO `chat_log` VALUES ('12', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"fffff\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490019319', '2', null);
INSERT INTO `chat_log` VALUES ('13', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"bbb\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490019342', '2', null);
INSERT INTO `chat_log` VALUES ('14', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u8089\\u8089\\u4eba\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490019834', '2', null);
INSERT INTO `chat_log` VALUES ('15', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"11111\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490019838', '2', null);
INSERT INTO `chat_log` VALUES ('16', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u5443\\u5443\\u5443\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490019858', '2', null);
INSERT INTO `chat_log` VALUES ('17', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u5f97\\u5230\\u7684\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490019943', '2', null);
INSERT INTO `chat_log` VALUES ('18', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"ss\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490019984', '2', null);
INSERT INTO `chat_log` VALUES ('19', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"dd\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490020065', '2', null);
INSERT INTO `chat_log` VALUES ('20', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"yy\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490020113', '2', null);
INSERT INTO `chat_log` VALUES ('21', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"ttt\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"kefu\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490020236', '2', null);
INSERT INTO `chat_log` VALUES ('22', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"jjj\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490022325', '1', null);
INSERT INTO `chat_log` VALUES ('23', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"jjj\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490022345', '2', null);
INSERT INTO `chat_log` VALUES ('24', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"ll\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490022381', '2', 'service1');
INSERT INTO `chat_log` VALUES ('25', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"kk\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490022386', '2', 'service1');
INSERT INTO `chat_log` VALUES ('26', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u54c8\\u54c8\\u54c8\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490022581', '2', 'service1');
INSERT INTO `chat_log` VALUES ('27', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u54c8\\u54c8\\u54c8\\u54c8\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490022586', '2', 'service1');
INSERT INTO `chat_log` VALUES ('28', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u5c0f\\u6837\\u513f\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490023144', '2', 'service1');
INSERT INTO `chat_log` VALUES ('29', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u5927\\u6837\\u513f\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490023154', '2', 'service1');
INSERT INTO `chat_log` VALUES ('30', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"ggg\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490023234', '2', 'service1');
INSERT INTO `chat_log` VALUES ('31', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"ereer\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490023238', '2', 'service1');
INSERT INTO `chat_log` VALUES ('32', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u5475\\u5475\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490023245', '2', 'service1');
INSERT INTO `chat_log` VALUES ('33', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u54c8\\u54c8\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490023249', '2', 'service1');
INSERT INTO `chat_log` VALUES ('34', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"face[\\u563b\\u563b] \"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490023253', '2', 'service1');
INSERT INTO `chat_log` VALUES ('35', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"gg\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490023894', '1', 'service1');
INSERT INTO `chat_log` VALUES ('36', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"gggg\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490023903', '1', 'service1');
INSERT INTO `chat_log` VALUES ('37', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"ggg\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490023909', '2', 'service1');
INSERT INTO `chat_log` VALUES ('38', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u55ef\\u55ef\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490061882', '1', 'service1');
INSERT INTO `chat_log` VALUES ('39', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u8ba2\\u5355\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490061889', '2', 'service1');
INSERT INTO `chat_log` VALUES ('40', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u8ba9\\u4eba\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490061893', '2', 'service1');
INSERT INTO `chat_log` VALUES ('41', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u8089\\u8089\\u4eba\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490061897', '2', 'service1');
INSERT INTO `chat_log` VALUES ('42', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u55e1\\u55e1\\u55e1\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490061901', '2', 'service1');
INSERT INTO `chat_log` VALUES ('43', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u6c22\\u6c14\\u7403\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490061904', '2', 'service1');
INSERT INTO `chat_log` VALUES ('44', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"\\u8ba2\\u5355\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490061907', '2', 'service1');
INSERT INTO `chat_log` VALUES ('45', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"\\u653e\\u653e\\u98ce\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490061911', '2', 'service1');
INSERT INTO `chat_log` VALUES ('46', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"dsf\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490321852', '2', 'service1');
INSERT INTO `chat_log` VALUES ('47', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"ffg\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490321871', '2', 'service1');
INSERT INTO `chat_log` VALUES ('48', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"rrrrredfsddsfdsfdsfdsfdsfdf\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490321882', '2', 'service1');
INSERT INTO `chat_log` VALUES ('49', 'q1', 'q2', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u8bb8\\u95f2\\u5fc3\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\",\"id\":\"q1\",\"mine\":true,\"content\":\"fgfgdfgdfsdsfdsgfgfgfgfgdfgfdgfdgfgfgf\"},\"to\":{\"id\":\"q2\",\"name\":\"\\u4f5f\\u4e3d\\u5a05\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\"}}}', '1490321892', '2', 'service1');
INSERT INTO `chat_log` VALUES ('50', 'q2', 'q1', '{\"type\":\"message\",\"data\":{\"mine\":{\"username\":\"\\u4f5f\\u4e3d\\u5a05\",\"avatar\":\"http:\\/\\/tp4.sinaimg.cn\\/1345566427\\/180\\/5730976522\\/0\",\"id\":\"q2\",\"mine\":true,\"content\":\"jh\"},\"to\":{\"id\":\"q1\",\"name\":\"\\u8bb8\\u95f2\\u5fc3\",\"type\":\"service1\",\"avatar\":\"http:\\/\\/tp1.sinaimg.cn\\/1571889140\\/180\\/40030060651\\/1\"}}}', '1490321896', '2', 'service1');

-- ----------------------------
-- Table structure for diet_cate
-- ----------------------------
DROP TABLE IF EXISTS `diet_cate`;
CREATE TABLE `diet_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diet_cate
-- ----------------------------
INSERT INTO `diet_cate` VALUES ('1', '0', '孕产期营养');
INSERT INTO `diet_cate` VALUES ('2', '0', '婴幼儿营养');
INSERT INTO `diet_cate` VALUES ('3', '0', '三高慢病营养');
INSERT INTO `diet_cate` VALUES ('4', '1', '孕期反应');
INSERT INTO `diet_cate` VALUES ('6', '1', '月子营养');
INSERT INTO `diet_cate` VALUES ('7', '1', '产后肥胖');
INSERT INTO `diet_cate` VALUES ('8', '2', '婴幼儿喂养');
INSERT INTO `diet_cate` VALUES ('9', '2', '辅食添加');
INSERT INTO `diet_cate` VALUES ('10', '2', '药食同源');
INSERT INTO `diet_cate` VALUES ('11', '2', '儿童营养');
INSERT INTO `diet_cate` VALUES ('12', '3', '糖尿病');
INSERT INTO `diet_cate` VALUES ('13', '3', '高血压');
INSERT INTO `diet_cate` VALUES ('14', '3', '血脂异常');
INSERT INTO `diet_cate` VALUES ('15', '3', '慢病调理');
INSERT INTO `diet_cate` VALUES ('16', '3', '老年人营养');
INSERT INTO `diet_cate` VALUES ('17', '20', '增肌营养');
INSERT INTO `diet_cate` VALUES ('19', '20', '塑形');
INSERT INTO `diet_cate` VALUES ('20', '0', '运动营养');
INSERT INTO `diet_cate` VALUES ('21', '20', '减肥瘦身');
INSERT INTO `diet_cate` VALUES ('22', '20', '饮食调理');
INSERT INTO `diet_cate` VALUES ('23', '20', '运动营养');
INSERT INTO `diet_cate` VALUES ('24', '2', '母乳喂养');

-- ----------------------------
-- Table structure for diet_info
-- ----------------------------
DROP TABLE IF EXISTS `diet_info`;
CREATE TABLE `diet_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识符 ',
  `dietitian` varchar(255) DEFAULT NULL COMMENT '营养师标识',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `grade` varchar(255) DEFAULT NULL COMMENT '等级',
  `job` varchar(255) DEFAULT NULL COMMENT '工作单位、相关职业',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '大学所学的专业',
  `star` varchar(255) DEFAULT '0' COMMENT '好评率',
  `service_person` varchar(255) DEFAULT '0' COMMENT '服务人数',
  `service_order` varchar(255) DEFAULT '0' COMMENT '服务订单数',
  `tag` varchar(255) DEFAULT NULL COMMENT '擅长领域',
  `niche` varchar(255) DEFAULT NULL COMMENT '细分领域',
  `askprice` int(11) DEFAULT NULL COMMENT '被用户提问的价格',
  `mgpic` varchar(255) DEFAULT NULL COMMENT '免冠照片',
  `zspic` varchar(255) DEFAULT NULL COMMENT '营养师证书',
  `zhengpic` varchar(255) DEFAULT NULL COMMENT '身份证正面',
  `fanpic` varchar(255) DEFAULT NULL COMMENT '身份证反面',
  `desc` varchar(255) DEFAULT NULL COMMENT '简介描述',
  `ctime` varchar(255) DEFAULT NULL COMMENT '入驻时间',
  `status` int(11) DEFAULT '0' COMMENT ' 1：审核通过  0：正在审核 ',
  `subscribe` int(11) DEFAULT NULL COMMENT '营养师对公众号的关注状态 1：已关注 0：未关注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diet_info
-- ----------------------------
INSERT INTO `diet_info` VALUES ('109', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '李淑君', '18245183770', '北京大学（研究生）', '一级公共营养师', '北京京都儿童医院，临床营养师', '食品科学与工程', '97', '23', '5', '1', '4,6,7', '9900', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', 'http://api.shoumeikeji.cn/picture/14955298125730.jpg', null, null, '为病人提供专业健康营养咨询服务；\r\n与临床医师配合患者的诊疗方案；\r\n协助医护人员开展健康教育、营养指导知识与技能培训；\r\n协助临床开展营养评价及饮食指导工作；\r\n协助组织实施患者营养健康教育活动。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('111', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '陈正義', '13331183235', '清华大学', 'ACI国际注册营养师', '食品安全问题日益突出', '食品安全', '100', '2', '1', '20', '21', '1000', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', 'http://api.shoumeikeji.cn/picture/14955368444808.jpg', null, null, '食品安全问题日益突出食品安全问题日益突出食品安全问题日益突出食品安全问题日益突出', null, '1', '1');
INSERT INTO `diet_info` VALUES ('113', '68e71635073f005cdc94d19833a404b7a9671d8f', 'b5a5cf99068a9af159496c3ae56dd73c8e90e573', '关振园', '18500715605', '中国疾病预防控制中心（硕士）', '一级公共营养师', '8年医学训练，8年营养配餐以及人群干预经验', '预防医学', '0', '0', '0', '1', '4,6,7', '9900', 'http://api.shoumeikeji.cn/picture/14956300511650.jpg', 'http://api.shoumeikeji.cn/picture/14955537544792.jpg', null, null, '医学营养学管理和干预经验，擅长体重管理、孕产妇管理。曾作为王祖蓝工作室首席营养师管理旗下艺人营养、体重情况。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('114', 'b62c2fc89452671842779318431005974fb9ca23', 'de257e0863b8288789c5dbf0e4642e06a333e0ff', '王政', '15801412337', '中国农业大学', '二级公共营养师', '国家二级公共营养师', '食品科学与工程', '0', '0', '0', '20', '17,21,23', '990', 'http://api.shoumeikeji.cn/picture/14957700382271.jpg', 'http://api.shoumeikeji.cn/picture/14955943873332.jpg', null, null, '减脂，增肌，塑形', null, '1', '1');
INSERT INTO `diet_info` VALUES ('115', 'f66eaba440e026d4557717845735fcd57b9484d9', '32a17927f67c35678f0816876a710fe9c05ba7f7', '朱静', '18211082007', '中和教育', '三级公共营养师', '和时惠众\n臻月科技\n中航文化', '营养学', '0', '0', '0', '20', '21,22,23', '900', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5dEUJQa2yZYv6oPVhVsQKRAYKJcMmeCTXOkPNrUCURtugeWlhibdZt2lzEyh7tMjxpQibPmaib9Dpicq/0', 'http://api.shoumeikeji.cn/picture/14955947683396.jpg', null, null, '比较擅长减重，营养咨询。', null, '0', '1');
INSERT INTO `diet_info` VALUES ('116', '64dabdc86ec8637e0c8b5b476181adf3f996f2b2', 'e349c765a70f31293307e75d931a1a488258ae3f', '薛庆鑫', '13694321728', '吉林农业科技学院（学士）', '三级公共营养师', '国家三级公共营养师\r\n高级营养讲师\r\n首都保健营养美食学会高级会员\r\n吉林市食之育营养咨询总经理\r\n大众养生网营养顾问\r\n《知识就是力量》签约撰稿人', '食品科学与工程', '0', '0', '0', '20', '19,21', '990', 'http://api.shoumeikeji.cn/picture/14956016222222.jpg', 'http://api.shoumeikeji.cn/picture/14955974226255.jpg', null, null, '减肥建议科学辟谣', null, '1', '1');
INSERT INTO `diet_info` VALUES ('117', 'c8605a51efc2cf6f41ed7f2f6862a81fef36d391', '1c669433f15583632978485d8fa27532cc993762', '于斐', '15807555534', '北京大学（研究生）', '一级公共营养师', '2009年5月31日获得人事部中国商务技能研究院颁发的国际高级营养师资格证书，证书编号CBEC091YTYY001', '骨外科学', '0', '0', '0', '20', '21,22,23', '9900', 'http://api.shoumeikeji.cn/picture/14966478063303.jpg', 'http://api.shoumeikeji.cn/picture/14956283431533.jpg', null, null, '具有临床医学专业背景，可以更好的根据医学专业制定营养相关的方案', null, '1', '1');
INSERT INTO `diet_info` VALUES ('118', '1da12901f1e76e30515e29d6b2c38060d13f2041', '250d88b67bb5d2cb8df466f041a2c43726fbd5be', '周学辉', '13335202013', '山东中医药大学', '二级公共营养师', '山东淄博莲池妇婴医院  营养师', '医学营养', '0', '0', '0', '1', '4,6,7', '3000', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5d1X1tMkKXybGv2qMcVgjGTz8SaNCTTwG7FAibxGQIRdictnTBgRovHCyHLbKWEAMAUYSSiaQVFWnTX/0', 'http://api.shoumeikeji.cn/picture/14956322834385.jpg', null, null, '擅长孕期体重控制及孕期营养干预；妊娠期糖尿病医学营养治疗；月子食谱配制；健康讲座', null, '1', '1');
INSERT INTO `diet_info` VALUES ('119', '947877c616a5c1a3a75421dcfdbedf8584152808', '12a0b7c8fc8ce464927f83cb82822391b17d4ad2', '郑全森', '18701697626', '哈尔滨医科大学', '一级公共营养师', '百e国际，专家', '（营养学硕士）', '0', '0', '0', '3', '12,13,15', '9900', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKfQob47phddpIycgpLacChkuGKUsTQmG9vEBZVrxxjDUWBepnVaSogzQtFjhhpY9jm62BITLlnkw/0', 'http://api.shoumeikeji.cn/picture/14956327543938.jpg', null, null, '擅长慢病调理：如减肥，糖尿病调理，心脑血管病调理！', null, '1', '1');
INSERT INTO `diet_info` VALUES ('120', 'e7410c4ff5bebe2735ae0b1eada5ab9202a3dc23', '83a71158af82b9260847c575f03c08c2db622534', '雷云', '13522149261', '兰州理工大学技术工程学院', '三级公共营养师', '北京和时惠众医学研究院有限公司', '食品科学与工程', '0', '0', '0', '3', '12', '5000', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM53ea8azlFMdzleibKe4aoKyb6J3qnyCVcfqNoGoiaYibo5rFXD3O2ssFlUdHcGtsE5kzQsXsdC5NbYBPfxOv11nBVNMmvn9azIxE/0', 'http://api.shoumeikeji.cn/picture/14956330785439.jpg', null, null, '1.糖尿病系统调理；\n2.四高一胖人群的健康管理；\n3.营养调理及养生运动。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('122', '90531026e2ac88721a704887d46ee16c405e20b2', '3e7a1a10d05adee30a8d35e9ca4e1d77f2fc689e', '孙涛', '13031780123', '青岛大学', '三级公共营养师', '仁珍营养师事务所', '医学检验', '0', '0', '0', '20', '21,22,23', '2900', 'http://api.shoumeikeji.cn/picture/14956351066787.jpg', 'http://api.shoumeikeji.cn/picture/14956345382981.jpg', null, null, '央企特邀运动营养师，某大学体育代表队特邀运动营养师。现主要工作内容:某品牌俱乐部的比赛、训练期的营养水和饮食方案和训练方案的制定与监督；代谢综合症患者的运动营养控制和恢复；考生阶段期的饮食搭配；减肥，增肌，塑型人群的营养运动方案制定等', null, '1', '1');
INSERT INTO `diet_info` VALUES ('126', '62803165d70feec73d0f2e67bc2ac9b9249562c2', 'eb830e8c76a72fffb08fa96825056a6fba90a8bd', '于洋', '13701376926', '北京中医药大学', '二级公共营养师', '北京同仁堂中医医师', '中医养生', '0', '0', '0', '3', '14,15,16', '9900', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg2ZJeYCFvd0f6LJEaJGOFrU6lbTlicfk6mpqD6nZsIvZPlVicta6R04aQJ3icaWyPEEV3bgsaH65L3k/0', 'http://api.shoumeikeji.cn/picture/14956744539211.jpg', null, null, '北京同仁堂中医首席养生顾问，中医医师，擅长各种慢性疾病养生调理', null, '1', '0');
INSERT INTO `diet_info` VALUES ('128', '954cb68891c0b802f173dc13efcc98fc718b555c', '1bb3f758155e208ed151eabacf487a55af5ef9b2', '刘静', '18515980574', '慕尼黑工业大学', '三级公共营养师', '专业营养师', '营养与生物医学', '0', '0', '0', '3', '13,14,15', '5000', 'http://api.shoumeikeji.cn/picture/14961335462625.jpg', 'http://api.shoumeikeji.cn/picture/14956989396353.jpg', null, null, '擅长运用个性化食谱及功能性营养素进行三高慢病调理、超重／肥胖人群体重管理;\n\n', null, '1', '1');
INSERT INTO `diet_info` VALUES ('129', '865edad126130b2a107ebf749518b48283062a02', 'ed748cde5a37e9064e8cc511e80bacc945781a23', '于洋', '15313237525', '河北医科大学', '二级公共营养师', '国家公共营养师二级\n国家高级营养师', '中西医临床', '0', '0', '0', '20', '21,22,23', '2000', 'http://api.shoumeikeji.cn/picture/14958985189779.jpg', 'http://api.shoumeikeji.cn/picture/14957194395835.jpg', null, null, '1、有相关临床经验。2、中医和营养结合。3、擅长营养配餐和教育。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('130', '540f0370c99a93d4249262b451de628008f9abfc', 'f799ab07276df35097150eb6b447dc062c83aa37', '罗文婷', '18510036393', '澳大利亚悉尼大学（硕士）', 'ACI国际注册营养师', '曾在新加坡顶尖的大型公立医院任职临床营养师5年，有着丰富的临床经验。', '营养与饮食学', '0', '0', '0', '3', '12,14,15', '1000', 'http://api.shoumeikeji.cn/picture/14961590956417.jpg', 'http://api.shoumeikeji.cn/picture/14957251644413.jpg', null, null, '健康的生活方式是你对生活的一种态度……', null, '1', '1');
INSERT INTO `diet_info` VALUES ('131', '12c4e5a2510628df1609d47ec322138283d94807', 'd65dbb7a9effa59f9e2d26e09b2938cb45665599', '李雪', '18234304270', 'Kent State University ( 本科）', '三级公共营养师', '毕业后在美国的Kindred 老人院工作 10 个月\n期间在一个健康中心做营养咨询 对顾客提出各种问题进行解答 相应的推销本店的保健品 \n在校期间做兼职 做各种健康的食物给在校学生和教师', '营养学', '0', '0', '0', '3', '12,13,16', '1000', 'http://api.shoumeikeji.cn/picture/14957609843128.jpg', 'http://api.shoumeikeji.cn/picture/14957284752409.jpg', null, null, '1. 具有很好的亲和力和交际能力\n2. 一口流利的英语\n3. 具备专业知识和实践技巧', null, '1', '1');
INSERT INTO `diet_info` VALUES ('132', '333a66e8788a39b3a834cb7c827ff93d9dafc809', '1e156ab585428f1e36fd42f5afaf18084ce5b675', '刘晓敏', '18301184926', '郑州大学', '三级公共营养师', '在北京四海华辰科技有限公司从事营养工作两年多的时间。资历是营养师', '食品科学与工程', '0', '0', '0', '1', '4,7', '200', 'http://api.shoumeikeji.cn/picture/14957686898144.jpg', 'http://api.shoumeikeji.cn/picture/14957638853013.jpg', null, null, '1.食品专业，公家公共营养师，中国营养学会会员，参加多次营养学术会议2.擅长孕期体重管理，妊娠期糖尿病，孕期贫血，曾指导近千名孕产妇体重管理工作及孕期膳食指导3.愿能用专业的营养知识➕虔诚的工作态度➕接地气的营养方案，让我们一起越来越健康。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('133', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '张璐', '11111111111', '中国农业大学', '一级公共营养师', '爱样官方营养师', '食品科学与工程', '95', '1', '7', '1', '4', '1100', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', 'http://api.shoumeikeji.cn/picture/14957711265306.jpg', null, null, '多年临床营养经验，擅长孕产妇营养，产后肥胖，小儿早期发展于干预，儿童药食同源营养餐搭配。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('134', 'a5c38ee90159f047c9aa45cd4453d8e5effca76f', '5f8b2d424e0e71517d692a30807a640b6d2e9360', '邱欣晔', '18301102441', '延边大学（本科）', '二级公共营养师', '北京活力达科技发展有限公司      营养师\n首都保健营养美食学会       会员\n赛福凯瑞医学研究院       营养讲师', '食品科学与工程', '0', '0', '0', '2', '8,9,11', '3000', 'http://api.shoumeikeji.cn/picture/14962726278791.jpg', 'http://api.shoumeikeji.cn/picture/14958016263451.jpg', null, null, '1.擅长食品营养，食品安全，人群营养，饮食选择\n2.国家二级公共营养师，国家三级健康管理师\n3.《健康时报》《健康一点通》《家庭医生》《当代家庭教育》等报刊撰稿人', null, '1', '1');
INSERT INTO `diet_info` VALUES ('135', '67a86d396660d41e192f5a6b3625ebc035598e3c', '4c2e60c6317a0a96c729f23991c8d3d80f06dcab', '张明丽', '15910365229', '山西财大', '三级公共营养师', '从11年到16年在301医院工作，主要负责对临床病人膳食的负责、搭配等！16年后在一家医疗公司负责诊疗工作。后期成为食育志愿者，斯旺森健康使者！', '营养', '0', '0', '0', '3', '15,16', '500', 'http://api.shoumeikeji.cn/aiyang.jpg', 'http://api.shoumeikeji.cn/picture/14958523234488.jpg', null, null, '1、对慢病饮食搭配和管理\n2、体重管理\n', null, '0', '1');
INSERT INTO `diet_info` VALUES ('136', '8960918179c47486ad71b8654a520fae50450cdf', '0e270ccd91d4a05833e20eb1449777a2967ad9b9', '李昕忆', '13911662305', '北京中医药大学', '二级公共营养师', '国家二级营养师，现任职于北京新世纪妇儿医院', '中药学', '0', '0', '0', '1', '4,6,7', '900', 'http://api.shoumeikeji.cn/picture/14959389597829.jpg', 'http://api.shoumeikeji.cn/picture/14959387992056.jpg', null, null, '1.我毕业于北京中医药大学，中药专业，本科学历。之后进修了国家公共二级营养师。\n2.我自己一直对于通过饮食调理来达到驻颜、塑型、养生等有强烈的兴趣。\n3.我是一个五岁孩子的妈妈，当初生完宝宝，出了月子体重就恢复到产前90多斤，怀孕前的紧身牛仔裤马上又可以穿了。我愿意结合我的中医药及营养学的专业知识和个人生活经验，给予大家最大的帮助，我们一起永远年轻美好！', null, '1', '1');
INSERT INTO `diet_info` VALUES ('137', '9a5811c861190523423222c7a23575e641db9edd', 'fca05186a00bc23b062eaaa9c7740801f6f40410', '林亚莲', '15011348443', '韩山师范学校（本科）', '一级公共营养师', '担任馨月月子会所营养配餐师，专注为产后产妇月子餐搭配，产后身体康复指导。', '烹饪营养教育', '0', '0', '0', '1', '4,6,7', '900', 'http://api.shoumeikeji.cn/picture/14959642814277.jpg', 'http://api.shoumeikeji.cn/picture/14959565645887.jpg', null, null, '擅长：产后恢复、产后营养餐搭配、减肥套餐、慢病营养餐搭配，希望能够帮助到更多的妈妈。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('138', 'c049d629e80ab2a682b0153a56b7ea11a29c828b', '863665afad17b370f7b30b97a928c36f8425fcff', '杨启瑞', '15738222997', '西北民族大学', '三级公共营养师', '北京营科医疗科技有限公司 孕妇营养培训讲师', '食品科学与工程', '0', '0', '0', '1', '4', '1900', 'http://api.shoumeikeji.cn/picture/14960215215710.jpg', 'http://api.shoumeikeji.cn/picture/14959732653669.jpg', null, null, '擅长备孕和孕期膳食干预，尤其妊娠期糖尿病、肥胖、贫血、高血压等妊娠期疾病。\r\n', null, '1', '1');
INSERT INTO `diet_info` VALUES ('139', '10d1b7470d2a688e8388e6bf8c16b13e1bf9a05e', 'c8cbe76f645028444262b3cb82c6fdcd33d39dde', '孙丽娜', '15910638302', '北京中医药大学（本科）', '二级公共营养师', '京儿医院 高级营养咨询师\n小海豚双语幼儿园 营养师\n', '中西医结合', '0', '0', '0', '2', '9,10,11', '900', 'http://api.shoumeikeji.cn/picture/14986200932091.jpg', 'http://api.shoumeikeji.cn/picture/14960549662295.jpg', null, null, '擅长婴幼儿喂养指导，辅食添加指导，儿童膳食搭配，药食同源膳食调理儿童体质', null, '1', '1');
INSERT INTO `diet_info` VALUES ('140', '98c9838398cb7164a2d0bb5d26241940de820fb7', 'b79f080cb4720f17bf44d0fa7e23b41f6b6b3e03', '边颖', '15011421876', '中国农业大学', '二级公共营养师', '曾在北京四海华辰任营养讲师，给100多家妇幼保健院培训过孕期营养，目前自己开工作室', '食品质量与安全', '0', '0', '0', '1', '6,7', '1900', 'http://api.shoumeikeji.cn/picture/14961498902938.jpg', 'http://api.shoumeikeji.cn/picture/14961495738747.jpg', null, null, '中国营养学会会员，国家公共二级营养师，擅长营养配餐与母婴营养，从事营养工作6年，擅长产后及肥胖人群的瘦身调理，能够为客户提供量身服务，给出专业的有针对性的饮食指导方案。\r\n大众人群通过科学的膳食搭配，不仅能够减肥，还能改善便秘，达到减肥美容的效果；哺乳妈妈在哺乳期不影响宝宝口粮的情况下，既可以健身又可以继续做宝宝的“移动奶瓶”。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('141', 'ccffbddabf32abcda66a607a1a0097a4f5b64c8c', '05373f93552ecde82b6c2b41be4c895d16cf4a25', '王辰婧', '13681102066', '美国纽约长岛大学（营养学硕士）LongIslandUniversity', '一级公共营养师', '现在美国纽约PublicHealthSolutions公司WIC部门（孕妇，婴儿，孩童联邦政府营养健康组织）任职营养师。具体工作内容：营养和健康风险评估；根据病人的疾病史，营养需求进行营养搭配；提供一对一的营养咨询和教育，包括母乳喂养，孕妇，婴儿和孩童的营养饮食指导等。', '营养学', '0', '0', '0', '2', '8,24', '5000', 'http://api.shoumeikeji.cn/picture/14961935967678.jpg', 'http://api.shoumeikeji.cn/picture/14961925622514.jpg', null, null, '本人营养专业知识扎实，咨询经验丰富。特别是针对孕妇，婴儿和2-5岁孩童，母乳喂养的经验丰富。我愿意结合中西方的营养专业知识，给予大家最大的帮助。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('142', 'a81965fd8b377a863867b96c807bb33787ad900b', '92942657dc62ab1dec2e98dbf1dd5faa5a98cc64', '陈晨', '18611978532', '北京师范大学', '二级公共营养师', '1.2011.1-2014.3工作于北京市人民政府，主要负责局级以上领导(北京市市长、各位副市长、各委办主任等)的日常饮食指导、营养配餐！', '营养与食品卫生', '0', '0', '0', '20', '17,19,21', '3200', 'http://api.shoumeikeji.cn/picture/14962025982973.jpg', 'http://api.shoumeikeji.cn/picture/14962022859708.jpg', null, null, '由于个人比较喜欢运动健身，所以更倾向于减脂、塑形、增肌等健身领域的营养指导、健身配餐、健身餐制作等。 ', null, '1', '1');
INSERT INTO `diet_info` VALUES ('143', 'd3660c48a1e828dd899fe340e86350bc1e40bfe3', '2854ba8b8072d3e8d71e660cc748888b1005f7ed', '李晓凤', '18211138497', '南京农业大学', '三级公共营养师', '三级公共营养师\n2014.12-2015.6在北京四海华辰科技有限公司从事与孕期营养相关的工作，进行孕期营养调理以及相关咨询服务。\n之后一直从事与慢病调理相关工作。', '食品科学与工程', '0', '0', '0', '1', '4,7', '900', 'http://api.shoumeikeji.cn/picture/14984410438518.jpg', 'http://api.shoumeikeji.cn/picture/14962810396661.jpg', null, null, '系统的学习过孕期营养的相关知识，对于孕期的体重管理及妊娠期糖尿病有着丰富的经验。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('144', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', '2bdb2930a26213934d04f33c172342c31bf6c258', '杨松会', '13051764117', '北京大学', '一级公共营养师', '三级医院22年的临床工作经厉，12年的临床营养工作经验。2006年，曾在协和医院营养科进修学习，2012年曾在宣武医院营养科进修学习。', '（护理专业）', '0', '0', '0', '1', '4,6,7', '4900', 'http://api.shoumeikeji.cn/picture/14962961413888.jpg', 'http://api.shoumeikeji.cn/picture/14962822033862.jpg', null, null, '在妊娠糖尿病的营养治疗方面有丰富的临床工作经验，经过调理，一般一到三周都能达到正常水平。在高血压，二型糖尿病，高尿酸血症，冠心病，肾病，肿瘤患者的营养支持及鼻饲患者的治疗方面有丰富的经验。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('145', 'a570147d40871f63acad56a49bc80b10c49e6399', '3a740301d14f823bf3cea73294b73d164031c8b3', '李佳', '13934184247', '广东医学院（本科）', '三级公共营养师', '国家营养师三级', '预防医学（营养与食品卫生学）', '0', '0', '0', '20', '22', '500', 'http://api.shoumeikeji.cn/aiyang.jpg', 'http://api.shoumeikeji.cn/picture/14962883838342.jpg', null, null, '暂无', null, '0', '1');
INSERT INTO `diet_info` VALUES ('146', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '叶凤娟', '15010989106', '承德医学院', '二级公共营养师', '北京汉慈中医院', '护理专业', '0', '0', '0', '2', '8,9,11', '2000', 'http://api.shoumeikeji.cn/picture/14966248318419.jpg', 'http://api.shoumeikeji.cn/picture/14965826273081.jpg', null, null, '承德医学院英语护理专业毕业，国家注册护士，国家二级营养师，国家高级育婴师，中医高级催乳师，满月汗蒸师，儿童情商指导师，心理咨询师二级在学习备考阶段。擅长全科疾病营养咨询，备孕指导，儿童辅食添加，产后减肥瘦身！慢性病饮食指导！', null, '1', '1');
INSERT INTO `diet_info` VALUES ('147', 'efca22dd9d0aaaf984ec208266afaf21371b5301', '7888c94395681763f381a5c6750e45c908d6452d', '孙晓彤', '13161038794', '美国阿拉巴马大学', '一级公共营养师', '曾任职于优仕堂，源生谷等有机食品公司，为客户提供一对一营养咨询服务，并根据公司要求开展讲座等活动。', '营养与食品', '0', '0', '0', '3', '15', '900', 'http://api.shoumeikeji.cn/picture/14966404556576.jpg', 'http://api.shoumeikeji.cn/picture/14965857697429.jpg', null, null, '就读于美国阿拉巴马大学，学习内容涉及临床营养，人群营养，食品营养等等。', null, '1', '1');
INSERT INTO `diet_info` VALUES ('148', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'a95058840ac4335364ebebab048d94fa358012df', '李达', '13693276438', '南京大学', '二级公共营养师', '高等', '食物安全学', '0', '0', '0', '3', '14', '100', 'http://api.shoumeikeji.cn/aiyang.jpg', 'http://api.shoumeikeji.cn/picture/14966288548713.jpg', null, null, '品尝美食', null, '0', '1');
INSERT INTO `diet_info` VALUES ('149', '8edbdc4f1567b7ff8b029bde5b086f584a89fda9', '19b399a46c596979071aa3e211f631fecca6fbc1', '高寒', '18500902157', '牡丹江师范大学', '二级公共营养师', '国家高级公共营养师，6年营养相关工作经验。曾任北京宝岛妇产医院营养科营养师、轻加APP资深瘦身营养师。', '生物技术', '0', '0', '0', '1', '4,6,7', '2900', 'http://api.shoumeikeji.cn/picture/14983605607800.jpg', 'http://api.shoumeikeji.cn/picture/14968394617499.jpg', null, null, '1、擅长孕产妇营养。2、科学减肥。3、慢病管理。', '1496839469', '1', '1');
INSERT INTO `diet_info` VALUES ('150', '9b30e300fd8e84ba34d8bf5b38a5c7110d2916f2', '61f0960c78a1c6860e0775c194d3d16fa5738dcf', '陈珊珊', '13734700604', '东北农业大学', '二级公共营养师', '高级营养保健师\r\n国家二级营养师\r\n高级食品检验工', '食品科学与工程', '0', '0', '0', '20', '21', '990', 'http://api.shoumeikeji.cn/picture/14988136284656.jpg', 'http://api.shoumeikeji.cn/picture/14969226589622.jpg', null, null, '10年营养师工作经验，擅长减肥，女性备孕，母婴营养膳食搭配', '1496922704', '1', '1');
INSERT INTO `diet_info` VALUES ('151', '1f40489eca46b8b5450e124bc010f7e16a0a108d', '5bb9c09ceb26e5d9c2de3cafbc9a6240ceb45fc4', '祁利层', '13753326688', '长白山职业技术学院', '三级公共营养师', '从事孕产营养一年时间', '药学系', '0', '0', '0', '1', '4,6', '300', 'http://api.shoumeikeji.cn/picture/14984397194763.jpg', 'http://api.shoumeikeji.cn/picture/14978728685849.jpg', null, null, '从事孕期、产后、术后的配餐工作，接触过很多不同情况的顾客', '1497873002', '1', '1');
INSERT INTO `diet_info` VALUES ('152', 'e970ef250c37356236dd9338e12752d3c1673093', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '爱样', '18101392628', '北京大学（硕士）', '二级公共营养师', '爱样首席营养师，多年临床营养工作经验，擅长孕期营养，产期营养，母乳喂养，儿童药食同源营养餐搭配，小儿早期发展与干预。', '擅长：营养学', '0', '0', '0', '2', '8,10,11', '1000', 'http://api.shoumeikeji.cn/picture/14983763509228.jpg', 'http://api.shoumeikeji.cn/picture/14980131258838.jpg', null, null, '愿意用我的营养知识帮助和服务更多的妈妈是我最大的快乐，愿意和您们一起探索发现生活的美好。', '1498013127', '1', '1');
INSERT INTO `diet_info` VALUES ('153', '4d87c03ee8d502bfaa593b01afd3b1e3da33fd3a', '0fdc82d454023b6ad4c0ffec76490a46c3639cef', '杨莉', '18911285011', '英国里丁大学 （硕士）', '二级公共营养师', '康宝莱（中国）保健品有限公司\r\n营养师', '营养学', '0', '0', '0', '2', '9,11,24', '1900', 'http://api.shoumeikeji.cn/picture/14985435289801.jpg', 'http://api.shoumeikeji.cn/picture/14985378532321.jpg', null, null, '掌握系统的食品科学和营养学理论知识\r\n熟知各类人群的不同营养需求\r\n能够很好的运用营养学知识', '1498537873', '1', '1');
INSERT INTO `diet_info` VALUES ('154', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'c500928716b50c07534f4f8f49a345adfc8664cd', '葛璐', '18301420150', '北京中医药大学', '三级公共营养师', '擅长儿童药食同源营养餐搭配，小儿早期发展于干预，具有临床工作经验。', '（中西医结合）', '0', '0', '0', '20', '17,22,23', '9900', 'http://api.shoumeikeji.cn/picture/14985505708637.jpg', 'http://api.shoumeikeji.cn/picture/14985504971573.jpg', null, null, '工作踏实认真，对待客户的问题一丝不苟，遇到问题解决问题不逃避。', '1498550501', '1', '1');
INSERT INTO `diet_info` VALUES ('157', 'b7a396bf168ff5af76e416985cf5735ecedb03d4', 'f0ee928caf12653dbb15f94a5b530fe352341c79', '杨洋', '18519187627', '辽宁中医药大学(本科)', '三级公共营养师', '北京藏医院一年半健康管理师\r\n臻月公司一年半营养师', '食品科学与工程', '0', '0', '0', '1', '6', '990', 'http://api.shoumeikeji.cn/picture/14988117885618.jpg', 'http://api.shoumeikeji.cn/picture/14987927975321.jpg', null, null, '本人擅长孕产妇的营养搭配，用食疗的方式预防孕产妇的营养不良及高血糖等。', '1498792947', '1', '0');
INSERT INTO `diet_info` VALUES ('158', '260dadae650dc6ae2a03e7965e1dcfd602b97b42', 'b4c8e4db66615b695dff48b85d524aa46425051c', '冯元丽', '13331091913', '黑龙江中医大学', '二级公共营养师', '北京中医医院三年中医皮科，执业医师，营养师二级', '中医学', '0', '0', '0', '3', '12,13,14', '1900', 'http://api.shoumeikeji.cn/picture/14989782053174.jpg', 'http://api.shoumeikeji.cn/picture/14989660148002.jpg', null, null, '1.八年的临床慢病调理经验\n2.通过饮食和生活方式干预体重\n3.对中医药食同源有独到见解', '1498966184', '1', '1');
INSERT INTO `diet_info` VALUES ('160', 'ea3212da984a3a6814059c873456f08d3b37b6b4', 'ac604ccd0e6fa93d8eb714d07603665ccf640632', '范为宇', '13717777366', '辽宁医学院', '三级公共营养师', '从事营养师工作十余年，有在医院，健康管理，月子会所，移动医疗，养老等机构从业经验。', '临床医学', '0', '0', '0', '1', '4,6,7', '9900', 'http://api.shoumeikeji.cn/picture/14992319913312.jpg', 'http://api.shoumeikeji.cn/picture/14992305697714.jpg', null, null, '擅长各类人群的营养调理及咨询专业经验，尤其在孕婴营养方面，曾是影星李小璐及多位知名人士的月子期专职营养师。', '1499231264', '1', '1');

-- ----------------------------
-- Table structure for diet_order
-- ----------------------------
DROP TABLE IF EXISTS `diet_order`;
CREATE TABLE `diet_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单号',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `dietitian` varchar(255) DEFAULT NULL COMMENT '营养师标识',
  `totalprice` varchar(255) DEFAULT NULL COMMENT '服务总价',
  `ctime` varchar(255) DEFAULT NULL COMMENT '服务时间',
  `paytime` varchar(255) DEFAULT NULL,
  `third` varchar(255) DEFAULT NULL COMMENT '第三方单号',
  `status` int(11) DEFAULT NULL COMMENT '订单状态 1 提交订单 2 完成支付 3 服务中 4 服务结束',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diet_order
-- ----------------------------
INSERT INTO `diet_order` VALUES ('330', '2017052317381240', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1490000000', '1495532295', 'wx201705231738038d874228590403230181', '2');
INSERT INTO `diet_order` VALUES ('331', '2017052319036951', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1495537404', '1495537420', 'wx20170523190326b8ea6821100237451309', '2');
INSERT INTO `diet_order` VALUES ('336', '2017052321456766', '9b4858060a5997e2369bbd16b34788c069e90d1d', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '100', '1495547153', '1495547173', 'wx20170523214555a1a79b62320867238046', '2');
INSERT INTO `diet_order` VALUES ('337', '2017052614002598', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '100', '1495778441', '1495778459', 'wx20170526140043e04a4e46df0153064349', '2');
INSERT INTO `diet_order` VALUES ('338', '2017052614027719', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '100', '1495778520', '1495778539', 'wx20170526140202e35bc5ee070866936735', '2');
INSERT INTO `diet_order` VALUES ('340', '2017052715517120', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '100', '1495871467', '1495871477', 'wx2017052715510971fa67c88e0151150269', '2');
INSERT INTO `diet_order` VALUES ('344', '2017060309098703', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '100', '1496452187', '1496452199', 'wx20170603090948eb5819982a0991787072', '2');
INSERT INTO `diet_order` VALUES ('348', '2017060815186930', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '99800', '1496906320', '1496452199', 'wx20170608151841a9b71a909c0066181616', '1');
INSERT INTO `diet_order` VALUES ('349', '2017060819407637', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '100', '1496922020', '1496922032', 'wx20170608194021b5326c383a0727728706', '2');
INSERT INTO `diet_order` VALUES ('355', '2017060916599733', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1496998792', '1496998808', 'wx201706091659521d2724094b0410391969', '2');
INSERT INTO `diet_order` VALUES ('357', '2017060917043597', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1496999074', '1496999084', 'wx20170609170435030a6731f50608063267', '2');
INSERT INTO `diet_order` VALUES ('358', '2017060917056877', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1496999117', '1496999125', 'wx20170609170518c4b1712bb70256809847', '2');
INSERT INTO `diet_order` VALUES ('359', '2017061009051874', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497056700', '1497056718', 'wx20170610090501b42f4513d70757411998', '2');
INSERT INTO `diet_order` VALUES ('360', '2017061109225244', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497144139', '1497144150', 'wx201706110922197eeecd91bb0075636234', '2');
INSERT INTO `diet_order` VALUES ('361', '2017061210016703', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497232862', '1497232877', 'wx20170612100103232fc69f300636440285', '2');
INSERT INTO `diet_order` VALUES ('365', '2017061313547627', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497333285', '1497333294', 'wx20170613135446463dd0386b0419912770', '2');
INSERT INTO `diet_order` VALUES ('366', '2017061313558223', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497333342', '1497333358', 'wx2017061313554298df7327530876015502', '2');
INSERT INTO `diet_order` VALUES ('367', '2017061313566851', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497333366', '1497333379', 'wx20170613135607f88421542f0902150575', '2');
INSERT INTO `diet_order` VALUES ('379', '2017061917571049', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497866271', '1497866299', 'wx201706191757516715167d6a0417336570', '2');
INSERT INTO `diet_order` VALUES ('380', '2017062009097208', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497920971', '1497920985', 'wx20170620090931928458a1500905235506', '2');
INSERT INTO `diet_order` VALUES ('381', '2017062019362291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1497958563', '1497958574', 'wx20170620193604b8141352850655263323', '2');
INSERT INTO `diet_order` VALUES ('382', '2017062115214465', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1498029716', '1498029758', 'wx20170621152156295bd841d30361746110', '2');
INSERT INTO `diet_order` VALUES ('383', '2017062209115498', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1498093878', '1498093888', 'wx201706220911197c224558a40003382957', '2');
INSERT INTO `diet_order` VALUES ('384', '2017062311104070', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498187434', null, null, '1');
INSERT INTO `diet_order` VALUES ('385', '2017062311113763', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498187463', null, null, '1');
INSERT INTO `diet_order` VALUES ('386', '2017062311116460', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498187469', null, null, '1');
INSERT INTO `diet_order` VALUES ('387', '2017062311117189', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498187478', null, null, '1');
INSERT INTO `diet_order` VALUES ('388', '2017062311111751', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498187496', null, null, '1');
INSERT INTO `diet_order` VALUES ('389', '2017062311119419', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498187513', null, null, '1');
INSERT INTO `diet_order` VALUES ('390', '2017062311162595', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498187794', null, null, '1');
INSERT INTO `diet_order` VALUES ('391', '2017062311175801', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498187826', null, 'wx2017062311170720742248850162237784', '2');
INSERT INTO `diet_order` VALUES ('392', '2017062311264990', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498188412', null, null, '1');
INSERT INTO `diet_order` VALUES ('393', '2017062311281741', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498188528', null, null, '1');
INSERT INTO `diet_order` VALUES ('394', '2017062311294010', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498188562', null, null, '1');
INSERT INTO `diet_order` VALUES ('395', '2017062311302162', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498188617', null, null, '1');
INSERT INTO `diet_order` VALUES ('396', '2017062311314879', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498188705', null, null, '1');
INSERT INTO `diet_order` VALUES ('397', '2017062311315096', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498188713', null, null, '1');
INSERT INTO `diet_order` VALUES ('398', '2017062311375236', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498189054', null, null, '1');
INSERT INTO `diet_order` VALUES ('399', '2017062311419271', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498189289', null, null, '1');
INSERT INTO `diet_order` VALUES ('400', '2017062311421789', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498189325', null, null, '1');
INSERT INTO `diet_order` VALUES ('401', '2017062311501717', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498189809', null, null, '1');
INSERT INTO `diet_order` VALUES ('402', '2017062312004829', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498190449', null, null, '1');
INSERT INTO `diet_order` VALUES ('403', '2017062312026778', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498190520', null, null, '1');
INSERT INTO `diet_order` VALUES ('404', '2017062312039350', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '298000', '1498190612', null, null, '1');
INSERT INTO `diet_order` VALUES ('405', '2017062312031753', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498190633', null, null, '1');
INSERT INTO `diet_order` VALUES ('407', '2017062317238822', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498209830', '1498211823', 'wx20170623172350c249f22eaa0105391136', '2');
INSERT INTO `diet_order` VALUES ('408', '2017062412445452', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498279468', '1498279491', 'wx20170624124429dda9c1ff7d0608888023', '2');
INSERT INTO `diet_order` VALUES ('411', '2017062510362670', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498358178', '1498358189', 'wx20170625103618c17d328d7a0731906647', '2');
INSERT INTO `diet_order` VALUES ('412', '2017062714228991', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '0', '1498544533', null, null, '1');
INSERT INTO `diet_order` VALUES ('413', '2017062714221657', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '0', '1498544541', null, null, '1');
INSERT INTO `diet_order` VALUES ('414', '2017062714221120', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '0', '1498544556', null, null, '1');
INSERT INTO `diet_order` VALUES ('415', '2017062718364268', 'e970ef250c37356236dd9338e12752d3c1673093', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '1000', '1498559803', '1498559812', 'wx2017062718364382a83fac550952232541', '2');
INSERT INTO `diet_order` VALUES ('416', '2017062718455214', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1498560328', '1498560337', 'wx201706271845292486049c1c0083912418', '2');
INSERT INTO `diet_order` VALUES ('418', '2017062819434793', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1498650228', '1498650238', 'wx2017062819434853c258921b0095340881', '2');
INSERT INTO `diet_order` VALUES ('421', '2017062918045215', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1498730652', '1498730678', 'wx2017062918041285cf1ed2f00915366459', '2');
INSERT INTO `diet_order` VALUES ('423', '2017070214313216', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', '1498977114', null, 'wx201707021431559d99e19eb20072296384', '1');
INSERT INTO `diet_order` VALUES ('425', '2017070214334107', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498977215', '1498977224', 'wx2017070214333521a6a433da0954487192', '2');
INSERT INTO `diet_order` VALUES ('426', '2017070214472375', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498978022', '1498984255', 'wx20170702144702877ce221de0485280264', '2');
INSERT INTO `diet_order` VALUES ('427', '2017070220001762', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498996841', '1498996848', 'wx201707022000419782d895600639483873', '2');
INSERT INTO `diet_order` VALUES ('428', '2017070220029402', 'e970ef250c37356236dd9338e12752d3c1673093', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '100', '1498996955', '1498996964', 'wx20170702200236c738087ff70961232597', '2');
INSERT INTO `diet_order` VALUES ('431', '2017070716236465', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '500', '1499415806', '1499415814', 'wx201707071623263a4915b6230415042608', '2');
INSERT INTO `diet_order` VALUES ('432', '2017070716262216', '81fc18ecac44ec9ebaab056b236a8159f007f40f', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '500', '1499416018', '1499416030', 'wx20170707162659d8ba1964350137314339', '2');

-- ----------------------------
-- Table structure for diet_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `diet_order_detail`;
CREATE TABLE `diet_order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL,
  `ptoken` varchar(255) DEFAULT NULL COMMENT '营养师产品ID',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `status` varchar(255) DEFAULT NULL COMMENT '1.提交2.支付',
  `comment` varchar(255) DEFAULT NULL COMMENT '评论',
  `ptime` varchar(255) DEFAULT NULL COMMENT '评论时间',
  `star` varchar(255) DEFAULT NULL COMMENT '好评率',
  `name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `token` varchar(255) DEFAULT NULL,
  `dietitian` varchar(255) DEFAULT NULL COMMENT '营养师标识',
  `type` varchar(255) DEFAULT NULL COMMENT '评论　2.是　1.否',
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `month` int(11) DEFAULT NULL COMMENT '天数、月数或年数',
  `way` int(11) DEFAULT NULL COMMENT '1：年  2：月 3：日',
  `area` varchar(255) DEFAULT NULL COMMENT '服务范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diet_order_detail
-- ----------------------------
INSERT INTO `diet_order_detail` VALUES ('344', '2017052317381240', 'P201705231711432025', '1480000000', '1', '好评', '1495870666', '100', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '2', 'http://api.shoumeikeji.cn/diet/image/20170523/20170523171117_84364.png', '婴幼儿', '婴幼儿服务特性以及特点', '1', '3', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('345', '2017052319036951', 'P201705231711432025', '1495537404', '1', null, null, '0', null, 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170523/20170523171117_84364.png', '婴幼儿', '婴幼儿服务特性以及特点', '1', '3', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('348', '2017052320332595', 'P201705231711432025', '1480000000', '1', '好评', '1495870928', '100', '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '2', 'http://api.shoumeikeji.cn/diet/image/20170523/20170523171117_84364.png', '婴幼儿', '婴幼儿服务特性以及特点', '100', '3', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('350', '2017052321456766', 'P201705232145244762', '1480000000', '1', '完美', '1495870775', '100', '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '2', 'http://api.shoumeikeji.cn/diet/image/20170523/20170523214514_12072.png', '线下约见', '可在下线约见', '100', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('351', '2017052614002598', 'P201705261400178630', '1480000000', '1', '', null, '0', '', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '1', 'http://api.shoumeikeji.cn/diet/image/20170526/20170526140014_57740.png', '月子', 'asd', '100', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('352', '2017052614027719', 'P201705261400178630', '1495778520', '1', '很好', '1498730239', '100', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '2', 'http://api.shoumeikeji.cn/diet/image/20170526/20170526140014_57740.png', '月子', 'asd', '100', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('354', '2017052715517120', 'P201705261400178630', '1495871467', '1', '营养师非常专业，对待问题耐心解答', '1499237886', '100', '爱样@阿海', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '2', 'http://api.shoumeikeji.cn/diet/image/20170526/20170526140014_57740.png', '月子', 'asd', '100', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('355', '2017052715511055', 'P201705261400178630', '1480000000', '1', '服务态度非常好', '1495871681', '100', '爱样@阿海', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '2', 'http://api.shoumeikeji.cn/diet/image/20170526/20170526140014_57740.png', '月子', 'asd', '100', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('356', '2017052715511119', 'P201705261400178630', '1480000000', '1', '服务态度好，细心周到，下次还找你', '1495872674', '80', '爱样@阿海', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '2', 'http://api.shoumeikeji.cn/diet/image/20170526/20170526140014_57740.png', '月子', 'asd', '100', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('358', '2017060309098703', 'P201705261400178630', '1496452187', '1', null, null, '0', null, '9b4858060a5997e2369bbd16b34788c069e90d1d', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '1', 'http://api.shoumeikeji.cn/diet/image/20170526/20170526140014_57740.png', '月子产后', '月子餐设计、准备与制作咨询，开奶食谱，卡路里摄入监测（保证新生儿足够营养同时不让母体有过多吸收），排毒食谱，新生儿辅食添加、断奶，产后抑郁的合理预防、产后身材修复等内容。\r\n', '100', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('361', '2017060815186930', 'P201705251344134288', '1496906320', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '99800', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('362', '2017060819407637', 'P201705261400178630', '1496922020', '1', null, null, '0', null, '9b4858060a5997e2369bbd16b34788c069e90d1d', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '1', 'http://api.shoumeikeji.cn/diet/image/20170526/20170526140014_57740.png', '月子产后', '月子餐设计、准备与制作咨询，开奶食谱，卡路里摄入监测（保证新生儿足够营养同时不让母体有过多吸收），排毒食谱，新生儿辅食添加、断奶，产后抑郁的合理预防、产后身材修复等内容。\r\n', '100', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('363', '2017060916568994', 'P201706091645014542', '1496998589', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('364', '2017060916564948', 'P201706091645014542', '1496998593', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('365', '2017060916561893', 'P201706091645014542', '1496998599', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('366', '2017060916582716', 'P201706091645014542', '1496998684', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('368', '2017060916599733', 'P201706091645014542', '1496998792', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('370', '2017060917043597', 'P201706091645014542', '1496999074', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('371', '2017060917056877', 'P201706091645014542', '1496999117', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('372', '2017061009051874', 'P201706091645014542', '1497056700', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('373', '2017061109225244', 'P201706091645014542', '1497144139', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('374', '2017061210016703', 'P201706091645014542', '1497232862', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('376', '2017061217235884', 'P201706091645014542', '1497259424', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '100', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('378', '2017061313547627', 'P201706091645014542', '1497333285', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('379', '2017061313558223', 'P201706091645014542', '1497333342', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('380', '2017061313566851', 'P201706091645014542', '1497333366', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('386', '2017061509374002', 'P201706091645014542', '1497490651', '1', '', '', '0', '', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('387', '2017061509374002', 'P201706091645014542', '1497490651', '1', '', '', '0', '', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('388', '2017061509374002', 'P201706091645014542', '1497490651', '1', '', '', '0', '', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('396', '2017061917571049', 'P201706091645014542', '1497866271', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('397', '2017062009097208', 'P201706091645014542', '1497920971', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '2', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('398', '2017062019362291', 'P201706091645014542', '1497958563', '1', null, null, '0', null, '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('399', '2017062115214465', 'P201706091645014542', '1498029716', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('400', '2017062209115498', 'P201706091645014542', '1498093878', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170609/20170609164454_51030.png', '孕前', '孕期营养', '1', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('401', '2017062311104070', 'P201705251344134288', '1498187434', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('402', '2017062311113763', 'P201705251344134288', '1498187463', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('403', '2017062311116460', 'P201705251344134288', '1498187469', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('404', '2017062311117189', 'P201705251344134288', '1498187478', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('405', '2017062311111751', 'P201705251344134288', '1498187496', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('406', '2017062311119419', 'P201705251344134288', '1498187513', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('407', '2017062311162595', 'P201705251344134288', '1498187794', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('408', '2017062311175801', 'P201705251344134288', '1498187826', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('409', '2017062311264990', 'P201705251344134288', '1498188412', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('410', '2017062311281741', 'P201705251344134288', '1498188528', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('411', '2017062311294010', 'P201705251344134288', '1498188562', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('412', '2017062311302162', 'P201705251344134288', '1498188617', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('413', '2017062311314879', 'P201705251344134288', '1498188705', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('414', '2017062311315096', 'P201705251344134288', '1498188713', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('415', '2017062311375236', 'P201705251344134288', '1498189054', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('416', '2017062311419271', 'P201705251344134288', '1498189289', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('417', '2017062311421789', 'P201705251344134288', '1498189325', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('418', '2017062311501717', 'P201705251344134288', '1498189809', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('419', '2017062312004829', 'P201705251344134288', '1498190449', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('420', '2017062312026778', 'P201705251344134288', '1498190520', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('421', '2017062312039350', 'P201705251345166465', '1498190612', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134505_69805.png', '月子产后', '月子餐设计、准备与制作咨询，开奶食谱，卡路里摄入监测（保证新生儿足够营养同时不让母体有过多吸收），排毒食谱，新生儿辅食添加、断奶，产后抑郁的合理预防、产后身材修复等内容。\r\n', '298000', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('422', '2017062312031753', 'P201705251344134288', '1498190633', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('424', '2017062317238822', 'P201705251344134288', '1498209830', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('425', '2017062412445452', 'P201705251344134288', '1498279468', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('428', '2017062510362670', 'P201705251344134288', '1498358178', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134400_21143.png', '孕前期', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '100', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('429', '2017062714228991', 'P201706261916553078', '1498544533', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170626/20170626191647_60136.png', '免费', '免费服务', '0', '7', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('430', '2017062714221657', 'P201706261916553078', '1498544541', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170626/20170626191647_60136.png', '免费', '免费服务', '0', '7', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('431', '2017062714221120', 'P201706261916553078', '1498544556', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170626/20170626191647_60136.png', '免费', '免费服务', '0', '7', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('432', '2017062718364268', 'P201705232145244762', '1498559803', '1', null, null, '0', null, 'e970ef250c37356236dd9338e12752d3c1673093', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '1', 'http://api.shoumeikeji.cn/diet/image/20170523/20170523214514_12072.png', '线下约见', '可在下线约见', '1000', '1', '2', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('433', '2017062718455214', 'P201706261916553078', '1498560328', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170626/20170626191647_60136.png', '免费', '免费服务', '1', '1', '2', '不限');
INSERT INTO `diet_order_detail` VALUES ('435', '2017062819434793', 'P201706261916553078', '1498650228', '1', '恩不错', '1498985583', '100', '周长江哥', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '2', 'http://api.shoumeikeji.cn/diet/image/20170626/20170626191647_60136.png', '免费', '免费服务', '1', '1', '3', '不限');
INSERT INTO `diet_order_detail` VALUES ('438', '2017062918045215', 'P201706261916553078', '1498730652', '1', '非常棒', '1498985566', '100', '周长江哥', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '2', 'http://api.shoumeikeji.cn/diet/image/20170626/20170626191647_60136.png', '免费', '免费服务', '1', '1', '3', '不限');
INSERT INTO `diet_order_detail` VALUES ('440', '2017070214313216', 'P201707020930568162', '1498977114', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702093052_31176.png', '免费', '免费服务', '1', '1', '3', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('442', '2017070214334107', 'P201707020930568162', '1498977215', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702093052_31176.png', '免费', '免费服务', '100', '1', '3', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('443', '2017070214472375', 'P201707020930568162', '1498978022', '1', null, null, '0', null, '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702093052_31176.png', '免费', '免费服务', '100', '1', '3', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('444', '2017070220001762', 'P201707020930568162', '1498996841', '1', '营养师非常专业，服务态度也好。', '1499237794', '100', '爱样@阿海', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '2', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702093052_31176.png', '免费', '免费服务', '100', '1', '3', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('445', '2017070220029402', 'P201707020930568162', '1498996955', '1', null, null, '0', null, 'e970ef250c37356236dd9338e12752d3c1673093', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702093052_31176.png', '免费', '免费服务', '100', '1', '3', '大兴区');
INSERT INTO `diet_order_detail` VALUES ('448', '2017070716236465', 'P201706301026242507', '1499415806', '1', null, null, '0', null, 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '1', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630101401_74739.png', '免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。', '500', '7', '3', '不限');
INSERT INTO `diet_order_detail` VALUES ('449', '2017070716262216', 'P201706301026242507', '1499416018', '1', null, null, '0', null, '81fc18ecac44ec9ebaab056b236a8159f007f40f', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '1', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630101401_74739.png', '免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。', '500', '7', '3', '不限');

-- ----------------------------
-- Table structure for diet_product
-- ----------------------------
DROP TABLE IF EXISTS `diet_product`;
CREATE TABLE `diet_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ptoken` varchar(255) DEFAULT NULL COMMENT '营养师服务标识',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `desc` varchar(255) DEFAULT NULL COMMENT '简介',
  `price` int(11) DEFAULT NULL COMMENT '价格',
  `month` varchar(255) DEFAULT NULL COMMENT '服务时间',
  `way` int(11) DEFAULT NULL COMMENT '1：年 2：月 3：日',
  `dietitian` varchar(255) DEFAULT NULL COMMENT '营养师标识',
  `area` varchar(255) DEFAULT NULL COMMENT '服务范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diet_product
-- ----------------------------
INSERT INTO `diet_product` VALUES ('52', 'P201705232145244762', 'http://api.shoumeikeji.cn/diet/image/20170523/20170523214514_12072.png', '线下约见', '可在下线约见', '1000', '1', '2', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '大兴区');
INSERT INTO `diet_product` VALUES ('68', 'P201705251344134288', 'http://api.shoumeikeji.cn//image/20170702/20170702164623_98981.png', '孕期营养', '营养师提供宝宝发育和母亲身体情况提供孕早期不同阶段所需补充营养进行监测，最大程度地保证宝宝在母体里健康发育，为优生优育提供更加细致的一对一指导。', '99800', '1', '2', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '不限');
INSERT INTO `diet_product` VALUES ('69', 'P201705251345166465', 'http://api.shoumeikeji.cn/diet/image/20170525/20170525134505_69805.png', '坐月子', '月子餐设计、准备与制作咨询，开奶食谱，卡路里摄入监测（保证新生儿足够营养同时不让母体有过多吸收），排毒食谱，新生儿辅食添加、断奶，产后抑郁的合理预防、产后身材修复等内容。\r\n', '298000', '1', '2', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '不限');
INSERT INTO `diet_product` VALUES ('70', 'P201705261400178630', 'http://api.shoumeikeji.cn/diet/image/20170526/20170526140014_57740.png', '月子产后', '月子餐设计、准备与制作咨询，开奶食谱，卡路里摄入监测（保证新生儿足够营养同时不让母体有过多吸收），排毒食谱，新生儿辅食添加、断奶，产后抑郁的合理预防、产后身材修复等内容。\r\n', '99900', '1', '2', 'b4680f7d9e5ffd0208b88d5420603aa3e35120de', '大兴区');
INSERT INTO `diet_product` VALUES ('137', 'P201706301026242507', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630101401_74739.png', '免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。', '500', '7', '3', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '不限');
INSERT INTO `diet_product` VALUES ('138', 'P201706301037349322', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630102728_35690.png', '坐月子营养服务', '让你在家做月子享受国内外优秀营养师一对一服务，开奶食谱，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '99800', '1', '2', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '不限');
INSERT INTO `diet_product` VALUES ('139', 'P201706301100366156', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630105901_96279.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。', '598000', '1', '1', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '不限');
INSERT INTO `diet_product` VALUES ('141', 'P201706301336515708', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630131223_75605.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养膳食指导，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖。', '498000', '10', '2', '0abd01c2ae2d0d88f080e89bd7c32161ec8a3322', '不限');
INSERT INTO `diet_product` VALUES ('152', 'P201706301543321457', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630153716_17917.png', '营养师免费体验', '免费体验一对一的私人营养师服务，让您在家就能享受高端营养师，服务内容不限孕期营养，月子营养，婴幼儿辅食添加，婴幼儿育婴指导。', '10', '7', '3', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '不限');
INSERT INTO `diet_product` VALUES ('153', 'P201706301546273932', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630154437_45665.png', '婴幼儿成长发育', '为您家的宝宝提供0到2岁智力开发早教服务，3到8岁儿童情商开发服务，0到2岁营养辅食添加服务，婴幼儿育婴指导等。', '39800', '1', '2', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '不限');
INSERT INTO `diet_product` VALUES ('154', 'P201706301557368672', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630155615_45131.png', '孕期营养', '怀胎十月为准妈妈提供全方位的营养膳食指导，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖。        ', '298000', '10', '2', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '不限');
INSERT INTO `diet_product` VALUES ('155', 'P201706301558405459', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630155756_79467.png', '座月子', '让你在家做月子享受国内外优秀营养师一对一服务，开奶食谱，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '59800', '1', '2', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '不限');
INSERT INTO `diet_product` VALUES ('156', 'P201706301601217471', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630160050_35249.png', '婴幼儿成长发育', '为您家的宝宝提供0到2岁智力开发早教服务，3到8岁儿童情商开发服务，0到2岁营养辅食添加服务，婴幼儿育婴指导等。', '89800', '3', '2', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '不限');
INSERT INTO `diet_product` VALUES ('157', 'P201706301603194025', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630160240_46434.png', '婴幼儿成长发育', '为您家的宝宝提供0到2岁智力开发早教服务，3到8岁儿童情商开发服务，0到2岁营养辅食添加服务，婴幼儿育婴指导等。', '188800', '6', '2', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '不限');
INSERT INTO `diet_product` VALUES ('158', 'P201706301605356490', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630160528_55341.png', '婴幼儿成长发育', '为您家的宝宝提供0到2岁智力开发早教服务，3到8岁儿童情商开发服务，0到2岁营养辅食添加服务，婴幼儿育婴指导等。', '268800', '1', '1', 'b4eb210571d847123f5ae28e81e6cf7fa85e5036', '不限');
INSERT INTO `diet_product` VALUES ('159', 'P201706301647037661', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630164612_14501.png', '减肥瘦身', '专家营养师一对一服务，膳食营养搭配，减脂、增肌、塑形。按照月计算，保证每月瘦5斤，且健康状况良好。', '69800', '1', '2', '61f0960c78a1c6860e0775c194d3d16fa5738dcf', '不限');
INSERT INTO `diet_product` VALUES ('160', 'P201706301651497095', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630164832_16823.png', '免费体验', '运动营养师提供增肌，减脂，塑性，一对一指导，个性化定制服务方案', '10', '7', '3', '61f0960c78a1c6860e0775c194d3d16fa5738dcf', '不限');
INSERT INTO `diet_product` VALUES ('161', 'P201706301656266159', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630165450_66321.png', '免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        ', '10', '7', '3', 'f0ee928caf12653dbb15f94a5b530fe352341c79', '不限');
INSERT INTO `diet_product` VALUES ('162', 'P201706301658101091', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630165639_71687.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养膳食指导，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖。\r\n', '49800', '1', '2', 'f0ee928caf12653dbb15f94a5b530fe352341c79', '不限');
INSERT INTO `diet_product` VALUES ('163', 'P201706301700193849', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630165929_21207.png', '坐月子', '让你在家做月子享受国内外优秀营养师一对一服务，开奶食谱，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '69800', '1', '2', 'f0ee928caf12653dbb15f94a5b530fe352341c79', '不限');
INSERT INTO `diet_product` VALUES ('164', 'P201706301703281599', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630170037_52685.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '59800', '1', '2', 'f0ee928caf12653dbb15f94a5b530fe352341c79', '不限');
INSERT INTO `diet_product` VALUES ('165', 'P201706301727589164', 'http://api.shoumeikeji.cn//image/20170630/20170630173512_89779.png', '免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。', '10', '7', '3', '0fdc82d454023b6ad4c0ffec76490a46c3639cef', '不限');
INSERT INTO `diet_product` VALUES ('166', 'P201706301730519739', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630172938_18029.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '49800', '1', '2', '0fdc82d454023b6ad4c0ffec76490a46c3639cef', '不限');
INSERT INTO `diet_product` VALUES ('167', 'P201706301732073347', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630173115_40608.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案。\r\n', '398000', '10', '2', '0fdc82d454023b6ad4c0ffec76490a46c3639cef', '不限');
INSERT INTO `diet_product` VALUES ('168', 'P201706301733046477', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630173300_63440.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案 。      \r\n', '59800', '1', '2', '0fdc82d454023b6ad4c0ffec76490a46c3639cef', '不限');
INSERT INTO `diet_product` VALUES ('169', 'P201706301738247031', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630173812_33623.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        ', '10', '7', '3', 'b79f080cb4720f17bf44d0fa7e23b41f6b6b3e03', '不限');
INSERT INTO `diet_product` VALUES ('170', 'P201706301744589740', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630174446_80425.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案 。      \r\n', '49800', '1', '2', 'b79f080cb4720f17bf44d0fa7e23b41f6b6b3e03', '不限');
INSERT INTO `diet_product` VALUES ('171', 'P201706301745408624', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630174507_62646.png', '座月子', '让你在家做月子享受国内外优秀营养师一对一服务，开奶食谱，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '59800', '1', '2', 'b79f080cb4720f17bf44d0fa7e23b41f6b6b3e03', '不限');
INSERT INTO `diet_product` VALUES ('172', 'P201706301746292549', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630174548_90822.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '49800', '1', '2', 'b79f080cb4720f17bf44d0fa7e23b41f6b6b3e03', '不限');
INSERT INTO `diet_product` VALUES ('173', 'P201706301754089811', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630175301_95043.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        ', '10', '7', '3', '5bb9c09ceb26e5d9c2de3cafbc9a6240ceb45fc4', '不限');
INSERT INTO `diet_product` VALUES ('174', 'P201706301757338151', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630175534_18282.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案 。      \r\n', '49800', '1', '2', '5bb9c09ceb26e5d9c2de3cafbc9a6240ceb45fc4', '不限');
INSERT INTO `diet_product` VALUES ('175', 'P201706301758303253', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630175745_51173.png', '坐月子', '让你在家做月子享受国内外优秀营养师一对一服务，开奶食谱，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '69800', '1', '2', '5bb9c09ceb26e5d9c2de3cafbc9a6240ceb45fc4', '不限');
INSERT INTO `diet_product` VALUES ('176', 'P201706301759318138', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630175846_71438.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '59800', '1', '2', '5bb9c09ceb26e5d9c2de3cafbc9a6240ceb45fc4', '不限');
INSERT INTO `diet_product` VALUES ('177', 'P201706301808213100', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630180748_48117.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        ', '10', '7', '3', '1e156ab585428f1e36fd42f5afaf18084ce5b675', '不限');
INSERT INTO `diet_product` VALUES ('178', 'P201706301809033214', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630180830_34091.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案 。      \r\n', '49800', '1', '2', '1e156ab585428f1e36fd42f5afaf18084ce5b675', '不限');
INSERT INTO `diet_product` VALUES ('179', 'P201706301809477766', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630180917_97985.png', '坐月子营养服务', '让你在家做月子享受国内外优秀营养师一对一服务，开奶食谱，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '69800', '1', '2', '1e156ab585428f1e36fd42f5afaf18084ce5b675', '不限');
INSERT INTO `diet_product` VALUES ('180', 'P201706301815561704', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630181229_37128.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '59800', '1', '2', '1e156ab585428f1e36fd42f5afaf18084ce5b675', '不限');
INSERT INTO `diet_product` VALUES ('181', 'P201706301938331588', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630193753_86666.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        ', '10', '7', '3', 'fca05186a00bc23b062eaaa9c7740801f6f40410', '不限');
INSERT INTO `diet_product` VALUES ('182', 'P201706301939166544', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630193844_88870.png', '坐月子', '让你在家做月子享受国内外优秀营养师一对一服务，开奶食谱，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '79800', '1', '2', 'fca05186a00bc23b062eaaa9c7740801f6f40410', '不限');
INSERT INTO `diet_product` VALUES ('183', 'P201706301940077891', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630193927_36859.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案 。      \r\n', '59800', '1', '2', 'fca05186a00bc23b062eaaa9c7740801f6f40410', '不限');
INSERT INTO `diet_product` VALUES ('184', 'P201706301940555774', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630194045_74804.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '59800', '1', '2', 'fca05186a00bc23b062eaaa9c7740801f6f40410', '不限');
INSERT INTO `diet_product` VALUES ('185', 'P201706301945195471', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630194439_27822.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '59800', '1', '2', 'e349c765a70f31293307e75d931a1a488258ae3f', '不限');
INSERT INTO `diet_product` VALUES ('186', 'P201706301948147535', 'http://api.shoumeikeji.cn/diet/image/20170630/20170630194528_17332.png', '私人营养师', '提供一对一私人营养师服务，不限于，增肌，减脂，塑性，制定个性化运动营养方案。', '10', '7', '3', 'e349c765a70f31293307e75d931a1a488258ae3f', '不限');
INSERT INTO `diet_product` VALUES ('187', 'P201707010924162703', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701092210_16279.png', '母乳喂养', '母乳喂养姿势，频率，如何使母乳充盈。', '99800', '1', '2', '05373f93552ecde82b6c2b41be4c895d16cf4a25', '不限');
INSERT INTO `diet_product` VALUES ('188', 'P201707011048477907', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701104810_19426.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        \r\n', '10', '7', '3', '19b399a46c596979071aa3e211f631fecca6fbc1', '不限');
INSERT INTO `diet_product` VALUES ('189', 'P201707011049457412', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701104902_38646.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案 。      \r\n', '49800', '1', '2', '19b399a46c596979071aa3e211f631fecca6fbc1', '不限');
INSERT INTO `diet_product` VALUES ('190', 'P201707011050459207', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701105034_78413.png', '坐月子营养服务', '让你在家做月子享受国内外优秀营养师一对一服务，母乳喂养指导，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '79800', '1', '2', '19b399a46c596979071aa3e211f631fecca6fbc1', '不限');
INSERT INTO `diet_product` VALUES ('191', 'P201707011051319367', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701105059_63262.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '59800', '1', '2', '19b399a46c596979071aa3e211f631fecca6fbc1', '不限');
INSERT INTO `diet_product` VALUES ('194', 'P201707011123013544', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701112221_48747.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        \r\n', '10', '7', '3', '863665afad17b370f7b30b97a928c36f8425fcff', '不限');
INSERT INTO `diet_product` VALUES ('195', 'P201707011125389910', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701112437_26218.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案 。      \r\n', '49800', '1', '2', '863665afad17b370f7b30b97a928c36f8425fcff', '不限');
INSERT INTO `diet_product` VALUES ('196', 'P201707011126291537', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701112550_66257.png', '坐月子', '让你在家做月子享受国内外优秀营养师一对一服务，母乳喂养指导，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '69800', '1', '2', '863665afad17b370f7b30b97a928c36f8425fcff', '不限');
INSERT INTO `diet_product` VALUES ('197', 'P201707011127162897', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701112638_20380.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '59800', '1', '2', '863665afad17b370f7b30b97a928c36f8425fcff', '不限');
INSERT INTO `diet_product` VALUES ('198', 'P201707011541159097', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701154009_77791.png', '孕期营养管理', '提供早中晚营养管理和体重管理，妊娠期糖尿病医学营养治疗，孕期并发症饮食指导。\r\n', '56800', '1', '2', '250d88b67bb5d2cb8df466f041a2c43726fbd5be', '不限');
INSERT INTO `diet_product` VALUES ('199', 'P201707011543181404', 'http://api.shoumeikeji.cn/diet/image/20170701/20170701154127_47654.png', '坐月子', '根据产妇不同体质配制月子调理餐，恢复身体保持身材，保证优良乳汁，月子配餐，我需要辨体质，看舌色，问体症，然后选择食物配餐。', '106800', '1', '2', '250d88b67bb5d2cb8df466f041a2c43726fbd5be', '不限');
INSERT INTO `diet_product` VALUES ('200', 'P201707020930568162', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702093052_31176.png', '免费', '免费服务', '100', '1', '3', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '大兴区');
INSERT INTO `diet_product` VALUES ('201', 'P201707021635162014', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702163415_75816.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        \r\n', '10', '7', '3', '2854ba8b8072d3e8d71e660cc748888b1005f7ed', '不限');
INSERT INTO `diet_product` VALUES ('202', 'P201707021641344926', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702163525_14262.png', '孕期营养服务', '为孕妈妈提供孕期营养指导，长胎不长肉，为宝宝最初的生长发育提供营养支持，同时预防妊辰期合并症的发生。', '49800', '1', '2', '2854ba8b8072d3e8d71e660cc748888b1005f7ed', '不限');
INSERT INTO `diet_product` VALUES ('203', 'P201707021945317044', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702194443_51220.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        \r\n', '10', '7', '3', '2bdb2930a26213934d04f33c172342c31bf6c258', '不限');
INSERT INTO `diet_product` VALUES ('204', 'P201707021946393109', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702194541_53113.png', '孕期营养服务', '提供备孕期的营养咨询，孕期各个阶段的营养咨询。特别是对妊娠糖尿病有独特的营养治疗经验，哺乳期的营养咨询等。', '59800', '1', '2', '2bdb2930a26213934d04f33c172342c31bf6c258', '不限');
INSERT INTO `diet_product` VALUES ('205', 'P201707022204006225', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702220315_93770.png', '免费体验', '免费为您解答生活中的营养问题，比如饮食、运动、加工、食材选择等营养误区问题。\r\n', '1000', '7', '3', '5f8b2d424e0e71517d692a30807a640b6d2e9360', '不限');
INSERT INTO `diet_product` VALUES ('206', 'P201707022205525245', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702220502_96351.png', '孕期营养服务', '改善您的饮食生活习惯，调节身体状况，充分的备孕营养计划是迎接宝宝的必备功课；孕期不同阶段的营养促进胎儿的正常发育，孕期增重，孕期反应，科学孕育健康的生命。\r\n', '39800', '1', '2', '5f8b2d424e0e71517d692a30807a640b6d2e9360', '不限');
INSERT INTO `diet_product` VALUES ('207', 'P201707022206548360', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702220634_98676.png', '学龄前儿童营养', '针对学龄前儿童家庭、生活、饮食习惯，提供指导建议，改善孩子的饮食习惯和营养摄入，为宝宝进入学校打下良好基础，提高免疫力。\r\n', '298000', '6', '2', '5f8b2d424e0e71517d692a30807a640b6d2e9360', '不限');
INSERT INTO `diet_product` VALUES ('208', 'P201707022208593292', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702220842_32995.png', '青少年儿童营养', '根据青少年儿童生长发育的关键时期，提供合理的膳食搭配和运动计划，预防慢性疾病青少年化。\r\n', '59800', '1', '2', '5f8b2d424e0e71517d692a30807a640b6d2e9360', '不限');
INSERT INTO `diet_product` VALUES ('209', 'P201707022210302006', 'http://api.shoumeikeji.cn/diet/image/20170702/20170702221018_82101.png', '饮食误区挑食材', '针对日常生活中常见的饮食误区和食材挑选要点进行解答，在食物烹调源头上促进营养的吸收。', '6800', '3', '3', '5f8b2d424e0e71517d692a30807a640b6d2e9360', '不限');
INSERT INTO `diet_product` VALUES ('210', 'P201707031551071424', 'http://api.shoumeikeji.cn/diet/image/20170703/20170703155033_64325.png', '孕期免费体验', '为备孕妈妈提供一对一的私人营养师服务，让备孕期间长胎不长肉营养有效摄取，饮食结构调整，胎盘的生长发育，身体各项营养指标建议，肥胖预防。        \r\n', '10', '7', '3', 'b5a5cf99068a9af159496c3ae56dd73c8e90e573', '不限');
INSERT INTO `diet_product` VALUES ('211', 'P201707031552443592', 'http://api.shoumeikeji.cn/diet/image/20170703/20170703155159_30404.png', '孕期营养服务', '怀胎十月为准妈妈提供全方位的营养诊断，孕期高危因素，孕期反应，孕期综合症，疾病预防，产后肥胖，制定个性化营养方案 。      \r\n', '49800', '1', '2', 'b5a5cf99068a9af159496c3ae56dd73c8e90e573', '不限');
INSERT INTO `diet_product` VALUES ('212', 'P201707031553246823', 'http://api.shoumeikeji.cn/diet/image/20170703/20170703155252_87500.png', '坐月子', '让你在家做月子享受国内外优秀营养师一对一服务，母乳喂养指导，定制月子餐方案，宝宝辅食添加，月子期的肥胖预防等。\r\n', '69800', '1', '2', 'b5a5cf99068a9af159496c3ae56dd73c8e90e573', '不限');
INSERT INTO `diet_product` VALUES ('213', 'P201707031554177478', 'http://api.shoumeikeji.cn/diet/image/20170703/20170703155336_35181.png', '婴幼儿成长发育', '提供婴幼儿0-3岁不同发育阶段合理饮食习惯培养咨询，宝宝辅食添加，儿童药食同源营养餐搭配，小儿早期发展于干预。        \r\n', '59800', '1', '2', 'b5a5cf99068a9af159496c3ae56dd73c8e90e573', '不限');
INSERT INTO `diet_product` VALUES ('214', 'P201707051521496629', 'http://api.shoumeikeji.cn/diet/image/20170705/20170705152027_26338.png', '坐月子宝宝喂养', '月子期定制个性化食谱，包括饮食催乳，缓解便秘，排毒，除湿，补气血，促进睡眠等。新生儿，婴幼儿喂养指导及定制食谱等。', '88800', '1', '2', 'ac604ccd0e6fa93d8eb714d07603665ccf640632', '不限');
INSERT INTO `diet_product` VALUES ('215', 'P201707051853378373', 'http://api.shoumeikeji.cn/diet/image/20170705/20170705185216_80521.png', '糖尿病', '膳食调查（在营养师不干预的前提下使了解客户现在的饮食方式及生活习惯，为客户“健康管理方案”做出依据）。\r\n检测结果分析包括（大生化，糖化血红蛋白，OGTT试验，肾功能检测，腹部彩超）：\r\n通过膳食调查及检测结果对客户进行健康管理方案制定。\r\n', '99800', '1', '2', '83a71158af82b9260847c575f03c08c2db622534', '不限');

-- ----------------------------
-- Table structure for live_list
-- ----------------------------
DROP TABLE IF EXISTS `live_list`;
CREATE TABLE `live_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '直播标题',
  `desc` varchar(255) DEFAULT NULL COMMENT '直播详情',
  `url` varchar(255) NOT NULL COMMENT '直播路径',
  `img` varchar(255) DEFAULT NULL COMMENT '直播图片',
  `name` varchar(255) DEFAULT NULL COMMENT '嘉宾名称',
  `grade` varchar(255) DEFAULT NULL COMMENT '嘉宾营养级别',
  `dtime` varchar(255) DEFAULT NULL COMMENT '直播到期时间',
  `ctime` varchar(255) DEFAULT NULL COMMENT '直播创建时间',
  `type` int(11) DEFAULT NULL COMMENT '是否收费  ==1 收费  ==2免费',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `price` int(255) DEFAULT NULL COMMENT '直播价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_list
-- ----------------------------
INSERT INTO `live_list` VALUES ('3', '系列课1', '1231231', 'https://m.qlchat.com/live/channel/channelPage/270000388044843.htm', 'http://api.shoumeikeji.cn/aiyang.jpg', '123', '123', '123', '1498795884', '1', '1', '990');
INSERT INTO `live_list` VALUES ('4', '系列课2', '1231231', 'https://m.qlchat.com/topic/240000480051067.htm?preview=Y&intoPreview=Y', 'http://api.shoumeikeji.cn/aiyang.jpg', '123', '123', '123', '1498795914', '1', '2', '990');
INSERT INTO `live_list` VALUES ('5', '系列课3', '1231231', 'https://m.qlchat.com/topic/240000480051067.htm?https://m.qlchat.com/topic/290000368012397.htm?preview=Y&intoPreview=Y', 'http://api.shoumeikeji.cn/aiyang.jpg', '123', '123', '123', '1498795917', '1', '3', '990');
INSERT INTO `live_list` VALUES ('6', '测试1', '1231231', 'https://m.qlchat.com/topic/290000368037778.htm?preview=Y&intoPreview=Y', 'http://api.shoumeikeji.cn/aiyang.jpg', '123', '123', '123', '1498795919', '1', '4', '990');
INSERT INTO `live_list` VALUES ('10', '测试2', '1231231', '23123', 'http://api.shoumeikeji.cn/aiyang.jpg', '123', '123', '123', '1498795884', '2', '5', '990');
INSERT INTO `live_list` VALUES ('11', '测试3', '1231231', '23123', 'http://api.shoumeikeji.cn/aiyang.jpg', '123', '123', '123', '1498795914', '2', '6', '990');
INSERT INTO `live_list` VALUES ('12', '测试4', '1231231', '23123', 'http://api.shoumeikeji.cn/aiyang.jpg', '123', '123', '123', '1498795917', '2', '7', '990');
INSERT INTO `live_list` VALUES ('13', '123', '1231231', '23123', 'http://api.shoumeikeji.cn/aiyang.jpg', '123', '123', '123', '1498795919', '2', '8', '990');

-- ----------------------------
-- Table structure for mall_cart
-- ----------------------------
DROP TABLE IF EXISTS `mall_cart`;
CREATE TABLE `mall_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL COMMENT '用户标识',
  `dtoken` varchar(255) NOT NULL COMMENT '商品标识',
  `price` int(11) NOT NULL COMMENT '商品价格(以分级为单位)',
  `number` int(11) NOT NULL COMMENT '商品个数',
  `img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_cart
-- ----------------------------
INSERT INTO `mall_cart` VALUES ('244', '3f10cc9fe0fa9d7142a5a605c872d04d15ca610c', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '1', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170047_69752.jpg', '怀姜糖(艾佳人)');
INSERT INTO `mall_cart` VALUES ('245', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '1', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170429_57801.jpg', '五天');
INSERT INTO `mall_cart` VALUES ('246', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '1', '2', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170429_57801.jpg', '五天');
INSERT INTO `mall_cart` VALUES ('248', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '1', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170720_86494.jpg', '加强腹带');
INSERT INTO `mall_cart` VALUES ('249', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'ac603e9f5f7cbc436417770b5944560258bab101', '1', '3', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170609_86534.jpg', '黑麻油');
INSERT INTO `mall_cart` VALUES ('253', 'q1', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '5900', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170047_69752.jpg', '怀姜糖膏(艾佳人)');
INSERT INTO `mall_cart` VALUES ('261', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '18900', '3', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524105720_21203.jpg', '艾乃水');
INSERT INTO `mall_cart` VALUES ('262', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '8800', '2', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523213355_80534.jpg', '加强束腹带');
INSERT INTO `mall_cart` VALUES ('264', '9b4858060a5997e2369bbd16b34788c069e90d1d', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '8800', '2', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523213355_80534.jpg', '加强束腹带');
INSERT INTO `mall_cart` VALUES ('265', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'ac603e9f5f7cbc436417770b5944560258bab101', '23600', '2', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170609_86534.jpg', '黑麻油');
INSERT INTO `mall_cart` VALUES ('271', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'ac603e9f5f7cbc436417770b5944560258bab101', '23600', '2', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170609_86534.jpg', '黑麻油');
INSERT INTO `mall_cart` VALUES ('272', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '19900', '2', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524103608_38124.jpg', '五天蜜楒');
INSERT INTO `mall_cart` VALUES ('273', '5d489818332ced95d046669be5bc1e6c7e0d11a0', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '18900', '1', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524105720_21203.jpg', '艾乃水');
INSERT INTO `mall_cart` VALUES ('275', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '5900', '2', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170047_69752.jpg', '怀姜糖膏(艾佳人)');
INSERT INTO `mall_cart` VALUES ('276', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '19900', '1', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524103608_38124.jpg', '五天蜜楒');
INSERT INTO `mall_cart` VALUES ('280', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '5900', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170047_69752.jpg', '怀姜糖膏(艾佳人)');
INSERT INTO `mall_cart` VALUES ('285', '9b4858060a5997e2369bbd16b34788c069e90d1d', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '18900', '4', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524105720_21203.jpg', '艾乃水');
INSERT INTO `mall_cart` VALUES ('286', '91790aefc7d87663e7ea90da2cd90a83e23d2019', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '18900', '3', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524105720_21203.jpg', '艾乃水');
INSERT INTO `mall_cart` VALUES ('289', '73ce6132a792219f889b61ab16abcbb071ec0735', 'ac603e9f5f7cbc436417770b5944560258bab101', '23600', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170609_86534.jpg', '黑麻油');
INSERT INTO `mall_cart` VALUES ('290', 'b8f035864cf762e1362ba866f96941e988d49aa6', 'ac603e9f5f7cbc436417770b5944560258bab101', '23600', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170609_86534.jpg', '黑麻油');
INSERT INTO `mall_cart` VALUES ('294', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '8800', '4', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523213355_80534.jpg', '加强束腹带');
INSERT INTO `mall_cart` VALUES ('295', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '19900', '1', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524103608_38124.jpg', '五天蜜楒');
INSERT INTO `mall_cart` VALUES ('296', '5d489818332ced95d046669be5bc1e6c7e0d11a0', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '8800', '15', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523213355_80534.jpg', '加强束腹带');
INSERT INTO `mall_cart` VALUES ('298', 'd2ebc523c0e665f488152ee7752a33ba2a51d17d', 'ac603e9f5f7cbc436417770b5944560258bab101', '23600', '2', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170609_86534.jpg', '黑麻油');
INSERT INTO `mall_cart` VALUES ('299', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '18900', '1', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524105720_21203.jpg', '艾乃水');
INSERT INTO `mall_cart` VALUES ('301', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '8800', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523213355_80534.jpg', '加强束腹带');
INSERT INTO `mall_cart` VALUES ('302', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '18900', '1', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524105720_21203.jpg', '艾乃水');
INSERT INTO `mall_cart` VALUES ('305', 'a0c312f58ef1c008cf5b761b2af5cfc9b22d04be', '8ad5395ef0e0dae3e99566d7b717431d4fef2ba2', '99000', '1', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628150510_36677.jpg', '孕期餐（D方案）');
INSERT INTO `mall_cart` VALUES ('306', '6876aec744679d1eeb4aacd4e0c6274e0dc04918', '8ad5395ef0e0dae3e99566d7b717431d4fef2ba2', '99000', '1', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628150510_36677.jpg', '孕期餐（D方案）');

-- ----------------------------
-- Table structure for mall_category
-- ----------------------------
DROP TABLE IF EXISTS `mall_category`;
CREATE TABLE `mall_category` (
  `cat_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `cat_name` varchar(255) NOT NULL COMMENT '分类名',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_category
-- ----------------------------
INSERT INTO `mall_category` VALUES ('1', '月子餐', 'http://api.shoumeikeji.cn/images/11.png');
INSERT INTO `mall_category` VALUES ('2', '宝宝用品', 'http://api.shoumeikeji.cn/images/22.png');
INSERT INTO `mall_category` VALUES ('3', '奶粉纸尿裤', 'http://api.shoumeikeji.cn/images/33.png');
INSERT INTO `mall_category` VALUES ('4', '儿童书籍', 'http://api.shoumeikeji.cn/images/44.png');
INSERT INTO `mall_category` VALUES ('5', '爱样拼团', 'http://api.shoumeikeji.cn/images/55.png');
INSERT INTO `mall_category` VALUES ('6', '辅食喂养', 'http://api.shoumeikeji.cn/images/66.png');
INSERT INTO `mall_category` VALUES ('7', '辣妈推荐', 'http://api.shoumeikeji.cn/images/77.png');
INSERT INTO `mall_category` VALUES ('8', '母婴用品', 'http://api.shoumeikeji.cn/images/88.png');

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `dtoken` varchar(255) NOT NULL COMMENT '商品标识',
  `price` int(11) DEFAULT NULL COMMENT '分级为单位',
  `img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `desc` varchar(255) DEFAULT NULL COMMENT '商品介绍文件',
  `cat_id` varchar(255) DEFAULT NULL COMMENT '分类ID',
  `cat_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `store` int(11) DEFAULT NULL COMMENT '库存数量',
  `status` int(11) DEFAULT NULL COMMENT '1上架   2下架',
  `sell` int(11) DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_goods
-- ----------------------------
INSERT INTO `mall_goods` VALUES ('42', '怀姜糖膏(艾佳人)', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '5900', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170047_69752.jpg', 'file/goods/1498558606.txt', '1', '爱样定制', '100', '1', '3');
INSERT INTO `mall_goods` VALUES ('43', '五天蜜楒', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '19900', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524103608_38124.jpg', 'file/goods/1495593712.txt', '2', '宝宝用品', '100', '1', '3');
INSERT INTO `mall_goods` VALUES ('44', '黑麻油', 'ac603e9f5f7cbc436417770b5944560258bab101', '23600', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170609_86534.jpg', 'file/goods/1496220812.txt', '3', '奶粉纸尿裤', '100', '1', '7');
INSERT INTO `mall_goods` VALUES ('45', '加强束腹带', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '8800', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523213355_80534.jpg', 'file/goods/1495608962.txt', '4', '儿童书籍', '100', '1', '2');
INSERT INTO `mall_goods` VALUES ('49', '艾乃水', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '18900', 'http://api.shoumeikeji.cn/mall/image/20170524/20170524105720_21203.jpg', 'file/goods/1495594895.txt', '7', '辣妈推荐', '100', '1', '2');
INSERT INTO `mall_goods` VALUES ('57', '安胎月养水', '07c2852c40afe5a80778f0e6c46a9a3254b70056', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628093455_95147.jpg', 'file/goods/1498619009.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('59', '补血月养水', '7f6b29bd992bfd77c1f0299d5edb0a66e3b87d80', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100356_18853.jpg', 'file/goods/1498618979.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('60', '丰胸月养水', '6c631a837cc131b76b6b22a1e6eab9c3e35ffb2e', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100411_75176.jpg', 'file/goods/1498729150.txt', '1', '月子餐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('61', '活血月养水', '5e8644a10ecafb61bea4d311ad52e5cf9bf42ebd', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100423_33233.jpg', 'file/goods/1498618933.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('62', '康复月养水', 'b792b03b37f442c800ee1b22f13456c538d586c9', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100445_17175.jpg', 'file/goods/1498618916.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('63', '清热月养水', '53d472abed1c56ece545a30dcec29496e9644b93', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100459_44433.jpg', 'file/goods/1498618897.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('64', '养生月养水', '85d2b609ab32a1a0b27ac3406dff5454b98d5bbf', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100515_24689.jpg', 'file/goods/1498618867.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('65', '养颜月养水', 'd1736cbd33b619e2dd4753822190d3b09b944ec3', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100535_95932.jpg', 'file/goods/1498618836.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('66', '基础款月养水', '8f6555b27bc6bd37f5431118d04b5bde32baffdc', '6800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100551_66451.jpg', 'file/goods/1498618809.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('67', '滋补月养水', '9bb92ec3e6b684b8ba32f754edcb651dfdc26d5f', '9800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100609_64225.jpg', 'file/goods/1498618774.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('68', '月子餐（A方案）', '851fe8e86931d4204ccd12777b6a2e8d3ddcf6cf', '1430000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100622_12066.jpg', 'file/goods/1498618679.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('69', '月子餐（B方案）', 'abf4d2ce4a41fea19ca02e279d88d7f1cf9a8fca', '1720000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100648_19283.jpg', 'file/goods/1498618628.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('70', '月子餐（I方案）', 'e755e01fb0953fcd0ff2f102b97be501c0464b42', '907000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100704_29375.jpg', 'file/goods/1498618586.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('71', '月子餐（J方案）', '51a95eb765457674bbd186bf1627491804f94db8', '407000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100719_17158.jpg', 'file/goods/1498618535.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('72', '月子餐（R方案）', '5f765bffe76cf2ebdfa502fe77a72b9cd16a84ef', '540000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100735_23981.jpg', 'file/goods/1498618357.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('73', '孕期餐（A方案）', '925d12df910df204e7c3fee69816d7323344a7b0', '1520000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100751_52291.jpg', 'file/goods/1498618292.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('74', '孕期餐（B方案）', '44033c4be6e97bfa224107b04e1dfc79640017dc', '1480000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100807_23507.jpg', 'file/goods/1498618218.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('75', '孕期餐（C方案）', 'e07b119a1c479b54198a3eebc28ba131aeacdd96', '70000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100830_44172.jpg', 'file/goods/1498703472.txt', '1', '月子餐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('76', '孕期餐（F方案）', 'f7eba8d0e1dbfe002f46132d16c64b75e80f3209', '330000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628100850_35301.jpg', 'file/goods/1498618082.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('77', '住院关爱包A', '89a7bb4fc4c273262ed7da1ee70ad90d2da0369f', '138000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628101015_74035.jpg', 'file/goods/1498618003.txt', '1', '爱样定制', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('78', '住院关爱包B', '110a0e95f62453068f1ace41532cc0a3577bf3a9', '298000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628101029_25071.jpg', 'file/goods/1498699074.txt', '1', '月子餐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('80', '孕期餐（E方案）', '4de0c902c135c5e10bba6b7319bed8d8df1c7294', '189000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628110028_94262.jpg', 'file/goods/1498619128.txt', '1', '月子餐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('81', '试吃餐（月子餐）', 'a1f7c4170b5abf3d2cdd79688e94ae5e4d15d5c0', '6800', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628110136_18955.jpg', 'file/goods/1498703601.txt', '1', '月子餐', '1000', '1', '1');
INSERT INTO `mall_goods` VALUES ('82', '孕期餐（D方案）', '8ad5395ef0e0dae3e99566d7b717431d4fef2ba2', '99000', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628150510_36677.jpg', 'file/goods/1498636411.txt', '1', '月子餐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('83', '金属纤维马甲（防辐射服）', 'caff15471c2aa93b27cd0021d1a42dc06d61802b', '18800', 'http://api.shoumeikeji.cn/mall/image/20170630/20170630105019_51545.jpg', 'file/goods/1498819904.txt', '7', '辣妈推荐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('84', '小花边银纤维吊带（孕妇防辐射服）', '64a8d908911797bdb79e0b3af56a1796570842c4', '23800', 'http://api.shoumeikeji.cn/mall/image/20170630/20170630105819_85527.jpg', 'file/goods/1498819811.txt', '7', '辣妈推荐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('85', '大花边银纤维吊带（孕妇防辐射服）', '92503183040e9ae2acb55086010828e9535a8179', '23800', 'http://api.shoumeikeji.cn/mall/image/20170630/20170630110033_72810.jpg', 'file/goods/1498819788.txt', '7', '辣妈推荐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('86', '孕妇防辐射服（金属纤维马甲）', 'c8ddb458097921ffc1beb477e64d1d9dbeb3f6c6', '18800', 'http://api.shoumeikeji.cn/mall/image/20170630/20170630110241_86265.jpg', 'file/goods/1498819733.txt', '7', '辣妈推荐', '1000', '1', '0');
INSERT INTO `mall_goods` VALUES ('87', '金属纤维马甲（孕妇防辐射服）', '5d8da81661bd3c2beacc1371ad0197b7a72b2766', '13800', 'http://api.shoumeikeji.cn/mall/image/20170630/20170630110528_25903.jpg', 'file/goods/1498819614.txt', '7', '辣妈推荐', '1000', '1', '0');

-- ----------------------------
-- Table structure for mall_group
-- ----------------------------
DROP TABLE IF EXISTS `mall_group`;
CREATE TABLE `mall_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL,
  `gtoken` varchar(255) DEFAULT NULL,
  `dtoken` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `orsuccess` int(255) DEFAULT NULL COMMENT '0:正在拼团  1:拼团成功  2：拼团失败',
  `type` varchar(255) CHARACTER SET armscii8 DEFAULT NULL COMMENT '1：团长 2:不是团长',
  `totalprice` int(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '订单状态 1 提交订单 2 完成支付 3 发货中 4 确认收货',
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `third` varchar(255) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL,
  `paytime` varchar(255) DEFAULT NULL,
  `fatime` varchar(255) DEFAULT NULL,
  `quetime` varchar(255) DEFAULT NULL,
  `delivery` varchar(255) DEFAULT NULL,
  `delivery_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mall_group
-- ----------------------------
INSERT INTO `mall_group` VALUES ('1', '201706231208278151', '695c6b6ca4db89232636b11708fb3132052b1248', '6841201257e4f541a8f4a58c756a21070df4c43e', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '1', '1', '240000', '北京', '北京', '大兴区', '亦城国际中心', '2', '小李', '13423635543', 'wx201706231215051ac8814c3a0758830654', '1498190907', '1498193404', '', '', '', '');
INSERT INTO `mall_group` VALUES ('2', '201706231208278686', '695c6b6ca4db89232636b11708fb3132052b1248', '6841201257e4f541a8f4a58c756a21070df4c43e', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '1', '1', '240000', '北京', '北京', '大兴区', '亦城国际中心2', '2', '小李', '13423635543', 'wx201706231215051ac8814c3a0758830654', '1498190907', '1498193404', '', '', '', '');
INSERT INTO `mall_group` VALUES ('3', '201706231522008278', 'c3d2ce5582fecd9a3a8cf38163cb7839617db238', '6841201257e4f541a8f4a58c756a21070df4c43e', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '1', '1', '160000', '北京', '北京', '大兴区', '亦城国际中心2', '2', '小李2', '18245636657', 'wx20170623181029ef2220d1520328283881', '1498202520', '1498212671', null, null, null, null);
INSERT INTO `mall_group` VALUES ('4', '201706231524368123', '73ccf9a3ca4c573d367b1c89943eb88a6a1a6098', '6841201257e4f541a8f4a58c756a21070df4c43e', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '1', '1', '160000', '北京', '北京', '大兴区', '亦城国际中心3', '2', '小李3', '18245636655', 'wx20170623172155c3303b1cc00040980659', '1498202676', '1498210940', null, null, null, null);
INSERT INTO `mall_group` VALUES ('5', '201706231745421357', '73ccf9a3ca4c573d367b1c89943eb88a6a1a6098', '6841201257e4f541a8f4a58c756a21070df4c43e', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '1', '2', '80000', '北京', '北京', '大兴区', '亦城国际中心', '2', '小周', '18845636655', 'wx20170623174607885ffd0b2d0794441343', '1498211142', '1498211186', null, null, null, null);
INSERT INTO `mall_group` VALUES ('6', '201706231813405350', 'c3d2ce5582fecd9a3a8cf38163cb7839617db238', '6841201257e4f541a8f4a58c756a21070df4c43e', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '1', '2', '80000', '北京', '北京', '大兴区', '亦城国际中心', '2', '小周', '18845636655', 'wx20170623181348e00e026fd20592688012', '1498212821', '1498212835', null, null, null, null);

-- ----------------------------
-- Table structure for mall_group_detail
-- ----------------------------
DROP TABLE IF EXISTS `mall_group_detail`;
CREATE TABLE `mall_group_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL,
  `dtoken` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `each_price` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mall_group_detail
-- ----------------------------
INSERT INTO `mall_group_detail` VALUES ('1', '201706231208278151', '6841201257e4f541a8f4a58c756a21070df4c43e', '3', 'http://api.shoumeikeji.cn/mall/image/20170622/20170622154618_92853.jpg', '蛋白粉', '80000', '240000');
INSERT INTO `mall_group_detail` VALUES ('2', '201706231522008278', '6841201257e4f541a8f4a58c756a21070df4c43e', '2', 'http://api.shoumeikeji.cn/mall/image/20170622/20170622154618_92853.jpg', '蛋白粉', '80000', '160000');
INSERT INTO `mall_group_detail` VALUES ('3', '201706231524368123', '6841201257e4f541a8f4a58c756a21070df4c43e', '2', 'http://api.shoumeikeji.cn/mall/image/20170622/20170622154618_92853.jpg', '蛋白粉', '80000', '160000');
INSERT INTO `mall_group_detail` VALUES ('4', '201706231744504363', '6841201257e4f541a8f4a58c756a21070df4c43e', '1', 'http://api.shoumeikeji.cn/mall/image/20170622/20170622154618_92853.jpg', '蛋白粉', '80000', '80000');
INSERT INTO `mall_group_detail` VALUES ('5', '201706231745421357', '6841201257e4f541a8f4a58c756a21070df4c43e', '1', 'http://api.shoumeikeji.cn/mall/image/20170622/20170622154618_92853.jpg', '蛋白粉', '80000', '80000');
INSERT INTO `mall_group_detail` VALUES ('6', '201706231813405350', '6841201257e4f541a8f4a58c756a21070df4c43e', '1', 'http://api.shoumeikeji.cn/mall/image/20170622/20170622154618_92853.jpg', '蛋白粉', '80000', '80000');

-- ----------------------------
-- Table structure for mall_order
-- ----------------------------
DROP TABLE IF EXISTS `mall_order`;
CREATE TABLE `mall_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) NOT NULL COMMENT '订单编号',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `totalprice` int(11) NOT NULL COMMENT '所有商品总价',
  `province` varchar(255) NOT NULL COMMENT '省',
  `img` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL COMMENT '区',
  `detail` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `status` int(11) NOT NULL COMMENT '订单状态 1 提交订单 2 完成支付 3 发货中 4 确认收货',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人名称',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `third` varchar(255) DEFAULT NULL COMMENT '第三方支付单号',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `paytime` varchar(255) DEFAULT NULL COMMENT '支付时间',
  `fatime` varchar(255) DEFAULT NULL COMMENT '发货时间',
  `quetime` varchar(255) DEFAULT NULL COMMENT '确认收货时间',
  `delivery` varchar(255) DEFAULT NULL COMMENT '快递公司',
  `delivery_no` varchar(255) DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_order
-- ----------------------------
INSERT INTO `mall_order` VALUES ('493', '201705231719562735', '9b4858060a5997e2369bbd16b34788c069e90d1d', '2', '北京', null, '北京', '大兴区', '亦城国际', '3', '李丰瀚', '13693276438', 'wx20170523171958092fd040c90610083388', '1495531196', '1495531208', null, null, '申通快递', '221153907678');
INSERT INTO `mall_order` VALUES ('546', '201706271816408831', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', '北京', null, '北京', '大兴区', '荣华中路10号亦城国际', '4', '周长江', '18845637070', 'wx20170627181640cf8ec3662b0026396770', '1498558600', '1498558619', null, '1498986834', '申通快递', '221153907678');
INSERT INTO `mall_order` VALUES ('556', '201706281557593852', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '13600', '北京', null, '北京', '大兴区', '大兴区', '1', '小李', '15246385599', 'wx2017062815580031346415140242729870', '1498636679', null, null, null, null, null);

-- ----------------------------
-- Table structure for mall_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `mall_order_detail`;
CREATE TABLE `mall_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单号',
  `dtoken` varchar(255) DEFAULT NULL COMMENT '商品标识',
  `num` int(11) DEFAULT NULL COMMENT '每种商品数量',
  `img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `each_price` int(11) DEFAULT NULL COMMENT '商品单价',
  `total` int(11) DEFAULT NULL COMMENT '商品小计',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_order_detail
-- ----------------------------
INSERT INTO `mall_order_detail` VALUES ('616', '201705231719562735', 'ac603e9f5f7cbc436417770b5944560258bab101', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170609_86534.jpg', '黑麻油', '1', '1');
INSERT INTO `mall_order_detail` VALUES ('617', '201705231719562735', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170429_57801.jpg', '五天', '1', '1');
INSERT INTO `mall_order_detail` VALUES ('672', '201706271816408831', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '1', 'http://api.shoumeikeji.cn/mall/image/20170523/20170523170047_69752.jpg', '怀姜糖膏(艾佳人)', '100', '100');
INSERT INTO `mall_order_detail` VALUES ('682', '201706281557593852', 'a1f7c4170b5abf3d2cdd79688e94ae5e4d15d5c0', '1', 'http://api.shoumeikeji.cn/mall/image/20170628/20170628110136_18955.jpg', '试吃餐（月子餐）', '13600', '13600');

-- ----------------------------
-- Table structure for mall_refund
-- ----------------------------
DROP TABLE IF EXISTS `mall_refund`;
CREATE TABLE `mall_refund` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) NOT NULL COMMENT '订单编号',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `totalprice` int(11) NOT NULL COMMENT '所有商品总价',
  `province` varchar(255) NOT NULL COMMENT '省',
  `img` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL COMMENT '区',
  `detail` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `status` int(11) NOT NULL COMMENT '订单状态 1 提交订单 2 完成支付 3 发货中 4 确认收货',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人名称',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `third` varchar(255) DEFAULT NULL COMMENT '第三方支付单号',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `paytime` varchar(255) DEFAULT NULL COMMENT '支付时间',
  `fatime` varchar(255) DEFAULT NULL COMMENT '发货时间',
  `quetime` varchar(255) DEFAULT NULL COMMENT '确认收货时间',
  `delivery` varchar(255) DEFAULT NULL COMMENT '快递公司',
  `delivery_no` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `tuitime` varchar(255) DEFAULT NULL COMMENT '退款时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_refund
-- ----------------------------
INSERT INTO `mall_refund` VALUES ('516', '201705231720403673', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '1', '北京', null, '北京', '大兴区', '荣华中路10号亦城国际', '3', '周长江', '18845637070', 'wx20170523172042af96641db00410021691', '1495531240', '1495531264', null, null, null, null, '1497432355');

-- ----------------------------
-- Table structure for mall_refund_detail
-- ----------------------------
DROP TABLE IF EXISTS `mall_refund_detail`;
CREATE TABLE `mall_refund_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单号',
  `dtoken` varchar(255) DEFAULT NULL COMMENT '商品标识',
  `num` int(11) DEFAULT NULL COMMENT '每种商品数量',
  `img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `each_price` int(11) DEFAULT NULL COMMENT '商品单价',
  `total` int(11) DEFAULT NULL COMMENT '商品小计',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=642 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_refund_detail
-- ----------------------------

-- ----------------------------
-- Table structure for mall_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `mall_suppliers`;
CREATE TABLE `mall_suppliers` (
  `suppliers_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `soppliers_name` varchar(255) NOT NULL,
  `soppliers_desc` varchar(255) NOT NULL COMMENT '供应商描述',
  `soppliers_tel` varchar(255) NOT NULL,
  `soppliers_img` varchar(255) NOT NULL,
  `province` int(10) NOT NULL,
  `city` int(10) NOT NULL,
  `district` int(10) NOT NULL,
  `soppliers_position` varchar(255) NOT NULL,
  PRIMARY KEY (`suppliers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_suppliers
-- ----------------------------

-- ----------------------------
-- Table structure for quan_article
-- ----------------------------
DROP TABLE IF EXISTS `quan_article`;
CREATE TABLE `quan_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qtoken` varchar(255) DEFAULT NULL COMMENT '文章标示',
  `token` varchar(255) DEFAULT NULL COMMENT '发表人',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `detail` varchar(255) DEFAULT NULL COMMENT '文章详情存储路径',
  `commend` int(11) DEFAULT '0' COMMENT '评论人数',
  `look` int(11) DEFAULT '0' COMMENT '浏览人数',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_name` varchar(255) DEFAULT '' COMMENT '用户昵称',
  `type` int(4) DEFAULT NULL COMMENT '圈子类型 1 客户圈2营养圈',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quan_article
-- ----------------------------
INSERT INTO `quan_article` VALUES ('162', 'Qb98275d8c159390af19d47915908ad805e85b3a9', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '1495532149', '营养每一天', '0', '0', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', 'Dopamine', '2');
INSERT INTO `quan_article` VALUES ('163', 'Qe588a0b0c8dc1d440be35c792eff5444dc2baeeb', '9b4858060a5997e2369bbd16b34788c069e90d1d', '1495532304', '最近想参加健身，身体发胖', '1', '5', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '李丰瀚', '1');
INSERT INTO `quan_article` VALUES ('165', 'Q1b1b68f305fa770ba202e837db756d6ca0370158', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '1495537061', '一带一路蓝', '2', '0', 'http://api.shoumeikeji.cn/picture/14989782117404.jpg', '壹+1', '2');
INSERT INTO `quan_article` VALUES ('166', 'Qda57257a4f3c2fbc3668d6a4ac8304693688515d', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '1495780150', '心情好', '0', '0', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', 'Dopamine', '2');
INSERT INTO `quan_article` VALUES ('167', 'Q134604b60d828210670082dcfc35331b19114af1', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '1495780439', '下午心情都好', '1', '1', 'http://api.shoumeikeji.cn/picture/14985328477410.jpg', 'Dopamine', '2');
INSERT INTO `quan_article` VALUES ('168', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '1495782439', '啦咯啦咯啦咯', '2', '6', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '2');
INSERT INTO `quan_article` VALUES ('169', 'Qf383a711587f3bf7baa4339cdd6b70646483106d', 'a81965fd8b377a863867b96c807bb33787ad900b', '1496202777', '我的营养健身餐', '1', '3', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6JspxA12KTFwEb92Gu45RvZCfvOadibATeUf6ccfInUPmPs91qrbSbgVWicNpGmgoicltILH2RIyh9A/0', '  ', '1');
INSERT INTO `quan_article` VALUES ('170', 'Qc09d19197329dc3d2ed2b1affd9ab73d94a83973', 'bca82289e40277addfedd3a0dfe685165ef4871b', '1496758054', '啊啊啊\n', '0', '1', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6yc9icPBibKOzAoRX98YQV8mOJZibnXDS7JOs6oAUUnFbSQnjial7bibEk3GPeXicgYicvPObJfpKRVLeTF/0', 'LS', '1');
INSERT INTO `quan_article` VALUES ('171', 'Q5375b650d4c9157bdca74463d4a2972f3e546860', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '1498025011', '爸爸妈妈的爱是心甘情愿，是永无止境!!无论如何，父母永远都在那儿，倾其所有使你快乐。你可能认为这个男孩对树很残酷，但这就是我们每个人对待父母的方式。\n\n人生确实如此，我们为人父母，也为人子女，在爱孩子的同时，也请朋友们珍惜与父母在一起的时间！\n\n树欲静而风不止\n子欲养而亲不待\n\n父子漫步海边\n爱样，您孕育生活中的私人营养师\n', '1', '2', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', '1');
INSERT INTO `quan_article` VALUES ('172', 'Q84cc44caf4cc1564cae8c240b37dee7f7c6c2cc0', 'a0c312f58ef1c008cf5b761b2af5cfc9b22d04be', '1498036477', '【聚会就餐怎么吃？】聚餐可不要只顾美味，更要兼顾营养与健康，怎么吃呢？\n❶荤素搭配，三分素一分荤\n❷少吃红烧、过油、水煮、油炸、煎、煸这种用油过多的烹饪方式制作的菜肴，这些可都是藏油大户\n❸多点一些清淡口味的如清炖、煲汤、凉拌、清炒的菜肴\n❹主食尽量选择粗杂粮、薯类\n❺限量饮酒，少喝饮料。 ​', '0', '1', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6ib6uTNmrhUTYAfQzVdvNVy1HU8kVJqW6yUaExj0Dnpfqj2NVoa9hCu79FD8Xhj4DicJLG1M3RZmQo/0', '布袋小小只', '1');
INSERT INTO `quan_article` VALUES ('174', 'Q5aca511be53e3fab4f23443ea5bc738d843c69d1', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '1498541891', '孕初期应尽量选择清淡食物，少吃多餐，不要减少总摄入量。建议孕妇多摄入叶酸，许多天然食物中含有丰富的叶酸，各种绿色蔬菜（如菠菜、生菜、芦笋、龙须菜等），及动物肝肾，豆类，水果（香蕉、草莓、橙子等），奶制品等都富含叶酸', '1', '2', 'http://api.shoumeikeji.cn/picture/14985321361987.jpg', '李淑君', '2');
INSERT INTO `quan_article` VALUES ('175', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '1498542213', '【九图告诉你：哪些食物发芽能吃，哪些有毒？看准了再吃！】天气渐热，家中的食物放置一段时间就容易发芽。很多人认为食物一旦发芽就不能吃了，但事实并非如此。大蒜、姜、瓜类、黄豆、土豆、红薯……哪些发芽的食物可以吃，甚至营养翻倍？哪些绝对不能吃，会引起中毒？戳图学习', '1', '1', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '周长江', '1');

-- ----------------------------
-- Table structure for quan_commend
-- ----------------------------
DROP TABLE IF EXISTS `quan_commend`;
CREATE TABLE `quan_commend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `qtoken` varchar(255) DEFAULT NULL COMMENT '文章标识',
  `commend` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quan_commend
-- ----------------------------
INSERT INTO `quan_commend` VALUES ('125', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIq4qkq3h7AjjYEXhMPcKps7byuJlvHOYwM2GQArg1xzRPE0kgCEgPHAtkicLjD2RQLDaH7FfTv2VQ/0', '壹+1', 'Qe588a0b0c8dc1d440be35c792eff5444dc2baeeb', '你这个肚子.........', '1495537099');
INSERT INTO `quan_commend` VALUES ('126', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5TNASmtALL1Sqrfhlib8mRibXiaPjHx2PopWiakwGr1BeBkHnk6C4Sz7RwvSoqhdiaR3Yr3iapuiaVZdRJib/0', 'Dopamine', 'Q1b1b68f305fa770ba202e837db756d6ca0370158', '天空很蓝', '1495538299');
INSERT INTO `quan_commend` VALUES ('127', 'e970ef250c37356236dd9338e12752d3c1673093', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUv4ZAaydmQDybfQj2oUV0lTx0ibP0nBvlXYjtXicS0ibBHnoboAHaSzqB4JWm9U8Yw0XzcTd01VO1ViblVSlO6bhrX/0', '爱样', 'Q1b1b68f305fa770ba202e837db756d6ca0370158', '空气质量不错', '1495591558');
INSERT INTO `quan_commend` VALUES ('128', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', 'Q134604b60d828210670082dcfc35331b19114af1', '好了效率就高', '1495809791');
INSERT INTO `quan_commend` VALUES ('129', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '爱样@阿海', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853', '满天的星星都是我的心愿', '1495809852');
INSERT INTO `quan_commend` VALUES ('130', 'e970ef250c37356236dd9338e12752d3c1673093', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUv4ZAaydmQDybfQj2oUV0lTx0ibP0nBvlXYjtXicS0ibBHnoboAHaSzqB4JWm9U8Yw0XzcTd01VO1ViblVSlO6bhrX/0', '爱样', 'Qf383a711587f3bf7baa4339cdd6b70646483106d', '哇好丰富，又营养又健康', '1496315742');
INSERT INTO `quan_commend` VALUES ('131', '91790aefc7d87663e7ea90da2cd90a83e23d2019', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbWzicK9nPlWLQWYa0682YAoZVyiamxcCUGZQNfI4XAdqGvIglHsHF7aB48EhVhtVgdtuL8x8NOjf8XA/0', '龙龙', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853', 'gdddf', '1496481863');
INSERT INTO `quan_commend` VALUES ('132', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXoySQ3jtRyrCh3FDS8WlqhnMibklL5bNia2IJZgAXb8ibnfyiaFROibfsbhRnlllBicx7nMFMssUeR4p98/0', '周长江哥', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', '不错', '1498995615');
INSERT INTO `quan_commend` VALUES ('133', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXoySQ3jtRyrCh3FDS8WlqhnMibklL5bNia2IJZgAXb8ibnfyiaFROibfsbhRnlllBicx7nMFMssUeR4p98/0', '周长江哥', 'Q5aca511be53e3fab4f23443ea5bc738d843c69d1', '很好', '1498995625');
INSERT INTO `quan_commend` VALUES ('134', 'b784a83c4e0ae34e609c0b09dc851011e8fe2db5', 'http://wx.qlogo.cn/mmopen/niczNtunYyibhRIfroGQdQn4oXVcgfTkggYDMxNlicCUwvASNbJbs3dod5P27lHfaeplzLMvVuH4zkVu3SoJckrkx0a1lOia7WRO/0', 'Ofo', 'Q5375b650d4c9157bdca74463d4a2972f3e546860', '回复', '1499138864');

-- ----------------------------
-- Table structure for quan_look
-- ----------------------------
DROP TABLE IF EXISTS `quan_look`;
CREATE TABLE `quan_look` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `look` varchar(255) DEFAULT NULL COMMENT '点赞状态1:已点赞:2取消点赞',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `qtoken` varchar(255) DEFAULT NULL COMMENT '圈子标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quan_look
-- ----------------------------
INSERT INTO `quan_look` VALUES ('164', '1', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', 'Qe588a0b0c8dc1d440be35c792eff5444dc2baeeb');
INSERT INTO `quan_look` VALUES ('172', '1', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853');
INSERT INTO `quan_look` VALUES ('174', '1', '06818879c736771d11afef895578131bb60b0a17', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853');
INSERT INTO `quan_look` VALUES ('175', '1', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853');
INSERT INTO `quan_look` VALUES ('176', '1', 'a81965fd8b377a863867b96c807bb33787ad900b', 'Qf383a711587f3bf7baa4339cdd6b70646483106d');
INSERT INTO `quan_look` VALUES ('177', '1', 'e970ef250c37356236dd9338e12752d3c1673093', 'Qf383a711587f3bf7baa4339cdd6b70646483106d');
INSERT INTO `quan_look` VALUES ('179', '1', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853');
INSERT INTO `quan_look` VALUES ('180', '1', '91790aefc7d87663e7ea90da2cd90a83e23d2019', 'Qe588a0b0c8dc1d440be35c792eff5444dc2baeeb');
INSERT INTO `quan_look` VALUES ('181', '1', '91790aefc7d87663e7ea90da2cd90a83e23d2019', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853');
INSERT INTO `quan_look` VALUES ('182', '1', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Qf383a711587f3bf7baa4339cdd6b70646483106d');
INSERT INTO `quan_look` VALUES ('183', '1', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853');
INSERT INTO `quan_look` VALUES ('184', '1', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Qe588a0b0c8dc1d440be35c792eff5444dc2baeeb');
INSERT INTO `quan_look` VALUES ('185', '1', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'Qc09d19197329dc3d2ed2b1affd9ab73d94a83973');
INSERT INTO `quan_look` VALUES ('186', '1', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Qe588a0b0c8dc1d440be35c792eff5444dc2baeeb');
INSERT INTO `quan_look` VALUES ('187', '1', '6dbaebe93633ea516420806f040b5c7b1350e314', 'Q134604b60d828210670082dcfc35331b19114af1');
INSERT INTO `quan_look` VALUES ('188', '1', '6dbaebe93633ea516420806f040b5c7b1350e314', 'Qe588a0b0c8dc1d440be35c792eff5444dc2baeeb');
INSERT INTO `quan_look` VALUES ('189', '1', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'Q5375b650d4c9157bdca74463d4a2972f3e546860');
INSERT INTO `quan_look` VALUES ('192', '1', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'Q84cc44caf4cc1564cae8c240b37dee7f7c6c2cc0');
INSERT INTO `quan_look` VALUES ('193', '1', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d');
INSERT INTO `quan_look` VALUES ('194', '1', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'Q5aca511be53e3fab4f23443ea5bc738d843c69d1');
INSERT INTO `quan_look` VALUES ('198', '1', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'Q5aca511be53e3fab4f23443ea5bc738d843c69d1');
INSERT INTO `quan_look` VALUES ('204', '1', 'b784a83c4e0ae34e609c0b09dc851011e8fe2db5', 'Q5375b650d4c9157bdca74463d4a2972f3e546860');

-- ----------------------------
-- Table structure for quan_pic
-- ----------------------------
DROP TABLE IF EXISTS `quan_pic`;
CREATE TABLE `quan_pic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `qtoken` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quan_pic
-- ----------------------------
INSERT INTO `quan_pic` VALUES ('537', 'Qb98275d8c159390af19d47915908ad805e85b3a9', 'http://api.shoumeikeji.cn/picture/149553214762972.jpg');
INSERT INTO `quan_pic` VALUES ('538', 'Qb98275d8c159390af19d47915908ad805e85b3a9', 'http://api.shoumeikeji.cn/picture/149553214728304.jpg');
INSERT INTO `quan_pic` VALUES ('539', 'Qb98275d8c159390af19d47915908ad805e85b3a9', 'http://api.shoumeikeji.cn/picture/149553214778262.jpg');
INSERT INTO `quan_pic` VALUES ('540', 'Qe588a0b0c8dc1d440be35c792eff5444dc2baeeb', 'http://api.shoumeikeji.cn/picture/149553230275544.jpg');
INSERT INTO `quan_pic` VALUES ('541', 'Qb83e3e01e3cba8943e45cb0c0d290a087d8fda5b', 'http://api.shoumeikeji.cn/picture/149553280817065.jpg');
INSERT INTO `quan_pic` VALUES ('542', 'Q1b1b68f305fa770ba202e837db756d6ca0370158', 'http://api.shoumeikeji.cn/picture/149553705943072.jpg');
INSERT INTO `quan_pic` VALUES ('543', 'Q1b1b68f305fa770ba202e837db756d6ca0370158', 'http://api.shoumeikeji.cn/picture/149553706024812.jpg');
INSERT INTO `quan_pic` VALUES ('544', 'Qda57257a4f3c2fbc3668d6a4ac8304693688515d', 'http://api.shoumeikeji.cn/picture/149578014630422.jpg');
INSERT INTO `quan_pic` VALUES ('545', 'Q134604b60d828210670082dcfc35331b19114af1', 'http://api.shoumeikeji.cn/picture/149578043791181.jpg');
INSERT INTO `quan_pic` VALUES ('546', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853', 'http://api.shoumeikeji.cn/picture/149578243211378.jpg');
INSERT INTO `quan_pic` VALUES ('547', 'Qb8cb4f43f54d1422d24063e5956a329375b0d853', 'http://api.shoumeikeji.cn/picture/149578243371071.jpg');
INSERT INTO `quan_pic` VALUES ('548', 'Qf383a711587f3bf7baa4339cdd6b70646483106d', 'http://api.shoumeikeji.cn/picture/149620276557477.jpg');
INSERT INTO `quan_pic` VALUES ('549', 'Qc09d19197329dc3d2ed2b1affd9ab73d94a83973', 'http://api.shoumeikeji.cn/picture/149675805393337.jpg');
INSERT INTO `quan_pic` VALUES ('550', 'Q82d865c12377ca68ead11f8ca3573743a14632aa', 'http://api.shoumeikeji.cn/picture/149802468359779.jpg');
INSERT INTO `quan_pic` VALUES ('551', 'Q82d865c12377ca68ead11f8ca3573743a14632aa', 'http://api.shoumeikeji.cn/picture/149802468378077.jpg');
INSERT INTO `quan_pic` VALUES ('552', 'Q82d865c12377ca68ead11f8ca3573743a14632aa', 'http://api.shoumeikeji.cn/picture/149802468365890.jpg');
INSERT INTO `quan_pic` VALUES ('553', 'Q82d865c12377ca68ead11f8ca3573743a14632aa', 'http://api.shoumeikeji.cn/picture/149802468339472.jpg');
INSERT INTO `quan_pic` VALUES ('554', 'Q82d865c12377ca68ead11f8ca3573743a14632aa', 'http://api.shoumeikeji.cn/picture/149802468450351.jpg');
INSERT INTO `quan_pic` VALUES ('555', 'Q82d865c12377ca68ead11f8ca3573743a14632aa', 'http://api.shoumeikeji.cn/picture/149802468492760.jpg');
INSERT INTO `quan_pic` VALUES ('556', 'Qee37fb8a197bab2b372f06a831e339e892edb5dc', 'http://api.shoumeikeji.cn/picture/149802468359779.jpg');
INSERT INTO `quan_pic` VALUES ('557', 'Qee37fb8a197bab2b372f06a831e339e892edb5dc', 'http://api.shoumeikeji.cn/picture/149802468378077.jpg');
INSERT INTO `quan_pic` VALUES ('558', 'Qee37fb8a197bab2b372f06a831e339e892edb5dc', 'http://api.shoumeikeji.cn/picture/149802468365890.jpg');
INSERT INTO `quan_pic` VALUES ('559', 'Qee37fb8a197bab2b372f06a831e339e892edb5dc', 'http://api.shoumeikeji.cn/picture/149802468339472.jpg');
INSERT INTO `quan_pic` VALUES ('560', 'Qee37fb8a197bab2b372f06a831e339e892edb5dc', 'http://api.shoumeikeji.cn/picture/149802468450351.jpg');
INSERT INTO `quan_pic` VALUES ('561', 'Qee37fb8a197bab2b372f06a831e339e892edb5dc', 'http://api.shoumeikeji.cn/picture/149802468492760.jpg');
INSERT INTO `quan_pic` VALUES ('562', 'Q0ca98685afa60c7e746e5b449e673f98c3623dec', 'http://api.shoumeikeji.cn/picture/149802468359779.jpg');
INSERT INTO `quan_pic` VALUES ('563', 'Q0ca98685afa60c7e746e5b449e673f98c3623dec', 'http://api.shoumeikeji.cn/picture/149802468378077.jpg');
INSERT INTO `quan_pic` VALUES ('564', 'Q0ca98685afa60c7e746e5b449e673f98c3623dec', 'http://api.shoumeikeji.cn/picture/149802468365890.jpg');
INSERT INTO `quan_pic` VALUES ('565', 'Q0ca98685afa60c7e746e5b449e673f98c3623dec', 'http://api.shoumeikeji.cn/picture/149802468339472.jpg');
INSERT INTO `quan_pic` VALUES ('566', 'Q0ca98685afa60c7e746e5b449e673f98c3623dec', 'http://api.shoumeikeji.cn/picture/149802468450351.jpg');
INSERT INTO `quan_pic` VALUES ('567', 'Q0ca98685afa60c7e746e5b449e673f98c3623dec', 'http://api.shoumeikeji.cn/picture/149802468492760.jpg');
INSERT INTO `quan_pic` VALUES ('568', 'Qb50583c9521626067cffb6052de28ed81e2f8e8a', 'http://api.shoumeikeji.cn/picture/149802468359779.jpg');
INSERT INTO `quan_pic` VALUES ('569', 'Qb50583c9521626067cffb6052de28ed81e2f8e8a', 'http://api.shoumeikeji.cn/picture/149802468378077.jpg');
INSERT INTO `quan_pic` VALUES ('570', 'Qb50583c9521626067cffb6052de28ed81e2f8e8a', 'http://api.shoumeikeji.cn/picture/149802468365890.jpg');
INSERT INTO `quan_pic` VALUES ('571', 'Qb50583c9521626067cffb6052de28ed81e2f8e8a', 'http://api.shoumeikeji.cn/picture/149802468339472.jpg');
INSERT INTO `quan_pic` VALUES ('572', 'Qb50583c9521626067cffb6052de28ed81e2f8e8a', 'http://api.shoumeikeji.cn/picture/149802468450351.jpg');
INSERT INTO `quan_pic` VALUES ('573', 'Qb50583c9521626067cffb6052de28ed81e2f8e8a', 'http://api.shoumeikeji.cn/picture/149802468492760.jpg');
INSERT INTO `quan_pic` VALUES ('574', 'Qd7dcdb1b498309d2a0485a7cde4e4c7c8aa0b0e4', 'http://api.shoumeikeji.cn/picture/149802468359779.jpg');
INSERT INTO `quan_pic` VALUES ('575', 'Qd7dcdb1b498309d2a0485a7cde4e4c7c8aa0b0e4', 'http://api.shoumeikeji.cn/picture/149802468378077.jpg');
INSERT INTO `quan_pic` VALUES ('576', 'Qd7dcdb1b498309d2a0485a7cde4e4c7c8aa0b0e4', 'http://api.shoumeikeji.cn/picture/149802468365890.jpg');
INSERT INTO `quan_pic` VALUES ('577', 'Qd7dcdb1b498309d2a0485a7cde4e4c7c8aa0b0e4', 'http://api.shoumeikeji.cn/picture/149802468339472.jpg');
INSERT INTO `quan_pic` VALUES ('578', 'Qd7dcdb1b498309d2a0485a7cde4e4c7c8aa0b0e4', 'http://api.shoumeikeji.cn/picture/149802468450351.jpg');
INSERT INTO `quan_pic` VALUES ('579', 'Qd7dcdb1b498309d2a0485a7cde4e4c7c8aa0b0e4', 'http://api.shoumeikeji.cn/picture/149802468492760.jpg');
INSERT INTO `quan_pic` VALUES ('580', 'Qb4d6006eac851a8632a3949583af475fe9c55fcd', 'http://api.shoumeikeji.cn/picture/149802468359779.jpg');
INSERT INTO `quan_pic` VALUES ('581', 'Qb4d6006eac851a8632a3949583af475fe9c55fcd', 'http://api.shoumeikeji.cn/picture/149802468378077.jpg');
INSERT INTO `quan_pic` VALUES ('582', 'Qb4d6006eac851a8632a3949583af475fe9c55fcd', 'http://api.shoumeikeji.cn/picture/149802468365890.jpg');
INSERT INTO `quan_pic` VALUES ('583', 'Qb4d6006eac851a8632a3949583af475fe9c55fcd', 'http://api.shoumeikeji.cn/picture/149802468339472.jpg');
INSERT INTO `quan_pic` VALUES ('584', 'Qb4d6006eac851a8632a3949583af475fe9c55fcd', 'http://api.shoumeikeji.cn/picture/149802468450351.jpg');
INSERT INTO `quan_pic` VALUES ('585', 'Qb4d6006eac851a8632a3949583af475fe9c55fcd', 'http://api.shoumeikeji.cn/picture/149802468492760.jpg');
INSERT INTO `quan_pic` VALUES ('586', 'Q5375b650d4c9157bdca74463d4a2972f3e546860', 'http://api.shoumeikeji.cn/picture/149802468359779.jpg');
INSERT INTO `quan_pic` VALUES ('587', 'Q5375b650d4c9157bdca74463d4a2972f3e546860', 'http://api.shoumeikeji.cn/picture/149802468378077.jpg');
INSERT INTO `quan_pic` VALUES ('588', 'Q5375b650d4c9157bdca74463d4a2972f3e546860', 'http://api.shoumeikeji.cn/picture/149802468365890.jpg');
INSERT INTO `quan_pic` VALUES ('589', 'Q5375b650d4c9157bdca74463d4a2972f3e546860', 'http://api.shoumeikeji.cn/picture/149802468339472.jpg');
INSERT INTO `quan_pic` VALUES ('590', 'Q5375b650d4c9157bdca74463d4a2972f3e546860', 'http://api.shoumeikeji.cn/picture/149802468450351.jpg');
INSERT INTO `quan_pic` VALUES ('591', 'Q5375b650d4c9157bdca74463d4a2972f3e546860', 'http://api.shoumeikeji.cn/picture/149802468492760.jpg');
INSERT INTO `quan_pic` VALUES ('592', 'Q84cc44caf4cc1564cae8c240b37dee7f7c6c2cc0', 'http://api.shoumeikeji.cn/picture/149803645879037.jpg');
INSERT INTO `quan_pic` VALUES ('594', 'Q5aca511be53e3fab4f23443ea5bc738d843c69d1', 'http://api.shoumeikeji.cn/picture/149854189012256.jpg');
INSERT INTO `quan_pic` VALUES ('595', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220749605.jpg');
INSERT INTO `quan_pic` VALUES ('596', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220765436.jpg');
INSERT INTO `quan_pic` VALUES ('597', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220765425.jpg');
INSERT INTO `quan_pic` VALUES ('598', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220817700.jpg');
INSERT INTO `quan_pic` VALUES ('599', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220822006.jpg');
INSERT INTO `quan_pic` VALUES ('600', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220837038.jpg');
INSERT INTO `quan_pic` VALUES ('601', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220881021.jpg');
INSERT INTO `quan_pic` VALUES ('602', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220921823.jpg');
INSERT INTO `quan_pic` VALUES ('603', 'Qdba886344c7cc5b1efe8a82c9a9b726ab4caa52d', 'http://api.shoumeikeji.cn/picture/149854220965672.jpg');

-- ----------------------------
-- Table structure for raise
-- ----------------------------
DROP TABLE IF EXISTS `raise`;
CREATE TABLE `raise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rtoken` varchar(255) DEFAULT NULL COMMENT '众筹标识',
  `name` varchar(255) DEFAULT NULL COMMENT '众筹名称',
  `r_pic` varchar(255) DEFAULT NULL COMMENT '众筹封面',
  `process` int(4) DEFAULT NULL COMMENT '众筹进度 1:即将上线 2:众筹中 3:已结束',
  `status` int(4) DEFAULT NULL COMMENT '众筹状态  1:正常  2:暂停',
  `like` int(11) DEFAULT '0' COMMENT '点赞人数',
  `desc` varchar(255) DEFAULT NULL COMMENT '众筹描述',
  `time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `type` int(10) DEFAULT NULL COMMENT '众筹类型1商品 2服务',
  `goal` int(11) DEFAULT '0' COMMENT '目标金额 单位分',
  `begintime` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(11) DEFAULT NULL COMMENT '结束时间',
  `detail` varchar(255) DEFAULT NULL COMMENT '详情介绍',
  `order` int(11) DEFAULT '0' COMMENT '排序 ',
  `utoken` varchar(255) DEFAULT NULL COMMENT '发起人token',
  `left` int(11) DEFAULT NULL COMMENT '剩余金额 单位分',
  `support` int(11) DEFAULT '0' COMMENT '支持人数',
  `month` int(11) DEFAULT NULL COMMENT '天数',
  `dtoken` varchar(255) DEFAULT NULL COMMENT '商品 或 服务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of raise
-- ----------------------------
INSERT INTO `raise` VALUES ('190', 'TOKEN1', '商品一', 'http://api.shoumeikeji.cn/a.jpg', '2', '1', '1', '我是一个商品的小描述', '32', '13', '1000', '21', '321', 'file/goods/1490515203.txt', '32', '13', '100', '321', '2', null);
INSERT INTO `raise` VALUES ('191', 'TOKEN2', '商品二', 'http://api.shoumeikeji.cn/a.jpg', '3', '1', '1', '我是一个商品的小描述', '32', '13', '1000', '21', '321', 'file/goods/1490515203.txt', '32', '13', '100', '321', '2', null);
INSERT INTO `raise` VALUES ('192', 'TOKEN3', '商品三', 'http://api.shoumeikeji.cn/a.jpg', '2', '1', '1', '我是一个商品的小描述', '32', '13', '1000', '21', '321', 'file/goods/1490515203.txt', '32', '13', '100', '321', '2', null);
INSERT INTO `raise` VALUES ('193', 'TOKEN4', '商品四', 'http://api.shoumeikeji.cn/a.jpg', '3', '1', '1', '我是一个商品的小描述', '32', '13', '1000', '21', '321', 'file/goods/1490515203.txt', '32', '13', '100', '321', '2', null);
INSERT INTO `raise` VALUES ('194', 'TOKEN5', '商品五', 'http://api.shoumeikeji.cn/a.jpg', '3', '1', '1', '我是一个商品的小描述', '32', '13', '1000', '21', '321', 'file/goods/1490515203.txt', '32', '13', '100', '321', '2', null);

-- ----------------------------
-- Table structure for raise_comment
-- ----------------------------
DROP TABLE IF EXISTS `raise_comment`;
CREATE TABLE `raise_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `time` int(11) DEFAULT NULL COMMENT '评论时间 时间戳',
  `status` int(11) DEFAULT NULL COMMENT '状态 1正常 2删除',
  `type` varchar(255) DEFAULT NULL COMMENT '类型  1评论 2评论回复 3留言 4留言回复',
  `uname` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `utoken` varchar(255) DEFAULT NULL,
  `rtoken` varchar(255) DEFAULT NULL COMMENT '众筹标识',
  `parent_id` int(11) DEFAULT NULL COMMENT '父ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of raise_comment
-- ----------------------------
INSERT INTO `raise_comment` VALUES ('43', '我是留言', '1491882787', '1', '1', '张三', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'TOKEN1', '0');
INSERT INTO `raise_comment` VALUES ('44', '我是留言', '1491883020', '1', '1', '张三', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'TOKEN1', '0');
INSERT INTO `raise_comment` VALUES ('45', '我是留言', '1491883033', '1', '1', '张三', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'TOKEN1', '0');
INSERT INTO `raise_comment` VALUES ('46', '我是留言', '1491883037', '1', '1', '张三', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'TOKEN1', '0');
INSERT INTO `raise_comment` VALUES ('47', '我是留言', '1491883055', '1', '1', '张三', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'TOKEN1', '0');
INSERT INTO `raise_comment` VALUES ('54', '1321', '1491893941', '1', '1', null, null, 'TOKEN2', '0');
INSERT INTO `raise_comment` VALUES ('55', '65465465', '1491893988', '1', '1', null, null, 'TOKEN2', '0');
INSERT INTO `raise_comment` VALUES ('56', '4444', '1491894256', '1', '1', null, null, 'TOKEN2', '0');
INSERT INTO `raise_comment` VALUES ('57', '123', '1491895155', '1', '1', null, null, 'TOKEN2', '0');
INSERT INTO `raise_comment` VALUES ('58', '水电费水电费', '1491895252', '1', '1', null, null, 'TOKEN2', '0');

-- ----------------------------
-- Table structure for raise_detail
-- ----------------------------
DROP TABLE IF EXISTS `raise_detail`;
CREATE TABLE `raise_detail` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单号 ',
  `token` varchar(255) DEFAULT NULL,
  `rtoken` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL COMMENT '众筹图片',
  `name` varchar(255) DEFAULT NULL COMMENT '众筹名称',
  `tz_money` int(11) DEFAULT NULL COMMENT '投资金额',
  `status` int(4) DEFAULT NULL COMMENT '状态  1 提交订单 2 支付完成',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `paytime` varchar(255) DEFAULT NULL COMMENT '支付时间',
  `third_no` varchar(255) DEFAULT NULL COMMENT '第三方单号',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '支付方式 ',
  `user_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of raise_detail
-- ----------------------------
INSERT INTO `raise_detail` VALUES ('145', '201703211210379483', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'TOKEN1', '123', '', '123', '1', '1490069437', '1490069437', '', '', 'dfg', '13455232346');
INSERT INTO `raise_detail` VALUES ('146', '201703211210379484', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'TOKEN1', '123', '', '123', '1', '1490069437', '1490069437', '', '', 'dfg', '13455232346');
INSERT INTO `raise_detail` VALUES ('147', '201703211210379485', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'TOKEN1', '123', '', '123', '1', '1490069437', '1490069437', '', '', 'dfg', '13455232346');

-- ----------------------------
-- Table structure for raise_level
-- ----------------------------
DROP TABLE IF EXISTS `raise_level`;
CREATE TABLE `raise_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rtoken` varchar(255) DEFAULT NULL COMMENT '众筹标识',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `desc` varchar(255) DEFAULT NULL COMMENT '详情',
  `money` int(11) DEFAULT NULL COMMENT '金钱(分级为单位)',
  `status` int(11) DEFAULT NULL COMMENT '状态1:开启、2:关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of raise_level
-- ----------------------------
INSERT INTO `raise_level` VALUES ('43', 'ee977806d7286510da8b9a7492ba58e2484c0ecc1', '20170332', '2级', '188', '1');
INSERT INTO `raise_level` VALUES ('44', 'ee977806d7286510da8b9a7492ba58e2484c0ecc', '20170332', '2级', '188', '1');
INSERT INTO `raise_level` VALUES ('46', 'ee977806d7286510da8b9a7492ba58e2484c0ecc', '20170332', '2级', '188', '1');
INSERT INTO `raise_level` VALUES ('47', 'ee977806d7286510da8b9a7492ba58e2484c0ecc', '20170332', '2级', '188', '1');
INSERT INTO `raise_level` VALUES ('48', 'ee977806d7286510da8b9a7492ba58e2484c0ecc', '20170332', '2级', '188', '1');

-- ----------------------------
-- Table structure for raise_like
-- ----------------------------
DROP TABLE IF EXISTS `raise_like`;
CREATE TABLE `raise_like` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `utoken` varchar(255) DEFAULT NULL,
  `rtoken` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of raise_like
-- ----------------------------

-- ----------------------------
-- Table structure for raise_pic
-- ----------------------------
DROP TABLE IF EXISTS `raise_pic`;
CREATE TABLE `raise_pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rtoken` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '图片状态 1正常 2删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of raise_pic
-- ----------------------------
INSERT INTO `raise_pic` VALUES ('87', 'TOKEN1', 'a.jpg', null);
INSERT INTO `raise_pic` VALUES ('88', 'TOKEN1', 'b.jpg', null);
INSERT INTO `raise_pic` VALUES ('89', 'TOKEN1', 'c.jpg', null);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(23) unsigned NOT NULL AUTO_INCREMENT,
  `asktoken` varchar(255) DEFAULT NULL COMMENT '问答标识',
  `price` int(11) DEFAULT '0' COMMENT '金额',
  `ctime` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `token_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `token_name` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `dietitian` varchar(255) DEFAULT NULL COMMENT '营养师标识',
  `dietitian_img` varchar(255) DEFAULT NULL COMMENT '营养师免冠照片',
  `dietitian_name` varchar(255) DEFAULT NULL COMMENT '营养师名称',
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `grade` varchar(255) DEFAULT NULL COMMENT '营养师级别',
  `type` int(11) DEFAULT NULL COMMENT '1:回答 2：未回答',
  `txt` varchar(255) DEFAULT NULL COMMENT '问题内容',
  `num` int(11) DEFAULT '0' COMMENT '收听人数',
  `cid` int(11) DEFAULT NULL COMMENT '营养分类ID',
  `seconds` int(11) DEFAULT NULL COMMENT '录音秒数',
  `asktime` varchar(255) DEFAULT NULL COMMENT '回答时间',
  `askurl` varchar(255) DEFAULT NULL COMMENT '营养师语音回答',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '提问订单',
  `status` int(11) DEFAULT NULL COMMENT '订单状态 1 提交订单 2 完成支付 ',
  `paytime` varchar(255) DEFAULT NULL COMMENT '确认支付时间',
  `third` varchar(255) DEFAULT NULL COMMENT '第三方订单号',
  `state` int(11) DEFAULT NULL COMMENT '状态1：普通提问，2：营养师一对一提问',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('423', 'Ask201705191623144', '1', '1495182219', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg1YqK6FKCG3vQ9PiaRan4IHMMNehYarsGgLgzgicourGRb8Joz7a6MJfQZLRicZvJpMQ9jVVgzTVwsw/0', '周长江11', '9334892cd6011cc49c6840964bcfdeb42c1e50df', 'http://api.shoumeikeji.cn/picture/14949325832036.jpg', '啦啦啦1', '看看咯', '二级公共营养师', '1', '我是问题1', '0', '1', '18', null, 'http://oojj6qh8a.bkt.clouddn.com/2017052020084298.mp3', '201705191623398172', '2', '1495182240', 'wx20170519162341631ff9aca00309585258', '1');

-- ----------------------------
-- Table structure for text
-- ----------------------------
DROP TABLE IF EXISTS `text`;
CREATE TABLE `text` (
  `ctime` varchar(255) DEFAULT NULL,
  `id` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of text
-- ----------------------------
INSERT INTO `text` VALUES ('1', 'texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT '0' COMMENT '手机号',
  `type` int(10) DEFAULT NULL COMMENT '1 粉丝 2 会员 3 营养师 4 停用',
  `spokesman_code` varchar(255) DEFAULT NULL,
  `subscribe` int(10) DEFAULT NULL COMMENT '是否关注 1=关注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('134', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'ovxXWvwz8SMTLTHeZpNyA-BjAtR0', '13693276438', '2', '', '1');
INSERT INTO `user` VALUES ('135', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'ovxXWv1TMo-p04sfX7nNJ7HKgYbg', '0', '3', '', '1');
INSERT INTO `user` VALUES ('136', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'ovxXWv0E3d57KcmAN_MIEbzMU78w', '0', '3', 'qrcodes/136.png', '1');
INSERT INTO `user` VALUES ('138', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'ovxXWv3CHJLsugBLuDQiCAxREFtE', '18810773080', '2', 'qrcodes/138.png', '1');
INSERT INTO `user` VALUES ('139', '3f10cc9fe0fa9d7142a5a605c872d04d15ca610c', 'ovxXWvz9zcVtjEYWlHuZkXvqPgSc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('140', '000271ebdf6bb0e448c99ee02c64b28c384de00e', 'ovxXWv_HpGUzjJn8ZAslV_rxYavA', '0', '1', '', '1');
INSERT INTO `user` VALUES ('141', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', 'ovxXWv7NkLirzYsei-qTvia5ZH9E', '0', '3', '', '1');
INSERT INTO `user` VALUES ('142', 'e970ef250c37356236dd9338e12752d3c1673093', 'ovxXWvxyv93ZrijzHey2ZZO4qc6o', '18101392628', '3', 'qrcodes/142.png', '1');
INSERT INTO `user` VALUES ('143', 'b92aaf87773e61645e16b0a5fe3a4de8753c0df1', 'ovxXWv8_BxreP7_AB7D8B51-jNOc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('144', '10d1b7470d2a688e8388e6bf8c16b13e1bf9a05e', 'ovxXWv6aLXa9WTM8lV4is7zixEIw', '0', '3', '', '1');
INSERT INTO `user` VALUES ('145', '68e71635073f005cdc94d19833a404b7a9671d8f', 'ovxXWv4tFrRq1peuFArMkk6yJmrM', '0', '3', '', '1');
INSERT INTO `user` VALUES ('146', '71ee35bd9adddc1ef098fedee052c11cd88809d8', 'ovxXWv4GNtl3M-r1XqJA6zyrOQ9o', '0', '1', '', '1');
INSERT INTO `user` VALUES ('147', 'c59b3164d75cd5dc24afc5592864eaca5c0ea36d', 'ovxXWv8ejCnk7UyuFKmn2tFKuzoQ', '0', '1', '', '1');
INSERT INTO `user` VALUES ('148', 'fa9e4853197d568d087831c705cb544866757463', 'ovxXWv1QhEsydh3NGGD13lmPWquU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('149', '333a66e8788a39b3a834cb7c827ff93d9dafc809', 'ovxXWv8M0NBybs5glweC_cjm1lto', '0', '3', '', '1');
INSERT INTO `user` VALUES ('150', '47090a3074bd3d299b631e61f20a29915fa14e8e', 'ovxXWvxgwMYpRU0dGGmIlBPUv3xo', '0', '1', '', '1');
INSERT INTO `user` VALUES ('151', 'b62c2fc89452671842779318431005974fb9ca23', 'ovxXWv5dN9zUoItIzn_v95X8QHc8', '0', '3', '', '1');
INSERT INTO `user` VALUES ('152', '07bb307bd2dba7418f876b3a645ae7bf127d644f', 'ovxXWvx8AZDoGtWU1chWBbIBEV9Y', '0', '1', '', '1');
INSERT INTO `user` VALUES ('153', 'bea2db5771ee819bec702dc23468300136258eda', 'ovxXWv7qbfA8HeWPI7XzCtXcLtUY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('154', '1da12901f1e76e30515e29d6b2c38060d13f2041', 'ovxXWv0SeQsA26gNhjTmdchyRHDU', '0', '3', '', '1');
INSERT INTO `user` VALUES ('155', '96efc7cf60dd82815bc360a2e7e0b9acf85451ec', 'ovxXWv9W6rfNfKgAfGH5g1qVwjI4', '0', '1', '', '1');
INSERT INTO `user` VALUES ('156', 'f66eaba440e026d4557717845735fcd57b9484d9', 'ovxXWvzKkHGqio3FElGDU_kn52LY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('157', '64dabdc86ec8637e0c8b5b476181adf3f996f2b2', 'ovxXWv7rWnh6zfD3sf9-rwojFiTs', '0', '3', '', '1');
INSERT INTO `user` VALUES ('158', 'fdf0e44bef2d29932055bfdedb04380857690dfd', 'ovxXWvz8_xIGTzEab7by8RNVsNS4', '0', '1', '', '1');
INSERT INTO `user` VALUES ('159', '74b7ec88df72de233a9e7af42aa7955658ab29cb', 'ovxXWv6j_AD7RoBzMcjB326bAHMY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('160', '9382a430cfa82838a28ab1937c21a3e1202a41b5', 'ovxXWv81hBcxHZv9i6TteiY9hnQg', '0', '1', '', '1');
INSERT INTO `user` VALUES ('161', 'c049d629e80ab2a682b0153a56b7ea11a29c828b', 'ovxXWv9B8z8yNYKOH12c4f2qjDQI', '0', '3', 'qrcodes/161.png', '1');
INSERT INTO `user` VALUES ('162', 'a5c38ee90159f047c9aa45cd4453d8e5effca76f', 'ovxXWv90fdZXNFwGimPfRM01rTYQ', '0', '3', '', '1');
INSERT INTO `user` VALUES ('163', 'c8605a51efc2cf6f41ed7f2f6862a81fef36d391', 'ovxXWv-WzRw-PclGolapXtWmkblY', '0', '3', '', '1');
INSERT INTO `user` VALUES ('164', 'e7410c4ff5bebe2735ae0b1eada5ab9202a3dc23', 'ovxXWv18SD19FvW8d1Z71E_k28qk', '0', '3', '', '1');
INSERT INTO `user` VALUES ('165', '36a53977852603358535c680d758632f9e90e38a', 'ovxXWvyLVVnhOQhPlKXk82Q3WnWw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('166', '0b858b1d7b2e6651eedd7aa5097d232cbad97d3a', 'ovxXWv93NzM7gARdsd8KdOm3vZ7E', '0', '1', '', '1');
INSERT INTO `user` VALUES ('167', '2c6e8cfc976eda778d9382dfb486ac6b95d14e92', 'ovxXWv3h-tO7JubZjwy5QTVvpWSE', '0', '1', '', '1');
INSERT INTO `user` VALUES ('168', '01e850c96772318f1dc7ce8d18d8b05fa3d8b995', 'ovxXWv4TGTh6A8sBSQF7jIx_iZ6M', '0', '1', '', '1');
INSERT INTO `user` VALUES ('169', '90531026e2ac88721a704887d46ee16c405e20b2', 'ovxXWvzsCgk33rX_BpSn6KON99Kc', '0', '3', '', '1');
INSERT INTO `user` VALUES ('170', '947877c616a5c1a3a75421dcfdbedf8584152808', 'ovxXWvy--sZ1wqiz7AbeYr1fcEas', '0', '3', '', '1');
INSERT INTO `user` VALUES ('171', '62803165d70feec73d0f2e67bc2ac9b9249562c2', 'ovxXWv2VhzTF3EJ6pSJ619WTOl-8', '0', '3', '', '0');
INSERT INTO `user` VALUES ('172', 'cab348a40cdbce86fef087698aa0061a136e03c0', 'ovxXWvyIICSsiqTNrdY48deP9mk4', '0', '1', '', '1');
INSERT INTO `user` VALUES ('173', '70bfa80060e7d1a63c9b90f737e2f1613c0ab2ad', 'ovxXWv9t16KzVb2LPoTdoEAB9stc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('174', '954cb68891c0b802f173dc13efcc98fc718b555c', 'ovxXWv1UIwNKYXoUWi7Xsnkb6oLk', '0', '3', '', '1');
INSERT INTO `user` VALUES ('175', '7bb7732e0893106d492f52f38d81a47745a21dcf', 'ovxXWv3-IvRA00bowW0tXwx12Ky4', '0', '1', '', '1');
INSERT INTO `user` VALUES ('176', 'aaefefa8c6d9a9c18653a859c2564141eb7dd34b', 'ovxXWv6TYefKARgNhNiTwS-dtKc8', '0', '1', '', '1');
INSERT INTO `user` VALUES ('177', 'a0c312f58ef1c008cf5b761b2af5cfc9b22d04be', 'ovxXWv-jLBNUWTVqPn7l3ba_fcHo', '0', '1', 'qrcodes/177.png', '1');
INSERT INTO `user` VALUES ('178', '387cf3806b836967760d19ee901f246ea2fe5162', 'ovxXWv32060h1Y2f_p1AZSn0PweQ', '0', '1', '', '1');
INSERT INTO `user` VALUES ('179', '1960f622ff699078946ba1338209789ce0c411a8', 'ovxXWvzn8JFIv-x45TRzKSC3NyCs', '0', '1', '', '1');
INSERT INTO `user` VALUES ('180', '1ede68c55a9fabbb2a88aa8e128b4c1d1ed1c5cf', 'ovxXWv_daJlJYpR6RpuInLCaOujk', '0', '1', '', '1');
INSERT INTO `user` VALUES ('181', '7a284bfb723e671c62c605520eba2850022ab564', 'ovxXWv9VnETwJsCfX0ysR7BYqcqA', '0', '1', '', '1');
INSERT INTO `user` VALUES ('182', '6876aec744679d1eeb4aacd4e0c6274e0dc04918', 'ovxXWvy4iqhWprgfaRtRj5U8VifY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('183', '2a6af76604bf29ee90971edf4c74c0b840c48e0f', 'ovxXWv3IFvZsjAosL1qUynPKzaVY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('184', 'bdbb9deb3689606877ab1dcae636602a092f1306', 'ovxXWv5aiTkpIgFrSD1kE0vyucQA', '0', '1', '', '0');
INSERT INTO `user` VALUES ('185', '6dbaebe93633ea516420806f040b5c7b1350e314', 'ovxXWv6sPvs7QrxzY1cFUYevhDNA', '0', '1', '', '1');
INSERT INTO `user` VALUES ('186', '4e44b8e0fed5b0ff7b9e50e8f65b939593bf8876', 'ovxXWv9DaCQtn3vF55RgAfJSximI', '0', '1', '', '0');
INSERT INTO `user` VALUES ('187', '84e8ed1eabbd04c83d544452afb0f22bcb864926', 'ovxXWv0k-5HWGqBgynH9mrpi-4LI', '0', '1', '', '1');
INSERT INTO `user` VALUES ('188', 'cf838e443d1e3460e00bf5737929df6842ebdce2', 'ovxXWvyaE5eVHr0avhg3K9GPE7MM', '0', '1', '', '1');
INSERT INTO `user` VALUES ('189', '427f9293abd7a8617f71c9c6513864773202d2d3', 'ovxXWv05z4d6fEFJEkxXVfSD0TpI', '0', '1', '', '1');
INSERT INTO `user` VALUES ('190', '8fc9eedfb2d6d6e445e0314a75c59b61a7ee3d2f', 'ovxXWv5EcoszstfK1ZsY3KJSk6iE', '0', '1', '', '0');
INSERT INTO `user` VALUES ('191', 'd21e345169ecdff411368bd7b06e0e2032cee813', 'ovxXWvxi_Z2Fppq-e7a7Co_5Sc7k', '0', '1', '', '1');
INSERT INTO `user` VALUES ('192', '3c299362d904622d4b21d5824e8e6810276de707', 'ovxXWv9-B5roXuFGXQjA6lUX__HU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('193', 'a19eea298b5af0cf45e1e4c8019c39709494b394', 'ovxXWv1qoz1mazuK4RWfT_3RVIjU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('194', '11f430b5da9791808f3b4a9c4d0afec3f1856451', 'ovxXWv_nxNEReml5onTWVzu0TfHc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('195', '5d489818332ced95d046669be5bc1e6c7e0d11a0', 'ovxXWvxnToKZt46XWta8KLG5nE20', '0', '1', '', '0');
INSERT INTO `user` VALUES ('196', '865edad126130b2a107ebf749518b48283062a02', 'ovxXWvwnRl1m2bQ2BYukECqPTJdY', '0', '3', '', '1');
INSERT INTO `user` VALUES ('197', 'f8a1ffa2f14b03b859af43d722dbecdeecbaacc2', 'ovxXWv4fkMxYL91aI_CfwXg5ubfs', '0', '1', '', '1');
INSERT INTO `user` VALUES ('198', '1a62e0f18bc2b0fafba020e845ff4e19ed823c69', 'ovxXWvw5EarJEHhAl7IQZYLW4-AE', '0', '1', '', '1');
INSERT INTO `user` VALUES ('199', '540f0370c99a93d4249262b451de628008f9abfc', 'ovxXWv7BsKqieyG_V5VjnBYFDnTg', '0', '3', '', '1');
INSERT INTO `user` VALUES ('200', '12c4e5a2510628df1609d47ec322138283d94807', 'ovxXWv4drz3LvdmxE3VcHWHQFVdE', '0', '3', '', '1');
INSERT INTO `user` VALUES ('201', '2c8dc111cdd9193c0f0f204297fce24123972801', 'ovxXWv7uG9INOmWsoGczIk3VE2sU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('202', '75b7be95e8207a2dcbc542eaf3ba655b20c9ba61', 'ovxXWvy4h1jmZdfcqu0NYWeZO1zc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('203', '55836e1291989ba7a9b94011394bd3f15f71a119', 'ovxXWv1SwBfL-p37ONu-1LukQm6o', '0', '1', '', '1');
INSERT INTO `user` VALUES ('204', '3277c1b660a0889d4ed81c7c01257b21e9edf606', 'ovxXWv5JmLhM8f--hufqjS4-7geU', '0', '1', '', '0');
INSERT INTO `user` VALUES ('205', '823d76aa871125175768c9442e2d6ba8aa048b1d', 'ovxXWv-EFVQiD7Taz9KqECCYvk0c', '0', '1', '', '1');
INSERT INTO `user` VALUES ('206', 'aebc41f0bcd58fc444b2a331ddc795872048e083', 'ovxXWv7Rp7ww1p-H-NvECjXx_nbo', '0', '1', '', '1');
INSERT INTO `user` VALUES ('207', '31e554db61e5ac3fd71d88b93e4e0d26d96e1782', 'ovxXWv7ZclXY_oK8eX2PQ4rCXILE', '0', '1', '', '1');
INSERT INTO `user` VALUES ('208', 'd3660c48a1e828dd899fe340e86350bc1e40bfe3', 'ovxXWv664UYRBcgK1vhQhhw4ByFE', '0', '3', '', '1');
INSERT INTO `user` VALUES ('209', '4031e31e56d4ab05d51a886080dee3038a49c557', 'ovxXWv8i08krk_VjT82clyg4BWY8', '0', '1', '', '1');
INSERT INTO `user` VALUES ('210', '98c9838398cb7164a2d0bb5d26241940de820fb7', 'ovxXWv6gqQGlTvt9hvFiFQxO0m_w', '0', '3', '', '1');
INSERT INTO `user` VALUES ('212', '41b40d332ed5d92ed19598f0b50bb57eb42194de', 'ovxXWvy971ax-KcZ7sODpvXJstHU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('213', '67a86d396660d41e192f5a6b3625ebc035598e3c', 'ovxXWv-PTRyIxWZBwXDxz8TL2yCE', '0', '1', '', '1');
INSERT INTO `user` VALUES ('214', '6b14252cb2524c0b8ba2bf3d508cb590e1404f07', 'ovxXWv1qNC85FwjEC1sdME9-iIiM', '0', '1', '', '1');
INSERT INTO `user` VALUES ('215', '0a52198b2713b08d172ab73896310921297499ae', 'ovxXWv_THTBt_Fn3z4C8JQykoC8s', '0', '1', '', '1');
INSERT INTO `user` VALUES ('216', '8960918179c47486ad71b8654a520fae50450cdf', 'ovxXWv4P8XGJ_kCVygjvKua-KwtI', '0', '3', '', '1');
INSERT INTO `user` VALUES ('217', '9a5811c861190523423222c7a23575e641db9edd', 'ovxXWvzNKiGIwbWexqcvHaWceVew', '0', '3', '', '1');
INSERT INTO `user` VALUES ('218', '6ed2cd882c081e5a7a8377f7bc5808ae19381643', 'ovxXWv__tZxoIXOM5SmHwtLsLOCY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('219', '0ec20da1ed851141e92e94a12e689b510e1f5ec5', 'ovxXWv3QthkVHbFYwtsaQ0-Fs5JA', '0', '1', '', '1');
INSERT INTO `user` VALUES ('220', '9611315e62c886953daa5fb35f03bc0285307fde', 'ovxXWv8WdgG7ermE_zfzOKWpc_gc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('221', 'ccffbddabf32abcda66a607a1a0097a4f5b64c8c', 'ovxXWv06Q66vUQkEpHhQ6VeKf1Og', '0', '3', '', '1');
INSERT INTO `user` VALUES ('222', 'a81965fd8b377a863867b96c807bb33787ad900b', 'ovxXWvz6GbONOAYcoINCG1tbaheA', '18611978532', '3', '', '1');
INSERT INTO `user` VALUES ('223', '2e257a3c6b7539ab39880d78f453248b21462cfb', 'ovxXWv1ptndWKZZ0hVfe5rmht6Os', '0', '1', '', '0');
INSERT INTO `user` VALUES ('224', 'c1fc1cf3c2597c61b352c216a28a328d555ddc86', 'ovxXWv-FjmlhDr0VYwG1hoQcCyi8', '0', '1', '', '1');
INSERT INTO `user` VALUES ('225', 'eec5d51601977d305fd146c5b2cf72e3bddf153c', 'ovxXWv2RDfR4Uc82XZYr0Wesal_Q', '0', '1', '', '1');
INSERT INTO `user` VALUES ('226', '91790aefc7d87663e7ea90da2cd90a83e23d2019', 'ovxXWv6qzD_3i5XT28RKOu4kr8OU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('227', 'aec6d74fdafe1669d32672d456e4453a132a22d0', 'ovxXWvw5MBYHiItyN3DmjFYO49g0', '0', '1', '', '1');
INSERT INTO `user` VALUES ('228', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', 'ovxXWvygXUAXKUpf17KLSXAbC3fQ', '0', '3', '', '1');
INSERT INTO `user` VALUES ('229', 'a570147d40871f63acad56a49bc80b10c49e6399', 'ovxXWv73Q24_O5SHIfmyKzgNSn0Y', '0', '1', '', '1');
INSERT INTO `user` VALUES ('230', '4aae69bda1b45129f4aedac5501f28dd24f7fb6c', 'ovxXWv_4dj7z-He0OLU7H_mVDm_E', '0', '1', '', '1');
INSERT INTO `user` VALUES ('231', 'ed0c5b66c80fcb60237a8fae152a999c9e63311a', 'ovxXWv5UXPAbltayLyW5kEserzdk', '0', '1', '', '1');
INSERT INTO `user` VALUES ('232', 'a2193d4e5c29e665539a45fe7a1d4b2288c840f8', 'ovxXWv-q5XujyTGhxXKd94Aj-2hY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('233', 'd6def2a0fba61062a7e479fc2a2c36331ccbb943', 'ovxXWvyKG3K4h2RW3_riVpqw753I', '0', '1', '', '0');
INSERT INTO `user` VALUES ('234', '307a9a3960b79e62daf7995ac94b7d7fd238c18c', 'ovxXWv_lB3fRJ9Y1isDJnthlF7HI', '0', '1', '', '1');
INSERT INTO `user` VALUES ('235', '73ce6132a792219f889b61ab16abcbb071ec0735', 'ovxXWv_LVFMRSR3eJUtVKvDKbATw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('236', 'c138b0add2e89c3e6dca7546594e64503b4d4b03', 'ovxXWv_lKSI0t4FWdkjIBGHZeyeE', '18910271624', '2', '', '1');
INSERT INTO `user` VALUES ('237', 'a9cce3f70ccf19f92f0ac8b947010c8d4723989f', 'ovxXWvwuKEkPNXqf4DMg0iIDfMpw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('238', '7adb12aa7ed258c8a3b811fea331ef3284710168', 'ovxXWv9wzWHn0CPLTn489XOxGq7A', '0', '1', '', '1');
INSERT INTO `user` VALUES ('239', '91ef26ecbf54bef26399caa93541f8493f13b5a4', 'ovxXWv4n7M5h8T37WNY7LKawCi8A', '0', '1', '', '1');
INSERT INTO `user` VALUES ('240', 'f262b9dc26850bffe0f13b1a1bc17aacbf90e948', 'ovxXWvxgYtZ_xKvz62smJsFZ1jvQ', '0', '1', '', '1');
INSERT INTO `user` VALUES ('241', '38d610488b7be37c2d9221ec9dd1e41cc95644ec', 'ovxXWvyXnRnf36jolbg1271h0zRw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('242', '62d0bd694dcba359625bcc1ac95c27751fb92453', 'ovxXWvzhiwFL75y6HARqqx_8_iVs', '0', '1', '', '1');
INSERT INTO `user` VALUES ('243', '35e650822f5551e70d916cdafbb1d06545b71805', 'ovxXWv0Z5gYLyYMau3RhKUjymLi0', '0', '1', '', '1');
INSERT INTO `user` VALUES ('244', '01e16769e5b036e13d201dd6ac71a46c9aef2027', 'ovxXWvzGaY7x8Y7aSVTi2r8Nzbw8', '0', '1', '', '0');
INSERT INTO `user` VALUES ('245', 'fc1504f773514e54cf1fbcc2d02024c4ab07bb4b', 'ovxXWv7nasXI2FVQWJo-lLFkdT8Y', '0', '1', '', '1');
INSERT INTO `user` VALUES ('246', '5d98fbb90bc5804f38b5c99a1b1f21b1c516fe66', 'ovxXWv-m6u--e6bFQULNd7EHKDek', '0', '1', '', '1');
INSERT INTO `user` VALUES ('247', '07eb8a0a4bc85cfcee40899f3f0ee495ff5f3ff6', 'ovxXWvwlImhkWvBhenET9uxXlV3U', '0', '1', '', '1');
INSERT INTO `user` VALUES ('248', '02e15ed94d3dfcbeca8db0a6a9f1025b77a841c3', 'ovxXWv59oum96DObr1y8ePQVEzXo', '0', '1', '', '1');
INSERT INTO `user` VALUES ('249', '8d3877395dcafbfdd2eb0e91b17b7f99d6ba1bd5', 'ovxXWv7hPlkXKOUpB0vw_6RBSOH0', '0', '1', '', '0');
INSERT INTO `user` VALUES ('250', 'efca22dd9d0aaaf984ec208266afaf21371b5301', 'ovxXWv9hLorlml51zqgjXmaFX3OE', '0', '3', '', '1');
INSERT INTO `user` VALUES ('251', '5ac8335421c2f41a9c08c4737dee0bfdbc20d8a2', 'ovxXWv5Qm875gVrlSf1BWJwp7mIQ', '0', '1', '', '1');
INSERT INTO `user` VALUES ('252', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', 'ovxXWvxqohQYbw-L1axpw4fT1Jy0', '0', '3', '', '1');
INSERT INTO `user` VALUES ('253', '6efa58638582e44456eabf8b10657eaec62fb2d8', 'ovxXWvy8x0ljpFDb-SW4B1EIrSQw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('255', '2c33353bd953993211772b4815e0bbe996185c57', 'ovxXWv3BxLmexCQ7lmn3FBiEGGfM', '0', '1', '', '0');
INSERT INTO `user` VALUES ('256', 'fca52d2c05123f9b8fcd79a19af6e8eada75a0b5', 'ovxXWv-IcSvSG5AjQS4YME5hwWTI', '0', '1', '', '1');
INSERT INTO `user` VALUES ('257', '3db60ddf1263df670d9b2d303495e56079b72d14', 'ovxXWv17DzDhX9rKrs2zjnFo-uF0', '0', '1', '', '0');
INSERT INTO `user` VALUES ('258', '4eaca5c95e5570d78266e0aa91e7ab723347f58d', 'ovxXWv4dTa5hYQK3LQgD1S_q3pCo', '0', '1', '', '1');
INSERT INTO `user` VALUES ('259', 'bdef0af65b5c4ab16d8010a7c4bd0ea86713ad9d', 'ovxXWv47rKvEhDGYTrJSaVy3cY5Q', '0', '1', '', '1');
INSERT INTO `user` VALUES ('260', '33e80215c4552ffabbfd10e521097deff091eaae', 'ovxXWvxV2zT5r-XObLQ2cOxBXnKo', '0', '1', '', '1');
INSERT INTO `user` VALUES ('261', 'bca82289e40277addfedd3a0dfe685165ef4871b', 'ovxXWv8DaBxWRo2w0GTW7duGyZt0', '0', '1', '', '1');
INSERT INTO `user` VALUES ('262', '91ce4757fab344122c7459605625d6deef6ed41b', 'ovxXWv4V1o_QugU1qsudsu0AN_mQ', '0', '1', '', '1');
INSERT INTO `user` VALUES ('263', 'b8f035864cf762e1362ba866f96941e988d49aa6', 'ovxXWv2SJfMCapPV1I8RxNqK3gdk', '0', '1', '', '1');
INSERT INTO `user` VALUES ('264', '7e355f370a91a8765256b39ffe29c90e2f81cebf', 'ovxXWv8mt1moL6LJOjiIecfdmz8s', '0', '1', '', '0');
INSERT INTO `user` VALUES ('265', '89fd4b03138b18ee0d4d2d088181e35d34d099ac', 'ovxXWv2iDNxu1xrCq79xf0oS13rA', '0', '1', '', '0');
INSERT INTO `user` VALUES ('266', 'b9c1bf645213f6ee9855fc3928394c041fe2199c', 'ovxXWv0OmALGBi7ZjhaV_GVmmtng', '0', '1', '', '0');
INSERT INTO `user` VALUES ('267', '8edbdc4f1567b7ff8b029bde5b086f584a89fda9', 'ovxXWvyef5MtVfFCjnyr4dy3yCTM', '0', '3', '', '1');
INSERT INTO `user` VALUES ('268', '4c501736fa4daa6c41f3798e940f05351072388d', 'ovxXWv2HcvEbO0EIuCTVaYrvU5s0', '0', '1', '', '0');
INSERT INTO `user` VALUES ('269', '9b30e300fd8e84ba34d8bf5b38a5c7110d2916f2', 'ovxXWv6MQxbjR6y16bqkaexbrVIc', '0', '3', '', '1');
INSERT INTO `user` VALUES ('270', '847e69f37df2c2bf26bf245376edb73fae7019f9', 'ovxXWv87DDpSEmfen1QX1NirahCU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('271', '345c646df25db4e341b1d9fb9deb0b15c65231cd', 'ovxXWv2Qes2yCm3ekPK6VxMwvX8s', '0', '1', '', '1');
INSERT INTO `user` VALUES ('272', 'c24755247537a8e8358d579081a1eedfd2f3643a', 'ovxXWv737j0-23Jvu8yxrCZjUCig', '0', '1', '', '1');
INSERT INTO `user` VALUES ('273', '62a7c009616703c5c9c03f183eac77c0d3e3ac09', 'ovxXWv6CvZLro-cv6MIgRMYejybk', '0', '1', '', '1');
INSERT INTO `user` VALUES ('274', '8485f0d948615a169f7ad3ed1ed01e097dc43051', 'ovxXWv-uKjnyH2Ok0hsJmn75Ajdk', '0', '1', '', '1');
INSERT INTO `user` VALUES ('275', '15f820f3066ff34fc16a103808348db38b1b34b0', 'ovxXWv_wHXOJfeITBui0XWPo8DV8', '0', '1', '', '1');
INSERT INTO `user` VALUES ('276', 'cf64402286b43b0acedb0d988c91e1ba4da23c9f', 'ovxXWv8C2FZVX537lsKLg7H9444A', '0', '1', '', '1');
INSERT INTO `user` VALUES ('277', 'f939e13189a27d242624b13651f5e173aa78997a', 'ovxXWvz_YlI625PsY1DOvAIEGfco', '0', '1', '', '1');
INSERT INTO `user` VALUES ('281', 'b7a396bf168ff5af76e416985cf5735ecedb03d4', 'ovxXWvywFJkQFzpboXG3BxHO4PxQ', '0', '3', '', '0');
INSERT INTO `user` VALUES ('291', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'ovxXWv5t40vP5msVZsSDo-qk_-ZU', '18301420150', '3', '', '1');
INSERT INTO `user` VALUES ('292', '9bae40e3babb53932db229e3a2147fb22ee376b0', 'ovxXWvxXpcB8gu2vv3lBMokcDHLo', '0', '1', '', '1');
INSERT INTO `user` VALUES ('293', '39a10cd5b0a7735ef15866b2b938890510c27962', 'ovxXWv8frJupb5WtjdadkuOiL5jc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('294', '38e9464c5b0426cb599b4d531a7305aaa7b8271d', 'ovxXWv4Q-p2dPPiKi5Cc493uvNrU', '0', '1', '', '0');
INSERT INTO `user` VALUES ('295', '37d28bd9a96a4cf7196cef3a2bc874104610fbb2', 'ovxXWv6yI5BsOCt06207LjuX5Hj4', '0', '1', '', '1');
INSERT INTO `user` VALUES ('296', 'bb736cb1b3f6f0e092c046330dc48f02e3152907', 'ovxXWvwHZ0Diq-czX6S3_L108k30', '0', '1', '', '1');
INSERT INTO `user` VALUES ('297', '3845a9de56d6c7524018e80d8af2fbe0f6a0d21d', 'ovxXWv4j4qJ_8ShchY-wMEwHbCSM', '0', '1', '', '1');
INSERT INTO `user` VALUES ('298', '2ad84c983dd76d69d1f968920d9c7ab3b4909b71', 'ovxXWv8vgJimnuNQ4wEjcrKTLUQc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('299', 'a4bf0b3cbe16321ab6d0f05f45697c3cf3edd6c8', 'ovxXWv88fFrrLMx_FRfxC9lmjd8E', '0', '1', '', '1');
INSERT INTO `user` VALUES ('300', '833cfbfb5daf86e5b400de4ba69a4b000d93f89f', 'ovxXWvzrby_GYTrZQ1exSgzWE6k4', '0', '1', '', '0');
INSERT INTO `user` VALUES ('301', 'fbff8d58741c6e0a42835714f3ea023065ee0b85', 'ovxXWvx8TiZ1QVCHe8NJu1yBnEVw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('302', 'b45f0e1f9fb7419a713bb5bb639c61779faf8b6a', 'ovxXWv9yFVvunSOIW9y_Y5zC1CQM', '0', '1', '', '1');
INSERT INTO `user` VALUES ('303', '6a17b3718c3475f01cf4d84603a342da23f7e1cf', 'ovxXWvzndbvCTBs-Ay-XYqCk2Hw4', '0', '1', '', '1');
INSERT INTO `user` VALUES ('304', 'c167283cb0aa335fbb6a1c6934045c3d111fcf9c', 'ovxXWv2nHBhTwhWRYJq_A09CraW0', '0', '1', '', '1');
INSERT INTO `user` VALUES ('305', '383f3af6e6c9f7e09be7583f361e665b66fb80f3', 'ovxXWv8n8q6H1wIY0fRMcIVIRh6g', '0', '1', '', '1');
INSERT INTO `user` VALUES ('306', '417119586278becdf8791753bde4ce1c2f20d1dc', 'ovxXWv6P8jB6WONfXLLXV1DH7DsY', '0', '1', '', '0');
INSERT INTO `user` VALUES ('307', '49bc4aaf0708addf438de2ed11c6abc8d6ce1301', 'ovxXWv1-TUWUwsajmkNof8DYILNY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('308', '5e60cb08c239b6bc2c6f3678ad9e47344fd6116e', 'ovxXWv2d3hD6Z3fhUHn7G_K6tjx8', '0', '1', '', '1');
INSERT INTO `user` VALUES ('309', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', 'ovxXWv2reglWhtXy3i7Up6LuAaeI', '18610883112', '2', 'qrcodes/309.png', '1');
INSERT INTO `user` VALUES ('310', '92e62fd29b050ca9c1fb99644b5ebf17f19082d2', 'ovxXWvzh9kSoaw3ESR-gtpth2L3U', '0', '1', '', '1');
INSERT INTO `user` VALUES ('311', '0be95050f61544df70dd0d860238de544b44ec36', 'ovxXWvwYLNwVHj5pVwABd1rWCTT0', '0', '1', '', '1');
INSERT INTO `user` VALUES ('312', 'b784a83c4e0ae34e609c0b09dc851011e8fe2db5', 'ovxXWv4CgKpzEI_yRpPqE0T4TY2A', '0', '1', '', '1');
INSERT INTO `user` VALUES ('313', 'c0996795511cdd86dfa6b01184102824990d8380', 'ovxXWv4Z8m6MFOfJQpZj_pBhPqxA', '0', '1', '', '1');
INSERT INTO `user` VALUES ('314', 'ac8168b88cabc8ce4b8f7f0f2713d0e50b3ab749', 'ovxXWv6U_fQrZ3hLXExR1lIP3tFw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('319', '6f90fad054c01349ef88e6fa659ac83125c7115d', 'ovxXWv9r9Dyo2WVBZIIcpvqj_gJE', '0', '1', '', '1');
INSERT INTO `user` VALUES ('320', '1f4e33d272d52229059af2d89486a538f70ef878', 'ovxXWv06GTeTGtOjuwa4ihSHmkc0', '0', '1', '', '1');
INSERT INTO `user` VALUES ('321', 'c64cfee4b81713682cb6faa050193736d7fada61', 'ovxXWv6rqJ3XlPzbfFPXlUCNvwAw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('322', '041c8fb5c9c27b15107e45b8ed94557ead8cec79', 'ovxXWv1BRaGiWcMSg8j3i92CpE2A', '0', '1', '', '0');
INSERT INTO `user` VALUES ('323', '69be2101826e9ee7dcbc649f139c07c66ba412df', 'ovxXWv2HS60GDw0uB7xN-he4vLBo', '0', '1', '', '1');
INSERT INTO `user` VALUES ('324', '50f12455b0af045fa86a3cdc1b4abb29e65ce3e9', 'ovxXWvyfqTULHTdFjCd3LYvTNCmA', '0', '1', '', '0');
INSERT INTO `user` VALUES ('325', '1f40489eca46b8b5450e124bc010f7e16a0a108d', 'ovxXWvwDgq9OcjeDyvn_ybw7bBdI', '0', '3', '', '1');
INSERT INTO `user` VALUES ('326', '250d322bc396b9326fe3aa3e5056d86aed82dcf4', 'ovxXWv-E1AGmIin8AmfwzJ8808j0', '0', '1', '', '1');
INSERT INTO `user` VALUES ('327', '0f0f4a1339b88260e566e92de2c348994d17834b', 'ovxXWv5ytf-js8PNOHP3nCt8mlYI', '0', '1', '', '1');
INSERT INTO `user` VALUES ('328', 'de308062577d69fc9e7c9d96918595b21df45f59', 'ovxXWv1DMepvZj1LBbX4kR8f0kCA', '0', '1', '', '0');
INSERT INTO `user` VALUES ('329', 'ee5c5ee5b1ffe55fde371eaffd4a60786c8afdc4', 'ovxXWvwUSlpKK6AIrdOMwgghQz0U', '0', '1', '', '0');
INSERT INTO `user` VALUES ('330', 'cdb6ba838f5a603794f29e50560e33b4aac6b769', 'ovxXWv8wF5ts6kPVjHl2NNlc6_MQ', '0', '1', '', '1');
INSERT INTO `user` VALUES ('331', 'aff56fa5266abfc93a284a65b77e5c465f9df89a', 'ovxXWv0aJ0xJuOKtLFew7yrZVmrw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('332', '10f2d6d7633565aa1bbedc4f4c0b47d74d90be44', 'ovxXWv9QR9gIPlVJQBIWaHFU67So', '0', '1', '', '1');
INSERT INTO `user` VALUES ('333', 'd29997a3f57d99280558a2291e9cf55c93c98635', 'ovxXWv1BYAsPImr238RHndw_-Rik', '0', '1', '', '0');
INSERT INTO `user` VALUES ('334', 'd2ebc523c0e665f488152ee7752a33ba2a51d17d', 'ovxXWv7ugopUIF6tnFvCGzSeellE', '0', '1', '', '1');
INSERT INTO `user` VALUES ('335', 'afba0dd5c48579fec17e402d9ad147592db3e22f', 'ovxXWv-7bfJEEUJkt6PLp5pcMOEY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('336', 'a1e769085b6a575e819aa33477dedef6a0e6cd52', 'ovxXWv2xUtgPdWHJFWFamJ5Azssk', '0', '1', '', '0');
INSERT INTO `user` VALUES ('337', '15084998f14295d717aa5c18c25e72327ff13bee', 'ovxXWv43DvGzXg-gfCOVesocO_co', '0', '1', '', '1');
INSERT INTO `user` VALUES ('338', '257c6d6129c6788b4092bc66ee7cdd777b928d2e', 'ovxXWvz_UMsIPxNf7-TOgjlQ2708', '0', '1', '', '0');
INSERT INTO `user` VALUES ('339', 'e6254846264ed8749a7220e7990f6cfa2e6eed05', 'ovxXWvzhL7nvklk6KMaMYPRTCymc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('340', '6e44623341a7eb48b66cd544515f6b47a2fd3ee9', 'ovxXWv8Am9j5uBZTUsITXU54l8FA', '0', '1', '', '1');
INSERT INTO `user` VALUES ('341', '3bb730c950b70dce3cc3078d9aac68b10c5923ad', 'ovxXWv1nEpeeRLOBAkeyVulrvEp4', '0', '1', '', '1');
INSERT INTO `user` VALUES ('342', 'e5db07daca9f48c1931c696c6a1a14a93c2e82e0', 'ovxXWvxIwCD8VowhkeDp96f8DsVo', '0', '1', '', '1');
INSERT INTO `user` VALUES ('343', '8579e6ec902fbf18df6cf8c502d21dea1cd0f151', 'ovxXWv_GcybCxK9LRK_wWj_o54Zk', '0', '1', '', '1');
INSERT INTO `user` VALUES ('344', '75c5e77b85c425408012313d3ce9ce231b202b34', 'ovxXWvyiwCXjAn7_a1NDOWPkNTlQ', '0', '1', '', '1');
INSERT INTO `user` VALUES ('345', 'c5fcba5f2e2abb8c3dc65715b0060059b0ed974e', 'ovxXWv4RXETgzqKN2DScNaR0YFvw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('346', '9557a1ba08ad25c7e469077a191cf7daaf2761cd', 'ovxXWvy1yjcXd7AiwCyzG3_eUnGc', '0', '1', '', '1');
INSERT INTO `user` VALUES ('347', 'ebdb9222682e73af651888f04beaa99ade6e0ff3', 'ovxXWvzjr7I_HoUWm2yoeVgBkH30', '0', '1', '', '1');
INSERT INTO `user` VALUES ('348', 'dc493c7ee4399d3b5834c9761450cd265b343068', 'ovxXWv-yfmgB8gDL-lKdTaTQJvu4', '0', '1', '', '1');
INSERT INTO `user` VALUES ('349', 'd4e09bfa8de7211470a02b8bf8fc7df4ccb29e02', 'ovxXWv7T4rIrtdXVjPhAqybaxb2o', '0', '1', '', '1');
INSERT INTO `user` VALUES ('350', '5966d66a4bd7f69e13a80f0e9ff934387713bc12', 'ovxXWv4WA2_sUhQff7Ug0T0z3VMU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('351', '123b10606bd318c65784f50ef1aa6d6b7b93c26c', 'ovxXWv7lSLf-NeaPjjLXNvnqN72I', '0', '1', '', '1');
INSERT INTO `user` VALUES ('352', '65ac31b2b0f5b3904270a7d8602711e94a6392ca', 'ovxXWvxa_YEVZbT0IYNoGVpWiBPM', '0', '1', '', '0');
INSERT INTO `user` VALUES ('353', '1116d39a1ded3a71d97996283de69743d14b9a33', 'ovxXWv3ZSw873QrlrVGRS9VfhhO0', '0', '1', '', '1');
INSERT INTO `user` VALUES ('354', 'ff6a9c2be8681ec370adae14416d255c420572c8', 'ovxXWv0OlzDqmrjGqKq76L53kXmg', '0', '1', '', '1');
INSERT INTO `user` VALUES ('355', 'f68867d9e1564f0db96f1810464ac8cdf55e0315', 'ovxXWvx2XvqEPqdgoTTeD45cE790', '0', '1', '', '1');
INSERT INTO `user` VALUES ('356', '0cf57a06cda4187d962afc38faaaf4b0bc24010f', 'ovxXWv_LrTT4rywaQ1sQA34_RYFU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('357', 'e51faac7813baee5f17815675d039ff61725c87c', 'ovxXWv0QTk2giIkCJ1nndUh4R1fg', '0', '1', '', '1');
INSERT INTO `user` VALUES ('358', 'dee2e3a547cb0249ccf187e5c55654fee410f1c3', 'ovxXWv6eX4IK5TLRdYuxtYhQkLOY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('359', '3d2c5ff8d22cabb2a592627e7fd928c50abc2b3d', 'ovxXWv8OdXFY6x97WbJvUV_P6J2k', '0', '1', '', '1');
INSERT INTO `user` VALUES ('360', '2998e3cef1aac3578464065cf04288f36a5d808d', 'ovxXWv3ysNXj68LMKDcQzNyipODw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('361', 'c37d079ce3164460564f98774719aeebd2ed5992', 'ovxXWv4-OaQyrcu6mxPUFZg2yecU', '0', '1', '', '1');
INSERT INTO `user` VALUES ('362', 'a6122605ae34a4173be6ec901cd095797b8f48e7', 'ovxXWv1q-_P5PlNn8QqHoKfZcPgs', '0', '1', '', '0');
INSERT INTO `user` VALUES ('363', '4d87c03ee8d502bfaa593b01afd3b1e3da33fd3a', 'ovxXWv3S4aUzBkol9bTRnTz-EoQs', '0', '3', '', '1');
INSERT INTO `user` VALUES ('364', 'e711c11b6d3d3b2adc8065471155c874a190ab01', 'ovxXWv_W1bDVE9W__tb5ZghgTMOk', '0', '1', '', '0');
INSERT INTO `user` VALUES ('366', '3fd4429a5a7b7fe2fdd6e0f1631bab7dc1babc99', 'ovxXWv3PUEU9xbVLMRwRSekCyR0c', '0', '1', '', '0');
INSERT INTO `user` VALUES ('367', '8e4b420f904db854a4cb58ac71a3cc73a240d7b4', 'ovxXWvx7FFph8zuriOA3KCaBaF4c', '0', '1', '', '1');
INSERT INTO `user` VALUES ('368', '1eed9332d2d9bf5982d5f4a62616cb14dfa540be', 'ovxXWv6falIyDTUq_41Sx8dwAz4s', '13910819923', '2', 'qrcodes/368.png', '0');
INSERT INTO `user` VALUES ('369', '0a0ccb887dc27cf674b112b6d0828c529df3fe09', 'ovxXWv99VHYE8n5GcP8eSWITYf5I', '0', '1', '', '1');
INSERT INTO `user` VALUES ('370', '26261e7a94403425ab21702f8fd282a8a9ec163f', 'ovxXWv31kZxRPMqCx3s6-5JAh09Q', '0', '1', '', '1');
INSERT INTO `user` VALUES ('371', '032f3956abbc0d1131bfbefe57abeb95191c091c', 'ovxXWv0FsF7RYmnKr38anAdobses', '0', '1', '', '0');
INSERT INTO `user` VALUES ('372', 'd54761e3748076f77b9811f98bfa8aa7998090a8', 'ovxXWv6jSg9Duy-5Aidr_Q8soerY', '0', '1', '', '1');
INSERT INTO `user` VALUES ('373', '6430ebbc1aba17557010004b9bf8ee7f55da353b', 'ovxXWv5HX16tsopF-4D_KEZULKoo', '0', '1', '', '0');
INSERT INTO `user` VALUES ('374', 'ee09e6a1b2f5ab9430b81d826c04d755227c53e8', 'ovxXWv1OWfJdBOr6OSKyDte5YNSg', '0', '1', '', '1');
INSERT INTO `user` VALUES ('375', '04493c9d8d16e0e0d023c830d2c86360a8dbb10f', 'ovxXWv23Dfo5nPnlL0Y1QS-o8pdw', '0', '1', '', '1');
INSERT INTO `user` VALUES ('376', '661b61a6d3e2ac56f5ce42b11f3655faedccc7a5', 'ovxXWv5xe4qPcKUE4aDEeukYxavI', '13666182848', '2', '', '1');
INSERT INTO `user` VALUES ('377', 'e576355211da5baed649b24c5e049a24a9315748', 'ovxXWvwTNWDZjf5YEa0l52MIpuqQ', '0', '1', '', '1');
INSERT INTO `user` VALUES ('378', '8b38923667aab4c391fde48c30864137f85c8e31', 'ovxXWvxCgSbwwhepeh6omqRkAoNA', '0', '1', '', '1');
INSERT INTO `user` VALUES ('379', '260dadae650dc6ae2a03e7965e1dcfd602b97b42', 'ovxXWvzAAN1qyjnaZPHjtV4E7nqs', '0', '3', '', '1');
INSERT INTO `user` VALUES ('380', 'b734cf1af0270b53bdf947d57449e109dcd49ba1', 'ovxXWv6_-nvIrt7ylEZoBYwvnu4s', '0', '1', null, '1');
INSERT INTO `user` VALUES ('381', 'bfb6e8f748e4ae99512f392b4ddb5de24d199f95', 'ovxXWvwNPnI7gJbxaYWT8eqIe04w', '0', '1', null, '1');
INSERT INTO `user` VALUES ('383', 'bfd860f4513d8adc56f555241ff798cf3e2cd9a7', 'ovxXWv18jfQMroeyulsP09-rZLsg', '0', '1', null, '1');
INSERT INTO `user` VALUES ('384', 'ea3212da984a3a6814059c873456f08d3b37b6b4', 'ovxXWv7_aiWTIoJQD6s93mDcJSPw', '0', '3', null, '1');
INSERT INTO `user` VALUES ('385', '650f4857ea8ee89d942f2e6f012453ee044052a1', 'ovxXWvywZpgwlS67U7CXu8PxaVy4', '0', '1', null, '0');
INSERT INTO `user` VALUES ('386', 'b85e7e5a9bdda5447c93861c4ce7a1319c3e83a1', 'ovxXWv9ApE17MVYYow8NnPxjjS98', '0', '1', null, '1');
INSERT INTO `user` VALUES ('387', '49da1232526fd62be92a8042af95d7749f07ee36', 'ovxXWv-BSeH5A6JMpnsAB7zZ1GGg', '0', '1', null, '1');
INSERT INTO `user` VALUES ('388', '85148639d80277d6dcd727eab6183c417f44c838', 'ovxXWv5tu4cnp3kJO3elua5unIAA', '0', '1', null, '1');
INSERT INTO `user` VALUES ('389', '7a56c7b24a094611fb69ac748015d15186966772', 'ovxXWvwhSsU_m1nMpxHc-eB_6rkY', '0', '1', null, '1');
INSERT INTO `user` VALUES ('390', '04310ccbdbdcdeba28d36deb3ef2c12b82922d88', 'ovxXWv-yKQG03UrxngJu8Fkhj0No', '0', '1', null, '1');
INSERT INTO `user` VALUES ('391', 'e38c8d2d84236cf4719efa720018d14c9b8a2600', 'ovxXWv0U0DWjsj5QXGbf6WTq3mus', '0', '1', null, '1');
INSERT INTO `user` VALUES ('392', '7a5b4b756cf20107d1e35811fc010f49061194ac', 'ovxXWv3SKUDMNYXmxXzCXcBam9ls', '0', '1', null, '1');
INSERT INTO `user` VALUES ('393', '1d80b003ed848db11b21f081437de72eb1ebb4c9', 'ovxXWvxkdAoQTNRmF1Pb0Av7HCcc', '0', '1', null, '1');
INSERT INTO `user` VALUES ('394', 'aa23379a215ba22e1ffe816d0b2913b8f2a68b82', 'ovxXWv4Z6vxeaFlmUXjlsa6ir-OU', '0', '1', null, '1');
INSERT INTO `user` VALUES ('396', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'ovxXWv5Ldfh1B4nho4C-Jz6Kgma0', '18845634070', '2', 'qrcodes/396.png', '1');
INSERT INTO `user` VALUES ('397', '4e05a2341fef5e373341c667d61b37d056a5d781', 'ovxXWv0o3D627DKbDanfbJYR70mA', '0', '1', null, '1');
INSERT INTO `user` VALUES ('398', '50917e27a2c9468227f53ebb06a306a82af44072', 'ovxXWv3lhKsqx03vFb6SalRk7Ngs', '0', '1', null, '0');
INSERT INTO `user` VALUES ('399', 'd6124d50682770e1afe72a04fc47b04aec91dbfe', 'ovxXWv0qrp1BZ_fuLY8CNlBuFq24', '0', '1', null, '1');
INSERT INTO `user` VALUES ('400', '557d8054879b3f29957fdfa11e2264516197130a', 'ovxXWv1v-DnBHMcp_d74uXzF9C30', '0', '1', null, '0');
INSERT INTO `user` VALUES ('401', '6c5249833ec795b65139000c7bdb26558446c157', 'ovxXWv1djCTJnZKbfQn1-o6V4koY', '0', '1', null, '0');
INSERT INTO `user` VALUES ('402', 'a136d5b94a764ec0c8e3d631b5b9ff43b6f6de9f', 'ovxXWv5hvHcURk63SwUsX6Au0FfE', '0', '1', null, '1');
INSERT INTO `user` VALUES ('403', 'fff068fe5f28357b37a6f82e95b465bc1fa933e4', 'ovxXWv-rgvTrAbWaYtyuXpPAeo0Y', '0', '1', null, '0');
INSERT INTO `user` VALUES ('404', '176faa236c3a405ec5af46584bdd6ae046b66e9c', 'ovxXWv0aftc0nLN4k-HVu0MbFLaA', '0', '1', null, '1');
INSERT INTO `user` VALUES ('405', '28247d2049843fa714cbbcc29cb66ea9b772c006', 'ovxXWvxq_DNwIU81uocZz-iPY_Jg', '0', '1', null, '0');
INSERT INTO `user` VALUES ('406', '81fc18ecac44ec9ebaab056b236a8159f007f40f', 'ovxXWv4iyRE8_CoDmMFT_oyZ_6Kg', '18618232490', '2', null, '1');
INSERT INTO `user` VALUES ('407', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', 'ovxXWv8RtVE9YdkVYBRY5xPOS2ks', '0', '1', null, '1');
INSERT INTO `user` VALUES ('408', '9c4bd642d1a6bdb8f9ef6b10fb3a79288c0a824f', 'ovxXWv8-gbexPw2h3Mz9OF4q_Dkw', '0', '1', null, '1');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `address_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '收货人ID',
  `token` varchar(255) NOT NULL COMMENT '用户标识',
  `consignee` varchar(255) DEFAULT NULL COMMENT '收货人名称',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `district` varchar(255) DEFAULT NULL COMMENT '区/县',
  `address` varchar(255) DEFAULT NULL COMMENT '地址详情',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `main` int(11) DEFAULT '2' COMMENT '1是默认收货地址2是非默认收货地址',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES ('130', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '这', '北京', '北京', '朝阳区', '不想', '23569852586', '1');
INSERT INTO `user_address` VALUES ('131', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', '北京', '北京', '大兴区', '亦城国际', '13693276438', '2');
INSERT INTO `user_address` VALUES ('134', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '不', '北京', '北京', '海淀区', '这种', '25896325874', '2');
INSERT INTO `user_address` VALUES ('135', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', '北京', '北京', '大兴区', '荣华中路10号亦城国际', '18845637070', '1');
INSERT INTO `user_address` VALUES ('136', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '陈正義', '北京', '北京', '东城区', '小茶叶胡同', '13331183235', '1');
INSERT INTO `user_address` VALUES ('137', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '小李', '北京', '北京', '大兴区', '大兴区', '15246385599', '1');
INSERT INTO `user_address` VALUES ('138', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '陶运海', '北京', '北京', '大兴区', '荣华中路10号亦城国际A座', '18810773080', '1');
INSERT INTO `user_address` VALUES ('139', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', '北京', '北京', '昌平区', '沙河镇兆丰家园7-604', '13693276438', '1');
INSERT INTO `user_address` VALUES ('140', '9611315e62c886953daa5fb35f03bc0285307fde', '七七', '北京', '北京', '东城区', '鸿运家园1-101', '15312481278', '1');
INSERT INTO `user_address` VALUES ('141', 'c138b0add2e89c3e6dca7546594e64503b4d4b03', '测试', '北京', '北京', '东城区', '是你呐喊', '18910271624', '1');
INSERT INTO `user_address` VALUES ('142', 'e970ef250c37356236dd9338e12752d3c1673093', '爱样', '北京', '北京', '东城区', '我家里', '18101392628', '1');

-- ----------------------------
-- Table structure for user_agent
-- ----------------------------
DROP TABLE IF EXISTS `user_agent`;
CREATE TABLE `user_agent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_level` tinyint(1) unsigned NOT NULL COMMENT '1',
  `agent_name` varchar(255) NOT NULL COMMENT '代理名称',
  `service_commission_rate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '服务佣金比例',
  `product_commission_rate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品佣金比例',
  `ctime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_agent
-- ----------------------------
INSERT INTO `user_agent` VALUES ('3', '1', '我是一级', '10', '10', '0');
INSERT INTO `user_agent` VALUES ('4', '2', '我是二级', '5', '5', '0');

-- ----------------------------
-- Table structure for user_code
-- ----------------------------
DROP TABLE IF EXISTS `user_code`;
CREATE TABLE `user_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `code` varchar(11) DEFAULT NULL COMMENT '短信验证码',
  `time` varchar(255) DEFAULT NULL COMMENT '验证过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_code
-- ----------------------------
INSERT INTO `user_code` VALUES ('51', '13693276438', '762308', '1495531613');
INSERT INTO `user_code` VALUES ('52', '18845634070', '513614', '1495531691');
INSERT INTO `user_code` VALUES ('53', '18810773080', '492526', '1495537773');
INSERT INTO `user_code` VALUES ('54', '18101392628', '435336', '1495539431');
INSERT INTO `user_code` VALUES ('55', '18611978532', '674518', '1496202413');
INSERT INTO `user_code` VALUES ('56', '18845634070', '198183', '1497239142');
INSERT INTO `user_code` VALUES ('57', '18845634070', '960152', '1497403626');
INSERT INTO `user_code` VALUES ('58', '18901271624', '220916', '1497452385');
INSERT INTO `user_code` VALUES ('59', '18910271624', '342014', '1497452886');
INSERT INTO `user_code` VALUES ('60', '18845634070', '520196', '1497776644');
INSERT INTO `user_code` VALUES ('61', '18301420150', '238438', '1497958511');
INSERT INTO `user_code` VALUES ('62', '18845634070', '541275', '1498533709');
INSERT INTO `user_code` VALUES ('63', '18845634070', '847101', '1498959101');
INSERT INTO `user_code` VALUES ('64', '18845634070', '726522', '1498959170');
INSERT INTO `user_code` VALUES ('65', '18845634070', '267563', '1498959681');
INSERT INTO `user_code` VALUES ('66', '18845634070', '821805', '1498960009');
INSERT INTO `user_code` VALUES ('67', '18845634070', '5822', '1498960771');
INSERT INTO `user_code` VALUES ('68', '18845634070', '1424', '1498960970');
INSERT INTO `user_code` VALUES ('69', '18845634070', '7072', '1498961000');
INSERT INTO `user_code` VALUES ('70', '18845634070', '152840', '1498961054');
INSERT INTO `user_code` VALUES ('71', '18845634070', '964261', '1498961472');
INSERT INTO `user_code` VALUES ('72', '18845634070', '001560', '1498961593');
INSERT INTO `user_code` VALUES ('73', '18845634070', '997484', '1498961638');
INSERT INTO `user_code` VALUES ('74', '18845634070', '838897', '1498962290');
INSERT INTO `user_code` VALUES ('75', '18845634070', '769121', '1498962305');
INSERT INTO `user_code` VALUES ('76', '18845634070', '192222', '1498962336');
INSERT INTO `user_code` VALUES ('77', '18845634070', '397987', '1498962453');
INSERT INTO `user_code` VALUES ('78', '18845634070', '687073', '1498962498');
INSERT INTO `user_code` VALUES ('79', '18845634070', '631281', '1498962778');
INSERT INTO `user_code` VALUES ('80', '18845634070', '063034', '1498962923');
INSERT INTO `user_code` VALUES ('81', '18845634070', '396739', '1498962950');
INSERT INTO `user_code` VALUES ('82', '18845634070', '714363', '1498962998');
INSERT INTO `user_code` VALUES ('83', '18845634070', '332531', '1498963025');
INSERT INTO `user_code` VALUES ('84', '18845634070', '293479', '1498963070');
INSERT INTO `user_code` VALUES ('85', '18845634070', '694756', '1498963128');
INSERT INTO `user_code` VALUES ('86', '18845634070', '091890', '1498963166');
INSERT INTO `user_code` VALUES ('87', '18845634070', '729609', '1498963328');
INSERT INTO `user_code` VALUES ('88', '18845634070', '731982', '1498963345');
INSERT INTO `user_code` VALUES ('89', '18845634070', '280934', '1498963356');
INSERT INTO `user_code` VALUES ('90', '18845634070', '495570', '1498963371');
INSERT INTO `user_code` VALUES ('91', '18845634070', '117589', '1498963385');
INSERT INTO `user_code` VALUES ('92', '18845634070', '497395', '1498963397');
INSERT INTO `user_code` VALUES ('93', '18845634070', '673072', '1498963409');
INSERT INTO `user_code` VALUES ('94', '18845634070', '365201', '1498963591');
INSERT INTO `user_code` VALUES ('95', '18845634070', '722285', '1498963645');
INSERT INTO `user_code` VALUES ('96', '18845634070', '496030', '1498963672');
INSERT INTO `user_code` VALUES ('97', '18845634070', '700952', '1498963686');
INSERT INTO `user_code` VALUES ('98', '18845634070', '719159', '1498963700');
INSERT INTO `user_code` VALUES ('99', '18845634070', '038741', '1498963711');
INSERT INTO `user_code` VALUES ('100', '18845634070', '420841', '1498963730');
INSERT INTO `user_code` VALUES ('101', '18845634070', '207770', '1498964168');
INSERT INTO `user_code` VALUES ('102', '18845634070', '485415', '1498964262');
INSERT INTO `user_code` VALUES ('103', '18845634070', '872736', '1498964277');
INSERT INTO `user_code` VALUES ('104', '18845634070', '482026', '1498964290');
INSERT INTO `user_code` VALUES ('105', '18845634070', '500008', '1498964310');
INSERT INTO `user_code` VALUES ('106', '18845634070', '776943', '1498964324');
INSERT INTO `user_code` VALUES ('107', '18845634070', '315287', '1498964342');
INSERT INTO `user_code` VALUES ('108', '18845634070', '777594', '1498964358');
INSERT INTO `user_code` VALUES ('109', '18845634070', '173911', '1498964373');
INSERT INTO `user_code` VALUES ('110', '18845634070', '207023', '1498964653');
INSERT INTO `user_code` VALUES ('111', '18845634070', '656563', '1498964685');
INSERT INTO `user_code` VALUES ('112', '18845634070', '499436', '1498964749');
INSERT INTO `user_code` VALUES ('113', '18845634070', '714852', '1498964773');
INSERT INTO `user_code` VALUES ('114', '18845634070', '404943', '1498965094');
INSERT INTO `user_code` VALUES ('115', '18845634070', '003423', '1498965112');
INSERT INTO `user_code` VALUES ('116', '18845634070', '339809', '1498965128');
INSERT INTO `user_code` VALUES ('117', '18845634070', '837747', '1498966044');
INSERT INTO `user_code` VALUES ('118', '18845634070', '890437', '1498966073');
INSERT INTO `user_code` VALUES ('119', '18845634070', '848971', '1498966090');
INSERT INTO `user_code` VALUES ('120', '18845634070', '088251', '1498966105');
INSERT INTO `user_code` VALUES ('121', '18845634070', '860410', '1498966121');
INSERT INTO `user_code` VALUES ('122', '18845634070', '610923', '1498966232');
INSERT INTO `user_code` VALUES ('123', '18845634070', '057639', '1498966281');
INSERT INTO `user_code` VALUES ('124', '18845634070', '789200', '1498966420');
INSERT INTO `user_code` VALUES ('125', '18845634070', '762058', '1498966988');
INSERT INTO `user_code` VALUES ('126', '18845634070', '561823', '1498967030');
INSERT INTO `user_code` VALUES ('127', '18845634070', '732173', '1498968453');
INSERT INTO `user_code` VALUES ('128', '18845634070', '797607', '1498968515');
INSERT INTO `user_code` VALUES ('129', '18845634070', '229158', '1498969156');
INSERT INTO `user_code` VALUES ('130', '18845634070', '957798', '1498969184');
INSERT INTO `user_code` VALUES ('131', '18845634070', '440228', '1498975215');
INSERT INTO `user_code` VALUES ('132', '18845634070', '550218', '1498975650');
INSERT INTO `user_code` VALUES ('133', '18845634070', '390728', '1498975798');
INSERT INTO `user_code` VALUES ('134', '18845634070', '848952', '1498975872');
INSERT INTO `user_code` VALUES ('135', '18845634070', '018556', '1498976202');
INSERT INTO `user_code` VALUES ('136', '18845634070', '675714', '1498976360');
INSERT INTO `user_code` VALUES ('137', '18845634070', '717982', '1498976777');
INSERT INTO `user_code` VALUES ('138', '18845634070', '831623', '1498976867');
INSERT INTO `user_code` VALUES ('139', '18845634070', '569408', '1498977018');
INSERT INTO `user_code` VALUES ('140', '13666182848', '789052', '1499137128');
INSERT INTO `user_code` VALUES ('141', '13910819923', '571127', '1499148110');
INSERT INTO `user_code` VALUES ('142', '18845634070', '350629', '1499219706');
INSERT INTO `user_code` VALUES ('143', '18845634070', '148959', '1499413587');
INSERT INTO `user_code` VALUES ('144', '18610883112', '684615', '1499415764');
INSERT INTO `user_code` VALUES ('145', '18618232490', '206959', '1499415986');

-- ----------------------------
-- Table structure for user_commission
-- ----------------------------
DROP TABLE IF EXISTS `user_commission`;
CREATE TABLE `user_commission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `spokesman_token` varchar(255) DEFAULT NULL COMMENT '代言人token',
  `from_token` varchar(255) DEFAULT NULL COMMENT '来源用户token',
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '类型：100=>服务,200=>商品',
  `source_id` varchar(255) DEFAULT NULL COMMENT '源id (type=100为服务id,type=200=>为商品id)',
  `source_name` varchar(255) DEFAULT NULL,
  `money` int(11) DEFAULT NULL COMMENT '佣金金额',
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_commission
-- ----------------------------
INSERT INTO `user_commission` VALUES ('26', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201705251344134288', '李淑君-孕前期服务', '10', '1498211825');
INSERT INTO `user_commission` VALUES ('27', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201705251344134288', '李淑君-孕前期服务', '10', '1498279493');
INSERT INTO `user_commission` VALUES ('28', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201705251344134288', '李淑君-孕前期服务', '10', '1498358191');
INSERT INTO `user_commission` VALUES ('29', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'Ask201706271122823', '李淑君咨询服务', '10', '1498533790');
INSERT INTO `user_commission` VALUES ('30', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '100', 'Ask201706271409981', '爱样咨询服务', '50', '1498543750');
INSERT INTO `user_commission` VALUES ('31', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '100', 'Ask201706271409981', '爱样咨询服务', '100', '1498543750');
INSERT INTO `user_commission` VALUES ('34', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '200', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '怀姜糖膏(艾佳人)', '10', '1498559067');
INSERT INTO `user_commission` VALUES ('35', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'e970ef250c37356236dd9338e12752d3c1673093', '100', 'P201705232145244762', '陈正義-线下约见服务', '50', '1498559813');
INSERT INTO `user_commission` VALUES ('36', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'e970ef250c37356236dd9338e12752d3c1673093', '100', 'P201705232145244762', '陈正義-线下约见服务', '100', '1498559813');
INSERT INTO `user_commission` VALUES ('37', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201706261916553078', '李淑君-免费服务', '0', '1498560339');
INSERT INTO `user_commission` VALUES ('38', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201706261916553078', '李淑君-免费服务', '0', '1498650240');
INSERT INTO `user_commission` VALUES ('39', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'Ask201706291454240', '葛璐 - 咨询服务', '0', '1498719263');
INSERT INTO `user_commission` VALUES ('40', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201706261916553078', '李淑君-免费服务', '0', '1498730679');
INSERT INTO `user_commission` VALUES ('41', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'Ask201706301054587', '葛璐 - 咨询服务', '0', '1498791269');
INSERT INTO `user_commission` VALUES ('42', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'Ask201706301055648', '葛璐 - 咨询服务', '0', '1498791320');
INSERT INTO `user_commission` VALUES ('43', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'Ask201706301055649', '葛璐 - 咨询服务', '0', '1498791367');
INSERT INTO `user_commission` VALUES ('44', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498977226');
INSERT INTO `user_commission` VALUES ('45', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498978031');
INSERT INTO `user_commission` VALUES ('46', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498979052');
INSERT INTO `user_commission` VALUES ('47', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498983140');
INSERT INTO `user_commission` VALUES ('48', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498983579');
INSERT INTO `user_commission` VALUES ('49', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498983710');
INSERT INTO `user_commission` VALUES ('50', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498984148');
INSERT INTO `user_commission` VALUES ('51', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498984255');
INSERT INTO `user_commission` VALUES ('52', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', 'Ask201707021643530', '李淑君 - 咨询服务', '10', '1498985016');
INSERT INTO `user_commission` VALUES ('53', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '200', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '怀姜糖膏(艾佳人)', '10', '1498985416');
INSERT INTO `user_commission` VALUES ('54', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '200', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '怀姜糖膏(艾佳人)', '10', '1498985725');
INSERT INTO `user_commission` VALUES ('55', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '200', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '怀姜糖膏(艾佳人)', '10', '1498985799');
INSERT INTO `user_commission` VALUES ('56', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '200', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '怀姜糖膏(艾佳人)', '10', '1498986567');
INSERT INTO `user_commission` VALUES ('57', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '200', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '怀姜糖膏(艾佳人)', '10', '1498986636');
INSERT INTO `user_commission` VALUES ('58', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '200', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '怀姜糖膏(艾佳人)', '10', '1498986834');
INSERT INTO `user_commission` VALUES ('59', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '100', 'P201707020930568162', '李淑君-免费服务', '5', '1498996848');
INSERT INTO `user_commission` VALUES ('60', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498996848');
INSERT INTO `user_commission` VALUES ('61', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'e970ef250c37356236dd9338e12752d3c1673093', '100', 'P201707020930568162', '李淑君-免费服务', '5', '1498996964');
INSERT INTO `user_commission` VALUES ('62', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'e970ef250c37356236dd9338e12752d3c1673093', '100', 'P201707020930568162', '李淑君-免费服务', '10', '1498996965');
INSERT INTO `user_commission` VALUES ('63', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '100', 'P201706301026242507', '爱样-免费体验服务', '25', '1499415814');
INSERT INTO `user_commission` VALUES ('64', 'e970ef250c37356236dd9338e12752d3c1673093', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '100', 'P201706301026242507', '爱样-免费体验服务', '50', '1499415814');
INSERT INTO `user_commission` VALUES ('65', 'e970ef250c37356236dd9338e12752d3c1673093', '81fc18ecac44ec9ebaab056b236a8159f007f40f', '100', 'P201706301026242507', '爱样-免费体验服务', '25', '1499416030');
INSERT INTO `user_commission` VALUES ('66', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '81fc18ecac44ec9ebaab056b236a8159f007f40f', '100', 'P201706301026242507', '爱样-免费体验服务', '50', '1499416030');

-- ----------------------------
-- Table structure for user_commission_the
-- ----------------------------
DROP TABLE IF EXISTS `user_commission_the`;
CREATE TABLE `user_commission_the` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '总收益',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `price` int(11) DEFAULT '0' COMMENT '总累计奖金',
  `yprice` int(11) DEFAULT '0' COMMENT '已提现奖金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_commission_the
-- ----------------------------
INSERT INTO `user_commission_the` VALUES ('22', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '165', '100');
INSERT INTO `user_commission_the` VALUES ('23', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '15', '0');
INSERT INTO `user_commission_the` VALUES ('24', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '160', '0');
INSERT INTO `user_commission_the` VALUES ('25', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '35', '0');
INSERT INTO `user_commission_the` VALUES ('26', 'e970ef250c37356236dd9338e12752d3c1673093', '75', '0');
INSERT INTO `user_commission_the` VALUES ('27', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '50', '0');

-- ----------------------------
-- Table structure for user_earnings_at
-- ----------------------------
DROP TABLE IF EXISTS `user_earnings_at`;
CREATE TABLE `user_earnings_at` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '每次记录',
  `toname` varchar(255) DEFAULT NULL COMMENT '收益来自哪个用户昵称（每次）',
  `totoken` varchar(255) DEFAULT NULL COMMENT '收益来自哪个用户（每次）',
  `name` varchar(255) DEFAULT NULL COMMENT '收益用户昵称（每次）',
  `token` varchar(255) DEFAULT NULL COMMENT '收益用户（每次）',
  `price` int(11) DEFAULT NULL COMMENT '每次收益金额',
  `ctime` varchar(255) DEFAULT NULL COMMENT '每次收益时间',
  `type` int(11) DEFAULT NULL COMMENT '状态1=提问;2=回答;3=偷听;',
  `operation` varchar(255) DEFAULT NULL COMMENT '状态1=加钱 ： 2=减钱 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_earnings_at
-- ----------------------------
INSERT INTO `user_earnings_at` VALUES ('87', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1495543517', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('88', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495543517', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('92', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '100', '1495545823', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('93', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1495545889', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('94', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495545889', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('95', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1495546137', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('96', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495546137', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('97', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '100', '1495546731', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('98', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1495547022', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('99', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495547022', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('100', null, null, '张露', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1495547612', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('101', null, null, '张露', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1495547761', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('102', null, null, '张露', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1495547902', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('103', null, null, '爱样', 'e970ef250c37356236dd9338e12752d3c1673093', '50', '1495547902', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('104', null, null, '爱样', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '100', '1495624114', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('105', null, null, '爱样', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '50', '1495624298', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('106', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495624298', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('107', null, null, '爱样', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '2900', '1495624466', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('108', null, null, '爱样', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '1450', '1495624907', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('109', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '1450', '1495624907', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('110', null, null, '爱样', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '1450', '1495705160', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('111', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '1450', '1495705160', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('112', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '990', '1495777352', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('113', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '495', '1495777856', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('114', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '495', '1495777856', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('115', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1495778236', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('116', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495778236', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('117', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1495781810', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('118', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1495782205', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('119', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495782205', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('120', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '1100', '1495782516', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('121', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '55', '1495783025', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('122', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '55', '1495783025', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('123', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '55', '1495784208', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('124', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '55', '1495784208', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('125', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '55', '1495784443', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('126', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '55', '1495784443', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('127', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1495788946', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('128', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495788946', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('129', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '55', '1495789487', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('130', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '55', '1495789487', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('131', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1495793592', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('132', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '50', '1495793626', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('133', null, null, '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50', '1495793626', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('134', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1495794420', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('135', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1495794479', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('136', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1495794678', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('137', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '50', '1495794843', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('138', null, null, '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50', '1495794843', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('139', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1495795730', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('140', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '50', '1495795777', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('141', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495795777', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('143', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1495856273', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('144', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1495856336', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('145', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495856336', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('146', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '1100', '1495856531', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('147', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '55', '1495856624', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('148', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '55', '1495856624', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('149', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1495864857', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('150', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1495869936', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('151', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '100', '1495870649', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('152', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '1', '1495870666', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('153', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '100', '1495870775', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('154', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1495870928', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('155', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1495871681', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('156', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1495872674', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('157', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '50', '1495947568', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('158', null, null, '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50', '1495947568', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('159', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1495979241', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('160', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495979241', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('161', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '55', '1496017311', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('162', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '55', '1496017311', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('163', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1496132610', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('164', null, null, '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', '1496132610', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('165', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1496279439', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('166', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496279439', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('167', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1496368154', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('168', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496368154', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('169', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '50', '1496545429', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('170', null, null, '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50', '1496545429', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('171', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1496661664', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('172', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496661664', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('173', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1496701215', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('174', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496701215', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('175', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1496827131', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('176', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1496972939', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('177', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496972939', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('178', null, null, '爱样', 'e970ef250c37356236dd9338e12752d3c1673093', '100', '1498017365', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('179', null, null, '爱样', 'e970ef250c37356236dd9338e12752d3c1673093', '100', '1498017624', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('180', null, null, '爱样', 'e970ef250c37356236dd9338e12752d3c1673093', '100', '1498548414', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('181', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1498548437', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('182', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1498548493', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('183', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1498548991', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('184', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1498549604', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('185', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1498551098', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('186', null, null, '爱样', 'e970ef250c37356236dd9338e12752d3c1673093', '1000', '1498555249', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('187', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1498558807', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('188', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1498559159', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('189', null, null, '爱样', 'e970ef250c37356236dd9338e12752d3c1673093', '100', '1498562068', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('190', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1498650561', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('191', null, null, '于洋', '865edad126130b2a107ebf749518b48283062a02', '100', '1498718303', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('192', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498722941', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('193', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498724072', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('194', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1498728571', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('195', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1498730239', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('196', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498787690', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('197', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498832383', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('198', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498832507', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('199', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498834100', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('200', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1498879345', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('201', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1498879454', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('202', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498879493', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('203', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498881771', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('204', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498882079', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('205', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498919080', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('206', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '1', '1498985566', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('207', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '1', '1498985583', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('208', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498988780', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('209', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498988936', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('210', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498989065', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('211', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1498989904', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('212', null, null, '陈正義', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1498991474', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('213', null, null, '李丰瀚', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1498991474', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('214', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1498997405', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('215', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1498999329', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('216', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499002058', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('217', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499003079', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('218', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499003221', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('219', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499003901', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('220', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1499005265', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('221', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499005866', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('222', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499005952', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('223', null, null, '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499006136', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('224', null, null, '叶凤娟', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', '100', '1499137329', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('225', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1499141036', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('226', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '杨松会', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', '100', '1499143084', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('227', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '杨松会', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', '100', '1499143353', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('228', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '爱样', 'e970ef250c37356236dd9338e12752d3c1673093', '100', '1499146393', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('229', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1499148604', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('230', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1499151050', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('231', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1499159298', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('232', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499173205', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('233', '爱样@阿海', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '杨松会', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', '50', '1499197332', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('234', '爱样@阿海', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '周长江哥', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50', '1499197332', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('235', '爱样@阿海', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '叶凤娟', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', '50', '1499197862', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('236', '爱样@阿海', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '沥', '661b61a6d3e2ac56f5ce42b11f3655faedccc7a5', '50', '1499197862', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('237', null, null, '李淑君', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1499237794', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('238', null, null, '张璐', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1499237886', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('239', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499240621', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('240', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499242228', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('241', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499263568', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('242', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499264704', '1', '1');
INSERT INTO `user_earnings_at` VALUES ('243', '周长江', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '葛璐', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499397046', '1', '1');

-- ----------------------------
-- Table structure for user_earnings_bay
-- ----------------------------
DROP TABLE IF EXISTS `user_earnings_bay`;
CREATE TABLE `user_earnings_bay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '每天交易记录',
  `token` varchar(255) DEFAULT NULL COMMENT '收益的用户(每天)',
  `price` int(11) DEFAULT NULL COMMENT '收益金额(每天)',
  `ctime` varchar(255) DEFAULT NULL COMMENT '收益时间(每天)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_earnings_bay
-- ----------------------------
INSERT INTO `user_earnings_bay` VALUES ('26', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '400', '1495547022');
INSERT INTO `user_earnings_bay` VALUES ('27', '9b4858060a5997e2369bbd16b34788c069e90d1d', '200', '1495547022');
INSERT INTO `user_earnings_bay` VALUES ('29', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '250', '1495547902');
INSERT INTO `user_earnings_bay` VALUES ('30', 'e970ef250c37356236dd9338e12752d3c1673093', '50', '1495547902');
INSERT INTO `user_earnings_bay` VALUES ('31', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '4500', '1495624907');
INSERT INTO `user_earnings_bay` VALUES ('32', '9b4858060a5997e2369bbd16b34788c069e90d1d', '1500', '1495624907');
INSERT INTO `user_earnings_bay` VALUES ('33', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '1450', '1495705160');
INSERT INTO `user_earnings_bay` VALUES ('34', '9b4858060a5997e2369bbd16b34788c069e90d1d', '1450', '1495705160');
INSERT INTO `user_earnings_bay` VALUES ('35', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '3055', '1495789487');
INSERT INTO `user_earnings_bay` VALUES ('36', '9b4858060a5997e2369bbd16b34788c069e90d1d', '915', '1495795777');
INSERT INTO `user_earnings_bay` VALUES ('37', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '650', '1495795777');
INSERT INTO `user_earnings_bay` VALUES ('38', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', '1495794843');
INSERT INTO `user_earnings_bay` VALUES ('40', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '1605', '1495872674');
INSERT INTO `user_earnings_bay` VALUES ('41', '9b4858060a5997e2369bbd16b34788c069e90d1d', '105', '1495856624');
INSERT INTO `user_earnings_bay` VALUES ('42', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '201', '1495870928');
INSERT INTO `user_earnings_bay` VALUES ('43', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '200', '1495870775');
INSERT INTO `user_earnings_bay` VALUES ('44', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '50', '1495947568');
INSERT INTO `user_earnings_bay` VALUES ('45', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50', '1495947568');
INSERT INTO `user_earnings_bay` VALUES ('46', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1495979241');
INSERT INTO `user_earnings_bay` VALUES ('47', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1495979241');
INSERT INTO `user_earnings_bay` VALUES ('48', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '55', '1496017311');
INSERT INTO `user_earnings_bay` VALUES ('49', '9b4858060a5997e2369bbd16b34788c069e90d1d', '55', '1496017311');
INSERT INTO `user_earnings_bay` VALUES ('50', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1496132610');
INSERT INTO `user_earnings_bay` VALUES ('51', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', '1496132610');
INSERT INTO `user_earnings_bay` VALUES ('52', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1496279439');
INSERT INTO `user_earnings_bay` VALUES ('53', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496279439');
INSERT INTO `user_earnings_bay` VALUES ('54', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1496368154');
INSERT INTO `user_earnings_bay` VALUES ('55', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496368154');
INSERT INTO `user_earnings_bay` VALUES ('56', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '50', '1496545429');
INSERT INTO `user_earnings_bay` VALUES ('57', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50', '1496545429');
INSERT INTO `user_earnings_bay` VALUES ('58', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1496661664');
INSERT INTO `user_earnings_bay` VALUES ('59', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496661664');
INSERT INTO `user_earnings_bay` VALUES ('60', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '50', '1496701215');
INSERT INTO `user_earnings_bay` VALUES ('61', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496701215');
INSERT INTO `user_earnings_bay` VALUES ('62', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1496827131');
INSERT INTO `user_earnings_bay` VALUES ('63', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1496972939');
INSERT INTO `user_earnings_bay` VALUES ('64', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1496972939');
INSERT INTO `user_earnings_bay` VALUES ('65', 'e970ef250c37356236dd9338e12752d3c1673093', '200', '1498017624');
INSERT INTO `user_earnings_bay` VALUES ('66', 'e970ef250c37356236dd9338e12752d3c1673093', '1200', '1498562068');
INSERT INTO `user_earnings_bay` VALUES ('67', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '400', '1498549604');
INSERT INTO `user_earnings_bay` VALUES ('68', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '300', '1498559159');
INSERT INTO `user_earnings_bay` VALUES ('69', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1498650561');
INSERT INTO `user_earnings_bay` VALUES ('70', '865edad126130b2a107ebf749518b48283062a02', '100', '1498718303');
INSERT INTO `user_earnings_bay` VALUES ('71', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '2', '1498724072');
INSERT INTO `user_earnings_bay` VALUES ('72', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '200', '1498730239');
INSERT INTO `user_earnings_bay` VALUES ('73', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '4', '1498834100');
INSERT INTO `user_earnings_bay` VALUES ('74', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '200', '1498879454');
INSERT INTO `user_earnings_bay` VALUES ('75', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '4', '1498919080');
INSERT INTO `user_earnings_bay` VALUES ('76', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '202', '1499005265');
INSERT INTO `user_earnings_bay` VALUES ('77', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '903', '1499006136');
INSERT INTO `user_earnings_bay` VALUES ('78', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '50', '1498991474');
INSERT INTO `user_earnings_bay` VALUES ('79', '9b4858060a5997e2369bbd16b34788c069e90d1d', '50', '1498991474');
INSERT INTO `user_earnings_bay` VALUES ('80', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', '100', '1499137329');
INSERT INTO `user_earnings_bay` VALUES ('81', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '400', '1499159298');
INSERT INTO `user_earnings_bay` VALUES ('82', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', '200', '1499143353');
INSERT INTO `user_earnings_bay` VALUES ('83', 'e970ef250c37356236dd9338e12752d3c1673093', '100', '1499146393');
INSERT INTO `user_earnings_bay` VALUES ('84', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499173205');
INSERT INTO `user_earnings_bay` VALUES ('85', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', '50', '1499197332');
INSERT INTO `user_earnings_bay` VALUES ('86', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50', '1499197332');
INSERT INTO `user_earnings_bay` VALUES ('87', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', '50', '1499197862');
INSERT INTO `user_earnings_bay` VALUES ('88', '661b61a6d3e2ac56f5ce42b11f3655faedccc7a5', '50', '1499197862');
INSERT INTO `user_earnings_bay` VALUES ('89', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '1499237794');
INSERT INTO `user_earnings_bay` VALUES ('90', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '100', '1499237886');
INSERT INTO `user_earnings_bay` VALUES ('91', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '400', '1499264704');
INSERT INTO `user_earnings_bay` VALUES ('92', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '100', '1499397046');

-- ----------------------------
-- Table structure for user_earnings_the
-- ----------------------------
DROP TABLE IF EXISTS `user_earnings_the`;
CREATE TABLE `user_earnings_the` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '总收益',
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `price` int(11) DEFAULT NULL COMMENT '总收益金额',
  `yprice` int(11) DEFAULT '0' COMMENT '已提现金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_earnings_the
-- ----------------------------
INSERT INTO `user_earnings_the` VALUES ('12', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '850', '0');
INSERT INTO `user_earnings_the` VALUES ('13', '9b4858060a5997e2369bbd16b34788c069e90d1d', '4575', '0');
INSERT INTO `user_earnings_the` VALUES ('15', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', '2365', '0');
INSERT INTO `user_earnings_the` VALUES ('16', 'e970ef250c37356236dd9338e12752d3c1673093', '1550', '0');
INSERT INTO `user_earnings_the` VALUES ('17', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '5950', '2100');
INSERT INTO `user_earnings_the` VALUES ('18', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '2554', '400');
INSERT INTO `user_earnings_the` VALUES ('19', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '3450', '1100');
INSERT INTO `user_earnings_the` VALUES ('20', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '400', '0');
INSERT INTO `user_earnings_the` VALUES ('21', '865edad126130b2a107ebf749518b48283062a02', '100', '0');
INSERT INTO `user_earnings_the` VALUES ('22', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', '150', '0');
INSERT INTO `user_earnings_the` VALUES ('23', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', '250', '0');
INSERT INTO `user_earnings_the` VALUES ('24', '661b61a6d3e2ac56f5ce42b11f3655faedccc7a5', '50', '0');

-- ----------------------------
-- Table structure for user_follow_diet
-- ----------------------------
DROP TABLE IF EXISTS `user_follow_diet`;
CREATE TABLE `user_follow_diet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL COMMENT '用户标识',
  `dietitian` varchar(255) NOT NULL COMMENT '营养师标识',
  `ctime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_follow_diet
-- ----------------------------
INSERT INTO `user_follow_diet` VALUES ('2', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'be82784239014d1ab2a965567b7ecdc23fa3e2ec', '1496988117');
INSERT INTO `user_follow_diet` VALUES ('5', '9b4858060a5997e2369bbd16b34788c069e90d1d', '7f2b33c54a1cf1805d0f2e449332add59d863e46', '1496996894');
INSERT INTO `user_follow_diet` VALUES ('7', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'b5a5cf99068a9af159496c3ae56dd73c8e90e573', '1497000208');

-- ----------------------------
-- Table structure for user_follow_goods
-- ----------------------------
DROP TABLE IF EXISTS `user_follow_goods`;
CREATE TABLE `user_follow_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL COMMENT '用户标识',
  `dtoken` varchar(255) NOT NULL COMMENT '商品标识',
  `ctime` varchar(255) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_follow_goods
-- ----------------------------
INSERT INTO `user_follow_goods` VALUES ('7', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '1496979054');
INSERT INTO `user_follow_goods` VALUES ('8', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '1496979080');
INSERT INTO `user_follow_goods` VALUES ('9', '9b4858060a5997e2369bbd16b34788c069e90d1d', 'ac603e9f5f7cbc436417770b5944560258bab101', '1496979090');
INSERT INTO `user_follow_goods` VALUES ('10', '9b4858060a5997e2369bbd16b34788c069e90d1d', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '1496979103');
INSERT INTO `user_follow_goods` VALUES ('12', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '1497330645');
INSERT INTO `user_follow_goods` VALUES ('13', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '1497330658');
INSERT INTO `user_follow_goods` VALUES ('14', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'ac603e9f5f7cbc436417770b5944560258bab101', '1497330660');
INSERT INTO `user_follow_goods` VALUES ('15', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '1497330668');
INSERT INTO `user_follow_goods` VALUES ('16', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'c6d4d3ba7204cdd33963afcf32e9bd35951da8d7', '1497330678');
INSERT INTO `user_follow_goods` VALUES ('17', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '1497330750');
INSERT INTO `user_follow_goods` VALUES ('18', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '1497330770');
INSERT INTO `user_follow_goods` VALUES ('19', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '23384665a47d9f8c2c37272c53c16abd11f60c4a', '1497330855');
INSERT INTO `user_follow_goods` VALUES ('20', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '79cbbf7f470f976a7f8fb4b8d2afe246f2b16392', '1497330887');
INSERT INTO `user_follow_goods` VALUES ('21', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'a4272fd42bb9732d5c469ae7077aeab57bd61731', '1497330953');
INSERT INTO `user_follow_goods` VALUES ('22', '07da4cf5298d41d0bf6ef951846b5c80806248f5', 'ac603e9f5f7cbc436417770b5944560258bab101', '1497331043');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `user_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户昵称',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户图片',
  `ctime` varchar(255) DEFAULT NULL COMMENT '用户余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('82', '9b4858060a5997e2369bbd16b34788c069e90d1d', '李丰瀚', 'http://api.shoumeikeji.cn/picture/14958749676742.jpg', '1495528660');
INSERT INTO `user_info` VALUES ('83', 'fc8b58ed9a5f6321fa0503f5b8968b95c2770f1f', 'Dopamine', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5TNASmtALL1Sqrfhlib8mRibXiaPjHx2PopWiakwGr1BeBkHnk6C4Sz7RwvSoqhdiaR3Yr3iapuiaVZdRJib/0', '1495528997');
INSERT INTO `user_info` VALUES ('84', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '李淑君[太阳]', 'http://wx.qlogo.cn/mmopen/ztQ4mk7PLy85Pw8z9e1EicD8yexzoSE7W9mSnib1AghL6u0vmMvc5GhhJPM2OJlYvIPy0pqt1UshHPicO33iaCkMjx7bEHLcWMQ6/0', '1495529171');
INSERT INTO `user_info` VALUES ('86', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '爱样@阿海', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXhr2abibibZ5Uo5FJ27celFqe9ciaiaT2UZXibFP2a4aV9M9FN0dn5nBsOEDLyb5qnCaj6K6wfIVwQeUZ/0', '1495530201');
INSERT INTO `user_info` VALUES ('87', '3f10cc9fe0fa9d7142a5a605c872d04d15ca610c', 'Alone', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXmh8Azib6U3IfwMq909SZj0kNzHljamT6bVhia7uftIA4giac6LH98GST4Hw7EA01725eB6RszgRnTK/0', '1495532238');
INSERT INTO `user_info` VALUES ('88', '000271ebdf6bb0e448c99ee02c64b28c384de00e', 'Beijing', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oYO8tTuMY04wKUichmEEricPjH5ZlSs0ibYegMsRwGkX9eImibWDbfeibjaMH8RTxsdlSOjGgJSjV0ZPHghwBGybYSyQ/0', '1495532631');
INSERT INTO `user_info` VALUES ('89', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '壹+1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIq4qkq3h7AjjYEXhMPcKps7byuJlvHOYwM2GQArg1xzRPE0kgCEgPHAtkicLjD2RQLDaH7FfTv2VQ/0', '1495536334');
INSERT INTO `user_info` VALUES ('90', 'e970ef250c37356236dd9338e12752d3c1673093', '小爱', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUv4ZAaydmQDybfQj2oUV0lTx0ibP0nBvlXYjtXicS0ibBHnoboAHaSzqB4JWm9U8Yw0XzcTd01VO1ViblVSlO6bhrX/0', '1495539371');
INSERT INTO `user_info` VALUES ('91', 'b92aaf87773e61645e16b0a5fe3a4de8753c0df1', '小时代啊星', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg41oaBgRpQQI7jmcIdw6OicurqGg9enWiankNLibfNGpp8bBOtYqb2SHxEibxQecUyewOHy4P5epibBR4/0', '1495541905');
INSERT INTO `user_info` VALUES ('92', '10d1b7470d2a688e8388e6bf8c16b13e1bf9a05e', 'li娜', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg8ZeqOoIV4zg0QJn9MtY621qmVjAkS71VbU8uC3IibumWKUsicW69O4QELJkYibiby0Yq4ayHqXkEu3I/0', '1495547037');
INSERT INTO `user_info` VALUES ('93', '68e71635073f005cdc94d19833a404b7a9671d8f', '玛丽苏', 'http://api.shoumeikeji.cn/picture/14956300511650.jpg', '1495553450');
INSERT INTO `user_info` VALUES ('94', '71ee35bd9adddc1ef098fedee052c11cd88809d8', 'LALA', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUUm4l81cYKK7k2vowPhCKF55zYGY6ZotQ9v647o21KFkEdAgRNU2yDJWswFgdEVX2ZuNg0tdyHiaUhMgibB79Z15/0', '1495556183');
INSERT INTO `user_info` VALUES ('95', 'c59b3164d75cd5dc24afc5592864eaca5c0ea36d', '静思', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFeGCAWqP1RxcEGbyepqGhd5ErlN3kZRTH0gZtjmW38QFiakNetoicw0a7ajeHzKicbFAeWhRkibFCCsbw/0', '1495583904');
INSERT INTO `user_info` VALUES ('96', 'fa9e4853197d568d087831c705cb544866757463', '幸福', 'http://wx.qlogo.cn/mmopen/JVDECnNjedGxjcPPLAgCiaxJibdBtw9V6pywXsicMDicGIhKhic3gf3VGibemxfJ5oicnOlUXFZlB958p1cNkYhKqfwjQ/0', '1495591088');
INSERT INTO `user_info` VALUES ('97', '333a66e8788a39b3a834cb7c827ff93d9dafc809', '覃毓蝶菲', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6xNQib6zywyLK8UTrtl1g0xaq24L7xXWlJPwhD087SGYYj6Qda2ics86H8hsoRp7HBf5a0T3Eod1Io/0', '1495591204');
INSERT INTO `user_info` VALUES ('98', '47090a3074bd3d299b631e61f20a29915fa14e8e', '孙思思营养师', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXggCTdh5WicIpU5doke8H3wkO4wkABbUeZA6icXmhvGElTuoHJK77Vb32F2YicP6ibd7KDqVvcDPrYEI/0', '1495591269');
INSERT INTO `user_info` VALUES ('99', 'b62c2fc89452671842779318431005974fb9ca23', '~政*', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5UlJ1m1pOPRIDInh8zjxgvx48rc0Hhl7BsXZPTfaIofz4NUPS1Za56OPcCUINURaicicC2ygAGUyvib/0', '1495591684');
INSERT INTO `user_info` VALUES ('100', '07bb307bd2dba7418f876b3a645ae7bf127d644f', '赵某某', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5f3xFXgdYY7yTgMfFvh6KgG4Oq9P3lHVWl4zIdHaES6FibTRMicXeLfBfWaFPUhJSKT7zGlDUuhd1p/0', '1495592127');
INSERT INTO `user_info` VALUES ('101', 'bea2db5771ee819bec702dc23468300136258eda', '鲁玉', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6ibfCB0gsgTV8rfLMcbicBQRE90cEI6ZEas2ymIrXFGiaF2mK284qsCOQHQFrpD7c6tRtvEAPIofXRia/0', '1495592570');
INSERT INTO `user_info` VALUES ('102', '1da12901f1e76e30515e29d6b2c38060d13f2041', '周学辉营养师', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5d1X1tMkKXybGv2qMcVgjGTz8SaNCTTwG7FAibxGQIRdictnTBgRovHCyHLbKWEAMAUYSSiaQVFWnTX/0', '1495593349');
INSERT INTO `user_info` VALUES ('103', '96efc7cf60dd82815bc360a2e7e0b9acf85451ec', '琴姐姐', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFcCDXbQ8VVWn8kHrR5vGib6Amw4XcfAQfsF2H8x1tDTWPC9azFg7PY31SialNpr8KQaicsUX3DciaUHbdg5A5zRHO9C/0', '1495593752');
INSERT INTO `user_info` VALUES ('104', 'f66eaba440e026d4557717845735fcd57b9484d9', '清雅', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5dEUJQa2yZYv6oPVhVsQKRAYKJcMmeCTXOkPNrUCURtugeWlhibdZt2lzEyh7tMjxpQibPmaib9Dpicq/0', '1495594132');
INSERT INTO `user_info` VALUES ('105', '64dabdc86ec8637e0c8b5b476181adf3f996f2b2', '小薛营养师', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5R6nDmFr7hKOoMM0iawH8qiafNZAVGb2fgJOVyKexpfL5yOGr3rSCPUqY85CGEarghggInukW1zuAO/0', '1495594583');
INSERT INTO `user_info` VALUES ('106', 'fdf0e44bef2d29932055bfdedb04380857690dfd', '钟小米', 'http://wx.qlogo.cn/mmopen/niczNtunYyibhRIfroGQdQn4VOh1PHwPHuhpo6KSJHeKfSvg9wiahFNckWa0HicN99wympAOiceOvnWMXekdlfA3YBicRu5zoW2fpic/0', '1495594862');
INSERT INTO `user_info` VALUES ('107', '74b7ec88df72de233a9e7af42aa7955658ab29cb', '别说€·%*&^¥-@！', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLANS7C0E87opbdWjFLFAaVomUYibYFRDXsENspn2Kic53pZKFsjdPHyW9mVFibII9nhWc1yuWYVgX6Jg/0', '1495595122');
INSERT INTO `user_info` VALUES ('108', '9382a430cfa82838a28ab1937c21a3e1202a41b5', '张艳', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5VfzVQibo3vnP6axvQowcGWlaiaTvxg4AB4Jck6lLkJkAUPPu3XGiaiazeUlAlzice3oegG4iak00zXH0b/0', '1495599636');
INSERT INTO `user_info` VALUES ('109', 'c049d629e80ab2a682b0153a56b7ea11a29c828b', 'Chery', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUicbFhfgejo8ibMU92aBONMyIbXH1luKmCuPUzQvLkFG9rb5Sh75A4Dc6LO0PN7DyA8m2Ee8F3ZPyR19Uqiatoygv/0', '1495601238');
INSERT INTO `user_info` VALUES ('110', 'a5c38ee90159f047c9aa45cd4453d8e5effca76f', '邱欣晔', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5eAibga3EFmyXewL8dtHrFNCQHCW3M8iamcBQJGuWVzaSsBMXCUUJyCSlvFAYNG76lwPJGc0yPZ0ia4/0', '1495601420');
INSERT INTO `user_info` VALUES ('111', 'c8605a51efc2cf6f41ed7f2f6862a81fef36d391', '于斐', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5U5GqiaeLia03q4X5WD7eIT7ic66CUiaeaXPiaYtYYpZwU86fauAGjDiaX3KJIQ01jHy35nRbVSV6Xe0Wq/0', '1495602940');
INSERT INTO `user_info` VALUES ('112', 'e7410c4ff5bebe2735ae0b1eada5ab9202a3dc23', '雷云', 'http://wx.qlogo.cn/mmopen/4VxVkXSwYQscmBj0ldHUxPECxqq9lzXC6VWGPsu3LS9WW9MN7rlj9wPnQJPfbPM7ZDtvBVepfHXcZaCDj8KwazqA8F2dEdDP/0', '1495608095');
INSERT INTO `user_info` VALUES ('113', '36a53977852603358535c680d758632f9e90e38a', '臻月余鱼余', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXvfKaxNJl48aiczJX6JVVdngrmMZRusBslofAoKPt63MdcVPdV8MiaNzcgdycPM2pPuuvweGicmW14f/0', '1495610052');
INSERT INTO `user_info` VALUES ('114', '0b858b1d7b2e6651eedd7aa5097d232cbad97d3a', '陳龍@臻月', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuGwlWiaVPTD4n4tSrSBOU7zON9w5S5sFkWWFTscgGuFYp5rQdmcAciboyCBW5v3dK7u8zU4g54eDE7O/0', '1495610218');
INSERT INTO `user_info` VALUES ('115', '2c6e8cfc976eda778d9382dfb486ac6b95d14e92', 'Janet', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFfiaG7qTxqiak7ZhbiaLPM1A5zVuTMlvkpiaTXDZ7zEBoTeDTOPjxf8hUbkpaQ5lDRn3wk7ibSjBmbMRUdnHxogjZK1N/0', '1495615244');
INSERT INTO `user_info` VALUES ('116', '01e850c96772318f1dc7ce8d18d8b05fa3d8b995', '奋斗', 'http://wx.qlogo.cn/mmopen/JVDECnNjedG5FeTrRhj3dicjrUG9d5IzibFjTBlAZ1HPoZdAqhjbJILicPYLge3GiaoU9CMKbjAkrWfJhSbTWwFYgA/0', '1495623541');
INSERT INTO `user_info` VALUES ('117', '90531026e2ac88721a704887d46ee16c405e20b2', '梧桐（运动营养师孙涛）', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5XrzO537xicSOE9owKnH0bibicQ0u3T8LKeHiaLThLfM7ktKaZmnTqgjPQ4wU2befysySdzdsW1KHonF/0', '1495632247');
INSERT INTO `user_info` VALUES ('118', '947877c616a5c1a3a75421dcfdbedf8584152808', '郑全森', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKfQob47phddpIycgpLacChkuGKUsTQmG9vEBZVrxxjDUWBepnVaSogzQtFjhhpY9jm62BITLlnkw/0', '1495632301');
INSERT INTO `user_info` VALUES ('119', '62803165d70feec73d0f2e67bc2ac9b9249562c2', '洋哥', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg2ZJeYCFvd0f6LJEaJGOFrU6lbTlicfk6mpqD6nZsIvZPlVicta6R04aQJ3icaWyPEEV3bgsaH65L3k/0', '1495673405');
INSERT INTO `user_info` VALUES ('120', 'cab348a40cdbce86fef087698aa0061a136e03c0', '张天翼Orochi', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXqQ1lQezVvzFwQKTG6lhfpPqK8WlOpCSEGUFp2SgNo9Wq8RbnIBo5XWQzyGkhAyq6mhNEfR6EsTC/0', '1495683182');
INSERT INTO `user_info` VALUES ('121', '70bfa80060e7d1a63c9b90f737e2f1613c0ab2ad', 'Grace', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFcpD7zmD0iaJRMIKIm2icVR9ngFKHtvz6s2LAkHzeuRoF2gRBgmTcjic60ibSlZrInwCvYFdUEPmG1ItD61jia2GYtIM/0', '1495694038');
INSERT INTO `user_info` VALUES ('122', '954cb68891c0b802f173dc13efcc98fc718b555c', '刘静Amelie', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFIbnvagJ95GVsic2HQpqCz8WBmNZUwS7p0wFz4gAvc9xMDFOV2t8aOafVUSDoUXJqiambuseSZibunA/0', '1495698638');
INSERT INTO `user_info` VALUES ('123', '7bb7732e0893106d492f52f38d81a47745a21dcf', '澄爱', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe61TTPLIiciaTD0gnF7lJrqiclymqV7QGl3xlKPJddwdvhH8g5S3c0R8tibTMZTQP8Ne7x1k0Gsnib6NH0/0', '1495699348');
INSERT INTO `user_info` VALUES ('124', 'aaefefa8c6d9a9c18653a859c2564141eb7dd34b', '喵小男', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKL3icPgMhMMibceNbWAkhz8r9e48icMeqYpmsniaicEYkVYVJAdp4Nn9oPYjD8kFCpVbOkUZswH6uZKMw/0', '1495701203');
INSERT INTO `user_info` VALUES ('125', 'a0c312f58ef1c008cf5b761b2af5cfc9b22d04be', '布袋小小只', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6ib6uTNmrhUTYAfQzVdvNVy1HU8kVJqW6yUaExj0Dnpfqj2NVoa9hCu79FD8Xhj4DicJLG1M3RZmQo/0', '1495702033');
INSERT INTO `user_info` VALUES ('126', '387cf3806b836967760d19ee901f246ea2fe5162', '黄修修', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obBAI7rZXfFVRP5SWrjEHOWMyMOx9vJjzBrCZyL8ibrAKOy81YjZQ9xRHBkr2diazvlHmulyRj7RCib73Uch5qyrLR/0', '1495704680');
INSERT INTO `user_info` VALUES ('127', '1960f622ff699078946ba1338209789ce0c411a8', '十五草', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg4gSZISE1EMaibrZo7zric6Eph7pxtSIuDy3IPoVG5Yia3yj1ob6X64JvLfSDGL4fgtRczgq0mC8NJ0/0', '1495704730');
INSERT INTO `user_info` VALUES ('128', '1ede68c55a9fabbb2a88aa8e128b4c1d1ed1c5cf', '〆冰是睡着の水°', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbWOC5skccRCnELULMS6NkVpw8NtqvhcpoNf7ibgHG4Xq3gg0u4ibjnhmhXaNQzFhuia1KRf7f7fibibUQHcLGInlKiadX/0', '1495705108');
INSERT INTO `user_info` VALUES ('129', '7a284bfb723e671c62c605520eba2850022ab564', 'W@车妆', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6y5p3kLvLBbfhHUcTyusE3VktYDB0pYOlTfPQMEAZU7uIReaoolUibEDHSp5GzdZ9uRMpk2OfODE4/0', '1495705433');
INSERT INTO `user_info` VALUES ('130', '6876aec744679d1eeb4aacd4e0c6274e0dc04918', 'zq', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5dXJ95gnaskYgnfYujojg7EicMXwibvd3LgsuQVmRYiaVPoF3PTc7H0cgYhjDPSnCArNKfLlVHxsbCj/0', '1495705452');
INSERT INTO `user_info` VALUES ('131', '2a6af76604bf29ee90971edf4c74c0b840c48e0f', 'Ming.', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4crfS16uC0A7MfHicysibHJAwicWS1jwqTc2wqf0zSuoHEVbPpTlfvTA2HUAWVUmjwIgIvuiadf2gKlg/0', '1495705504');
INSERT INTO `user_info` VALUES ('132', 'bdbb9deb3689606877ab1dcae636602a092f1306', '小攀', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKWf8dczk4KCDqIpmIJbU9cGRbKiaD8HSWlib2KmIMIvuPUibXjF1M7ZkdrVHJeA4ZZQlkoyesGjgOsg/0', '1495705758');
INSERT INTO `user_info` VALUES ('133', '6dbaebe93633ea516420806f040b5c7b1350e314', '小墨鱼', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbVicrQg1R92ibjV48ISRBMBx9P5pJKzYS2HctoicCtyhY4tFIMYv4y0j4My2zoUaA1t4FLFicLNNGnTwLq1WmseuVLm/0', '1495705796');
INSERT INTO `user_info` VALUES ('134', '4e44b8e0fed5b0ff7b9e50e8f65b939593bf8876', '', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5QkZ9biac7NAQicEB6k3BURJaG52oFmZTVaZhXibrQgpzibdzsK8sheZIica184iccm8Ux6kNbJXCjFenQ/0', '1495706269');
INSERT INTO `user_info` VALUES ('135', '84e8ed1eabbd04c83d544452afb0f22bcb864926', 'Sun', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFcpjpCpqLHVAn5HYv1ya6fmfQicAA50rp98q8AwO4fddvlL0mAuvmDaIRpUIchWq2IOynkw0iclXP4ycWcJ0IkqU6/0', '1495706345');
INSERT INTO `user_info` VALUES ('136', 'cf838e443d1e3460e00bf5737929df6842ebdce2', '田春峰', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5BmmyextibRtVnM3K17rchnhtu7MK15jGS5lbpjuf5ia1cFFd8Iwnr7Q2icqX3XNGFYwoic55ibUoeO4w/0', '1495706846');
INSERT INTO `user_info` VALUES ('137', '427f9293abd7a8617f71c9c6513864773202d2d3', 'briefness', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg1Pk8zxatGtSVbPmUReib8WcCXmKPNd61Fs1SFfN71ZM1ibFpg7ZPIwvOwicmemQcKeETEcibuAcCbvh/0', '1495707599');
INSERT INTO `user_info` VALUES ('138', '8fc9eedfb2d6d6e445e0314a75c59b61a7ee3d2f', 'A毛毛美美shop（催单不接哦）', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFcHXia82njnp5K0l3g0ia2khUraKoGp0f6LwvicNzoF1Na3pFJU5LBUpTxH3k2Ticibibyc5I2oh7iaJ3jaWADDQbV1Wsg/0', '1495707607');
INSERT INTO `user_info` VALUES ('139', 'd21e345169ecdff411368bd7b06e0e2032cee813', '꧁郑⃢航꧂', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA8E35UPIWq31ZRpLgibIl2jibs6MvDgLFjn4wNKxJ8W3kO4FlASBya8gzI5ErMia1NYDCkcvPrXONEQ/0', '1495708073');
INSERT INTO `user_info` VALUES ('140', '3c299362d904622d4b21d5824e8e6810276de707', '婷婷', 'http://wx.qlogo.cn/mmopen/JVDECnNjedEqsHhLKf501y4GROyc7ryJ6THibushuoeRGibP5wmjI9beqiaOCp0SGicGOuhBTgkx8qicCiatctKTia6oJlscScOjpQ0/0', '1495709111');
INSERT INTO `user_info` VALUES ('141', 'a19eea298b5af0cf45e1e4c8019c39709494b394', '梦梦', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5VZuDRLSciaXlqpBIwtTSLy4kwC3KRNN0JhxsiayrFUwTr0RHHMXPGqBq5Aw2zOXShlK8up9RxfKf6/0', '1495709191');
INSERT INTO `user_info` VALUES ('142', '11f430b5da9791808f3b4a9c4d0afec3f1856451', '小韦', 'http://wx.qlogo.cn/mmopen/4fjKzfw8lEfJLefQAS9tHrlia6EOpFgFNGYIssztNDuKs6YgnyziaHGS2cyEboibibjvJWWOILtfTKe8icXwr2AibDcOyCcQ4RMY7z/0', '1495712238');
INSERT INTO `user_info` VALUES ('143', '5d489818332ced95d046669be5bc1e6c7e0d11a0', 'Cloudy sky', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG1BALpk0pEOKAtWib1gszBKUFIJDxf5WGIsFKLRGGEyxUNsSPdj1gse6fN5xoKH0BmDDetzGRfa1e/0', '1495718312');
INSERT INTO `user_info` VALUES ('144', '865edad126130b2a107ebf749518b48283062a02', '于洋（营养师）', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5UBXjnTdcwXwsVdv4mRj5sWxViaToWQBrMATKbknU6vBUFGL9CFsMVeYx6S0icsWialjBkuyKpo4Y0G/0', '1495718904');
INSERT INTO `user_info` VALUES ('145', 'f8a1ffa2f14b03b859af43d722dbecdeecbaacc2', '优优', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG34051oAD0WWAXT09d8WibkKFdJByOicqWPLfnrTcwPhozURL0SIqNTVSZXJnsu2FibAE03uhibXbnuj/0', '1495723695');
INSERT INTO `user_info` VALUES ('146', '1a62e0f18bc2b0fafba020e845ff4e19ed823c69', ' 随鑫', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDmibQYticSu5KppkMhgfnc0P68Pr2GfDL2vxHtIu4uk4UXlZYCVwPVpEhib07jTo805aBwcDHczmic8A/0', '1495724029');
INSERT INTO `user_info` VALUES ('147', '540f0370c99a93d4249262b451de628008f9abfc', 'wendy', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5n30icUPibw0xRXzHibShEcknXJqnZ1gzEhico7Og8FyaPx4EibMgFsW0hy9I8AJ15DqdN9PvzR2J4mwBHJL3UG11ULjia565pjDBWE/0', '1495724625');
INSERT INTO `user_info` VALUES ('148', '12c4e5a2510628df1609d47ec322138283d94807', '@Shirley—李雪', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe65DLhTwrf1RV6dQobJXkMZmt8X3A15z4G7SQg2bZBkWB9UTYicg7mibgGU3oqTWqSlRicaVG6MVAExM/0', '1495727663');
INSERT INTO `user_info` VALUES ('149', '2c8dc111cdd9193c0f0f204297fce24123972801', 'ShirleyBaby', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbWX9xHTs648zqFvDQ2DsJCK4EZictwGYakbB7oJa0XBlDmw3FBwFvLyVqyNJjcJZkWOqVEkc0EMH9gia4p7hGmYX0/0', '1495728234');
INSERT INTO `user_info` VALUES ('150', '75b7be95e8207a2dcbc542eaf3ba655b20c9ba61', '焦洋', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI1saEVGPXj60EYmoJcjSDmllPKBY1rxHjicXYhgnGnZ29upJlkdN3KlicRT0EJJmAJ6Oic2kvbk2h5Q/0', '1495743253');
INSERT INTO `user_info` VALUES ('151', '55836e1291989ba7a9b94011394bd3f15f71a119', 'Queena', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygyQyAibrQwsDKNicle8rVgCaick1oD6LFjaZjYB7o1IDr7RNGnECEgBKZZRt7gmgO9DOpga8vGcAjBX/0', '1495759387');
INSERT INTO `user_info` VALUES ('152', '3277c1b660a0889d4ed81c7c01257b21e9edf606', '〆乂、尊 ♡上', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJG4LgNgQyWZRmPcCu1icgPXer5E6SxPOqgV9hOd5ewjCkoia8KIHyI4uVQz02vWibXsdoCXTUUS3Rjg/0', '1495765639');
INSERT INTO `user_info` VALUES ('153', '823d76aa871125175768c9442e2d6ba8aa048b1d', 'happy', 'http://wx.qlogo.cn/mmopen/JVDECnNjedG0tqYERmCe00PsOPxalODKEm06mCFzkPgUaPyNzE7GCBU6QdgrPKDP7xdgG4hJNUMD9UfNw2iaIYA/0', '1495766076');
INSERT INTO `user_info` VALUES ('154', 'aebc41f0bcd58fc444b2a331ddc795872048e083', '张新闯', 'http://wx.qlogo.cn/mmopen/JVDECnNjedHpa6nrgVyMEsSoTUISHmww4gHiaYwedCiaUCdQACkvL4Vckk1Xpy7CHC6YjI1otu016sQuJPdezx5cPn0eyygx6w/0', '1495768218');
INSERT INTO `user_info` VALUES ('155', '31e554db61e5ac3fd71d88b93e4e0d26d96e1782', 'Aings', 'http://wx.qlogo.cn/mmopen/mhnABRn6tflYFqLYGkhviasZMWln8a6EPNu04R6JfUwDER6VaajhUxmQJh4rv0wUZDKuIZZc4goxWVyPA5a8ib4f0A0kQnbic6ib/0', '1495772416');
INSERT INTO `user_info` VALUES ('156', 'd3660c48a1e828dd899fe340e86350bc1e40bfe3', '李晓凤', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXj3ALyAlwsyBXmOgcCLjtCliahmD38gzNBEBLZNZVqPvIIzk5zE66HWicJzd2Tc07418Pk7icsg4KFP/0', '1495775199');
INSERT INTO `user_info` VALUES ('157', '4031e31e56d4ab05d51a886080dee3038a49c557', '莫雨馨', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFpGmhpTw5aJiaXcDranoNmZGPZSxwFG7FPFSwSxNV7h265tUZ887rxpHlUPsmFib8GYHVlJaREuibiaw/0', '1495783691');
INSERT INTO `user_info` VALUES ('158', '98c9838398cb7164a2d0bb5d26241940de820fb7', '边颖营养师', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obgMoX3CiavQZHiaICxLt6icYIiboyRYGl3WSpSIRSJbPpk2wXiaDd3zZRcL84r9jiassRtQPOupSENl8LA/0', '1495788529');
INSERT INTO `user_info` VALUES ('160', '41b40d332ed5d92ed19598f0b50bb57eb42194de', '赤名四月', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDbJNKUCDbzZAa7hk0Zlv3sVTVq1TibjdTQ4MnOpqMEITJR0hsfxkibCibGibushgR0ZMRFJ0JrSibjOEg/0', '1495805849');
INSERT INTO `user_info` VALUES ('161', '67a86d396660d41e192f5a6b3625ebc035598e3c', 'Lily营养师', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5TxJzzIHpXFPkt6s24XbXyW7aMjCWEdHSAiaZBr4ricEEWavKUbYZfKiaicVWrNez0xP8p3JzibWX2IoA/0', '1495851405');
INSERT INTO `user_info` VALUES ('162', '6b14252cb2524c0b8ba2bf3d508cb590e1404f07', '王迪', 'http://wx.qlogo.cn/mmopen/JVDECnNjedHPLibkPskianUkJc3JZRXAIDEk8ibSAJVojBe56xjQGh9wHXpKoGFl22bqDtuwGdYSHQaB0DhibibJO2Q/0', '1495926209');
INSERT INTO `user_info` VALUES ('163', '0a52198b2713b08d172ab73896310921297499ae', 'Talk-App', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbWM9LptLRDpedg6Z9z1qFKceMLg70HgQ0iauWgS6CF4ribLPFKFiaxONrGicVW5uYtXq8zju8cNgUR35GwoibhkJbsyR/0', '1495931494');
INSERT INTO `user_info` VALUES ('164', '8960918179c47486ad71b8654a520fae50450cdf', 'WhitePoppy', 'http://wx.qlogo.cn/mmopen/JVDECnNjedEA0wg2OibBdWwmOdV4GEZGEV5eSAicjdkbmpp79rs78ep30ICnSRUOMRUX11uflHwKsNkGtZwBzGZQ/0', '1495938137');
INSERT INTO `user_info` VALUES ('165', '9a5811c861190523423222c7a23575e641db9edd', '随风', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5BnAEURpOcLtia8icFJ0Pp8jZuX6lHK4lZODaFiaF0r4VASZiaYAGuE1y4TuQ1kial0pKREzxYawx2MMgen40avOHXRxuXDSdVUbVY/0', '1495956201');
INSERT INTO `user_info` VALUES ('166', '6ed2cd882c081e5a7a8377f7bc5808ae19381643', '步行者', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJoYibd3ibTs2ola3iaL3oKVKfpkIEb9Z8vaZGCTGWRYz6gr9AKzFwb2Fnbrqw7jIBfx9xdk3FbQgHeA/0', '1495972876');
INSERT INTO `user_info` VALUES ('167', '0ec20da1ed851141e92e94a12e689b510e1f5ec5', '开心', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg8p3aj26uxnl7LW2siba7PhkZ23SQDeNhQWUwibOWNe9tagBbzk1tpoRnxsJtjdsJG1O08Me7c1fOz/0', '1496060423');
INSERT INTO `user_info` VALUES ('168', '9611315e62c886953daa5fb35f03bc0285307fde', '若琦', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbW8ZFfZ4ib8mwPiaxtkZc1gCcyles9jiaswOT5kfQWrEEQUkNc46UGTg0AxQdotELsiaiaYGVh65XdEEB01l6NnNqBNE/0', '1496150021');
INSERT INTO `user_info` VALUES ('169', 'ccffbddabf32abcda66a607a1a0097a4f5b64c8c', 'USescortCC', '', '1496190503');
INSERT INTO `user_info` VALUES ('170', 'a81965fd8b377a863867b96c807bb33787ad900b', '  ', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6JspxA12KTFwEb92Gu45RvZCfvOadibATeUf6ccfInUPmPs91qrbSbgVWicNpGmgoicltILH2RIyh9A/0', '1496201528');
INSERT INTO `user_info` VALUES ('171', '2e257a3c6b7539ab39880d78f453248b21462cfb', '峰', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC8qppxljRZVEibibpBA03hQG5ACO2BV0T5mbv26y2wG5Klabk8dCDTJyiavNDEqCSbDIyBb81SrJTng/0', '1496207168');
INSERT INTO `user_info` VALUES ('172', 'c1fc1cf3c2597c61b352c216a28a328d555ddc86', '√敏№↑', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJMRFsNtV6WyyicdCiaJDHAX7HZuicAeAknRCcmeI6FOaCJ2nETia9qB79OHKLlfv8Yf4cqaiciatzkdkUA/0', '1496216737');
INSERT INTO `user_info` VALUES ('173', 'eec5d51601977d305fd146c5b2cf72e3bddf153c', 'Cathy', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4KEYw95JZy9ZyCmhUvv40r26ca9fGx3smlNicGMAFeosJ0KDd8vQ0SnwSMX1u0M8pzkpXicuBykePw/0', '1496228968');
INSERT INTO `user_info` VALUES ('174', '91790aefc7d87663e7ea90da2cd90a83e23d2019', '龙龙', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbWzicK9nPlWLQWYa0682YAoZVyiamxcCUGZQNfI4XAdqGvIglHsHF7aB48EhVhtVgdtuL8x8NOjf8XA/0', '1496232115');
INSERT INTO `user_info` VALUES ('175', 'aec6d74fdafe1669d32672d456e4453a132a22d0', 'FM二二', 'http://wx.qlogo.cn/mmopen/0yzpjq6piadPib1MeCsf1YnfsABwCjc13Uwgrl7ODKzU9XzJKdbM0ZEcBDQjkmiaaKb4sCZLJg3AxKb71K2fzBkLA/0', '1496239652');
INSERT INTO `user_info` VALUES ('176', 'f3dc49759cdffdbb8681ccbff8a4cf578d3275f6', '杨松会', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6z6jRt0ibCSicMbhogyZP4B7Tvm6lzEHzfOoJ3M8cvibmEPssJtMavPaAylBxWiaejaEibU0KqicMV1jmy/0', '1496279027');
INSERT INTO `user_info` VALUES ('177', 'a570147d40871f63acad56a49bc80b10c49e6399', 'mayday140805', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307FBRDTMzZq5rQVWuzwYibNiase4yiccLiatULJicwV5pbKzP6Wl33d0pbBCUPibcytiaUFIMibQBoFrOqqtH/0', '1496280786');
INSERT INTO `user_info` VALUES ('178', '4aae69bda1b45129f4aedac5501f28dd24f7fb6c', '商道酬诚', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFcCDXbQ8VVWn5eicqibKWEX3MPeciahqZepHCBebBNS20ZwF5aibnZhWs2SeNDnA1IicIBicBcUp8LXObbXH3iaicAHZ4gu/0', '1496282297');
INSERT INTO `user_info` VALUES ('179', 'ed0c5b66c80fcb60237a8fae152a999c9e63311a', '袁艳™  营养师', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJLIyMmzCXIy6e2tGGGdxsWCb6IibCW6NVLSyHggZJIQymlERe1uDJtE8nCl5BNOQl8Tiar7pl3dvlQ/0', '1496294982');
INSERT INTO `user_info` VALUES ('180', 'a2193d4e5c29e665539a45fe7a1d4b2288c840f8', '法行', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXia3nANsUobp5jmwamTSPAzYJhQsMhoLwLy9BZPVfNibX6fzu9tyibeMPLgu09hT2df43SWuyne8seK/0', '1496298190');
INSERT INTO `user_info` VALUES ('181', 'd6def2a0fba61062a7e479fc2a2c36331ccbb943', '若兰', 'http://wx.qlogo.cn/mmopen/JVDECnNjedEvvI5PXRn382icOibvibN3lEBoT9oRruYicNPmxUWln55sUGmpVTnqu6AYUJAmePI2LLLn7Q5jLo2hmg/0', '1496301167');
INSERT INTO `user_info` VALUES ('182', '307a9a3960b79e62daf7995ac94b7d7fd238c18c', 'ruilq', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygxxbJjuPV9ia85L5c1VGibAL4GesO2urbUGztRs61JDqDKKmdk2Ex1agTRa16TOJdxV7yiawsQQW9Te/0', '1496301294');
INSERT INTO `user_info` VALUES ('183', '73ce6132a792219f889b61ab16abcbb071ec0735', '剑胆琴心', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5XWW97Nj6WSon7JS8sRYibJ1UDgaiaEVdq2zibvVR1PUPjfeTK9qvnNHpibLlHCMLza8ODwd3MyQkEnZ/0', '1496302381');
INSERT INTO `user_info` VALUES ('184', 'c138b0add2e89c3e6dca7546594e64503b4d4b03', '赵老蔫儿', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM59vEDc6KN3m8xfYQ34U6hzTHC3icCz4WCbibCh8rm37BtTnd2PGTOu10uNh7ye9QGtIhUKDnwViclxg/0', '1496320937');
INSERT INTO `user_info` VALUES ('185', 'a9cce3f70ccf19f92f0ac8b947010c8d4723989f', 'A 王新莲 15111918081', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbXjcTA9fCAR6CJ4oicFpVf84KbSWoXZqibGyGEhYqXuRTwhfbVpFqh7ibXrx0zqgicBMSnkJicsnCVgej9JuJia6ZQNMx/0', '1496384770');
INSERT INTO `user_info` VALUES ('186', '7adb12aa7ed258c8a3b811fea331ef3284710168', '强sir', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIyJd8IpeKZsJEYbKZmRntXR8KJvYp49DScykmslYRfciaFlxaCiaJMMhmz24qRAxxiasnD4JTDD0BUw/0', '1496386018');
INSERT INTO `user_info` VALUES ('187', '91ef26ecbf54bef26399caa93541f8493f13b5a4', 'Aslan', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBa9enc46m2gPTbqiasdicIGFaWULreykiaZeTicDiaicicET1VfYnLWOuVJ4T13VxEicCcNxt0X2toYuiaWtQ/0', '1496387990');
INSERT INTO `user_info` VALUES ('188', 'f262b9dc26850bffe0f13b1a1bc17aacbf90e948', '─━═荌然ゞ', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg7y2yTVpcL3WkYNnyU0GkEJLqu1wXibkNjKdfhLiaup87iaJwfaicVJDhdpeZp32NUl8prfBxq2fSoibib/0', '1496402971');
INSERT INTO `user_info` VALUES ('189', '38d610488b7be37c2d9221ec9dd1e41cc95644ec', '曹績寧', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe666hShb1priaPT88ZlzSb946EPdAcPZqlbAu0JelUpYknsHYaRqT1NIM3Ugjlv7IPjHtts9x53sfE/0', '1496403482');
INSERT INTO `user_info` VALUES ('190', '62d0bd694dcba359625bcc1ac95c27751fb92453', '齐老师', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5M2b7HzZ1YKWicdv905ib9stmDxM0aibF1zMibPdKJ8v13n2jP3oLqvARFbb7hicUeUJ9rib2PBWHsgibCA/0', '1496417199');
INSERT INTO `user_info` VALUES ('191', '35e650822f5551e70d916cdafbb1d06545b71805', '聂艺斐营养师', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXia0ZszDs0PLiaQyfr7cicveFfEAJibQXsvRCUvicvKZKeeWfovMjINOdhFZM4aObADqiacYia5FNPsWgAG/0', '1496450412');
INSERT INTO `user_info` VALUES ('192', '01e16769e5b036e13d201dd6ac71a46c9aef2027', '如果', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg8DOpBuEjkht6KLQnNicP78OIbJeVlRQRl6KicaKiaRFytFJlJP0GubuXrLKibUyl1AgBCZibG3DpucwS/0', '1496454122');
INSERT INTO `user_info` VALUES ('193', 'fc1504f773514e54cf1fbcc2d02024c4ab07bb4b', 'Cui健', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKDmJPU0Wbcvn2RxendK0LdicwBBlkTPKOxbK094gUQXriavAbmEs68RGJaFr56x4Acbnh5m3k9mcOw/0', '1496539866');
INSERT INTO `user_info` VALUES ('194', '5d98fbb90bc5804f38b5c99a1b1f21b1c516fe66', 'A.野生百花蜜(燕妮)17763570538', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA0hRI4sl4EkNgDDAFRAlnH0oVqfYf3DgC8gNNEJemE9oJfTATwTuBVwKiaXiateSyeW7ibwFope6XNA/0', '1496551345');
INSERT INTO `user_info` VALUES ('195', '07eb8a0a4bc85cfcee40899f3f0ee495ff5f3ff6', '及敏', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDxpfBvWH0ibhLxNQpMaibearDqtHwt3snuLUBqN8YOyNphV7GB3QedDWllF7U4vDnfrs5WL9B43E6Q/0', '1496558731');
INSERT INTO `user_info` VALUES ('196', '02e15ed94d3dfcbeca8db0a6a9f1025b77a841c3', '刘建明私人号', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygwPmRGkaiaUlrkqpYHJxFz87K8J6Hm3Gg7uXrb6vvbCe4YRylURxDWC7ou0pt8ay7UweKkoiaWNAKr/0', '1496563442');
INSERT INTO `user_info` VALUES ('197', '8d3877395dcafbfdd2eb0e91b17b7f99d6ba1bd5', '苏浅(sky-l)', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygy5N5icyZXdcy7RhS1dBzFVibOENdmktOo3b4E6pRqHWricNnYOrxTqicwias7yx2KOnJ9iaQVcT64TSPY/0', '1496580230');
INSERT INTO `user_info` VALUES ('198', 'efca22dd9d0aaaf984ec208266afaf21371b5301', '孙晓彤', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe69UtCsZ05x2PRq2oc5sVARjbBcdkwoxWJfF0XZbyibde01TQEM8X1cmAzCZXUz1XZhwBTII5vX1As/0', '1496580424');
INSERT INTO `user_info` VALUES ('199', '5ac8335421c2f41a9c08c4737dee0bfdbc20d8a2', '食育', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oYcxZCLFugsaQ5Dpvuk3fWxKmz2mcn4Vicx5FKdziaEbo6ulmNNDWAen8SpVEXJtAuMJkbuYsPibzLSXLmoBY3WYicU/0', '1496580549');
INSERT INTO `user_info` VALUES ('200', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', '美容纹绣营养催乳医学咨询师', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oYGCyZ41DwzQAKo5U8Dbf4q0Gk4TPweWzj1Liaasa8qco8Aocge4p1IABeNptSaiadubpY8URsAlAtPzWicYoQDAhZ/0', '1496581754');
INSERT INTO `user_info` VALUES ('201', '6efa58638582e44456eabf8b10657eaec62fb2d8', '【静默】', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXmlh3A7t5z41oNM48aSHPF1zgx4woV6cx89A8Oj8y9yqTUZiaicgG0iaRibu7lvZ6IqVdwc8iczXk6JDb/0', '1496583968');
INSERT INTO `user_info` VALUES ('203', '2c33353bd953993211772b4815e0bbe996185c57', '王文婧', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg8e3nTzYhZUF0QQaq90Bma2WlDgTiaHsjXdDwugcTAl8jJsibaBuq11NWfIynyrVakqQjkCQKfjEOm/0', '1496647366');
INSERT INTO `user_info` VALUES ('204', 'fca52d2c05123f9b8fcd79a19af6e8eada75a0b5', '刘晶', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJYIhpsYaUTTYKtrt4UoJSknTpWttpC1xMicqpeo3W4mwc1L4QNueibEmUgOe4aicEQwlBObdibvFpJgw/0', '1496651771');
INSERT INTO `user_info` VALUES ('205', '3db60ddf1263df670d9b2d303495e56079b72d14', '李楠(母婴健康教育联盟)', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc4MhQMqjqGB2cPyiavjkkYkBoufhur1zajftBDFXgiblVicvRQLr0z7LczvwlPZZXLdfzbB2bzdFN4w/0', '1496655876');
INSERT INTO `user_info` VALUES ('206', '4eaca5c95e5570d78266e0aa91e7ab723347f58d', '静水流深', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXjvAgtUz2rV4yaUwKJ5zh3wLSTrv0XQzZic9icZzzQYEh6RYib53emicqFWHqEhTGzmL3nnEAGrXzjJW/0', '1496701716');
INSERT INTO `user_info` VALUES ('207', 'bdef0af65b5c4ab16d8010a7c4bd0ea86713ad9d', '燕儿', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygyx2uMibwgUo8HCzvjf8wEVkMCvCZyBS16WNS3ZOk2YHMV1FFw6x6H1sT3VGsyCdjU6pEq1Jp74Xa/0', '1496742596');
INSERT INTO `user_info` VALUES ('208', '33e80215c4552ffabbfd10e521097deff091eaae', 'Amon', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6wYEa6g2ldDiceMDHtsAUSOMXoWkX3PLZrsZBtDeWVgkAlic5wqlgWVGOJolibcft7aVVmVRG3UZoHia/0', '1496754695');
INSERT INTO `user_info` VALUES ('209', 'bca82289e40277addfedd3a0dfe685165ef4871b', 'LS', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6yc9icPBibKOzAoRX98YQV8mOJZibnXDS7JOs6oAUUnFbSQnjial7bibEk3GPeXicgYicvPObJfpKRVLeTF/0', '1496757853');
INSERT INTO `user_info` VALUES ('210', '91ce4757fab344122c7459605625d6deef6ed41b', 'Cyan', 'http://wx.qlogo.cn/mmopen/JVDECnNjedEwrBgSr0icTtlqz6DxfmghEL7WmKwf4sOWSNPypc3WV8miaZRepsGBygvYUEiamKcZ5aS9HdHq56icIwAtgVxU1mOZ/0', '1496796562');
INSERT INTO `user_info` VALUES ('211', 'b8f035864cf762e1362ba866f96941e988d49aa6', '昵称是小天使给买的最好的礼物', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5eq57vr3c3NxH0VUx2l1DyFYYalwfxicbP7eT2gib1pF4eQrwPpNia1C3udQLNVp7h0ibqyWAKSSJF8Q/0', '1496801896');
INSERT INTO `user_info` VALUES ('212', '7e355f370a91a8765256b39ffe29c90e2f81cebf', 'ヤ灬7℃靉.', 'http://wx.qlogo.cn/mmopen/JVDECnNjedGK1XXbSEaqhLHbkF2xPDeV56RyqdSah8xrNg4sOsotAchXsmRWUej1mfYMM5FcBo5ztony0SMOFg/0', '1496801994');
INSERT INTO `user_info` VALUES ('213', '89fd4b03138b18ee0d4d2d088181e35d34d099ac', '金刚葫芦娃', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5fWCpTjYrEiccWf6sL3DtkoaXiakvkyfSj4OiaWZAIicUukKwxvmBibia3kH729DiccnynGqjeEUxHJkcbd/0', '1496823004');
INSERT INTO `user_info` VALUES ('214', 'b9c1bf645213f6ee9855fc3928394c041fe2199c', '黄桂超 @淘帮主-看澳洲，买澳洲', 'http://wx.qlogo.cn/mmopen/z7SkVpQIiaSRsoKmoiciaRRwqUIxymTh5LWzQEsaZ6TKKNzAdILe3UAcRwxqAeSIXibeGicscoYQMqHLZ2oibePzhVjw/0', '1496825036');
INSERT INTO `user_info` VALUES ('215', '8edbdc4f1567b7ff8b029bde5b086f584a89fda9', '轻加营养师Ada', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLASvjayUBwhEkq5wCK1DgMtjzr3Rht3RicBCZ4PXt6QcffBuQB7C0dZFAzeMQNiayNlVYuY0GbAoLtg/0', '1496839011');
INSERT INTO `user_info` VALUES ('216', '4c501736fa4daa6c41f3798e940f05351072388d', '完美世界', 'http://api.shoumeikeji.cn/picture/14969049506158.jpg', '1496903966');
INSERT INTO `user_info` VALUES ('217', '9b30e300fd8e84ba34d8bf5b38a5c7110d2916f2', '凤凰涅槃', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6AJibiaDFjUn2qSUfkozicARbWiazAPQQ2TonB9v3FiawNmVibiaibOI6aK97dHniaLZt25kAcACmnwePHnTL6ZQZP6LS23ehsT6ibNlkh0/0', '1496922014');
INSERT INTO `user_info` VALUES ('218', '847e69f37df2c2bf26bf245376edb73fae7019f9', '梁瀛', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXgRxH1BibfIIBgwxfgf733UoSbLQuWrMtwh27uOLMd70qdPkyjcepe8CXjOIPyx0eWErjDP33YfsU/0', '1496979263');
INSERT INTO `user_info` VALUES ('219', '345c646df25db4e341b1d9fb9deb0b15c65231cd', '袁钰膦', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXuVwWhEbBjTTsN8aEONZibYcG7RSlC7d78WBT4Lh8Csmq1ElJSMnAd9jkyR1yNz5SPFteCxteictqx/0', '1496983844');
INSERT INTO `user_info` VALUES ('220', 'c24755247537a8e8358d579081a1eedfd2f3643a', 'A  ', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDAnXV5WJe7kQI7XwElaUiaxEyu0EfOvjxf5qnbGeQBAFJkNicmcQnJ5r6LibtpgYjhMdQNCeqynLwyw/0', '1496986079');
INSERT INTO `user_info` VALUES ('221', '62a7c009616703c5c9c03f183eac77c0d3e3ac09', '郝老师', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5dbNJyMRYbLlLrrPNeupbVtGbw8TaqR0jeQ0b4NQNUMVP8Lr9KSgPNvMFRfo8kLHLia5YtBISoUGa/0', '1497087770');
INSERT INTO `user_info` VALUES ('222', '8485f0d948615a169f7ad3ed1ed01e097dc43051', '  坏猫猫', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg3w9iaOcibtBNQX7bS5XI5ia5KeLgnxCMCnh9VhRPny6oDkyIpqmAVoXC4pUvU1Fof1YMIOSKUuGUKe/0', '1497234373');
INSERT INTO `user_info` VALUES ('223', '15f820f3066ff34fc16a103808348db38b1b34b0', '李沐紫', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5Z6eaJsPjSicJIZ4xG2o0lq6GicphgRQA8ibtDqmvAtPHibibHupoKvTS2sgPjoiaUBbtS7sBGRBhTmM2p/0', '1497259178');
INSERT INTO `user_info` VALUES ('224', 'cf64402286b43b0acedb0d988c91e1ba4da23c9f', 'alienware', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJkv4c3m8IniaJTtN3mD95Omaic4FfFbJZU6dNrCh9SKicPVO0m5wxJSGWNezkzKricESicWLl829yKJHbAQmF8dYCeb5pm1SNhPLYI/0', '1497318140');
INSERT INTO `user_info` VALUES ('225', 'f939e13189a27d242624b13651f5e173aa78997a', '姚洁', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFdwtGric697FUjoPDJ587GHp5icOAOzHjrRltwE4XwucPBxuUKTUkVnmj80qtOH3ia3cFW4xbSBib3cibQ/0', '1497327172');
INSERT INTO `user_info` VALUES ('229', 'b7a396bf168ff5af76e416985cf5735ecedb03d4', '杨洋', 'http://api.shoumeikeji.cn/picture/14987926204810.jpg', '1497336541');
INSERT INTO `user_info` VALUES ('238', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '璐', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obJEDiacCR307AqBIOZfdgAeUT9YHOxNZ0xe08NAYNNKc1WeKPh6YBqhvdBl33bCndLwSyD4NG8NT4PzvpZsgnv4/0', '1497348111');
INSERT INTO `user_info` VALUES ('239', '9bae40e3babb53932db229e3a2147fb22ee376b0', '梦', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe60XcoRWj1tpKrAdJBiaTjluxjP6zic3nAoJ3zk7H6mgGvyDCcKv4mYMoFib1DQYbABwG9j8z8Oz7dp9/0', '1497362300');
INSERT INTO `user_info` VALUES ('240', '39a10cd5b0a7735ef15866b2b938890510c27962', '侯籽研', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5WeaKfoFe3BcMQibydaYVaVCBrEtFpC43FobkydL9JDW792ZwicUxibGUOXO8ldkhHzgibmFHcD9mRkV/0', '1497403139');
INSERT INTO `user_info` VALUES ('241', '38e9464c5b0426cb599b4d531a7305aaa7b8271d', '王再新-二老肥', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5U50lvDdibSp5ELRibB29wgebcD4eVZN6vdZQxiavIaqCVEVzU8fYmxYFibXCAAxjtz1KBLNYDn2p2Ev/0', '1497405939');
INSERT INTO `user_info` VALUES ('242', '37d28bd9a96a4cf7196cef3a2bc874104610fbb2', '蒯', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbVQIAxG0AffDpz0G0sDOia0ibN2yaH5r0ephV7jiaMQppeiaVaCpic0QBPYtmKE3uacSApn90tzEUjAFZH9H6FoG5hxu/0', '1497414087');
INSERT INTO `user_info` VALUES ('243', 'bb736cb1b3f6f0e092c046330dc48f02e3152907', '程刚@LBL.com.cn', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFMy2ibBBicYTnmLmrx1bjtSDIS0vJ9CWKbQBqZbTCRQtPKbGwY4We02Ol6ZW3ZNeZtdoeAcibonsjqdHPhXLpU2CU/0', '1497443847');
INSERT INTO `user_info` VALUES ('244', '3845a9de56d6c7524018e80d8af2fbe0f6a0d21d', '肖小二', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuGibGwx9UBsEJYhA2k9X3RWZvdtGo5FFguicjImXT2z8viaWn6TQU8Pmk08rdasaFCkWlSaJvoIDficWC/0', '1497448061');
INSERT INTO `user_info` VALUES ('245', '2ad84c983dd76d69d1f968920d9c7ab3b4909b71', '绿林学院', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFcCDXbQ8VVWn8WtBUIa3oZwt4AE29UygXUUJKb9XTEcm2FNrZdoLZoxw2HHFQyeWzibmF5E6YAfIJZ1iaSg3eUQau/0', '1497448395');
INSERT INTO `user_info` VALUES ('246', 'a4bf0b3cbe16321ab6d0f05f45697c3cf3edd6c8', '一直在路上！', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFd0LGPEyPFwv1P4TYjic0qVY1VsiasnpNgq2EDRzIwAjPFuTG0MtqMHssuygBJh3icGs3VcLibGDuFByA/0', '1497495891');
INSERT INTO `user_info` VALUES ('247', '833cfbfb5daf86e5b400de4ba69a4b000d93f89f', '11', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5andrctBEy0Z3b8KeEVtuMPxibPChpvwKbRURPue80y5r38qfegCkNZpnvickt3jtEnHY0h4Oc7d9V/0', '1497496633');
INSERT INTO `user_info` VALUES ('248', 'fbff8d58741c6e0a42835714f3ea023065ee0b85', '+匡总LINK', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg4cHew1gIdmVgucMTPnhnh0nMmlib4Br9ERSkvGZ71E0a2YXkhqbV1N2g4BsQ06rORoibVxSAYAhxv/0', '1497497719');
INSERT INTO `user_info` VALUES ('249', 'b45f0e1f9fb7419a713bb5bb639c61779faf8b6a', '笑田', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFdmEexQibChl5yHozEibeWbTlmuxzs07UrzjCPCiaC6Rv2NCATeSa4w9oYVy2T3SESuLVDtwhibibFpgxg/0', '1497499481');
INSERT INTO `user_info` VALUES ('250', '6a17b3718c3475f01cf4d84603a342da23f7e1cf', 'windy wang', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCLoH0ksMoqhYDEJPnWWMjxx7spaFKfecUIzam3wgsfiaUq6AWpzrFpicghtRe3KTmn9yBLGXjibyeMw/0', '1497499575');
INSERT INTO `user_info` VALUES ('251', 'c167283cb0aa335fbb6a1c6934045c3d111fcf9c', 'Yoko', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZicS9b0eO2cNvIDoVgkborRceUUCEEcXCGuo7u2CwpK8QjJNKcQxqCIP97mk5cGGkD9ibHs7mMQzGaic4hSfNMjwv/0', '1497506053');
INSERT INTO `user_info` VALUES ('252', '383f3af6e6c9f7e09be7583f361e665b66fb80f3', '笑笑哈', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygwxHjIffUzyQKaUediaVakaLJuLvUT9rNHkKkJxnzjFHaj9eEVlBaBZuGZjRyjCS30ocHBiaNqfaF4/0', '1497507570');
INSERT INTO `user_info` VALUES ('253', '417119586278becdf8791753bde4ce1c2f20d1dc', '火鸟先生', 'http://wx.qlogo.cn/mmopen/JVDECnNjedGWgQ7v2AIu9DjMKLiaEwobq1aARKwkL2GgjKIVySKmI0BlTdx1v4ib9GMZWyv6yC39ictJAvxTTNqMA/0', '1497519666');
INSERT INTO `user_info` VALUES ('254', '49bc4aaf0708addf438de2ed11c6abc8d6ce1301', 'Dave', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg2yy3VRyWna437lI1opdjBwJKWbrmibOjmspMjkw0ialnb0K99uZTfAib8YAhEjlKREZK3tJq18SObF/0', '1497529079');
INSERT INTO `user_info` VALUES ('255', '5e60cb08c239b6bc2c6f3678ad9e47344fd6116e', '李银红', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5dE4OiaE8RosXIrUeRsDjqxAj5Wb9ghJDrw2ma0fqLFiaEPLD0Esl2gQzff9xPsicugMH6hq1pkgkaz/0', '1497533795');
INSERT INTO `user_info` VALUES ('256', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '句号。', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuG6ZkDXfRNGLiaXjWC1NdzBSYOOEdDzNNiakw88icicWJBFRWs0jAFBpXVNZaiaEnS1pYBPUnKNDJnbTs9/0', '1497539184');
INSERT INTO `user_info` VALUES ('257', '92e62fd29b050ca9c1fb99644b5ebf17f19082d2', 'Ftrees汪', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZ5UDT4riaLticJ1PVRLwY3bWzbsCl4SoGflKMfQap8nianicicViakGaJolWq7uwhLdpdgicBA4PYlcupWA/0', '1497594530');
INSERT INTO `user_info` VALUES ('258', '0be95050f61544df70dd0d860238de544b44ec36', 'echo', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELnHkNrjvhIj4DWI2LiblNV3Esvc1pwHUkQIalcx4whSkLSZOzR61Z7Xibt3cdib3qQWvFLFCYOTjm5Q/0', '1497660314');
INSERT INTO `user_info` VALUES ('259', 'b784a83c4e0ae34e609c0b09dc851011e8fe2db5', 'Ofo', 'http://wx.qlogo.cn/mmopen/niczNtunYyibhRIfroGQdQn4oXVcgfTkggYDMxNlicCUwvASNbJbs3dod5P27lHfaeplzLMvVuH4zkVu3SoJckrkx0a1lOia7WRO/0', '1497664157');
INSERT INTO `user_info` VALUES ('260', 'c0996795511cdd86dfa6b01184102824990d8380', '爱德华PHP前端15842220968', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oYwrEVM8bpUvoxm53iccheY7HNB2Isf9atbp9z1MicvOclicyAXOdG5w9Mqv9WM76PMOFyN4oCtV3v7mCUT1PsZoBj/0', '1497668561');
INSERT INTO `user_info` VALUES ('261', 'ac8168b88cabc8ce4b8f7f0f2713d0e50b3ab749', '伊', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUAGvvW9DBBqxBhJoQYxxeicntP60rqiaBz1guIeDautXicGIHiaIBZU3KKtUY1BXABVkmziap41U5aLmR0EFHnmaicRG/0', '1497678381');
INSERT INTO `user_info` VALUES ('266', '6f90fad054c01349ef88e6fa659ac83125c7115d', '23℃', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5a6lq9OvncL5SI6iaX8ZbWJDoC1IZiaaicHhL6ZZkWwflRxibdOpPBYias61a2GmoMYHp4zMLOqMQQTjh/0', '1497696363');
INSERT INTO `user_info` VALUES ('267', '1f4e33d272d52229059af2d89486a538f70ef878', 'Walker', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6xLGI5deZ434qsBwBGRCBJcr9lWos73Koia6rb3fpVdyFJKZrpQKqlHyWP6jHzM0XiaiaNBbUFuy44U/0', '1497759223');
INSERT INTO `user_info` VALUES ('268', 'c64cfee4b81713682cb6faa050193736d7fada61', '未央', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygypedMics6o0AZwl5d5ic8BthJQGp750qHibgxRUo2BseSOoq5FK1I6IU21cfJf8yKViaibicsIgSISwgQ/0', '1497763649');
INSERT INTO `user_info` VALUES ('269', '041c8fb5c9c27b15107e45b8ed94557ead8cec79', '营养师悠妈', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5YFegmObADtStlib0ich9TFAkNRfLh2icg7EKGHSacx3qCAsSbhjrHicRqHP6NZKNRgDJsCNaXzrkicPh/0', '1497780055');
INSERT INTO `user_info` VALUES ('270', '69be2101826e9ee7dcbc649f139c07c66ba412df', '刘志超', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg9VjQociayvibAicbOFrOK2uhq2xuwEOW7vKFNlEtR5XPNPYicibZo0G9yq2R4WY8y6TVAwE7sQlvdtEA/0', '1497851734');
INSERT INTO `user_info` VALUES ('271', '50f12455b0af045fa86a3cdc1b4abb29e65ce3e9', '安心信鸽', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCDg7Lob3CQgCK9tJQyrlrHaURu0PzAbiaV1qT3JRHs1E4ryfTvUptllKm0WA6mia8tlibvRiaay5jxicg/0', '1497862909');
INSERT INTO `user_info` VALUES ('272', '1f40489eca46b8b5450e124bc010f7e16a0a108d', '臻月客服-小层', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5dPicGndx717QrBBxUPXibHCdeicsdsQvwKbMzZspMctkM5BH4nawfw9eBiaL0hWBE57DZz4IUt8JgQD/0', '1497872717');
INSERT INTO `user_info` VALUES ('273', '250d322bc396b9326fe3aa3e5056d86aed82dcf4', '吴玲', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5WBwNdsU1XuhS95qdolGQibE99h4vcQAHpm7GIRuh0LspvPxeF4eicm253K04GJ1af3LXwbCzxKdp4/0', '1497923857');
INSERT INTO `user_info` VALUES ('274', '0f0f4a1339b88260e566e92de2c348994d17834b', '黄学均', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXntu9SwGIlibKwxBASUousoyiaaB7jtCbr02DYfZ1QTHtyNhMS6icCYOY3Ib3h6RK3f7Iu2oPFmGGqe/0', '1497924193');
INSERT INTO `user_info` VALUES ('275', 'de308062577d69fc9e7c9d96918595b21df45f59', '小叶子', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6AJibiaDFjUn2qSUfkozicARbyuwuHN39j7XaiaZO23GEUR10PZScRdSUTib1Z1ZBa0haO0QZISoEibrxbIcHwTpcQUQUlWI6SNXejk/0', '1497926260');
INSERT INTO `user_info` VALUES ('276', 'ee5c5ee5b1ffe55fde371eaffd4a60786c8afdc4', '营养姐', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe64fXsq0K4dJ73jRmrcSJO3TwRQcoFNEqwuQibXtrniakX0tSJ2V4NMB7L3p8I82cibV1asKXOEibtgicS/0', '1497928110');
INSERT INTO `user_info` VALUES ('277', 'cdb6ba838f5a603794f29e50560e33b4aac6b769', '萌妹', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg7nh6EvoPT2Xg21mib10iahsBajzplFuSWtTmL3nPA8PK8BZzAGHvApcAmJQBTIkWXTsQ2H9YctVp2/0', '1497943090');
INSERT INTO `user_info` VALUES ('278', 'aff56fa5266abfc93a284a65b77e5c465f9df89a', '王磊', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe60IDic7SicgNVjEcicuDlobnxyniaxQH8S5NUzHqhVsDOKaQA7F7rGXuzUR0MP7f2uZJ5lMzEuWF87p5/0', '1497943431');
INSERT INTO `user_info` VALUES ('279', '10f2d6d7633565aa1bbedc4f4c0b47d74d90be44', '麦兜兜', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe60D1SjfMoDOhMIq9W9LAZSgoDSicDPb9ThdFzIjt1qEWNErKQE9yJTtE3HEGu642gtSTL8DS7uljd/0', '1497944142');
INSERT INTO `user_info` VALUES ('280', 'd29997a3f57d99280558a2291e9cf55c93c98635', '玥', 'http://wx.qlogo.cn/mmopen/JVDECnNjedG2k6F7UPJhf7ByREdHXibHgzpzA9ok7K0SyziaUrsiauT4dEL29EpZkA3gYcuArOwsHEKsNWoOBjicWIPvHm42N4F3/0', '1497959689');
INSERT INTO `user_info` VALUES ('281', 'd2ebc523c0e665f488152ee7752a33ba2a51d17d', 'Reedy', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELCF53icXJjLjUVXQU2ibXWTRQvPaWPibf9fOKlVhf84w3dMs4367Ga9HTJFA72gpGaJ4pngynKElZgg/0', '1497965898');
INSERT INTO `user_info` VALUES ('282', 'afba0dd5c48579fec17e402d9ad147592db3e22f', '鑫雨', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFdBhlwQHVy1ROW9uRG5KVo8wib8dQ8sWIkVLsjW1ibjiaUDAbFxQzDOmONo5r55v7K0l4yoSTmapZibPibaEjibloCGVL/0', '1498014375');
INSERT INTO `user_info` VALUES ('283', 'a1e769085b6a575e819aa33477dedef6a0e6cd52', '低声细语', 'http://wx.qlogo.cn/mmopen/niczNtunYyibhRIfroGQdQnzddmQYseQSGHDcKqIHicZCB52fYxQ6epAMwvoiawyHYiaZSlL6h4VLq941hF6tW2suM3jOmThZaJe6/0', '1498014647');
INSERT INTO `user_info` VALUES ('284', '15084998f14295d717aa5c18c25e72327ff13bee', 'vince', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJfib9wiaaU7dWR0p3VydkOlHafHticV78ePibgH1OM3ZasCuhePnUUgjvOiamz3icjA8Ez7icT0epicoq6gg/0', '1498039827');
INSERT INTO `user_info` VALUES ('285', '257c6d6129c6788b4092bc66ee7cdd777b928d2e', '博盛卡特机械-崔学磊', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6icowOMjCbQOxvjfp523bF9VfPib2Tn0ia8PDDibFbmJkHQtuShDNNXEYRv0KFEYSLJ3n8WVdP4RCP3h/0', '1498040602');
INSERT INTO `user_info` VALUES ('286', 'e6254846264ed8749a7220e7990f6cfa2e6eed05', 'hello world', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5Vu0n1ePWPaBiagITWsJ431f0Of0JTnIAMKdmua0Yg4mKqOj7NUziageFWnG5Giac4g96vB8Ncic1XUS/0', '1498040766');
INSERT INTO `user_info` VALUES ('287', '6e44623341a7eb48b66cd544515f6b47a2fd3ee9', '有只流浪猫叫大白啊', 'http://wx.qlogo.cn/mmopen/JVDECnNjedHhRibByYzwib29wF5FIFfr2d59V4aOe6G9Bq7CDmEqnlBAEWwWkmlExHC8U3jPOEEelzQDDx9kd46w/0', '1498043868');
INSERT INTO `user_info` VALUES ('288', '3bb730c950b70dce3cc3078d9aac68b10c5923ad', 'Grey', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUMeqVaH8dfxQ3bbLEwoxYTwMWsMiaDOcXslYdAUvv7CEwvPiaGMGvDyWfuceRGIic4zzFwNvG2d1b9suYLIPjJAyJ/0', '1498043980');
INSERT INTO `user_info` VALUES ('289', 'e5db07daca9f48c1931c696c6a1a14a93c2e82e0', '记忆', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZzpjch3ia1RVuWbDLzoVmK6VokxGlnPf4RnT7b2zrwahcGyC6NWgyCjZYIraC70H7qxm2wEibabzOL8LveLR7Ufk/0', '1498056170');
INSERT INTO `user_info` VALUES ('290', '8579e6ec902fbf18df6cf8c502d21dea1cd0f151', '董志民-Car Book', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oa3BibZCWOp6rpDJU8C0ESg6YDzwaEpMOO9NmJ0Wia9EUxSW72r8fBVskF75gqnCVn2hv9uWCE8hKHw/0', '1498086224');
INSERT INTO `user_info` VALUES ('291', '75c5e77b85c425408012313d3ce9ce231b202b34', '丁佳林Mr.T', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5RTXbcCDf1ibSOwuXiaf1aRVfw50h9DKh6f1H4ZzibM1ORpUMpenMwCGDL2moOUeWGmDic86tFp7ZO6ib/0', '1498094583');
INSERT INTO `user_info` VALUES ('292', 'c5fcba5f2e2abb8c3dc65715b0060059b0ed974e', '汪迎峰', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAcZ6JAMYd88kgSObrQPYlqriaokVC5jSCBw1FNaYFrh1NkTtGUvODTqv4mM7NuiaRI5iaE3jva5Upww/0', '1498095104');
INSERT INTO `user_info` VALUES ('293', '9557a1ba08ad25c7e469077a191cf7daaf2761cd', '许涛', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe68jcQM76aKK4Mf5nb534VR1H2GYWMQd4To5n4wAH7b7TWtjDauSzV9nIxoSXHfWySiaQrTq4Uwkxa/0', '1498096689');
INSERT INTO `user_info` VALUES ('294', 'ebdb9222682e73af651888f04beaa99ade6e0ff3', '清扬婉冰', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6kXmdEwJo1pcEWmNUtydcLLTRDmSNXg0cqgqRJVlssgwecZ0tvBNucxUo2ibzvpRBSw9HTHkEiauy57MTevkicicxZFtBb93TzbBE/0', '1498117675');
INSERT INTO `user_info` VALUES ('295', 'dc493c7ee4399d3b5834c9761450cd265b343068', '小杨小腰儿', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6AJibiaDFjUn2qSUfkozicARb0mfckgPYVbfWc9Mb2Sc4yicgpZtiaTibLs5PiahYWJTlDBicKN67wgq9sd5UrfhIKUsAgdDFSlawTc9g/0', '1498117677');
INSERT INTO `user_info` VALUES ('296', 'd4e09bfa8de7211470a02b8bf8fc7df4ccb29e02', '阚淼', 'http://wx.qlogo.cn/mmopen/hKvUfvt8yQbM9zf49ANuGicE1K3jQ6HCUHmmWliajpHsRch0icB3gpL7IKemvNdMnZTMmZQox1DHIEHd83V5FpF1JJ9aaqEK5Ig/0', '1498117679');
INSERT INTO `user_info` VALUES ('297', '5966d66a4bd7f69e13a80f0e9ff934387713bc12', '祺乐荣荣', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4oI0Vq03LxEgl06IbPSkg9IKxU7vXgM6TF3icDgjiaV2Gaw2RLSzTib37g2RFaTtVxwzeejZibVibAV6w/0', '1498117687');
INSERT INTO `user_info` VALUES ('298', '123b10606bd318c65784f50ef1aa6d6b7b93c26c', '杨伟', 'http://wx.qlogo.cn/mmopen/JVDECnNjedHrBL7F6W2pLFek7bMibjeNbgjxoCbTROqryjAU2Lmj8vHutDo3RUYqjn6uCIM53K2ibuHbLpx97Rfw/0', '1498118380');
INSERT INTO `user_info` VALUES ('299', '65ac31b2b0f5b3904270a7d8602711e94a6392ca', '天下太平', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6FRL3XiatibyPYxDGuVfhGq3iaLUBPsNmdrxKsQrVgQUUPw2xibfKegB6C408h83Qg5JmSYTIv9tZ5tjkdScGkLNanF0DucLj6S3w/0', '1498133346');
INSERT INTO `user_info` VALUES ('300', '1116d39a1ded3a71d97996283de69743d14b9a33', '二哥', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFfXI7ZWibK2qKlInXSOZIIqfAE4WGrOV3XCG4JHMqNhUEoEKHs52ImPKCElibVrDmsdHKlK7Hvibh9ia0XLnaNvSCWo/0', '1498139975');
INSERT INTO `user_info` VALUES ('301', 'ff6a9c2be8681ec370adae14416d255c420572c8', 'A-大李', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg26c3YOHjQCLl4K7AoVyQ54bvRMESPnG35CtNEtTAibnZYmsDBJAS4rTTsTpvcwGHM4lk0joRMToZ/0', '1498174392');
INSERT INTO `user_info` VALUES ('302', 'f68867d9e1564f0db96f1810464ac8cdf55e0315', '王宏伟', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg4h3icHaAeIhMxlzWyaLI9H4z6F1fZedBVeSyua9Tbk7VkLWqcx96thUepqVvOu6qsxP2wiaWibI83L/0', '1498223580');
INSERT INTO `user_info` VALUES ('303', '0cf57a06cda4187d962afc38faaaf4b0bc24010f', 'A.运田良品-张伟', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5cFFGXOz5nrDObDIVF45QKyjtWbQQ5ACahTMCpia7INsaAeFRtJ00xXSEUdpJvJYYzHr12ibINkxQ9/0', '1498223777');
INSERT INTO `user_info` VALUES ('304', 'e51faac7813baee5f17815675d039ff61725c87c', 'Abner', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUv4ZAaydmQD9LYSUKysra7NXSzyYEGb7IcG7WibZauZqdOOQcaRZ05DrpGLmMTvcHbT1DhUdMGU4Z5DavicHDXibL/0', '1498277469');
INSERT INTO `user_info` VALUES ('305', 'dee2e3a547cb0249ccf187e5c55654fee410f1c3', 'davis su', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg2uDU4pg3n9VJhOUU5tVFlu6ubk8P6BHcOOeoDibI0zwurIy3lVuvl3lH1Q73LU83eLUZ5X3uBhLc/0', '1498304867');
INSERT INTO `user_info` VALUES ('306', '3d2c5ff8d22cabb2a592627e7fd928c50abc2b3d', 'Aaron张民', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5W0C6Bzn80YSyF5nU06RXN8Xah3YgSvDKXgAAbklfJLGeKrlUQVAtvibsibaBWx9IH8SUnnQCV2MAv/0', '1498355009');
INSERT INTO `user_info` VALUES ('307', '2998e3cef1aac3578464065cf04288f36a5d808d', 'IT168静子', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5IsI8Nf21CM2bP8icUvgof0DXTebOsv4cQEgt0Sj8cPcJyMvYCOhZV9NwHoseUzBgdBXBKKEqUFsoRPSK6hGVvtkHC472E65p8/0', '1498370087');
INSERT INTO `user_info` VALUES ('308', 'c37d079ce3164460564f98774719aeebd2ed5992', '我滴乐呀！', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJY6z0rgspowccDLCiaSYDQQedqHCxQwtMkJib5vINxLKRpbcZ9Lto6nWeAxvnVPvZg94BuWwKL2vUw/0', '1498406612');
INSERT INTO `user_info` VALUES ('309', 'a6122605ae34a4173be6ec901cd095797b8f48e7', '【迈聚网】工业品互联网平台', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5aAxLGF1cNOlGvgkNeic28yNJ8YMAibFrfJlsxCZL2PusSzh5ltLNKvquE6Axul3tyt9cnJiaNEbic6U/0', '1498467672');
INSERT INTO `user_info` VALUES ('310', '4d87c03ee8d502bfaa593b01afd3b1e3da33fd3a', '我是杨棋若', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKafzxZ3GwOxY9KMK4mC8ictHQht9hFLvyvQV7xoMlxiacDCUibYbRrERfbS7K6bzgUkbJmTdian5Fqcg/0', '1498481065');
INSERT INTO `user_info` VALUES ('311', 'e711c11b6d3d3b2adc8065471155c874a190ab01', 'L&L Lucky', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygib04LdTX1PiaW3LlLSZq7SzGICI03iaxSdGPgbcKBHYmeYF0ibfsL7vs6Br6yTmIURV9pmIRUuasrLh/0', '1498530109');
INSERT INTO `user_info` VALUES ('313', '3fd4429a5a7b7fe2fdd6e0f1631bab7dc1babc99', '裴杨', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5TzLMzUty2RgJPRib7HsOZn3jdEEZKYTojoIuSfibBZaajDVwcuclJQSyxWsEOcLn9ib76CqHLA0PmJ/0', '1498533483');
INSERT INTO `user_info` VALUES ('314', '8e4b420f904db854a4cb58ac71a3cc73a240d7b4', 'Caleb Yuang', 'http://wx.qlogo.cn/mmopen/JVDECnNjedF4eiciaMFJJaa56hGvS6qdwkaG3nwIiaXXtIqHa5QHYIcQCecOhIZYv2Ja8bI08rLgRaPRibayEiaysrg/0', '1498538288');
INSERT INTO `user_info` VALUES ('315', '1eed9332d2d9bf5982d5f4a62616cb14dfa540be', '·、筱莫', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFfcBMBBBHBZWy8O0nyoibyO4NcH5oHvXRIPGjSQ7sbyRTvMAPAkfzSX20Jv0w1NrCHib9Ax2gOGNwtQ/0', '1498547676');
INSERT INTO `user_info` VALUES ('316', '0a0ccb887dc27cf674b112b6d0828c529df3fe09', '破晓', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg1D7xXWUicSnCIZPvp8CzxujZ13wZyic2hVof5iaJtsELnpu6mqjzEMDSqRJ0VpBDwBOUT7BDfzLL9a/0', '1498555682');
INSERT INTO `user_info` VALUES ('317', '26261e7a94403425ab21702f8fd282a8a9ec163f', '营养师李桂萍', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFeWs39Xqo2K7ibEhFBofYZKlOPsF5fmtYCM0djxgx3REQl6m21cqiaXQ2qZasqf8icfID3j6EHgicYwbicRIlNTfzxAI/0', '1498639565');
INSERT INTO `user_info` VALUES ('318', '032f3956abbc0d1131bfbefe57abeb95191c091c', '康仔', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5ePpIKkQd1Nd8hUCQeGwHwGSspZ32X8VevbQHl9JeIHeBnc5mq8nE1Ad9uRaPJ8viahyfxaGny8V3/0', '1498639767');
INSERT INTO `user_info` VALUES ('319', 'd54761e3748076f77b9811f98bfa8aa7998090a8', '戒', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5ftDROo7NlnlC2wwfR9WmTcHZia5QsGo0a4HXXgsPfZwmUGGicA8J40onsCGEMibngzdK5cRDjdn82z/0', '1498670240');
INSERT INTO `user_info` VALUES ('320', '6430ebbc1aba17557010004b9bf8ee7f55da353b', '龙行天下', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe6wSiaotrUHibViaTzSlkelk60srn0KbtpZloCE9Z8lvZWmko20pvrKHwEE15fvGXkIslTVSFz8zDFDk/0', '1498795139');
INSERT INTO `user_info` VALUES ('321', 'ee09e6a1b2f5ab9430b81d826c04d755227c53e8', 'Dan.n', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDLIyjsYjTnZsksFGZWQoMTYl4MhKA2HYibaCtoBFsFFbIOX4X97cTuArsZLn4icOp6ibAvmHCMLdIyQ/0', '1498813865');
INSERT INTO `user_info` VALUES ('322', '04493c9d8d16e0e0d023c830d2c86360a8dbb10f', '李明华', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFcQPiaNxSticOqbvcKiburwZTQ88iaWLUbJY7ZzJfwia9ZPpB1pxvNhkIv8zUJ5Pr7yn1pscd3SF1hedibtK0KkCO3Tfe/0', '1498815491');
INSERT INTO `user_info` VALUES ('323', '661b61a6d3e2ac56f5ce42b11f3655faedccc7a5', '二姐', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg3SsvntNQicO0dPmcyoibianqvYhnoyQEWk8ET2V5nwaJ2Du0N379kYz6wXWSNx1gQJhxkHRzeXrkRS/0', '1498816832');
INSERT INTO `user_info` VALUES ('324', 'e576355211da5baed649b24c5e049a24a9315748', '张宁', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg2zTeblQzPIod0qyrbZhy6ZeBZTQdGhey2NJzKhO3cUQI8MUpLypebyibtkekhOMa9SBiaW7lsOTVx/0', '1498817356');
INSERT INTO `user_info` VALUES ('325', '8b38923667aab4c391fde48c30864137f85c8e31', '清风流云', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFest5C5ZWSSLe9tHiaG2axQzvQvIKHKhstTuoiaQ7SZNsqNpjms3eC8Tz7sjwb83RGvgeu3bXU6APyOSx1cknbKxR/0', '1498817522');
INSERT INTO `user_info` VALUES ('326', '260dadae650dc6ae2a03e7965e1dcfd602b97b42', 'Evanly冯元丽', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCM83Uh0tCZ1ExcJziaNYgPPK380wWQbTwCEWgEAWyfHMftKkjvhYMeeiaQjPGPTj9LOZlpibTH0juJQ/0', '1498819910');
INSERT INTO `user_info` VALUES ('327', 'b734cf1af0270b53bdf947d57449e109dcd49ba1', 'violet', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKCTQ9fI6YcLgpiamSnxpxQGXY1J1lhlqyVZ0VLy1RMlVBrib3QQuz7Ub4hOtyzQOs6y1C6RtykA7HQ/0', '1498821593');
INSERT INTO `user_info` VALUES ('328', 'bfb6e8f748e4ae99512f392b4ddb5de24d199f95', 'ོ杜卿®', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBxKqEMVbU2MnzxibnS5KYWrrC3JryCcpDekoWStGhcUpV7xnGib7icbP7eBMtjZsDAw59wvSstnKGjA/0', '1498824792');
INSERT INTO `user_info` VALUES ('330', 'bfd860f4513d8adc56f555241ff798cf3e2cd9a7', '丘山圆', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUeVUtnnGBe69dKGqk2QicH3XVl5X2qrVbKUMbHPficibZWku2DT4ytkSqd5SLibuMSeWffWWupp9u8qdagPruGaYibo/0', '1498989268');
INSERT INTO `user_info` VALUES ('331', 'ea3212da984a3a6814059c873456f08d3b37b6b4', '桃源', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5VYe4aplM5FIwQ8cjlSQ613DfhZ8IIIKGQlZLoN8ETIWicmVBP5N7yvcnGEcHzuoVmPaSvFG4ao0n/0', '1498996779');
INSERT INTO `user_info` VALUES ('332', '650f4857ea8ee89d942f2e6f012453ee044052a1', '？？？', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUMeqVaH8dfxaKxOnJa4sTylibKHWibIweePpGgOuIPdyUdF2AZYLVcUKkBwudQNY8JCuuMf1pg3xctwCm3I15yibd/0', '1499000201');
INSERT INTO `user_info` VALUES ('333', 'b85e7e5a9bdda5447c93861c4ce7a1319c3e83a1', '懿', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oaCy0r00r71raHYRvCIzCWsum7frhtt2spVBgOXOoZc2u3zZULG0TkuL0D6m3tbf5XkThibYOfjqEoFRuMeD8QbJ/0', '1499002456');
INSERT INTO `user_info` VALUES ('334', '49da1232526fd62be92a8042af95d7749f07ee36', 'zzzzzx', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5eFqy8xcgq5MIvF0l3v0bOowfE6FYS8IJLRBmrA2wuTee5aga7DK3kxdqShmicgUEMYa4PglzHyS9/0', '1499050656');
INSERT INTO `user_info` VALUES ('335', '85148639d80277d6dcd727eab6183c417f44c838', '喆爷', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5b3kV8PvMhGooSWSGATTf7O3UCjQtialq9Nd8FzEkK5jf9AMMiaEPCbJLfmcl2icaaqAgDt2GW3qQcH/0', '1499163508');
INSERT INTO `user_info` VALUES ('336', '7a56c7b24a094611fb69ac748015d15186966772', '托塔小龙', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4nJrE8QjfJeyVhvv57bcUZseh8icYEf7oL36f0mHnt3TLpk5AVaRVviaWEkensQwbLdS6iaIzEDIc8A/0', '1499207406');
INSERT INTO `user_info` VALUES ('337', '04310ccbdbdcdeba28d36deb3ef2c12b82922d88', '茉萱', 'http://wx.qlogo.cn/mmopen/DkcoibxTfzbUAGvvW9DBBq0UMSoIBfyF8mZiahTamfqNdSaHh0UIhfP3bdx6WEWiabCqIqwX0Xvhq7XBcuLeUgJqez3IuD83jzc/0', '1499218219');
INSERT INTO `user_info` VALUES ('338', 'e38c8d2d84236cf4719efa720018d14c9b8a2600', '梅妆。', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3obraMAEkBPnebPYk0uavczS0vzhYHO3bPTiaVCMGmYdwpZBSRQZyHicKPhbria38Mib6NJdYTaxeRHp20LxEmn08IPk/0', '1499218313');
INSERT INTO `user_info` VALUES ('339', '7a5b4b756cf20107d1e35811fc010f49061194ac', '自在天', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIAkXkeqbvVbY1d9tLZ8iasC0cnVGY5gGohPNicGLdONKbGViblCd64Ej0Eb1EFX1eff7OStt6XVGk1w/0', '1499223620');
INSERT INTO `user_info` VALUES ('340', '1d80b003ed848db11b21f081437de72eb1ebb4c9', '桐桐学生屋赵建国', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg1tvLGTPDr9yLlkRwolMPBGFvZ0F0jUGnbU0P3g0qLpvZ3Tt42wgFWz6Jh5aXJ6AcY2icNGQticVn2/0', '1499224260');
INSERT INTO `user_info` VALUES ('341', 'aa23379a215ba22e1ffe816d0b2913b8f2a68b82', '陈瑞玲15811064180', 'http://wx.qlogo.cn/mmopen/YFy6WZo2ngDk7aVmpHPpbibYrMybRFcNV0CJwqY1wBHVAVCnxCNM4t0icdhLOWvuOmNiaXOYtTXNWvjN7CAMReauQ/0', '1499231538');
INSERT INTO `user_info` VALUES ('343', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '周长江', 'http://api.shoumeikeji.cn/picture/14993949578165.jpg', '1499248985');
INSERT INTO `user_info` VALUES ('344', '4e05a2341fef5e373341c667d61b37d056a5d781', '来杯咖啡', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFeKZtjIa5MqeiaAP7S5PrRcFNadCCgKpvusXG3U1hoAU4x0lO6NFEG3wT8XpIYbeVI72pCLXJKbNtyuicbsqibAenM/0', '1499316428');
INSERT INTO `user_info` VALUES ('345', '50917e27a2c9468227f53ebb06a306a82af44072', '王星宇', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygicLfuqZeH8JJQiaIsQVpGooUmKtKtk70eXgsicZbQVd9PibQKqplnBKu2yegBGGhibAYNnAgepP3LN0z/0', '1499316849');
INSERT INTO `user_info` VALUES ('346', 'd6124d50682770e1afe72a04fc47b04aec91dbfe', 'MiNou', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5YRLfODuEf1YBlMmjibYX83YaWUUsPkUkyboAme7oGic56caa4GzKNaUP9TBOhMicXvWIFN6qapxn6r/0', '1499318652');
INSERT INTO `user_info` VALUES ('347', '557d8054879b3f29957fdfa11e2264516197130a', '短发ོ（海青）', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5Xu5ibAeKdNfbce7xI7ZyLGmibcYQTLlEwc9d6TLia5lZyMEuRGzxVX5fK4nDwD3oxopNMIjIKibnfaQ/0', '1499318982');
INSERT INTO `user_info` VALUES ('348', '6c5249833ec795b65139000c7bdb26558446c157', '孙俪 爱茶7', 'http://wx.qlogo.cn/mmopen/JVDECnNjedFxibBwef5AAXuxHJrP2BlluUq0BPbTLb7CXqib2GibWj2KrVxw6oQ32hFvCHDoPbxeN57ELdxpgpIlE0Aj5b0Otica/0', '1499319290');
INSERT INTO `user_info` VALUES ('349', 'a136d5b94a764ec0c8e3d631b5b9ff43b6f6de9f', '白开水', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg2uav5ke80UwEXa1LWVgjibClQgWXsDJFUesdcSqiaJGl1Rp6AhChiaqhTqicO4FFf3Qwvgw4nEgibgHR/0', '1499319362');
INSERT INTO `user_info` VALUES ('350', 'fff068fe5f28357b37a6f82e95b465bc1fa933e4', 'Oo锁住oO', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5a6VoXqC69oraXGZJxTia0eYiarsfDTEnWNr8fD1gEJ3huKLdZnFk2diaPVVtYjxj1hAZLOIerFDL2Y/0', '1499322299');
INSERT INTO `user_info` VALUES ('351', '176faa236c3a405ec5af46584bdd6ae046b66e9c', '徐徐天下', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK4qpwUv358YPVZAsoL65AEvyNuOLhCh0ueBqKORRnUOLCnkmC7bBiccIEc7RGnpdu7LgnUPhkKokw/0', '1499333476');
INSERT INTO `user_info` VALUES ('352', '28247d2049843fa714cbbcc29cb66ea9b772c006', '阿言先森', 'http://wx.qlogo.cn/mmopen/Sw4bNGhl3sicSaBfnCtTp0kdTYHEtBOCFLrpljzA4Yqpp7czDo0ZKCqgnmI8hPH7tn5F2SiaZKLtlrXGHf3NlgyDqZNtOoy6I8/0', '1499408968');
INSERT INTO `user_info` VALUES ('353', '81fc18ecac44ec9ebaab056b236a8159f007f40f', '漂亮野记', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicyg5dAm2dc9DR3icwETxicpjDXehib9h3MtFUXbN9vuM0eGVRbCnWPZ9uTrnicbmib7mY6Fuyz7ZMyw1Vqy/0', '1499415945');
INSERT INTO `user_info` VALUES ('354', '5f6de71c6d7302f7cc390a4ecf540a9bffe0a1b1', '愚者', 'http://wx.qlogo.cn/mmopen/mcMcDNjqbFc9Qp8poXicygiciaYmpvFAR51hvSwOdyxbZ1hyYDTtdliax3jVysgbjhqAEecAzJj2DpJy18UgExGVReLgylCZQmPO/0', '1499495059');
INSERT INTO `user_info` VALUES ('355', '9c4bd642d1a6bdb8f9ef6b10fb3a79288c0a824f', '其双', 'http://wx.qlogo.cn/mmopen/PwDXsF4t3oZZlj4iaPEgY5eYOKO5KlQNfpnw09dF61JowRUOPLFjj0j3vVTZDeUKExHx2VB2PvyuWplWAuHKeOMaV0DJjGycX/0', '1499610243');

-- ----------------------------
-- Table structure for user_spokesman_mapping
-- ----------------------------
DROP TABLE IF EXISTS `user_spokesman_mapping`;
CREATE TABLE `user_spokesman_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '代言人id',
  `bind_token` varchar(255) DEFAULT NULL COMMENT '用户id',
  `level` tinyint(1) DEFAULT NULL COMMENT '等级',
  `ctime` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='代言人邀请关系表';

-- ----------------------------
-- Records of user_spokesman_mapping
-- ----------------------------
INSERT INTO `user_spokesman_mapping` VALUES ('109', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '2', '1498996753');
INSERT INTO `user_spokesman_mapping` VALUES ('110', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '1', '1498996753');
INSERT INTO `user_spokesman_mapping` VALUES ('111', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '2', '1498996794');
INSERT INTO `user_spokesman_mapping` VALUES ('112', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1', '1498996794');
INSERT INTO `user_spokesman_mapping` VALUES ('113', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'e970ef250c37356236dd9338e12752d3c1673093', '2', '1498996923');
INSERT INTO `user_spokesman_mapping` VALUES ('114', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'e970ef250c37356236dd9338e12752d3c1673093', '1', '1498996923');
INSERT INTO `user_spokesman_mapping` VALUES ('115', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '98c9838398cb7164a2d0bb5d26241940de820fb7', '2', '1499000009');
INSERT INTO `user_spokesman_mapping` VALUES ('116', 'e970ef250c37356236dd9338e12752d3c1673093', '98c9838398cb7164a2d0bb5d26241940de820fb7', '1', '1499000009');
INSERT INTO `user_spokesman_mapping` VALUES ('117', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '64dabdc86ec8637e0c8b5b476181adf3f996f2b2', '2', '1499000077');
INSERT INTO `user_spokesman_mapping` VALUES ('118', 'e970ef250c37356236dd9338e12752d3c1673093', '64dabdc86ec8637e0c8b5b476181adf3f996f2b2', '1', '1499000077');
INSERT INTO `user_spokesman_mapping` VALUES ('119', 'e970ef250c37356236dd9338e12752d3c1673093', '650f4857ea8ee89d942f2e6f012453ee044052a1', '2', '1499000201');
INSERT INTO `user_spokesman_mapping` VALUES ('120', '98c9838398cb7164a2d0bb5d26241940de820fb7', '650f4857ea8ee89d942f2e6f012453ee044052a1', '1', '1499000201');
INSERT INTO `user_spokesman_mapping` VALUES ('121', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', '2', '1499000677');
INSERT INTO `user_spokesman_mapping` VALUES ('122', 'e970ef250c37356236dd9338e12752d3c1673093', 'bcca79d8a2e8be076c4bfd805c52be1ef944f209', '1', '1499000677');
INSERT INTO `user_spokesman_mapping` VALUES ('123', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '9a5811c861190523423222c7a23575e641db9edd', '2', '1499002772');
INSERT INTO `user_spokesman_mapping` VALUES ('124', 'e970ef250c37356236dd9338e12752d3c1673093', '9a5811c861190523423222c7a23575e641db9edd', '1', '1499002772');
INSERT INTO `user_spokesman_mapping` VALUES ('125', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'c049d629e80ab2a682b0153a56b7ea11a29c828b', '2', '1499003190');
INSERT INTO `user_spokesman_mapping` VALUES ('126', 'e970ef250c37356236dd9338e12752d3c1673093', 'c049d629e80ab2a682b0153a56b7ea11a29c828b', '1', '1499003190');
INSERT INTO `user_spokesman_mapping` VALUES ('127', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', '1da12901f1e76e30515e29d6b2c38060d13f2041', '2', '1499008070');
INSERT INTO `user_spokesman_mapping` VALUES ('128', 'e970ef250c37356236dd9338e12752d3c1673093', '1da12901f1e76e30515e29d6b2c38060d13f2041', '1', '1499008070');
INSERT INTO `user_spokesman_mapping` VALUES ('129', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '1eed9332d2d9bf5982d5f4a62616cb14dfa540be', '2', '1499068027');
INSERT INTO `user_spokesman_mapping` VALUES ('130', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '1eed9332d2d9bf5982d5f4a62616cb14dfa540be', '1', '1499068027');
INSERT INTO `user_spokesman_mapping` VALUES ('131', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '1', '1499244618');
INSERT INTO `user_spokesman_mapping` VALUES ('132', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '4e05a2341fef5e373341c667d61b37d056a5d781', '2', '1499316428');
INSERT INTO `user_spokesman_mapping` VALUES ('133', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '4e05a2341fef5e373341c667d61b37d056a5d781', '1', '1499316428');
INSERT INTO `user_spokesman_mapping` VALUES ('134', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '865edad126130b2a107ebf749518b48283062a02', '2', '1499316487');
INSERT INTO `user_spokesman_mapping` VALUES ('135', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '865edad126130b2a107ebf749518b48283062a02', '1', '1499316487');
INSERT INTO `user_spokesman_mapping` VALUES ('136', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '50917e27a2c9468227f53ebb06a306a82af44072', '2', '1499316849');
INSERT INTO `user_spokesman_mapping` VALUES ('137', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '50917e27a2c9468227f53ebb06a306a82af44072', '1', '1499316849');
INSERT INTO `user_spokesman_mapping` VALUES ('138', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'e5db07daca9f48c1931c696c6a1a14a93c2e82e0', '2', '1499317666');
INSERT INTO `user_spokesman_mapping` VALUES ('139', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'e5db07daca9f48c1931c696c6a1a14a93c2e82e0', '1', '1499317666');
INSERT INTO `user_spokesman_mapping` VALUES ('140', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '7a284bfb723e671c62c605520eba2850022ab564', '2', '1499317709');
INSERT INTO `user_spokesman_mapping` VALUES ('141', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '7a284bfb723e671c62c605520eba2850022ab564', '1', '1499317709');
INSERT INTO `user_spokesman_mapping` VALUES ('142', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'ea3212da984a3a6814059c873456f08d3b37b6b4', '2', '1499317769');
INSERT INTO `user_spokesman_mapping` VALUES ('143', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'ea3212da984a3a6814059c873456f08d3b37b6b4', '1', '1499317769');
INSERT INTO `user_spokesman_mapping` VALUES ('144', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'd6124d50682770e1afe72a04fc47b04aec91dbfe', '2', '1499318653');
INSERT INTO `user_spokesman_mapping` VALUES ('145', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'd6124d50682770e1afe72a04fc47b04aec91dbfe', '1', '1499318653');
INSERT INTO `user_spokesman_mapping` VALUES ('146', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '557d8054879b3f29957fdfa11e2264516197130a', '2', '1499318982');
INSERT INTO `user_spokesman_mapping` VALUES ('147', 'd6124d50682770e1afe72a04fc47b04aec91dbfe', '557d8054879b3f29957fdfa11e2264516197130a', '1', '1499318982');
INSERT INTO `user_spokesman_mapping` VALUES ('148', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '6c5249833ec795b65139000c7bdb26558446c157', '2', '1499319290');
INSERT INTO `user_spokesman_mapping` VALUES ('149', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '6c5249833ec795b65139000c7bdb26558446c157', '1', '1499319290');
INSERT INTO `user_spokesman_mapping` VALUES ('150', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', 'a136d5b94a764ec0c8e3d631b5b9ff43b6f6de9f', '2', '1499319363');
INSERT INTO `user_spokesman_mapping` VALUES ('151', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'a136d5b94a764ec0c8e3d631b5b9ff43b6f6de9f', '1', '1499319363');
INSERT INTO `user_spokesman_mapping` VALUES ('152', '78aefc5d028112baf32d9ae0ec447cc207542c8e', 'fff068fe5f28357b37a6f82e95b465bc1fa933e4', '2', '1499322299');
INSERT INTO `user_spokesman_mapping` VALUES ('153', 'd6124d50682770e1afe72a04fc47b04aec91dbfe', 'fff068fe5f28357b37a6f82e95b465bc1fa933e4', '1', '1499322299');
INSERT INTO `user_spokesman_mapping` VALUES ('158', '63dea156392b0a5ce01ca5e4ccd9bca4b30385f8', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '2', '1499415160');
INSERT INTO `user_spokesman_mapping` VALUES ('159', 'e970ef250c37356236dd9338e12752d3c1673093', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '1', '1499415160');
INSERT INTO `user_spokesman_mapping` VALUES ('160', 'e970ef250c37356236dd9338e12752d3c1673093', '81fc18ecac44ec9ebaab056b236a8159f007f40f', '2', '1499415945');
INSERT INTO `user_spokesman_mapping` VALUES ('161', 'd4e2b1a7e9ea42ade2886a626185ba3da79ce7af', '81fc18ecac44ec9ebaab056b236a8159f007f40f', '1', '1499415945');

-- ----------------------------
-- Table structure for user_tickling
-- ----------------------------
DROP TABLE IF EXISTS `user_tickling`;
CREATE TABLE `user_tickling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `desc` varchar(255) DEFAULT NULL COMMENT '反馈内容',
  `ctime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_tickling
-- ----------------------------
INSERT INTO `user_tickling` VALUES ('14', 'aa82d5891a57fd93f679e8a0b7140965c5ac1d57', '测试意见反馈', '1496455043');
INSERT INTO `user_tickling` VALUES ('15', 'e970ef250c37356236dd9338e12752d3c1673093', '我是商家，想给你们提供点商品', '1496455044');
INSERT INTO `user_tickling` VALUES ('16', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '需要优化，改进', '1496455045');
INSERT INTO `user_tickling` VALUES ('17', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '这是什么问题', '1496455046');
INSERT INTO `user_tickling` VALUES ('18', '9b4858060a5997e2369bbd16b34788c069e90d1d', '测试下', '1496455048');
INSERT INTO `user_tickling` VALUES ('19', '9b4858060a5997e2369bbd16b34788c069e90d1d', '查看下测试', '1496903754');
INSERT INTO `user_tickling` VALUES ('20', 'a5c38ee90159f047c9aa45cd4453d8e5effca76f', '您好，我在回答问题时没有办法录音上传请问是为什么？', '1498471619');

-- ----------------------------
-- Table structure for user_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `user_withdrawal`;
CREATE TABLE `user_withdrawal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `price` int(11) DEFAULT NULL COMMENT '提现金额',
  `tname` varchar(255) DEFAULT NULL COMMENT '提现真实姓名',
  `ctime` varchar(255) DEFAULT NULL COMMENT '申请时间',
  `ttime` varchar(255) DEFAULT NULL COMMENT '提现操作时间',
  `type` int(11) DEFAULT NULL COMMENT '提现分类 1营养提现  2佣金提现',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '商户提现订单号',
  `status` int(11) DEFAULT NULL COMMENT '提现处理状态 1=申请中 2=处理中 3=完成 4=失败金额不足 5=失败 6=微信错误',
  `payment_no` varchar(255) DEFAULT NULL COMMENT '微信企业付款成功订单号',
  `payment_time` varchar(255) DEFAULT NULL COMMENT '微信企业付款成功时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_withdrawal
-- ----------------------------
INSERT INTO `user_withdrawal` VALUES ('18', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '100', '周长江', '1498908353', '1498999093', '1', 'LB2017070220388686', '3', '1000018301201707028395922961', '1498999094');
INSERT INTO `user_withdrawal` VALUES ('22', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '1000', '陶运海', '1498997347', '1498998971', '1', 'LB2017070220368485', '3', '1000018301201707028396163266', '1498998972');
INSERT INTO `user_withdrawal` VALUES ('26', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '周长江', '1499001779', '1499001844', '1', 'LB2017070221241961', '3', '1000018301201707028396600686', '1499001845');
INSERT INTO `user_withdrawal` VALUES ('27', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '李房', '1499001954', '1499003047', '1', 'LB2017070221441970', '3', '1000018301201707028397011362', '1499003048');
INSERT INTO `user_withdrawal` VALUES ('30', '07da4cf5298d41d0bf6ef951846b5c80806248f5', '100', '周长江', '1499005491', '1499317753', '2', 'LB2017070613093258', '3', '1000018301201707068444156864', '1499317754');
INSERT INTO `user_withdrawal` VALUES ('31', '78aefc5d028112baf32d9ae0ec447cc207542c8e', '1100', '陶运海', '1499299570', '1499302472', '1', 'LB2017070608547737', '3', '1000018301201707068440969658', '1499302473');
INSERT INTO `user_withdrawal` VALUES ('32', '30252bf0d3083c77db0f79c06ef4d7687a7464cf', '1000', '周', '1499412194', null, '1', null, '1', null, null);
