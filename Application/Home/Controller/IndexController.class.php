<?php
/**
*	
* 网站首页
*
*/


namespace Home\Controller;
Vendor('JpushClient.autoload');
use JPush\Client as JPushClient;
use Think\Controller;
use Org\Nx\Response;
class IndexController extends Controller {
	//网站首页
    public function index(){
		
		$this->display();
	}
	//手机端app下载页面
	public function xhuiApp(){
		$this->display();
		
	}
	
	//文件上传
	public function ajax_upload(){
		ajax_upload('/Uploads/image/');
	}
	
	//生成二维码
	public function usercode($id){
		
		qrcode($id);
		//scQRcode($id);
		
	}
	//测试页面
	public function test(){
		echo rongyunrand();
		
	}
	public function sendmember(){
		
		$appkey = C('RONG_PRO_APP_KEY'); // 开发者平台分配的 App Secret。
		$nonce = rand(); // 获取随机数。
		$timestamp = time()*1000; // 获取时间戳（毫秒）
		header('App-Key:'.$appkey);  
		header('Nonce:'.$nonce);  
		header('Timestamp:'.$timestamp); 
		header('Signature:'.rongyunrand()); 
		//header('Content-Type: Application/x-www-form-urlencoded'); 
		
		
	}
	
	public function sms(){
		$ol = yunsendSMS('1236','13552832050');
		if($ol){
			echo 'ok';
		}else{
			echo '0000';
		}
	}

	
	//app 用户指南页面显示
	public function guide(){
		
		$this->display();
	}
	
	
	
}