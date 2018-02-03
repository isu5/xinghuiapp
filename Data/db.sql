-----用户表
create table tzht_user(
id int unsigned primary key auto_increment,
email varchar(80) not null default '' comment '用户邮箱',
username varchar(100) not null default '' comment '用户名',
password char(40) not null default '' comment '用户密码',
telphone char(11) not null default '' comment '用户手机号',
logo varchar(100) not null default '' comment 'logo',
email_check_code char(40) not null default '' comment '用户邮箱验证',
email_check_time int unsigned not null default 0 comment '邮箱验证过期时间',
check_telphone char(6) not null default '' comment '用户手机验证',
type tinyint(4) unsigned not null default 1 comment "1表示个人，2表示企业",
status tinyint(4) unsigned not null default 0 comment "是否审核",
ctime int unsigned not null default 0 comment '创建时间',
utime int unsigned not null default 0 comment '更新时间',
login_ip char(15) not null default "127.0.0.1" comment '登录ip',
is_cert tinyint(1) not null default 0 comment '0未认证，1已认证',
is_attent tinyint(1) not null default 0 comment '0未关注，1已关注'
)engine=InnoDB charset=utf8 comment '用户基础表';

----用户信息资料表
create table tzht_user_info(
id int unsigned default '0' comment '关联用户基础表id',
position varchar(20) not null default '' comment '职位',
companyname varchar(100) not null default '' comment '公司名称',
address varchar(100) not null default '' comment '公司地址'
)engine=InnoDb charset=utf8 comment '企业用户信息表';


---会议表
create table tzht_conference(
id  int unsigned primary key auto_increment,
title varchar(150) not null default '' comment '会议标题',
ctime datetime not null default 0 comment '开始时间',
etime datetime not null default 0 comment '结束时间',
qtime datetime not null default 0 comment '签到时间',
address varchar(50) not null default '' comment '举办地址',
xxaddress varchar(50) not null default '' comment '详细地址',
companyname varchar(50) not null default '' comment '公司名称',
pic varchar(100) not null default '' comment '公司宣传图片',
contact varchar(20) not null default '' comment '联系人',
telphone varchar(20)not null default '' comment '联系电话',
position varchar(20) not null default '' comment '职位',
downfile varchar(100) not null default '' comment '资料附件',
is_down tinyint(1) not null default 0 comment '0表示不允许下载，1表示可以下载',
uid int unsigned not null default 0 comment '会员id',
cid int unsigned not null default 0 comment '栏目id',
UNIQUE key companyname (companyname)
)engine=InnoDb charset=utf8 comment '会议表';

create table tzht_conference_cate(
id int unsigned primary key auto_increment,
pid int unsigned not null default 0 comment '父级id',
catename varchar(10) not null default '' comment '栏目名称',
sort int not null default 0 comment '排序'
)engine=InnoDb charset=utf8 comment '会议栏目表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






create table tzht_app_show (
id int unsigned primary key auto_increment comment 'id',
app_version varchar(80) not null default '' comment 'app版本',
telphone varchar(20) not null default '' comment '平台客服电话',
url varchar(100) not null default '' comment '官网',
company varchar(100) not null default '' comment '公司名称',
address varchar(100) not null default '' comment '公司地址',
addtime int unsigned not null default 0 comment '添加时间'
)engine=InnoDb charset=utf8 comment '关于APP';

-----引导页
create table tzht_app_top(
id int unsigned primary key auto_increment comment 'id',
app_url varchar(100) not null default '' comment '链接',
app_pic varchar(100) not null default '' comment '引导页图片'
)engine=InnoDb charset=utf8 comment '引导页';

----用户指南
create table tzht_guide(
id int unsigned primary key auto_increment comment 'id',
guide_title varchar(100) not null default '' comment '引导页图片',
guide_content text comment ''
)engine=InnoDb charset=utf8 comment '引导页';

----通讯录群组公告
CREATE TABLE `tzht_chatguroupbull` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '群组公告id',
  `chat_id` int unsigned not null comment '群组id',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '群组标题',
  content text comment '',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '企业公告添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='群组公告表';


-----合作伙伴
CREATE TABLE `tzht_user_partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conf_user_id` int unsigned not null default '0' comment '发布者id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合作伙伴表';


-----平台消息删除中间表
create table tzht_del_jgpush(
id int(11) unsigned not null primary key auto_increment,
user_id int unsigned not null default 0 comment '用户id',
jp_id int unsigned not null default 0 comment '平台消息id',
deltime int unsigned not null default 0 comment '删除时间'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台消息删除中间表';

-----我的会议删除中间表
create table tzht_conference_del(
id int(11) unsigned not null primary key auto_increment,
user_id int unsigned not null default 0 comment '用户id',
conf_id int unsigned not null default 0 comment '会议id',
deltime int unsigned not null default 0 comment '删除时间'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的会议删除中间表';








