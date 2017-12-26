<?php

namespace App\Controller;
use Think\Controller;
use Org\Nx\Response;

class LoginController extends Controller{

	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('User');
	}
	

	
	//登录
	public function index(){
		if(IS_POST){
			$username= I('post.phone');
			$password = I('post.password');
			$log = M('Log');
			
			$user = $this->model->where("username='{$username}' OR phone='{$username}' OR email='{$username}'")->find();
			if($user){
				// 
				if($user['password'] == $password) {
					$data = ['id'=>$user['id'],'token'=>$user['token']];
					//判断当前账号是否是在线状态
					$this->model->where(array('id'=>$user['id']))->setField('is_login',1);
					//p($loginfo);
					if($user['is_login'] == 1){
						Response::show(201,'您已经登录，或在其他设备已经登录了！',$data);
						exit;
					}
					Response::show(200,'登录成功',$data);
					
					
				}else{
					//用户名或者密码错误
					Response::show(401,'用户名或密码错误');
				}
			}else{
				Response::show(402,'没有查到该用户,请注册!');
			}
		}
	}
	public function logout(){
		$data['id'] = I('post.user_id');
		if(IS_POST){
			$this->model->where(array('id'=>$data['id']))->setField('is_login',0);
			Response::show(200,'退出成功！');
		}
	}


	




	

}