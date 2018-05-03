<?php

namespace Bpp\Controller;
use Think\Controller;
use Org\Nx\Response;

class LoginController extends Controller{

	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('Admin');
	}
	

	
	//后台管理登录
	public function index(){
		$m = M('Admin');
		if(IS_POST){
			$username= I('post.username');
			$password = I('post.password');
			
			$user = $m->where(array('username'=>$username))->find();
			
			if($user){
				if($user['password'] == $password){
					$data = ['id'=>$user['id'],'jpush'=>$user['jpush']];
					Response::show(200,'登录成功',$data);
				}else{
					Response::show(200,'登录失败');
				}
			}
				
		}
	}
	public function logout(){
		$data['id'] = I('post.user_id');
		if(IS_POST){
			M('User')->where(array('id'=>$data['id']))->setField('is_login',0);
			Response::show(200,'退出成功！');
		}
	}


	




	

}