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
	
	
	//生成二维码
	public function usercode($id){
		
		qrcode($id);
		//scQRcode($id);
		
	}
	

	
	//app 用户指南页面显示
	public function guide(){
		
		$this->display();
	}
	
	
	
}