<?php

namespace Home\Controller;
use Think\Controller;
class RegisterController extends Controller{
	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('User');
	}
	
	//邮箱验证是否重复
	public function checkEmail(){
		$email = I('post.email');
		$user = $this->model->where(array('email'=>$email))->find();
		if ($user) {
			//如果邮箱已存在，返回假
			$this->ajaxReturn(array('code'=>0));
		} else{
			$this->ajaxReturn(array('code'=>1));
		}
	}


	//注册
	public function index(){
		if (IS_POST) {
			if ($this->model->create(I('post.',1))) {
				//成功
				if ($result =$this->model->add()) {
					$id = $result;
					//二维码
					$dimecode = U('Index/usercode',array('id'=>$id));
					$this->model->where(array('id'=>$id))->setField(array('dimecode'=>$dimecode));
					$this->ajaxReturn(array('code'=>1));
				}
				
			}else{
				
				$this->ajaxReturn(array('code'=>0));
			}
		

		}
		
		$this->display();
	}
	//验证邮箱方法
	public function regSuccess(){
		$this->display();
	}
	//邮箱验证码是否存在
	public function email_check(){
		$code = I('get.code');
		$info = $this->model->field('id,email_check_time')->where(array('email_check_code'=>$code))->find();
		
		if ($info) {
			if ((time() - $info['email_check_time']) > 86400) {
				//过期,删除该账户
				$this->model->delete($info['id']);
				$this->error('该账户已过期，无法验证，请重新注册！',U('Register/index'));
				
			}else{
				$this->model->where(array('id'=>$info['id']))->setField('email_check_code','');
				
				redirect(U('Register/regok',array('username'=>$username)));
			}
		}else{
			$this->error('错误',U('/'));
		}

	}







}