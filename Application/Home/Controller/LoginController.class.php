<?php

namespace Home\Controller;
use Think\Controller;
class LoginController extends Controller{

	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('User');
	}
	// 第三方平台登录
    public function oauth_login(){
        $type=I('get.type');
        import("Org.ThinkSDK.ThinkOauth");
        $sdk=\ThinkOauth::getInstance($type);
        redirect($sdk->getRequestCodeURL());
    }
	
	
	//检测验证码是否正确
	public function chkcode(){

		$code = $_POST['code'];	//验证码
		
    	$verify = new \Think\Verify();
    	if($verify->check($code)){
    		//验证码正确
    		 $this->ajaxReturn(array('code'=>1));
		}else{  
			$this->ajaxReturn(array('code'=>0));
	     }
	}
	
	
	//登录
	public function index(){
		if(IS_POST){
			$username= I('post.username');
			$password = I('post.password');
		
			$user = $this->model->where("phone='{$username}' OR username='{$username}' OR email='{$username}'")->find();
			
			if ($user) {
				if($user['itype'] ==1){
					$code = ['code'=>5];
				}else{
					if(!empty($user['email_check_code'])) {
				//必须验证邮箱才可登录
					$code = ['code'=>3];
					exit;
					
					}elseif($user['level']==2){
						$code = ['code'=>4];
					}elseif($user['password'] == $password){
						// 登录成功存cookie
						
						cookie("userid",$user['id']);
						cookie("username",$user['username']);
						cookie("useremail",$user['email']);
						cookie("userphone",$user['phone']);
						//登录成功
						$code = ['code'=>1]; 
						//添加日志
						addlog('登录成功!');
					}else{
						//用户名或者密码错误
					//	p($user['level']);	
						$code = ['code'=>0]; //用户名或密码错误
					}
				}
				
			
			}else{
				//用户名或者密码错误
				
				$code = ['code'=>0]; //用户名或密码错误
			}
			$this->ajaxReturn($code); 
			exit;
		}
		$this->display();
	}
	
	//登录
	/* public function index12(){
		if(IS_POST){
			
			$username= I('post.username');
			$password = I('post.password');
			p($_PSOT);die;
			$user = $this->model->where("username='{$username}' OR phone='{$username}' OR email='{$username}'")->find();
			p($user);die;
			if ($user) {
				
				if(!empty($user['email_check_code'])) {
				//必须验证邮箱才可登录
					$code = ['code'=>3];
					exit;
				
				}else{
					// 登录成功存cookie
					if($user['password'] == $password) {
						cookie("userid",$user['id']);
						cookie("username",$user['username']);
						cookie("useremail",$user['email']);
						$code = ['code'=>1]; //登录成功
					}else{
						//用户名或者密码错误
						$code = ['code'=>0]; //用户名或密码错误
					}
				}
			}else{
				//用户名或者密码错误
				
				$code = ['code'=>0]; //用户名或密码错误
			}
			$this->ajaxReturn($code); 
			exit;
		}
		
		$this->display();
	}
 */

	//用户退出
		public function logout(){
			
			cookie('userid',null);
			cookie('username',null);
			cookie('useremail',null);
			cookie('userphone',null);
			
			redirect(U('Login/index'));
		}

	
	public function RecoveryPwd(){
		
		if(IS_POST){
			p($_POST);
		}
		
		
		$this->display();
	}
	//忘记密码
	//检测手机验证码
	public function checkPcCode(){
		$data['check_code'] = rand('1000','9999');
		$data['phone'] = I('post.phone');
		
		if(IS_POST){
			 /* print_r($_POST);
			print_r($data);die;  */
			if(yunsendSMS($data['check_code'],$data['phone'])){
				session('check_code',$data['check_code']);
				session('phone',$data['phone']);
				$code = array('code'=>1,);
				$this->ajaxReturn(1);  //发送成功
			}else{
				$this->ajaxReturn(0);
			}
			
		}
		
	}

	

}