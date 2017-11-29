<?php
/*****
* 极光推送
*/
namespace Common\Third;
Vendor('JpushClient.autoload');
use JPush\Client as JPushClient;
class Jpush{  
        
    private $app_key;        //待发送的应用程序(appKey)，只能填一个。
    private $master_secret;    //主密码
    private $type;    //主密码
   


    //若实例化的时候传入相应的值则按新的相应值进行
    public function __construct($app_key=C('JPUSH.APP_KEY'), $master_secret=C('JPUSH.MASTER_SECRET'),$type=null) {
        if ($app_key) $this->app_key = $app_key;
        if ($master_secret) $this->master_secret = $master_secret;
        if ($type) $this->type = $type;
    }
	
	//推送所有用户
	public static function jgpushAll($title,$content,$type=""){
		$extras = array("title"=>$title, "content"=>$content); //自定义数组 
		$android_notification = array(
			'title' => '幸会会议',
			'build_id' => 2,
			'extras' => $extras
		);
		$alert= $title;
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
	}
	
	//签到成功推送消息
	public static function jgpushQd(){
		$client->push()
			->setPlatform('all')
			->addAlias($tag)
			->setNotificationAlert('恭喜您签到成功!')
			->send();
	}
	
	//审核通过提醒
	public static function jgpushAgreed(){
		
	}
	
	
}  
      
    ?>  