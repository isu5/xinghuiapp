<?php
namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller {
    public function index(){
		
        $this->display();
    }
	//检测验证码是否正确
	public function check_code(){

		$code = $_POST['param'];	//验证码
		
    	$verify = new \Think\Verify();
    	if($verify->check($code)){
    		 $this->ajaxReturn(array('status'=>'y','info'=>'√ 验证码正确'));
		}else{  
			$this->ajaxReturn(array('status'=>'n','info'=>'× 验证码错误'));
	     }
	}
	
	
	//提交到数据库验证比对
	public function doPost(){
		if(IS_POST){
			$map['username'] = I('post.username');
			$map['password'] = md5(I('post.password'));
			$m = M('Admin');
			$result = $m->field('id,username,status,login_count,last_login_ip,last_login_time')->where($map)->find();
			if($result){
				if ($result['status'] == 0) {
					$this->ajaxReturn(array('status'=>'2'));

				}
					 //存入session
				 	session('uid',$result['id']);	//管理员ID
	    			session('username',$result['username']);	//管理员用户名
	    			session('last_login_ip',$result['last_login_ip']);
	    			session('last_login_time',$result['last_login_time']);
	    			session('login_count',$result['login_count']);
					
					//保存登录信息		
					$data['id'] = $result['id'];	//用户ID
	    			$data['last_login_ip'] = get_client_ip();	//最后登录IP
	    			$data['last_login_time'] = time();		//最后登录时间		//用户注册时间
	    			$data['login_count'] = $result['login_count'] + 1;
					
					$m->save($data);
					
					unset($_POST['password']);  //密码明文打印，要unset掉post 过来的密码数据
					/* p($_POST);
					p($_SESSION);die; */
					$this->ajaxReturn(array('status'=>'1'));


				}else{
					$this->ajaxReturn(array('status'=>'0'));
					
				}

		}else{
			if(session('uid')){
    			$this->success('已登录，正在跳转到主页',U('Index/index'));
    		}
		}
	}
	

	//退出
	public function logout(){
		session_unset();
		session_destroy();
		redirect(U('Login/index'));
	}
	
	
	
	
}