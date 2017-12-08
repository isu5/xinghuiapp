##APP
Thinkphp 3.2.3 RBAC权限 + H-ui后台 
#登录
使用Validform验证，用户名密码，验证码是否正确，layer弹窗成功or失败返回
#权限验证
5表 管理员，角色，权限节点，合理使用钩子函数
#公告广告
列表，添加

#2017/12/4
	上传插件优化，webuploader 更换为plupload插件
	1.css，js 导入
	2.config.php配置文件夹路径
	3.页面引入js
	4.上传调试
#2017/12/5
	1.认证状态接口返回认证信息
	2.创建登录日志表
	3.增加log日志类的操作
#2017/12/7
	1.修改文件上传，修复文件上传乱码的问题：目录是ThinkPHP\Library\Think\Upload\Driver/local.class.php
第82行处改为if (!move_uploaded_file($file['tmp_name'], iconv('utf-8','gb2312',$filename))) 
	2.使用time()创建文件夹，防止文件重复上传覆盖
	3.修改会议数据表中downfile字段属性，改为text保存