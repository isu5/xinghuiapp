<?php
/**
 * »áÔ±¿ØÖÆÆ÷
 */
namespace Admin\Controller;

class UserController extends CommonController{

	//系统
	private $user = null;
	
	//继承父类
	public function _initialize(){
		parent::_initialize();
		$this->user = D('User');
	}
	
	//用户列表
	public function index(){
		
		$data = $this->user->search();
		//p($data);die;
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}
	
	//显示单个用户信息
	
	public function show(){
		$id = I('get.id');
		$data = $this->user->where(array('id'=>$id))->find();
		//p($data);
		$this->assign('data',$data);
		$this->display();
	}
	
	//删除用户
	public function delete(){
		if($this->user->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->user->getError());
			$this->ajaxReturn(0);
		}
	}


}