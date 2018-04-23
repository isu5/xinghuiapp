<?php
Vendor('JpushClient.autoload');
use JPush\Client as JPushClient;
use Common\Third\Jpush;
use Common\Third\Ucpaas;


/*
	云之讯短信
*/
function yunsendSMS($param='',$mobile='',$uid=''){
	//初始化必填
	//填写在开发者控制台首页上的Account Sid
	$options['accountsid']= C("YUNSMS.Accountsid");
	//填写在开发者控制台首页上的Auth Token
	$options['token']= C("YUNSMS.Token");

	//初始化 $options必填
	$ucpass = new Ucpaas($options);
	$appid =  C("YUNSMS.Appid");	//应用的ID，可在开发者控制台内的短信产品下查看
	$templateid = C("YUNSMS.Templateid");    //可在后台短信产品→选择接入的应用→短信模板-模板ID，查看该模板ID
	/* $param = ''; //多个参数使用英文逗号隔开（如：param=“a,b,c”），如为参数则留空
	$mobile = '';
	$uid = ""; */
	return $ucpass->SendSms($appid,$templateid,$param,$mobile,$uid);
}


/**
 * 网易云发送模板短信
 * @param  $mobiles      [手机号]
 * @return $result      [返回array数组对象]
 */
function sendSMS($mobile=''){

    $AppKey = C("SMS.AppKey");
    $AppSecret = C("SMS.AppSecret");
    $templateid =  C("SMS.TemplateId");
    $RequestType = 'curl';
    
    $p = new ServerAPI($AppKey,$AppSecret,$RequestType);
    return $p->sendSMSTemplate($templateid,$mobile);
}

/**
 * 网易云检测短信验证码
 * @param  $mobile       [手机号]
 * @param  $code         [验证码]
 * @return $result      [返回array数组对象]
 */
function checkSMS($mobile='',$code=''){
    $AppKey = C("SMS.AppKey");
    $AppSecret = C("SMS.AppSecret");
    $RequestType = 'curl';
    //vendor('wangyiSms.ServerAPI');
    $p = new ServerAPI($AppKey,$AppSecret,$RequestType);
    return $p->checkSMS($mobile,$code);
}



/**
* 打印函数
*/
function p($arr){
	
	$str = '<pre style="display: block;padding: 9.5px;margin: 44px 0 0 0;font-size: 13px;line-height: 1.42857;color: #333;word-break: break-all;word-wrap: break-word;background-color: #F5F5F5;border: 1px solid red;border-radius: 4px;">';
	if(is_bool($arr)) {
		$show = $arr? 'true' : 'false';
		
	}elseif(is_null($arr)){
		$show = 'null';
	}else{
		$show = print_r($arr,true);
	}
	$str .= $show;
	$str .= '</pre>';
	echo $str;
	
}
//增加日志
function addlog($log, $name = false)
{
    $Model = M('log');
    if (!$name) {
       
        $uid = cookie('userid');
        if ($uid) {
            $user = M('User')->field('id,username')->where(array('id' => $uid))->find();
            $data['user_id'] = $user['id'];
        } else {
            $data['user_id'] = '';
        }
    } else {
        $data['user_id'] = $name;
    }
    $data['login_time'] = time();
    $data['login_ip'] = $_SERVER["REMOTE_ADDR"];
	$arr = GetIpLookup($_SESSION['last_login_ip']); 
	$data['logout_address']	= $arr['country'].'-'.$arr['province'].'-'.$arr['city'];
	$data['type'] = 1; //pc
	if($data['type'] == 1){
		$res['type'] = "电脑";
	}else{
		$res['type'] = "手机";
	}
	$data['status'] = 1;  //登录
	//登录成功!尊敬的用户942546059/010-9989483您好！您使用了电脑在2017-12-08 09:36:15登录地址为中国-北京-北京
	$info = '尊敬的用户'.cookie(username).'/'.cookie(userphone)."您好！您使用了". $res['type'].date('Y-m-d H:s',$data['login_time']).'登录地址为'.$data['logout_address'];
    $data['log'] = $log.$info;
    $Model->data($data)->add();
}





//处理手机号，隐藏中间4位数
function hidephone($phone){
	$p = substr($phone,0,3)."****".substr($phone,7,4);
	return $p;
	echo $p;
}



//查找二级账户id
function findson($arr,$id=0) {  
   
    $sons = array();    //子栏目数组  
    foreach ($arr as $v) {  
        if ($v['pid'] == $id) {  
            $sons[] = $v;  
        }  
    }  
    return $sons;  
} 
/**
 * 根据配置项获取对应的key和secret
 * @return array key和secret
 */
function get_rong_key_secret(){
    // 判断是需要开发环境还是生产环境的key
    if (C('RONG_IS_DEV')) {
        $key=C('RONG_DEV_APP_KEY');
        $secret=C('RONG_DEV_APP_SECRET');
    }else{
        $key=C('RONG_PRO_APP_KEY');
        $secret=C('RONG_PRO_APP_SECRET');
    }
    $data=array(
        'key'=>$key,
        'secret'=>$secret
        );
    return $data;
}
/**
 * 获取完整网络连接
 * @param  string $path 文件路径
 * @return string       http连接
 */
function get_url($path){
    // 如果是空；返回空
    if (empty($path)) {
        return '';
    }
    // 如果已经有http直接返回
    if (strpos($path, 'http://')!==false) {
        return $path;
    }
    // 判断是否使用了oss
    $alioss=C('ALIOSS_CONFIG');
    if (empty($alioss['KEY_ID'])) {
        return 'http://'.$_SERVER['HTTP_HOST'].$path;
    }else{
        return 'http://'.$alioss['BUCKET'].'.'.$alioss['END_POINT'].$path;
    }
    
}

//生产字符串
function tostring(){
	return sha1(uniqid(rand()));
} 

/*
 * 获取用户Id
*/
function get_uid(){
	return $_COOKIE['userid'];
}
//登录获取融云token
function getRongLoginToken($uid){
	 // 获取key和secret
    $key_secret=get_rong_key_secret();
	$rong = new \Common\Third\RongCloud($key_secret['key'],$key_secret['secret']);
	$token = $rong->getToken($uid);
	$to_json = json_decode($token,true);
	$token= $to_json['token'];
	return $token;
	
}

/**
 * 获取融云token
 * @param  integer $uid 用户id
 * @return integer      token
 */
function getRongcloudToken($uid){
    // 从数据库中获取token
    $token=D('User')->getToken($uid,1);
    // 如果有token就返回
    if ($token) {
        return $token;
    }
    // 获取用户昵称和头像
    $user_data=M('User')->field('username,logo')->getById($uid);
    // 用户不存在
    if (empty($user_data)) {
        return false;
    }
    // 获取头像url格式
    $avatar=get_url($user_data['logo']);
    // 获取key和secret
    $key_secret=get_rong_key_secret();
    // 实例化融云
    $rong_cloud=new \Common\Third\RongCloud($key_secret['key'],$key_secret['secret']);
    // 获取token
	
	$userId = $uid;
    $token_json=$rong_cloud->getToken($userId,$user_data['username'],$avatar);
	//p($token_json);
    $token_array=json_decode($token_json,true);
    // 获取token失败
    if ($token_array['code']!=200) {
        return false;
    }
    $token=$token_array['token'];
    $data=array(
       
        'token'=>$token
        );
    // 插入数据库
    $result=D('User')->where('id='.$uid)->setField($data);
    if ($result) {
        return $token;
    }else{
        return false;
    }
}

//极光推送所有用户
/**
*type=1 平台所有用户
*type=2 扫描签到
*/


function jgpushAll($title="",$content,$type=1){
	$extras = array("content"=>$content,'type'=>1); //自定义数组 
	$android_notification = array(
		//'title' => '幸会会议',
		'build_id' => 2,
		'extras' => $extras
	);
	$alert= $content;
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try{
		$push = $client->push()
		->setPlatform('all')
		->setNotificationAlert('公共信息提示')
		->addAllAudience()
		->androidNotification($alert,$android_notification)
		 ->message('Hello JPush', [
			  'title' => 'Hello',
			  'content_type' => 'text',
			  'extras' => $extras
			  
			])
		->send();
		//p($push);
	}catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
	
}
//极光推送单个用户扫码签到成功
function jgpushPerson($tag,$conf_id){
	$extras = array("conf_id"=>$conf_id,'type'=>2); //自定义数组 
	$android_notification = array(
		//'title' => '幸会会议',
		'build_id' => 2,
		'extras' => $extras
	);
	$alert = '恭喜您签到成功!';
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try{
		$client->push()
		->setPlatform('all')
		->addAlias($tag)
		->setNotificationAlert($alert)
		->androidNotification($alert,$android_notification)
		 ->message('Hello JPush', [
			  'title' => 'Hello',
			  'content_type' => 'text',
			  'extras' => $extras
			  
			])
		->send();
	}catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
		
}
//极光推送扫码成功后的个性内容
function signJgpush($tag,$title,$content){
	$extras = array("title"=>$title, "content"=>$content,"type"=>4); //自定义数组 
	$android_notification = array(
		//'title' => '幸会会议',
		'build_id' => 2,
		'extras' => $extras
	);
	$alert = $title;
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try{
		$client->push()
		->setPlatform('all')
		->addAlias($tag)
		->setNotificationAlert($alert)
		->androidNotification($alert,$android_notification)
		 ->message('Hello JPush', [
			  'title' => 'Hello',
			  'content_type' => 'text',
			  'extras' => $extras
			  
			])
		->send();
	} catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
}

/****
*
* 极光个性会议推送 type=3
*
*/
function jgpushgx($tag,$title,$content){
	
	$extras = array("title"=>$title, "content"=>$content,"type"=>3); //自定义数组 
	$android_notification = array(
		//'title' => '幸会会议',
		'build_id' => 2,
		'extras' => $extras
	);
	$alert = $title;
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try {
		$client->push()
		->setPlatform('all')
		->addAlias($tag)
		->setNotificationAlert($alert)
		->androidNotification($alert,$android_notification)
		 ->message('Hello JPush', [
			  'title' => 'Hello',
			  'content_type' => 'text',
			  'extras' => $extras
			  
			])
		->send();
	} catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
	
}
/****
*
* 极光内部会议推送 type=5
*
*/
function jgpushInside($tag,$conf_id,$title,$content){
	
	$extras = array("title"=>$title, "content"=>$content,'conf_id'=>$conf_id,"type"=>5); //自定义数组 
	$android_notification = array(
		//'title' => '幸会会议',
		'build_id' => 2,
		'extras' => $extras
	);
	$alert = $title;
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try {
		$client->push()
		->setPlatform('all')
		->addAlias($tag)
		->setNotificationAlert($alert)
		->androidNotification($alert,$android_notification)
		 ->message('Hello JPush', [
			  'title' => 'Hello',
			  'content_type' => 'text',
			  'extras' => $extras
			  
			])
		->send();
	} catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
	
}

//审核通过提醒
function jgpushAgreed($tag){
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try{
		$client->push()
		->setPlatform('all')
		->addAlias($tag)
		->setNotificationAlert('恭喜您您已通过审核，请及时参加会议!')
		->send();
	}catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
}

//审核拒绝提醒
function jgpushRefused($tag){
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try{
		$client->push()
		->setPlatform('all')
		->addAlias($tag)
		->setNotificationAlert('您还没有资质参加会议，如有疑问请联系客服!')
		->send();
	}catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
}

//二级账户删除解绑提醒
function jgpushAccount($tag){
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try{
		$client->push()
		->setPlatform('all')
		->addAlias($tag)
		->setNotificationAlert('您的手机号已解绑，可以重新注册了!')
		->send();
	}catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
}

//认证审核通过
function jgpushCert($tag){
	$client = new JPushClient(C('JPUSH.APP_KEY'), C('JPUSH.MASTER_SECRET'));
	try{
		$client->push()
		->setPlatform('all')
		->addAlias($tag)
		->setNotificationAlert('恭喜您您的认证已通过审核，您可以发布会议了!')
		->send();
		
	}catch (\JPush\Exceptions\APIConnectionException $e) {
		// try something here
		//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app，不能推送'];
		}
	} catch (\JPush\Exceptions\APIRequestException $e) {
		// try something hereif($e){
			//如果存在异常，则说明用户可能不在线
		if($e){
			
			return ['code'=>201,'message'=>'该用户没有登录app客户端，不能推送'];
		}
	}
	
}






/**
 * 更新融云头像
 * @param  integer $uid 用户id
 * @return boolear      操作是否成功
 */
function refreshRongcloud_token($uid){
    // 获取用户昵称和头像
    $user_data=M('User')->field('username,logo')->getById($uid);
    // 用户不存在
    if (empty($user_data)) {
        return false;
    }
    $avatar=get_url($user_data['logo']);
	
    // 获取key和secret
    $key_secret=get_rong_key_secret();
    // 实例化融云
    $rong_cloud=new \Common\Third\RongCloud($key_secret['key'],$key_secret['secret']);
    // 更新融云用户头像
	
    $result_json=$rong_cloud->userRefresh($uid,$user_data['username'],$avatar);
    $result_array=json_decode($result_json,true);
    if ($result_array['code']==200) {
        return true;
    }else{
        return false;
    }
}

/**
 *  生成二维码
 * function qrcode(){
 *     $filename='qrcode.png';
 *     $logo=SITE_PATH."\\Public\\Home\\images\\logo_80.png";
 *     qrcode('http://www.dellidc.com',$filename,false,$logo,8,'L',2,true);
 * }
 *
 * @param $data 二维码包含的文字内容
 * @param $filename 保存二维码输出的文件名称，*.png
 * @param bool $picPath 二维码输出的路径
 * @param bool $logo 二维码中包含的LOGO图片路径
 * @param string $size 二维码的大小
 * @param string $level 二维码编码纠错级别：L、M、Q、H
 * @param int $padding 二维码边框的间距
 * @param bool $saveandprint 是否保存到文件并在浏览器直接输出，true:同时保存和输出，false:只保存文件
 * return string
 */
function qrcode($data,$filename,$picPath=false,$logo=false,$size='10',$level='L',$padding=2,$saveandprint=false){
    vendor("phpqrcode.phpqrcode");//引入工具包
    // 下面注释了把二维码图片保存到本地的代码,如果要保存图片,用$fileName替换第二个参数false
    $path = $picPath?$picPath:SITE_PATH."\\Uploads\\QRcode"; //图片输出路径
    mkdir($path);
    //在二维码上面添加LOGO
    if(empty($logo) || $logo=== false) { //不包含LOGO
        if ($filename==false) {
            QRcode::png($data, false, $level, $size, $padding, $saveandprint); //直接输出到浏览器，不含LOGO
        }else{
            $filename=$path.'/'.$filename; //合成路径
            QRcode::png($data, $filename, $level, $size, $padding, $saveandprint); //直接输出到浏览器，不含LOGO
        }
    }else { //包含LOGO
        if ($filename==false){
            //$filename=tempnam('','').'.png';//生成临时文件
           die('参数错误');
        }else {
            //生成二维码,保存到文件
            $filename = $path . '\\' . $filename; //合成路径
        }
        QRcode::png($data, $filename, $level, $size, $padding);
        $QR = imagecreatefromstring(file_get_contents($filename));
        $logo = imagecreatefromstring(file_get_contents($logo));
        $QR_width = imagesx($QR);
        $QR_height = imagesy($QR);
        $logo_width = imagesx($logo);
        $logo_height = imagesy($logo);
        $logo_qr_width = $QR_width / 5;
        $scale = $logo_width / $logo_qr_width;
        $logo_qr_height = $logo_height / $scale;
        $from_width = ($QR_width - $logo_qr_width) / 2;
        imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width, $logo_qr_height, $logo_width, $logo_height);
        if ($filename === false) {
            Header("Content-type: image/png");
            imagepng($QR);
        } else {
            if ($saveandprint === true) {
                imagepng($QR, $filename);
                header("Content-type: image/png");//输出到浏览器
                imagepng($QR);
            } else {
                imagepng($QR, $filename);
            }
        }
    }
    return $filename;
}

//生产二维码图片
 function scQRcode($id){
	vendor("phpqrcode.phpqrcode");//引入工具包
	
	$value = $id; //二维码内容
	$errorCorrectionLevel = 'L';//容错级别
	$matrixPointSize = 6;//生成图片大小
	
	//生成二维码图片
	QRcode::png($value, './Uploads/QRcode/qrcode.png', $errorCorrectionLevel, $matrixPointSize, 2);
	
	
	$logo = './Uploads/QRcode/logo.png';//准备好的logo图片
	$QR = './Uploads/QRcode/qrcode.png';//已经生成的原始二维码图

	if ($logo !== FALSE) {
		$QR = imagecreatefromstring(file_get_contents($QR));
		$logo = imagecreatefromstring(file_get_contents($logo));
		$QR_width = imagesx($QR);//二维码图片宽度
		$QR_height = imagesy($QR);//二维码图片高度
		$logo_width = imagesx($logo);//logo图片宽度
		$logo_height = imagesy($logo);//logo图片高度
		$logo_qr_width = $QR_width / 5;
		$scale = $logo_width/$logo_qr_width;
		$logo_qr_height = $logo_height/$scale;
		$from_width = ($QR_width - $logo_qr_width) / 2;
		//重新组合图片并调整大小
		imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width,
		$logo_qr_height, $logo_width, $logo_height);
	}
	//输出图片
	$userid = uniqid(rand(10000,99999));
	$filename = './Uploads/QRcode/user/'.$userid.'_'.$id.'.png';
	imagepng($QR, $filename);
	return $filename;

}

/**
* 处理图片文件json数据
**/
function readjson($arr){
	
	$list = json_decode($arr,true);
	$data = str_replace('\\/','/',$list);
	//$data = implode(',',$data);
	/* $app = [];
	foreach($data as $k=>$v){
		$app = $v;
		echo $app;
	} */
	
	return $data;
	
}

/**
* 上传单张图片
*/
function uploadOne($imgName, $dirName, $thumb = array())
{
    // 上传LOGO
    if(isset($_FILES[$imgName]) && $_FILES[$imgName]['error'] == 0)
    {
        $ic = C('UPLOAD_CONFIG');
        $upload = new \Think\Upload(array(
            'rootPath' => $ic['rootPath'],
            'maxSize' => $ic['maxSize'],
            'exts' => $ic['exts'],
        ));// 实例化上传类
        $upload->savePath = $dirName . '/'; // 图片二级目录的名称
        // 上传文件 
        // 上传时指定一个要上传的图片的名称，否则会把表单中所有的图片都处理，之后再想其他图片时就再找不到图片了
        $info   =   $upload->upload(array($imgName=>$_FILES[$imgName]));
        if(!$info)
        {
            return array(
                'ok' => 0,
                'error' => $upload->getError(),
            );
        }
        else
        {
            $ret['ok'] = 1;
            $ret['images'][0] = $logoName = '/'. $ic['rootPath'] . $info[$imgName]['savepath'] . $info[$imgName]['savename'];
			//p($ret);die;
            // 判断是否生成缩略图
            if($thumb)
            {
                $image = new \Think\Image();
                // 循环生成缩略图
                foreach ($thumb as $k => $v)
                {
                    $ret['images'][$k+1] = $info[$imgName]['savepath'] . 'thumb_'.$k.'_' .$info[$imgName]['savename'];
                    // 打开要处理的图片
                    $image->open($ic['rootPath'].$logoName);
                    $image->thumb($v[0], $v[1])->save($ic['rootPath'].$ret['images'][$k+1]);
                }
            }
            return $ret;
        }
    }
}
/**
 * 会议图片上传
 * @return string 上传后的图片名
 */
function conf_upload_image($path,$maxSize=524288000){
    ini_set('max_execution_time', '0');
    // 去除两边的/
    $path=trim($path,'.');
    $path=trim($path,'/');
    $config=array(
        'rootPath'  =>'./',         //文件上传保存的根路径
        'savePath'  =>'./'.$path.'/',   
        'exts'      => array('jpg', 'gif', 'png', 'jpeg','bmp'),
		'maxSize'   => $maxSize,
		'saveName'  =>  '',     // 上传文件的保存规则，支持数组和字符串方式定义
        'autoSub'   => true,
		'subName'	=> 	array('date','Ymd/'.time()),  //生成保存的子目录
        );
    $upload = new \Think\Upload($config);// 实例化上传类
    $info = $upload->upload();
    if($info) {
        foreach ($info as $k => $v) {
            $data['name']=trim($v['savepath'],'.').$v['savename'];
        }
        return $data;
    }
}




/**
 * app 图片上传
 * @return string 上传后的图片名
 */
function app_upload_image($path,$maxSize=524288000){
    ini_set('max_execution_time', '0');
    // 去除两边的/
    $path=trim($path,'.');
    $path=trim($path,'/');
    $config=array(
        'rootPath'  =>'./',         //文件上传保存的根路径
        'savePath'  =>'./'.$path.'/',   
        'exts'      => array('jpg', 'gif', 'png', 'jpeg','bmp'),
		'maxSize'   => $maxSize,
		'saveName'  =>  '',     // 上传文件的保存规则，支持数组和字符串方式定义
        'autoSub'   => true,
		'subName'	=> 	array('date','Ymd/'.time()),  //生成保存的子目录
        );
    $upload = new \Think\Upload($config);// 实例化上传类
    $info = $upload->upload();
    if($info) {
        foreach ($info as $k => $v) {
            $data[]=trim($v['savepath'],'.').$v['savename'];
        }
        return $data;
    }
}

/**
 * app 公告文件上传
 * @return string 上传后的图片名
 */
function app_upload_bull($path,$maxSize=524288000){
    ini_set('max_execution_time', '0');
    // 去除两边的/
    $path=trim($path,'.');
    $path=trim($path,'/');
    $config=array(
        'rootPath'  =>'./',         //文件上传保存的根路径
        'savePath'  =>'./'.$path.'/',   
        'exts'      => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'txt','pdf'),
        'maxSize'   => $maxSize,
		'saveName'  =>  '',     // 上传文件的保存规则，支持数组和字符串方式定义
        'autoSub'   => true,
		'subName'	=> 	array('date','Ymd/'.time()),  //生成保存的子目录
        );
    $upload = new \Think\Upload($config);// 实例化上传类
    $info = $upload->upload();
    if($info) {
        foreach ($info as $k => $v) {
            $data[]=trim($v['savepath'],'.').$v['savename'];
        }
        return $data;
    }
}
/**
 * app //文件上传
 * @return string 上传后的图片名
 */

function app_upload_file($path,$maxSize=5242880000){
    ini_set('max_execution_time', '0');
    // 去除两边的/
    $path=trim($path,'.');
    $path=trim($path,'/');
    $config=array(
        'rootPath'  =>'./',         //文件上传保存的根路径
        'savePath'  =>'./'.$path.'/',   
        'exts'      => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'txt','pdf'),
        'maxSize'   => $maxSize,
		'saveName'  =>  '',     // 上传文件的保存规则，支持数组和字符串方式定义
        'autoSub'   => true,
		'subName'	=> 	array('date','Ymd/'.time()),  //生成保存的子目录
        );
    $upload = new \Think\Upload($config);// 实例化上传类
    $info = $upload->upload();
    if($info) {
        foreach ($info as $k => $v) {
            $data['pic']=trim($v['savepath'],'.').$v['savename'];
            $data['name']=trim($v['name']);
        }
        return $data;
    }
}



/**
* 删除图片
*/
function deleteImage($image = array())
{
	$savePath = C('UPLOAD_CONFIG');
	foreach ($image as $v)
	{
		unlink($savePath['rootPath'] . $v);
	}
}


//显示图片
/**
* url 图片路径
* id img id 属性
* no 要传递的这条数据的值
*/
function showImg($url,$width="",$id=""){

	$ic = C('UPLOAD_CONFIG');
	if($width)
		$width = "width='$width'";
	
	if($id)
		$id =  "id='$id'";
	
	echo "<img $width $height src= '$url'  $id />";
}

    /**
    ** 截取中文字符串
    **/
    function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true){
        if(function_exists("mb_substr")){
            $slice= mb_substr($str, $start, $length, $charset);
        }elseif(function_exists('iconv_substr')) {
            $slice= iconv_substr($str,$start,$length,$charset);
        }else{
            $re['utf-8'] = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef][x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";
            $re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";
            $re['gbk'] = "/[x01-x7f]|[x81-xfe][x40-xfe]/";
            $re['big5'] = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";
            preg_match_all($re[$charset], $str, $match);
            $slice = join("",array_slice($match[0], $start, $length));
        }    
            $fix='';
            if(strlen($slice) < strlen($str)){
                $fix='...';
            }
            return $suffix ? $slice.$fix : $slice;
    }

/**
 * 字符截取 支持UTF8/GBK
 * @param $string
 * @param $length
 * @param $dot
 */
function str_cut($string, $length, $dot = '...') {
	$strlen = strlen($string);
	if($strlen <= $length) return $string;
	$string = str_replace(array('&nbsp;', '&amp;', '&quot;', '&#039;', '&ldquo;', '&rdquo;', '&mdash;', '&lt;', '&gt;', '&middot;', '&hellip;'), array(' ', '&', '"', "'", '“', '”', '—', '<', '>', '·', '…'), $string);
	$strcut = '';
	if(strtolower(CHARSET) == 'utf-8') {
		$n = $tn = $noc = 0;
		while($n < $strlen) {
			$t = ord($string[$n]);
			if($t == 9 || $t == 10 || (32 <= $t && $t <= 126)) {
				$tn = 1; $n++; $noc++;
			} elseif(194 <= $t && $t <= 223) {
				$tn = 2; $n += 2; $noc += 2;
			} elseif(224 <= $t && $t < 239) {
				$tn = 3; $n += 3; $noc += 2;
			} elseif(240 <= $t && $t <= 247) {
				$tn = 4; $n += 4; $noc += 2;
			} elseif(248 <= $t && $t <= 251) {
				$tn = 5; $n += 5; $noc += 2;
			} elseif($t == 252 || $t == 253) {
				$tn = 6; $n += 6; $noc += 2;
			} else {
				$n++;
			}
			if($noc >= $length) break;
		}
		if($noc > $length) $n -= $tn;
		$strcut = substr($string, 0, $n);
	} else {
		$dotlen = strlen($dot);
		$maxi = $length - $dotlen - 1;
		for($i = 0; $i < $maxi; $i++)
		{
			$strcut .= ord($string[$i]) > 127 ? $string[$i].$string[++$i] : $string[$i];
		}
	}
	$strcut = str_replace(array('&', '"', "'", '<', '>'), array('&amp;', '&quot;', '&#039;', '&lt;', '&gt;'), $strcut);
	return $strcut.$dot;
}



/**
 * 按符号截取字符串的指定部分
 * @param string $str 需要截取的字符串
 * @param string $sign 需要截取的符号
 * @param int $number 如是正数以0为起点从左向右截  负数则从右向左截
 * @return string 返回截取的内容
 */
/*  示例
    $str='123/456/789';
    cut_str($str,'/',0);  返回 123
    cut_str($str,'/',-1);  返回 789
    cut_str($str,'/',-2);  返回 456
   
*/
function cut_str($str,$sign,$number){
    $array=explode($sign, $str);
    $length=count($array);
    if($number<0){
        $new_array=array_reverse($array);
        $abs_number=abs($number);
        if($abs_number>$length){
            return 'error';
        }else{
            return $new_array[$abs_number-1];
        }
    }else{
        if($number>=$length){
            return 'error';
        }else{
            return $array[$number];
        }
    }
}

/**
 * 发送邮件
 * @param  string $address 需要发送的邮箱地址
 * @param  string $subject 标题
 * @param  string $content 内容
 * @return boolean         是否成功
 */
function sendEmail($address,$subject,$content){
    $email_smtp=C('EMAIL_SMTP');
    $email_username=C('EMAIL_USERNAME');
    $email_password=C('EMAIL_PASSWORD');
    $email_from_name=C('EMAIL_FROM_NAME');
    if(empty($email_smtp) || empty($email_username) || empty($email_password) || empty($email_from_name)){
        return array("error"=>1,"message"=>'邮箱配置不完整');
    }
    require './ThinkPHP/Library/Org/Nx/class.phpmailer.php';
    require './ThinkPHP/Library/Org/Nx/class.smtp.php';
    $phpmailer=new \Phpmailer();
    // 设置PHPMailer使用SMTP服务器发送Email
    $phpmailer->IsSMTP();
    // 设置为html格式
    $phpmailer->IsHTML(true);
    // 设置邮件的字符编码'
    $phpmailer->CharSet='UTF-8';
    // 设置SMTP服务器。
    $phpmailer->Host=$email_smtp;
    // 设置为"需要验证"
    $phpmailer->SMTPAuth=true;
    // 设置用户名
    $phpmailer->Username=$email_username;
    // 设置密码
    $phpmailer->Password=$email_password;
    // 设置邮件头的From字段。
    $phpmailer->From=$email_username;
    // 设置发件人名字
    $phpmailer->FromName=$email_from_name;
    // 添加收件人地址，可以多次使用来添加多个收件人
    $phpmailer->AddAddress($address);
    // 设置邮件标题
    $phpmailer->Subject=$subject;
    // 设置邮件正文
    $phpmailer->Body=$content;

    // 发送邮件。
    if(!$phpmailer->Send()) {
        $phpmailererror=$phpmailer->ErrorInfo;
        return array("error"=>1,"message"=>$phpmailererror);
    }else{
        return array("error"=>0);
    }
}

/**
 * 根据ip 获取真实地址
 */
function GetIp(){  
    $realip = '';  
    $unknown = 'unknown';  
    if (isset($_SERVER)){  
        if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && !empty($_SERVER['HTTP_X_FORWARDED_FOR']) && strcasecmp($_SERVER['HTTP_X_FORWARDED_FOR'], $unknown)){  
            $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);  
            foreach($arr as $ip){  
                $ip = trim($ip);  
                if ($ip != 'unknown'){  
                    $realip = $ip;  
                    break;  
                }  
            }  
        }else if(isset($_SERVER['HTTP_CLIENT_IP']) && !empty($_SERVER['HTTP_CLIENT_IP']) && strcasecmp($_SERVER['HTTP_CLIENT_IP'], $unknown)){  
            $realip = $_SERVER['HTTP_CLIENT_IP'];  
        }else if(isset($_SERVER['REMOTE_ADDR']) && !empty($_SERVER['REMOTE_ADDR']) && strcasecmp($_SERVER['REMOTE_ADDR'], $unknown)){  
            $realip = $_SERVER['REMOTE_ADDR'];  
        }else{  
            $realip = $unknown;  
        }  
    }else{  
        if(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), $unknown)){  
            $realip = getenv("HTTP_X_FORWARDED_FOR");  
        }else if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), $unknown)){  
            $realip = getenv("HTTP_CLIENT_IP");  
        }else if(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), $unknown)){  
            $realip = getenv("REMOTE_ADDR");  
        }else{  
            $realip = $unknown;  
        }  
    }  
    $realip = preg_match("/[\d\.]{7,15}/", $realip, $matches) ? $matches[0] : $unknown;  
    return $realip;  
}  
  
function GetIpLookup($ip = ''){  
    if(empty($ip)){  
        $ip = GetIp();  
    }  
    $res = @file_get_contents('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=' . $ip);  
    if(empty($res)){ return false; }  
    $jsonMatches = array();  
    preg_match('#\{.+?\}#', $res, $jsonMatches);  
    if(!isset($jsonMatches[0])){ return false; }  
    $json = json_decode($jsonMatches[0], true);  
    if(isset($json['ret']) && $json['ret'] == 1){  
        $json['ip'] = $ip;  
        unset($json['ret']);  
    }else{  
        return false;  
    }  
    return $json;  
}  

/**
 * 上传文件类型控制 此方法仅限ajax上传使用
 * @param  string   $path    字符串 保存文件路径示例： /Upload/image/
 * @param  string   $format  文件格式限制
 * @param  integer  $maxSize 允许的上传文件最大值 52428800
 * @return booler   返回ajax的json格式数据
 */
function ajax_upload($path='file',$format='empty',$maxSize='52428800'){
    ini_set('max_execution_time', '0');
    // 去除两边的/
    $path=trim($path,'/');
    // 添加Upload根目录
    $path=strtolower(substr($path, 0,6))==='uploads' ? ucfirst($path) : 'Uploads/'.$path;
    // 上传文件类型控制
    $ext_arr= array(
            'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
            'photo' => array('jpg', 'jpeg', 'png'),
            'flash' => array('swf', 'flv'),
            'media' => array('swf', 'flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb'),
            'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2','pdf')
        );
    if(!empty($_FILES)){
        // 上传文件配置
        $config=array(
                'maxSize'   =>  $maxSize,               // 上传文件最大为50M
                'rootPath'  =>  './',                   // 文件上传保存的根路径
                'savePath'  =>  './'.$path.'/',         // 文件上传的保存路径（相对于根路径）
                'saveName'  =>  array('uniqid',''),     // 上传文件的保存规则，支持数组和字符串方式定义
                'autoSub'   =>  true,                   // 自动使用子目录保存上传文件 默认为true
                'exts'      =>    isset($ext_arr[$format])?$ext_arr[$format]:'',
            );
        // p($_FILES);
        // 实例化上传
        $upload=new \Think\Upload($config);
        // 调用上传方法
        $info=$upload->upload();
        // p($info);
        $data=array();
        if(!$info){
            // 返回错误信息
            $error=$upload->getError();
            $data['error_info']=$error;
            echo json_encode($data);
        }else{
            // 返回成功信息
            foreach($info as $file){
                $data['name']=trim($file['savepath'].$file['savename'],'.');
                // p($data);
                echo json_encode($data);
            }               
        }
    }
}
/**
 * 附件上传
 * 上传文件类型控制 此方法仅限ajax上传使用
 * @param  string   $path    字符串 保存文件路径示例： /Upload/image/
 * @param  string   $format  文件格式限制
 * @param  integer  $maxSize 允许的上传文件最大值 52428800
 * @return booler   返回ajax的json格式数据
 */
function file_upload($path='file',$format='empty',$maxSize='52428800'){
    ini_set('max_execution_time', '0');
    // 去除两边的/
    $path=trim($path,'/');
    // 添加Upload根目录
    $path=strtolower(substr($path, 0,7))==='uploads' ? ucfirst($path) : 'Uploads/'.$path;
    // 上传文件类型控制
    $ext_arr= array(
            'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
            'photo' => array('jpg', 'jpeg', 'png'),
            'flash' => array('swf', 'flv'),
            'media' => array('swf', 'flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb'),
            'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2','pdf')
        );
    if(!empty($_FILES)){
        // 上传文件配置
		
        $config=array(
                'maxSize'   =>  $maxSize,               // 上传文件最大为50M
                'rootPath'  =>  './',                   // 文件上传保存的根路径
                'savePath'  =>  './'.$path.'/',         // 文件上传的保存路径（相对于根路径）
                'saveName'  =>  '',     // 上传文件的保存规则，支持数组和字符串方式定义
                'autoSub'   =>  true,                   // 自动使用子目录保存上传文件 默认为true
				'subName'	=> 	array('date','Ymd/'.time()),  //生成保存的子目录
                'exts'      =>  isset($ext_arr[$format])?$ext_arr[$format]:'',
            );
        // 实例化上传
        $upload=new \Think\Upload($config);
        // 调用上传方法
        $info=$upload->upload();
        $data=array();
        if(!$info){
            // 返回错误信息
            $error=$upload->getError();
            $data['error_info']=$error;
            echo json_encode($data);
        }else{
            // 返回成功信息
            foreach($info as $file){
                $data['pic']=trim($file['savepath'].$file['savename'],'.');
				$data['name'] = $file['name'];
				
                echo json_encode($data);
            }
        }
    }
}

