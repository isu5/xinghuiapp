/*
Navicat MySQL Data Transfer

Source Server         : im
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : xhylnmp

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-09-01 10:10:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tzht_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_admin`;
CREATE TABLE `tzht_admin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(40) NOT NULL COMMENT '密码',
  `email` varchar(80) NOT NULL DEFAULT '' COMMENT '邮箱',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `last_login_ip` varchar(15) DEFAULT '',
  `last_login_time` int(11) DEFAULT '0',
  `login_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tzht_admin
-- ----------------------------
INSERT INTO `tzht_admin` VALUES ('1', 'admin123', '1eea36fbd4f4919251e3192dce2da380', '', '', '1', '123.114.104.176', '1504151133', '128');
INSERT INTO `tzht_admin` VALUES ('2', 'ylnmp123', '8edae303e1cf6bdacef40e84a36ed7ce', 'zhangsan@qq.com', '', '1', '0.0.0.0', '1482720707', '8');
INSERT INTO `tzht_admin` VALUES ('14', 'admin22', '25f9e794323b453885f5181f1b624d0b', 'admin22@qq.com', '', '1', '111.199.25.75', '1502350333', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of tzht_advert
-- ----------------------------
INSERT INTO `tzht_advert` VALUES ('1', '123', 'https://www.jd.com', '/./Uploads/2017/08/24/599ea6ad0661b.png', '1503541073', '50', '55', '1');
INSERT INTO `tzht_advert` VALUES ('2', '123', 'https://www.jd.com', '/./Uploads/2017/08/24/599ea6c0436ab.png', '1503541073', '50', '55', '1');
INSERT INTO `tzht_advert` VALUES ('3', '123', 'https://www.jd.com', '/./Uploads/2017/08/24/599ea6d1c14d4.png', '1503541073', '50', '55', '1');

-- ----------------------------
-- Table structure for `tzht_app_top`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_app_top`;
CREATE TABLE `tzht_app_top` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `app_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '引导页图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='引导页';

-- ----------------------------
-- Records of tzht_app_top
-- ----------------------------
INSERT INTO `tzht_app_top` VALUES ('1', 'http://www.baidu.com', '/./Uploads/2017/08/24/599ea3463f9a2.jpg');
INSERT INTO `tzht_app_top` VALUES ('2', 'http://www.baidu.com', '/./Uploads/2017/08/24/599ea354dfd1c.jpg');
INSERT INTO `tzht_app_top` VALUES ('3', 'http://www.baidu.com', '/./Uploads/2017/08/24/599ea3a3c8ee6.jpg');

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
INSERT INTO `tzht_bulletin` VALUES ('1', '中国互联网协会城市级移动物联网平台特斯联实验室揭牌仪式在京举行', ' 中国互联网协会城市级移动物联网平台特斯联实验室将在模式创新、资源整合、数据共享等方面进行深入探索和实践，开展试点示范工作，打造智慧城市+移动物联网的创新模式，力争将产业互联网细分领域与物联网的跨界融合推广应用到智慧城市多维场景。\r\n\r\n中国互联网协会一直致力于服务行业发展，积极与各相关企业和单位建立良好合作关系，围绕重点领域卓有成效地开展合作，努力把协会的政策、资源、平台优势同企业的技术优势紧密结合', '1503630840', '幸会', '50', '1');
INSERT INTO `tzht_bulletin` VALUES ('2', '2017云南省互联网大会备受瞩目高精尖科技企业踊跃参展', '本届大会启用场地总面积达6210㎡，首期开放36个精品展位招募合作伙伴，目前包括电信、移动、联通三大运营商及微想智森科技、九机网、神马搜索、云南天成科技、花易宝、摩拜等在内的众多互联网企业，以及国融智创人工智能产业园、中关村·电子城（昆明）科技产业园等已确定或已达成参会参展意向。', '1503630881', '幸会', '50', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='个人认证表';

-- ----------------------------
-- Records of tzht_certify
-- ----------------------------
INSERT INTO `tzht_certify` VALUES ('2', '2', '', '', '', '', '北京水云舟文化创意有限公司', '91110107327298064H', '/./Uploads/Certificate/2017-08-25/599fcfc60a324.jpg', '1503645638', '2', '2');
INSERT INTO `tzht_certify` VALUES ('3', '4', '', '', '', '', '北京联达动力信息科技股份有限公司', '91110108723957498N', '/./Uploads/Certificate/2017-08-25/599fd2c68814d.jpg', '1503646406', '2', '2');
INSERT INTO `tzht_certify` VALUES ('4', '1', '', '', '', '', '北京同舟鸿图文化创意有限公司', '927656857544596555', '/./Uploads/Certificate/2017-08-29/59a4dc4dac9e3.jpg', '1503976525', '2', '2');
INSERT INTO `tzht_certify` VALUES ('5', '3', '', '', '', '', '新公司的名称', '11111111111', '/./Uploads/Certificate/2017-08-29/59a546ffd4b46.jpg', '1504003839', '2', '3');
INSERT INTO `tzht_certify` VALUES ('6', '5', '', '', '', '', '踢了我啧啧啧', '183868258508220405', '/./Uploads/Certificate/2017-08-31/59a7dad227241.jpg', '1504172754', '2', '3');

-- ----------------------------
-- Table structure for `tzht_company_bull`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_company_bull`;
CREATE TABLE `tzht_company_bull` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '企业公告标题',
  `bullurl` varchar(100) NOT NULL DEFAULT '' COMMENT '企业公告url',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '企业公告添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='企业公告表';

-- ----------------------------
-- Records of tzht_company_bull
-- ----------------------------
INSERT INTO `tzht_company_bull` VALUES ('1', '4', '20170831', '', '1504146827');

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
  `downfile` varchar(150) NOT NULL DEFAULT '' COMMENT '资料附件',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '栏目id',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `scale` int(11) NOT NULL DEFAULT '0' COMMENT '会议规模',
  `is_user` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要审核参会人员，1为需要，2不需要',
  `statuses` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会议状态1开始，2结束',
  `brief` text COMMENT '会议简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会议表';

-- ----------------------------
-- Records of tzht_conference
-- ----------------------------
INSERT INTO `tzht_conference` VALUES ('2', '2017(第三届)中国智能终端技术大会暨第二届中国智能硬件开发者大会', '2017-08-29 08:30:00', '2017-09-01 18:30:00', '2017-08-29 07:00:00', '北京北京市海淀区', '首体南路6号北京新世纪日航饭店  ', '[\"\\/Uploads\\/image\\/2017-08-25\\/599fd0b119748.jpg\"]', '北京同舟鸿图文化创意有限公司', '李四', '13717001500', '[\"\\/Uploads\\/file\\/2017-08-25\\/599fd0bcb9ac2.xlsx\"]', '1', '2', '1503645971', '500', '1', '0', '2017(第三届)中国智能终端技术大会暨第二届中国智能硬件开发者大会');
INSERT INTO `tzht_conference` VALUES ('3', '2017万物智联高峰论坛', '2017-08-30 08:00:00', '2017-09-04 18:00:00', '2017-08-30 07:00:00', '北京北京市丰台区', '莲花池南路1号院1号楼 ，近西客站南广场', '[\"\\/Uploads\\/image\\/2017-08-25\\/599fd456c14d4.jpg\"]', '北京联达动力信息科技股份有限公司', '王五', '13718601024', '[\"\\/Uploads\\/file\\/2017-08-25\\/599fd47319748.doc\",\"\\/Uploads\\/file\\/2017-08-25\\/599fd4734edc6.xls\"]', '4', '3', '1503646875', '800', '0', '0', '万物智能浪潮席卷全球，驱动着社会变革，创造着历史。\r\n\r\n\r\n以万物智联为核心的“新一代技术革命”正在掀起，成为人类社会继蒸汽技术、电力技术、信息技术三次工业革命之后,以万物智联为代表的第四次工业革命，万物智联开启了全球又一次全新变革与发展的开端，这是任何创业者和产业从业者都不容错失的历史机遇。那么，我们应该怎么抓住这个机会呢？\r\n\r\n全国移动互联创新大赛（第三届）是工信部为推动大众创业，万众创新、推动移动互联产业创新发展倾力打造的全国范围的创新创业活动。\r\n\r\n\r\n2015、2016全国移动互联创新大赛已经成功举办二届，并获得广泛赞誉。不仅有很多项目获得资本方青睐，有创业企业在孵化基地落地，更促进了大赛高校选手与社会选手的交流……。全国移动互联创新大赛突显了校企合作、产业对接、互相交流的优势，更加注重大赛成果的落地和转化。\r\n\r\n智能科技的发展带来巨大机遇，大赛搭建了科技创新、投融资对接、企业孵化及后期产业化的桥梁，如何引导企业找准未来发展的方向，使企业获得长远发展，引导创业者顺应科技的发展，抓准商机，利用大赛搭建的平台走向成功，是本次活动的主要目的。');
INSERT INTO `tzht_conference` VALUES ('5', '也走', '2017-08-31 13:53:00', '2017-08-31 13:53:00', '2017-08-31 13:53:00', '北京市-北京市-朝阳区', '有啊', '', '北京水云舟文化创意有限公司', '他特么爷爷额', '18810356953998383', '\"\"', '2', '6', '1504158930', '2590', '0', '0', '他咯我啧啧啧啧啧啧我也哟哟哟啧啧啧哦哟哟哟哟哟有哦哟哟www夸他我我也way嘟嘟嘟啊');

-- ----------------------------
-- Table structure for `tzht_conference_audit`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_audit`;
CREATE TABLE `tzht_conference_audit` (
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核标识，1为通过，2为不通过，3为审核中'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审核表';

-- ----------------------------
-- Records of tzht_conference_audit
-- ----------------------------
INSERT INTO `tzht_conference_audit` VALUES ('2', '3', '3');
INSERT INTO `tzht_conference_audit` VALUES ('3', '8', '3');
INSERT INTO `tzht_conference_audit` VALUES ('2', '8', '3');

-- ----------------------------
-- Table structure for `tzht_conference_auditlist`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_auditlist`;
CREATE TABLE `tzht_conference_auditlist` (
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核标识，3待审核，2待参加，3已结束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待参加待审核表';

-- ----------------------------
-- Records of tzht_conference_auditlist
-- ----------------------------
INSERT INTO `tzht_conference_auditlist` VALUES ('2', '3', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('3', '8', '3');
INSERT INTO `tzht_conference_auditlist` VALUES ('2', '8', '3');

-- ----------------------------
-- Table structure for `tzht_conference_bull`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_conference_bull`;
CREATE TABLE `tzht_conference_bull` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `conf_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会议id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '公告标题',
  `bullurl` varchar(100) NOT NULL DEFAULT '' COMMENT '公告url',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公告添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会议公告表';

-- ----------------------------
-- Records of tzht_conference_bull
-- ----------------------------
INSERT INTO `tzht_conference_bull` VALUES ('1', '3', '4', '2017万物智联高峰论坛在京召开', '', '1504002509');

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
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,没有更新信息；1,企业用户信息更新'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 关注表（企业通讯录）';

-- ----------------------------
-- Records of tzht_conference_focus
-- ----------------------------
INSERT INTO `tzht_conference_focus` VALUES ('3', '4', '0');
INSERT INTO `tzht_conference_focus` VALUES ('1', '4', '0');
INSERT INTO `tzht_conference_focus` VALUES ('4', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('3', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('1', '3', '0');
INSERT INTO `tzht_conference_focus` VALUES ('8', '4', '0');
INSERT INTO `tzht_conference_focus` VALUES ('8', '1', '0');
INSERT INTO `tzht_conference_focus` VALUES ('2', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会议详情图片表';

-- ----------------------------
-- Records of tzht_conference_pic
-- ----------------------------
INSERT INTO `tzht_conference_pic` VALUES ('1', '4', '3', '2017万物智联高峰论坛', 'http://www.lkpower.com', '[\"\\/Uploads\\/conference\\/2017-08-29\\/59a5423f6db53.jpg\"]', '1504002625');
INSERT INTO `tzht_conference_pic` VALUES ('2', '4', '3', '2017万物智联高峰论坛', 'http://www.lkpower.com', '[\"\\/Uploads\\/conference\\/2017-08-29\\/59a542af347cc.png\"]', '1504002736');
INSERT INTO `tzht_conference_pic` VALUES ('3', '4', '3', '2017万物智联高峰论坛', 'http://www.lkpower.com', '[\"\\/Uploads\\/conference\\/2017-08-29\\/59a542fc1227b.png\"]', '1504002812');
INSERT INTO `tzht_conference_pic` VALUES ('4', '1', '2', '2017(第三届)中国智能终端技术大会暨第二届中国智能硬件开发者大会', 'http://www.tzht.net.cn', '[\"\\/Uploads\\/conference\\/2017-08-29\\/59a544d162438.jpg\"]', '1504003282');
INSERT INTO `tzht_conference_pic` VALUES ('5', '1', '2', '2017中国科技成果转化与产业创新高峰论坛', 'http://www.tzht.net.cn', '[\"\\/Uploads\\/conference\\/2017-08-29\\/59a54587384d5.png\"]', '1504003464');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='极光推送消息表';

-- ----------------------------
-- Records of tzht_jgpush
-- ----------------------------
INSERT INTO `tzht_jgpush` VALUES ('1', '今年世界互联网大会将在乌镇召开', '今年世界互联网大会将在乌镇召开', '1', '1503553005');
INSERT INTO `tzht_jgpush` VALUES ('2', '绿野仙踪', '绿野仙踪绿野仙踪绿野仙踪绿野仙踪绿野仙踪绿野仙踪', '1', '1503912495');

-- ----------------------------
-- Table structure for `tzht_jgpushperson`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_jgpushperson`;
CREATE TABLE `tzht_jgpushperson` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '推送标题',
  `content` text COMMENT '推送内容',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推送标识',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='极光推送个人消息表';

-- ----------------------------
-- Records of tzht_jgpushperson
-- ----------------------------
INSERT INTO `tzht_jgpushperson` VALUES ('1', '4', '2017中国科技成果转化与产业创新高峰论坛', '2017中国科技成果转化与产业创新高峰论坛', '0', '1503975521');
INSERT INTO `tzht_jgpushperson` VALUES ('2', '1', '2017中国国际能源峰会', '2017中国国际能源峰会222', '0', '1503975549');
INSERT INTO `tzht_jgpushperson` VALUES ('3', '3', '刘为国您好！2017中国科技成果转化与产业创新高峰论坛', '2017中国科技成果转化与产业创新高峰论坛', '0', '1503976249');
INSERT INTO `tzht_jgpushperson` VALUES ('4', '3', '今年世界互联网大会将在乌镇召开', '今年世界互联网大会将在乌镇召开', '0', '1503976367');

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
INSERT INTO `tzht_message` VALUES ('3', '1', 'fifycyct', '1503629135');
INSERT INTO `tzht_message` VALUES ('4', '1', '8月24日，由全国工商联主办，工信部、国家工商总局支持的2017中国民营企业500强发布会在济南召开。在2017民营企业500强榜单中，华为投资控股有限公司、苏宁控股集团、山东魏桥创业集团有限公司位列2017中国民营企业500强前三名。在同时公布的2017中国民营企业服务业100强名单中，苏宁则位列第一。上个月，苏宁控股集团旗下苏宁云商更是首次跻身《财富》的全球财富500强榜单。\r\n\r\n“百强榜单”以企业年度销售总额(营业收入)为主要依据，参考企业净资产、纳税额、净利润等指标。今年，中国民营企业500强入围门槛已经达到120.52亿元，比去年的101.75亿元增加18.77亿元，头次突破120亿。\r\n\r\n据了解，在过去的一年，民企跨入世界500强行列的步伐进一步加快，民企500强中有16家入围世界500强榜单，比上年增加4家。民企500强入围门槛大幅提升，过去的一年，民营企业500强入围门槛为120.52亿元，较上年增加了18.77亿元;超大型企业快速增长，过去的一年，有6家民企收入突破3000亿元大关，形成第一方阵。\r\n', '1503629854');
INSERT INTO `tzht_message` VALUES ('5', '1', ' 铁路局具体痛苦不啊TCL他他他他他他调监控铁路局拒绝8月24日，由全国工商联主办，工信部、国家工商总局支持的2017中国民营企业500强发布会在济南召开。在2017民营企业500强榜单中，华为投资控股有限公司、苏宁控股集团、山东魏桥创业集团有限公司位列2017中国民营企业500强前三名。在同时公布的2017中国民营企业服务业1则位列第一。上个月，苏宁控股集团旗下苏宁云商更是首次跻身《财富》的全球财富500强榜单。\r\n\r\n“百强榜单”以企业年度销售总额(营业收入)为主要依据，参考企业净资产、纳税额、净利润等指标。今年，中国民营企业500强入围门槛已经达到120.52亿元，比去年的101.75亿元增加18.77亿元，头次突破120亿。\r\n\r\n据了解，在过去的一年，民企跨入世界500强行列的步伐进一步加快，民企500强中有16家入围世界500强榜单，比上年增加4家。民企500强入围门槛大幅提升，过去的一年，民营企业500强入围门槛为120.52亿元，较上年增加了18.77亿元;超大型企业快速增长，过去的一年，有6家民企收入突破3000亿元大关，形成第一方阵。\r\n', '1503631836');
INSERT INTO `tzht_message` VALUES ('6', '11', '月嘟嘟特屠夫嘟嘟嘟父母嘟嘟嘟读的特夸偷渡多不投错他拖拉不错不塌偷塔邋遢Paul他啦TAT图KTV俘虏不哭了特可他TCL不科技糖囖倔驴不图不看DL特快看特警泰他团图阿土来他就拉拉兔TAT哦哟巨幕嘟嘟他他他(´ε｀ )♡(,,•́ . •̀,,)', '1503638366');
INSERT INTO `tzht_message` VALUES ('7', '3', '幸会APP问题・_・', '1503975801');
INSERT INTO `tzht_message` VALUES ('8', '1', '图库他', '1504171017');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='权限表';

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
INSERT INTO `tzht_privilege` VALUES ('17', '平台公告管理', '', '0', 'icon-tasks', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('18', '公告列表', 'Bulletin/index', '17', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('19', '平台广告管理', '', '0', ' icon-screenshot', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('20', '广告列表', 'Advert/index', '19', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('21', '添加公告', 'Bulletin/add', '18', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('22', '编辑公告', 'Bulletin/edit', '18', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('23', '删除公告', 'Bulletin/delete', '18', '', '0', '0');
INSERT INTO `tzht_privilege` VALUES ('24', '用户管理', '', '0', 'icon-group', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('25', '用户列表', 'User/index', '24', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('26', '会议管理', '', '0', 'icon-suitcase', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('27', '会议列表', 'Conference/index', '26', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('28', '认证管理', '', '0', 'icon-suitcase', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('29', '个人认证列表', 'Certify/person', '28', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('30', '企业认证', 'Certify/index', '28', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('32', '认证审核', 'Certify/audit', '28', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('33', '会议栏目', 'Conference/cate', '26', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('34', 'APP管理', '', '0', ' icon-github-alt', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('35', 'app引导页', 'App/index', '34', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('36', '推送列表', 'Jgpush/index', '34', '', '1', '0');
INSERT INTO `tzht_privilege` VALUES ('37', '留言管理', 'Message/index', '34', '', '1', '0');

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
INSERT INTO `tzht_pri_role` VALUES ('17', '4');
INSERT INTO `tzht_pri_role` VALUES ('18', '4');
INSERT INTO `tzht_pri_role` VALUES ('19', '4');
INSERT INTO `tzht_pri_role` VALUES ('20', '4');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业产品表';

-- ----------------------------
-- Records of tzht_product
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tzht_role
-- ----------------------------
INSERT INTO `tzht_role` VALUES ('1', '超级管理员', '拥有至高无上的权力', '1');
INSERT INTO `tzht_role` VALUES ('2', '审计管理员', '审计管理', '1');
INSERT INTO `tzht_role` VALUES ('3', '日志管理员', '日志管理', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='融云讨论组表';

-- ----------------------------
-- Records of tzht_rongcloudim
-- ----------------------------
INSERT INTO `tzht_rongcloudim` VALUES ('1', '2017万物智联高峰论坛讨论组', 'db83f62c-e43c-443d-b5d2-0a447318f0c5', '1504085087');
INSERT INTO `tzht_rongcloudim` VALUES ('2', '2017(第三届)中国智能终端技术大会暨第二届中国智能硬件开发者大会讨论组', 'bfee2ecc-fc57-4d19-96f5-f2a68da0606c', '1504144424');
INSERT INTO `tzht_rongcloudim` VALUES ('3', '也走讨论组', '2b35c0dc-b732-4a33-a0ab-b8ae5b414f99', '1504172657');

-- ----------------------------
-- Table structure for `tzht_system`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_system`;
CREATE TABLE `tzht_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项键名',
  `value` text COMMENT '配置项键值 1表示开启 0 关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tzht_system
-- ----------------------------
INSERT INTO `tzht_system` VALUES ('1', 'WEB_NAME', '幸会');
INSERT INTO `tzht_system` VALUES ('2', 'WEB_KEYWORDS', '幸会');
INSERT INTO `tzht_system` VALUES ('3', 'WEB_DESCRIPTION', '幸会');
INSERT INTO `tzht_system` VALUES ('4', 'WEB_URL', 'http://xh.ylnmp.com');
INSERT INTO `tzht_system` VALUES ('5', 'WEB_STATUS', '1');
INSERT INTO `tzht_system` VALUES ('6', 'WEB_CLOSE_WORD', '网站维护中，请稍后访问！');
INSERT INTO `tzht_system` VALUES ('7', 'COPYRIGHT_WORD', '©2016 幸会');
INSERT INTO `tzht_system` VALUES ('8', 'WEB_ICP_NUMBER', '京ICP备1308093');
INSERT INTO `tzht_system` VALUES ('9', 'WEB_STATISTICS', '');
INSERT INTO `tzht_system` VALUES ('10', 'EMAIL_SMTP', 'smtp.163.com');
INSERT INTO `tzht_system` VALUES ('11', 'EMAIL_USERNAME', 'lovesherry55@163.com');
INSERT INTO `tzht_system` VALUES ('12', 'EMAIL_PASSWORD', '573301558wo.');
INSERT INTO `tzht_system` VALUES ('13', 'EMAIL_FROM_NAME', '同舟鸿图-幸会');
INSERT INTO `tzht_system` VALUES ('14', 'COMMENT_REVIEW', '0');
INSERT INTO `tzht_system` VALUES ('15', 'COMMENT_SEND_EMAIL', '0');
INSERT INTO `tzht_system` VALUES ('16', 'EMAIL_RECEIVE', '');
INSERT INTO `tzht_system` VALUES ('17', 'APP_VERSION', '1.0');
INSERT INTO `tzht_system` VALUES ('18', 'APP_PHONE', '010-63942568');
INSERT INTO `tzht_system` VALUES ('19', 'APP_URL', 'http://www.baidu.com');
INSERT INTO `tzht_system` VALUES ('20', 'APP_COMPANY', '北京同舟鸿图文化创意有限公司');
INSERT INTO `tzht_system` VALUES ('21', 'APP_ADDRESS', '北京市石景山区体育场南路2号景阳宏昌大厦');
INSERT INTO `tzht_system` VALUES ('22', 'APP_INFO', '幸会APP，您身边的专用会议APP！');

-- ----------------------------
-- Table structure for `tzht_user`
-- ----------------------------
DROP TABLE IF EXISTS `tzht_user`;
CREATE TABLE `tzht_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(80) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(60) NOT NULL DEFAULT '' COMMENT '用户密码',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `logo` varchar(100) NOT NULL DEFAULT '/Uploads/image/logo.png',
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
  `level` tinyint(1) NOT NULL COMMENT '等级区分',
  `jpush` varchar(255) NOT NULL COMMENT '极光推送别名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户基础表';

-- ----------------------------
-- Records of tzht_user
-- ----------------------------
INSERT INTO `tzht_user` VALUES ('1', '1601796593@qq.com', '启明', 'F7C3BC1D808E04732ADF679965CCC34CA7AE3441', '13717001500', '/./Uploads/Avatar/2017-08-28/59a374aa9ea9c.jpg', '北京同舟鸿图文化创意有限公司', '', '北京市北京市石景山区', '体育场南路2号景阳宏昌大厦309', '', '1503644665', '', '1', '1', '1503644665', '0', '127.0.0.1', '', '6/UmtW4xnXrcJWnaECRiqpIRREFK8oWTStcrEQuqMRoRAa4c5DtZrIL22TwV2CErsiHMLf/X/IJGZXlsl2ZFEg==', 'http://www.tzht.net.cn', ' 北京同舟鸿图文化创意有限公司成立于2011年，公司以“真诚、热情、专业、细致”为服务理念，立足于“精品、专业、创新”的发展战略，秉承“同舟共济大展鸿图”的精神与客户以及公 司团队成员风雨同舟，齐心协力，实现共同发展！ 　　\r\n\r\n           公司目前有设计部、软件开发部、排版部三个主要部门，平面设计主要从事大型企事业单位的VI、宣传册、宣传页、展板、期刊、报纸等平面媒体的创意设计，为客户提供设计、排版、印刷等一系列服务。 　　软件开发主要从事为大型企业、政府事业单位、各大院校提供软件开发,手机app服务。设计秉承“自然为主、兼顾人文”，使客户能够享受到真正大自然的生机与活力。 网络定制应用，为客户提供移动应用，推广宣传企业品牌，并为企业定制移动APP应用，便于企业文化建设，树立品牌形象。 我们是一个充满生机与智慧的年轻团队，我们拥有梦想，充满激情，期待和您的合作。', '', '', '0', '0', '1_xinghuiapp');
INSERT INTO `tzht_user` VALUES ('2', '942546059@qq.com', '942546059', 'F7C3BC1D808E04732ADF679965CCC34CA7AE3441', '010-9989483', '', '北京水云舟文化创意有限公司', '', '北京市北京市石景山区', '', '', '1503645402', '', '1', '1', '1503645402', '0', '127.0.0.1', '', '0eEakT4sMCmRPJQXQcFObMliGEQzHZkcn1MyOsaOWekl1YViu2g7J+YH9rhr/eO45QGf5PVOfjfqTcEoqtTn7A==', '', '', '', '', '0', '0', '2_xinghuiapp');
INSERT INTO `tzht_user` VALUES ('3', '', '昵称123', 'B5047B40A53211739B4011D0A1C372A880B1EAA3', '18911936236', '/./Uploads/Avatar/2017-08-25/599fe53a473b4.jpg', 'lwg', '', '北京市北京市朝阳区', '', '', '0', '', '1', '1', '1503646004', '0', '125.33.90.50', '', '9zj3zZd5+Qc4qv3Ag+2A2WLgkQ3O+7PFPxqmhyeRWfgAeTvkx8lASdV4W9lEbjhlecztLs+3t70=', '', '', '', '', '0', '0', '3_xinghuiapp');
INSERT INTO `tzht_user` VALUES ('4', 'web@isu5.cn', 'web', 'F7C3BC1D808E04732ADF679965CCC34CA7AE3441', '13718601024', '/./Uploads/Avatar/2017-08-25/599fe4df2115a.jpg', '北京联达动力信息科技股份有限公司', '', '北京市北京市海淀区', '海淀大街甲38号银科大厦2206-08室', '', '1503646194', '', '1', '1', '1503646194', '0', '127.0.0.1', '', 'hACJKNv3LAwQhJJzCsyzqsliGEQzHZkcn1MyOsaOWekl1YViu2g7JxSvIEPl7cPmOSoEL8PvldnqTcEoqtTn7A==', 'http://www.lkpower.com', '北京联达动力信息科技股份有限公司于2015年成功上市（证券代码：833449），成为中国第一家专注于提供医院综合运营管理软件系统及服务的上市企业。\r\n\r\n\r\n作为国内“专业”的医院综合运营管理整体解决方案服务商，联达动力对医院综合运营管理的应用需求及特点拥有深厚的理解和专业见解。凭借多年为医院行业服务的经验，通过对众多医院卫生机构的走访调研和深度合作，根据国内医院管理领域资深专家顾问团的专业指导，联达动力完成了《联达动力医院综合运营管理整体解决方案》的设计和“联达动力医院综合运营管理平台”的研发。', '', '', '0', '0', '4_xinghuiapp');
INSERT INTO `tzht_user` VALUES ('5', '', '', 'F865B53623B121FD34EE5426C792E5C33AF8C227', '18810356955', '', '', '', '', '', '', '0', '', '1', '1', '1503896783', '0', '123.57.16.126', '', 'WT80Y3EtConuTmneXjk3SJIRREFK8oWTStcrEQuqMRoRAa4c5DtZrKpPXlPv45t1TXqir5I3Cp5GZXlsl2ZFEg==', '', '', '', '', '0', '0', '5_xinghuiapp');
INSERT INTO `tzht_user` VALUES ('7', '', 'xinghuiapp', '89CB92573F888D63CBED0FFB13358AE41C5E9352', '', '', '', '', '', '', '', '0', '', '1', '1', '1504004452', '0', '127.0.0.1', '', 'Jx+l/o2fVsc4qv3Ag+2A2WLgkQ3O+7PFPxqmhyeRWfgelpOr881e2BTFJFU/HFSdIbNN+aNDPxg=', '', '', '', '', '1', '2', '7_xinghuiapp');
INSERT INTO `tzht_user` VALUES ('8', '', '', 'EFBFDBF3B9E7E4B3912ABC79A7692436AD22DBB2', '18601159800', '', '', '', '北京市北京市朝阳区', '', '', '0', '', '1', '1', '1504059455', '0', '1.203.183.112', '', 'CFYLH5BEmTYF8k7Xi3WKf8liGEQzHZkcn1MyOsaOWenh883K+a0KiD2GpGu/tyHrek7+a+9beV3qTcEoqtTn7A==', '', '', '', '', '0', '0', '8_xinghuiapp');
