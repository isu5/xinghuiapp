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
		
		
		
		if(IS_POST){
			if ($this->model->create(I('post.',1))) {
				//成功
				if ($result = $this->model->add()) {
					$id = $result;
					//二维码
					$dimecode = U('Index/usercode',array('id'=>$id));
					$this->model->where(array('id'=>$id))->setField(array('dimecode'=>$dimecode));
					Response::show(200,'注册成功');
				}else{
					Response::show(401,'注册失败');
				}
				
			}else{
				
				Response::show(402,'注册失败'.$this->model->getError());
			}
		}

	}
	





}