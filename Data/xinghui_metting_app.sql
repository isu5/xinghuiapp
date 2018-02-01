/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xinghui

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-01 13:34:27
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
INSERT INTO `tzht_admin` VALUES ('1', 'admin123', '1eea36fbd4f4919251e3192dce2da380', '', '', '1', '123.114.107.201', '1517453727', '208');
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
INSERT INTO `tzht_bulletin` VALUES ('2', '2018 CBEC AI 中国人工智能发展应用峰会2', '<h1 class=\"ev_name\" style=\"padding: 0px; margin: 10px 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; font-size: 18px; white-space: normal;\">2018 CBEC AI 中国人工智能发展应用峰会</h1><p><br/></p>', '1516182932', '', '50', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='个人认证表';

-- ----------------------------
-- Records of tzht_certify
-- ----------------------------
INSERT INTO `tzht_certify` VALUES ('2', '4', '', '', '', '', '北京同舟鸿图文化创意有限公司', '9111010758589247XH', '/./Uploads/Certificate/2018-01-17/5a5ec5c191f36.JPG', '1516160449', '2', '2');
INSERT INTO `tzht_certify` VALUES ('3', '14', '', '', '', '', '北京同舟鸿图文化创意有限公司', '9111010758589247XH', '/./Uploads/Certificate/2018-01-18/5a5ff7914a55d.jpg', '1516238737', '2', '4');
INSERT INTO `tzht_certify` VALUES ('4', '25', '王永刚', '140202197411302510', '/./Uploads/Idcard/2018-01-22/5a65cd6089ef6.JPG', '/./Uploads/Idcard/2018-01-22/5a65cd6091c15.JPG', '', '', '', '1516621152', '1', '1');

-- ----------------------------
-- Table structure for `tzht_chatgroup`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_chatgroup`;
CREATE TABLE `tzht_chatgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '群组id',
  `c_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群主id',
  `s_id` text COMMENT '群员集合id',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '群组标题',
  `content` varchar(255) NOT NULL DEFAULT '未设置' COMMENT '群公告',
  `rongid` varchar(80) NOT NULL DEFAULT '' COMMENT '融云群组标识',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '群组添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='群组表';

-- ----------------------------
-- Records of tzht_chatgroup
-- ----------------------------
INSERT INTO `tzht_chatgroup` VALUES ('3', '26', '4', '1596', '群组公告', '8d7fb5bb-1248-4bbd-93f6-c3558b732523', '1516950143');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='企业公告表';

-- ----------------------------
-- Records of tzht_company_bull
-- ----------------------------
INSERT INTO `tzht_company_bull` VALUES ('15', '22', 'fhh', '[\"\\/Uploads\\/Companybull\\/20180122\\/1516592680\\/img_1516592657661.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180122\\/1516592680\\/幸会后台管理系统数据库数据表结构.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180122\\/1516592680\\/IOS客户端功能修复(8月6日).docx\"]', '', 'ghh', '1516592680');
INSERT INTO `tzht_company_bull` VALUES ('16', '22', 'gg', '[\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592705831.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592705943.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592706027.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592706122.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592706182.jpg\",\"\\/Uploads\\/Companybull\\/20180122\\/1516592732\\/img_1516592706296.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180122\\/1516592732\\/幸会后台管理系统数据库数据表结构.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180122\\/1516592732\\/IOS客户端功能修复(8月6日).docx\"]', '', 'ggy', '1516592732');
INSERT INTO `tzht_company_bull` VALUES ('18', '25', '1', '[\"\\/Uploads\\/Companybull\\/20180125\\/1516838632\\/img_1516838619997.jpg\"]', 'null', '', '口', '1516838632');
INSERT INTO `tzht_company_bull` VALUES ('23', '21', '4855', '[\"\\/Uploads\\/Companybull\\/20180129\\/1517199645\\/img_1517199613839.jpg\",\"\\/Uploads\\/Companybull\\/20180129\\/1517199645\\/img_1517199613893.jpg\",\"\\/Uploads\\/Companybull\\/20180129\\/1517199645\\/img_1517199613943.jpg\",\"\\/Uploads\\/Companybull\\/20180129\\/1517199645\\/img_1517199614024.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180129\\/1517199645\\/幸会后台管理系统数据库数据表结构.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180129\\/1517199645\\/IOS客户端功能修复(8月6日).docx\"]', '', '天空', '1517199645');
INSERT INTO `tzht_company_bull` VALUES ('30', '30', '585', '[\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178039.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178152.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178223.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178273.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517283202\\/img_1517283178327.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180130\\/1517283202\\/幸会后台管理系统数据库数据表结构.xlsx\"]', '', '填空呢', '1517283202');
INSERT INTO `tzht_company_bull` VALUES ('32', '31', '55', '[\"\\/Uploads\\/Companybull\\/20180130\\/1517305810\\/img_1517305779187.jpg\",\"\\/Uploads\\/Companybull\\/20180130\\/1517305810\\/img_1517305779320.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180130\\/1517305810\\/幸会后台管理系统数据库数据表结构.xlsx\"]', '', '啦啦啦', '1517305810');
INSERT INTO `tzht_company_bull` VALUES ('33', '25', '全球能源', '[\"\\/Uploads\\/Companybull\\/20180130\\/1517306474\\/img_1517306445273.jpg\"]', 'null', '', '全球能源', '1517306474');
INSERT INTO `tzht_company_bull` VALUES ('34', '21', '公告', '[\"\\/Uploads\\/Companybull\\/20180201\\/1517461587\\/img_1517461563564.jpg\",\"\\/Uploads\\/Companybull\\/20180201\\/1517461587\\/img_1517461563673.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180201\\/1517461587\\/microlog.txt\",\"\\/Uploads\\/Companybull\\/file\\/20180201\\/1517461587\\/.dev_id.txt\"]', '', '186784', '1517461587');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='会议表';

-- ----------------------------
-- Records of tzht_conference
-- ----------------------------
INSERT INTO `tzht_conference` VALUES ('32', 'GMIC 2018 北京 全球移动互联网大会', '2018-01-23 00:00:00', '2018-02-28 00:00:00', '2018-02-07 00:00:00', '北京北京市石景山区', '景阳宏昌', '[\"\\/Uploads\\/image\\/2018-01-30\\/5a6fbe9a723e0.jpg\"]', '北京同舟鸿图文化创意有限公司', 'Candy', '18810356923', '/Uploads/file/20180130/1517272730/A+Byte+of+Python.pdf###', '4', '2', '1516682898', '564', '1', '0', '', '', '', '<p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">亲爱的吉米客们（GMICers）：</strong></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">GMIC北京2017大会5万人参与的景象犹在眼前，GMIC北京2018又拉开了启动大幕。2018年4月26日-28日，我们又将相会在国家会议中心，共同见证中国<a href=\"https://m.huodongjia.com/tag/437/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">互联网</a>和<a href=\"https://m.huodongjia.com/tag/1192/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">科技</a>领域的进步与发展。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">站在AlphaGo Zero、量子技术、<a href=\"https://m.huodongjia.com/tag/17374/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">区块链</a>等各种新技术持续爆发的时代关口，我们有必要回顾一下中国互联网与科技的<a href=\"https://m.huodongjia.com/tag/926/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">历史</a>，从时代的角度来剖析中国互联网与科技的未来：<br/><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">1998年-2007年 中国PC互联网的黄金十年</strong></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">1998年，是中国互联网企业值得纪念的一年，这一年，腾讯、新浪、京东、搜狐都纷纷成立，奠定了中国互联网在全球市场的地位，直至今日，这些即将迎来20年诞辰的企业仍屹立在行业之巅。以网易、新浪、搜、腾讯为代表的“四大门户”共同拉开了中国互联网高速发展的帷幕，深刻影响了中国的<a href=\"https://m.huodongjia.com/tag/909/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">经济</a>、<a href=\"https://m.huodongjia.com/tag/1742/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">社会</a>的发展。</p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\"><strong style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px;\">2008年-2017年 中国<a href=\"https://m.huodongjia.com/tag/966/\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; list-style: none; max-width: 768px; text-decoration: none;\">移动互联网</a>的黄金十年</strong></p><p style=\"padding: 0px; font-family: 微软雅黑; box-sizing: border-box; list-style: none; max-width: 768px; width: 728px; color: rgb(102, 102, 102); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255); margin-top: 0px !important; margin-bottom: 0px !important; font-size: 14px !important;\">2008年，iPhone的入华标志着中国互联网进入到了移动互联网时代，微博、小米、微信、美团等明向企业纷纷崛起，成为大众的生活中不可缺少的重要工具。而随着移动互联网的崛起，在市场、资本等力量的共同作用下，中国互联网的发展也超越了欧美等传统科技强国，实现了从“copy to China”到“copy from China”的逆转，成就了新的全球经济奇迹。</p><p><br/></p>', '0');
INSERT INTO `tzht_conference` VALUES ('35', '公开会议', '2018-01-24 00:00:00', '2018-01-31 00:00:00', '2018-01-30 00:00:00', '北京北京市石景山区', 'w', '[\"\\/Uploads\\/Conference\\/20180129\\/1517221511\\/img_1516350488408.jpg\"]', '北京同舟鸿图文化创意有限公司', '我', '18810356923', '/Uploads/file/20180129/1517212849/幸会后台管理系统数据库数据表结构.xlsx###', '4', '3', '1516774729', '1110', '1', '1', '<p>会议日程</p>', '<p>会议嘉宾</p>', '<p>参会指南</p>', '会议简介 123', '0');
INSERT INTO `tzht_conference` VALUES ('36', '同舟鸿图内部会议', '2018-01-24 00:00:00', '2018-02-24 00:00:00', '2018-01-31 00:00:00', '北京北京市石景山区', '景阳宏昌', '[\"\\/Uploads\\/image\\/2018-01-24\\/5a6826aec89aa.jpg\"]', '北京同舟鸿图文化创意有限公司', '刘卫国', '18911936236', '', '4', '2', '1516775108', '8', '1', '0', '', '', '', '<p>同舟鸿图内部会议</p>', '1');
INSERT INTO `tzht_conference` VALUES ('49', '同舟鸿图年会(2018.1.30)', '2018-01-31 10:00:00', '2018-01-31 18:00:00', '2018-01-31 10:00:00', '北京北京市石景山区', '景阳宏昌309', '[\"\\/Uploads\\/image\\/2018-01-24\\/5a6826aec89aa.jpg\"]', '北京同舟鸿图文化创意有限公司', '李洪亮', '18810356923', '/Uploads/file/20180130/1517306889/A+Byte+of+Python.pdf###', '4', '2', '1517306900', '6', '1', '1', '', '', '', '<p>会议简介</p>', '1');
INSERT INTO `tzht_conference` VALUES ('50', '同舟鸿图公开会议(2018.1.30)', '2018-01-31 10:00:00', '2018-01-31 18:00:00', '2018-01-31 10:00:00', '北京北京市石景山区', '景阳宏昌309', '[\"\\/Uploads\\/image\\/2018-01-24\\/5a6826aec89aa.jpg\"]', '北京同舟鸿图文化创意有限公司', '李洪亮', '18810356923', '/Uploads/file/20180130/1517307087/A+Byte+of+Python.pdf###', '4', '2', '1517307098', '6', '1', '1', '', '', '', '<p>会议简介</p>', '0');
INSERT INTO `tzht_conference` VALUES ('58', '同舟鸿图公开会议(2018.2.1)', '2018-02-01 09:00:00', '2018-02-01 18:00:00', '2018-02-01 09:00:00', '北京北京市石景山区', '景阳宏昌309', '[\"\\/Uploads\\/image\\/2018-01-24\\/5a6826aec89aa.jpg\"]', '北京同舟鸿图文化创意有限公司', '李洪亮', '18810356923', '', '4', '2', '1517394442', '6', '1', '0', '', '', '', '<p><span style=\"color: rgb(51, 51, 51); font-family: \">会议简介</span></p>', '0');
INSERT INTO `tzht_conference` VALUES ('59', '同舟鸿图年会(2018.2.1)', '2018-02-01 09:00:00', '2018-02-01 18:00:00', '2018-02-01 09:00:00', '北京北京市石景山区', '景阳宏昌309', '[\"\\/Uploads\\/product\\/2018-02-01\\/5a72a4d6ad576.jpg\"]', '北京同舟鸿图文化创意有限公司', '李洪亮', '18810356923', '', '4', '2', '1517394550', '5', '1', '0', '', '', '', '<p>会议简介</p>', '1');
INSERT INTO `tzht_conference` VALUES ('60', '201会议测试', '2018-02-01 00:00:00', '2018-02-02 00:00:00', '2018-01-31 18:00:00', '北京北京市石景山区', '北辰东路8号北京国际会议中心', '[\"\\/Uploads\\/image\\/2018-01-24\\/5a6826aec89aa.jpg\"]', '北京同舟鸿图文化创意有限公司', '郑伟', '13717563620', '', '4', '2', '1517455726', '2000', '0', '0', '', '', '', '201会议测试\n\n', '0');

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
INSERT INTO `tzht_conference_audit` VALUES ('32', '26', '0');
INSERT INTO `tzht_conference_audit` VALUES ('32', '21', '1');
INSERT INTO `tzht_conference_audit` VALUES ('35', '21', '0');
INSERT INTO `tzht_conference_audit` VALUES ('36', '21', '4');
INSERT INTO `tzht_conference_audit` VALUES ('36', '25', '3');
INSERT INTO `tzht_conference_audit` VALUES ('32', '25', '0');
INSERT INTO `tzht_conference_audit` VALUES ('35', '4', '0');
INSERT INTO `tzht_conference_audit` VALUES ('35', '26', '0');
INSERT INTO `tzht_conference_audit` VALUES ('35', '28', '1');
INSERT INTO `tzht_conference_audit` VALUES ('32', '15', '2');
INSERT INTO `tzht_conference_audit` VALUES ('32', '30', '4');
INSERT INTO `tzht_conference_audit` VALUES ('50', '21', '4');
INSERT INTO `tzht_conference_audit` VALUES ('49', '21', '4');
INSERT INTO `tzht_conference_audit` VALUES ('50', '27', '4');
INSERT INTO `tzht_conference_audit` VALUES ('49', '27', '4');
INSERT INTO `tzht_conference_audit` VALUES ('50', '32', '1');
INSERT INTO `tzht_conference_audit` VALUES ('50', '31', '1');
INSERT INTO `tzht_conference_audit` VALUES ('32', '31', '1');
INSERT INTO `tzht_conference_audit` VALUES ('49', '33', '4');
INSERT INTO `tzht_conference_audit` VALUES ('50', '33', '4');
INSERT INTO `tzht_conference_audit` VALUES ('59', '21', '0');
INSERT INTO `tzht_conference_audit` VALUES ('58', '21', '4');
INSERT INTO `tzht_conference_audit` VALUES ('58', '27', '4');
INSERT INTO `tzht_conference_audit` VALUES ('59', '27', '0');

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
INSERT INTO `tzht_conference_auditlist` VALUES ('32', '26', '4');
INSERT INTO `tzht_conference_auditlist` VALUES ('32', '21', '1');
INSERT INTO `tzht_conference_auditlist` VALUES ('35', '21', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('36', '21', '4');
INSERT INTO `tzht_conference_auditlist` VALUES ('36', '25', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('32', '25', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('35', '4', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('35', '26', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('35', '28', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('32', '15', '2');
INSERT INTO `tzht_conference_auditlist` VALUES ('32', '30', '4');
INSERT INTO `tzht_conference_auditlist` VALUES ('50', '21', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('49', '21', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('50', '27', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('49', '27', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('50', '32', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('50', '31', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('32', '31', '1');
INSERT INTO `tzht_conference_auditlist` VALUES ('49', '33', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('50', '33', '5');
INSERT INTO `tzht_conference_auditlist` VALUES ('59', '21', '4');
INSERT INTO `tzht_conference_auditlist` VALUES ('58', '21', '4');
INSERT INTO `tzht_conference_auditlist` VALUES ('58', '27', '4');
INSERT INTO `tzht_conference_auditlist` VALUES ('59', '27', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会议公告表';

-- ----------------------------
-- Records of tzht_conference_bull
-- ----------------------------
INSERT INTO `tzht_conference_bull` VALUES ('1', '35', '4', '会议公告', '', '<p>会议公告</p>', '1517205154');
INSERT INTO `tzht_conference_bull` VALUES ('2', '35', '4', '会议公告', '', '<p>会议公告</p>', '1517205155');
INSERT INTO `tzht_conference_bull` VALUES ('3', '32', '4', '会议公告', '', '<p><strong>公告通知</strong></p><p style=\"line-height: 16px;\"><img src=\"http://xh.2188.com.cn/Public/statics/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Uploads/ueditor/file/20180130/1517282928.pdf\" title=\"幸会.pdf\">幸会.pdf</a></p><p><img src=\"/Uploads/ueditor/image/20180130/1517282946.jpg\" title=\"1517282946.jpg\" alt=\"1516848854739.jpg\"/></p>', '1517282948');
INSERT INTO `tzht_conference_bull` VALUES ('4', '32', '4', '会议公告02', '', '<p><span style=\"color: rgb(255, 0, 0);\"><strong>会议公告通知</strong></span></p><p><span style=\"color: rgb(255, 0, 0);\"></span></p><p style=\"line-height: 16px;\"><img src=\"http://xh.2188.com.cn/Public/statics/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/Uploads/ueditor/file/20180130/1517295110.pdf\" title=\"接口文档.pdf\">接口文档.pdf</a></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(85, 85, 85); font-family: \"microsoft yahei\"; line-height: 35px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: 14px;\">1、在C:\\User\\<用户名>\\.gradle 目录下<span style=\"font-size: 14px; color: rgb(79, 129, 189);\">新建</span>一个gradle.properties文件，并在里面添加一行：org.gradle.daemon=true</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(85, 85, 85); font-family: \"microsoft yahei\"; line-height: 35px;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: 14px;\">2、打开AS，在Settings中设置<span style=\"font-size: 14px; color: rgb(255, 0, 0);\">Gradle</span>的工作模式为offline，如下图：</span></p><p><span style=\"color: rgb(255, 0, 0);\"><strong><img src=\"/Uploads/ueditor/image/20180130/1517295054.jpg\" title=\"1517295054.jpg\" alt=\"0034034824143467_b.jpg\" width=\"485\" height=\"324\"/></strong></span></p>', '1517295140');

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
INSERT INTO `tzht_conference_focus` VALUES ('21', '31', '0', '0');
INSERT INTO `tzht_conference_focus` VALUES ('31', '4', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='会议详情图片表';

-- ----------------------------
-- Records of tzht_conference_pic
-- ----------------------------
INSERT INTO `tzht_conference_pic` VALUES ('7', '4', '35', '会议图片', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '[\"\\/Uploads\\/conference\\/2018-01-29\\/5a6e92e3ed33f.jpg\"]', '1517196005');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='企业资料表';

-- ----------------------------
-- Records of tzht_download
-- ----------------------------
INSERT INTO `tzht_download` VALUES ('2', '4', '企业交流会资料', '[\"\\/Uploads\\/file\\/20180129\\/1517207441\\/A+Byte+of+Python.pdf\"]', '1517207442');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='极光推送消息表';

-- ----------------------------
-- Records of tzht_jgpush
-- ----------------------------
INSERT INTO `tzht_jgpush` VALUES ('5', '2018年1月30日天气情况', '北京今天  晴间多云，偏北风3级  5/-6°。', '0', '1517301679');
INSERT INTO `tzht_jgpush` VALUES ('6', '2018年1月31日天气情况', '2018年1月30日天气情况', '1', '1517301844');
INSERT INTO `tzht_jgpush` VALUES ('7', '2018年1月31日天气情况', '2018年1月31日天气情况', '1', '1517301946');
INSERT INTO `tzht_jgpush` VALUES ('8', '2018年1月30日天气情况', '北京今天 晴间多云，偏北风3级 5/-6°。', '1', '1517305147');
INSERT INTO `tzht_jgpush` VALUES ('9', '推送测试123', '推送测试123推送测试123', '1', '1517305234');
INSERT INTO `tzht_jgpush` VALUES ('10', '推送测试789', '推送测试789推送测试789', '1', '1517305293');
INSERT INTO `tzht_jgpush` VALUES ('11', '推送测试56656', '推送测试56656推送测试56656', '1', '1517306038');
INSERT INTO `tzht_jgpush` VALUES ('12', '推送测试123', '推送测试123推送测试123推送测试123推送测试123', '1', '1517306075');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='极光推送个人消息表';

-- ----------------------------
-- Records of tzht_jgpushperson
-- ----------------------------
INSERT INTO `tzht_jgpushperson` VALUES ('5', '0', '22', 'wr', 'r', '0', '1516585741');
INSERT INTO `tzht_jgpushperson` VALUES ('7', '0', '22', 'afa', 'af', '0', '1516592614');
INSERT INTO `tzht_jgpushperson` VALUES ('8', '0', '26', '176', '176', '0', '1516760320');
INSERT INTO `tzht_jgpushperson` VALUES ('10', '0', '26', '176', '176', '0', '1516947201');

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
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
-- Records of tzht_log
-- ----------------------------
INSERT INTO `tzht_log` VALUES ('1', '1', '1516155510', '0', '123.114.109.192', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****6923/18810356923您好！您使用了电脑2018-01-17 10:30登录地址为中国-北京-北京');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='留言表';

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='权限表';

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='企业产品表';

-- ----------------------------
-- Records of tzht_product
-- ----------------------------
INSERT INTO `tzht_product` VALUES ('3', '4', '企业产品', 'http://xh.2188.com.cn/Product/add.html', '[\"\\/Uploads\\/product\\/2018-02-01\\/5a726feac5992.jpg\"]', '1517449198');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='融云讨论组表';

-- ----------------------------
-- Records of tzht_rongcloudim
-- ----------------------------
INSERT INTO `tzht_rongcloudim` VALUES ('1', '2018数据驱动产业升级价值峰会讨论组', '400730e3-46b3-49f4-b4e8-430027035c32', '1516687022');
INSERT INTO `tzht_rongcloudim` VALUES ('2', '公开会议讨论组', 'd2a189c5-9c9e-4cf8-b3aa-52d5a5473fd6', '1517025880');
INSERT INTO `tzht_rongcloudim` VALUES ('3', 'GMIC 2018 北京 全球移动互联网大会讨论组', 'e66e3ca3-9308-40fa-88f1-43d693c8daf7', '1517282336');
INSERT INTO `tzht_rongcloudim` VALUES ('4', '同舟鸿图年会(2018.1.30)讨论组', 'e9af4bcf-8ea4-4bc1-8112-dcfed620831c', '1517382265');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='签到推送消息表';

-- ----------------------------
-- Records of tzht_signjgpush
-- ----------------------------
INSERT INTO `tzht_signjgpush` VALUES ('6', '49', '27', '刘卫国-北京同舟鸿图文化创意有限公司', '刘卫国-北京同舟鸿图文化创意有限公司', '1', '1517358517');
INSERT INTO `tzht_signjgpush` VALUES ('7', '49', '21', '李洪亮-北京同舟鸿图文化创意有限公司', '李洪亮-北京同舟鸿图文化创意有限公司', '1', '1517358534');
INSERT INTO `tzht_signjgpush` VALUES ('8', '50', '32', '陈江-北京同舟鸿图文化创意有限公司', '陈江-北京同舟鸿图文化创意有限公司', '1', '1517358567');
INSERT INTO `tzht_signjgpush` VALUES ('9', '50', '27', '刘卫国-北京同舟鸿图文化创意有限公司 ', '刘卫国-北京同舟鸿图文化创意有限公司 ', '1', '1517358617');
INSERT INTO `tzht_signjgpush` VALUES ('10', '50', '21', '李洪亮-北京同舟鸿图文化创意有限公司 ', '李洪亮-北京同舟鸿图文化创意有限公司 ', '1', '1517358635');
INSERT INTO `tzht_signjgpush` VALUES ('11', '53', '21', '李洪亮-北京同舟鸿图文化创意有限公司', '李洪亮-北京同舟鸿图文化创意有限公司', '1', '1517359135');
INSERT INTO `tzht_signjgpush` VALUES ('12', '54', '21', 'tzhtlhl888', 'tzhtlhl888', '1', '1517360759');
INSERT INTO `tzht_signjgpush` VALUES ('13', '55', '21', 'tzhtlhl888签到消息', 'tzhtlhl888签到消息', '1', '1517361230');
INSERT INTO `tzht_signjgpush` VALUES ('14', '55', '31', '2018.1.31签到提醒', '2018.1.31签到提醒', '1', '1517361564');
INSERT INTO `tzht_signjgpush` VALUES ('15', '50', '33', '北京同舟鸿图文化创意有限公司 / candy123', '北京同舟鸿图文化创意有限公司 / candy123', '1', '1517363353');
INSERT INTO `tzht_signjgpush` VALUES ('16', '57', '31', '2018.1.31签到提醒', '2018.1.31签到提醒', '1', '1517388748');
INSERT INTO `tzht_signjgpush` VALUES ('17', '59', '27', 'tzhtlwg666 2018.2.1', 'tzhtlwg666 2018.2.1', '1', '1517395157');
INSERT INTO `tzht_signjgpush` VALUES ('18', '59', '21', 'tzhtlhl888 2018.2.1', 'tzhtlhl888 2018.2.1', '1', '1517395180');
INSERT INTO `tzht_signjgpush` VALUES ('19', '58', '27', ' tzhtlwg666 2018.2.1', ' tzhtlwg666 2018.2.1', '1', '1517395199');
INSERT INTO `tzht_signjgpush` VALUES ('20', '58', '21', ' tzhtlhl888 2018.2.1', ' tzhtlhl888 2018.2.1', '1', '1517395207');

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
INSERT INTO `tzht_system` VALUES ('7', 'COPYRIGHT_WORD', '©2017 幸会');
INSERT INTO `tzht_system` VALUES ('8', 'WEB_ICP_NUMBER', '京ICP备12040646号-1');
INSERT INTO `tzht_system` VALUES ('9', 'WEB_STATISTICS', '');
INSERT INTO `tzht_system` VALUES ('10', 'EMAIL_SMTP', 'smtp.163.com');
INSERT INTO `tzht_system` VALUES ('11', 'EMAIL_USERNAME', 'lovesherry55@163.com');
INSERT INTO `tzht_system` VALUES ('12', 'EMAIL_PASSWORD', '573301558wo.');
INSERT INTO `tzht_system` VALUES ('13', 'EMAIL_FROM_NAME', '同舟鸿图-幸会');
INSERT INTO `tzht_system` VALUES ('14', 'COMMENT_REVIEW', '0');
INSERT INTO `tzht_system` VALUES ('15', 'COMMENT_SEND_EMAIL', '0');
INSERT INTO `tzht_system` VALUES ('16', 'EMAIL_RECEIVE', '');
INSERT INTO `tzht_system` VALUES ('17', 'APP_VERSION', '1.1.5');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='用户基础表';

-- ----------------------------
-- Records of tzht_user
-- ----------------------------
INSERT INTO `tzht_user` VALUES ('4', '', '', '189****6236', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18911936236', '/./Uploads/Avatar/2018-01-17/5a5ec83f98c52.jpeg', '信息技术', '北京同舟鸿图文化创意有限公司', '部门经理', '北京市北京市朝阳区', '景阳宏昌大厦307-309', '', '0', '', '1', '2', '1516160158', '0', '127.0.0.1', '', 'rBUsAg/tLTcDWEquk4OEbMliGEQzHZkcn1MyOsaOWek8HprMJp2++42mlxtBJ99Y7wThXY6dnpnqTcEoqtTn7A==', 'www.tzht.net.cn', '公司集设计、开发、营销为一体的综合性公司，公司主要为大型企事业单位提供技术开发、技术咨询、技术服务等，同时在移动互联网创新领域方面有一定的研究，并且跟相关技术研究院等科研机构有比较广泛深入的战略合作。', '', '/App/Index/usercode/id/4.html', '0', '', '0', '4_xinghuiapp', '0', '010-63942568');
INSERT INTO `tzht_user` VALUES ('15', '', '', 'admin123', '8BC5DE83CF1DAF79ED5B2F13F93D7C05D01D0388', '13717563625', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1516239872', '0', '127.0.0.1', '', '8KkR21D7uh8mrBsEBd6pDpIRREFK8oWTStcrEQuqMRrxHr6qR7xTnQWQjOOEfqm7VMdaz5T345NGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/15.html', '4', '管理员', '2', '15_xinghuiapp', '0', '');
INSERT INTO `tzht_user` VALUES ('21', '', '1601796593@qq.com', 'tzhtlhl888', '0E2260CA7E6A2449009437DDA311E4742A5E4E7C', '18810356923', '/./Uploads/Avatar/2018-01-30/5a702f781e41c.jpeg', '信息技术', '北京同舟鸿图文化创意有限公司', '', '广西壮族自治区百色市德保县', '11058585', '', '0', '', '1', '1', '1516246462', '0', '127.0.0.1', '', 'o3w7emoDrPckeDKsa2ZTkWLgkQ3O+7PFPxqmhyeRWfjsLI8G13yIUTwH6FxLmbBhcTIRu5X4m4k=', '', '', '啊咯DJ他她徒步不不不他', '/Home/Index/usercode/id/21.html', '4', '李洪亮', '2', '21_xinghuiapp', '1', '');
INSERT INTO `tzht_user` VALUES ('22', '', '', 'tzht159346', '699DC06C6B17DFD27AC7FD1926F6137D2D2C3627', '18810356928', '/./Uploads/Avatar/2018-01-18/5a601732b3b35.jpg', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1516246503', '0', '127.0.0.1', '', '+NODVIdVjkEgXb07WpkeMsliGEQzHZkcn1MyOsaOWek8HprMJp2++woUkNOvWZlmkB427AEfDFTqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/22.html', '4', 'af', '2', '22_xinghuiapp', '0', '');
INSERT INTO `tzht_user` VALUES ('25', '', '2295855@qq.com', '欣欣向荣', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18601159800', '/./Uploads/Avatar/2018-01-22/5a65ce4f99d7d.jpg', '信息技术', '北京同舟鸿图文化创意有限公司', '总经理', '北京市北京市石景山区', '景阳宏昌307', '', '0', '', '1', '1', '1516621016', '0', '127.0.0.1', '', 'KNa0JXVBNwSRPJQXQcFObMliGEQzHZkcn1MyOsaOWek8HprMJp2+++8UUMB1hrlszw9LIrxR3KjqTcEoqtTn7A==', '', '', '欣欣向荣', '/App/Index/usercode/id/25.html', '4', '', '2', '25_xinghuiapp', '0', '');
INSERT INTO `tzht_user` VALUES ('27', '', '', 'tzhtlwg666', 'D12C3508B546567FF41555CE54F33CB664D40989', '15652465039', '/./Uploads/Avatar/2018-01-31/5a719be335711.jpeg', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1517196361', '0', '127.0.0.1', '', 'B8h589gGSFeZtPfHg6v/1pIRREFK8oWTStcrEQuqMRrxHr6qR7xTnfUoAzbzGIMUeOZ1ll8o3+NGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/27.html', '4', '刘为国', '2', '27_xinghuiapp', '1', '');
INSERT INTO `tzht_user` VALUES ('31', '', '1601796563@qq.com', '睡醒的兔子', '0E2260CA7E6A2449009437DDA311E4742A5E4E7C', '17600898102', '/./Uploads/Avatar/2018-01-30/5a702a20c16d6.jpeg', '信息技术', '同州', '技术开发', '北京市北京市大兴区', '大街115号', '', '0', '', '1', '1', '1517300246', '0', '127.0.0.1', '', 'QyM3JHXBg7PgTkZt6oGtfsliGEQzHZkcn1MyOsaOWekgDWgIXlP1tjnfbIl3DPZCIi/WuQ+ERBjqTcEoqtTn7A==', '', '', '签名', '/App/Index/usercode/id/31.html', '0', '', '0', '31_xinghuiapp', '0', '');
INSERT INTO `tzht_user` VALUES ('32', '', '', '135****2050', '8BC5DE83CF1DAF79ED5B2F13F93D7C05D01D0388', '13552832050', '/./Uploads/Avatar/2018-01-30/5a704b6d9c5d8.jpeg', '', '', '', '', '', '', '0', '', '1', '1', '1517308233', '0', '127.0.0.1', '', 'XIOUEz9/y/jHsETRLnbNHWLgkQ3O+7PFPxqmhyeRWfhtqPYOfBKwmvR/vVfNYBCtQcp3eaFxM3M=', '', '', '', '/xh2188comcn/App/Index/usercode/id/32.html', '0', '', '0', '32_xinghuiapp', '0', '');
INSERT INTO `tzht_user` VALUES ('33', '', '', 'candy123', 'FC3706FD2D34DC69C09DBC8A94C2E60310665FC9', '18810356958', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1517363145', '0', '127.0.0.1', '', 'jB1wT9vJirHJuTyX/oQpp8liGEQzHZkcn1MyOsaOWekgDWgIXlP1tj+6ArQSDjbF9Hxf2gWT2xPqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/33.html', '4', 'candy', '2', '33_xinghuiapp', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='合作伙伴表';

-- ----------------------------
-- Records of tzht_user_partners
-- ----------------------------
INSERT INTO `tzht_user_partners` VALUES ('1', '35', '1601796593@qq.com', '18810356923', '[\"\\/Uploads\\/image\\/2018-01-27\\/5a6c2ca4e58c4.jpg\"]', '水云周', '北京北京市石景山区', '水云周', '1517038794', '1517038794', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '水云周', '2');
INSERT INTO `tzht_user_partners` VALUES ('2', '35', 'web@isu5.cn', '13718601024', '\"\\/Uploads\\/userc\\/2018-01-29\\/5a6e8bf75dd77.jpg\"', '北京联达动力信息科技股份有限公司', '北京北京市石景山区', '海淀大街甲38号银科大厦2206-08室', '1517194256', '1517194256', 'http://www.lkpower.com', '32432432', '2');
INSERT INTO `tzht_user_partners` VALUES ('4', '32', '1601796593@qq.com', '18810356923', '\"\\/Uploads\\/userc\\/2018-01-29\\/5a6e8da9e9cdd.jpg\"', 'a', '北京北京市石景山区', 'a', '1517194666', '1517194666', 'a', 'a', '2');
INSERT INTO `tzht_user_partners` VALUES ('5', '32', 'web@isu5.cn', '13718601024', '/Uploads/userc/2018-01-29/5a6e8e3023c28.jpg', '北京联达动力信息科技股份有限公司', '北京北京市石景山区', '海淀大街甲38号银科大厦2206-08室', '1517194855', '1517194855', 'http://www.lkpower.com', '12312', '2');
INSERT INTO `tzht_user_partners` VALUES ('6', '47', '18810356954@qq.com', '18810356524', '/Uploads/userc/2018-01-30/5a7039190b61b.jpg', '天猫', '北京北京市石景山区', '天猫', '1517304113', '1517304113', 'http://xh.2188.com.cn/index.php/Admin/Index/index.html', '天猫', '2');
