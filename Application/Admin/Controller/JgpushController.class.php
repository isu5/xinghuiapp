<?php

/**
 * 极光推送管理控制器
 */
namespace Admin\Controller;


class JgpushController extends CommonController{
	//系统
	private $app = null;
	
	//继承父类
	public function _initialize(){
		parent::_initialize();
		$this->jg = D('Jgpush');
	}
	//app引导页
	
	public function index(){
		$data = $this->jg->search();
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
		
		
		
	}
	//添加app引导页图片
	
	public function add(){
		if(IS_POST){
			// p($_POST);
			// p($_FILES);die;
			if($this->jg->create(I('post.',1))){
				if($this->jg->add()){
					$this->ajaxReturn(array('status'=>1));
					exit;
				}else{
					$this->ajaxReturn(array('status'=>2));
					
				}
			}
		}
		
		$this->display();
		
	}
	
	//删除
	public function delete(){
		if($this->jg->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->jg->getError());
			$this->ajaxReturn(0);
		}
	}
}
