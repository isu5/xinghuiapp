/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xh2188comcn

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-09 17:56:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tzht_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_admin`;
CREATE TABLE `tzht_admin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(40) NOT NULL COMMENT '密码',
  `email` varchar(80) NOT NULL DEFAULT '' COMMENT '邮箱',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `last_login_ip` varchar(15) DEFAULT '',
  `last_login_time` int(11) DEFAULT '0',
  `login_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tzht_admin
-- ----------------------------
INSERT INTO `tzht_admin` VALUES ('1', 'admin123', '1eea36fbd4f4919251e3192dce2da380', '', '', '1', '61.51.164.136', '1520563221', '250');
INSERT INTO `tzht_admin` VALUES ('2', 'ylnmp123', '8edae303e1cf6bdacef40e84a36ed7ce', 'zhangsan@qq.com', '', '1', '0.0.0.0', '1482720707', '8');
INSERT INTO `tzht_admin` VALUES ('14', 'admin22', '25f9e794323b453885f5181f1b624d0b', 'admin22@qq.com', '', '1', '111.199.25.75', '1502350333', '4');
INSERT INTO `tzht_admin` VALUES ('15', 'rzmanage', '7fef6171469e80d32c0559f88b377245', '123@qq.com', '认证管理', '1', '123.114.108.22', '1517394686', '7');

-- ----------------------------
-- Table structure for `tzht_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_admin_role`;
CREATE TABLE `tzht_admin_role` (
  `admin_id` mediumint(8) unsigned NOT NULL COMMENT '权限id',
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色id',
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of tzht_admin_role
-- ----------------------------
INSERT INTO `tzht_admin_role` VALUES ('1', '1');
INSERT INTO `tzht_admin_role` VALUES ('2', '2');
INSERT INTO `tzht_admin_role` VALUES ('14', '3');
INSERT INTO `tzht_admin_role` VALUES ('15', '4');

-- ----------------------------
-- Table structure for `tzht_advert`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_advert`;
CREATE TABLE `tzht_advert` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '广告标题',
  `bullurl` varchar(200) NOT NULL DEFAULT '' COMMENT '广告链接',
  `pic` varchar(100) NOT NULL DEFAULT '' COMMENT '广告图片',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `chick` mediumint(8) NOT NULL DEFAULT '50' COMMENT '浏览次数',
  `sort` mediumint(8) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` mediumint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of tzht_advert
-- ----------------------------
INSERT INTO `tzht_advert` VALUES ('1', '平台广告', 'https://m.huodongjia.com/event-347321424.html', '/./Uploads/2018/01/17/5a5ef9d882bd4.png', '1516173931', '50', '55', '1');
INSERT INTO `tzht_advert` VALUES ('2', '平台广告', 'https://m.huodongjia.com/event-417936950.html', '/./Uploads/2018/01/17/5a5efad4c3d70.png', '1516174042', '50', '55', '1');

-- ----------------------------
-- Table structure for `tzht_app_top`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_app_top`;
CREATE TABLE `tzht_app_top` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `app_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '引导页图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='引导页';

-- ----------------------------
-- Records of tzht_app_top
-- ----------------------------
INSERT INTO `tzht_app_top` VALUES ('4', 'https://m.huodongjia.com/event-1711781827.html', '/./Uploads/2018/01/17/5a5f056626e1b.jpg');
INSERT INTO `tzht_app_top` VALUES ('5', 'https://m.huodongjia.com/event-1711781827.html', '/./Uploads/2018/01/17/5a5f057ded657.jpg');
INSERT INTO `tzht_app_top` VALUES ('6', 'https://m.huodongjia.com/event-1711781827.html', '/./Uploads/2018/01/17/5a5f05933fc7a.jpg');

-- ----------------------------
-- Table structure for `tzht_bulletin`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_bulletin`;
CREATE TABLE `tzht_bulletin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '公告标题',
  `content` text NOT NULL COMMENT '公告内容',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '作者',
  `chick` mediumint(8) NOT NULL DEFAULT '50' COMMENT '浏览次数',
  `status` mediumint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='公告表';

-- ----------------------------
-- Records of tzht_bulletin
-- ----------------------------
INSERT INTO `tzht_bulletin` VALUES ('1', '2018 CBEC AI 中国人工智能发展应用峰会', '<p>2017公告01</p>', '1516182908', '', '50', '1');

-- ----------------------------
-- Table structure for `tzht_cate`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_cate`;
CREATE TABLE `tzht_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `catename` varchar(10) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议栏目表';

-- ----------------------------
-- Records of tzht_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `tzht_certify`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_certify`;
CREATE TABLE `tzht_certify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '认证id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `realname` varchar(10) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `idcard` char(18) NOT NULL DEFAULT '' COMMENT '身份证',
  `front` varchar(60) NOT NULL DEFAULT '' COMMENT '身份证正面图片',
  `back` varchar(60) NOT NULL DEFAULT '' COMMENT '身份证反面',
  `company` varchar(60) NOT NULL COMMENT '公司名称',
  `certificate` char(18) NOT NULL DEFAULT '' COMMENT '证件号码',
  `certificateimg` varchar(60) NOT NULL DEFAULT '' COMMENT '证件号码图片',
  `certtime` int(11) NOT NULL DEFAULT '0' COMMENT '认证时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1为个人认证，2为企业认证',
  `is_cert` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否认证,1为个人认证，2为企业认证，3为审核中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='个人认证表';

-- ----------------------------
-- Records of tzht_certify
-- ----------------------------
INSERT INTO `tzht_certify` VALUES ('2', '4', '', '', '', '', '北京同舟鸿图文化创意有限公司', '9111010758589247XH', '/./Uploads/Certificate/2018-01-17/5a5ec5c191f36.JPG', '1516160449', '2', '2');
INSERT INTO `tzht_certify` VALUES ('3', '14', '', '', '', '', '北京同舟鸿图文化创意有限公司', '9111010758589247XH', '/./Uploads/Certificate/2018-01-18/5a5ff7914a55d.jpg', '1516238737', '2', '4');
INSERT INTO `tzht_certify` VALUES ('10', '34', '', '', '', '', '北京中网深蓝技术有限公司', '911101070717459231', '/./Uploads/Certificate/2018-02-06/5a79484f00f92.jpg', '1517897577', '2', '2');
INSERT INTO `tzht_certify` VALUES ('12', '53', '', '', '', '', '北京水云舟文化创意有限公司', '110107018519145', '/./Uploads/Certificate/2018-02-09/5a7d7235152d4.jpg', '1518170677', '2', '2');

-- ----------------------------
-- Table structure for `tzht_chatgroup`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_chatgroup`;
CREATE TABLE `tzht_chatgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '群组id',
  `c_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群主id',
  `s_id` text COMMENT '群员集合id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '群组标题',
  `bulltitle` varchar(100) NOT NULL,
  `content` varchar(255) NOT NULL DEFAULT '未设置' COMMENT '群公告',
  `rongid` varchar(80) NOT NULL DEFAULT '' COMMENT '融云群组标识',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群组添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='群组表';

-- ----------------------------
-- Records of tzht_chatgroup
-- ----------------------------
INSERT INTO `tzht_chatgroup` VALUES ('3', '26', '4', '1596', '', '群组公告', '8d7fb5bb-1248-4bbd-93f6-c3558b732523', '1516950143');
INSERT INTO `tzht_chatgroup` VALUES ('8', '31', '22,21', '2018校友会', '', '群组公告', '0aaa0e69-9b3a-4b46-9e33-a4ea3d6b5a52', '1517806129');
INSERT INTO `tzht_chatgroup` VALUES ('10', '41', '51,50,49,48,46,45,44,43,42', '幸会小团队', '', '未设eerrt置', 'f939f733-c20c-4187-a8ec-27fc843eb1a8', '1518048115');
INSERT INTO `tzht_chatgroup` VALUES ('11', '45', '44,39', '开发部群组', '', '个人群组公告', '7c0afc35-9ee0-4e68-b76f-9b063dd8e627', '1518051477');
INSERT INTO `tzht_chatgroup` VALUES ('13', '45', '47,46,49,53', '2018AI智能', '', '', '9a58292d-3fd0-42a8-83d7-035f9ff3e007', '1519459973');
INSERT INTO `tzht_chatgroup` VALUES ('14', '45', '49,47,46,53', '2018人工智能', '', '未设置', '466fb602-ff0b-4906-a07a-78b79189229e', '1519605397');
INSERT INTO `tzht_chatgroup` VALUES ('15', '45', '49,47,46', '2018智能物联', '', '未设置', '26fc1c2a-00ac-430f-bd9c-99cac3a97faf', '1519614398');
INSERT INTO `tzht_chatgroup` VALUES ('16', '45', '47,46,53', '2018公众媒体', '', '未设置', 'd7e4a0d9-c6ff-4122-baf9-bde52006c86a', '1519885911');
INSERT INTO `tzht_chatgroup` VALUES ('17', '41', '51,50,49,48', '测试', '', '未设置', '9558e603-4b15-4459-9d62-6157e161cb2e', '1519907086');
INSERT INTO `tzht_chatgroup` VALUES ('18', '45', '47,46,53', '2018城市大脑', '', '未设置', 'cc58100c-5eb3-4ee4-866f-0fd11198b9ae', '1519957959');
INSERT INTO `tzht_chatgroup` VALUES ('19', '45', '47,46', '2018科技博览', '', '未设置', '7d0ecddb-4ead-481b-9464-b8a38355b6d8', '1520481504');
INSERT INTO `tzht_chatgroup` VALUES ('20', '41', '45,43,44', '技术组', '', '未设置', '2ad293fd-5be1-4908-a014-8f16592cdcc8', '1520559526');

-- ----------------------------
-- Table structure for `tzht_chatgroup_bull`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_chatgroup_bull`;
CREATE TABLE `tzht_chatgroup_bull` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '群组公告id',
  `chat_id` int(10) unsigned NOT NULL COMMENT '群组id',
  `title` varchar(100) NOT NULL COMMENT '群组标题',
  `bulltitle` varchar(100) NOT NULL DEFAULT '' COMMENT '群组标题',
  `pic` text NOT NULL,
  `file` text NOT NULL,
  `content` text,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '企业公告添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='群组公告表';

-- ----------------------------
-- Records of tzht_chatgroup_bull
-- ----------------------------
INSERT INTO `tzht_chatgroup_bull` VALUES ('30', '0', '2018人工智能', '2018人工智能', '[\"\\/Uploads\\/Companybull\\/20180301\\/1519886167\\/img_1519886104401.jpg\",\"\\/Uploads\\/Companybull\\/20180301\\/1519886167\\/img_1519886104468.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886167\\/A+Byte+of+Python-2.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886167\\/Android1_0_0-1.pdf\"]', '2018人工值得你', '1519886167');
INSERT INTO `tzht_chatgroup_bull` VALUES ('31', '0', '2018ai智能', '2018AI智能', '[\"\\/Uploads\\/Companybull\\/20180301\\/1519886227\\/img_1519886164506.jpg\",\"\\/Uploads\\/Companybull\\/20180301\\/1519886227\\/img_1519886164574.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886227\\/A+Byte+of+Python-2.pdf\"]', '2018AI智能', '1519886227');
INSERT INTO `tzht_chatgroup_bull` VALUES ('32', '0', '1qer', '2018公众媒体', 'null', 'null', 'rwww', '1519954573');
INSERT INTO `tzht_chatgroup_bull` VALUES ('33', '0', '588', '2018城市大脑', '[\"\\/Uploads\\/Companybull\\/20180302\\/1519957997\\/img_1519957929939.jpg\",\"\\/Uploads\\/Companybull\\/20180302\\/1519957997\\/img_1519957930012.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180302\\/1519957997\\/A+Byte+of+Python-2.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180302\\/1519957997\\/Android1_0_0-1.pdf\"]', '城市大脑', '1519957997');
INSERT INTO `tzht_chatgroup_bull` VALUES ('34', '0', '大家好！', '幸会小团队', '[\"\\/Uploads\\/Companybull\\/20180302\\/1519968251\\/img_1519968250301.jpg\"]', 'null', '测试公告', '1519968251');

-- ----------------------------
-- Table structure for `tzht_collection`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_collection`;
CREATE TABLE `tzht_collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `cid` int(10) unsigned NOT NULL COMMENT '会议id',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员收藏表';

-- ----------------------------
-- Records of tzht_collection
-- ----------------------------
INSERT INTO `tzht_collection` VALUES ('2', '45', '116', '1520588009');
INSERT INTO `tzht_collection` VALUES ('3', '45', '114', '1520588995');

-- ----------------------------
-- Table structure for `tzht_company_bull`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_company_bull`;
CREATE TABLE `tzht_company_bull` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '企业公告标题',
  `pic` text NOT NULL COMMENT '公共图片',
  `file` text NOT NULL COMMENT '上传文件',
  `bullurl` varchar(100) NOT NULL DEFAULT '' COMMENT '企业公告url',
  `content` text NOT NULL COMMENT '内容',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '企业公告添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='企业公告表';

-- ----------------------------
-- Records of tzht_company_bull
-- ----------------------------
INSERT INTO `tzht_company_bull` VALUES ('15', '22', 'fhh', '[\"\\/Uploads\\/Companybull\\/20180122\\/1516592680\\/img_1516592657661.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180122\\/1516592680\\/幸会后台管理系统数据库数据表结构.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180122\\/1516592680\\/IOS客户端功能修复(8月6日).docx\"]', '', 'ghh', '1516592680');
INSERT INTO `tzht_company_bull` VALUES ('16', '22', 'gg', '[\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592705831.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592705943.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592706027.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592706122.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592706182.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592706296.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180122\\/1516592732\\/幸会后台管理系统数据库数据表结构.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180122\\/1516592732\\/IOS客户端功能修复(8月6日).docx\"]', '', 'ggy', '1516592732');
INSERT INTO `tzht_company_bull` VALUES ('30', '30', '585', '[\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178039.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178152.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178223.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178273.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178327.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180130\\/1517283202\\/幸会后台管理系统数据库数据表结构.xlsx\"]', '', '填空呢', '1517283202');
INSERT INTO `tzht_company_bull` VALUES ('32', '31', '55', '[\"\\/Uploads\\/Companybull\\/20180130\\/1517305810\\/img_1517305779187.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517305810\\/img_1517305779320.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180130\\/1517305810\\/幸会后台管理系统数据库数据表结构.xlsx\"]', '', '啦啦啦', '1517305810');
INSERT INTO `tzht_company_bull` VALUES ('41', '21', '585', '[\"\\/Uploads\\/Companybull\\/20180203\\/1517652765\\/img_1517652738653.jpg\",\"\\/Uploads\\/Companybull\\/20180203\\/1517652765\\/img_1517652738773.jpg\",\"\\/Uploads\\/Companybull\\/20180203\\/1517652765\\/img_1517652738858.jpg\",\"\\/Uploads\\/Companybull\\/20180203\\/1517652765\\/img_1517652738970.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180203\\/1517652765\\/.dev_id.txt\",\"\\/Uploads\\/Companybull\\/file\\/20180203\\/1517652765\\/microlog.txt\"]', '', '599', '1517652765');
INSERT INTO `tzht_company_bull` VALUES ('43', '21', '5555', '[\"\\/Uploads\\/Companybull\\/20180205\\/1517793787\\/img_1517793707568.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517793787\\/img_1517793707716.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517793787\\/img_1517793707627.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517793787\\/img_1517793707859.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180205\\/1517793787\\/A+Byte+of+Python.pdf\"]', '', '8896', '1517793787');
INSERT INTO `tzht_company_bull` VALUES ('44', '34', '美景', '[\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517793973807.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517793979555.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517793997311.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517794001791.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517794006086.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517794011568.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517794017580.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517794022024.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517794071\\/img_1517794027193.jpg\"]', 'null', '', '心情的愉悦。', '1517794071');
INSERT INTO `tzht_company_bull` VALUES ('45', '25', '1.', '[\"\\/Uploads\\/Companybull\\/20180205\\/1517839462\\/img_1517839458498.jpg\",\"\\/Uploads\\/Companybull\\/20180205\\/1517839462\\/img_1517839463159.jpg\"]', 'null', '', '请大家注意时间！', '1517839462');
INSERT INTO `tzht_company_bull` VALUES ('46', '4', '企业公告标题123', '', '', '', '<p>企业公告标题123<br/></p>', '1517912582');
INSERT INTO `tzht_company_bull` VALUES ('47', '32', 'bdhdndj', 'null', 'null', '', 'hdjjd', '1517912742');
INSERT INTO `tzht_company_bull` VALUES ('48', '4', '默默无闻', 'null', 'null', '', '5454997', '1517913102');
INSERT INTO `tzht_company_bull` VALUES ('49', '4', '你也一样', '[\"\\/Uploads\\/Companybull\\/20180206\\/1517913156\\/img_1517913154806.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180206\\/1517913156\\/bmcclog20171211225210.txt\"]', '', '心热呀', '1517913156');
INSERT INTO `tzht_company_bull` VALUES ('53', '45', '5ｸﾞｯ!(๑•̀ㅂ•́)و✧', '[\"\\/Uploads\\/Companybull\\/20180301\\/1519885800\\/img_1519885716281.jpg\",\"\\/Uploads\\/Companybull\\/20180301\\/1519885800\\/img_1519885716344.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519885800\\/A+Byte+of+Python-2.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519885800\\/Android1_0_0.pdf\"]', '', '他他他8不', '1519885800');
INSERT INTO `tzht_company_bull` VALUES ('54', '45', '828822828', '[\"\\/Uploads\\/Companybull\\/20180301\\/1519885846\\/img_1519885782549.jpg\",\"\\/Uploads\\/Companybull\\/20180301\\/1519885846\\/img_1519885782612.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519885846\\/A+Byte+of+Python-2.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519885846\\/Android1_0_0-1.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519885846\\/Android1_0_0.pdf\"]', '', '夸夸土巴兔', '1519885846');
INSERT INTO `tzht_company_bull` VALUES ('55', '45', 'GDP的公告', '[\"\\/Uploads\\/Companybull\\/20180301\\/1519886035\\/img_1519885972699.jpg\",\"\\/Uploads\\/Companybull\\/20180301\\/1519886035\\/img_1519885972765.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886035\\/A+Byte+of+Python-2.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886035\\/Android1_0_0-1.pdf\"]', '', '4年么虎', '1519886035');
INSERT INTO `tzht_company_bull` VALUES ('56', '45', '我的工号', '[\"\\/Uploads\\/Companybull\\/20180301\\/1519886289\\/img_1519886226747.jpg\",\"\\/Uploads\\/Companybull\\/20180301\\/1519886289\\/img_1519886226817.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886289\\/A+Byte+of+Python-2.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886289\\/Android1_0_0-1.pdf\"]', '', '同步', '1519886289');
INSERT INTO `tzht_company_bull` VALUES ('60', '46', '公告', '[\"\\/Uploads\\/Companybull\\/20180302\\/1519958978\\/img_1519958986423.jpg\",\"\\/Uploads\\/Companybull\\/20180302\\/1519958978\\/img_1519958986613.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180302\\/1519958978\\/幸会后台管理系统数据库数据表结构-1.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180302\\/1519958978\\/幸会后台管理系统数据库数据表结构-2.xlsx\"]', '', '公告内容', '1519958978');
INSERT INTO `tzht_company_bull` VALUES ('65', '45', '2888828', '[\"\\/Uploads\\/Companybull\\/20180307\\/1520409107\\/img_1520409008621.jpg\",\"\\/Uploads\\/Companybull\\/20180307\\/1520409107\\/img_1520409008770.jpg\",\"\\/Uploads\\/Companybull\\/20180307\\/1520409107\\/img_1520409008869.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180307\\/1520409107\\/幸会APP系统用户手册.doc\",\"\\/Uploads\\/Companybull\\/file\\/20180307\\/1520409107\\/幸会APP系统需求分析说明书.doc\"]', '', '拉土不啊', '1520409107');
INSERT INTO `tzht_company_bull` VALUES ('66', '41', '注意点', 'null', '[\"\\/Uploads\\/Companybull\\/file\\/20180307\\/1520413186\\/03100160021177642829.pdf\"]', '', '附件中是文件', '1520413186');
INSERT INTO `tzht_company_bull` VALUES ('67', '41', '多文件', '[\"\\/Uploads\\/Companybull\\/20180307\\/1520413391\\/img_1520413384004.jpg\",\"\\/Uploads\\/Companybull\\/20180307\\/1520413391\\/img_1520413384052.jpg\",\"\\/Uploads\\/Companybull\\/20180307\\/1520413391\\/img_1520413384143.jpg\",\"\\/Uploads\\/Companybull\\/20180307\\/1520413391\\/img_1520413384209.jpg\",\"\\/Uploads\\/Companybull\\/20180307\\/1520413391\\/img_1520413384265.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180307\\/1520413391\\/03100160021177642829.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180307\\/1520413391\\/03100160021177642829(1).pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180307\\/1520413391\\/媒资信息管理系统操作手册.doc\",\"\\/Uploads\\/Companybull\\/file\\/20180307\\/1520413391\\/IOS客户端功能修复(8月6日).docx\"]', '', '多文件', '1520413391');
INSERT INTO `tzht_company_bull` VALUES ('71', '53', '业务联系', '', '', '', '<p style=\"line-height: 150%\"><span style=\"font-size:19px;line-height:150%;font-family:宋体\">&nbsp;</span><span style=\"font-size:20px;line-height:150%;font-family:宋体\">北京水云舟有文化创意限公司是专业从事平面设计、新媒体运营的专业机构，向各个行业提供面设计宣传方案及专业咨询服务。公司员工主要由高级及资深设计人员组成，具有很高的专业水准和业务素养。本公司拥有丰富创新精神、优秀的团队。这些优秀的人才使公司充满活力与生机。公司以创新求发展，本着“立足诚信、服务大众，以人为本”的企业宗旨，秉承“以客户为中心、变革创新、交流协作”的经营理念，弘扬“创新高效和谐共赢”的企业精神，以雄厚的技术实力为客户提供优质服务。</span></p><p><br/></p>', '1520573876');

-- ----------------------------
-- Table structure for `tzht_conference`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference`;
CREATE TABLE `tzht_conference` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '会议标题',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `etime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `qtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '签到时间',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '举办地址',
  `xxaddress` varchar(50) NOT NULL DEFAULT '' COMMENT '详细地址',
  `companypic` varchar(255) NOT NULL COMMENT '首页显示图片',
  `companyname` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `contact` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `downfile` text NOT NULL COMMENT '资料附件',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目id',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `scale` int(11) NOT NULL DEFAULT '0' COMMENT '会议规模',
  `is_user` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要审核参会人员，1为需要，2不需要',
  `statuses` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会议状态0开始，1结束',
  `agenda` text COMMENT '会议日程',
  `guests` text COMMENT '会议嘉宾姓名',
  `guide` text COMMENT '参会指南',
  `brief` text COMMENT '会议简介',
  `is_private` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否公开，0为公开，1为内部',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='会议表';

-- ----------------------------
-- Records of tzht_conference
-- ----------------------------
INSERT INTO `tzht_conference` VALUES ('32', 'GMIC 2018 北京 全球移动互联网大会', '2018-01-23 00:00:00', '2018-02-28 00:00:00', '2018-02-07 00:00:00', '北京北京市石景山区', '景阳宏昌', '[\"\\/Uploads\\/image\\/2018-01-30\\/5a6fbe9a723e0.jpg\"]', '北京同舟鸿图文化创意有限公司', 'Candy', '18810356923', '/Uploads/file/20180130/1517272730/A+Byte+of+Python.pdf###', '4', '2', '1516682898', '564', '1', '1', '', '', '', '<p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">亲爱的吉米客们（GMICers）：</strong></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">GMIC北京2017大会5万人参与的景象犹在眼前，GMIC北京2018又拉开了启动大幕。2018年4月26日-28日，我们又将相会在国家会议中心，共同见证中国<a href=\"https://m.huodongjia.com/tag/437/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">互联网</a>和<a href=\"https://m.huodongjia.com/tag/1192/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">科技</a>领域的进步与发展。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">站在AlphaGo Zero、量子技术、<a href=\"https://m.huodongjia.com/tag/17374/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">区块链</a>等各种新技术持续爆发的时代关口，我们有必要回顾一下中国互联网与科技的<a href=\"https://m.huodongjia.com/tag/926/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">历史</a>，从时代的角度来剖析中国互联网与科技的未来：<br/><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">1998年-2007年 中国PC互联网的黄金十年</strong></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">1998年，是中国互联网企业值得纪念的一年，这一年，腾讯、新浪、京东、搜狐都纷纷成立，奠定了中国互联网在全球市场的地位，直至今日，这些即将迎来20年诞辰的企业仍屹立在行业之巅。以网易、新浪、搜、腾讯为代表的“四大门户”共同拉开了中国互联网高速发展的帷幕，深刻影响了中国的<a href=\"https://m.huodongjia.com/tag/909/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">经济</a>、<a href=\"https://m.huodongjia.com/tag/1742/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">社会</a>的发展。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">2008年-2017年 中国<a href=\"https://m.huodongjia.com/tag/966/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">移动互联网</a>的黄金十年</strong></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">2008年，iPhone的入华标志着中国互联网进入到了移动互联网时代，微博、小米、微信、美团等明向企业纷纷崛起，成为大众的生活中不可缺少的重要工具。而随着移动互联网的崛起，在市场、资本等力量的共同作用下，中国互联网的发展也超越了欧美等传统科技强国，实现了从“copy to China”到“copy from China”的逆转，成就了新的全球经济奇迹。</p><p><br/></p>', '0', '0');
INSERT INTO `tzht_conference` VALUES ('96', '中网深蓝年会(2018.2.7)', '2018-02-07 15:00:00', '2018-02-07 18:33:00', '2018-02-07 15:30:00', '北京北京市石景山区', '景阳宏昌309', '[\"\\/Uploads\\/product\\/2018-02-07\\/5a7aa055290f7.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', '/Uploads/file/20180207/1517985881/A+Byte+of+Python.pdf###', '34', '3', '1517985886', '13', '1', '1', '', '', '', '<p><span style=\"color: rgb(51, 51, 51); font-family: \"Segoe UI\", \"Lucida Grande\", Helvetica, Arial, \"Microsoft YaHei\", FreeSans, Arimo, \"Droid Sans\", \"wenquanyi micro hei\", \"Hiragino Sans GB\", \"Hiragino Sans GB W3\", FontAwesome, sans-serif; font-size: 14px; font-weight: bold; text-align: center; background-color: rgb(255, 255, 255);\">会议简介</span></p>', '1', '5');
INSERT INTO `tzht_conference` VALUES ('106', '人工智能中国论坛2018', '2018-02-28 12:57:36', '2018-02-28 18:00:00', '2018-02-28 14:00:00', '山西省太原市其它区', '太原市高新区长治路226号高新动力港19层1902室', '[\"\\/Uploads\\/product\\/2018-02-28\\/5a96373bf290d.jpg\"]', '北京同舟鸿图文化创意有限公司', '李洪亮', '18810356923', '/Uploads/file/20180228/1519793984/A+Byte+of+Python.pdf###', '4', '2', '1519793999', '1213', '1', '1', '', '', '', '<p><span style=\"color: rgb(51, 51, 51); font-family: \">会议简介</span></p>', '0', '0');
INSERT INTO `tzht_conference` VALUES ('107', '2018区块链世界论坛（BlockChain World Forum）', '2018-02-28 15:28:33', '2018-02-28 18:00:00', '2018-02-28 17:00:00', '上海上海市长宁区', '长宁区延安西路1116号 ‎', '[\"\\/Uploads\\/product\\/2018-02-28\\/5a965a9d12c0f.jpg\"]', '北京同舟鸿图文化创意有限公司', '李洪亮', '18810356923', '', '4', '2', '1519803044', '432', '1', '1', '', '', '', '<p><span style=\"color: rgb(51, 51, 51); font-family: \"Segoe UI\", \"Lucida Grande\", Helvetica, Arial, \"Microsoft YaHei\", FreeSans, Arimo, \"Droid Sans\", \"wenquanyi micro hei\", \"Hiragino Sans GB\", \"Hiragino Sans GB W3\", FontAwesome, sans-serif; font-size: 14px; font-weight: 700; text-align: center; background-color: rgb(255, 255, 255);\">会议简介</span></p>', '0', '0');
INSERT INTO `tzht_conference` VALUES ('109', '第十四届中华易学大会暨2018中国智慧论坛', '2018-03-01 10:54:20', '2018-03-01 21:00:00', '2018-03-01 13:00:00', '四川省成都市其它区', '四川省成都市总府街31号', '[\"\\/Uploads\\/product\\/2018-03-01\\/5a976c0907ae6.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', '', '34', '8', '1519873040', '2563', '1', '1', '', '', '', '<p><span style=\"color: rgb(51, 51, 51); font-family: \"Segoe UI\", \"Lucida Grande\", Helvetica, Arial, \"Microsoft YaHei\", FreeSans, Arimo, \"Droid Sans\", \"wenquanyi micro hei\", \"Hiragino Sans GB\", \"Hiragino Sans GB W3\", FontAwesome, sans-serif; font-size: 14px; font-weight: 700; text-align: center; background-color: rgb(255, 255, 255);\">会议简介</span></p>', '0', '5');
INSERT INTO `tzht_conference` VALUES ('111', '2018自驾游大会 合.聚.变', '2018-03-05 16:02:00', '2018-03-07 16:02:00', '2018-03-06 16:02:00', '上海市上海市嘉定区', '白银路159号', '[\"\\/Uploads\\/Conference\\/20180305\\/1520237216\\/240.jpg\"]', '北京同舟鸿图文化创意有限公司', '李洪亮', '18810356923', '/Uploads/file/20180305/1520241311/幸会APP业务功能操作流程文档说明.docx###', '4', '2', '1520237216', '3094', '1', '1', '', '', '', '<p>会议链接</p>', '0', '4');
INSERT INTO `tzht_conference` VALUES ('112', '测试会议', '2018-03-08 13:25:00', '2018-03-09 13:25:00', '2018-03-08 13:25:00', '北京市北京市石景山区', '景阳', '[\"\\/Uploads\\/Conference\\/20180306\\/1520314077\\/magazine-unlock-05-2.3.909-_eac4ecc7a655425a8df1fe3b74a7414e.jpg\"]', '北京水云舟文化创意有限公司', '陈老师', '68656650', '', '53', '2', '1520314077', '1', '1', '1', null, null, null, '为了测试会议', '0', '36');
INSERT INTO `tzht_conference` VALUES ('114', 'GMIC 2018 北京 全球移动互联网大会', '2018-03-08 11:34:20', '2018-03-10 00:00:00', '2018-03-09 10:00:00', '北京北京市石景山区', '北京国家会议中心', '[\"\\/Uploads\\/product\\/2018-03-08\\/5aa0af68e1f21.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', '/Uploads/file/20180308/1520486278/幸会客户端接口文档.pdf###', '34', '2', '1520480137', '2000', '1', '0', '<p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(255, 255, 255); line-height: 24px; margin: 0px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(102, 102, 102); line-height: 24px; background-color: rgb(255, 140, 0); margin: 0px !important;\">G-Summit全球</span></strong></span><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; line-height: 24px; background-color: rgb(255, 140, 0); margin: 0px !important;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(255, 255, 255); line-height: 24px; margin: 0px !important;\">科学</span>创新峰会</span></strong></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">混沌世界，需要明火。蒙昧城墙，需要怯魅。 新普罗米修斯火种，将由 100 位顶尖科学家、创新企业领袖及前瞻投资人共同传递。 G-Summit是长城会推出的科学创新邀请制闭门峰会。大会将邀请人工智能、生物<a href=\"https://m.huodongjia.com/tag/1214/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">医药</a>、<a href=\"https://m.huodongjia.com/tag/993/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">材料</a>科学等前沿领域享有世界声誉的顶尖科学家汇聚一堂，共同预见未来。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">&nbsp;</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(255, 255, 255); line-height: 24px; margin: 0px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(102, 102, 102); line-height: 24px; background-color: rgb(255, 140, 0); margin: 0px !important;\">全球领袖峰会</span></strong></span></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">AI、<a href=\"https://m.huodongjia.com/tag/1018/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">环保</a>及其他技术的大爆发为人类社会带来了剧烈的冲击力，影响了人类社会的运转方式，也正在为长期以来棘手的重大问题（如重大疾病、环境、贫穷、<a href=\"https://m.huodongjia.com/tag/877/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">食品</a>安全等）带来全新的解决方案。未来它们将带领我们走向何处？全球走在科技最前端的企业家、科学家、投资者、创业公司领导者将带来对科技驱动下的未来的解读。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">&nbsp;</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(255, 255, 255); line-height: 24px; margin: 0px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(102, 102, 102); line-height: 24px; background-color: rgb(255, 140, 0); margin: 0px !important;\">全球未来娱乐峰会</span></strong></span></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">移动互联网思维改造下的游戏、<a href=\"https://m.huodongjia.com/tag/6955/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">影视</a>、文学、<a href=\"https://m.huodongjia.com/tag/865/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">动漫</a>、营销的模式互动，探讨移动互联网改变全球娱乐产业的新案例新成果，展现数字娱乐和全球化营销行业的新趋势。同期还颁发全球未来数字娱乐和全球化大奖。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">&nbsp;</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(255, 255, 255); line-height: 24px; margin: 0px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(102, 102, 102); line-height: 24px; background-color: rgb(255, 140, 0); margin: 0px !important;\">全球移动营销峰会</span></strong></span></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">新消费环境下，移动互联网致力于推动人、生活与商业的完美融合，以用户为本的新兴广告模式融合了最新的技术，最潮最In的创意，运用大数据，LBS的方式实现精准又有趣的营销触达，互动与效果的完美统一，推动智慧新生活、未来新商业的达成。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">&nbsp;</p><p><br/></p>', '<p><img src=\"http://pic.huodongjia.com/event/2018-02-23/1519366315.89.png\" alt=\"GMIC 2018 北京 全球移动互联网大会\"/></p>', '<h3 class=\"first_title\" style=\"padding: 0px; margin: 0px 0px 10px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; text-align: center; color: rgb(51, 51, 51); font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">-会议门票-</h3><table class=\"price-table table\" width=\"728\"><tbody style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\" class=\"firstRow\"><th style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">&nbsp;</p></th><th style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">VIP门票</p></th><th style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">金牌门票</p></th><th style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 121px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">银牌门票</p></th><th style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 122px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">展览门票</p></th><th style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><br/></th><th style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><br/></th></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">价格</strong></p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">￥15,000</strong></p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">￥10,000</strong></p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 121px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">￥3,000</strong></p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 122px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">￥200</strong></p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">VIP欢迎晚宴</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">VIP午餐</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">VIP休息室</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">主会场</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">所有分会场<span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(252, 190, 82); line-height: 24px; font-size: 12px; margin: 0px !important;\">(*1)</span></p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 121px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">展览区</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 121px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 122px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 200px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">App商务社交</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 133px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 121px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 122px; color: rgb(102, 102, 102); line-height: 24px; text-align: center; font-size: 14px !important;\">✔</p></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td><td style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><br/></td></tr><tr style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\"><td colspan=\"7\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; word-break: break-word;\" width=\"NaN\"><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 722px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">*1 不包括邀请制分会场及其他特殊说明的分会场</p><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 722px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">*2 VIP门票不参与打折</p><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 722px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">*3 展览门票不提供发票</p><p style=\"box-sizing: border-box; list-style: none; max-width: 768px; width: 722px; color: rgb(102, 102, 102); line-height: 24px; font-size: 14px !important;\">*4 关于GMIC大会门票，其中各项权益以（主办方）最终通知版为准。优惠码，胸卡的最终解释权归主办方长城会所有。</p></td></tr></tbody></table><h3 class=\"first_title\" style=\"padding: 0px; margin: 0px 0px 10px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; text-align: center; color: rgb(51, 51, 51); font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">-场馆介绍-</h3><p><img src=\"https://pic.huodongjia.com/event/2015-02-12/event1423713616.89.jpg\" width=\"200\" alt=\"北京国家会议中心\"/><span style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">北京国家会议中心</span></p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">交通指南：</p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">&nbsp; &nbsp; 首都国际机场 距酒店19.1公里 南苑机场 距酒店23.1公里 北京北站 距酒店7.1公里 北京火车站 距酒店11.2公里 北京西站 距酒店13.0公里 北京东火车站 距酒店13.5公里 北京南站 距酒店15.1公里</p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><br/></p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><br/></p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">国家会议中心位于鸟巢和水立方之北，是一座八层楼、近400米的长形建筑。2008年奥运会期间，由击剑馆、国际广播中心组成，主新闻中心（MPC）是文字记者和摄影记者进驻的工作区，共有1000多个记者工作席位及硬件配套设施。国际广播中心建筑面积14万平方米，是奥运会历史上最大的国际广播中心，来自全世界16000名广播记者都在此工作。 奥运之后，国家会议中心经过一年多的改造投入经营，至今已走过五年历程 ，创造了无数辉煌，这座曾经的奥运场馆正以骄人的成绩，成为中国乃至亚洲快速成长的会展业第一品牌 。大量具有国际影响力的会议 、展览项目陆续在国家会议中心成功举办，让这个中国会议业的旗舰场馆向世界展示了其多平台、复合型、高质量的强大综合实力，创造出了良好的经济效益和社会效益。 2014年11月5日—10日，来自21个经济体以及这 21个经济体以外的17个国家和地区的领导人、高级官员和工商界人士相继出席APEC会议周。国家会议中心作为本次APEC会议的“主力场馆”承担着为期7天的领导人会议周中6天的接待任务，为210场规模不等的会议和活动、165场餐饮和约9.1万人次提供了专业、细致、高效的会议服务。国家会议中心再次成为世界瞩目的焦点。国家会议中心借此成为一个重大外事国务活动的接待场所，也变成了世界级的会展品牌。 附近酒店：北京北辰洲际酒店、凯迪克·北京格兰云天大酒店、西藏大厦 交通：特13路新闻中心站下车 ，步行380米。</p><p><br/></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: \"Segoe UI\", \"Lucida Grande\", Helvetica, Arial, \"Microsoft YaHei\", FreeSans, Arimo, \"Droid Sans\", \"wenquanyi micro hei\", \"Hiragino Sans GB\", \"Hiragino Sans GB W3\", FontAwesome, sans-serif; font-size: 14px; font-weight: 700; text-align: center; background-color: rgb(255, 255, 255);\">会议简介</span></p>', '0', '58');
INSERT INTO `tzht_conference` VALUES ('115', 'GOPS 2018全球运维大会 • 深圳站', '2018-03-08 15:15:22', '2018-03-10 00:00:00', '2018-03-09 14:00:00', '浙江省杭州市萧山区', '萧绍路999号', '[\"\\/Uploads\\/product\\/2018-03-08\\/5aa0e35291f35.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', '/Uploads/file/20180308/1520493399/A+Byte+of+Python.pdf###', '34', '2', '1520493532', '2000', '0', '0', '<p><img src=\"/Uploads/ueditor/image/20180308/1520493430.jpg\" alt=\"GOPS 2018全球运维大会 • 深圳站\"/></p>', '', '<h3 class=\"first_title\" style=\"padding: 0px; margin: 0px 0px 10px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; text-align: center; color: rgb(51, 51, 51); font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">会议门票-</h3><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">大会标准票（4月13日-14日） ：3200元</strong></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">门票说明：</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">1、可参加4月13-14日所有的技术演讲；</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">2、含<a href=\"https://m.huodongjia.com/tag/892/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\"></a><a href=\"https://m.huodongjia.com/tag/892/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">酒店</a>价值600元的自助餐；</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">3、门票2张以上每张优惠100元</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><br/></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">会前精品课程（4月12日） ：3200元</strong><br/></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">门票说明：</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">1、可参加4月12日的全天深度课程。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">2、含餐。<br/></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">3、门票2张以上每张优惠100元</p><p><br/></p>', '<h3 class=\"first_title\" style=\"padding: 0px; margin: 0px 0px 10px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; text-align: center; color: rgb(51, 51, 51); font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">会议内容-</h3><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">GOPS 全球<a href=\"https://m.huodongjia.com/tag/1610/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">运维</a>大会由高效运维社区（GreatOPS）和开放运维联盟（OOPSA）联合主办，指导单位为工信部信通院数据中心联盟（DCA）。全球运维大会是国内第一个运维行业大会，面向<a href=\"https://m.huodongjia.com/tag/437/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">互联网</a>及传统行业、广大运维技术人员，传播先进技术思想和理念，分享业内最佳实践。</p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">迄今为止，GOPS 已经举行了八次，大会参会嘉宾累计突破2万人次，国内每一站均为本地区最大规模的高端运维盛会，满意度和推荐度高达95%以上。</p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><br/></p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><span style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; color: rgb(192, 0, 0); line-height: 24px; margin: 0px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">第九届 GOPS 全球运维大会将于2018年4月13日-14日在深圳召开。</strong></span>大会为期2天，侧重方向是&nbsp;<a href=\"https://m.huodongjia.com/tag/27998/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">AI</a>Ops、运维自动化和 DevOps。</p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><br/></p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">此外还有一些特色专场如：金牌运维专场、<a href=\"https://m.huodongjia.com/tag/969/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">大数据</a>运维专场、<a href=\"https://m.huodongjia.com/tag/807/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">金融</a>案例、基础<a href=\"https://m.huodongjia.com/tag/4863/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">架构</a>、运维管理及容器与微服务专场。</p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><br/></p><p style=\"padding: 0px; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">主要面向运维行业的中高端技术人员。目的在于为了帮助运维人员系统学习了解相关知识体系，让创新技术推动<a href=\"https://m.huodongjia.com/tag/1742/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration-line: none;\">社会</a>进步。你将会看到国内外知名企业的相关案例，也能与国内顶尖的技术专家探讨技术实践，使企业可以根据最佳实践确定自己的选型方案，并提前预估相关的风险和收益，实现技术落地。</p><p><br/></p>', '0', '5');
INSERT INTO `tzht_conference` VALUES ('116', '行业展', '2018-03-31 13:18:00', '2018-04-15 13:18:00', '2018-03-31 12:00:00', '北京市北京市石景山区', '格丹', '[\"\\/Uploads\\/Conference\\/20180309\\/1520572865\\/magazine-unlock-01-2.3.904-_8f60084eb5f142f89c3b1820ad419285.jpg\"]', '北京水云舟文化创意有限公司', '王经理', '18618249918', '/Uploads/file/20180309/1520572903/公司奖金政策.docx###/Uploads/file/20180309/1520572952/操作手册电子版.pdf###', '53', '2', '1520572865', '1', '0', '0', '', '', '', '<p>讨论行业发展</p>', '0', '19');

-- ----------------------------
-- Table structure for `tzht_conference_audit`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_audit`;
CREATE TABLE `tzht_conference_audit` (
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '审核标识，1为通过，2为不通过，3为审核中,4为已扫码签到参会中，5为结束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审核表';

-- ----------------------------
-- Records of tzht_conference_audit
-- ----------------------------
INSERT INTO `tzht_conference_audit` VALUES ('106', '45', '5');
INSERT INTO `tzht_conference_audit` VALUES ('106', '46', '5');
INSERT INTO `tzht_conference_audit` VALUES ('106', '47', '5');
INSERT INTO `tzht_conference_audit` VALUES ('109', '46', '5');
INSERT INTO `tzht_conference_audit` VALUES ('109', '45', '5');
INSERT INTO `tzht_conference_audit` VALUES ('111', '34', '5');
INSERT INTO `tzht_conference_audit` VALUES ('111', '46', '5');
INSERT INTO `tzht_conference_audit` VALUES ('112', '36', '5');
INSERT INTO `tzht_conference_audit` VALUES ('112', '41', '5');
INSERT INTO `tzht_conference_audit` VALUES ('112', '45', '5');
INSERT INTO `tzht_conference_audit` VALUES ('114', '46', '2');
INSERT INTO `tzht_conference_audit` VALUES ('114', '47', '1');
INSERT INTO `tzht_conference_audit` VALUES ('114', '45', '1');
INSERT INTO `tzht_conference_audit` VALUES ('114', '53', '3');
INSERT INTO `tzht_conference_audit` VALUES ('114', '40', '3');

-- ----------------------------
-- Table structure for `tzht_conference_auditlist`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_auditlist`;
CREATE TABLE `tzht_conference_auditlist` (
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '审核标识，3待审核，2待参加，5已结束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待参加待审核表';

-- ----------------------------
-- Records of tzht_conference_auditlist
-- ----------------------------
INSERT INTO `tzht_conference_auditlist` VALUES ('106', '45', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('106', '46', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('106', '47', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('109', '46', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('109', '45', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('111', '34', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('111', '46', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('112', '36', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('112', '41', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('112', '45', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('114', '46', '2');
INSERT INTO `tzht_conference_auditlist` VALUES ('114', '47', '1');
INSERT INTO `tzht_conference_auditlist` VALUES ('114', '45', '1');
INSERT INTO `tzht_conference_auditlist` VALUES ('114', '53', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('114', '40', '3');

-- ----------------------------
-- Table structure for `tzht_conference_bull`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_bull`;
CREATE TABLE `tzht_conference_bull` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '公告标题',
  `bullurl` varchar(100) NOT NULL DEFAULT '' COMMENT '公告url',
  `content` text NOT NULL COMMENT '内容',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公告添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='会议公告表';

-- ----------------------------
-- Records of tzht_conference_bull
-- ----------------------------
INSERT INTO `tzht_conference_bull` VALUES ('3', '32', '4', '会议公告', '', '<p><strong>公告通知</strong></p><p style=\"line-height: 16px;\"><img src=\"http://xh.2188.com.cn/Public/statics/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Uploads/ueditor/file/20180130/1517282928.pdf\" title=\"幸会.pdf\">幸会.pdf</a></p><p><img src=\"/Uploads/ueditor/image/20180130/1517282946.jpg\" title=\"1517282946.jpg\" alt=\"1516848854739.jpg\"/></p>', '1517282948');
INSERT INTO `tzht_conference_bull` VALUES ('4', '32', '4', '会议公告02', '', '<p><span style=\"color: rgb(255, 0, 0);\"><strong>会议公告通知</strong></span></p><p><span style=\"color: rgb(255, 0, 0);\"></span></p><p style=\"line-height: 16px;\"><img src=\"http://xh.2188.com.cn/Public/statics/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Uploads/ueditor/file/20180130/1517295110.pdf\" title=\"接口文档.pdf\">接口文档.pdf</a></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(85, 85, 85); font-family: \"microsoft yahei\"; line-height: 35px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: 14px;\">1、在C:\\User\\<用户名>\\.gradle 目录下<span style=\"font-size: 14px; color: rgb(79, 129, 189);\">新建</span>一个gradle.properties文件，并在里面添加一行：org.gradle.daemon=true</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(85, 85, 85); font-family: \"microsoft yahei\"; line-height: 35px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: 14px;\">2、打开AS，在Settings中设置<span style=\"font-size: 14px; color: rgb(255, 0, 0);\">Gradle</span>的工作模式为offline，如下图：</span></p><p><span style=\"color: rgb(255, 0, 0);\"><strong><img src=\"/Uploads/ueditor/image/20180130/1517295054.jpg\" title=\"1517295054.jpg\" alt=\"0034034824143467_b.jpg\" width=\"485\" height=\"324\"/></strong></span></p>', '1517295140');
INSERT INTO `tzht_conference_bull` VALUES ('5', '87', '34', '公告1', '', '<p>公告一</p>', '1517908478');
INSERT INTO `tzht_conference_bull` VALUES ('6', '94', '4', ' 公告01', '', '<p style=\"line-height: 16px;\"><img src=\"http://xh.2188.com.cn/Public/statics/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Uploads/ueditor/file/20180207/1517985522.pdf\" title=\"A+Byte+of+Python.pdf\">A+Byte+of+Python.pdf</a></p><p><img src=\"/Uploads/ueditor/image/20180207/1517985543.jpg\" title=\"1517985543.jpg\" alt=\"36.jpg\" width=\"532\" height=\"433\"/></p>', '1517985564');
INSERT INTO `tzht_conference_bull` VALUES ('7', '93', '4', ' 公告01', '', '<p style=\"line-height: 16px;\"><img src=\"http://xh.2188.com.cn/Public/statics/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Uploads/ueditor/file/20180207/1517985638.pdf\" title=\"A+Byte+of+Python.pdf\">A+Byte+of+Python.pdf</a></p><p><img src=\"/Uploads/ueditor/image/20180207/1517985658.jpg\" title=\"1517985658.jpg\" alt=\"240.jpg\"/></p>', '1517985660');
INSERT INTO `tzht_conference_bull` VALUES ('8', '96', '34', ' 公告01', '', '<p style=\"line-height: 16px;\"><img src=\"http://xh.2188.com.cn/Public/statics/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Uploads/ueditor/file/20180207/1517985938.pdf\" title=\"A+Byte+of+Python.pdf\">A+Byte+of+Python.pdf</a></p><p><img src=\"/Uploads/ueditor/image/20180207/1517985947.jpg\" title=\"1517985947.jpg\" alt=\"240.jpg\" width=\"510\" height=\"265\"/></p>', '1517985955');
INSERT INTO `tzht_conference_bull` VALUES ('9', '106', '4', '人工智能中国论坛2018', '', '<p><span style=\"color: rgb(141, 179, 226); font-size: 14px;\">成都总府皇冠假日酒店位处成都市总府街，坐落于各购物中心和办公大楼之间，毗邻春熙路商业圈、四川省展览馆、省市政府、时代广场、城市之心、冠城广场、中环广场、川信大厦等商务楼宇。地理位置优越，交通便利，距双流国际机场约40分钟车程、火车北站或东站20分钟车程，步行至天府广场只需10分钟。从酒店出发，您亦可直达新国际会展中心、城南高新科技园、武侯祠、锦里、杜甫草堂、寛窄巷子、<img src=\"http://img.baidu.com/hi/jx2/j_0020.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/>大熊猫繁育研究基等地标及旅游购物热点。 酒店楼高27层，设计堂皇华丽，环境宁谧舒适。共设客房402间，其中豪华套房62间。房间柔和的主调配以和鲜明的点缀，祥和中亦见朝气。宽阔的空间、惬意的卫浴间、舒适的豪华大床、视听器材、高速宽带网络等设施一应俱全。酒店特设“无烟楼层”和残障人士专用客房。入住行政楼层的住客，可于行政酒廊免费享用精美早餐、免费饮料及小吃，还可使用专属会议室及其他贵宾设施。让您尽享繁嚣商城中高雅温馨的悠然国度。 酒店拥有11个多功能会议厅及1个可容纳550人会议或400晚宴的豪华宴会厅。全部配备先进的音乐系统、视听投影器材及完善的会议设施，适合举办各类宴会活动及会议。</span></p><p style=\"line-height: 16px;\"><img src=\"http://xh.2188.com.cn/Public/statics/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Uploads/ueditor/file/20180301/1519873706.pdf\" title=\"A+Byte+of+Python.pdf\">A+Byte+of+Python.pdf</a></p><p><img src=\"/Uploads/ueditor/image/20180301/1519873719.jpg\" title=\"1519873719.jpg\" alt=\"240.jpg\" width=\"499\" height=\"303\"/></p>', '1519873840');

-- ----------------------------
-- Table structure for `tzht_conference_cate`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_cate`;
CREATE TABLE `tzht_conference_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `catename` varchar(10) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='会议栏目表';

-- ----------------------------
-- Records of tzht_conference_cate
-- ----------------------------
INSERT INTO `tzht_conference_cate` VALUES ('1', '0', '全部分类', '0');
INSERT INTO `tzht_conference_cate` VALUES ('2', '1', '信息技术', '0');
INSERT INTO `tzht_conference_cate` VALUES ('3', '1', '商业服务', '0');
INSERT INTO `tzht_conference_cate` VALUES ('4', '1', '金融保险', '0');
INSERT INTO `tzht_conference_cate` VALUES ('5', '1', '工程制造', '0');
INSERT INTO `tzht_conference_cate` VALUES ('6', '1', '交通运输', '0');
INSERT INTO `tzht_conference_cate` VALUES ('7', '1', '文化传媒', '0');
INSERT INTO `tzht_conference_cate` VALUES ('8', '1', '娱乐体育', '0');
INSERT INTO `tzht_conference_cate` VALUES ('9', '1', '公共事业', '0');
INSERT INTO `tzht_conference_cate` VALUES ('10', '1', '其他', '0');

-- ----------------------------
-- Table structure for `tzht_conference_del`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_del`;
CREATE TABLE `tzht_conference_del` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `deltime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='我的会议删除中间表';

-- ----------------------------
-- Records of tzht_conference_del
-- ----------------------------
INSERT INTO `tzht_conference_del` VALUES ('30', '45', '103', '1519268488');
INSERT INTO `tzht_conference_del` VALUES ('31', '45', '88', '1519271069');
INSERT INTO `tzht_conference_del` VALUES ('32', '45', '105', '1519280825');
INSERT INTO `tzht_conference_del` VALUES ('33', '45', '106', '1520228685');

-- ----------------------------
-- Table structure for `tzht_conference_focus`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_focus`;
CREATE TABLE `tzht_conference_focus` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `conf_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议发布者id',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,没有更新信息；1,企业用户信息更新',
  `ischat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是群组成员，0为新建，1为拉人入群'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 关注表（企业通讯录）';

-- ----------------------------
-- Records of tzht_conference_focus
-- ----------------------------
INSERT INTO `tzht_conference_focus` VALUES ('21', '11', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('21', '26', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('26', '4', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('29', '4', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('30', '4', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('27', '31', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('34', '4', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('27', '34', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('31', '21', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('31', '25', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('21', '33', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('31', '22', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('34', '27', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('25', '33', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('25', '1', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('25', '27', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('25', '34', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('33', '31', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('32', '4', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('22', '38', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('36', '25', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('36', '38', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('36', '27', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('21', '38', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('27', '33', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('31', '34', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('21', '31', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('38', '21', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('38', '36', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('40', '4', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '43', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '44', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '45', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '42', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '48', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '49', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '50', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '51', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '46', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '34', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('52', '41', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '52', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('53', '34', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('53', '41', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('45', '47', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '36', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('36', '41', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('41', '53', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('45', '53', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('45', '4', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('46', '45', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('4', '45', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('40', '34', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('53', '4', '0', '0');

-- ----------------------------
-- Table structure for `tzht_conference_pic`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_pic`;
CREATE TABLE `tzht_conference_pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '发布者id',
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '标题',
  `bullurl` varchar(100) NOT NULL DEFAULT '' COMMENT 'url',
  `pic` varchar(100) NOT NULL DEFAULT '' COMMENT '宣传图片',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='会议详情图片表';

-- ----------------------------
-- Records of tzht_conference_pic
-- ----------------------------
INSERT INTO `tzht_conference_pic` VALUES ('8', '4', '32', '产品标题', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '[\"\\/Uploads\\/conference\\/2018-02-02\\/5a74371401d05.jpg\"]', '1517565721');
INSERT INTO `tzht_conference_pic` VALUES ('9', '4', '94', '产品01', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html#', '[\"\\/Uploads\\/conference\\/2018-02-07\\/5a7a9e93c9d07.jpg\"]', '1517985428');
INSERT INTO `tzht_conference_pic` VALUES ('10', '4', '94', '产品02', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html#', '[\"\"]', '1517985466');
INSERT INTO `tzht_conference_pic` VALUES ('11', '4', '93', ' 产品01', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '[\"\\/Uploads\\/conference\\/2018-02-07\\/5a7a9f37ccf51.jpg\"]', '1517985592');
INSERT INTO `tzht_conference_pic` VALUES ('12', '4', '94', ' 产品02', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '[\"\\/Uploads\\/conference\\/2018-02-07\\/5a7a9f4df0819.jpg\"]', '1517985615');
INSERT INTO `tzht_conference_pic` VALUES ('13', '34', '95', '产品02', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '[\"\\/Uploads\\/conference\\/2018-02-07\\/5a7aa012e616f.jpg\"]', '1517985811');
INSERT INTO `tzht_conference_pic` VALUES ('14', '34', '96', '产品01', ' http://xh.2188.com.cn/index.php/Admin/Index/index.html', '[\"\\/Uploads\\/conference\\/2018-02-07\\/5a7aa075acd9c.jpg\"]', '1517985915');
INSERT INTO `tzht_conference_pic` VALUES ('16', '4', '102', '2', 'https://www.dianping.com/search/keyword/2/0_%E6%A0%BC%E4%B8%B9%E8%BD%B0%E8%B6%B4%E9%A6%86', '[\"\\/Uploads\\/conference\\/2018-02-07\\/5a7adb11cbde2.jpg\"]', '1518000915');
INSERT INTO `tzht_conference_pic` VALUES ('17', '4', '102', '3', 'https://www.dianping.com/search/keyword/2/0_%E6%A0%BC%E4%B8%B9%E8%BD%B0%E8%B6%B4%E9%A6%86', '[\"\\/Uploads\\/conference\\/2018-02-07\\/5a7adb2c4a18f.jpg\"]', '1518000941');
INSERT INTO `tzht_conference_pic` VALUES ('18', '4', '102', '3', 'https://www.dianping.com/search/keyword/2/0_%E6%A0%BC%E4%B8%B9%E8%BD%B0%E8%B6%B4%E9%A6%86', '[\"\\/Uploads\\/conference\\/2018-02-07\\/5a7adb71ae248.jpg\"]', '1518001010');
INSERT INTO `tzht_conference_pic` VALUES ('19', '34', '109', '第十四届中华易学大会暨2018中国智慧论坛', 'http://xh.2188.com.cn', '[\"\\/Uploads\\/conference\\/2018-03-01\\/5a976cf0b2ce3.jpg\"]', '1519873265');
INSERT INTO `tzht_conference_pic` VALUES ('20', '4', '106', '北京同舟鸿图文化创意有限公司', 'http://xh.2188.com.cn', '[\"\\/Uploads\\/conference\\/2018-03-01\\/5a976f641df27.jpg\"]', '1519873893');
INSERT INTO `tzht_conference_pic` VALUES ('21', '4', '106', '北京同舟鸿图文化创意有限公司 / 冬日之恋', 'http://xh.2188.com.cn', '[\"\\/Uploads\\/conference\\/2018-03-01\\/5a976f7b4dbd8.jpg\"]', '1519873915');

-- ----------------------------
-- Table structure for `tzht_conference_sign`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_sign`;
CREATE TABLE `tzht_conference_sign` (
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签到表';

-- ----------------------------
-- Records of tzht_conference_sign
-- ----------------------------
INSERT INTO `tzht_conference_sign` VALUES ('3', '12');
INSERT INTO `tzht_conference_sign` VALUES ('2', '21');
INSERT INTO `tzht_conference_sign` VALUES ('32', '26');
INSERT INTO `tzht_conference_sign` VALUES ('1', '26');
INSERT INTO `tzht_conference_sign` VALUES ('30', '21');
INSERT INTO `tzht_conference_sign` VALUES ('1', '21');
INSERT INTO `tzht_conference_sign` VALUES ('34', '21');
INSERT INTO `tzht_conference_sign` VALUES ('1', '26');
INSERT INTO `tzht_conference_sign` VALUES ('35', '21');
INSERT INTO `tzht_conference_sign` VALUES ('32', '30');
INSERT INTO `tzht_conference_sign` VALUES ('50', '32');
INSERT INTO `tzht_conference_sign` VALUES ('52', '21');
INSERT INTO `tzht_conference_sign` VALUES ('36', '21');
INSERT INTO `tzht_conference_sign` VALUES ('50', '21');
INSERT INTO `tzht_conference_sign` VALUES ('49', '21');
INSERT INTO `tzht_conference_sign` VALUES ('53', '21');
INSERT INTO `tzht_conference_sign` VALUES ('49', '27');
INSERT INTO `tzht_conference_sign` VALUES ('50', '27');
INSERT INTO `tzht_conference_sign` VALUES ('54', '21');
INSERT INTO `tzht_conference_sign` VALUES ('55', '21');
INSERT INTO `tzht_conference_sign` VALUES ('55', '31');
INSERT INTO `tzht_conference_sign` VALUES ('49', '33');
INSERT INTO `tzht_conference_sign` VALUES ('50', '33');
INSERT INTO `tzht_conference_sign` VALUES ('57', '31');
INSERT INTO `tzht_conference_sign` VALUES ('59', '21');
INSERT INTO `tzht_conference_sign` VALUES ('58', '21');
INSERT INTO `tzht_conference_sign` VALUES ('59', '27');
INSERT INTO `tzht_conference_sign` VALUES ('58', '27');
INSERT INTO `tzht_conference_sign` VALUES ('61', '21');
INSERT INTO `tzht_conference_sign` VALUES ('60', '21');
INSERT INTO `tzht_conference_sign` VALUES ('60', '31');
INSERT INTO `tzht_conference_sign` VALUES ('62', '21');
INSERT INTO `tzht_conference_sign` VALUES ('63', '21');
INSERT INTO `tzht_conference_sign` VALUES ('63', '33');
INSERT INTO `tzht_conference_sign` VALUES ('62', '33');
INSERT INTO `tzht_conference_sign` VALUES ('62', '27');
INSERT INTO `tzht_conference_sign` VALUES ('69', '21');
INSERT INTO `tzht_conference_sign` VALUES ('69', '31');
INSERT INTO `tzht_conference_sign` VALUES ('69', '33');
INSERT INTO `tzht_conference_sign` VALUES ('71', '31');
INSERT INTO `tzht_conference_sign` VALUES ('71', '21');
INSERT INTO `tzht_conference_sign` VALUES ('72', '21');
INSERT INTO `tzht_conference_sign` VALUES ('87', '35');
INSERT INTO `tzht_conference_sign` VALUES ('88', '35');
INSERT INTO `tzht_conference_sign` VALUES ('32', '21');
INSERT INTO `tzht_conference_sign` VALUES ('89', '21');
INSERT INTO `tzht_conference_sign` VALUES ('90', '21');
INSERT INTO `tzht_conference_sign` VALUES ('91', '21');
INSERT INTO `tzht_conference_sign` VALUES ('92', '36');
INSERT INTO `tzht_conference_sign` VALUES ('93', '27');
INSERT INTO `tzht_conference_sign` VALUES ('94', '27');
INSERT INTO `tzht_conference_sign` VALUES ('94', '33');
INSERT INTO `tzht_conference_sign` VALUES ('93', '33');
INSERT INTO `tzht_conference_sign` VALUES ('94', '21');
INSERT INTO `tzht_conference_sign` VALUES ('93', '21');
INSERT INTO `tzht_conference_sign` VALUES ('96', '39');
INSERT INTO `tzht_conference_sign` VALUES ('97', '21');
INSERT INTO `tzht_conference_sign` VALUES ('100', '21');
INSERT INTO `tzht_conference_sign` VALUES ('100', '40');
INSERT INTO `tzht_conference_sign` VALUES ('100', '22');
INSERT INTO `tzht_conference_sign` VALUES ('101', '22');
INSERT INTO `tzht_conference_sign` VALUES ('101', '21');
INSERT INTO `tzht_conference_sign` VALUES ('101', '40');
INSERT INTO `tzht_conference_sign` VALUES ('102', '33');
INSERT INTO `tzht_conference_sign` VALUES ('102', '51');
INSERT INTO `tzht_conference_sign` VALUES ('102', '41');
INSERT INTO `tzht_conference_sign` VALUES ('102', '45');
INSERT INTO `tzht_conference_sign` VALUES ('102', '49');
INSERT INTO `tzht_conference_sign` VALUES ('102', '42');
INSERT INTO `tzht_conference_sign` VALUES ('103', '45');
INSERT INTO `tzht_conference_sign` VALUES ('104', '45');
INSERT INTO `tzht_conference_sign` VALUES ('105', '45');
INSERT INTO `tzht_conference_sign` VALUES ('106', '45');
INSERT INTO `tzht_conference_sign` VALUES ('106', '46');
INSERT INTO `tzht_conference_sign` VALUES ('109', '46');
INSERT INTO `tzht_conference_sign` VALUES ('112', '36');

-- ----------------------------
-- Table structure for `tzht_del_jgpush`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_del_jgpush`;
CREATE TABLE `tzht_del_jgpush` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `jp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '平台消息id',
  `deltime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='平台消息删除中间表';

-- ----------------------------
-- Records of tzht_del_jgpush
-- ----------------------------
INSERT INTO `tzht_del_jgpush` VALUES ('18', '21', '5', '1517655105');
INSERT INTO `tzht_del_jgpush` VALUES ('19', '31', '6', '1517655195');
INSERT INTO `tzht_del_jgpush` VALUES ('20', '21', '6', '1517660458');
INSERT INTO `tzht_del_jgpush` VALUES ('21', '34', '5', '1517792029');
INSERT INTO `tzht_del_jgpush` VALUES ('22', '34', '6', '1517792031');
INSERT INTO `tzht_del_jgpush` VALUES ('23', '27', '7', '1517825842');
INSERT INTO `tzht_del_jgpush` VALUES ('24', '27', '6', '1517825845');
INSERT INTO `tzht_del_jgpush` VALUES ('25', '25', '7', '1517830596');
INSERT INTO `tzht_del_jgpush` VALUES ('26', '25', '6', '1517830599');
INSERT INTO `tzht_del_jgpush` VALUES ('27', '25', '5', '1517830601');
INSERT INTO `tzht_del_jgpush` VALUES ('28', '33', '7', '1517899691');
INSERT INTO `tzht_del_jgpush` VALUES ('29', '35', '7', '1517908164');
INSERT INTO `tzht_del_jgpush` VALUES ('30', '35', '6', '1517908168');
INSERT INTO `tzht_del_jgpush` VALUES ('31', '35', '5', '1517908170');
INSERT INTO `tzht_del_jgpush` VALUES ('32', '41', '13', '1518048200');
INSERT INTO `tzht_del_jgpush` VALUES ('33', '41', '7', '1518048204');
INSERT INTO `tzht_del_jgpush` VALUES ('34', '41', '6', '1518048207');
INSERT INTO `tzht_del_jgpush` VALUES ('35', '41', '5', '1518048210');
INSERT INTO `tzht_del_jgpush` VALUES ('36', '0', '5', '1519262088');
INSERT INTO `tzht_del_jgpush` VALUES ('37', '45', '5', '1519372750');
INSERT INTO `tzht_del_jgpush` VALUES ('38', '45', '6', '1520243336');
INSERT INTO `tzht_del_jgpush` VALUES ('39', '45', '7', '1520497015');

-- ----------------------------
-- Table structure for `tzht_download`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_download`;
CREATE TABLE `tzht_download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '标题',
  `downfile` varchar(1000) NOT NULL DEFAULT '' COMMENT '文件资料',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='企业资料表';

-- ----------------------------
-- Records of tzht_download
-- ----------------------------
INSERT INTO `tzht_download` VALUES ('2', '4', '企业交流会资料', '[\"\\/Uploads\\/file\\/20180129\\/1517207441\\/A+Byte+of+Python.pdf\"]', '1517207442');
INSERT INTO `tzht_download` VALUES ('3', '34', '产品已', '[\"\\/Uploads\\/file\\/20180206\\/1517910979\\/42类.docx\"]', '1517910987');
INSERT INTO `tzht_download` VALUES ('4', '53', '新媒体案例', '[\"\\/Uploads\\/file\\/20180309\\/1520574019\\/2018年1月份策划.xls\",\"\\/Uploads\\/file\\/20180309\\/1520574019\\/水云舟媒体制作报价.xlsx\"]', '1520574022');

-- ----------------------------
-- Table structure for `tzht_jgpush`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_jgpush`;
CREATE TABLE `tzht_jgpush` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '推送标题',
  `content` text COMMENT '推送内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推送标识',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='极光推送消息表';

-- ----------------------------
-- Records of tzht_jgpush
-- ----------------------------
INSERT INTO `tzht_jgpush` VALUES ('5', '2018年1月30日天气情况', '北京今天  晴间多云，偏北风3级  5/-6°。', '0', '1517301679');
INSERT INTO `tzht_jgpush` VALUES ('6', '2018年1月31日天气情况', '2018年1月30日天气情况', '1', '1517301844');
INSERT INTO `tzht_jgpush` VALUES ('7', '2018年1月31日天气情况', '2018年1月31日天气情况', '1', '1517301946');
INSERT INTO `tzht_jgpush` VALUES ('13', ' 2018年2月8日天气情况	', '北京今天 晴间多云，偏北风3级 5/-6°。', '1', '1517997749');

-- ----------------------------
-- Table structure for `tzht_jgpushperson`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_jgpushperson`;
CREATE TABLE `tzht_jgpushperson` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `conf_id` int(11) NOT NULL COMMENT '会议id',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '推送标题',
  `content` text COMMENT '推送内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推送标识',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='极光推送个人消息表';

-- ----------------------------
-- Records of tzht_jgpushperson
-- ----------------------------
INSERT INTO `tzht_jgpushperson` VALUES ('5', '0', '22', 'wr', 'r', '0', '1516585741');
INSERT INTO `tzht_jgpushperson` VALUES ('7', '0', '22', 'afa', 'af', '0', '1516592614');
INSERT INTO `tzht_jgpushperson` VALUES ('8', '0', '26', '176', '176', '0', '1516760320');
INSERT INTO `tzht_jgpushperson` VALUES ('10', '0', '26', '176', '176', '0', '1516947201');
INSERT INTO `tzht_jgpushperson` VALUES ('19', '0', '31', '同州 / 阳谷躺哈虎 参会中', '同州 / 阳谷躺哈虎 参会中', '0', '1517658465');
INSERT INTO `tzht_jgpushperson` VALUES ('20', '0', '34', '签到代表注意须知', '同舟鸿图签到代表刘为国先生，请您于2月5日到会场签到，请短信姓名+单位+职位发送至18911936236，没有回复着视为放弃此次会议，谢谢！', '0', '1517793685');
INSERT INTO `tzht_jgpushperson` VALUES ('21', '0', '34', '同舟鸿图签到代表须知', '同舟鸿图刘为国先生，欢迎光临本次盛会，请您于2月6日上午9时前发送确认短信到18911936236，短信内容：单位+姓名+职位，便于我们会务统计，未发送者，我们视为自动放弃参会，谢谢！', '0', '1517793897');
INSERT INTO `tzht_jgpushperson` VALUES ('22', '0', '31', '12', '12', '0', '1517799969');
INSERT INTO `tzht_jgpushperson` VALUES ('23', '0', '31', '21', '3', '0', '1517799976');
INSERT INTO `tzht_jgpushperson` VALUES ('24', '0', '35', '欢迎团队成员', '欢迎参加年会', '0', '1517908099');
INSERT INTO `tzht_jgpushperson` VALUES ('25', '0', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋 2018.2.6', 'pushJson', '0', '1517911662');
INSERT INTO `tzht_jgpushperson` VALUES ('26', '0', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋 2018.2.6', '北京同舟鸿图文化创意有限公司 / 冬日之恋 2018.2.6', '0', '1517911710');
INSERT INTO `tzht_jgpushperson` VALUES ('27', '0', '21', '旭日123', '旭日123', '0', '1517969414');
INSERT INTO `tzht_jgpushperson` VALUES ('28', '0', '33', '推送测试20180207', '推送测试20180207', '0', '1517988320');
INSERT INTO `tzht_jgpushperson` VALUES ('29', '0', '21', '冬日之恋', '冬日之恋', '0', '1517988713');
INSERT INTO `tzht_jgpushperson` VALUES ('30', '0', '21', '冬日之恋', '冬日之恋', '0', '1517988721');
INSERT INTO `tzht_jgpushperson` VALUES ('31', '0', '21', '冬日之恋 2018.2.7 10：08冬日之恋', '冬日之恋 2018.2.7 10：08冬日之恋', '0', '1517988740');
INSERT INTO `tzht_jgpushperson` VALUES ('32', '0', '21', 'a', '啊vv', '0', '1517994615');
INSERT INTO `tzht_jgpushperson` VALUES ('33', '0', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '0', '1517997394');
INSERT INTO `tzht_jgpushperson` VALUES ('34', '0', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '0', '1517997405');
INSERT INTO `tzht_jgpushperson` VALUES ('35', '0', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '0', '1517997426');
INSERT INTO `tzht_jgpushperson` VALUES ('36', '0', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '0', '1517997656');
INSERT INTO `tzht_jgpushperson` VALUES ('39', '0', '41', '春节快乐！', '春节快乐！', '0', '1519352496');
INSERT INTO `tzht_jgpushperson` VALUES ('40', '0', '45', '1', '1', '0', '1519365160');
INSERT INTO `tzht_jgpushperson` VALUES ('47', '0', '45', 'r', 'r', '0', '1519432278');
INSERT INTO `tzht_jgpushperson` VALUES ('48', '0', '45', 'r', 'r', '0', '1519432297');
INSERT INTO `tzht_jgpushperson` VALUES ('52', '0', '45', 'r', 'r', '0', '1519434258');
INSERT INTO `tzht_jgpushperson` VALUES ('53', '0', '45', 'r', 'r', '0', '1519434295');
INSERT INTO `tzht_jgpushperson` VALUES ('55', '0', '45', 'f', 'f', '0', '1519434350');
INSERT INTO `tzht_jgpushperson` VALUES ('59', '0', '45', 't', 't', '0', '1519434576');
INSERT INTO `tzht_jgpushperson` VALUES ('68', '0', '45', 'f', 'f', '0', '1519435697');
INSERT INTO `tzht_jgpushperson` VALUES ('108', '0', '45', '/ tzhtlhl2018', '/ tzhtlhl2018', '0', '1519793704');
INSERT INTO `tzht_jgpushperson` VALUES ('111', '0', '46', '以色列，特拉维夫希尔顿酒店', '以色列，特拉维夫希尔顿酒店', '0', '1519874013');
INSERT INTO `tzht_jgpushperson` VALUES ('113', '0', '36', '欢迎词！', '欢迎中网深蓝科技有限公司！', '0', '1520318138');
INSERT INTO `tzht_jgpushperson` VALUES ('114', '0', '45', 'zao', 'zao', '0', '1520558865');
INSERT INTO `tzht_jgpushperson` VALUES ('115', '0', '41', 'zao', 'zao', '0', '1520558881');

-- ----------------------------
-- Table structure for `tzht_log`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_log`;
CREATE TABLE `tzht_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `login_time` int(11) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `logout_time` int(11) NOT NULL DEFAULT '0' COMMENT '注销时间',
  `login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '登录ip',
  `logout_address` varchar(60) NOT NULL DEFAULT '' COMMENT '地址',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '登录类型，1.pc,2.app端',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '登录退出标识，1.登录,2.退出',
  `version_no` varchar(15) NOT NULL DEFAULT '' COMMENT '版本号',
  `appinfo` varchar(60) NOT NULL DEFAULT '' COMMENT '手机设备信息',
  `log` text COMMENT '登录信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1352 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
-- Records of tzht_log
-- ----------------------------
INSERT INTO `tzht_log` VALUES ('2', '1', '1516156446', '0', '123.114.109.192', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****6923/18810356923您好！您使用了电脑2018-01-17 10:06登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('3', '49', '1516157273', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.0.2', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('4', '4', '1516160331', '0', '123.114.109.192', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-17 11:51登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('5', '3', '1516160728', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('6', '3', '1516160987', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('7', '4', '1516161349', '0', '123.114.109.192', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-17 11:49登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('8', '5', '1516161403', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('9', '6', '1516161451', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('10', '4', '1516161523', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('11', '5', '1516161599', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('12', '6', '1516161824', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('13', '5', '1516165508', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('14', '4', '1516165531', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('15', '6', '1516165897', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('16', '8', '1516167574', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('17', '9', '1516169260', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('18', '2', '1516179547', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.2', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('19', '2', '1516179550', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.2', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('20', '2', '1516179554', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.2', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('21', '2', '1516179554', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.2', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('22', '4', '1516180030', '0', '10.171.174.93', '中国-北京-北京', '0', '2', '2', '2.0.2', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('23', '4', '1516180287', '0', '10.171.174.93', '中国-北京-北京', '0', '2', '2', '2.0.2', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('24', '6', '1516180907', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('25', '13', '1516181041', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('26', '13', '1516182643', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('27', '6', '1516182672', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('28', '4', '1516184370', '0', '123.114.109.192', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-17 18:30登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('29', '13', '1516184437', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('30', '4', '1516236574', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('31', '4', '1516237528', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 09:28登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('32', '12', '1516238483', '0', '192.168.0.128', '中国-北京-北京', '0', '2', '2', '2.0.3', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('33', '4', '1516238832', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 09:12登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('34', '4', '1516241047', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 10:07登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('35', '4', '1516241275', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 10:55登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('36', '4', '1516241332', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 10:52登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('37', '14', '1516241380', '0', '192.168.0.128', '中国-北京-北京', '0', '2', '2', '2.0.3', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('38', '4', '1516241857', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 10:37登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('39', '4', '1516242585', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 10:45登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('40', '16', '1516242770', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('41', '17', '1516243292', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('42', '18', '1516243450', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('43', '18', '1516243474', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('44', '19', '1516243833', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('45', '13', '1516245025', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('46', '19', '1516246443', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('47', '20', '1516246533', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('48', '11', '1516256985', '0', '192.168.3.186', '中国-北京-北京', '0', '2', '2', '2.0.3', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('49', '4', '1516260226', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 15:46登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('50', '21', '1516262362', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('51', '22', '1516262373', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('52', '21', '1516262530', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('53', '22', '1516262533', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('54', '21', '1516262566', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('55', '22', '1516262634', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('56', '21', '1516262637', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('57', '22', '1516262670', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('58', '21', '1516262900', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('59', '12', '1516266177', '0', '192.168.0.128', '中国-北京-北京', '0', '2', '2', '2.0.3', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('60', '4', '1516266284', '0', '125.33.88.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-18 17:44登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('61', '23', '1516266551', '0', '192.168.0.128', '中国-北京-北京', '0', '2', '2', '2.0.3', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('62', '4', '1516325765', '0', '125.33.74.234', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-19 09:05登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('63', '21', '1516325909', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('64', '21', '1516327066', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('65', '4', '1516327132', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('66', '4', '1516328739', '0', '125.33.74.234', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-19 10:39登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('67', '21', '1516329189', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('68', '4', '1516329226', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('69', '4', '1516330642', '0', '125.33.74.234', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-19 10:22登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('70', '42', '1516331234', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.3', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('71', '4', '1516331391', '0', '125.33.74.234', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-19 11:51登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('72', '24', '1516331551', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.3', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('73', '21', '1516343548', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('74', '4', '1516345379', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('75', '4', '1516348049', '0', '125.33.74.234', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-19 15:29登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('76', '24', '1516348379', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.3', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('77', '21', '1516349054', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('78', '4', '1516349179', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('79', '21', '1516349192', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.3', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('80', '22', '1516354481', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('81', '4', '1516355442', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.3', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('82', '4', '1516582105', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.3', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('83', '22', '1516583355', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('84', '4', '1516584415', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('85', '21', '1516597155', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.4', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('86', '24', '1516671607', '0', '123.114.100.166', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户135****2050/13552832050您好！您使用了电脑2018-01-23 09:07登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('87', '4', '1516671809', '0', '123.114.100.166', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-23 09:29登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('88', '22', '1516671863', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('89', '4', '1516671963', '0', '123.114.100.166', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-23 09:03登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('90', '21', '1516672443', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('91', '25', '1516672492', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.3', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('92', '21', '1516672495', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('93', '25', '1516672511', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('94', '4', '1516672727', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.3', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('95', '24', '1516673536', '0', '123.114.100.166', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户135****2050/13552832050您好！您使用了电脑2018-01-23 10:16登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('96', '25', '1516674205', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('97', '21', '1516674229', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('98', '4', '1516674560', '0', '123.114.100.166', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-23 10:20登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('99', '12', '1516675399', '0', '10.148.100.250', '中国-北京-北京', '0', '2', '2', '2.0.3', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('100', '21', '1516676224', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('101', '4', '1516676226', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.3', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('102', '22', '1516688521', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('103', '22', '1516693524', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('104', '21', '1516696151', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('105', '21', '1516696163', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('106', '4', '1516699211', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('107', '4', '1516703703', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('108', '21', '1516703755', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('109', '4', '1516755414', '0', '123.114.102.221', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-24 08:54登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('110', '21', '1516757835', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('111', '21', '1516758156', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('112', '4', '1516758230', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('113', '4', '1516758416', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('114', '26', '1516758427', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('115', '26', '1516758578', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('116', '4', '1516758594', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('117', '4', '1516758690', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('118', '21', '1516758711', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('119', '21', '1516758998', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('120', '26', '1516759011', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('121', '26', '1516759275', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('122', '21', '1516759298', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('123', '21', '1516759346', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('124', '4', '1516759358', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('125', '4', '1516759418', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('126', '26', '1516759443', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('127', '21', '1516759507', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('128', '26', '1516761658', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('129', '4', '1516761671', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('130', '4', '1516761709', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('131', '21', '1516761722', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('132', '21', '1516762736', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('133', '4', '1516762751', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('134', '4', '1516763113', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('135', '26', '1516763142', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('136', '26', '1516763187', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('137', '21', '1516763198', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('138', '21', '1516764765', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('139', '26', '1516766367', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('140', '26', '1516769879', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('141', '21', '1516769888', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('142', '21', '1516770625', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('143', '4', '1516770639', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('144', '4', '1516770751', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('145', '26', '1516770775', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('146', '21', '1516770798', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('147', '4', '1516770813', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('148', '26', '1516771482', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('149', '21', '1516771499', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('150', '21', '1516772537', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('151', '4', '1516772575', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('152', '4', '1516772593', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('153', '21', '1516772603', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('154', '4', '1516773624', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('155', '21', '1516773637', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('156', '21', '1516773828', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('157', '26', '1516773842', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('158', '26', '1516774053', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('159', '21', '1516774068', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('160', '21', '1516774996', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('161', '4', '1516775010', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('162', '4', '1516775135', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('163', '21', '1516775150', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('164', '21', '1516775218', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('165', '4', '1516775231', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('166', '4', '1516775319', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('167', '21', '1516775359', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('168', '21', '1516776805', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('169', '21', '1516778030', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('170', '21', '1516778632', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('171', '21', '1516781003', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.0.4', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('172', '21', '1516781130', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.4', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('173', '4', '1516781151', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.0.4', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('174', '21', '1516781458', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('175', '21', '1516783527', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('176', '4', '1516783542', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('177', '25', '1516838740', '0', '10.38.216.184', '中国-北京-北京', '0', '2', '2', '2.0.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('178', '25', '1516838757', '0', '10.38.216.184', '中国-北京-北京', '0', '2', '1', '2.0.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('179', '4', '1516857817', '0', '111.199.29.96', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-25 13:37登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('180', '21', '1516857921', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('181', '21', '1516869532', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('182', '4', '1516869559', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('183', '4', '1516869753', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('184', '4', '1516872393', '0', '10.147.174.157', '中国-北京-北京', '0', '2', '2', '2.0.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('185', '25', '1516872460', '0', '10.147.174.157', '中国-北京-北京', '0', '2', '1', '2.0.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('186', '21', '1516873226', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('187', '4', '1516875003', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('188', '4', '1516928535', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('189', '21', '1516928707', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('190', '21', '1516929498', '0', '192.168.1.103', '中国-北京-北京', '0', '2', '2', '2.0.4', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('191', '24', '1516929527', '0', '192.168.1.103', '中国-北京-北京', '0', '2', '1', '2.0.4', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('192', '4', '1516936096', '0', '125.33.77.172', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-26 11:16登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('193', '21', '1516936810', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('194', '26', '1516936831', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('195', '26', '1516943344', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('196', '21', '1516943358', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('197', '21', '1516943376', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('198', '26', '1516943388', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('199', '26', '1516953416', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('200', '26', '1516958717', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('201', '26', '1516958732', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('202', '26', '1516959394', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('203', '4', '1516959408', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('204', '4', '1516960987', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('205', '21', '1516960998', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('206', '26', '1516965517', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('207', '21', '1517019637', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('208', '4', '1517022573', '0', '14.131.163.173', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-27 11:33登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('209', '4', '1517023655', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '1', '2.0.5', 'mx5  Meizu\nMX5', null);
INSERT INTO `tzht_log` VALUES ('210', '4', '1517024370', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '2', '2.0.5', 'mx5  Meizu\nMX5', null);
INSERT INTO `tzht_log` VALUES ('211', '21', '1517024385', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '1', '2.0.5', 'mx5  Meizu\nMX5', null);
INSERT INTO `tzht_log` VALUES ('212', '21', '1517025754', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '2', '2.0.5', 'mx5  Meizu\nMX5', null);
INSERT INTO `tzht_log` VALUES ('213', '26', '1517025830', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '1', '2.0.5', 'mx5  Meizu\nMX5', null);
INSERT INTO `tzht_log` VALUES ('214', '21', '1517026983', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('215', '21', '1517040053', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('216', '26', '1517040089', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('217', '26', '1517046857', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('218', '4', '1517046947', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('219', '4', '1517047295', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('220', '26', '1517047308', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('221', '26', '1517144786', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('222', '21', '1517145397', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('223', '25', '1517146441', '0', '10.172.111.61', '中国-北京-北京', '0', '2', '2', '2.0.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('224', '21', '1517146535', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('225', '4', '1517146570', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('226', '4', '1517187270', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('227', '4', '1517187340', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('228', '21', '1517187350', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('229', '21', '1517187376', '0', '192.168.1.34', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('230', '21', '1517187411', '0', '192.168.1.34', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('231', '21', '1517187595', '0', '192.168.1.34', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('232', '21', '1517187962', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('233', '21', '1517187979', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('234', '4', '1517188117', '0', '111.199.26.90', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-29 09:37登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('235', '4', '1517189027', '0', '111.199.26.90', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-29 09:47登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('236', '4', '1517190204', '0', '111.199.26.90', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-29 09:24登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('237', '24', '1517195195', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('238', '4', '1517196289', '0', '111.199.26.90', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-29 11:49登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('239', '27', '1517196419', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.0.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('240', '21', '1517198673', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('241', '21', '1517199605', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('242', '4', '1517202370', '0', '111.199.26.90', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-29 13:10登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('243', '21', '1517202469', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('244', '28', '1517205523', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('245', '29', '1517209385', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('246', '4', '1517209398', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('247', '21', '1517210370', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('248', '4', '1517213659', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('249', '21', '1517213669', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('250', '21', '1517213727', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('251', '28', '1517213741', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('252', '28', '1517215257', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('253', '4', '1517215269', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('254', '4', '1517216888', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('255', '28', '1517216912', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('256', '28', '1517218032', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('257', '4', '1517219004', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('258', '4', '1517219618', '0', '111.199.26.90', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-29 17:38登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('259', '4', '1517271826', '0', '111.199.21.14', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-30 08:46登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('260', '4', '1517271907', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('261', '28', '1517271918', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('262', '28', '1517271945', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('263', '30', '1517272354', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('264', '4', '1517275598', '0', '111.199.21.14', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-30 09:38登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('265', '21', '1517276518', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('266', '4', '1517276533', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('267', '30', '1517277655', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('268', '4', '1517277672', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('269', '4', '1517277994', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('270', '30', '1517278024', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('271', '30', '1517278495', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('272', '30', '1517278507', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('273', '4', '1517278526', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('274', '30', '1517278540', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('275', '30', '1517278591', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('276', '4', '1517278602', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('277', '4', '1517280668', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('278', '30', '1517280693', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('279', '30', '1517280982', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('280', '4', '1517280997', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('281', '4', '1517282609', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('282', '21', '1517283091', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('283', '21', '1517283618', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('284', '4', '1517283632', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('285', '21', '1517285801', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('286', '4', '1517285815', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('287', '4', '1517287495', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('288', '21', '1517287504', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('289', '4', '1517289302', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('290', '30', '1517292284', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('291', '21', '1517292294', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('292', '21', '1517292482', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('293', '30', '1517292523', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('294', '4', '1517292685', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('295', '21', '1517292698', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('296', '30', '1517293432', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('297', '21', '1517293444', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('298', '21', '1517293536', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('299', '30', '1517293565', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('300', '4', '1517294484', '0', '111.199.21.14', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-30 14:24登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('301', '30', '1517295886', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('302', '30', '1517295924', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('303', '30', '1517296179', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('304', '4', '1517296194', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('305', '4', '1517298517', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('306', '4', '1517300125', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('307', '30', '1517300135', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('308', '30', '1517300198', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('309', '31', '1517300307', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('310', '4', '1517300323', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('311', '21', '1517301008', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('312', '31', '1517301035', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('313', '4', '1517301416', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('314', '21', '1517301425', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('315', '31', '1517301429', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('316', '4', '1517301446', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('317', '21', '1517302368', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('318', '31', '1517302379', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('319', '21', '1517304628', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('320', '31', '1517305443', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('321', '31', '1517305514', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('322', '31', '1517305606', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('323', '31', '1517305951', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('324', '21', '1517306001', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('325', '31', '1517306915', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('326', '21', '1517306930', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('327', '4', '1517308173', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('328', '21', '1517311681', '0', '10.32.44.199', '中国-北京-北京', '0', '2', '2', '2.0.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('329', '4', '1517357723', '0', '123.114.108.22', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-31 08:23登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('330', '21', '1517358302', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('331', '31', '1517358316', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('332', '31', '1517358713', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('333', '21', '1517358723', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('334', '21', '1517361485', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('335', '31', '1517361497', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('336', '32', '1517363065', '0', '100.67.44.13', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('337', '33', '1517363184', '0', '100.67.44.13', '中国-北京-北京', '0', '2', '1', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('338', '31', '1517365098', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('339', '4', '1517365117', '0', '123.114.108.22', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-31 10:37登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('340', '21', '1517365118', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('341', '21', '1517376287', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('342', '4', '1517376302', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('343', '4', '1517376338', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('344', '31', '1517376357', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('345', '31', '1517379000', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('346', '21', '1517379011', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('347', '4', '1517379900', '0', '123.114.108.22', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-01-31 14:00登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('348', '21', '1517384485', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('349', '31', '1517384495', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('350', '31', '1517385024', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('351', '21', '1517385034', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('352', '21', '1517385438', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('353', '31', '1517385455', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('354', '31', '1517385463', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('355', '4', '1517385474', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('356', '4', '1517385482', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('357', '21', '1517385493', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('358', '4', '1517385546', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('359', '31', '1517385562', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('360', '21', '1517385837', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('361', '31', '1517385847', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('362', '31', '1517386486', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('363', '21', '1517386497', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('364', '21', '1517386551', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('365', '31', '1517386577', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('366', '31', '1517386863', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('367', '4', '1517386880', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('368', '4', '1517386909', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('369', '21', '1517386923', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('370', '21', '1517387691', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('371', '31', '1517387702', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('372', '31', '1517388501', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('373', '4', '1517388517', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('374', '31', '1517390423', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('375', '21', '1517390433', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('376', '21', '1517390462', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('377', '4', '1517390527', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('378', '4', '1517390546', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('379', '21', '1517390572', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('380', '21', '1517390763', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('381', '31', '1517390776', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('382', '31', '1517390789', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('383', '21', '1517390799', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('384', '33', '1517390897', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('385', '4', '1517390915', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('386', '21', '1517390996', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('387', '31', '1517391010', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('388', '31', '1517391416', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('389', '21', '1517391427', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('390', '21', '1517391684', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('391', '31', '1517391695', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('392', '31', '1517391733', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('393', '21', '1517391743', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('394', '21', '1517391914', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('395', '31', '1517391924', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('396', '31', '1517391929', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('397', '21', '1517391940', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('398', '21', '1517392102', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('399', '31', '1517392114', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('400', '31', '1517392119', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('401', '21', '1517392131', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('402', '21', '1517392225', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('403', '31', '1517392235', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('404', '31', '1517392240', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('405', '21', '1517392253', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('406', '21', '1517392521', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('407', '21', '1517392531', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('408', '21', '1517392556', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('409', '31', '1517392573', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('410', '31', '1517392578', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('411', '21', '1517392590', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('412', '21', '1517392605', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('413', '4', '1517392620', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('414', '4', '1517392746', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('415', '21', '1517392766', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('416', '21', '1517392785', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('417', '31', '1517392798', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('418', '31', '1517392816', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('419', '21', '1517392838', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('420', '4', '1517395040', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('421', '33', '1517395104', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('422', '4', '1517395141', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('423', '21', '1517395707', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('424', '31', '1517395729', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('425', '31', '1517395804', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('426', '21', '1517395813', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('427', '31', '1517445532', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('428', '4', '1517449881', '0', '123.114.107.201', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-01 09:21登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('429', '21', '1517452212', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('430', '4', '1517452223', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('431', '4', '1517452244', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('432', '21', '1517452258', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('433', '21', '1517452403', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('434', '4', '1517452415', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('435', '4', '1517452432', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('436', '21', '1517452442', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('437', '21', '1517452805', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('438', '4', '1517452818', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('439', '4', '1517452841', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('440', '21', '1517452851', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('441', '21', '1517453870', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('442', '4', '1517453880', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('443', '4', '1517453897', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('444', '21', '1517453907', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('445', '33', '1517453948', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('446', '4', '1517453967', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('447', '21', '1517454604', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('448', '21', '1517454614', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('449', '21', '1517454621', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('450', '4', '1517454633', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('451', '4', '1517454729', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('452', '31', '1517454739', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('453', '31', '1517454824', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('454', '21', '1517454835', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('455', '4', '1517455494', '0', '123.114.107.201', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-01 11:54登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('456', '21', '1517456345', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('457', '4', '1517456365', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('458', '4', '1517456382', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('459', '21', '1517456391', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('460', '4', '1517456932', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('461', '32', '1517456954', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('462', '32', '1517458355', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('463', '4', '1517458380', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('464', '31', '1517458803', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('465', '4', '1517458817', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('466', '21', '1517460128', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('467', '31', '1517460145', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('468', '31', '1517460598', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('469', '21', '1517460663', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('470', '21', '1517462068', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('471', '4', '1517462087', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('472', '4', '1517462386', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('473', '21', '1517462396', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('474', '4', '1517463439', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('475', '31', '1517463452', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('476', '27', '1517467331', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '2', '2.0.5', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('477', '32', '1517468516', '0', '123.114.107.201', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户135****2050/13552832050您好！您使用了电脑2018-02-01 15:56登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('478', '21', '1517469373', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('479', '21', '1517469407', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('480', '31', '1517474400', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('481', '4', '1517474413', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('482', '4', '1517474669', '0', '123.114.107.201', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-01 16:29登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('483', '4', '1517475788', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('484', '21', '1517475799', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('485', '21', '1517476187', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('486', '21', '1517476375', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('487', '21', '1517478156', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('488', '31', '1517478176', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('489', '31', '1517479252', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('490', '21', '1517479262', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('491', '27', '1517480807', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.0.5', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('492', '4', '1517481823', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('493', '33', '1517481849', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.0.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('494', '31', '1517493304', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '2', '2.0.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('495', '21', '1517493320', '0', '192.168.1.102', '中国-北京-北京', '0', '2', '1', '2.0.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('496', '4', '1517531646', '0', '111.199.22.78', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-02 08:06登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('497', '4', '1517535888', '0', '111.199.22.78', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-02 09:48登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('498', '21', '1517536603', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('499', '27', '1517536744', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.0.6', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('500', '21', '1517537824', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('501', '21', '1517537835', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('502', '4', '1517538095', '0', '111.199.22.78', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-02 10:35登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('503', '21', '1517541465', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('504', '21', '1517541514', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('505', '31', '1517541536', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('506', '31', '1517541556', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('507', '21', '1517541567', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('508', '21', '1517541611', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('509', '21', '1517542157', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('510', '31', '1517542168', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('511', '31', '1517542490', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('512', '21', '1517542501', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('513', '21', '1517544070', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('514', '31', '1517544080', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('515', '32', '1517544467', '0', '111.199.22.78', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户135****2050/13552832050您好！您使用了电脑2018-02-02 12:47登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('516', '31', '1517547370', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('517', '31', '1517547380', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('518', '31', '1517547387', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('519', '21', '1517547397', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('520', '4', '1517547512', '0', '111.199.22.78', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-02 12:32登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('521', '21', '1517547654', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('522', '21', '1517547685', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('523', '21', '1517547758', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('524', '31', '1517547770', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('525', '31', '1517547858', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('526', '31', '1517547870', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('527', '31', '1517547981', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('528', '21', '1517548037', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('529', '21', '1517549191', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('530', '31', '1517549273', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('531', '31', '1517550686', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('532', '21', '1517550827', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('533', '21', '1517550922', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('534', '21', '1517550937', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('535', '21', '1517552617', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('536', '21', '1517552631', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('537', '21', '1517554265', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('538', '4', '1517554276', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('539', '4', '1517554283', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('540', '21', '1517554292', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('541', '21', '1517554470', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('542', '31', '1517554494', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('543', '31', '1517555250', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('544', '31', '1517555264', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('545', '31', '1517555295', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('546', '21', '1517555306', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('547', '33', '1517556669', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('548', '31', '1517556693', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('549', '21', '1517556782', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('550', '21', '1517556795', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('551', '33', '1517556840', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('552', '21', '1517558375', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('553', '21', '1517558482', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('554', '31', '1517558494', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('555', '31', '1517558642', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('556', '21', '1517558652', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('557', '27', '1517559001', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.0.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('558', '21', '1517562070', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('559', '31', '1517562080', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('560', '31', '1517562114', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('561', '4', '1517562127', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('562', '21', '1517563262', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('563', '31', '1517563287', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('564', '4', '1517564172', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('565', '21', '1517564182', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('566', '33', '1517569567', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('567', '4', '1517569591', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('568', '4', '1517570081', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('569', '33', '1517570105', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('570', '21', '1517622298', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('571', '31', '1517623633', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('572', '22', '1517623652', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('573', '4', '1517633152', '0', '61.51.164.40', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-03 12:52登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('574', '22', '1517636918', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('575', '31', '1517636931', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('576', '31', '1517637105', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('577', '21', '1517637116', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('578', '21', '1517637262', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('579', '4', '1517637306', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('580', '4', '1517638175', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('581', '31', '1517638195', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('582', '31', '1517641343', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('583', '22', '1517641385', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('584', '22', '1517641709', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('585', '31', '1517641724', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('586', '21', '1517644311', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('587', '31', '1517644324', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('588', '31', '1517645426', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('589', '21', '1517645437', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('590', '21', '1517645650', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('591', '4', '1517645660', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('592', '4', '1517646023', '0', '61.51.164.40', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-03 16:23登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('593', '4', '1517646048', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('594', '21', '1517646069', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('595', '21', '1517646137', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('596', '4', '1517646148', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('597', '4', '1517646169', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('598', '21', '1517646181', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('599', '4', '1517646582', '0', '61.51.164.40', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-03 16:42登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('600', '21', '1517646600', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('601', '31', '1517646619', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('602', '31', '1517646638', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('603', '27', '1517646659', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('604', '4', '1517646669', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('605', '27', '1517646700', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('606', '4', '1517646704', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('607', '31', '1517646721', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('608', '27', '1517646750', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('609', '31', '1517646773', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('610', '21', '1517646785', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('611', '21', '1517646790', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('612', '4', '1517646801', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('613', '4', '1517646805', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('614', '21', '1517646816', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('615', '21', '1517649907', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('616', '4', '1517649926', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('617', '4', '1517650174', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('618', '21', '1517650183', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('619', '21', '1517650209', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('620', '4', '1517650222', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('621', '4', '1517650808', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('622', '21', '1517650828', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('623', '21', '1517652052', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('624', '31', '1517652063', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('625', '31', '1517652113', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('626', '4', '1517652126', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('627', '4', '1517652185', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('628', '21', '1517652196', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('629', '21', '1517652845', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('630', '31', '1517652872', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('631', '31', '1517652902', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('632', '4', '1517652924', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('633', '4', '1517653462', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('634', '21', '1517653473', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('635', '21', '1517653528', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('636', '31', '1517653540', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('637', '31', '1517654675', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('638', '21', '1517654685', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('639', '21', '1517655170', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('640', '31', '1517655185', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('641', '31', '1517655212', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('642', '4', '1517655225', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('643', '4', '1517655272', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('644', '21', '1517655287', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('645', '4', '1517655506', '0', '61.51.164.40', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-03 18:26登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('646', '21', '1517656135', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('647', '4', '1517656152', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('648', '4', '1517657467', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('649', '21', '1517657495', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('650', '21', '1517658196', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('651', '31', '1517658210', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('652', '31', '1517659670', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('653', '21', '1517659681', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('654', '4', '1517659776', '0', '61.51.164.40', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-03 20:36登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('655', '31', '1517659792', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('656', '4', '1517659804', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('657', '21', '1517660185', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('658', '31', '1517660198', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('659', '31', '1517660442', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('660', '21', '1517660452', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('661', '21', '1517662251', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('662', '4', '1517662265', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('663', '4', '1517662281', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('664', '21', '1517662290', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('665', '34', '1517741800', '0', '10.171.104.224', '中国-北京-北京', '0', '2', '1', '2.0.9', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('666', '34', '1517741828', '0', '10.171.104.224', '中国-北京-北京', '0', '2', '2', '2.0.9', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('667', '27', '1517741853', '0', '10.171.104.224', '中国-北京-北京', '0', '2', '1', '2.0.9', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('668', '21', '1517791255', '0', '192.168.1.34', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('669', '31', '1517791294', '0', '192.168.1.34', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('670', '4', '1517791448', '0', '125.33.77.237', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-05 08:08登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('671', '27', '1517791844', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.0.9', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('672', '34', '1517791872', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.9', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('673', '31', '1517792246', '0', '192.168.1.34', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('674', '21', '1517792258', '0', '192.168.1.34', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('675', '4', '1517793209', '0', '125.33.77.237', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-05 09:29登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('676', '31', '1517794393', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.0', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('677', '34', '1517794638', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('678', '34', '1517795361', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.0.9', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('679', '34', '1517796616', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('680', '21', '1517796622', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('681', '31', '1517796640', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('682', '27', '1517796644', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('683', '31', '1517796651', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('684', '21', '1517796662', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('685', '21', '1517796679', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('686', '31', '1517796691', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('687', '27', '1517799110', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('688', '27', '1517799151', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('689', '31', '1517806302', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('690', '4', '1517806318', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('691', '4', '1517807095', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('692', '21', '1517807108', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('693', '21', '1517807127', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('694', '31', '1517807139', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('695', '31', '1517808273', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('696', '21', '1517808530', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('697', '21', '1517809679', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('698', '4', '1517809703', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('699', '4', '1517811259', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('700', '21', '1517811270', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('701', '21', '1517811574', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('702', '31', '1517811595', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('703', '31', '1517812670', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('704', '21', '1517812680', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('705', '21', '1517813299', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('706', '21', '1517813643', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('707', '21', '1517814764', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('708', '22', '1517814781', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('709', '22', '1517814955', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('710', '21', '1517814966', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('711', '4', '1517815141', '0', '125.33.77.237', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-05 15:01登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('712', '21', '1517815990', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('713', '4', '1517816011', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('714', '4', '1517817116', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('715', '31', '1517817127', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('716', '31', '1517817141', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('717', '21', '1517817161', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('718', '4', '1517817678', '0', '125.33.77.237', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-05 16:18登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('719', '4', '1517818169', '0', '125.33.77.237', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-05 16:29登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('720', '4', '1517819320', '0', '125.33.77.237', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-05 16:40登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('721', '21', '1517821715', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('722', '4', '1517821715', '0', '125.33.77.237', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-05 17:35登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('723', '22', '1517821729', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('724', '22', '1517822188', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('725', '4', '1517822348', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('726', '4', '1517822496', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('727', '21', '1517822509', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('728', '21', '1517822517', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('729', '31', '1517822530', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.0.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('730', '31', '1517823230', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.0', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('731', '4', '1517823243', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.0', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('732', '4', '1517823295', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('733', '31', '1517823312', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('734', '4', '1517823486', '0', '125.33.77.237', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-05 17:06登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('735', '4', '1517823820', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.0', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('736', '21', '1517823831', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.0', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('737', '21', '1517824588', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.0', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('738', '31', '1517824599', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.0', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('739', '31', '1517825395', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.0', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('740', '21', '1517825405', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.0', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('741', '4', '1517877055', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-06 08:55登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('742', '4', '1517879519', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-06 09:59登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('743', '4', '1517881185', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-06 09:45登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('744', '21', '1517892998', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('745', '4', '1517893017', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('746', '4', '1517893833', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('747', '21', '1517893852', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('748', '27', '1517896979', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('749', '34', '1517896995', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('750', '34', '1517898044', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('751', '4', '1517898075', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('752', '4', '1517898112', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('753', '34', '1517898139', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('754', '21', '1517898608', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('755', '4', '1517898630', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('756', '34', '1517899922', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('757', '34', '1517899991', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('758', '31', '1517902674', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('759', '21', '1517902687', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.0.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('760', '1', '1517905132', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '2', '2.1.0', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('761', '34', '1517905166', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '1', '2.1.0', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('762', '34', '1517905657', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-06 16:37登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('763', '4', '1517906314', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('764', '25', '1517906315', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('765', '35', '1517906333', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('766', '21', '1517906349', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('767', '35', '1517906523', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('768', '35', '1517906541', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('769', '34', '1517906844', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-06 16:24登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('770', '34', '1517907143', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-06 16:23登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('771', '21', '1517908018', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('772', '4', '1517908035', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('773', '4', '1517908150', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('774', '21', '1517908166', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('775', '21', '1517908887', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('776', '21', '1517908904', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('777', '35', '1517910009', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('778', '36', '1517910027', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('779', '36', '1517910088', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('780', '36', '1517910103', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('781', '36', '1517910135', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('782', '36', '1517910164', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('783', '36', '1517910177', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.0', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('784', '34', '1517910520', '0', '10.173.115.246', '中国-北京-北京', '0', '2', '2', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('785', '33', '1517910671', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.0', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('786', '34', '1517910688', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '2', '2.1.0', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('787', '21', '1517911005', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('788', '31', '1517911022', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('789', '31', '1517911029', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('790', '22', '1517911046', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('791', '22', '1517911064', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('792', '21', '1517911077', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('793', '4', '1517911086', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-06 17:06登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('794', '4', '1517911465', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-06 18:25登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('795', '33', '1517911823', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.0', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('796', '4', '1517912062', '0', '111.199.30.193', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-06 18:22登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('797', '27', '1517912594', '0', '10.173.115.246', '中国-北京-北京', '0', '2', '1', '2.1.0', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('798', '33', '1517912595', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.0', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('799', '32', '1517912610', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.0', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('800', '32', '1517913013', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.0', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('801', '4', '1517913032', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.0', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('802', '21', '1517914194', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('803', '21', '1517914257', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('804', '4', '1517914270', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('805', '4', '1517914324', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('806', '21', '1517914343', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('807', '21', '1517914360', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('808', '4', '1517914388', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('809', '4', '1517914395', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('810', '21', '1517914407', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('811', '21', '1517917259', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('812', '4', '1517963495', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 08:35登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('813', '21', '1517963700', '0', '192.168.1.64', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('814', '4', '1517964412', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('815', '21', '1517964703', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('816', '31', '1517964739', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('817', '31', '1517964937', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('818', '21', '1517964951', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('819', '21', '1517965000', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('820', '4', '1517965017', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('821', '4', '1517965030', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('822', '31', '1517965045', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('823', '4', '1517965185', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 08:45登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('824', '31', '1517965513', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('825', '21', '1517965529', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('826', '21', '1517965540', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('827', '31', '1517965558', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('828', '31', '1517965566', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('829', '4', '1517965605', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('830', '4', '1517965626', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('831', '31', '1517965660', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('832', '31', '1517965709', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('833', '32', '1517966073', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户135****2050/13552832050您好！您使用了电脑2018-02-07 09:33登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('834', '22', '1517966387', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('835', '22', '1517966868', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('836', '21', '1517966879', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('837', '34', '1517967193', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-07 09:13登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('838', '38', '1517968188', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '1', '2.1.0', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('839', '38', '1517968212', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '2', '2.1.0', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('840', '36', '1517968239', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '1', '2.1.0', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('841', '21', '1517969058', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('842', '22', '1517969074', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('843', '22', '1517969116', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('844', '21', '1517969129', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('845', '21', '1517970232', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('846', '31', '1517970254', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('847', '31', '1517970303', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('848', '4', '1517970315', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('849', '4', '1517970408', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('850', '21', '1517970514', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('851', '4', '1517970919', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('852', '21', '1517970936', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('853', '21', '1517970944', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('854', '31', '1517970957', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('855', '34', '1517971206', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-07 10:06登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('856', '21', '1517971267', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('857', '21', '1517971282', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('858', '21', '1517971289', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('859', '4', '1517971310', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('860', '4', '1517971629', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('861', '21', '1517971644', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('862', '31', '1517971717', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('863', '4', '1517971734', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('864', '4', '1517971741', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('865', '31', '1517971754', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('866', '31', '1517971955', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('867', '4', '1517971968', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('868', '4', '1517971979', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('869', '31', '1517971992', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('870', '4', '1517972306', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('871', '4', '1517972315', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('872', '21', '1517972329', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('873', '21', '1517972419', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('874', '31', '1517972433', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('875', '31', '1517972551', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('876', '4', '1517973065', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 11:05登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('877', '21', '1517973627', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('878', '31', '1517973645', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('879', '31', '1517973673', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('880', '21', '1517973687', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('881', '27', '1517973909', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('882', '21', '1517974169', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('883', '32', '1517974205', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.0', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('884', '38', '1517974411', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户186****9800/18601159800您好！您使用了电脑2018-02-07 11:31登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('885', '4', '1517974444', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('886', '4', '1517974916', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('887', '4', '1517975087', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('888', '21', '1517975204', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('889', '21', '1517975956', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('890', '31', '1517975972', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('891', '31', '1517975980', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('892', '4', '1517975997', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('893', '31', '1517976036', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('894', '4', '1517976050', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('895', '4', '1517976067', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('896', '21', '1517976080', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('897', '4', '1517976112', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('898', '31', '1517976125', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('899', '31', '1517976166', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('900', '21', '1517976178', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('901', '21', '1517976187', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('902', '4', '1517976207', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('903', '4', '1517976217', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('904', '21', '1517976228', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('905', '21', '1517976593', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('906', '31', '1517976609', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('907', '21', '1517976764', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('908', '21', '1517976780', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('909', '31', '1517976932', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('910', '22', '1517976989', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('911', '22', '1517978976', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('912', '31', '1517978989', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('913', '21', '1517979707', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('914', '31', '1517979718', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('915', '31', '1517980139', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('916', '21', '1517980152', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('917', '21', '1517980474', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('918', '31', '1517980489', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('919', '31', '1517980531', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('920', '4', '1517980548', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('921', '4', '1517981435', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('922', '21', '1517981448', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('923', '21', '1517981624', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('924', '31', '1517981644', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('925', '31', '1517981715', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('926', '21', '1517981729', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('927', '21', '1517981838', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('928', '4', '1517981866', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('929', '4', '1517981876', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('930', '31', '1517981891', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('931', '31', '1517981921', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('932', '21', '1517981933', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('933', '27', '1517982295', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('934', '34', '1517982319', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('935', '34', '1517982397', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('936', '27', '1517982417', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('937', '27', '1517982452', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('938', '21', '1517982463', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('939', '34', '1517982484', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('940', '34', '1517982744', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('941', '4', '1517982798', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('942', '4', '1517982989', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('943', '27', '1517983001', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('944', '27', '1517983005', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('945', '27', '1517983412', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('946', '4', '1517983576', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('947', '4', '1517983601', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('948', '21', '1517983621', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('949', '21', '1517983657', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('950', '31', '1517983675', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('951', '31', '1517983937', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('952', '21', '1517983959', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('953', '21', '1517983980', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('954', '31', '1517983997', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('955', '31', '1517984269', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('956', '21', '1517984308', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('957', '21', '1517984315', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('958', '31', '1517984347', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('959', '27', '1517984676', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('960', '34', '1517984692', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('961', '34', '1517984811', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('962', '34', '1517984891', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('963', '27', '1517984910', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('964', '31', '1517985317', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('965', '21', '1517985330', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('966', '34', '1517985689', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-07 14:29登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('967', '32', '1517986092', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('968', '33', '1517986112', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('969', '4', '1517986134', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 14:54登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('970', '34', '1517986299', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-07 14:39登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('971', '27', '1517986325', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('972', '27', '1517986346', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('973', '4', '1517986473', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 14:33登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('974', '34', '1517986716', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-07 14:36登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('975', '4', '1517987180', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 15:20登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('976', '34', '1517987926', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-07 15:46登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('977', '21', '1517988245', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('978', '27', '1517988266', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('979', '27', '1517988300', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('980', '39', '1517988338', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('981', '39', '1517988465', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('982', '21', '1517988518', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('983', '4', '1517988696', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 15:36登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('984', '34', '1517989267', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-07 15:07登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('985', '4', '1517991669', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 16:09登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('986', '21', '1517992325', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('987', '40', '1517992437', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('988', '4', '1517992449', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('989', '4', '1517992499', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('990', '21', '1517992510', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('991', '21', '1517992603', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('992', '4', '1517992618', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('993', '4', '1517992884', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('994', '21', '1517992899', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('995', '34', '1517994316', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-07 17:16登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('996', '21', '1517995118', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('997', '40', '1517995131', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('998', '40', '1517995527', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('999', '22', '1517995548', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1000', '22', '1517995954', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1001', '21', '1517995966', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1002', '21', '1517995967', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1003', '4', '1517996607', '0', '111.199.31.196', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-07 17:27登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1004', '21', '1517997801', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1005', '40', '1517997829', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1006', '40', '1517998721', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1007', '4', '1517998744', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1008', '4', '1517999322', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1009', '21', '1517999336', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1010', '33', '1518002065', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1011', '27', '1518002084', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1012', '21', '1518002376', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1013', '4', '1518002397', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1014', '41', '1518002506', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1015', '41', '1518002579', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1016', '4', '1518002713', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1017', '4', '1518002881', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1018', '41', '1518003357', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1019', '50', '1518003430', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1020', '50', '1518003443', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1021', '42', '1518003472', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1022', '44', '1518004686', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1023', '4', '1518004718', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1024', '45', '1518004748', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1025', '43', '1518007123', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1026', '44', '1518007136', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1027', '51', '1518007163', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1028', '51', '1518007719', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1029', '44', '1518007756', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1030', '44', '1518008810', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1031', '38', '1518013192', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '2', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1032', '41', '1518013286', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '1', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1033', '4', '1518048317', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1034', '45', '1518048439', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1035', '45', '1518049830', '0', '192.168.1.64', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1036', '45', '1518049840', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1037', '45', '1518049863', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1038', '4', '1518052500', '0', '123.114.109.119', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-08 09:00登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1039', '49', '1518053827', '0', '192.168.1.52', '中国-北京-北京', '0', '2', '1', '2.1.1', 'sdm660  vivo\nvivo X20A', null);
INSERT INTO `tzht_log` VALUES ('1040', '42', '1518053840', '0', '192.168.1.53', '中国-北京-北京', '0', '2', '1', '2.1.1', 'universal7420  samsung\nSM-G9200', null);
INSERT INTO `tzht_log` VALUES ('1041', '34', '1518157701', '0', '123.123.101.198', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-09 14:21登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1042', '41', '1518170393', '0', '192.168.1.101', '中国-北京-北京', '0', '2', '2', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1043', '53', '1518170924', '0', '192.168.1.101', '中国-北京-北京', '0', '2', '2', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1044', '41', '1518171000', '0', '192.168.1.101', '中国-北京-北京', '0', '2', '1', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1045', '45', '1519262239', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1046', '34', '1519262632', '0', '111.199.30.7', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-22 09:52登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1047', '4', '1519262949', '0', '111.199.30.7', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-22 09:09登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1048', '45', '1519263612', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1049', '34', '1519263725', '0', '111.199.30.7', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-22 09:05登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1050', '45', '1519263844', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1051', '34', '1519270383', '0', '111.199.30.7', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-22 11:03登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1052', '34', '1519350188', '0', '123.123.96.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-23 09:08登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1053', '4', '1519350278', '0', '123.123.96.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-23 09:38登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1054', '41', '1519350434', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1055', '34', '1519350829', '0', '123.123.96.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-23 09:49登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1056', '41', '1519350849', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1057', '34', '1519351094', '0', '123.123.96.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-23 09:14登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1058', '41', '1519351218', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1059', '4', '1519352458', '0', '123.123.96.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-23 10:58登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1060', '45', '1519352683', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1061', '4', '1519352702', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1062', '4', '1519356659', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1063', '45', '1519356682', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1064', '45', '1519357978', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1065', '46', '1519358007', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1066', '34', '1519364013', '0', '123.123.96.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-23 13:33登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1067', '34', '1519431958', '0', '123.114.107.168', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-24 08:58登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1068', '4', '1519436470', '0', '123.114.107.168', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-24 09:10登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1069', '45', '1519437106', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1070', '46', '1519437122', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1071', '46', '1519437152', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1072', '45', '1519437170', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1073', '46', '1519437214', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1074', '45', '1519437231', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1075', '45', '1519456555', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1076', '46', '1519456571', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1077', '46', '1519456685', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1078', '45', '1519456699', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1079', '44', '1519457623', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1080', '44', '1519457784', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1081', '4', '1519457809', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1082', '45', '1519458965', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1083', '46', '1519458981', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1084', '45', '1519460081', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1085', '45', '1519460100', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1086', '45', '1519460110', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1087', '46', '1519460124', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1088', '46', '1519460351', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1089', '45', '1519460366', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1090', '45', '1519463671', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1091', '46', '1519463688', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1092', '46', '1519463699', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1093', '45', '1519463713', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1094', '4', '1519606159', '0', '123.114.101.73', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-26 08:19登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1095', '41', '1519606263', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1096', '41', '1519606279', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.1', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1097', '4', '1519607036', '0', '123.114.101.73', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-26 09:56登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1098', '4', '1519608642', '0', '123.114.101.73', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-26 09:42登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1099', '4', '1519611382', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1100', '44', '1519611439', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.1', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1101', '45', '1519613777', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1102', '45', '1519615525', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1103', '45', '1519626498', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1104', '45', '1519628902', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1105', '4', '1519628924', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1106', '4', '1519628937', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1107', '40', '1519629006', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1108', '40', '1519629038', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1109', '45', '1519629065', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1110', '45', '1519629177', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1111', '4', '1519629224', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1112', '4', '1519629229', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1113', '40', '1519629447', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1114', '40', '1519629458', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1115', '45', '1519629512', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1116', '45', '1519629518', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1117', '4', '1519629536', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1118', '4', '1519629550', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1119', '40', '1519629676', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1120', '40', '1519630074', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1121', '45', '1519630087', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1122', '45', '1519630092', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1123', '4', '1519630105', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1124', '4', '1519630113', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1125', '45', '1519630129', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1126', '45', '1519632650', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1127', '45', '1519636457', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1128', '4', '1519636472', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1129', '4', '1519636617', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1130', '45', '1519636661', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1131', '45', '1519637184', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1132', '45', '1519637206', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.1', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1133', '46', '1519693145', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1134', '46', '1519693315', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1135', '46', '1519693328', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1136', '46', '1519693426', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1137', '46', '1519693454', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1138', '4', '1519694126', '0', '123.114.107.176', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-27 09:26登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1139', '46', '1519694345', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1140', '47', '1519694375', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1141', '47', '1519694571', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1142', '46', '1519694584', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1143', '46', '1519694609', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1144', '46', '1519695275', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1145', '4', '1519695471', '0', '123.114.107.176', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-27 09:51登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1146', '34', '1519700356', '0', '123.114.107.176', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-27 10:16登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1147', '34', '1519704012', '0', '123.114.107.176', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-27 12:12登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1148', '34', '1519712756', '0', '123.114.107.176', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-02-27 14:56登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1149', '4', '1519725664', '0', '123.114.107.176', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-27 18:04登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1150', '4', '1519782881', '0', '125.33.87.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-28 09:41登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1151', '4', '1519783907', '0', '125.33.87.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-28 10:47登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1152', '4', '1519788620', '0', '125.33.87.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-28 11:20登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1153', '4', '1519797244', '0', '125.33.87.161', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-02-28 13:04登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1154', '4', '1519863905', '0', '123.123.103.222', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-01 08:05登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1155', '34', '1519872495', '0', '123.123.103.222', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-01 10:15登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1156', '4', '1519873616', '0', '123.123.103.222', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-01 11:56登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1157', '45', '1519887353', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1158', '34', '1519887386', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1159', '34', '1519951274', '0', '111.199.18.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-02 08:14登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1160', '34', '1519951601', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1161', '45', '1519951630', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1162', '46', '1519957575', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1163', '46', '1519957765', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.2', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1164', '46', '1519958886', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.1', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1165', '46', '1519959032', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1166', '4', '1519959044', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1167', '46', '1519969481', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1168', '41', '1519970935', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1169', '4', '1519971121', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1170', '46', '1519971312', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1171', '46', '1519973723', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1172', '46', '1519975277', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1173', '4', '1519993310', '0', '192.168.3.22', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1174', '41', '1519993328', '0', '192.168.3.22', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1175', '45', '1520234394', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1176', '34', '1520234430', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1177', '34', '1520236420', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1178', '45', '1520236503', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1179', '34', '1520236641', '0', '111.199.19.64', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-05 15:21登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1180', '45', '1520237008', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1181', '4', '1520237030', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1182', '4', '1520237237', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1183', '45', '1520237250', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1184', '46', '1520237273', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1185', '34', '1520237298', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1186', '34', '1520237341', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1187', '46', '1520237368', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1188', '45', '1520237522', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1189', '4', '1520237536', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1190', '4', '1520237584', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1191', '45', '1520237597', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1192', '4', '1520240571', '0', '111.199.19.64', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-05 17:51登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1193', '43', '1520240683', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.2', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1194', '45', '1520240773', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1195', '4', '1520240785', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1196', '4', '1520241011', '0', '111.199.19.64', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-05 17:11登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1197', '46', '1520241373', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1198', '46', '1520241388', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1199', '4', '1520241753', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1200', '45', '1520241791', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1201', '40', '1520242145', '0', '111.199.19.64', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户176****8102/17600898102您好！您使用了电脑2018-03-05 17:05登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1202', '34', '1520302493', '0', '111.199.29.138', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-06 10:53登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1203', '41', '1520303416', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1204', '45', '1520303511', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1205', '34', '1520303536', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1206', '34', '1520306859', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1207', '45', '1520306871', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1208', '41', '1520310761', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1209', '41', '1520311092', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1210', '53', '1520314291', '0', '111.199.29.138', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户186****9918/18618249918您好！您使用了电脑2018-03-06 13:31登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1211', '4', '1520314499', '0', '111.199.29.138', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-06 13:59登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1212', '53', '1520315033', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1213', '41', '1520315048', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1214', '41', '1520315166', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1215', '53', '1520315193', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1216', '45', '1520317777', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1217', '34', '1520317812', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1218', '34', '1520325662', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1219', '40', '1520325723', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1220', '40', '1520326484', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1221', '34', '1520326514', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1222', '46', '1520326573', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1223', '34', '1520326601', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1224', '34', '1520327818', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1225', '40', '1520327845', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1226', '53', '1520333869', '0', '10.147.113.105', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1227', '41', '1520333884', '0', '10.147.113.105', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1228', '41', '1520333897', '0', '10.147.113.105', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1229', '53', '1520333913', '0', '10.147.113.105', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1230', '40', '1520386279', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1231', '34', '1520386310', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1232', '4', '1520386578', '0', '123.114.108.160', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-07 09:18登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1233', '43', '1520386892', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.2', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1234', '34', '1520387273', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1235', '40', '1520387314', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1236', '40', '1520393234', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1237', '34', '1520393254', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1238', '34', '1520394977', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1239', '40', '1520394989', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1240', '40', '1520395046', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1241', '34', '1520395070', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1242', '34', '1520402991', '0', '123.114.108.160', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-07 14:51登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1243', '34', '1520405615', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1244', '40', '1520405628', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1245', '40', '1520406270', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1246', '45', '1520406284', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1247', '45', '1520412778', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1248', '34', '1520412810', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1249', '53', '1520413003', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1250', '41', '1520413018', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1251', '41', '1520413465', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1252', '53', '1520413482', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1253', '34', '1520474284', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1254', '45', '1520474315', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1255', '45', '1520475248', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1256', '40', '1520475257', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1257', '40', '1520478226', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1258', '45', '1520478239', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1259', '45', '1520478934', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1260', '40', '1520478952', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1261', '34', '1520479837', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1262', '46', '1520479854', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1263', '40', '1520479879', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1264', '34', '1520479916', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1265', '34', '1520479959', '0', '123.123.101.60', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-08 11:39登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1266', '46', '1520480169', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1267', '47', '1520480186', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1268', '34', '1520480616', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1269', '45', '1520480629', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1270', '45', '1520485436', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1271', '34', '1520485461', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1272', '34', '1520487375', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1273', '40', '1520487400', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1274', '40', '1520487924', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1275', '34', '1520487944', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1276', '34', '1520489666', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1277', '40', '1520489703', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1278', '40', '1520491109', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1279', '34', '1520491149', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1280', '34', '1520491171', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1281', '34', '1520491788', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1282', '34', '1520493012', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1283', '45', '1520493040', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1284', '45', '1520493203', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1285', '46', '1520493219', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1286', '46', '1520496430', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1287', '45', '1520496445', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1288', '45', '1520497809', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1289', '45', '1520498177', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1290', '45', '1520502229', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1291', '34', '1520502259', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1292', '34', '1520502808', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1293', '45', '1520502823', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1294', '45', '1520502837', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1295', '34', '1520502857', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1296', '34', '1520503316', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1297', '45', '1520503331', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1298', '45', '1520503336', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1299', '34', '1520503359', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1300', '34', '1520504028', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1301', '40', '1520504071', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1302', '40', '1520504402', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1303', '45', '1520504416', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1304', '45', '1520504481', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1305', '34', '1520504500', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1306', '34', '1520557417', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1307', '45', '1520557444', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1308', '53', '1520558615', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1309', '41', '1520558629', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1310', '34', '1520558718', '0', '61.51.164.136', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-09 09:18登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1311', '53', '1520558771', '0', '61.51.164.136', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户186****9918/18618249918您好！您使用了电脑2018-03-09 09:11登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1312', '45', '1520559770', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1313', '45', '1520560418', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1314', '45', '1520560454', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1315', '34', '1520560476', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1316', '34', '1520561882', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1317', '45', '1520561910', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1318', '45', '1520562519', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1319', '34', '1520562539', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1320', '47', '1520562567', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1321', '40', '1520562586', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1322', '34', '1520562802', '0', '61.51.164.136', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-09 10:22登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1323', '34', '1520565354', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1324', '45', '1520565367', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1325', '45', '1520565808', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1326', '34', '1520565830', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1327', '34', '1520572292', '0', '61.51.164.136', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-09 13:32登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1328', '41', '1520572646', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1329', '53', '1520572671', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1330', '53', '1520572887', '0', '61.51.164.136', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户186****9918/18618249918您好！您使用了电脑2018-03-09 13:27登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1331', '34', '1520572960', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1332', '45', '1520572976', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1333', '53', '1520573164', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1334', '41', '1520573177', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.2', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1335', '45', '1520573263', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1336', '34', '1520573280', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1337', '34', '1520573304', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1338', '34', '1520573335', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1339', '34', '1520573351', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1340', '40', '1520573388', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1341', '40', '1520573404', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1342', '45', '1520573437', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1343', '45', '1520573480', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1344', '34', '1520573500', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1345', '34', '1520573521', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1346', '45', '1520573555', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1347', '45', '1520575975', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1348', '34', '1520575997', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1349', '34', '1520577197', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1350', '45', '1520577220', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1351', '45', '1520589133', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);

-- ----------------------------
-- Table structure for `tzht_message`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_message`;
CREATE TABLE `tzht_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text,
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of tzht_message
-- ----------------------------
INSERT INTO `tzht_message` VALUES ('1', '21', '586', '1516261627');
INSERT INTO `tzht_message` VALUES ('2', '21', '5866', '1516582782');
INSERT INTO `tzht_message` VALUES ('3', '21', '5555', '1516781105');
INSERT INTO `tzht_message` VALUES ('4', '21', '啦啦啦', '1516961133');
INSERT INTO `tzht_message` VALUES ('5', '4', '58886', '1517221265');
INSERT INTO `tzht_message` VALUES ('7', '27', '信息反馈', '1517381872');
INSERT INTO `tzht_message` VALUES ('8', '31', '5555', '1517385606');
INSERT INTO `tzht_message` VALUES ('9', '21', '296', '1517542865');
INSERT INTO `tzht_message` VALUES ('10', '31', '2555', '1517641985');
INSERT INTO `tzht_message` VALUES ('12', '46', '233638', '1519871029');

-- ----------------------------
-- Table structure for `tzht_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_oauth_user`;
CREATE TABLE `tzht_oauth_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的本站用户id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1：QQ  2：新浪微博 3：豆瓣 4：人人 5：开心网',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '第三方昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT 'access_token token',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `login_times` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tzht_oauth_user
-- ----------------------------
INSERT INTO `tzht_oauth_user` VALUES ('1', '0', '2', '爱酥网', 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/69470343jw1e8qgp5bmzyj2050050aa8.jpg', '1766261571', '2.00r_DXvBsZSuaE9d316fef859J7CfC', '1499853877', '1499911394', '125.33.94.108', '11', '1', '', '0');

-- ----------------------------
-- Table structure for `tzht_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_privilege`;
CREATE TABLE `tzht_privilege` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `pri_name` varchar(30) NOT NULL COMMENT '权限名称',
  `name_url` varchar(30) NOT NULL COMMENT '权限链接',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级权限id',
  `icon` varchar(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1为显示，0为禁用',
  `sort` mediumint(8) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of tzht_privilege
-- ----------------------------
INSERT INTO `tzht_privilege` VALUES ('1', '管理员管理', '', '0', 'icon-user-md', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('2', '权限管理', 'Privilege/index', '1', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('3', '角色管理', 'Role/index', '1', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('4', '管理员列表', 'Admin/index', '1', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('5', '添加权限', 'Privileg/add', '2', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('6', '编辑权限', 'Privileg/edit', '2', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('7', '删除权限', 'Privilege/delete', '2', null, '0', '0');
INSERT INTO `tzht_privilege` VALUES ('9', '添加角色', 'Role/add', '3', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('10', '编辑角色', 'Role/edit', '3', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('11', '删除权限', 'Role/delete', '3', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('12', '系统管理', '', '0', 'icon-asterisk', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('13', '添加管理员', 'Admin/add', '4', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('14', '编辑管理员', 'Admin/edit', '4', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('15', '删除管理员', 'Admin/delete', '4', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('16', '系统设置', 'System/index', '12', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('18', 'APP头条消息通知', 'Bulletin/index', '34', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('20', 'APP广告列表管理', 'Advert/index', '34', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('21', '添加头条', 'Bulletin/add', '18', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('22', '编辑头条', 'Bulletin/edit', '18', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('23', '删除头条', 'Bulletin/delete', '18', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('24', '用户管理', '', '0', 'icon-group', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('25', '用户列表', 'User/index', '24', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('26', '会议管理', '', '0', 'icon-suitcase', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('27', '会议列表', 'Conference/index', '26', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('28', '认证管理', '', '0', 'icon-suitcase', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('29', '个人认证列表', 'Certify/person', '28', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('30', '企业认证', 'Certify/index', '28', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('32', '认证审核', 'Certify/audit', '28', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('33', 'APP会议栏目', 'Conference/cate', '34', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('34', 'APP管理', '', '0', ' icon-github-alt', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('35', 'APP引导页管理', 'App/index', '34', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('36', 'APP推送列表管理', 'Jgpush/index', '34', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('37', 'APP意见反馈管理', 'Message/index', '34', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('38', '会员登录日志', 'Log/index', '12', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('40', '修改密码', 'Admin/editAdmin', '12', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('41', '添加广告', 'Advert/add', '20', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('42', '编辑广告', 'Advert/edit', '20', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('43', '删除广告', 'Advert/delete', '20', '', '0', '0');

-- ----------------------------
-- Table structure for `tzht_pri_role`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_pri_role`;
CREATE TABLE `tzht_pri_role` (
  `pri_id` mediumint(8) unsigned NOT NULL COMMENT '权限id',
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色id',
  KEY `pri_id` (`pri_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限角色表';

-- ----------------------------
-- Records of tzht_pri_role
-- ----------------------------
INSERT INTO `tzht_pri_role` VALUES ('19', '3');
INSERT INTO `tzht_pri_role` VALUES ('20', '3');
INSERT INTO `tzht_pri_role` VALUES ('17', '3');
INSERT INTO `tzht_pri_role` VALUES ('18', '3');
INSERT INTO `tzht_pri_role` VALUES ('12', '2');
INSERT INTO `tzht_pri_role` VALUES ('16', '2');
INSERT INTO `tzht_pri_role` VALUES ('17', '2');
INSERT INTO `tzht_pri_role` VALUES ('18', '2');
INSERT INTO `tzht_pri_role` VALUES ('19', '2');
INSERT INTO `tzht_pri_role` VALUES ('20', '2');
INSERT INTO `tzht_pri_role` VALUES ('12', '4');
INSERT INTO `tzht_pri_role` VALUES ('40', '4');
INSERT INTO `tzht_pri_role` VALUES ('28', '4');
INSERT INTO `tzht_pri_role` VALUES ('29', '4');
INSERT INTO `tzht_pri_role` VALUES ('30', '4');
INSERT INTO `tzht_pri_role` VALUES ('32', '4');

-- ----------------------------
-- Table structure for `tzht_product`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_product`;
CREATE TABLE `tzht_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '标题',
  `bullurl` varchar(100) NOT NULL DEFAULT '' COMMENT 'url',
  `pic` varchar(100) NOT NULL DEFAULT '' COMMENT '宣传图片',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='企业产品表';

-- ----------------------------
-- Records of tzht_product
-- ----------------------------
INSERT INTO `tzht_product` VALUES ('3', '4', '企业产品', 'http://xh.2188.com.cn/Product/add.html', '[\"\\/Uploads\\/product\\/2018-02-01\\/5a726feac5992.jpg\"]', '1517449198');
INSERT INTO `tzht_product` VALUES ('4', '34', '网络服务', 'www.2188.com.cn', '[\"\\/Uploads\\/product\\/2018-02-06\\/5a797951a92b3.jpg\"]', '1517910355');
INSERT INTO `tzht_product` VALUES ('5', '53', '产品1', 'www.2188.com.cn', '[\"\\/Uploads\\/product\\/2018-03-09\\/5aa220754f2dc.jpg\"]', '1520574585');

-- ----------------------------
-- Table structure for `tzht_role`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_role`;
CREATE TABLE `tzht_role` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(150) NOT NULL COMMENT '角色名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tzht_role
-- ----------------------------
INSERT INTO `tzht_role` VALUES ('1', '超级管理员', '拥有至高无上的权力', '1');
INSERT INTO `tzht_role` VALUES ('2', '审计管理员', '审计管理', '1');
INSERT INTO `tzht_role` VALUES ('3', '日志管理员', '日志管理', '1');
INSERT INTO `tzht_role` VALUES ('4', '认证管理员', '认证管理', '1');

-- ----------------------------
-- Table structure for `tzht_rongcloudim`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_rongcloudim`;
CREATE TABLE `tzht_rongcloudim` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '讨论组标题',
  `rongim` varchar(80) NOT NULL DEFAULT '' COMMENT '讨论组唯一标识',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='融云讨论组表';

-- ----------------------------
-- Records of tzht_rongcloudim
-- ----------------------------
INSERT INTO `tzht_rongcloudim` VALUES ('1', '2018数据驱动产业升级价值峰会讨论组', '400730e3-46b3-49f4-b4e8-430027035c32', '1516687022');
INSERT INTO `tzht_rongcloudim` VALUES ('2', '公开会议讨论组', 'd2a189c5-9c9e-4cf8-b3aa-52d5a5473fd6', '1517025880');
INSERT INTO `tzht_rongcloudim` VALUES ('3', 'GMIC 2018 北京 全球移动互联网大会讨论组', 'e66e3ca3-9308-40fa-88f1-43d693c8daf7', '1517282336');
INSERT INTO `tzht_rongcloudim` VALUES ('4', '同舟鸿图年会(2018.1.30)讨论组', 'e9af4bcf-8ea4-4bc1-8112-dcfed620831c', '1517382265');
INSERT INTO `tzht_rongcloudim` VALUES ('5', '同舟鸿图年会(2018.2.2)讨论组', '95415a6d-13a8-4d87-b8cd-a059d3ad9336', '1517537056');
INSERT INTO `tzht_rongcloudim` VALUES ('6', '同舟鸿图公开会议(2018.2.2)讨论组', '5e355720-b0b5-41db-93e1-aca258549d78', '1517562008');
INSERT INTO `tzht_rongcloudim` VALUES ('7', '同舟鸿图公开会议(2018.2.1)讨论组', '17d112df-1627-45b0-819d-15ad705e3892', '1517564548');
INSERT INTO `tzht_rongcloudim` VALUES ('8', '同舟年会(2018.2.7)讨论组', '6cb8f1f5-5039-4f9f-ac60-645283a43cb5', '1517987121');
INSERT INTO `tzht_rongcloudim` VALUES ('9', '同舟公开会议(2018.2.7)讨论组', 'f5febee7-ac82-425f-b279-b10407375119', '1517987443');
INSERT INTO `tzht_rongcloudim` VALUES ('10', '中网深蓝公开会议(2018.2.7) 讨论组', '8d0a48ef-21a7-478b-a9c2-8cd7e0e29462', '1517987508');
INSERT INTO `tzht_rongcloudim` VALUES ('11', '人工智能中国论坛2018讨论组', 'eeae10f7-bb52-4523-bdc8-c18169da7378', '1519794757');
INSERT INTO `tzht_rongcloudim` VALUES ('12', '测试会议讨论组', 'c37bb17e-1c2a-4049-bb8a-4b7de20ed436', '1520499123');

-- ----------------------------
-- Table structure for `tzht_signjgpush`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_signjgpush`;
CREATE TABLE `tzht_signjgpush` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `conf_id` int(11) NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '推送标题',
  `content` text COMMENT '推送内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '推送标识',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='签到推送消息表';

-- ----------------------------
-- Records of tzht_signjgpush
-- ----------------------------
INSERT INTO `tzht_signjgpush` VALUES ('6', '49', '27', '刘卫国-北京同舟鸿图文化创意有限公司', '刘卫国-北京同舟鸿图文化创意有限公司', '1', '1517358517');
INSERT INTO `tzht_signjgpush` VALUES ('7', '49', '21', '李洪亮-北京同舟鸿图文化创意有限公司', '李洪亮-北京同舟鸿图文化创意有限公司', '1', '1517358534');
INSERT INTO `tzht_signjgpush` VALUES ('8', '50', '32', '陈江-北京同舟鸿图文化创意有限公司', '陈江-北京同舟鸿图文化创意有限公司', '1', '1517358567');
INSERT INTO `tzht_signjgpush` VALUES ('9', '50', '27', '刘卫国-北京同舟鸿图文化创意有限公司 ', '刘卫国-北京同舟鸿图文化创意有限公司 ', '1', '1517358617');
INSERT INTO `tzht_signjgpush` VALUES ('15', '50', '33', '北京同舟鸿图文化创意有限公司 / candy123', '北京同舟鸿图文化创意有限公司 / candy123', '1', '1517363353');
INSERT INTO `tzht_signjgpush` VALUES ('16', '57', '31', '2018.1.31签到提醒', '2018.1.31签到提醒', '1', '1517388748');
INSERT INTO `tzht_signjgpush` VALUES ('17', '59', '27', 'tzhtlwg666 2018.2.1', 'tzhtlwg666 2018.2.1', '1', '1517395157');
INSERT INTO `tzht_signjgpush` VALUES ('19', '58', '27', ' tzhtlwg666 2018.2.1', ' tzhtlwg666 2018.2.1', '1', '1517395199');
INSERT INTO `tzht_signjgpush` VALUES ('21', '63', '27', 'tzhtlwg666 2018年2月2日', 'tzhtlwg666 2018年2月2日', '1', '1517480911');
INSERT INTO `tzht_signjgpush` VALUES ('23', '62', '27', '同舟鸿图年会(2018年2月2日)', '同舟鸿图年会(2018年2月2日)', '1', '1517480984');
INSERT INTO `tzht_signjgpush` VALUES ('25', '62', '33', 'candy123 2018年2月2日', 'candy123 2018年2月2日', '1', '1517532219');
INSERT INTO `tzht_signjgpush` VALUES ('27', '69', '31', '同州 / 阳谷躺哈虎 2018.2.3', '同州 / 阳谷躺哈虎 2018.2.3', '1', '1517658343');
INSERT INTO `tzht_signjgpush` VALUES ('28', '69', '33', '推送测试180203', '推送测试180203', '1', '1517659060');
INSERT INTO `tzht_signjgpush` VALUES ('30', '71', '21', ' 公开会议测试123  hh', ' 公开会议测试123  hh', '1', '1517659746');
INSERT INTO `tzht_signjgpush` VALUES ('31', '87', '35', '欢迎王老师', '王老师欢迎您参加会议，您的议程如下：1、\r\n2、\r\n3、\r\n你的住宿安排如下：\r\n', '1', '1517908067');
INSERT INTO `tzht_signjgpush` VALUES ('32', '88', '35', '欢迎王老师1', '欢迎王老师一名称\r\n背板\r\n音响运输，人工费用\r\n易拉宝\r\n\r\n', '1', '1517909394');
INSERT INTO `tzht_signjgpush` VALUES ('33', '32', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋 2018.2.6', '北京同舟鸿图文化创意有限公司 / 冬日之恋 2018.2.6', '1', '1517910381');
INSERT INTO `tzht_signjgpush` VALUES ('35', '91', '21', '冬日之恋 2018.2.7 10：08', '冬日之恋 2018.2.7 10：08', '1', '1517969344');
INSERT INTO `tzht_signjgpush` VALUES ('36', '92', '36', '年会5', '欢迎参见年会5！', '1', '1517972013');
INSERT INTO `tzht_signjgpush` VALUES ('37', '94', '33', 'candy123 同舟公开会议(2018.2.7)', 'candy123 同舟公开会议(2018.2.7)', '1', '1517986583');
INSERT INTO `tzht_signjgpush` VALUES ('38', '94', '27', 'tzhtlwg666同舟年会(2018.2.7)', 'tzhtlwg666同舟年会(2018.2.7)', '1', '1517986619');
INSERT INTO `tzht_signjgpush` VALUES ('39', '93', '33', 'candy123 同舟公开会议(2018.2.7)', 'candy123 同舟公开会议(2018.2.7)', '1', '1517986647');
INSERT INTO `tzht_signjgpush` VALUES ('40', '93', '32', '135****2050 同舟公开会议(2018.2.7)', '135****2050 同舟公开会议(2018.2.7)', '1', '1517986660');
INSERT INTO `tzht_signjgpush` VALUES ('41', '93', '27', 'tzhtlwg666同舟公开会议(2018.2.7)', 'tzhtlwg666同舟公开会议(2018.2.7)', '1', '1517986671');
INSERT INTO `tzht_signjgpush` VALUES ('42', '94', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋 2018.2.7', '北京同舟鸿图文化创意有限公司 / 冬日之恋 2018.2.7', '1', '1517987217');
INSERT INTO `tzht_signjgpush` VALUES ('43', '93', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋 2018.2.7', '北京同舟鸿图文化创意有限公司 / 冬日之恋  2018.2.7', '1', '1517987811');
INSERT INTO `tzht_signjgpush` VALUES ('44', '95', '33', 'candy123中网深蓝公开会议(2018.2.7) ', 'candy123中网深蓝公开会议(2018.2.7) ', '1', '1517987982');
INSERT INTO `tzht_signjgpush` VALUES ('45', '95', '32', '135****2050中网深蓝公开会议(2018.2.7) ', '135****2050中网深蓝公开会议(2018.2.7) \r\n', '1', '1517987993');
INSERT INTO `tzht_signjgpush` VALUES ('46', '95', '27', 'tzhtlwg666中网深蓝公开会议(2018.2.7) ', 'tzhtlwg666中网深蓝公开会议(2018.2.7) \r\n', '1', '1517988003');
INSERT INTO `tzht_signjgpush` VALUES ('47', '96', '39', 'zwsllwg888 2018.2.7', 'zwsllwg888 2018.2.7', '1', '1517988391');
INSERT INTO `tzht_signjgpush` VALUES ('48', '100', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '1', '1517994959');
INSERT INTO `tzht_signjgpush` VALUES ('49', '100', '40', ' 176****8102', ' 176****8102', '1', '1517995282');
INSERT INTO `tzht_signjgpush` VALUES ('50', '100', '40', '京同舟鸿图文化创意有限公司 / tzht159346', '京同舟鸿图文化创意有限公司 / tzht159346', '1', '1517995583');
INSERT INTO `tzht_signjgpush` VALUES ('51', '101', '22', '北京同舟鸿图文化创意有限公司 / tzht159346', '北京同舟鸿图文化创意有限公司 / tzht159346', '1', '1517995735');
INSERT INTO `tzht_signjgpush` VALUES ('52', '101', '21', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '北京同舟鸿图文化创意有限公司 / 冬日之恋', '1', '1517996004');
INSERT INTO `tzht_signjgpush` VALUES ('53', '102', '41', '2018年公司年会签到温馨消息', '王总发表年会祝福语，猪年大吉大利，新的一年更加辉煌。', '1', '1518052673');
INSERT INTO `tzht_signjgpush` VALUES ('54', '105', '45', '北京同舟鸿图文化创意有限公司 / tzhtlhl2018 2018.2.22', '北京同舟鸿图文化创意有限公司 / tzhtlhl2018  2018.2.22', '1', '1519270861');
INSERT INTO `tzht_signjgpush` VALUES ('56', '106', '46', 'tzhtmn2018', 'tzhtmn2018', '1', '1519794659');
INSERT INTO `tzht_signjgpush` VALUES ('57', '109', '46', '北京同舟鸿图文化创意有限公司 / tzhtmn2018', '北京同舟鸿图文化创意有限公司 / tzhtmn2018', '1', '1519873156');
INSERT INTO `tzht_signjgpush` VALUES ('58', '112', '36', '欢迎北京中网深蓝参会！', '欢迎您参加我们的会议！你的资料请在会议资料栏目中下载！你的住宿房间号是309，请到前台出示身份证领钥匙。如有会务事宜咨询请致电65686680.或者在讨论组中联系管理人员！', '1', '1520318386');

-- ----------------------------
-- Table structure for `tzht_system`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_system`;
CREATE TABLE `tzht_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项键名',
  `value` text COMMENT '配置项键值 1表示开启 0 关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tzht_system
-- ----------------------------
INSERT INTO `tzht_system` VALUES ('1', 'WEB_NAME', '幸会会议APP - 您的专用会议APP！');
INSERT INTO `tzht_system` VALUES ('2', 'WEB_KEYWORDS', '幸会会议,幸会会议APP');
INSERT INTO `tzht_system` VALUES ('3', 'WEB_DESCRIPTION', '幸会会议APP， 您的专用会议APP！客服联系电话010-63942568.');
INSERT INTO `tzht_system` VALUES ('4', 'WEB_URL', 'http://xh.2188.com.cn');
INSERT INTO `tzht_system` VALUES ('5', 'WEB_STATUS', '1');
INSERT INTO `tzht_system` VALUES ('6', 'WEB_CLOSE_WORD', '网站维护中，请稍后访问！');
INSERT INTO `tzht_system` VALUES ('7', 'COPYRIGHT_WORD', '©2017 -2020幸会');
INSERT INTO `tzht_system` VALUES ('8', 'WEB_ICP_NUMBER', '京ICP备12040646号-1');
INSERT INTO `tzht_system` VALUES ('9', 'WEB_STATISTICS', '');
INSERT INTO `tzht_system` VALUES ('10', 'EMAIL_SMTP', 'smtp.163.com');
INSERT INTO `tzht_system` VALUES ('11', 'EMAIL_USERNAME', 'lovesherry55@163.com');
INSERT INTO `tzht_system` VALUES ('12', 'EMAIL_PASSWORD', '573301558wo.');
INSERT INTO `tzht_system` VALUES ('13', 'EMAIL_FROM_NAME', '同舟鸿图-幸会');
INSERT INTO `tzht_system` VALUES ('14', 'COMMENT_REVIEW', '0');
INSERT INTO `tzht_system` VALUES ('15', 'COMMENT_SEND_EMAIL', '0');
INSERT INTO `tzht_system` VALUES ('16', 'EMAIL_RECEIVE', '');
INSERT INTO `tzht_system` VALUES ('17', 'APP_VERSION', '2.1.0');
INSERT INTO `tzht_system` VALUES ('18', 'APP_PHONE', '010-63942568');
INSERT INTO `tzht_system` VALUES ('19', 'APP_URL', 'http://xh.2188.com.cn');
INSERT INTO `tzht_system` VALUES ('20', 'APP_COMPANY', '幸会APP');
INSERT INTO `tzht_system` VALUES ('21', 'APP_ADDRESS', '北京市石景山区体育场南路2号景阳宏昌大厦');
INSERT INTO `tzht_system` VALUES ('22', 'APP_INFO', '幸会APP，您身边的专用会议APP！');
INSERT INTO `tzht_system` VALUES ('23', 'ACCOUNT_NUM', '15');
INSERT INTO `tzht_system` VALUES ('24', 'PARTNERS_NUM', '2');

-- ----------------------------
-- Table structure for `tzht_user`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_user`;
CREATE TABLE `tzht_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `part_id` varchar(255) NOT NULL COMMENT '合作伙伴',
  `email` varchar(80) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(60) NOT NULL DEFAULT '' COMMENT '用户密码',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `logo` varchar(100) NOT NULL DEFAULT '/Uploads/image/logo.png',
  `catename` varchar(40) NOT NULL COMMENT '栏目名称',
  `companyname` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `position` varchar(20) NOT NULL DEFAULT '' COMMENT '职位',
  `address` varchar(60) NOT NULL DEFAULT '' COMMENT '地址',
  `area` varchar(60) NOT NULL DEFAULT '' COMMENT '街道详细地址',
  `email_check_code` char(40) NOT NULL DEFAULT '' COMMENT '用户邮箱验证',
  `email_check_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱验证过期时间',
  `check_telphone` char(6) NOT NULL DEFAULT '' COMMENT '用户手机验证',
  `statuses` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否审核',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '1表示个人，2表示企业',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `utime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `login_ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT '登录ip',
  `serialno` char(40) NOT NULL COMMENT '序列编号',
  `token` varchar(255) NOT NULL DEFAULT '0' COMMENT '交互token',
  `website` varchar(80) NOT NULL COMMENT '官网地址',
  `profile` text NOT NULL COMMENT '公司简介',
  `signature` varchar(255) NOT NULL COMMENT '个性签名',
  `dimecode` varchar(80) NOT NULL COMMENT '二维码',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `remark` varchar(80) NOT NULL COMMENT '二级账户备注信息',
  `level` tinyint(1) NOT NULL COMMENT '等级区分',
  `jpush` varchar(255) NOT NULL COMMENT '极光推送别名',
  `is_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否登录，0为退出，1为登录',
  `landline` varchar(20) NOT NULL COMMENT '座机号',
  `bphone` char(11) NOT NULL,
  `nickname` varchar(100) NOT NULL COMMENT '昵称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='用户基础表';

-- ----------------------------
-- Records of tzht_user
-- ----------------------------
INSERT INTO `tzht_user` VALUES ('4', '', '', '189****6236', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18911936236', '/./Uploads/Avatar/2018-01-17/5a5ec83f98c52.jpeg', '信息技术', '北京同舟鸿图文化创意有限公司', '部门经理', '北京市北京市朝阳区', '景阳宏昌大厦307-309', '', '0', '', '1', '2', '1516160158', '0', '127.0.0.1', '', 'rBUsAg/tLTcDWEquk4OEbMliGEQzHZkcn1MyOsaOWek8HprMJp2++42mlxtBJ99Y7wThXY6dnpnqTcEoqtTn7A==', 'www.tzht.net.cn', '公司集设计、开发、营销为一体的综合性公司，公司主要为大型企事业单位提供技术开发、技术咨询、技术服务等，同时在移动互联网创新领域方面有一定的研究，并且跟相关技术研究院等科研机构有比较广泛深入的战略合作。', '', '/App/Index/usercode/id/4.html', '0', '', '0', '4_xinghuiapp', '0', '010-63942568', '', '');
INSERT INTO `tzht_user` VALUES ('32', '', '', '135****2050', '8BC5DE83CF1DAF79ED5B2F13F93D7C05D01D0388', '', '/./Uploads/Avatar/2018-01-30/5a704b6d9c5d8.jpeg', '', '', '', '', '', '', '0', '', '1', '1', '1517308233', '0', '127.0.0.1', '', 'XIOUEz9/y/jHsETRLnbNHWLgkQ3O+7PFPxqmhyeRWfhtqPYOfBKwmvR/vVfNYBCtQcp3eaFxM3M=', '', '', '', '/App/Index/usercode/id/32.html', '0', '', '0', '32_xinghuiapp', '0', '', '13552832050', '');
INSERT INTO `tzht_user` VALUES ('34', '', '', '156****5039', '321E18352A7BA2DB7EF14553F8F8E14904B3D36C', '15652465039', '/./Uploads/Avatar/2018-02-07/5a7a9c6216a7e.jpeg', '信息技术', '北京中网深蓝技术有限公司', '', '', '', '', '0', '', '1', '2', '1517646995', '0', '127.0.0.1', '', 'eubA0xvJWBkgXb07WpkeMsliGEQzHZkcn1MyOsaOWekgDWgIXlP1tu4559nud8y3ZZHqvRmMvWHqTcEoqtTn7A==', 'www.2188.com.cn', '', '', '/App/Index/usercode/id/34.html', '0', '', '0', '34_xinghuiapp', '0', '0106666666', '', '我的未来我做主');
INSERT INTO `tzht_user` VALUES ('36', '', '', 'zwslsw01', '5C81FACCDA530A8079ACDEB1F04DF130EAC80B8A', '18600012222', '/./Uploads/Avatar/2018-02-24/5a9113d37fbd4.jpeg', '', '北京中网深蓝技术有限公司', '', '', '', '', '0', '', '1', '1', '1517909650', '0', '127.0.0.1', '', 'n0jnBBy0fLeHVGb2jk+Cf8liGEQzHZkcn1MyOsaOWekgDWgIXlP1tjh9N4mgZk5m2lXb0Rf1ZorqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/36.html', '34', '中网深蓝商务', '2', '36_xinghuiapp', '1', '', '', '');
INSERT INTO `tzht_user` VALUES ('39', '', '', 'zwsllwg888', 'E89F915537E646C4D9125BD06652BB8FDF6C24B8', '18911936258', '/Uploads/image/logo.png', '', '北京中网深蓝技术有限公司', '', '', '', '', '0', '', '1', '1', '1517986382', '0', '127.0.0.1', '', 'gKn9O0X4lcF/d6InOUJ89pIRREFK8oWTStcrEQuqMRrxHr6qR7xTna6mrke8MMZ3ml/UUxaBgDpGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/39.html', '34', '刘卫国', '2', '39_xinghuiapp', '0', '', '', '');
INSERT INTO `tzht_user` VALUES ('40', '', '', '176****8102', '0E2260CA7E6A2449009437DDA311E4742A5E4E7C', '17600898102', '/./Uploads/Avatar/2018-03-08/5aa0d51243306.jpeg', '信息技术', '', '', '广东省潮州市潮安县', '', '', '0', '', '1', '1', '1517992379', '0', '127.0.0.1', '', '/vYuz/boQ/Ny4z0IFF/xScliGEQzHZkcn1MyOsaOWekgDWgIXlP1tiLK0/V0opJXRkbcvNZOjAPqTcEoqtTn7A==', '', '', '', '/App/Index/usercode/id/40.html', '0', '', '0', '40_xinghuiapp', '0', '', '', '不忘初心');
INSERT INTO `tzht_user` VALUES ('41', '', '', 'tzhtwyg2018', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18601159800', '/./Uploads/Avatar/2018-02-07/5a7b0d286ada9.jpeg', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518002440', '0', '127.0.0.1', '', 'd06IM2oUv2rHsETRLnbNHWLgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXqnX0GnxQ5wYvX4pUdlSrUU=', '', '', '言善信，政善治', '/Home/Index/usercode/id/41.html', '4', '王总', '2', '41_xinghuiapp', '1', '', '', '欣欣向荣');
INSERT INTO `tzht_user` VALUES ('43', '', '', 'tzhtlwg2018', 'AB0B8AA0D76D57B0D463A7209F52267ADF686184', '18911936235', '/./Uploads/Avatar/2018-02-08/5a7b25b0b1c68.jpeg', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518002935', '0', '127.0.0.1', '', 'swvWzb9jyu7fDl/0uubxzmLgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXnnmPZ7jmzD17mkxtGsS5Lk=', '', '', '', '/Home/Index/usercode/id/43.html', '4', '刘为国', '2', '43_xinghuiapp', '1', '', '', '');
INSERT INTO `tzht_user` VALUES ('44', '', '', 'tzhtcj2018', 'C114AE895D99BDC15E025880FD44A99B2427CD52', '13717563627', '/./Uploads/Avatar/2018-02-07/5a7aedb1e4dca.jpeg', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518002997', '0', '127.0.0.1', '', '/9/iXbSOCkHfDl/0uubxzmLgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXq/X1iP9JorN+FaaOCSkvxw=', '', '', '', '/Home/Index/usercode/id/44.html', '4', '陈江', '2', '44_xinghuiapp', '1', '', '', '');
INSERT INTO `tzht_user` VALUES ('45', '', '', 'tzhtlhl2018', '9D37FF541601DE56D952276F07082FBB0AE78B16', '18810356923', '/./Uploads/Avatar/2018-02-22/5a8e632a63865.jpeg', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518003074', '0', '127.0.0.1', '', 'w40L+qNEyn0S1t2gMU1eVmLgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXuhzU4ia7gFbaSNcrwcfN0k=', '', '', '', '/Home/Index/usercode/id/45.html', '34', '李洪亮', '2', '45_xinghuiapp', '0', '', '', '睡醒的兔子');
INSERT INTO `tzht_user` VALUES ('46', '', '18810356923@163.com', 'tzhtmn2018', '062C669DEC1DE6FA75598F3D0692622959C09AF7', '13311268626', '/./Uploads/Avatar/2018-02-26/5a93d301efb2c.jpeg', '金融保险', '北京同舟鸿图文化创意有限公司', '', '北京市北京市朝阳区', '', '', '0', '', '1', '1', '1518003123', '0', '127.0.0.1', '', '5Uq/VIyXsE6HVGb2jk+Cf8liGEQzHZkcn1MyOsaOWelEexqr/4o97d3HpC17uqr9SHigztD6D4rqTcEoqtTn7A==', '', '', '个人签名', '/Home/Index/usercode/id/46.html', '4', '马娜', '2', '46_xinghuiapp', '0', '', '', '阳光沙滩');
INSERT INTO `tzht_user` VALUES ('47', '', '', 'tzhtlsa2018', 'F9D151D14A8555A9DEACC13FBDF28227ABEC3003', '13800138000', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518003189', '0', '127.0.0.1', '', 'fYtcPjzeXePg4jo/hqzlhcliGEQzHZkcn1MyOsaOWelEexqr/4o97a/r2enVlabWHJOalB0wzn3qTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/47.html', '4', '刘思奥', '2', '47_xinghuiapp', '0', '', '', '');
INSERT INTO `tzht_user` VALUES ('48', '', '', 'tzhtzyl2018', '8FBE4E08BEEB81D608617D6A9C787AFDDAB46D09', '13811176012', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518003250', '0', '127.0.0.1', '', 'RZI7BxgHViH/tBfbLpQhXsliGEQzHZkcn1MyOsaOWelEexqr/4o97da+5Zpfxxu4BOrKZkXxRjrqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/48.html', '4', '赵银玲', '2', '48_xinghuiapp', '0', '', '', '');
INSERT INTO `tzht_user` VALUES ('49', '', '', 'tzhtwxq2018', 'E353DCC768D2D8529A9B8A91D1831487069B89B9', '13800138001', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518003288', '0', '127.0.0.1', '', 'pRWKTFqeE+Q8fG2QgB/WzMliGEQzHZkcn1MyOsaOWelEexqr/4o97aAUi8cJiLWD9IW5mgqsa2LqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/49.html', '4', '王小群', '2', '49_xinghuiapp', '1', '', '', '');
INSERT INTO `tzht_user` VALUES ('50', '', '', 'tzhtdyx2018', '1292F0FCABC7A4D53506076ADD4D3B4819C6E2A5', '13693326383', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518003327', '0', '127.0.0.1', '', 'B7lr72gQNhuDIbe9u7/htMliGEQzHZkcn1MyOsaOWelEexqr/4o97VWIq6iB1uEg8RV1KD3q8LjqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/50.html', '4', '邓雅心', '2', '50_xinghuiapp', '0', '', '', '');
INSERT INTO `tzht_user` VALUES ('51', '', '', 'admin123', 'F865B53623B121FD34EE5426C792E5C33AF8C227', '13717563626', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518007121', '0', '127.0.0.1', '', 'XGaGPXFWeUiOyanjEV1tzZIRREFK8oWTStcrEQuqMRrxHr6qR7xTndmSYOZ+IKG3gXhWFWoyPIBGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/51.html', '4', 'admin123', '2', '51_xinghuiapp', '0', '', '', '');
INSERT INTO `tzht_user` VALUES ('52', '', '', '133****0919', '945181A1A54BF7F7BB6D5ADF7F0EF671DA8D451A', '13391910919', '/Uploads/image/logo.png', '', '', '', '', '', '', '0', '', '1', '1', '1518059503', '0', '127.0.0.1', '', 'kW076EEbls7Aayl6zUG9v2LgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXs2bd0Jpd1lkXzfzqMjHmP4=', '', '', '', '/App/Index/usercode/id/52.html', '0', '', '0', '52_xinghuiapp', '0', '', '', '');
INSERT INTO `tzht_user` VALUES ('53', '', '', '186****9918', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18618249918', '/./Uploads/Avatar/2018-02-09/5a7d72b806dab.jpeg', '文化传媒', '北京水云舟文化创意有限公司', '', '', '', '', '0', '', '1', '2', '1518170482', '0', '127.0.0.1', '', 'bYxeGKFbOMp7xnbJUSCND5IRREFK8oWTStcrEQuqMRrxHr6qR7xTnUroInnUmfyye/oEa94PsLZGZXlsl2ZFEg==', '', '', '', '/App/Index/usercode/id/53.html', '0', '', '0', '53_xinghuiapp', '0', '', '', '');
INSERT INTO `tzht_user` VALUES ('57', '', '', 'candy1235', '88A2C89B711FF4F38523BCD0E6D2E14EF68092C5', '13552832050', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1519787432', '0', '127.0.0.1', '', 'AG262bfnI0J/mA8HxL3hZpIRREFK8oWTStcrEQuqMRrxHr6qR7xTndp0raT5x4C2Y/TNmfuf4fBGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/57.html', '4', 'candy1235', '2', '57_xinghuiapp', '0', '', '', '');
INSERT INTO `tzht_user` VALUES ('58', '', '', 'syzsw1', '77BDD7687B818827705160E0898891C3CF3B3B08', '13910013322', '/Uploads/image/logo.png', '', '北京水云舟文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1520574198', '0', '127.0.0.1', '', 'NeWYCafWvvMPgP4nuNHb9GLgkQ3O+7PFPxqmhyeRWfj/bbavo7pNSp7GDhZjLs0MRqXt3sMlNaY=', '', '', '', '/Home/Index/usercode/id/58.html', '53', '水云舟商务', '2', '58_xinghuiapp', '0', '', '', '');

-- ----------------------------
-- Table structure for `tzht_user_partners`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_user_partners`;
CREATE TABLE `tzht_user_partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conf_id` int(11) NOT NULL COMMENT '会议id',
  `email` varchar(80) NOT NULL DEFAULT '' COMMENT '合作伙伴邮箱',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '合作伙伴手机号',
  `logo` varchar(100) NOT NULL DEFAULT '/Uploads/image/logo.png',
  `companyname` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `address` varchar(60) NOT NULL DEFAULT '' COMMENT '地址',
  `area` varchar(60) NOT NULL DEFAULT '' COMMENT '街道详细地址',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `utime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `website` varchar(80) NOT NULL COMMENT '官网地址',
  `profile` text NOT NULL COMMENT '公司简介',
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '用户类型，2表示企业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='合作伙伴表';

-- ----------------------------
-- Records of tzht_user_partners
-- ----------------------------
INSERT INTO `tzht_user_partners` VALUES ('1', '35', '1601796593@qq.com', '18810356923', '[\"\\/Uploads\\/image\\/2018-01-27\\/5a6c2ca4e58c4.jpg\"]', '水云周', '北京北京市石景山区', '水云周', '1517038794', '1517038794', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '水云周', '2');
INSERT INTO `tzht_user_partners` VALUES ('2', '35', 'web@isu5.cn', '13718601024', '\"\\/Uploads\\/userc\\/2018-01-29\\/5a6e8bf75dd77.jpg\"', '北京联达动力信息科技股份有限公司', '北京北京市石景山区', '海淀大街甲38号银科大厦2206-08室', '1517194256', '1517194256', 'http://www.lkpower.com', '32432432', '2');
INSERT INTO `tzht_user_partners` VALUES ('4', '32', '1601796593@qq.com', '18810356923', '\"\\/Uploads\\/userc\\/2018-01-29\\/5a6e8da9e9cdd.jpg\"', 'a', '北京北京市石景山区', 'a', '1517194666', '1517194666', 'a', 'a', '2');
INSERT INTO `tzht_user_partners` VALUES ('5', '32', 'web@isu5.cn', '13718601024', '/Uploads/userc/2018-01-29/5a6e8e3023c28.jpg', '北京联达动力信息科技股份有限公司', '北京北京市石景山区', '海淀大街甲38号银科大厦2206-08室', '1517194855', '1517194855', 'http://www.lkpower.com', '12312', '2');
INSERT INTO `tzht_user_partners` VALUES ('6', '47', '18810356954@qq.com', '18810356524', '/Uploads/userc/2018-01-30/5a7039190b61b.jpg', '天猫', '北京北京市石景山区', '天猫', '1517304113', '1517304113', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '天猫', '2');
INSERT INTO `tzht_user_partners` VALUES ('7', '109', '1601796596@qq.com', '18601159800', '/Uploads/userc/2018-03-01/5a976d227aa84.jpg', 'Escom Events', '北京北京市石景山区', '成都 四川省成都市总府街31号', '1519873382', '1519873382', 'http://xh.2188.com.cn', '成都 四川省成都市总府街31号', '2');
INSERT INTO `tzht_user_partners` VALUES ('8', '106', '16017965693@qq.com', '18810356955', '/Uploads/userc/2018-03-01/5a976fa0b8353.jpg', '上海必矿企业管理咨询有限公司', '北京北京市石景山区', '以色列，特拉维夫希尔顿酒店', '1519873987', '1519873987', '以色列，特拉维夫希尔顿酒店', '以色列，特拉维夫希尔顿酒店', '2');
