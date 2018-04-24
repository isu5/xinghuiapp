/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xh2188comcn

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-24 20:07:43
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
INSERT INTO `tzht_admin` VALUES ('1', 'admin123', '1eea36fbd4f4919251e3192dce2da380', '', '', '1', '221.216.128.78', '1524563398', '294');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of tzht_advert
-- ----------------------------
INSERT INTO `tzht_advert` VALUES ('3', '拓展人脉关系渠道', 'https://mp.weixin.qq.com/s?__biz=MzUyMTYxNTQ4MQ==&amp;mid=100000300&amp;idx=1&amp;sn=fc5454bc4c2539f9e669691ebd2a026e&amp;chksm=79d9233a4eaeaa2c8a3b0b34b43412ead496a9ed2d63316cf0fb44856e429b4bde255b68', '/./Uploads/2018/04/24/5adefb95e13ab.jpg', '1524562841', '50', '55', '1');
INSERT INTO `tzht_advert` VALUES ('4', '幸会APP之企业二级账户', 'https://mp.weixin.qq.com/s?__biz=MzUyMTYxNTQ4MQ==&amp;mid=100000303&amp;idx=1&amp;sn=905907cd40dfc5479227d653753fe789&amp;chksm=79d923394eaeaa2f86f3b0c3e9c7b6900b3ecf7cab6d74d2afc7b32e133d2856c4ff098f', '/./Uploads/2018/04/24/5adefbbf2f36b.jpg', '1524562885', '50', '55', '1');
INSERT INTO `tzht_advert` VALUES ('5', '幸会APP商务关系社交资源平台', 'https://mp.weixin.qq.com/s?__biz=MzUyMTYxNTQ4MQ==&amp;mid=100000290&amp;idx=1&amp;sn=f87b8c0d4c62a7e20f184f163cecd564&amp;chksm=79d923344eaeaa226901d1d7987678094b4eba76004a0cb4b3565c3c1173a68d59c8285d', '/./Uploads/2018/04/24/5adefd0e038bb.jpg', '1524563217', '50', '55', '1');
INSERT INTO `tzht_advert` VALUES ('6', '大数据统计分析', 'https://mp.weixin.qq.com/s?__biz=MzUyMTYxNTQ4MQ==&amp;mid=100000305&amp;idx=1&amp;sn=16257a423323672ab8564c0474255fc1&amp;chksm=79d923274eaeaa3149da93337fc29d6645d2549791e129e51660f32e6821d4ce0a936c6a', '/./Uploads/2018/04/24/5adf0405c0b0b.jpg', '1524565001', '50', '55', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公告表';

-- ----------------------------
-- Records of tzht_bulletin
-- ----------------------------
INSERT INTO `tzht_bulletin` VALUES ('3', '幸会APP已经正式上线，欢迎下载使用幸会APP！', '<p style=\"white-space: normal;\"><span style=\"font-family: 宋体; color: rgb(24, 71, 143); font-weight: bold;\"></span><span style=\"color: rgb(24, 71, 143); font-family: 宋体; font-weight: bold;\">幸会移动客户端APP是我们通过会议类场景建立起的一种商务社交关系资源，在这种场景中，您可以通过会议结交各行业关系资源，欢迎您在第三方应用市场下载体验“幸会”APP，或者扫描下方二维码下载“幸会”APP或者在手机浏览器访问http://xh.2188.com.cn下载“幸会”APP。<br/></span></p><p style=\"white-space: normal; text-align: center;\"><span style=\"color: rgb(24, 71, 143); font-family: 宋体; font-weight: bold;\"><img src=\"http://xh.2188.com.cn/Uploads/ueditor/image/20180424/1524562354.jpg\" title=\"1524562354.jpg\" alt=\"640.jpg\"/></span></p><p><br/></p>', '1524562434', '幸会官方', '50', '1');

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
  `zhicard` varchar(60) NOT NULL COMMENT '手执身份证',
  `company` varchar(60) NOT NULL COMMENT '公司名称',
  `certificate` char(18) NOT NULL DEFAULT '' COMMENT '证件号码',
  `certificateimg` varchar(60) NOT NULL DEFAULT '' COMMENT '证件号码图片',
  `certtime` int(11) NOT NULL DEFAULT '0' COMMENT '认证时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1为个人认证，2为企业认证，3为个人发布会议认证',
  `is_cert` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否认证,1为个人认证，2为企业认证，3为审核中',
  `is_image` tinyint(4) NOT NULL DEFAULT '0' COMMENT '判断上传图片类型1为身份证，2为名片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='个人认证表';

-- ----------------------------
-- Records of tzht_certify
-- ----------------------------
INSERT INTO `tzht_certify` VALUES ('2', '4', '', '', '', '', '', '北京同舟鸿图文化创意有限公司', '9111010758589247XH', '/./Uploads/Certificate/2018-01-17/5a5ec5c191f36.JPG', '1516160449', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('3', '14', '', '', '', '', '', '北京同舟鸿图文化创意有限公司', '9111010758589247XH', '/./Uploads/Certificate/2018-01-18/5a5ff7914a55d.jpg', '1516238737', '2', '4', '0');
INSERT INTO `tzht_certify` VALUES ('10', '34', '', '', '', '', '', '北京中网深蓝技术有限公司', '911101070717459231', '/./Uploads/Certificate/2018-02-06/5a79484f00f92.jpg', '1517897577', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('12', '53', '', '', '', '', '', '北京水云舟文化创意有限公司', '110107018519145', '/./Uploads/Certificate/2018-02-09/5a7d7235152d4.jpg', '1518170677', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('19', '62', '', '', '', '', '', '中国会议服务咨询公司', '9111010111111111XH', '/./Uploads/Certificate/2018-03-27/5ab9971e4da61.jpg', '1522112286', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('20', '94', '', '', '', '', '', '幸会服务', '911163942568', '/./Uploads/Certificate/2018-04-24/5ade8ad3a5ee8.jpg', '1524533971', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('21', '95', '', '', '', '', '', '幸会服务01', '911063942568', '/./Uploads/Certificate/2018-04-24/5ade8f682c321.jpg', '1524535144', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('22', '96', '', '', '', '', '', '幸会服务02', '911263942568', '/./Uploads/Certificate/2018-04-24/5ade8fa956377.jpg', '1524535209', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('23', '97', '', '', '', '', '', '幸会服务03', '911363942568', '/./Uploads/Certificate/2018-04-24/5ade9001b914a.jpg', '1524535297', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('24', '98', '', '', '', '', '', '幸会服务04', '911463942568', '/./Uploads/Certificate/2018-04-24/5ade905d10d7e.jpg', '1524535389', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('25', '99', '', '', '', '', '', '幸会服务05', '911563942568', '/./Uploads/Certificate/2018-04-24/5ade90adc872c.jpg', '1524535469', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('26', '100', '', '', '', '', '', '幸会服务06', '911663942568', '/./Uploads/Certificate/2018-04-24/5ade90f028068.jpg', '1524535536', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('27', '102', '', '', '', '', '', '幸会服务07', '911763942568', '/./Uploads/Certificate/2018-04-24/5ade9144e9179.jpg', '1524535620', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('28', '101', '', '', '', '', '', '幸会服务08', '911863942568', '/./Uploads/Certificate/2018-04-24/5ade9183c7c0a.jpg', '1524535683', '2', '2', '0');
INSERT INTO `tzht_certify` VALUES ('29', '45', '55', '130182199011051410', '/./Uploads/Idcard/2018-04-24/5adef85942629.png', '/./Uploads/Idcard/2018-04-24/5adef85947358.jpg', '/./Uploads/Idcard/2018-04-24/5adef85947fa1.jpg', '', '', '', '1524562009', '3', '3', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='群组表';

-- ----------------------------
-- Records of tzht_chatgroup
-- ----------------------------
INSERT INTO `tzht_chatgroup` VALUES ('3', '26', '4', '1596', '', '群组公告', '8d7fb5bb-1248-4bbd-93f6-c3558b732523', '1516950143');
INSERT INTO `tzht_chatgroup` VALUES ('8', '31', '22', '2018校友会', '', '群组公告', '0aaa0e69-9b3a-4b46-9e33-a4ea3d6b5a52', '1517806129');
INSERT INTO `tzht_chatgroup` VALUES ('10', '41', '51,5,49,48,46,45,44,43,42', '幸会小团队', '', '未设eerrt置', 'f939f733-c20c-4187-a8ec-27fc843eb1a8', '1518048115');
INSERT INTO `tzht_chatgroup` VALUES ('17', '41', '51,50,49,48', '测试', '', '未设置', '9558e603-4b15-4459-9d62-6157e161cb2e', '1519907086');
INSERT INTO `tzht_chatgroup` VALUES ('19', '45', '47,87,81', '2018科技博览', '', '未设置', '7d0ecddb-4ead-481b-9464-b8a38355b6d8', '1520481504');
INSERT INTO `tzht_chatgroup` VALUES ('20', '41', '45,43,44', '技术组', '', '未设置', '2ad293fd-5be1-4908-a014-8f16592cdcc8', '1520559526');
INSERT INTO `tzht_chatgroup` VALUES ('21', '53', '41,34,4', '新征程', '', '未设置', '34639db6-79f1-4187-b586-e831b8eeeb49', '1521374017');
INSERT INTO `tzht_chatgroup` VALUES ('22', '61', '41,4', '测试1', '', '未设置', '437be979-698a-4691-a234-e36530f4b33c', '1522806446');
INSERT INTO `tzht_chatgroup` VALUES ('26', '41', '61,53', '幸会小团队', '', '未设置', '281b89dd-91dc-4835-9f18-b2a909864bb3', '1523268469');
INSERT INTO `tzht_chatgroup` VALUES ('45', '41', '45,44,43', '技术讨论组', '', '未设置', 'f849904b-fc6d-4beb-bfed-8e33ab3e470e', '1524012591');
INSERT INTO `tzht_chatgroup` VALUES ('46', '41', '45,44,43', '试试', '', '未设置', '266a8a41-4ad1-4a0d-af3c-45e058e1e718', '1524012823');
INSERT INTO `tzht_chatgroup` VALUES ('47', '45', '87,47,44', '理屈词穷', '', '未设置', 'ff823950-03ca-4530-b705-ff0da1d658bd', '1524034561');
INSERT INTO `tzht_chatgroup` VALUES ('49', '45', '87,47,44', '小兔子', '', '未设置', '4a7c0d66-1cd7-4d05-ad4c-3e25834fb03d', '1524040100');
INSERT INTO `tzht_chatgroup` VALUES ('52', '45', '87,81,47', '整互联网商业互动方案预演交流峰会', '', '未设置', '3185bc76-9676-4d4b-9484-25fa709688c2', '1524117010');
INSERT INTO `tzht_chatgroup` VALUES ('54', '45', '87,49,47', '小兔子2', '', '未设置', '2ebd1f4f-328a-4fae-8ff1-b426a8ba9bf6', '1524480424');
INSERT INTO `tzht_chatgroup` VALUES ('55', '45', '87,47,46', '春意盎然', '', '未设置', '8a3e97a3-06cf-4679-a5e0-6e8bac96a5f7', '1524543225');

-- ----------------------------
-- Table structure for `tzht_chatgroup_bull`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_chatgroup_bull`;
CREATE TABLE `tzht_chatgroup_bull` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '群组公告id',
  `chat_id` int(10) unsigned NOT NULL COMMENT '群组id',
  `title` varchar(100) NOT NULL COMMENT '群组标题',
  `bulltitle` varchar(100) NOT NULL DEFAULT '' COMMENT '群组标题',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `rongid` varchar(80) NOT NULL COMMENT '融云标识',
  `pic` text NOT NULL,
  `file` text NOT NULL,
  `content` text,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '企业公告添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='群组公告表';

-- ----------------------------
-- Records of tzht_chatgroup_bull
-- ----------------------------
INSERT INTO `tzht_chatgroup_bull` VALUES ('30', '0', '2018人工智能', '2018人工智能', '0', '466fb602-ff0b-4906-a07a-78b79189229e', '[\"\\/Uploads\\/Companybull\\/20180301\\/1519886167\\/img_1519886104401.jpg\",\"\\/Uploads\\/Companybull\\/20180301\\/1519886167\\/img_1519886104468.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886167\\/A+Byte+of+Python-2.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886167\\/Android1_0_0-1.pdf\"]', '2018人工值得你', '1519886167');
INSERT INTO `tzht_chatgroup_bull` VALUES ('31', '0', '2018ai智能', '2018AI智能', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180301\\/1519886227\\/img_1519886164506.jpg\",\"\\/Uploads\\/Companybull\\/20180301\\/1519886227\\/img_1519886164574.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180301\\/1519886227\\/A+Byte+of+Python-2.pdf\"]', '2018AI智能', '1519886227');
INSERT INTO `tzht_chatgroup_bull` VALUES ('32', '0', '1qer', '2018公众媒体', '0', '0', 'null', 'null', 'rwww', '1519954573');
INSERT INTO `tzht_chatgroup_bull` VALUES ('33', '0', '588', '2018城市大脑', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180302\\/1519957997\\/img_1519957929939.jpg\",\"\\/Uploads\\/Companybull\\/20180302\\/1519957997\\/img_1519957930012.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180302\\/1519957997\\/A+Byte+of+Python-2.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180302\\/1519957997\\/Android1_0_0-1.pdf\"]', '城市大脑', '1519957997');
INSERT INTO `tzht_chatgroup_bull` VALUES ('34', '0', '大家好！', '幸会小团队', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180302\\/1519968251\\/img_1519968250301.jpg\"]', 'null', '测试公告', '1519968251');
INSERT INTO `tzht_chatgroup_bull` VALUES ('35', '0', '28555', '2018科技博览', '0', '0', 'null', 'null', '睡觉觉了', '1520671905');
INSERT INTO `tzht_chatgroup_bull` VALUES ('36', '0', '555', '2018科技博览', '0', '0', 'null', 'null', '阿土不聊了', '1520672562');
INSERT INTO `tzht_chatgroup_bull` VALUES ('37', '0', '55222', '2018科技博览', '0', '0', 'null', 'null', '他图吧', '1520672569');
INSERT INTO `tzht_chatgroup_bull` VALUES ('38', '0', '土巴兔啊', '2018科技博览', '0', '0', 'null', 'null', '他他他8不', '1520672575');
INSERT INTO `tzht_chatgroup_bull` VALUES ('39', '0', 'cgh', '2018科技博览', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180310\\/1520672694\\/img_1520672589470.jpg\",\"\\/Uploads\\/Companybull\\/20180310\\/1520672694\\/img_1520672589558.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180310\\/1520672694\\/幸会APP系统用户手册.doc\",\"\\/Uploads\\/Companybull\\/file\\/20180310\\/1520672694\\/幸会APP系统需求分析说明书.doc\"]', 'ghhh', '1520672694');
INSERT INTO `tzht_chatgroup_bull` VALUES ('40', '0', '882582', '2018科技博览', '0', '0', 'null', 'null', '他涂卡', '1520676267');
INSERT INTO `tzht_chatgroup_bull` VALUES ('41', '0', '84465', '2018科技博览', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180310\\/1520676943\\/img_1520676854487.jpg\",\"\\/Uploads\\/Companybull\\/20180310\\/1520676943\\/img_1520676854644.jpg\",\"\\/Uploads\\/Companybull\\/20180310\\/1520676943\\/img_1520676854744.jpg\",\"\\/Uploads\\/Companybull\\/20180310\\/1520676943\\/img_1520676854902.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180310\\/1520676943\\/幸会APP系统用户手册.doc\",\"\\/Uploads\\/Companybull\\/file\\/20180310\\/1520676943\\/幸会APP系统需求分析说明书.doc\"]', '鸡脯肉', '1520676943');
INSERT INTO `tzht_chatgroup_bull` VALUES ('42', '0', '群组', '2018科技博览', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180310\\/1520677110\\/img_1520677028482.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180310\\/1520677110\\/幸会APP系统用户手册.doc\"]', '哦哦pyro', '1520677110');
INSERT INTO `tzht_chatgroup_bull` VALUES ('43', '0', '5555', '2018科技博览', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180310\\/1520677423\\/img_1520677340033.jpg\",\"\\/Uploads\\/Companybull\\/20180310\\/1520677423\\/img_1520677340162.jpg\",\"\\/Uploads\\/Companybull\\/20180310\\/1520677423\\/img_1520677340261.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180310\\/1520677423\\/幸会APP系统用户手册.doc\"]', '了吧', '1520677423');
INSERT INTO `tzht_chatgroup_bull` VALUES ('44', '0', '1', '技术组', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180313\\/1520903227\\/img_1520903215998.jpg\"]', 'null', '测试一', '1520903227');
INSERT INTO `tzht_chatgroup_bull` VALUES ('45', '0', '测试二', '技术组', '0', '0', 'null', 'null', '测试二', '1520903252');
INSERT INTO `tzht_chatgroup_bull` VALUES ('46', '0', '测试三', '技术组', '0', '0', 'null', 'null', '测试三', '1520903371');
INSERT INTO `tzht_chatgroup_bull` VALUES ('47', '0', '大家好', '新征程', '0', '0', '[\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374142654.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374142724.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374142784.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374142843.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374142905.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374142976.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374143041.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374143092.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374176\\/img_1521374143151.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180318\\/1521374176\\/2018设计工作汇总.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180318\\/1521374176\\/2018工作明细（姓名）.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180318\\/1521374176\\/公司奖金政策.docx\",\"\\/Uploads\\/Companybull\\/file\\/20180318\\/1521374176\\/一届三次理事会、2018GEI大会会议议程20180224（主席圈阅）.doc\",\"\\/Uploads\\/Companybull\\/file\\/20180318\\/1521374176\\/公司2018台历.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180318\\/1521374176\\/奇特的石头城.pdf\"]', '请下载附件', '1521374176');
INSERT INTO `tzht_chatgroup_bull` VALUES ('48', '0', '我的地盘', '2018人工智能', '45', '8fe9f100-25cc-4627-baa5-4740341e5912', '[\"\\/Uploads\\/Companybull\\/20180408\\/1523175275\\/img_1523175175296.jpg\",\"\\/Uploads\\/Companybull\\/20180408\\/1523175275\\/img_1523175175414.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180408\\/1523175275\\/A+Byte+of+Python.pdf\"]', '我的地盘', '1523175275');
INSERT INTO `tzht_chatgroup_bull` VALUES ('49', '0', '星星知我心', '2018人工智能', '45', '466fb602-ff0b-4906-a07a-78b79189229e', '[\"\\/Uploads\\/Companybull\\/20180408\\/1523179294\\/img_1523179194166.jpg\",\"\\/Uploads\\/Companybull\\/20180408\\/1523179294\\/img_1523179194277.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180408\\/1523179294\\/A+Byte+of+Python.pdf\"]', '喉咙哦', '1523179294');
INSERT INTO `tzht_chatgroup_bull` VALUES ('50', '0', '15', '2018城市大脑', '45', 'cc58100c-5eb3-4ee4-866f-0fd11198b9ae', '[\"\\/Uploads\\/Companybull\\/20180410\\/1523337348\\/img_1523337243832.jpg\",\"\\/Uploads\\/Companybull\\/20180410\\/1523337348\\/img_1523337243934.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180410\\/1523337348\\/泰康保险 刘岩 - 人工智能多源异构大数据处理实践经验分享.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180410\\/1523337348\\/奇特的石头城.pdf\"]', 'fvv', '1523337348');
INSERT INTO `tzht_chatgroup_bull` VALUES ('51', '0', '58', '2018科技博览', '45', '7d0ecddb-4ead-481b-9464-b8a38355b6d8', '[\"\\/Uploads\\/Companybull\\/20180410\\/1523339619\\/img_1523339514224.jpg\",\"\\/Uploads\\/Companybull\\/20180410\\/1523339619\\/img_1523339514340.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180410\\/1523339619\\/Android1_0_0-1.pdf\"]', 'gyhh', '1523339619');
INSERT INTO `tzht_chatgroup_bull` VALUES ('52', '0', '2', '2018公众媒体', '45', 'd7e4a0d9-c6ff-4122-baf9-bde52006c86a', '[\"\\/Uploads\\/Companybull\\/20180416\\/1523859097\\/img_1523859048249.jpg\",\"\\/Uploads\\/Companybull\\/20180416\\/1523859097\\/img_1523859048644.jpg\",\"\\/Uploads\\/Companybull\\/20180416\\/1523859097\\/img_1523859048896.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180416\\/1523859097\\/A+Byte+of+Python.pdf\"]', '25', '1523859097');
INSERT INTO `tzht_chatgroup_bull` VALUES ('53', '0', '小兔子公告', '小兔子', '45', '4a7c0d66-1cd7-4d05-ad4c-3e25834fb03d', 'null', '[\"\\/Uploads\\/Companybull\\/file\\/20180418\\/1524040242\\/奇特的石头城.pdf\"]', '公告课', '1524040242');
INSERT INTO `tzht_chatgroup_bull` VALUES ('54', '0', '小孩子', '小孩子', '45', '78552afd-7d9a-4ccf-9283-0b149aef58fb', '[\"\\/Uploads\\/Companybull\\/20180419\\/1524114181\\/img_1524114184561.jpg\",\"\\/Uploads\\/Companybull\\/20180419\\/1524114181\\/img_1524114184966.jpg\",\"\\/Uploads\\/Companybull\\/20180419\\/1524114181\\/img_1524114185303.jpg\",\"\\/Uploads\\/Companybull\\/20180419\\/1524114181\\/img_1524114185579.jpg\",\"\\/Uploads\\/Companybull\\/20180419\\/1524114181\\/img_1524114185754.jpg\",\"\\/Uploads\\/Companybull\\/20180419\\/1524114181\\/img_1524114185879.jpg\",\"\\/Uploads\\/Companybull\\/20180419\\/1524114181\\/img_1524114186012.jpg\",\"\\/Uploads\\/Companybull\\/20180419\\/1524114181\\/img_1524114186263.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180419\\/1524114181\\/奇特的石头城.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180419\\/1524114181\\/媒资管理系统概要设计说明书 -.doc\"]', '55828', '1524114181');
INSERT INTO `tzht_chatgroup_bull` VALUES ('55', '0', '758', '整互联网商业互动方案预演交流峰会', '45', '3185bc76-9676-4d4b-9484-25fa709688c2', '[\"\\/Uploads\\/Companybull\\/20180420\\/1524206749\\/img_1524206625723.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180420\\/1524206749\\/Code Complete[代码大全] -- 第2版(中文版).pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180420\\/1524206749\\/媒资管理系统概要设计说明书 -.doc\"]', '群组公告', '1524206749');

-- ----------------------------
-- Table structure for `tzht_chatgroup_member`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_chatgroup_member`;
CREATE TABLE `tzht_chatgroup_member` (
  `chat_id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT '0' COMMENT '群主ID',
  `s_id` int(11) DEFAULT '0' COMMENT '群组成员'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tzht_chatgroup_member
-- ----------------------------
INSERT INTO `tzht_chatgroup_member` VALUES ('44', '45', '22');
INSERT INTO `tzht_chatgroup_member` VALUES ('44', '45', '25');
INSERT INTO `tzht_chatgroup_member` VALUES ('11', '45', '40');
INSERT INTO `tzht_chatgroup_member` VALUES ('48', '45', '32');
INSERT INTO `tzht_chatgroup_member` VALUES ('48', '45', '4');
INSERT INTO `tzht_chatgroup_member` VALUES ('49', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('49', '45', '44');
INSERT INTO `tzht_chatgroup_member` VALUES ('49', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('50', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('50', '45', '44');
INSERT INTO `tzht_chatgroup_member` VALUES ('3', '26', '4');
INSERT INTO `tzht_chatgroup_member` VALUES ('8', '31', '22');
INSERT INTO `tzht_chatgroup_member` VALUES ('10', '41', '51');
INSERT INTO `tzht_chatgroup_member` VALUES ('10', '41', '48');
INSERT INTO `tzht_chatgroup_member` VALUES ('10', '41', '46');
INSERT INTO `tzht_chatgroup_member` VALUES ('10', '41', '45');
INSERT INTO `tzht_chatgroup_member` VALUES ('10', '41', '44');
INSERT INTO `tzht_chatgroup_member` VALUES ('10', '41', '43');
INSERT INTO `tzht_chatgroup_member` VALUES ('10', '41', '42');
INSERT INTO `tzht_chatgroup_member` VALUES ('16', '45', '46');
INSERT INTO `tzht_chatgroup_member` VALUES ('16', '45', '53');
INSERT INTO `tzht_chatgroup_member` VALUES ('17', '41', '51');
INSERT INTO `tzht_chatgroup_member` VALUES ('17', '41', '48');
INSERT INTO `tzht_chatgroup_member` VALUES ('19', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('19', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('20', '41', '45');
INSERT INTO `tzht_chatgroup_member` VALUES ('20', '41', '43');
INSERT INTO `tzht_chatgroup_member` VALUES ('20', '41', '44');
INSERT INTO `tzht_chatgroup_member` VALUES ('21', '53', '41');
INSERT INTO `tzht_chatgroup_member` VALUES ('21', '53', '34');
INSERT INTO `tzht_chatgroup_member` VALUES ('21', '53', '4');
INSERT INTO `tzht_chatgroup_member` VALUES ('22', '61', '41');
INSERT INTO `tzht_chatgroup_member` VALUES ('22', '61', '4');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '46');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '40');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '44');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '34');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '88');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '43');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '39');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('25', '45', '48');
INSERT INTO `tzht_chatgroup_member` VALUES ('26', '41', '61');
INSERT INTO `tzht_chatgroup_member` VALUES ('26', '41', '53');
INSERT INTO `tzht_chatgroup_member` VALUES ('27', '45', '46');
INSERT INTO `tzht_chatgroup_member` VALUES ('27', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('47', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('47', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('47', '45', '44');
INSERT INTO `tzht_chatgroup_member` VALUES ('46', '41', '44');
INSERT INTO `tzht_chatgroup_member` VALUES ('46', '41', '43');
INSERT INTO `tzht_chatgroup_member` VALUES ('46', '41', '45');
INSERT INTO `tzht_chatgroup_member` VALUES ('45', '41', '45');
INSERT INTO `tzht_chatgroup_member` VALUES ('45', '41', '44');
INSERT INTO `tzht_chatgroup_member` VALUES ('45', '41', '43');
INSERT INTO `tzht_chatgroup_member` VALUES ('51', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('51', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('51', '45', '62');
INSERT INTO `tzht_chatgroup_member` VALUES ('52', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('52', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('53', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('53', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('54', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('54', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('54', '45', '46');
INSERT INTO `tzht_chatgroup_member` VALUES ('55', '45', '87');
INSERT INTO `tzht_chatgroup_member` VALUES ('55', '45', '47');
INSERT INTO `tzht_chatgroup_member` VALUES ('55', '45', '46');
INSERT INTO `tzht_chatgroup_member` VALUES ('55', '45', '62');

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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='会员收藏表';

-- ----------------------------
-- Records of tzht_collection
-- ----------------------------
INSERT INTO `tzht_collection` VALUES ('29', '0', '146', '1521518392');
INSERT INTO `tzht_collection` VALUES ('38', '43', '146', '1521769199');
INSERT INTO `tzht_collection` VALUES ('60', '34', '106', '1522740891');
INSERT INTO `tzht_collection` VALUES ('62', '46', '109', '1523848426');
INSERT INTO `tzht_collection` VALUES ('63', '87', '161', '1523933211');
INSERT INTO `tzht_collection` VALUES ('64', '87', '162', '1523934604');
INSERT INTO `tzht_collection` VALUES ('65', '87', '163', '1523935063');
INSERT INTO `tzht_collection` VALUES ('66', '34', '148', '1524108889');
INSERT INTO `tzht_collection` VALUES ('68', '47', '4', '1524208354');
INSERT INTO `tzht_collection` VALUES ('69', '89', '2', '1524444455');
INSERT INTO `tzht_collection` VALUES ('71', '41', '1', '1524453176');
INSERT INTO `tzht_collection` VALUES ('72', '43', '1', '1524453842');
INSERT INTO `tzht_collection` VALUES ('73', '45', '2', '1524471237');
INSERT INTO `tzht_collection` VALUES ('74', '45', '4', '1524471242');

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='企业公告表';

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
INSERT INTO `tzht_company_bull` VALUES ('49', '4', '你也一样', '[\"\\/Uploads\\/Companybull\\/20180206\\/1517913156\\/img_1517913154806.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180206\\/1517913156\\/bmcclog20171211225210.txt\"]', '', '心热呀', '1517913156');
INSERT INTO `tzht_company_bull` VALUES ('83', '53', '春', '[\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405704.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405717.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405718.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405722.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405726.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405729.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405731.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405741.jpg\",\"\\/Uploads\\/Companybull\\/20180318\\/1521374408\\/img_1521374405745.jpg\"]', 'null', '', '3月17日，十三届全国人大一次会议在北京人民大会堂举行第五次全体会议。习近平当选中华人民共和国主席、中华人民共和国中央军事委员会主席。这是习近平走向宣誓台。 新华社记者 姚大伟 摄\n\n\n全党全军全国人民的共同意愿\n\n——社会各界热烈拥护习近平当选国家主席、中央军委主席 \n\n大国远', '1521374408');
INSERT INTO `tzht_company_bull` VALUES ('86', '40', '555', '[\"\\/Uploads\\/Companybull\\/20180320\\/1521529882\\/img_1521529781775.jpg\",\"\\/Uploads\\/Companybull\\/20180320\\/1521529882\\/img_1521529790901.jpg\",\"\\/Uploads\\/Companybull\\/20180320\\/1521529882\\/img_1521529791019.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180320\\/1521529882\\/媒资管理系统概要设计说明书 -.doc\"]', '', 'tvyyvvy', '1521529882');
INSERT INTO `tzht_company_bull` VALUES ('88', '40', '桃源听', '[\"\\/Uploads\\/Companybull\\/20180326\\/1522049956\\/img_1522049851118.jpg\",\"\\/Uploads\\/Companybull\\/20180326\\/1522049956\\/img_1522049851189.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180326\\/1522049956\\/微店 陈国成 - 微店千万小微商家与互联网技术融合历程.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180326\\/1522049956\\/媒资管理系统概要设计说明书 -.doc\"]', '', '好文章', '1522049956');
INSERT INTO `tzht_company_bull` VALUES ('89', '40', '桃源听', '[\"\\/Uploads\\/Companybull\\/20180326\\/1522049969\\/img_1522049851118.jpg\",\"\\/Uploads\\/Companybull\\/20180326\\/1522049969\\/img_1522049851189.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180326\\/1522049969\\/微店 陈国成 - 微店千万小微商家与互联网技术融合历程.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180326\\/1522049969\\/媒资管理系统概要设计说明书 -.doc\"]', '', '好文章', '1522049969');
INSERT INTO `tzht_company_bull` VALUES ('91', '45', '我的公告', '[\"\\/Uploads\\/Companybull\\/20180327\\/1522126047\\/img_1522126059241.jpg\",\"\\/Uploads\\/Companybull\\/20180327\\/1522126047\\/img_1522126059375.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180327\\/1522126047\\/泰康保险 刘岩 - 人工智能多源异构大数据处理实践经验分享.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180327\\/1522126047\\/水云舟媒体制作报价.xlsx\",\"\\/Uploads\\/Companybull\\/file\\/20180327\\/1522126047\\/媒资管理系统概要设计说明书 -.doc\"]', '', '公告内容', '1522126047');
INSERT INTO `tzht_company_bull` VALUES ('92', '70', '18', '[\"\\/Uploads\\/Companybull\\/20180328\\/1522197711\\/img_1522197624404.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180328\\/1522197711\\/北硕航空 王昆 - 发展 融合 创新.pdf\"]', '', '585', '1522197711');
INSERT INTO `tzht_company_bull` VALUES ('93', '72', '1', '[\"\\/Uploads\\/Companybull\\/20180328\\/1522200011\\/img_1522199917863.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180328\\/1522200011\\/Android1_0_0-1.pdf\"]', '', '4', '1522200011');
INSERT INTO `tzht_company_bull` VALUES ('94', '46', '公告', '[\"\\/Uploads\\/Companybull\\/20180403\\/1522715707\\/img_1522715720730.jpg\",\"\\/Uploads\\/Companybull\\/20180403\\/1522715707\\/img_1522715721099.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180403\\/1522715707\\/微店 陈国成 - 微店千万小微商家与互联网技术融合历程.pdf\"]', '', '58556', '1522715707');
INSERT INTO `tzht_company_bull` VALUES ('95', '41', '1', 'null', 'null', '', '1', '1522741110');
INSERT INTO `tzht_company_bull` VALUES ('96', '82', '测试', 'null', 'null', '', '测试', '1522741197');
INSERT INTO `tzht_company_bull` VALUES ('97', '47', '公告', '[\"\\/Uploads\\/Companybull\\/20180404\\/1522828026\\/img_1522827933489.jpg\",\"\\/Uploads\\/Companybull\\/20180404\\/1522828026\\/img_1522827933585.jpg\",\"\\/Uploads\\/Companybull\\/20180404\\/1522828026\\/img_1522827933682.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180404\\/1522828026\\/A+Byte+of+Python.pdf\"]', '', '玫琳凯', '1522828026');
INSERT INTO `tzht_company_bull` VALUES ('98', '41', '清明', '[\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087444318.jpg\",\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087444375.jpg\",\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087444427.jpg\",\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087444580.jpg\",\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087444779.jpg\",\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087444864.jpg\",\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087444928.jpg\",\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087444987.jpg\",\"\\/Uploads\\/Companybull\\/20180407\\/1523087511\\/img_1523087445042.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180407\\/1523087511\\/奇特的石头城.pdf\",\"\\/Uploads\\/Companybull\\/file\\/20180407\\/1523087511\\/系统需求.doc\"]', '', '清明，冷转暖，万物复苏，生机盎然。', '1523087511');
INSERT INTO `tzht_company_bull` VALUES ('100', '87', '我的公告', '[\"\\/Uploads\\/Companybull\\/20180417\\/1523934001\\/img_1523933886195.jpg\",\"\\/Uploads\\/Companybull\\/20180417\\/1523934001\\/img_1523933886308.jpg\",\"\\/Uploads\\/Companybull\\/20180417\\/1523934001\\/img_1523933886408.jpg\"]', '[\"\\/Uploads\\/Companybull\\/file\\/20180417\\/1523934001\\/媒资管理系统概要设计说明书 -.doc\",\"\\/Uploads\\/Companybull\\/file\\/20180417\\/1523934001\\/奇特的石头城.pdf\"]', '', '公告内容', '1523934001');

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
  `part_id` varchar(80) NOT NULL COMMENT '合作伙伴id',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='会议表';

-- ----------------------------
-- Records of tzht_conference
-- ----------------------------
INSERT INTO `tzht_conference` VALUES ('1', 'GMIC 2018 北京 全球移动互联网大会（AI生万物）', '2018-04-20 11:23:00', '2018-04-30 11:23:00', '2018-04-23 11:23:00', '北京市北京市朝阳区', '天辰东路7号', '[\"\\/Uploads\\/Conference\\/20180424\\/1524540037\\/1511488664.3.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', '/Uploads/file/20180420/1524195064/媒资管理系统概要设计说明书 -.doc###', '34', '2', '1524195064', '0', '1', '0', null, null, null, '会议内容', '0', '', '72');
INSERT INTO `tzht_conference` VALUES ('2', '中国特色医疗旅游示范基地与健康小镇发现论坛', '2018-04-20 14:59:00', '2018-04-30 14:59:00', '2018-04-24 14:59:00', '北京市北京市朝阳区', '北三环东路静安庄', '[\"\\/Uploads\\/Conference\\/20180424\\/1524539351\\/1513841228.93.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', 'null###', '34', '7', '1524207903', '0', '1', '0', null, null, null, '会议内容', '0', '', '38');
INSERT INTO `tzht_conference` VALUES ('3', '2018第四届能源互联网产业发展高峰论坛', '2018-04-26 15:03:00', '2018-04-30 15:03:00', '2018-04-23 15:03:00', '上海市上海市宝山区', '宝山区', '[\"\\/Uploads\\/Conference\\/20180420\\/1524208147\\/1513154602.33.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', '/Uploads/file/20180420/1524208148/媒资管理系统概要设计说明书 -.doc###', '34', '5', '1524208147', '0', '1', '0', null, null, null, '会议内容', '0', '', '7');
INSERT INTO `tzht_conference` VALUES ('5', '中国软IP大会', '2018-04-20 17:10:00', '2018-06-21 17:10:00', '2018-05-15 17:10:00', '北京市北京市朝阳区', '定福庄东街7号', '[\"\\/Uploads\\/Conference\\/20180424\\/1524539286\\/1500515100.1.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18910356923', 'null###', '34', '6', '1524215701', '0', '1', '0', null, null, null, '会议内容588', '0', '', '21');
INSERT INTO `tzht_conference` VALUES ('6', '第二届中国体育产业嘉年华', '2018-04-20 17:13:00', '2018-06-30 17:13:00', '2018-06-28 17:13:00', '北京市北京市朝阳区', '酒仙桥4号', '[\"\\/Uploads\\/Conference\\/20180420\\/1524215928\\/1509075753.13.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', '/Uploads/file/20180420/1524215928/百姓网 黄一民 - 浅谈管理预期与持续增长.pdf###', '34', '10', '1524215928', '0', '1', '0', null, null, null, '会议内容', '0', '', '17');
INSERT INTO `tzht_conference` VALUES ('7', '2018国际花艺设计趋势大师研讨会', '2018-04-20 17:17:00', '2018-06-22 17:17:00', '2018-04-26 17:17:00', '北京市北京市朝阳区', '樱花园东街甲2号北服创新园二层1号秀场', '[\"\\/Uploads\\/Conference\\/20180420\\/1524216119\\/1511488664.3.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356923', '/Uploads/file/20180420/1524216119/2017全球产品经理大会会刊_部分1.pdf###', '34', '11', '1524216119', '0', '1', '0', null, null, null, '会议内容', '1', '', '1');
INSERT INTO `tzht_conference` VALUES ('8', '2018中国点播影院发现论坛', '2018-04-26 17:22:00', '2018-06-21 17:22:00', '2018-05-24 17:22:00', '北京市北京市朝阳区', '日坛北路17号', '[\"\\/Uploads\\/Conference\\/20180420\\/1524216330\\/1504837002.24.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356926', '/Uploads/file/20180420/1524216330/补天安全 白健 - 法律有国界，网络安全无国界.pdf###', '34', '3', '1524216330', '0', '1', '0', null, null, null, '会议内容', '1', '', '4');
INSERT INTO `tzht_conference` VALUES ('9', '第三届中国古村镇大会', '2018-04-20 17:23:00', '2018-06-14 17:23:00', '2018-05-23 17:23:00', '北京市北京市朝阳区', '天辰东路7号', '[\"\\/Uploads\\/Conference\\/20180424\\/1524555246\\/1508739986.27.jpg\"]', '北京中网深蓝技术有限公司', '李洪亮', '18810356928', 'null###', '34', '7', '1524216487', '0', '1', '0', null, null, null, '会议内容', '1', '', '6');
INSERT INTO `tzht_conference` VALUES ('13', '会议纪要123', '2018-04-24 00:00:00', '2018-04-26 06:00:00', '2018-04-24 00:00:00', '北京市北京市丰台区', '总部基地', '[\"\\/Uploads\\/Conference\\/20180424\\/1524540074\\/7219542.jpg\"]', '幸会服务08', '陈小春', '13600189912', '/Uploads/file/20180424/1524540074/log-1524152711.txt###', '101', '7', '1524540074', '0', '0', '0', null, null, null, '会议纪要', '0', '', '1');
INSERT INTO `tzht_conference` VALUES ('14', '会议记录121', '2018-04-24 01:00:00', '2018-04-26 06:00:00', '2018-04-24 01:00:00', '北京市北京市石景山区', '体育场南路2号', '[\"\\/Uploads\\/Conference\\/20180424\\/1524540408\\/7219542.jpg\"]', '幸会服务08', '星辰', '13211890083', '/Uploads/file/20180424/1524540408/5adea3f8cd3886.70698325.txt###', '101', '2', '1524540408', '0', '0', '0', null, null, null, '会议记录', '0', '', '2');
INSERT INTO `tzht_conference` VALUES ('23', '会议测试24pm', '2018-04-24 15:00:00', '2018-04-27 18:00:00', '2018-04-24 15:00:00', '北京市北京市石景山区', '体育场南路2号', '[\"\\/Uploads\\/Conference\\/20180424\\/1524549789\\/7219542.jpg\"]', '幸会服务08', '星辰', '13511012239', '/Uploads/file/20180424/681058_dbb641ff335b38e43c79c0b05017de245adec89e053bc.txt###', '101', '2', '1524549789', '0', '0', '0', null, null, null, '会议测试24', '0', '', '1');

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
INSERT INTO `tzht_conference_audit` VALUES ('1', '47', '3');
INSERT INTO `tzht_conference_audit` VALUES ('4', '47', '3');
INSERT INTO `tzht_conference_audit` VALUES ('1', '45', '4');
INSERT INTO `tzht_conference_audit` VALUES ('1', '62', '3');
INSERT INTO `tzht_conference_audit` VALUES ('2', '62', '3');
INSERT INTO `tzht_conference_audit` VALUES ('6', '62', '3');
INSERT INTO `tzht_conference_audit` VALUES ('4', '62', '3');
INSERT INTO `tzht_conference_audit` VALUES ('2', '89', '3');
INSERT INTO `tzht_conference_audit` VALUES ('2', '46', '3');

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
INSERT INTO `tzht_conference_auditlist` VALUES ('1', '47', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('4', '47', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('1', '45', '4');
INSERT INTO `tzht_conference_auditlist` VALUES ('1', '62', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('2', '62', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('6', '62', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('4', '62', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('2', '89', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('2', '46', '3');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议公告表';

-- ----------------------------
-- Records of tzht_conference_bull
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会议栏目表';

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
INSERT INTO `tzht_conference_cate` VALUES ('10', '1', '演义演出', '0');
INSERT INTO `tzht_conference_cate` VALUES ('11', '1', '博物馆展览', '0');
INSERT INTO `tzht_conference_cate` VALUES ('12', '1', '其他', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的会议删除中间表';

-- ----------------------------
-- Records of tzht_conference_del
-- ----------------------------

-- ----------------------------
-- Table structure for `tzht_conference_down`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_down`;
CREATE TABLE `tzht_conference_down` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '下载文件的名称',
  `downtime` int(11) NOT NULL COMMENT '下载时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议资料下载统计表';

-- ----------------------------
-- Records of tzht_conference_down
-- ----------------------------

-- ----------------------------
-- Table structure for `tzht_conference_focus`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_focus`;
CREATE TABLE `tzht_conference_focus` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `conf_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议发布者id',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,没有更新信息；1,企业用户信息更新',
  `ischat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是群组成员，0为新建，1为拉人入群',
  `note` varchar(10) NOT NULL COMMENT '备注昵称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 关注表（企业通讯录）';

-- ----------------------------
-- Records of tzht_conference_focus
-- ----------------------------
INSERT INTO `tzht_conference_focus` VALUES ('41', '44', '0', '0', '陈江');
INSERT INTO `tzht_conference_focus` VALUES ('34', '82', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('34', '45', '1', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('34', '48', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('34', '49', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('34', '36', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('47', '87', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('47', '41', '1', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('45', '87', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('89', '49', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('89', '47', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('89', '45', '1', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('89', '39', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('41', '53', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('45', '49', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('45', '47', '0', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('45', '46', '1', '0', '');
INSERT INTO `tzht_conference_focus` VALUES ('43', '4', '0', '0', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议详情图片表';

-- ----------------------------
-- Records of tzht_conference_pic
-- ----------------------------

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
INSERT INTO `tzht_conference_sign` VALUES ('1', '45');

-- ----------------------------
-- Table structure for `tzht_conf_partners`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conf_partners`;
CREATE TABLE `tzht_conf_partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议与合作伙伴中间表';

-- ----------------------------
-- Records of tzht_conf_partners
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='平台消息删除中间表';

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
INSERT INTO `tzht_del_jgpush` VALUES ('40', '34', '7', '1521430246');
INSERT INTO `tzht_del_jgpush` VALUES ('41', '40', '6', '1521431712');
INSERT INTO `tzht_del_jgpush` VALUES ('42', '0', '5', '1521518253');
INSERT INTO `tzht_del_jgpush` VALUES ('43', '40', '7', '1521530099');
INSERT INTO `tzht_del_jgpush` VALUES ('44', '46', '5', '1522718061');
INSERT INTO `tzht_del_jgpush` VALUES ('45', '46', '7', '1522742264');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='企业资料表';

-- ----------------------------
-- Records of tzht_download
-- ----------------------------
INSERT INTO `tzht_download` VALUES ('2', '4', '企业交流会资料', '[\"\\/Uploads\\/file\\/20180129\\/1517207441\\/A+Byte+of+Python.pdf\"]', '1517207442');
INSERT INTO `tzht_download` VALUES ('4', '53', '新媒体案例', '[\"\\/Uploads\\/file\\/20180309\\/1520574019\\/2018年1月份策划.xls\",\"\\/Uploads\\/file\\/20180309\\/1520574019\\/水云舟媒体制作报价.xlsx\"]', '1520574022');
INSERT INTO `tzht_download` VALUES ('5', '34', '企业资料01', '[\"\\/Uploads\\/file\\/20180319\\/1521440194\\/Android1_0_0-1.pdf\"]', '1521440225');
INSERT INTO `tzht_download` VALUES ('6', '34', '企业资料2', '[\"\\/Uploads\\/file\\/20180319\\/1521440289\\/媒资管理系统概要设计说明书 -.doc\"]', '1521440293');

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
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COMMENT='极光推送个人消息表';

-- ----------------------------
-- Records of tzht_jgpushperson
-- ----------------------------
INSERT INTO `tzht_jgpushperson` VALUES ('187', '106', '45', '大的1235', '大的1235', '0', '1522306103');
INSERT INTO `tzht_jgpushperson` VALUES ('188', '147', '40', '1', '2', '0', '1522633764');
INSERT INTO `tzht_jgpushperson` VALUES ('190', '151', '46', '1', '1', '0', '1523425063');
INSERT INTO `tzht_jgpushperson` VALUES ('191', '151', '46', '2', '2', '0', '1523425093');
INSERT INTO `tzht_jgpushperson` VALUES ('192', '151', '46', '2', '2', '0', '1523425097');
INSERT INTO `tzht_jgpushperson` VALUES ('193', '147', '40', '2323', '234234', '0', '1523433290');
INSERT INTO `tzht_jgpushperson` VALUES ('194', '151', '45', '签到提醒', '签到提醒理工将', '0', '1523505521');
INSERT INTO `tzht_jgpushperson` VALUES ('195', '151', '45', '1866', '统计局摩羯', '0', '1523505596');
INSERT INTO `tzht_jgpushperson` VALUES ('196', '151', '45', '5888', '吐露屡屡', '0', '1523505988');
INSERT INTO `tzht_jgpushperson` VALUES ('197', '151', '45', '你好', '距离吐口', '0', '1523514039');
INSERT INTO `tzht_jgpushperson` VALUES ('198', '151', '45', '睡醒的兔子', '睡醒的兔子路', '0', '1523613698');
INSERT INTO `tzht_jgpushperson` VALUES ('199', '151', '45', '他路口部', ' 据兔陆军噢', '0', '1523614332');
INSERT INTO `tzht_jgpushperson` VALUES ('200', '151', '45', '2018.4.16', '推送内容', '0', '1523840254');
INSERT INTO `tzht_jgpushperson` VALUES ('202', '158', '41', '1', '1', '0', '1523843919');
INSERT INTO `tzht_jgpushperson` VALUES ('203', '161', '87', '你好', '会议日期', '0', '1523933283');
INSERT INTO `tzht_jgpushperson` VALUES ('204', '156', '43', '中网刘为国下午重要会议议程', '尊敬的中网刘为国先生，您在参加此次上午的大数据技术峰会开幕式后，下午有个圆桌主体技术论坛在二楼分会场208室举行，届时望准时参加，谢谢！', '0', '1523949071');
INSERT INTO `tzht_jgpushperson` VALUES ('205', '1', '45', '推送提醒', '首肯了立春通知', '0', '1524445016');

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
) ENGINE=InnoDB AUTO_INCREMENT=2272 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

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
INSERT INTO `tzht_log` VALUES ('1352', '45', '1520589503', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1353', '45', '1520642451', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1354', '40', '1520642464', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1355', '40', '1520642497', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1356', '34', '1520642513', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1357', '34', '1520642559', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1358', '45', '1520642576', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1359', '34', '1520642783', '0', '123.114.105.223', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-10 08:23登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1360', '45', '1520648546', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1361', '40', '1520648568', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1362', '40', '1520649645', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1363', '45', '1520649658', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1364', '45', '1520650626', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1365', '40', '1520650644', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1366', '40', '1520655393', '0', '123.114.105.223', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户176****8102/17600898102您好！您使用了电脑2018-03-10 12:33登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1367', '4', '1520655435', '0', '123.114.105.223', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-10 12:15登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1368', '34', '1520655472', '0', '123.114.105.223', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-10 12:52登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1369', '40', '1520665053', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1370', '40', '1520671287', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1371', '40', '1520671838', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1372', '45', '1520671871', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1373', '40', '1520673069', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1374', '40', '1520674855', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1375', '45', '1520674869', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1376', '47', '1520676875', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1377', '45', '1520677446', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1378', '34', '1520677458', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1379', '47', '1520677643', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1380', '34', '1520677675', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1381', '34', '1520753766', '0', '125.33.83.180', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-11 15:06登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1382', '34', '1520815270', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1383', '45', '1520815298', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1384', '53', '1520816343', '0', '111.199.17.254', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户186****9918/18618249918您好！您使用了电脑2018-03-12 08:03登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1385', '34', '1520820073', '0', '111.199.17.254', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-12 10:13登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1386', '45', '1520820087', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1387', '34', '1520820108', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1388', '34', '1520821172', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1389', '45', '1520821235', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1390', '45', '1520821520', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1391', '34', '1520821541', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1392', '34', '1520823664', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1393', '45', '1520823675', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1394', '45', '1520823887', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1395', '34', '1520823909', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1396', '34', '1520823993', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1397', '45', '1520824010', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1398', '34', '1520826695', '0', '111.199.17.254', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-12 11:35登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1399', '34', '1520827485', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1400', '45', '1520827498', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1401', '45', '1520832574', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1402', '34', '1520832590', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1403', '45', '1520835086', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.2', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1404', '45', '1520842472', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1405', '45', '1520844046', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1406', '34', '1520845661', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1407', '34', '1520849549', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1408', '34', '1520850218', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1409', '45', '1520850234', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1410', '45', '1520851320', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.2', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1411', '34', '1520903207', '0', '111.199.30.82', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-13 09:47登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1412', '34', '1520903386', '0', '111.199.30.82', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-13 09:46登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1413', '41', '1520903504', '0', '192.168.3.78', '中国-北京-北京', '0', '2', '2', '2.1.3', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1414', '53', '1520903520', '0', '192.168.3.78', '中国-北京-北京', '0', '2', '1', '2.1.3', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1415', '45', '1520904730', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1416', '34', '1520904747', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1417', '34', '1520904817', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1418', '45', '1520904830', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.2', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1419', '53', '1520916303', '0', '192.168.3.78', '中国-北京-北京', '0', '2', '2', '2.1.3', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1420', '41', '1520916320', '0', '192.168.3.78', '中国-北京-北京', '0', '2', '1', '2.1.3', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1421', '45', '1520921214', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1422', '34', '1520921229', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1423', '34', '1520922804', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1424', '40', '1520922818', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1425', '40', '1520922837', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1426', '45', '1520922863', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1427', '34', '1520923159', '0', '111.199.30.82', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-13 14:19登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1428', '34', '1520994909', '0', '61.51.165.44', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-14 10:09登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1429', '45', '1520999287', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1430', '40', '1520999303', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1431', '40', '1520999341', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1432', '34', '1520999360', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1433', '34', '1520999476', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1434', '40', '1520999527', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1435', '40', '1521004943', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1436', '40', '1521004975', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1437', '40', '1521005733', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1438', '40', '1521005760', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1439', '40', '1521007505', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1440', '40', '1521007534', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1441', '40', '1521011804', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1442', '34', '1521011829', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1443', '34', '1521011932', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1444', '46', '1521011956', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1445', '46', '1521011975', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1446', '47', '1521011995', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1447', '47', '1521012016', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1448', '40', '1521012028', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1449', '40', '1521012054', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1450', '34', '1521012074', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1451', '34', '1521012123', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1452', '46', '1521012142', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1453', '4', '1521012338', '0', '61.51.165.44', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-14 15:38登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1454', '4', '1521012365', '0', '61.51.165.44', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-14 15:05登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1455', '43', '1521012483', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '2', '2.1.3', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1456', '43', '1521012486', '0', '10.0.3.15', '中国-北京-北京', '0', '2', '1', '1.1.6', 'hammerhead  Netease\nMuMu', null);
INSERT INTO `tzht_log` VALUES ('1457', '43', '1521012628', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.1.3', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1458', '43', '1521013171', '0', '10.0.3.15', '中国-北京-北京', '0', '2', '2', '2.1.3', 'hammerhead  Netease\nMuMu', null);
INSERT INTO `tzht_log` VALUES ('1459', '46', '1521013890', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1460', '45', '1521013907', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1461', '45', '1521014136', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1462', '34', '1521014155', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1463', '34', '1521014160', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1464', '45', '1521014172', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1465', '45', '1521014182', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1466', '34', '1521014199', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1467', '34', '1521014221', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1468', '40', '1521014239', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1469', '40', '1521014244', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1470', '34', '1521014259', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1471', '34', '1521014277', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1472', '40', '1521014289', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1473', '40', '1521014303', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1474', '34', '1521014316', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1475', '34', '1521014329', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1476', '45', '1521014351', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1477', '45', '1521014365', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1478', '34', '1521014382', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1479', '34', '1521015143', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1480', '45', '1521015157', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1481', '45', '1521015287', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1482', '40', '1521015320', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1483', '40', '1521016076', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1484', '46', '1521016091', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1485', '46', '1521016110', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1486', '47', '1521016126', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1487', '47', '1521016206', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1488', '40', '1521016229', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1489', '46', '1521016636', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1490', '40', '1521017105', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1491', '45', '1521017127', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1492', '45', '1521019959', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1493', '40', '1521019992', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1494', '46', '1521021397', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1495', '47', '1521021415', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1496', '4', '1521077635', '0', '123.114.101.25', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-15 09:55登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1497', '47', '1521082476', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1498', '34', '1521082501', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1499', '40', '1521086399', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1500', '34', '1521086416', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1501', '34', '1521089821', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1502', '40', '1521089834', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1503', '40', '1521090353', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1504', '34', '1521090363', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1505', '34', '1521091172', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1506', '40', '1521091183', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1507', '40', '1521096840', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1508', '34', '1521096855', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1509', '34', '1521097539', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1510', '40', '1521097554', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.3', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1511', '41', '1521100739', '0', '192.168.1.101', '中国-北京-北京', '0', '2', '2', '2.1.3', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1512', '53', '1521100759', '0', '192.168.1.101', '中国-北京-北京', '0', '2', '1', '2.1.3', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1513', '45', '1521102104', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.4', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1514', '53', '1521102866', '0', '192.168.1.101', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1515', '45', '1521105231', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1516', '34', '1521160132', '0', '125.33.75.130', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-16 08:52登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1517', '53', '1521166303', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1518', '41', '1521166316', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1519', '45', '1521168360', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1520', '41', '1521170315', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1521', '53', '1521170332', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1522', '45', '1521171773', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1523', '45', '1521182139', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1524', '53', '1521197317', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1525', '41', '1521197331', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1526', '41', '1521333602', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1527', '53', '1521333619', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1528', '53', '1521333802', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1529', '41', '1521333818', '0', '192.168.3.123', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1530', '41', '1521373870', '0', '192.168.3.152', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1531', '53', '1521373887', '0', '192.168.3.152', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1532', '53', '1521413709', '0', '192.168.3.152', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1533', '41', '1521413724', '0', '192.168.3.152', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1534', '34', '1521421211', '0', '111.199.16.236', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-19 09:11登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1535', '4', '1521421243', '0', '111.199.16.236', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-19 09:43登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1536', '45', '1521421325', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1537', '4', '1521421352', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1538', '4', '1521422545', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1539', '45', '1521422558', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1540', '41', '1521424247', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1541', '61', '1521424717', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1542', '41', '1521424729', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1543', '34', '1521429663', '0', '111.199.16.236', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-19 11:03登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1544', '45', '1521430003', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1545', '34', '1521430020', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1546', '34', '1521431310', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1547', '45', '1521431321', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1548', '45', '1521431361', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1549', '40', '1521431804', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1550', '45', '1521431815', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1551', '45', '1521431929', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1552', '34', '1521431939', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1553', '34', '1521432100', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1554', '45', '1521432112', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1555', '45', '1521435120', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1556', '34', '1521435132', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1557', '34', '1521436156', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1558', '45', '1521436166', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1559', '34', '1521439506', '0', '111.199.16.236', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-19 14:06登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1560', '45', '1521440139', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1561', '40', '1521440149', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1562', '61', '1521447322', '0', '111.199.16.236', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户158****8995/15810038995您好！您使用了电脑2018-03-19 16:22登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1563', '41', '1521447377', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1564', '61', '1521447392', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1565', '45', '1521506704', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1566', '61', '1521507471', '0', '10.51.76.175', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1567', '41', '1521507485', '0', '10.51.76.175', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1568', '45', '1521510659', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1569', '40', '1521510672', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1570', '40', '1521510680', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1571', '34', '1521510695', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1572', '34', '1521511231', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1573', '40', '1521511241', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1574', '40', '1521511260', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1575', '45', '1521511285', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1576', '45', '1521511325', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1577', '34', '1521511340', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1578', '34', '1521511389', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1579', '45', '1521511403', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1580', '45', '1521511414', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1581', '40', '1521511433', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1582', '40', '1521511463', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1583', '45', '1521511483', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1584', '45', '1521513935', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1585', '45', '1521517682', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1586', '34', '1521517694', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1587', '34', '1521517759', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1588', '45', '1521518729', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1589', '45', '1521519343', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1590', '45', '1521519362', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1591', '45', '1521519440', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1592', '34', '1521519459', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1593', '34', '1521519479', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1594', '45', '1521519490', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1595', '45', '1521528205', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1596', '34', '1521528217', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1597', '34', '1521529768', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1598', '40', '1521529779', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1599', '40', '1521533156', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1600', '34', '1521533167', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1601', '34', '1521533195', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1602', '45', '1521533206', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1603', '45', '1521535437', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1604', '34', '1521766807', '0', '221.221.239.52', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-23 09:07登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1605', '45', '1521767324', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.4', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1606', '41', '1521785642', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1607', '61', '1521785662', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1608', '45', '1521795751', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1609', '45', '1521797782', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1610', '45', '1521798549', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1611', '34', '1521798569', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1612', '34', '1521798612', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1613', '45', '1521798623', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1614', '34', '1521801796', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1615', '45', '1522024238', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1616', '45', '1522024692', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1617', '34', '1522024706', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1618', '34', '1522024722', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1619', '40', '1522024737', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1620', '40', '1522024744', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1621', '45', '1522024767', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1622', '61', '1522026387', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1623', '41', '1522026400', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1624', '34', '1522031277', '0', '123.123.102.211', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-26 10:57登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1625', '34', '1522032015', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1626', '4', '1522032383', '0', '123.123.102.211', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-26 10:23登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1627', '46', '1522036433', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.3', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1628', '45', '1522047365', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1629', '34', '1522047379', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1630', '34', '1522048412', '0', '123.123.102.211', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-26 15:32登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1631', '34', '1522048650', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1632', '45', '1522048676', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1633', '45', '1522049568', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1634', '40', '1522049587', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1635', '40', '1522051410', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1636', '40', '1522052165', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1637', '40', '1522053075', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1638', '40', '1522054649', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1639', '45', '1522054670', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1640', '34', '1522055605', '0', '123.123.102.211', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-26 17:25登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1641', '40', '1522057868', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1642', '45', '1522057884', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1643', '4', '1522059315', '0', '123.123.102.211', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-26 18:15登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1644', '44', '1522070134', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.2', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1645', '62', '1522070164', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.2', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1646', '62', '1522070277', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.2', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1647', '62', '1522070301', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.2', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1648', '62', '1522112192', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5038/15652465038您好！您使用了电脑2018-03-27 08:32登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1649', '62', '1522112326', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5038/15652465038您好！您使用了电脑2018-03-27 08:46登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1650', '4', '1522113110', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-27 09:50登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1651', '62', '1522113141', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5038/15652465038您好！您使用了电脑2018-03-27 09:21登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1652', '62', '1522113228', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5038/15652465038您好！您使用了电脑2018-03-27 09:48登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1653', '62', '1522113265', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5038/15652465038您好！您使用了电脑2018-03-27 09:25登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1654', '62', '1522114037', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****8888/18888888888您好！您使用了电脑2018-03-27 09:17登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1655', '43', '1522114095', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '2', '2.1.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1656', '62', '1522114120', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.1.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1657', '40', '1522114175', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1658', '62', '1522114240', '0', '1.203.183.165', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****8888/18888888888您好！您使用了电脑2018-03-27 09:40登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1659', '45', '1522114393', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1660', '34', '1522114407', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1661', '34', '1522114432', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1662', '40', '1522114441', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1663', '45', '1522116423', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1664', '62', '1522116686', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '2', '2.1.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1665', '4', '1522116752', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-27 10:32登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1666', '40', '1522118389', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1667', '45', '1522118416', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1668', '45', '1522118505', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1669', '34', '1522118523', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1670', '34', '1522119101', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1671', '45', '1522119220', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1672', '45', '1522119288', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1673', '45', '1522119499', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1674', '40', '1522119510', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1675', '45', '1522119530', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1676', '62', '1522122716', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.4', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1677', '60', '1522122734', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.4', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1678', '34', '1522123017', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-27 11:57登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1679', '34', '1522125792', '0', '221.217.208.251', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-27 12:12登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1680', '45', '1522125902', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1681', '45', '1522125955', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1682', '45', '1522126186', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1683', '45', '1522126217', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1684', '45', '1522126234', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1685', '62', '1522137439', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.1.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1686', '45', '1522150220', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1687', '45', '1522197622', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1688', '70', '1522197647', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1689', '70', '1522197655', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1690', '70', '1522197671', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1691', '70', '1522197798', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1692', '70', '1522197810', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1693', '70', '1522197902', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1694', '45', '1522197985', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1695', '62', '1522198924', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '2', '2.1.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1696', '4', '1522199040', '0', '221.217.210.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-28 09:00登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1697', '43', '1522199073', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.1.4', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1698', '34', '1522199426', '0', '221.217.210.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-28 09:26登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1699', '45', '1522199483', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1700', '61', '1522199576', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1701', '41', '1522199673', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1702', '60', '1522199725', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.4', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1703', '44', '1522199750', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.4', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1704', '61', '1522199944', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1705', '72', '1522199961', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1706', '72', '1522200073', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1707', '72', '1522200102', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1708', '41', '1522201525', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.4', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1709', '61', '1522201665', '0', '221.217.210.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户158****8995/15810038995您好！您使用了电脑2018-03-28 09:45登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1710', '72', '1522205486', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1711', '40', '1522205508', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1712', '40', '1522206714', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1713', '45', '1522206737', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1714', '45', '1522206890', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1715', '40', '1522206912', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1716', '45', '1522208800', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1717', '34', '1522208823', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1718', '34', '1522208972', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1719', '45', '1522208998', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1720', '4', '1522213262', '0', '221.217.210.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-28 13:02登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1721', '4', '1522217154', '0', '221.217.210.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-28 14:54登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1722', '4', '1522217937', '0', '221.217.210.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-28 14:57登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1723', '45', '1522218308', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1724', '4', '1522219017', '0', '221.217.210.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-28 14:57登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1725', '62', '1522223591', '0', '221.217.210.121', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****8888/18888888888您好！您使用了电脑2018-03-28 15:11登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1726', '40', '1522226854', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1727', '45', '1522226875', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1728', '45', '1522226882', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1729', '46', '1522226896', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1730', '45', '1522229223', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1731', '45', '1522229363', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1732', '46', '1522229390', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1733', '46', '1522284959', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1734', '45', '1522284969', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1735', '4', '1522288115', '0', '221.216.129.2', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-29 09:35登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1736', '46', '1522289097', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1737', '46', '1522292963', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '1.0', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1738', '45', '1522302023', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1739', '46', '1522302038', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1740', '4', '1522314972', '0', '125.33.94.222', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-29 17:12登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1741', '46', '1522369303', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1742', '45', '1522369320', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1743', '46', '1522369394', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1744', '46', '1522369398', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1745', '46', '1522369409', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1746', '46', '1522369411', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1747', '4', '1522372015', '0', '221.221.238.222', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-30 09:55登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1748', '4', '1522372707', '0', '221.221.238.222', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-03-30 09:27登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1749', '44', '1522375313', '0', '10.160.247.4', '中国-北京-北京', '0', '2', '2', '2.1.4', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1750', '34', '1522376806', '0', '221.221.238.222', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-03-30 10:46登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1751', '45', '1522393356', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1752', '45', '1522393358', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1753', '45', '1522393360', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1754', '45', '1522393390', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1755', '81', '1522393664', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1756', '46', '1522398040', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.4', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1757', '0', '1522400519', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1758', '0', '1522400748', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1759', '45', '1522400761', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.4', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1760', '45', '1522401266', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1761', '45', '1522401278', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1762', '45', '1522401562', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1763', '45', '1522401578', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1764', '45', '1522404829', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1765', '45', '1522404840', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1766', '4', '1522630924', '0', '111.199.19.124', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-02 09:04登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1767', '34', '1522632600', '0', '111.199.19.124', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-02 09:00登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1768', '36', '1522632664', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1769', '81', '1522633171', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1770', '77', '1522633245', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1771', '77', '1522633346', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1772', '44', '1522633373', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1773', '34', '1522637404', '0', '111.199.19.124', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-02 10:04登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1774', '61', '1522637514', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1775', '34', '1522637564', '0', '111.199.19.124', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-02 10:44登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1776', '61', '1522637597', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1777', '34', '1522638054', '0', '111.199.19.124', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-02 11:54登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1778', '34', '1522638175', '0', '111.199.19.124', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-02 11:55登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1779', '34', '1522638235', '0', '111.199.19.124', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-02 11:55登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1780', '34', '1522638373', '0', '111.199.19.124', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-02 11:13登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1781', '61', '1522638422', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1782', '46', '1522648446', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1783', '45', '1522649394', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1784', '45', '1522650208', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1785', '45', '1522652678', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1786', '45', '1522653922', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1787', '45', '1522656746', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1788', '45', '1522656895', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1789', '34', '1522656906', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1790', '34', '1522657075', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1791', '45', '1522657090', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1792', '45', '1522657675', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1793', '46', '1522659345', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1794', '40', '1522659501', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1795', '47', '1522659522', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1796', '0', '1522663624', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1797', '45', '1522663639', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1798', '45', '1522663702', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1799', '34', '1522663717', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1800', '34', '1522715510', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1801', '45', '1522715544', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1802', '40', '1522715564', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1803', '40', '1522715617', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1804', '46', '1522715633', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1805', '62', '1522724499', '0', '1.203.183.165', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****8888/18888888888您好！您使用了电脑2018-04-03 11:39登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1806', '34', '1522737674', '0', '123.114.96.142', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-03 14:14登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1807', '46', '1522737999', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1808', '46', '1522738845', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1809', '0', '1522738859', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1810', '45', '1522739100', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1811', '46', '1522739638', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1812', '61', '1522739724', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1813', '82', '1522739736', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1814', '82', '1522740197', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1815', '61', '1522740220', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1816', '62', '1522740263', '0', '1.203.183.165', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****8888/18888888888您好！您使用了电脑2018-04-03 15:23登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1817', '34', '1522740783', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1818', '61', '1522740864', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1819', '82', '1522740889', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1820', '82', '1522741036', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1821', '82', '1522741049', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1822', '82', '1522741222', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1823', '61', '1522741272', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1824', '61', '1522741327', '0', '192.168.3.142', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1825', '46', '1522741452', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1826', '45', '1522742176', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1827', '40', '1522743779', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1828', '46', '1522744351', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1829', '41', '1522745119', '0', '192.168.3.85', '中国-北京-北京', '0', '2', '2', '2.1.5', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1830', '53', '1522745133', '0', '192.168.3.85', '中国-北京-北京', '0', '2', '1', '2.1.5', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1831', '45', '1522801083', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1832', '45', '1522801144', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1833', '4', '1522802748', '0', '123.114.108.109', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-04 08:48登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1834', '53', '1522805880', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.5', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1835', '41', '1522805896', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.5', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1836', '61', '1522806341', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1837', '4', '1522811304', '0', '123.114.108.109', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-04 11:24登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1838', '34', '1522812385', '0', '123.114.108.109', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-04 11:25登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1839', '45', '1522814021', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '1.0', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1840', '46', '1522821962', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1841', '34', '1522821998', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1842', '46', '1522827763', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1843', '45', '1522827965', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1844', '47', '1522827982', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1845', '46', '1522828071', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1846', '45', '1522828086', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1847', '47', '1522828930', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1848', '4', '1522829480', '0', '123.114.108.109', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-04 16:20登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1849', '47', '1522829760', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1850', '45', '1522829771', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.5', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1851', '45', '1522831616', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1852', '46', '1522831630', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1853', '46', '1523149773', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.5', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1854', '4', '1523150040', '0', '111.199.16.149', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-08 09:00登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1855', '46', '1523151187', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1856', '45', '1523165659', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1857', '46', '1523165692', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1858', '34', '1523165742', '0', '111.199.16.149', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-08 13:42登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1859', '61', '1523166094', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1860', '36', '1523166106', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1861', '36', '1523166375', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '2', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1862', '61', '1523166393', '0', '192.168.0.104', '中国-北京-北京', '0', '2', '1', '2.1.5', 'unknown  Letv\nLetv X501', null);
INSERT INTO `tzht_log` VALUES ('1863', '41', '1523166448', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.5', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1864', '36', '1523166470', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.5', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1865', '36', '1523166493', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.5', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1866', '41', '1523166506', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.5', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1867', '45', '1523166986', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1868', '46', '1523170189', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1869', '45', '1523170201', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1870', '45', '1523175412', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1871', '46', '1523175425', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1872', '46', '1523178730', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1873', '40', '1523178759', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1874', '40', '1523178788', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1875', '34', '1523178800', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1876', '34', '1523179134', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1877', '45', '1523179146', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1878', '45', '1523179352', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1879', '46', '1523179368', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1880', '34', '1523179562', '0', '111.199.16.149', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-08 17:02登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1881', '46', '1523179626', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1882', '83', '1523179647', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1883', '83', '1523179782', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1884', '84', '1523179797', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1885', '84', '1523179869', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1886', '85', '1523179906', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1887', '85', '1523181381', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1888', '86', '1523181413', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1889', '86', '1523181427', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1890', '45', '1523181439', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1891', '45', '1523181558', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1892', '34', '1523181570', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1893', '34', '1523182164', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1894', '86', '1523182183', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1895', '86', '1523182230', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1896', '87', '1523182304', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1897', '87', '1523233607', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1898', '45', '1523233621', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1899', '45', '1523233693', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1900', '46', '1523233708', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1901', '45', '1523234351', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.1', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1902', '4', '1523235397', '0', '125.33.81.54', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-09 08:37登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1903', '4', '1523237515', '0', '125.33.81.54', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-09 09:55登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1904', '46', '1523239698', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1905', '45', '1523239709', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1906', '34', '1523240910', '0', '221.217.210.216', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-09 10:30登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1907', '45', '1523242348', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1908', '46', '1523242365', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1909', '46', '1523242536', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1910', '45', '1523242546', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1911', '45', '1523257982', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1912', '46', '1523257996', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1913', '46', '1523322306', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1914', '47', '1523322326', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.5', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1915', '44', '1523323125', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.6', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1916', '44', '1523323147', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.6', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1917', '34', '1523332281', '0', '123.114.101.230', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-10 11:21登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1918', '44', '1523332726', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.6', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1919', '88', '1523332750', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.6', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1920', '47', '1523336197', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1921', '45', '1523336661', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1922', '47', '1523336684', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1923', '46', '1523336752', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1924', '45', '1523336764', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1925', '47', '1523337243', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1926', '45', '1523337255', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1927', '62', '1523338620', '0', '1.203.183.165', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****8888/18888888888您好！您使用了电脑2018-04-10 13:00登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1928', '45', '1523338726', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1929', '46', '1523338742', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1930', '45', '1523339519', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1931', '46', '1523339534', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1932', '46', '1523339564', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1933', '45', '1523339576', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1934', '45', '1523339661', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1935', '47', '1523339677', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1936', '47', '1523339704', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1937', '45', '1523339717', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1938', '4', '1523341710', '0', '123.114.101.230', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-10 14:30登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1939', '34', '1523407049', '0', '125.33.82.245', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-11 08:29登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1940', '45', '1523407101', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1941', '89', '1523407135', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1942', '89', '1523407244', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1943', '45', '1523407258', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1944', '47', '1523407461', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1945', '46', '1523407481', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1946', '4', '1523407842', '0', '125.33.82.245', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-11 08:42登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1947', '4', '1523423150', '0', '125.33.82.245', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-11 13:50登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1948', '34', '1523423393', '0', '125.33.82.245', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-11 13:53登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1949', '88', '1523423566', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.6', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1950', '44', '1523423593', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.6', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('1951', '41', '1523424401', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1952', '45', '1523424449', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1953', '34', '1523424461', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1954', '62', '1523424473', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1955', '34', '1523426521', '0', '125.33.82.245', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-11 14:01登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1956', '46', '1523429970', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1957', '34', '1523431110', '0', '125.33.82.245', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-11 15:30登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1958', '46', '1523433373', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1959', '47', '1523433651', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1960', '34', '1523433871', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1961', '45', '1523433885', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1962', '47', '1523438922', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1963', '45', '1523438936', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1964', '45', '1523439067', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1965', '34', '1523439080', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1966', '34', '1523492974', '0', '221.216.126.15', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-12 08:34登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1967', '4', '1523494768', '0', '221.216.126.15', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-12 08:28登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1968', '34', '1523500329', '0', '221.216.126.15', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-12 10:09登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1969', '34', '1523505259', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1970', '45', '1523505273', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1971', '34', '1523505458', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1972', '34', '1523511800', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1973', '34', '1523513981', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('1974', '62', '1523517584', '0', '1.203.183.88', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户188****8888/18888888888您好！您使用了电脑2018-04-12 15:44登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1975', '45', '1523518422', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1976', '45', '1523524847', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1977', '34', '1523524860', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1978', '4', '1523529444', '0', '221.216.126.15', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-12 18:24登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1979', '34', '1523580851', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1980', '45', '1523580865', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1981', '4', '1523581567', '0', '61.51.165.106', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-13 09:07登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1982', '62', '1523584772', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1983', '41', '1523584789', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1984', '34', '1523584947', '0', '61.51.165.106', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-13 10:27登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1985', '45', '1523585094', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1986', '34', '1523585105', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1987', '4', '1523588154', '0', '61.51.165.106', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-13 10:54登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1988', '45', '1523589793', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1989', '34', '1523589811', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('1990', '34', '1523591016', '0', '61.51.165.106', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-13 11:36登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1991', '45', '1523598334', '0', '10.232.96.141', '中国-北京-北京', '0', '2', '1', '2.1.6', 'unknown  Xiaomi\nRedmi Note 4X', null);
INSERT INTO `tzht_log` VALUES ('1992', '34', '1523605882', '0', '61.51.165.106', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-13 15:22登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('1993', '45', '1523611513', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('1994', '41', '1523693612', '0', '10.49.19.113', '中国-北京-北京', '0', '2', '2', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1995', '61', '1523693628', '0', '10.49.19.113', '中国-北京-北京', '0', '2', '1', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('1996', '43', '1523783361', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '2', '2.1.6', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1997', '4', '1523783395', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.1.6', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1998', '4', '1523786052', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '2', '2.1.6', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('1999', '43', '1523786071', '0', '192.168.0.129', '中国-北京-北京', '0', '2', '1', '2.1.6', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2000', '4', '1523789857', '0', '221.217.55.38', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-15 18:37登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2001', '4', '1523790468', '0', '221.217.55.38', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-15 19:48登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2002', '45', '1523838498', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2003', '45', '1523838509', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2004', '34', '1523838519', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2005', '34', '1523839225', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2006', '45', '1523839243', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2007', '34', '1523842226', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2008', '45', '1523842240', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2009', '45', '1523842241', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2010', '34', '1523842532', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2011', '4', '1523842699', '0', '125.33.75.77', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-16 09:19登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2012', '34', '1523842836', '0', '125.33.75.77', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-16 09:36登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2013', '34', '1523843037', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2014', '46', '1523843052', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2015', '46', '1523843176', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2016', '47', '1523843189', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2017', '47', '1523843226', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '2', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2018', '46', '1523843243', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2019', '46', '1523843243', '0', '192.168.0.135', '中国-北京-北京', '0', '2', '1', '2.1.6', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2020', '61', '1523843659', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2021', '41', '1523843678', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2022', '45', '1523843801', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2023', '34', '1523843815', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2024', '34', '1523844041', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2025', '45', '1523844054', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2026', '45', '1523845192', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2027', '34', '1523845303', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.6', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2028', '46', '1523846226', '0', '192.168.0.194', '中国-北京-北京', '0', '2', '1', '2.1.1', 'HWI  HUAWEI\nHWI-AL00', null);
INSERT INTO `tzht_log` VALUES ('2029', '34', '1523847059', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2030', '45', '1523847079', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.6', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2031', '47', '1523857713', '0', '10.26.25.32', '中国-北京-北京', '0', '2', '1', '2.1.7', 'msm8953  samsung\nSM-C7010', null);
INSERT INTO `tzht_log` VALUES ('2032', '4', '1523865259', '0', '125.33.75.77', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-16 15:19登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2033', '41', '1523867475', '0', '10.48.236.121', '中国-北京-北京', '0', '2', '2', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2034', '61', '1523867492', '0', '10.48.236.121', '中国-北京-北京', '0', '2', '1', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2035', '61', '1523868028', '0', '10.48.236.121', '中国-北京-北京', '0', '2', '2', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2036', '41', '1523868042', '0', '10.48.236.121', '中国-北京-北京', '0', '2', '1', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2037', '41', '1523868288', '0', '10.48.236.121', '中国-北京-北京', '0', '2', '2', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2038', '62', '1523868442', '0', '10.48.236.121', '中国-北京-北京', '0', '2', '1', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2039', '62', '1523927757', '0', '192.168.3.113', '中国-北京-北京', '0', '2', '2', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2040', '41', '1523927780', '0', '192.168.3.113', '中国-北京-北京', '0', '2', '1', '2.1.6', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2041', '34', '1523928478', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2042', '45', '1523928489', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2043', '4', '1523928577', '0', '125.33.92.6', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-17 09:37登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2044', '45', '1523930677', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2045', '45', '1523930690', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2046', '45', '1523932131', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2047', '47', '1523932154', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2048', '47', '1523932357', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2049', '34', '1523932377', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2050', '45', '1523932722', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2051', '34', '1523932759', '0', '125.33.92.6', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-17 10:19登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2052', '87', '1523932785', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2053', '87', '1523936084', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2054', '45', '1523936100', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2055', '45', '1523943748', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2056', '47', '1523943768', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2057', '47', '1523945121', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2058', '45', '1523945134', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2059', '4', '1523945259', '0', '125.33.92.6', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-17 14:39登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2060', '45', '1523956357', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2061', '47', '1523956375', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2062', '47', '1523956401', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2063', '45', '1523956412', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2064', '34', '1524032993', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2065', '34', '1524033041', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2066', '34', '1524033612', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2067', '34', '1524033667', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2068', '34', '1524033755', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2069', '45', '1524033789', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.7', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2070', '34', '1524034187', '0', '111.199.26.229', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-18 14:47登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2071', '41', '1524037435', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2072', '62', '1524037480', '0', '192.168.0.131', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2073', '45', '1524040129', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2074', '47', '1524040143', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2075', '47', '1524043642', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2076', '45', '1524043657', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.7', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2077', '34', '1524043776', '0', '111.199.26.229', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-18 17:36登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2078', '62', '1524054786', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2079', '41', '1524054800', '0', '192.168.1.100', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2080', '34', '1524100518', '0', '61.51.165.10', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-19 09:18登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2081', '41', '1524106095', '0', '192.168.3.113', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2082', '61', '1524106111', '0', '192.168.3.113', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2083', '34', '1524108744', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2084', '34', '1524113683', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2085', '45', '1524113704', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2086', '45', '1524113861', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2087', '47', '1524113876', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2088', '47', '1524114246', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2089', '45', '1524114268', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2090', '45', '1524114275', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2091', '47', '1524114298', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2092', '47', '1524114958', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2093', '45', '1524114977', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2094', '45', '1524115227', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2095', '47', '1524115252', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2096', '47', '1524115396', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2097', '45', '1524115412', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2098', '45', '1524117350', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2099', '47', '1524117365', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2100', '45', '1524118525', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2101', '45', '1524118649', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2102', '47', '1524118674', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2103', '61', '1524122633', '0', '192.168.3.113', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2104', '41', '1524122646', '0', '192.168.3.113', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2105', '45', '1524125605', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2106', '34', '1524149711', '0', '61.51.165.10', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-19 22:11登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2107', '34', '1524187502', '0', '111.199.28.42', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-20 09:02登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2108', '34', '1524187981', '0', '111.199.28.42', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-20 09:01登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2109', '34', '1524192027', '0', '111.199.28.42', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-20 10:27登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2110', '45', '1524193227', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2111', '47', '1524193248', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2112', '45', '1524193389', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2113', '34', '1524193408', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2114', '34', '1524199940', '0', '111.199.28.42', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-20 12:20登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2115', '47', '1524200861', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2116', '45', '1524200875', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2117', '34', '1524204497', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2118', '45', '1524204511', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2119', '45', '1524206047', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2120', '47', '1524206065', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2121', '47', '1524206652', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2122', '45', '1524206664', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2123', '45', '1524206776', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2124', '47', '1524206796', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2125', '45', '1524207575', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2126', '34', '1524207603', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2127', '47', '1524216155', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2128', '89', '1524216198', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2129', '34', '1524216518', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2130', '45', '1524216530', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.9', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2131', '41', '1524297055', '0', '10.14.70.16', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2132', '62', '1524297106', '0', '10.14.70.16', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2133', '34', '1524444870', '0', '111.199.25.243', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-23 08:30登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2134', '89', '1524444878', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2135', '34', '1524444904', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.9', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2136', '34', '1524445337', '0', '111.199.25.243', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-23 09:17登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2137', '45', '1524445724', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2138', '62', '1524446485', '0', '10.59.117.247', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2139', '41', '1524446499', '0', '10.59.117.247', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2140', '44', '1524446553', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2141', '92', '1524446573', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2142', '92', '1524447246', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2143', '92', '1524447260', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2144', '92', '1524447273', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2145', '92', '1524447311', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2146', '92', '1524447550', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2147', '45', '1524452900', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2148', '41', '1524454279', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2149', '41', '1524454359', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2150', '41', '1524454369', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2151', '43', '1524455416', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2152', '4', '1524455475', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2153', '41', '1524455903', '0', '192.168.0.132', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2154', '45', '1524456221', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2155', '45', '1524458962', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2156', '45', '1524458979', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2157', '41', '1524461955', '0', '10.199.217.196', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2158', '53', '1524461970', '0', '10.199.217.196', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2159', '53', '1524461978', '0', '10.199.217.196', '中国-北京-北京', '0', '2', '2', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2160', '41', '1524468211', '0', '192.168.3.113', '中国-北京-北京', '0', '2', '1', '2.1.7', 'ALP  HUAWEI\nALP-TL00', null);
INSERT INTO `tzht_log` VALUES ('2161', '34', '1524475665', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2162', '34', '1524475740', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2163', '34', '1524475779', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2164', '45', '1524477233', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2165', '34', '1524477245', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2166', '34', '1524479149', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2167', '45', '1524479190', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2168', '45', '1524479563', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2169', '45', '1524479575', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2170', '45', '1524480452', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2171', '45', '1524480492', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2172', '45', '1524480543', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2173', '46', '1524480555', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2174', '46', '1524480575', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2175', '45', '1524480587', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2176', '46', '1524480629', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2177', '45', '1524480990', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2178', '46', '1524481002', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2179', '46', '1524481007', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2180', '45', '1524481038', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2181', '46', '1524531937', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2182', '34', '1524531954', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2183', '34', '1524532056', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2184', '46', '1524532068', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2185', '4', '1524533333', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2186', '43', '1524533373', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2187', '34', '1524533422', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2188', '43', '1524533426', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2189', '94', '1524533447', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2190', '94', '1524533448', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2191', '94', '1524533988', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2192', '94', '1524534368', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2193', '94', '1524534373', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2194', '95', '1524534954', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2195', '95', '1524535152', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2196', '96', '1524535175', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2197', '96', '1524535216', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2198', '97', '1524535250', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2199', '97', '1524535305', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2200', '98', '1524535342', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2201', '98', '1524535395', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2202', '99', '1524535415', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2203', '99', '1524535475', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2204', '100', '1524535497', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2205', '100', '1524535540', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2206', '102', '1524535590', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2207', '102', '1524535629', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2208', '101', '1524535654', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2209', '46', '1524536394', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2210', '34', '1524536407', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2211', '45', '1524536564', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2212', '34', '1524536578', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2213', '101', '1524536634', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2214', '34', '1524536867', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2215', '45', '1524536884', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2216', '45', '1524537361', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2217', '46', '1524537390', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2218', '46', '1524538016', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2219', '45', '1524538063', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2220', '45', '1524538222', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2221', '45', '1524538237', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2222', '45', '1524539237', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2223', '34', '1524539266', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2224', '94', '1524539866', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '2', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2225', '101', '1524539905', '0', '192.168.0.130', '中国-北京-北京', '0', '2', '1', '2.1.7', 'unknown  Xiaomi\nRedmi Note 3', null);
INSERT INTO `tzht_log` VALUES ('2226', '34', '1524540122', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2227', '45', '1524540142', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2228', '45', '1524540609', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2229', '34', '1524540649', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2230', '34', '1524541862', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2231', '45', '1524541872', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2232', '45', '1524541955', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2233', '46', '1524541967', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2234', '46', '1524543164', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2235', '45', '1524543174', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2236', '45', '1524545923', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2237', '46', '1524545935', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2238', '46', '1524546124', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2239', '45', '1524546155', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2240', '45', '1524546326', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2241', '46', '1524546337', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2242', '46', '1524546662', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2243', '45', '1524546673', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2244', '45', '1524547545', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2245', '46', '1524547557', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2246', '46', '1524547589', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2247', '45', '1524547600', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2248', '45', '1524551300', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2249', '34', '1524551314', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2250', '4', '1524557838', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2251', '4', '1524558281', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '2', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2252', '43', '1524558298', '0', '192.168.0.127', '中国-北京-北京', '0', '2', '1', '2.1.7', 'hi6250  HUAWEI\nPRA-AL00', null);
INSERT INTO `tzht_log` VALUES ('2253', '34', '1524558669', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2254', '45', '1524558679', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2255', '77', '1524561121', '0', '221.216.128.78', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户sherry123/13552832050您好！您使用了电脑2018-04-24 17:01登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2256', '34', '1524563532', '0', '221.216.128.78', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户156****5039/15652465039您好！您使用了电脑2018-04-24 17:12登录地址为中国-北京-北京');
INSERT INTO `tzht_log` VALUES ('2257', '45', '1524564312', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2258', '45', '1524564322', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2259', '45', '1524564432', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2260', '46', '1524564448', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2261', '34', '1524564525', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '2', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2262', '46', '1524564545', '0', '192.168.0.153', '中国-北京-北京', '0', '2', '1', '2.1.8', 'MSM8974  samsung\nSM-N9009', null);
INSERT INTO `tzht_log` VALUES ('2263', '46', '1524564996', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2264', '45', '1524565017', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2265', '45', '1524568762', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2266', '46', '1524568775', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2267', '46', '1524568840', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2268', '45', '1524568852', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2269', '45', '1524569464', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '2', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2270', '34', '1524569479', '0', '192.168.0.176', '中国-北京-北京', '0', '2', '1', '2.1.8', 'QC_Reference_Phone  Xiaomi\nRedmi 4A', null);
INSERT INTO `tzht_log` VALUES ('2271', '4', '1524570704', '0', '221.216.128.78', '中国-北京-北京', '0', '1', '1', '', '', '登录成功!尊敬的用户189****6236/18911936236您好！您使用了电脑2018-04-24 19:44登录地址为中国-北京-北京');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of tzht_message
-- ----------------------------
INSERT INTO `tzht_message` VALUES ('5', '4', '58886', '1517221265');
INSERT INTO `tzht_message` VALUES ('7', '27', '信息反馈', '1517381872');
INSERT INTO `tzht_message` VALUES ('8', '31', '5555', '1517385606');
INSERT INTO `tzht_message` VALUES ('10', '31', '2555', '1517641985');
INSERT INTO `tzht_message` VALUES ('12', '46', '233638', '1519871029');
INSERT INTO `tzht_message` VALUES ('13', '40', '555', '1521529791');
INSERT INTO `tzht_message` VALUES ('14', '45', '585', '1522145420');
INSERT INTO `tzht_message` VALUES ('15', '46', '58225', '1522743666');
INSERT INTO `tzht_message` VALUES ('16', '46', '阿泽哦哦', '1523239589');
INSERT INTO `tzht_message` VALUES ('17', '45', '582', '1524100001');
INSERT INTO `tzht_message` VALUES ('18', '45', '产业8d w', '1524126866');

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
-- Table structure for `tzht_phone_check`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_phone_check`;
CREATE TABLE `tzht_phone_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `check_code` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码',
  `codetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信验证表';

-- ----------------------------
-- Records of tzht_phone_check
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='权限表';

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
INSERT INTO `tzht_privilege` VALUES ('45', '个人会议发布认证', 'Certify/publish', '28', '', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='企业产品表';

-- ----------------------------
-- Records of tzht_product
-- ----------------------------
INSERT INTO `tzht_product` VALUES ('3', '4', '企业产品', 'http://xh.2188.com.cn/Product/add.html', '[\"\\/Uploads\\/product\\/2018-02-01\\/5a726feac5992.jpg\"]', '1517449198');
INSERT INTO `tzht_product` VALUES ('4', '34', '网络服务', 'www.2188.com.cn', '[\"\\/Uploads\\/product\\/2018-02-06\\/5a797951a92b3.jpg\"]', '1517910355');
INSERT INTO `tzht_product` VALUES ('5', '53', '产品1', 'www.2188.com.cn', '[\"\\/Uploads\\/product\\/2018-03-09\\/5aa220754f2dc.jpg\"]', '1520574585');
INSERT INTO `tzht_product` VALUES ('6', '34', '产品1', 'www.2188.com.cn', '[\"\\/Uploads\\/product\\/2018-03-30\\/5abda0c3a72c0.jpg\"]', '1522376902');
INSERT INTO `tzht_product` VALUES ('7', '34', 'chanpin2', 'www.2188.com.cn', '[\"\\/Uploads\\/product\\/2018-03-30\\/5abda1040afe2.jpg\"]', '1522376965');

-- ----------------------------
-- Table structure for `tzht_product_stats`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_product_stats`;
CREATE TABLE `tzht_product_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `conf_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '企业id',
  `pro_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击的产品id',
  `statstime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '统计时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='企业产品点击统计表';

-- ----------------------------
-- Records of tzht_product_stats
-- ----------------------------
INSERT INTO `tzht_product_stats` VALUES ('1', '45', '53', '5', '0');
INSERT INTO `tzht_product_stats` VALUES ('2', '45', '4', '3', '0');
INSERT INTO `tzht_product_stats` VALUES ('3', '46', '53', '5', '0');
INSERT INTO `tzht_product_stats` VALUES ('4', '46', '4', '3', '0');
INSERT INTO `tzht_product_stats` VALUES ('5', '46', '34', '6', '1523236572');
INSERT INTO `tzht_product_stats` VALUES ('6', '45', '4', '3', '1523251641');
INSERT INTO `tzht_product_stats` VALUES ('7', '47', '34', '7', '1523339683');
INSERT INTO `tzht_product_stats` VALUES ('8', '47', '34', '6', '1523339689');
INSERT INTO `tzht_product_stats` VALUES ('9', '45', '34', '7', '1523520499');
INSERT INTO `tzht_product_stats` VALUES ('10', '41', '53', '5', '1523592547');
INSERT INTO `tzht_product_stats` VALUES ('11', '41', '53', '5', '1523592577');
INSERT INTO `tzht_product_stats` VALUES ('12', '41', '53', '5', '1523592580');
INSERT INTO `tzht_product_stats` VALUES ('13', '41', '53', '5', '1523592582');
INSERT INTO `tzht_product_stats` VALUES ('14', '41', '4', '3', '1523693156');
INSERT INTO `tzht_product_stats` VALUES ('15', '41', '4', '3', '1523693163');
INSERT INTO `tzht_product_stats` VALUES ('16', '45', '34', '4', '1523840570');
INSERT INTO `tzht_product_stats` VALUES ('17', '34', '4', '3', '1524030562');
INSERT INTO `tzht_product_stats` VALUES ('18', '34', '4', '3', '1524030563');
INSERT INTO `tzht_product_stats` VALUES ('19', '45', '4', '3', '1524038881');
INSERT INTO `tzht_product_stats` VALUES ('20', '45', '4', '3', '1524038951');
INSERT INTO `tzht_product_stats` VALUES ('21', '45', '34', '7', '1524100048');
INSERT INTO `tzht_product_stats` VALUES ('22', '45', '34', '7', '1524102523');
INSERT INTO `tzht_product_stats` VALUES ('23', '45', '4', '3', '1524107369');
INSERT INTO `tzht_product_stats` VALUES ('24', '34', '34', '6', '1524109659');
INSERT INTO `tzht_product_stats` VALUES ('25', '45', '34', '7', '1524126417');
INSERT INTO `tzht_product_stats` VALUES ('26', '45', '34', '7', '1524126421');
INSERT INTO `tzht_product_stats` VALUES ('27', '45', '4', '3', '1524126755');
INSERT INTO `tzht_product_stats` VALUES ('28', '45', '4', '3', '1524186202');
INSERT INTO `tzht_product_stats` VALUES ('29', '45', '4', '3', '1524186209');
INSERT INTO `tzht_product_stats` VALUES ('30', '41', '4', '3', '1524189433');
INSERT INTO `tzht_product_stats` VALUES ('31', '41', '4', '3', '1524189434');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='融云讨论组表';

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
INSERT INTO `tzht_rongcloudim` VALUES ('13', '会议测试讨论组', 'd50d5987-5b6a-45d3-b03c-6c39d949e82f', '1521015335');
INSERT INTO `tzht_rongcloudim` VALUES ('14', '2018第五届中国激光市场高峰论坛讨论组', 'cef02339-8458-4158-9ece-1c0e34d738e7', '1521016264');
INSERT INTO `tzht_rongcloudim` VALUES ('15', '行业展讨论组', 'd9fd3cea-d039-49d4-9651-a61fb5dd379a', '1523674740');
INSERT INTO `tzht_rongcloudim` VALUES ('16', 'GMIC 2018 北京 全球移动互联网大会（AI生万物）讨论组', 'ca0277c8-f313-4eba-ba7b-a8ff41d0dde3', '1524448026');

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='签到推送消息表';

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
INSERT INTO `tzht_signjgpush` VALUES ('54', '105', '45', '北京同舟鸿图文化创意有限公司 / tzhtlhl2018 2018.2.22', '北京同舟鸿图文化创意有限公司 / tzhtlhl2018  2018.2.22', '1', '1519270861');
INSERT INTO `tzht_signjgpush` VALUES ('57', '109', '46', '北京同舟鸿图文化创意有限公司 / tzhtmn2018', '北京同舟鸿图文化创意有限公司 / tzhtmn20182312456456', '1', '1519873156');
INSERT INTO `tzht_signjgpush` VALUES ('58', '112', '36', '欢迎北京中网深蓝参会！', '欢迎您参加我们的会议！你的资料请在会议资料栏目中下载！你的住宿房间号是309，请到前台出示身份证领钥匙。如有会务事宜咨询请致电65686680.或者在讨论组中联系管理人员！', '1', '1520318386');
INSERT INTO `tzht_signjgpush` VALUES ('60', '147', '40', '111', '123wqrer2125465456', '1', '1522633706');
INSERT INTO `tzht_signjgpush` VALUES ('61', '147', '40', '2', '222', '1', '1523165982');
INSERT INTO `tzht_signjgpush` VALUES ('62', '151', '46', '111', '1', '1', '1523425019');
INSERT INTO `tzht_signjgpush` VALUES ('63', '151', '46', '6767', '7777', '1', '1523425168');
INSERT INTO `tzht_signjgpush` VALUES ('64', '151', '45', '北京同舟鸿图文化创意有限公司 ', '北京同舟鸿图文化创意有限公司 2018411', '1', '1523435580');
INSERT INTO `tzht_signjgpush` VALUES ('65', '151', '45', '北京同舟鸿图文化创意有限公司 ', '北京同舟鸿图文化创意有限公司 2018411', '1', '1523435667');
INSERT INTO `tzht_signjgpush` VALUES ('66', '151', '46', '百度会展开幕19', '百度会展开幕19', '1', '1523435702');
INSERT INTO `tzht_signjgpush` VALUES ('67', '151', '46', '百度会展开幕19', '百度会展开幕1922', '1', '1523435726');
INSERT INTO `tzht_signjgpush` VALUES ('68', '0', '0', '签到提醒', '签到提醒理工将2866', '1', '1523505577');
INSERT INTO `tzht_signjgpush` VALUES ('69', '0', '0', '他家舅舅', '528585', '1', '1523506013');
INSERT INTO `tzht_signjgpush` VALUES ('70', '151', '45', '885', '历史记录', '1', '1523506153');
INSERT INTO `tzht_signjgpush` VALUES ('71', '151', '45', '885885', ' 吐露', '1', '1523514052');
INSERT INTO `tzht_signjgpush` VALUES ('72', '149', '41', '1', '1', '1', '1523517631');
INSERT INTO `tzht_signjgpush` VALUES ('73', '151', '46', '58335', '他饿了他', '1', '1523525020');
INSERT INTO `tzht_signjgpush` VALUES ('74', '151', '46', '1', '1', '1', '1523585987');
INSERT INTO `tzht_signjgpush` VALUES ('75', '150', '41', '2212133', '2212133', '1', '1523591478');
INSERT INTO `tzht_signjgpush` VALUES ('76', '151', '45', '数字图离开了摸', '骨碌碌经济聚聚', '1', '1523613722');
INSERT INTO `tzht_signjgpush` VALUES ('77', '151', '46', '要黄海波', '特价骆驼', '1', '1523615564');
INSERT INTO `tzht_signjgpush` VALUES ('78', '151', '46', '签到推送了', '推送内容', '1', '1523838818');
INSERT INTO `tzht_signjgpush` VALUES ('79', '151', '45', '签到推送了2018.4.16', 'test158', '1', '1523840310');
INSERT INTO `tzht_signjgpush` VALUES ('80', '161', '87', '签到推送', '签到成功张伟', '1', '1523933765');
INSERT INTO `tzht_signjgpush` VALUES ('81', '156', '43', '尊敬的中网公司项目经理刘为国先生签到温馨提示！', '尊敬的中网公司项目经理刘为国先生，欢迎您参加本次2018年大数据技术峰会，您的座位在主会场第一排6号位；给您安排的住宿房间号在本酒店8层808号房，祝您参会愉快！', '1', '1523945794');
INSERT INTO `tzht_signjgpush` VALUES ('82', '1', '45', '睡醒的兔子签到提醒', '提醒内容', '1', '1524445071');

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
INSERT INTO `tzht_system` VALUES ('17', 'APP_VERSION', '2.1.6');
INSERT INTO `tzht_system` VALUES ('18', 'APP_PHONE', '010-63942568');
INSERT INTO `tzht_system` VALUES ('19', 'APP_URL', 'http://xh.2188.com.cn');
INSERT INTO `tzht_system` VALUES ('20', 'APP_COMPANY', '幸会APP');
INSERT INTO `tzht_system` VALUES ('21', 'APP_ADDRESS', '北京市石景山区体育场南路2号景阳宏昌大厦');
INSERT INTO `tzht_system` VALUES ('22', 'APP_INFO', '幸会APP，您身边的专用会议APP！');
INSERT INTO `tzht_system` VALUES ('23', 'ACCOUNT_NUM', '15');
INSERT INTO `tzht_system` VALUES ('24', 'PARTNERS_NUM', '10');

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
  `nickname` varchar(100) NOT NULL COMMENT '昵称',
  `itype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '判断是否可以登录，0可以登录，1不可以登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='用户基础表';

-- ----------------------------
-- Records of tzht_user
-- ----------------------------
INSERT INTO `tzht_user` VALUES ('4', '', '460724386@qq.com', '189****6236', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18911936236', '/./Uploads/Avatar/2018-04-24/5adee963a82a9.jpg', '信息技术', '北京同舟鸿图文化创意有限公司', '部门经理', '北京北京市石景山区', '体育场南路2号', '', '0', '', '1', '2', '1516160158', '0', '127.0.0.1', '', 'rBUsAg/tLTcDWEquk4OEbMliGEQzHZkcn1MyOsaOWek8HprMJp2++42mlxtBJ99Y7wThXY6dnpnqTcEoqtTn7A==', 'www.tzht.net.cn', '公司集设计、开发、营销为一体的综合性公司，公司主要为大型企事业单位提供技术开发、技术咨询、技术服务等，同时在移动互联网创新领域方面有一定的研究，并且跟相关技术研究院等科研机构有比较广泛深入的战略合作。', '', '/App/Index/usercode/id/4.html', '0', '', '0', '4_xinghuiapp', '0', '010-63942568', '', '0');
INSERT INTO `tzht_user` VALUES ('34', '', '1601796593@qq.com', '156****5039', '321E18352A7BA2DB7EF14553F8F8E14904B3D36C', '15652465039', '/./Uploads/Avatar/2018-02-07/5a7a9c6216a7e.jpeg', '文化传媒', '北京中网深蓝技术有限公司', '', '北京北京市石景山区', '体育场南路2号景阳宏昌大厦309', '', '0', '', '1', '2', '1517646995', '0', '127.0.0.1', '', 'eubA0xvJWBkgXb07WpkeMsliGEQzHZkcn1MyOsaOWekgDWgIXlP1tu4559nud8y3ZZHqvRmMvWHqTcEoqtTn7A==', 'www.2188.com.cn', '', '', '/App/Index/usercode/id/34.html', '0', '', '0', '34_xinghuiapp', '1', '0106666666', '我的未来我做主', '0');
INSERT INTO `tzht_user` VALUES ('36', '', '', 'zwslsw01', 'F7C3BC1D808E04732ADF679965CCC34CA7AE3441', '15811038995', '/./Uploads/Avatar/2018-02-24/5a9113d37fbd4.jpeg', '', '北京中网深蓝技术有限公司', '', '', '', '', '0', '', '1', '1', '1517909650', '0', '127.0.0.1', '', 'n0jnBBy0fLeHVGb2jk+Cf8liGEQzHZkcn1MyOsaOWekgDWgIXlP1tjh9N4mgZk5m2lXb0Rf1ZorqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/36.html', '34', '中网深蓝商务', '2', '36_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('39', '', '', 'zwsllwg888', 'E89F915537E646C4D9125BD06652BB8FDF6C24B8', '18911936258', '/Uploads/image/logo.png', '', '北京中网深蓝技术有限公司', '', '', '', '', '0', '', '1', '1', '1517986382', '0', '127.0.0.1', '', 'gKn9O0X4lcF/d6InOUJ89pIRREFK8oWTStcrEQuqMRrxHr6qR7xTna6mrke8MMZ3ml/UUxaBgDpGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/39.html', '34', '刘卫国', '2', '39_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('40', '', '', '176****8102', 'E80500596DB103FA24B896ED2ECE705E0936B8A3', '17600898102', '/./Uploads/Avatar/2018-03-15/5aaa0351837fb.jpeg', '信息技术', '2282', '', '广东省潮州市潮安县', '', '', '0', '', '1', '1', '1517992379', '0', '127.0.0.1', '', '/vYuz/boQ/Ny4z0IFF/xScliGEQzHZkcn1MyOsaOWekgDWgIXlP1tiLK0/V0opJXRkbcvNZOjAPqTcEoqtTn7A==', '', '', '', '/App/Index/usercode/id/40.html', '0', 'candy1235', '0', '40_xinghuiapp', '0', '', '李洪亮', '0');
INSERT INTO `tzht_user` VALUES ('41', '', '', 'tzhtwyg2018', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18601159800', '/./Uploads/Avatar/2018-04-24/5aded155d75a0.JPG', '文化传媒', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518002440', '0', '127.0.0.1', '', 'd06IM2oUv2rHsETRLnbNHWLgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXqnX0GnxQ5wYvX4pUdlSrUU=', '', '', '言善信，政善治', '/Home/Index/usercode/id/41.html', '4', '王总', '2', '41_xinghuiapp', '1', '', '欣欣向荣', '0');
INSERT INTO `tzht_user` VALUES ('43', '', '', 'tzhtlwg2018', 'AB0B8AA0D76D57B0D463A7209F52267ADF686184', '18911936235', '/./Uploads/Avatar/2018-04-09/5acabbe96863c.jpg', '信息技术', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518002935', '0', '127.0.0.1', '', 'swvWzb9jyu7fDl/0uubxzmLgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXnnmPZ7jmzD17mkxtGsS5Lk=', '', '', '', '/Home/Index/usercode/id/43.html', '4', '刘为国', '2', '43_xinghuiapp', '1', '', '', '0');
INSERT INTO `tzht_user` VALUES ('44', '', '', 'tzhtcj2018', 'C114AE895D99BDC15E025880FD44A99B2427CD52', '13717563627', '/./Uploads/Avatar/2018-02-07/5a7aedb1e4dca.jpeg', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518002997', '0', '127.0.0.1', '', '/9/iXbSOCkHfDl/0uubxzmLgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXq/X1iP9JorN+FaaOCSkvxw=', '', '', '', '/Home/Index/usercode/id/44.html', '4', '陈江', '2', '44_xinghuiapp', '0', '', '', '1');
INSERT INTO `tzht_user` VALUES ('45', '', '', 'tzhtlhl2018', '9D37FF541601DE56D952276F07082FBB0AE78B16', '18810356923', '/./Uploads/Avatar/2018-03-19/5aaf356898e1a.jpeg', '工程制造', '北京同舟鸿图文化创意有限公司', '互联网频道', '北京市北京市朝阳区', '想這有', '', '0', '', '1', '3', '1518003074', '0', '127.0.0.1', '', 'w40L+qNEyn0S1t2gMU1eVmLgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXuhzU4ia7gFbaSNcrwcfN0k=', '', '', '签名', '/Home/Index/usercode/id/45.html', '0', '李洪亮', '0', '45_xinghuiapp', '0', '', '睡醒的兔子', '0');
INSERT INTO `tzht_user` VALUES ('46', '', '18810356923@163.com', 'tzhtmn2018', '062C669DEC1DE6FA75598F3D0692622959C09AF7', '13311268626', '/./Uploads/Avatar/2018-04-16/5ad400c8981eb.jpg', '金融保险', '北京同舟鸿图文化创意有限公司', '软件开发', '北京市北京市朝阳区', '景阳宏昌309', '', '0', '', '1', '1', '1518003123', '0', '127.0.0.1', '', '5Uq/VIyXsE6HVGb2jk+Cf8liGEQzHZkcn1MyOsaOWelEexqr/4o97d3HpC17uqr9SHigztD6D4rqTcEoqtTn7A==', '', '', '个人签名', '/Home/Index/usercode/id/46.html', '4', '马娜', '2', '46_xinghuiapp', '0', '', '阳光海岸', '0');
INSERT INTO `tzht_user` VALUES ('47', '', '', 'tzhtlsa2018', 'F9D151D14A8555A9DEACC13FBDF28227ABEC3003', '13800138000', '/./Uploads/Avatar/2018-04-20/5ad95a36da2c5.jpg', '', '北京同舟鸿图文化创意有限公司', '技术开发', '', '', '', '0', '', '1', '1', '1518003189', '0', '127.0.0.1', '', 'fYtcPjzeXePg4jo/hqzlhcliGEQzHZkcn1MyOsaOWelEexqr/4o97a/r2enVlabWHJOalB0wzn3qTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/47.html', '4', '刘思奥', '2', '47_xinghuiapp', '0', '', '小兔子', '0');
INSERT INTO `tzht_user` VALUES ('48', '', '', 'tzhtzyl2018', '8FBE4E08BEEB81D608617D6A9C787AFDDAB46D09', '13811176012', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518003250', '0', '127.0.0.1', '', 'RZI7BxgHViH/tBfbLpQhXsliGEQzHZkcn1MyOsaOWelEexqr/4o97da+5Zpfxxu4BOrKZkXxRjrqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/48.html', '4', '赵银玲', '2', '48_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('49', '', '', 'tzhtwxq2018', 'E353DCC768D2D8529A9B8A91D1831487069B89B9', '13800138001', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518003288', '0', '127.0.0.1', '', 'pRWKTFqeE+Q8fG2QgB/WzMliGEQzHZkcn1MyOsaOWelEexqr/4o97aAUi8cJiLWD9IW5mgqsa2LqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/49.html', '4', '王小群', '2', '49_xinghuiapp', '1', '', '', '0');
INSERT INTO `tzht_user` VALUES ('50', '', '', 'tzhtdyx2018', '1292F0FCABC7A4D53506076ADD4D3B4819C6E2A5', '13693326383', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1518003327', '0', '127.0.0.1', '', 'B7lr72gQNhuDIbe9u7/htMliGEQzHZkcn1MyOsaOWelEexqr/4o97VWIq6iB1uEg8RV1KD3q8LjqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/50.html', '4', '邓雅心', '2', '50_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('52', '', '', '133****0919', '945181A1A54BF7F7BB6D5ADF7F0EF671DA8D451A', '13391910919', '/Uploads/image/logo.png', '', '', '', '', '', '', '0', '', '1', '1', '1518059503', '0', '127.0.0.1', '', 'kW076EEbls7Aayl6zUG9v2LgkQ3O+7PFPxqmhyeRWfhohMKSEQoTXs2bd0Jpd1lkXzfzqMjHmP4=', '', '', '', '/App/Index/usercode/id/52.html', '0', '', '0', '52_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('53', '', '', '186****9918', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18618249918', '/./Uploads/Avatar/2018-02-09/5a7d72b806dab.jpeg', '文化传媒', '北京水云舟文化创意有限公司', '', '', '', '', '0', '', '1', '2', '1518170482', '0', '127.0.0.1', '', 'bYxeGKFbOMp7xnbJUSCND5IRREFK8oWTStcrEQuqMRrxHr6qR7xTnUroInnUmfyye/oEa94PsLZGZXlsl2ZFEg==', '', '', '', '/App/Index/usercode/id/53.html', '0', '', '0', '53_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('58', '', '', 'syzsw1', '77BDD7687B818827705160E0898891C3CF3B3B08', '13910013322', '/Uploads/image/logo.png', '', '北京水云舟文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1520574198', '0', '127.0.0.1', '', 'NeWYCafWvvMPgP4nuNHb9GLgkQ3O+7PFPxqmhyeRWfj/bbavo7pNSp7GDhZjLs0MRqXt3sMlNaY=', '', '', '', '/Home/Index/usercode/id/58.html', '53', '水云舟商务', '2', '58_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('60', '', '', 'vivo123', '2ABBB3E61C9E84095FDBC0C44A13DDF90D757F22', '13717531356', '/Uploads/image/logo.png', '信息技术', '北京中网深蓝技术有限公司', '', '', '', '', '0', '', '1', '1', '1520911511', '0', '127.0.0.1', '', 'G5vzE8J+qj1cwDg4KYv+g5IRREFK8oWTStcrEQuqMRp9jnt6tsNiR6bwDSOIYtD4fHXLdQeLzAxGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/60.html', '0', 'sherry123', '0', '60_xinghuiapp', '0', '', '', '1');
INSERT INTO `tzht_user` VALUES ('61', '', '', '158****8995', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '15810038995', '/./Uploads/Avatar/2018-03-26/5ab8442e9a7e2.jpeg', '', '', '', '', '', '', '0', '', '1', '1', '1521424279', '0', '127.0.0.1', '', 'p53cs1LB/l6xLdri6cW+62LgkQ3O+7PFPxqmhyeRWfgETs4XSzo/OoTPoUfeTa7dpgGnDJUcU70=', '', '', '', '/App/Index/usercode/id/61.html', '0', '', '0', '61_xinghuiapp', '0', '', '携手向前', '0');
INSERT INTO `tzht_user` VALUES ('62', '', '', '188****8888', '537340970FC46BA2BAD4D81B8B83352BAB039615', '18888888888', '/./Uploads/Avatar/2018-04-21/5adaedc25fefb.jpg', '', '中国会议服务咨询公司', '', '北京市北京市朝阳区', '', '', '0', '', '1', '2', '1520911511', '0', '127.0.0.1', '', 'i+/CS+Ts5FMMpoiN2qBFvMliGEQzHZkcn1MyOsaOWem182HSyFkHH7wZcurt+lgvNMyugWjFt/3qTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/62.html', '0', '', '0', '62_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('64', '', '', 'candy1235', '7CFC900ADCFBF7ABDC417586B796636411943149', '13800138005', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1522122863', '0', '127.0.0.1', '', 'vzBa57+hxus6eGqbbBj1uOgACXY25mC+BnzJ8eAjxHF+62GBEHB44TXy5ku0lgbF3ddm0TLkPe8=', '', '', '', '/Home/Index/usercode/id/64.html', '0', 'candy1235', '0', '64_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('72', '', '', 'zwsl03', 'F7C3BC1D808E04732ADF679965CCC34CA7AE3441', '18810356922', '/Uploads/image/logo.png', '', '北京中网深蓝技术有限公司', '', '', '', '', '0', '', '1', '1', '1522199952', '0', '127.0.0.1', '', 'p3XhUr2lsTrqGYkC1UeKLJIRREFK8oWTStcrEQuqMRp9jnt6tsNiRwnRL3DiCR05Mi2vYX24EW1GZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/72.html', '0', '李洪亮', '0', '72_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('77', '', '', 'sherry123', '2ABBB3E61C9E84095FDBC0C44A13DDF90D757F22', '13552832050', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1522315487', '0', '127.0.0.1', '', 'kFiHkz8Y+DJBJn+qyMN8+8liGEQzHZkcn1MyOsaOWem182HSyFkHH/Ec22Ge0cJDG5Oq+ENM/UjqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/77.html', '0', 'sherry123', '0', '77_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('81', '', '', 'candy1236', 'FA0B3FDE014A6819723B78E2FFB82A7F6EED964D', '13717531356', '/Uploads/image/logo.png', '', '北京同舟鸿图文化创意有限公司', '', '', '', '', '0', '', '1', '1', '1522316242', '0', '127.0.0.1', '', '49VBr/Pnf0Vt/1z0jFNBXcliGEQzHZkcn1MyOsaOWem182HSyFkHH5EfFXwCrUzuixyOcqlZntLqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/81.html', '4', 'candy1236', '2', '81_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('82', '', '', 'ceshi1', '7C222FB2927D828AF22F592134E8932480637C0D', '18888888898', '/./Uploads/Avatar/2018-04-03/5ac32a90cb31c.jpeg', '', '中国会议服务咨询公司', '', '', '', '', '0', '', '1', '1', '1522724599', '0', '127.0.0.1', '', 'wBebyQS0f4ZtlCFB9WvvGJIRREFK8oWTStcrEQuqMRp9jnt6tsNiR6OeQrsId2H1NU54S+FZTH1GZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/82.html', '62', '测试一', '2', '82_xinghuiapp', '0', '', '浏览器', '0');
INSERT INTO `tzht_user` VALUES ('87', '', '', 'zwslzw2018', '70F2B201479444E8C8B0EA78A4991FB253DC579D', '18810356954', '/Uploads/image/logo.png', '商业服务', '北京中网深蓝技术有限公司', '', '北京北京市石景山区', '体育场南路2号景阳宏昌大厦309', '', '0', '', '1', '1', '1523182288', '0', '127.0.0.1', '', 'euSrqjcI3BxJSF1l2/x425IRREFK8oWTStcrEQuqMRp9jnt6tsNiR8fpFaRLxgfIereBFrRZdGZGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/87.html', '34', '张伟', '2', '87_xinghuiapp', '0', '', '小张伟', '0');
INSERT INTO `tzht_user` VALUES ('88', '', '', 'zwslkq2018', '0F09850DCC1FCD63B0422ABCD6CC63B9A640530E', '13552832051', '/Uploads/image/logo.png', '商业服务', '北京中网深蓝技术有限公司', '', '北京北京市石景山区', '体育场南路2号景阳宏昌大厦309', '', '0', '', '1', '1', '1523332364', '0', '127.0.0.1', '', 'PWPwIbbM09vXO2g1gehrEJIRREFK8oWTStcrEQuqMRp9jnt6tsNiR6fWCnD/tiaPmP3SI6JRJ6lGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/88.html', '34', 'zwslkq2018', '2', '88_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('89', '', '', 'zwsllw2019', 'B165B1C86C5F32D590E43027E678C8464A69A871', '17600898125', '/Uploads/image/logo.png', '商业服务', '北京中网深蓝技术有限公司', '软件工程师', '北京北京市石景山区', '体育场南路2号景阳宏昌大厦309', '', '0', '', '1', '1', '1523407094', '0', '127.0.0.1', '', '+RQpqAZJxW1M4EyDjBFjbJIRREFK8oWTStcrEQuqMRp9jnt6tsNiR+KY/wjtWouqFmwukbEgglhGZXlsl2ZFEg==', '', '', '个人签名', '/Home/Index/usercode/id/89.html', '34', '李伟', '2', '89_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('93', '', '', '133****1746', 'E52BF862A804FD783810B1F349997988E8FE89CC', '13311011746', '/Uploads/image/logo.png', '', '', '', '', '', '', '0', '', '1', '1', '1524408243', '0', '127.0.0.1', '', 'nfiAUnY8o5zDLFIcyrfuDZIRREFK8oWTStcrEQuqMRp9jnt6tsNiRzaT2hKAh7G52RO+RR3HscJGZXlsl2ZFEg==', '', '', '', '/App/Index/usercode/id/93.html', '0', '', '0', '93_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('94', '', '', 'wyg63942568', '5192DE71D28EFB83B5589F00C306A2819918DE3F', '', '/Uploads/image/logo.png', '', '幸会服务', '', '', '', '', '0', '', '1', '2', '0', '0', '127.0.0.1', '', 'qOp3HoD8jOaxLdri6cW+62LgkQ3O+7PFPxqmhyeRWfi8iBJ1mu/03XYWLBpTS5TgOLTdiuPpiGM=', '', '', '', '/Home/Index/usercode/id/94.html', '0', '', '0', '94_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('95', '', '', 'csh63942568', '0664BCF0A8D7617D3D502AB215C1F9E0DC67C84D', '', '/Uploads/image/logo.png', '', '幸会服务01', '', '', '', '', '0', '', '1', '2', '1524408243', '0', '127.0.0.1', '', 'e/By4/zRLDEzxaYUoJ0gEcliGEQzHZkcn1MyOsaOWemaim8xqHQqnvMKuOjvcZGLj+SQZLaubI7qTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/95.html', '0', '', '0', '95_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('96', '', '', 'lwg63942568', 'AA4030C5ABAFCF208CBF4DEB01E54EC68E1660FF', '', '/Uploads/image/logo.png', '', '幸会服务02', '', '', '', '', '0', '', '1', '2', '1524408243', '0', '127.0.0.1', '', 'gfC9wPUn0fZxV0Xkf/v6UZIRREFK8oWTStcrEQuqMRp9jnt6tsNiR5CifT8vS2PoQNH20bcVzgBGZXlsl2ZFEg==', '', '', '', '/Home/Index/usercode/id/96.html', '0', '', '0', '96_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('97', '', '', 'wxq63942568', '2D886359465FD9FE5A9550DD644B0BB9B1EC8E7B', '', '/Uploads/image/logo.png', '', '幸会服务03', '', '', '', '', '0', '', '1', '2', '1524408243', '0', '127.0.0.1', '', '4i8ankvqBiI4qv3Ag+2A2WLgkQ3O+7PFPxqmhyeRWfi8iBJ1mu/03cJbcf/JEjikIEBkXnxKmOA=', '', '', '', '/Home/Index/usercode/id/97.html', '0', '', '0', '97_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('98', '', '', 'mn63942568', '948205A3B55BE0A4EFE5CE261AB25940AD936B4F', '', '/Uploads/image/logo.png', '', '幸会服务04', '', '', '', '', '0', '', '1', '2', '1524408243', '0', '127.0.0.1', '', 'GeXkUen7G+f+aZY1BSIqS2LgkQ3O+7PFPxqmhyeRWfi8iBJ1mu/03Ts8vMeDL4rhIlytf9mTvIk=', '', '', '', '/Home/Index/usercode/id/98.html', '0', '', '0', '98_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('99', '', '', 'zyl63942568', '385EC0FEA8990821699BC9F73B65DCFE0C3A8E08', '', '/Uploads/image/logo.png', '', '幸会服务05', '', '', '', '', '0', '', '1', '2', '1524408243', '0', '127.0.0.1', '', 'ZYeGINa8FWs/ZwzO+hWHKsliGEQzHZkcn1MyOsaOWemaim8xqHQqnsczdP4L1yIvbZCMdAmrSzHqTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/99.html', '0', '', '0', '99_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('100', '', '', 'dyx63942568', 'AF22F883124301A1004969A122DACA6821F4099F', '', '/Uploads/image/logo.png', '', '幸会服务06', '', '', '', '', '0', '', '1', '2', '1524408243', '0', '127.0.0.1', '', 'Oel0PD0ab+MPgP4nuNHb9GLgkQ3O+7PFPxqmhyeRWfi8iBJ1mu/03eGCIqqPs7pG4/NK+WgkFyk=', '', '', '', '/Home/Index/usercode/id/100.html', '0', '', '0', '100_xinghuiapp', '0', '', '', '0');
INSERT INTO `tzht_user` VALUES ('101', '', '', 'cj63942568', '23396741BB9CF246450457A6AD46B17863896E78', '', '/Uploads/image/logo.png', '', '幸会服务08', '', '', '', '', '0', '', '1', '2', '1524408243', '0', '127.0.0.1', '', 'teFiih+xScO8WL/ZW1nvu5IRREFK8oWTStcrEQuqMRp9jnt6tsNiR/9cvRvcqceYSHy8OvJFXdu86eYT6bdkcg==', '', '', '', '/Home/Index/usercode/id/101.html', '0', '', '0', '101_xinghuiapp', '1', '', '', '0');
INSERT INTO `tzht_user` VALUES ('102', '', '', 'lhl63942568', '8A779804A172F4E5899F0F7F90D58CCDE453C680', '', '/Uploads/image/logo.png', '', '幸会服务07', '', '', '', '', '0', '', '1', '2', '1524408243', '0', '127.0.0.1', '', '1Pyw2dsFfOJe8YvB1cdXNcliGEQzHZkcn1MyOsaOWemaim8xqHQqnolAFfLgYm8cuKWTJaUidO3qTcEoqtTn7A==', '', '', '', '/Home/Index/usercode/id/102.html', '0', '', '0', '102_xinghuiapp', '0', '', '', '0');

-- ----------------------------
-- Table structure for `tzht_user_account`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_user_account`;
CREATE TABLE `tzht_user_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `acc_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级账户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户表与二级账户中间表';

-- ----------------------------
-- Records of tzht_user_account
-- ----------------------------
INSERT INTO `tzht_user_account` VALUES ('2', '41', '41');
INSERT INTO `tzht_user_account` VALUES ('3', '45', '45');
INSERT INTO `tzht_user_account` VALUES ('5', '46', '46');
INSERT INTO `tzht_user_account` VALUES ('6', '47', '47');
INSERT INTO `tzht_user_account` VALUES ('7', '48', '48');
INSERT INTO `tzht_user_account` VALUES ('8', '0', '36');
INSERT INTO `tzht_user_account` VALUES ('9', '40', '77');
INSERT INTO `tzht_user_account` VALUES ('11', '60', '81');
INSERT INTO `tzht_user_account` VALUES ('13', '61', '82');
INSERT INTO `tzht_user_account` VALUES ('14', '83', '83');
INSERT INTO `tzht_user_account` VALUES ('15', '84', '84');
INSERT INTO `tzht_user_account` VALUES ('16', '85', '85');
INSERT INTO `tzht_user_account` VALUES ('17', '86', '86');
INSERT INTO `tzht_user_account` VALUES ('18', '87', '87');
INSERT INTO `tzht_user_account` VALUES ('19', '88', '88');
INSERT INTO `tzht_user_account` VALUES ('20', '89', '89');
INSERT INTO `tzht_user_account` VALUES ('21', '77', '90');
INSERT INTO `tzht_user_account` VALUES ('22', '44', '91');
INSERT INTO `tzht_user_account` VALUES ('23', '0', '92');

-- ----------------------------
-- Table structure for `tzht_user_part`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_user_part`;
CREATE TABLE `tzht_user_part` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `part_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '合作伙伴id',
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表和合作伙伴中间表';

-- ----------------------------
-- Records of tzht_user_part
-- ----------------------------
INSERT INTO `tzht_user_part` VALUES ('4', '1,1,2,2', '156');
INSERT INTO `tzht_user_part` VALUES ('34', '4', '157');
INSERT INTO `tzht_user_part` VALUES ('34', '8', '158');
INSERT INTO `tzht_user_part` VALUES ('34', '9', '159');
INSERT INTO `tzht_user_part` VALUES ('34', '8', '160');
INSERT INTO `tzht_user_part` VALUES ('4', '1,1,2,2', '10');

-- ----------------------------
-- Table structure for `tzht_user_partners`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_user_partners`;
CREATE TABLE `tzht_user_partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conf_id` int(11) NOT NULL COMMENT '会议id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `conf_user_id` int(11) NOT NULL COMMENT '发布者id',
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='合作伙伴表';

-- ----------------------------
-- Records of tzht_user_partners
-- ----------------------------
INSERT INTO `tzht_user_partners` VALUES ('1', '156', '34', '4', '1601796593@qq.com', '15652465039', '/./Uploads/Avatar/2018-02-07/5a7a9c6216a7e.jpeg', '北京中网深蓝技术有限公司', '', '', '1521424279', '1521424279', '', '', '2');
INSERT INTO `tzht_user_partners` VALUES ('2', '156', '0', '4', '', '13552832051', '/Uploads/userc/2018-04-09/5acad64cbcf47.jpg', '北京先行者科技有限公司', '北京北京市海淀区', '四季青', '1523242602', '1523242602', 'www.isu5.com', '北京先行者科技有限公司', '2');
INSERT INTO `tzht_user_partners` VALUES ('3', '0', '53', '62', '', '18618249918', '/./Uploads/Avatar/2018-02-09/5a7d72b806dab.jpeg', '北京水云舟文化创意有限公司', '', '', '1523338657', '1523338657', '', '', '2');
INSERT INTO `tzht_user_partners` VALUES ('4', '144', '62', '34', '', '18888888888', '/Uploads/image/logo.png', '中国会议服务咨询公司', '', '', '1523424184', '1523424184', '', '', '2');
INSERT INTO `tzht_user_partners` VALUES ('5', '0', '4', '62', '', '18911936236', '/./Uploads/Avatar/2018-01-17/5a5ec83f98c52.jpeg', '北京同舟鸿图文化创意有限公司', '', '', '1523517689', '1523517689', '', '', '2');
INSERT INTO `tzht_user_partners` VALUES ('6', '0', '34', '62', '1601796593@qq.com', '15652465039', '/./Uploads/Avatar/2018-02-07/5a7a9c6216a7e.jpeg', '北京中网深蓝技术有限公司', '', '', '1523517724', '1523517724', '', '', '2');
INSERT INTO `tzht_user_partners` VALUES ('7', '156', '62', '4', '', '18888888888', '/Uploads/image/logo.png', '中国会议服务咨询公司', '', '', '1523539727', '1523539727', '', '', '2');
INSERT INTO `tzht_user_partners` VALUES ('8', '144', '53', '34', '', '18618249918', '/./Uploads/Avatar/2018-02-09/5a7d72b806dab.jpeg', '北京水云舟文化创意有限公司', '', '', '1523585632', '1523585632', '', '', '2');
INSERT INTO `tzht_user_partners` VALUES ('9', '144', '4', '34', '', '18911936236', '/./Uploads/Avatar/2018-01-17/5a5ec83f98c52.jpeg', '北京同舟鸿图文化创意有限公司', '', '', '1523585642', '1523585642', '', '', '2');
