<?php

namespace App\Controller;
use Think\Controller;
use Org\Nx\Response;
class RegisterController extends Controller{
	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('User');
	}
	
	public function index(){
		$data['phone'] = I('post.phone');
		$data['password'] = I('post.password');
		$data['ctime'] = time();
		//判断手机号是否为二级账户
		$arr = $this->model->field('id,username,remark,phone,level')->where(array('phone'=>$data['phone']))->find();
		if(IS_POST){
			if ($arr['level'] == 2) {
				Response::show(403,'您的手机号是二级账户！请解绑后注册');
			}else{
				//成功
				if ($result = $this->model->add($data)) {
					$id = $result;	
					//二维码
					$dimecode = U('Index/usercode',array('id'=>$id));
					$this->model->where(array('id'=>$id))->setField(array('dimecode'=>$dimecode));
					$info = $this->model->field('id,token')->where(array('id'=>$id))->find();
					Response::show(200,'注册成功',$info);
				}else{
					Response::show(401,'注册失败'.$this->model->getError());
				}
			}
		}

	}
	





}