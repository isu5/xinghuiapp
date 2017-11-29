<?php
/**
 * APP留言管理
 */
namespace Admin\Controller;

class MessageController extends CommonController{

	//系统
	private $msg = null;
	
	//继承父类
	public function _initialize(){
		parent::_initialize();
		$this->msg = D('Message');
	}
	

	public function index(){
		
		$data = $this->msg->search();
		//p($data);die;
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));

		$this->display();
		
	}
	
	
	//删除用户
	public function delete(){
		if($this->msg->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->msg->getError());
			$this->ajaxReturn(0);
		}
	}

}