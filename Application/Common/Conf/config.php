<?php
return array(
	//'配置项'=>'配置值'
	//'SHOW_PAGE_TRACE' 		=> true,
	'TMPL_PARSE_STRING'   		=> 		array(   					// 定义常用路径
		//huicss
		'__ADMIN_LIB__'      	=> 	__ROOT__. '/Public/Admin/lib',
		'__ADMIN_STATIC__'      => 	__ROOT__. '/Public/Admin/static',
		
		//其他css
		'__ADMIN_CSS__'      	=> 	__ROOT__. '/Public/Admin/css',
		'__ADMIN_FONTS__'       => 	__ROOT__. '/Public/Admin/font',
        '__ADMIN_JS__'      	=>	__ROOT__.'/Public/Admin/js',
        '__ADMIN_IMG__'     	=> 	__ROOT__.'/Public/Admin/images',
        '__HOME_CSS__'			=>  __ROOT__.'/Public/Home/css',
        '__HOME_JS__'			=>  __ROOT__.'/Public/Home/js',
        '__HOME_IMG__'			=>  __ROOT__.'/Public/Home/images',
        '__HOME_PLUG__'			=>  __ROOT__.'/Public/Home/plugins',
		
		'__HOME_FONTS__'        => 	__ROOT__. '/Public/Home/fonts',
		'__COMMON_JS__'			=>  __ROOT__.'/Public/Common', 		//公共js
		'__UP__'				=>  __ROOT__.'/Public/uploadify',   //上传插件uploadify
		'__STATICS__'			=>  __ROOT__.'/Public/statics',   //
		'__ZUI__'				=>  __ROOT__.'/Public/Home/zui',   //zui前端框架库
		'__HOMEAPP__'			=>  __ROOT__.'/Public/Home/homeapp',   //zui前端框架库
		
		
		
		'__XHAPP__'				=>  __ROOT__.'/Public/Home/xhapp',   //xhapp前台页面
		'__HDJS__'				=>  __ROOT__.'/Public/Home/hdjs_modules',   //hdjs
		'__PLUPLOAD__'				=>  __ROOT__.'/Public/plupload',   //上传插件plupload
		
	
	),
	
	'TAGLIB_BUILD_IN'        => 'Cx,Common\Tag\My',              // 加载自定义标签
	//允许访问的模块
	'MODULE_ALLOW_LIST'=>array('Admin','Home','Api','App'),
	//默认
	'DEFAULT_MODULE'=>'Home',
	
	 /************ 图片相关的配置 ***************/
    'UPLOAD_CONFIG' => array(
    	'maxSize' => 12582912,
    	'exts' => array('jpg', 'gif', 'png', 'jpeg'),
    	'rootPath' => './Uploads/',  // 上传图片的保存路径  -> PHP要使用的路径，硬盘上的路径
    	'savePath' => '/Uploads/',   // 显示图片时的路径    -> 浏览器用的路径，相对网站根目录
    ),
	//***********************************其他设置**********************************
    'RONG_IS_DEV'            => true,//是否是在开发中
    'RONG_DEV_APP_KEY'       => '82hegw5u83l8x', //融云开发环境下的key       仅供测试使用
    'RONG_DEV_APP_SECRET'    => '3NHUMv9zRPrdA5', //融云开发环境下的SECRET     仅供测试使用
    'RONG_PRO_APP_KEY'       => 'e0x9wycfehqeq', //融云生产环境下的key
    'RONG_PRO_APP_SECRET'    => 'hUwjXsBLM0', //融云生产环境下的SECRET
	
    'GEETEST_ID'             => '034b9cc862456adf05398821cefc94eb',//极验id  仅供测试使用
    'GEETEST_KEY'            => 'b7f064b9ae813699de794303f0b0e76f',//极验key 仅供测试使用
    'UMENG_IOS_APP_KEY'      => '', //友盟ios AppKey
    'UMENG_IOS_SECRET'       => '', //友盟ios App Master Secret
    'UMENG_ANDROID_APP_KEY'  => '', //友盟android AppKey
    'UMENG_ANDROID_SECRET'   => '', //友盟android App Master Secret
    'RONGLIAN_ACCOUNT_SID'   => '', //容联云通讯 主账号 accountSid
    'RONGLIAN_ACCOUNT_TOKEN' => '', //容联云通讯 主账号token accountToken
    'RONGLIAN_APPID'         => '', //容联云通讯 应用Id appid
    'RONGLIAN_TEMPLATE_ID'   => '', //容联云通讯 模板Id
	
	//**********************************极光推送api 设置**************
	 'JPUSH' => array(
        'APP_KEY' => '3712b3258b73d7823f868165',
        'MASTER_SECRET' => 'ea74160088aabd9a3d583807'
    ),
	
	/************* 微博微信登录配置**************/
	'SINA_API_KEY' => 4209897208,
	'SINA_SECRET'  => 'e1affa67778a89d0c85f45625397f850',
	
	
	
	'LOAD_EXT_CONFIG'		=> 	'db,webconfig,oauth,theme',  		//加载网站设置文件
	
	
	
	
	
);