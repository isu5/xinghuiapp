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
			
			$user = $this->model->where("username='{$username}' OR phone='{$username}' OR email='{$username}'")->find();
			if($user){
				// 登录成功存cookie
					if($user['password'] == $password) {
						$data = ['id'=>$user['id'],'token'=>$user['token']];
						
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


	




	

}