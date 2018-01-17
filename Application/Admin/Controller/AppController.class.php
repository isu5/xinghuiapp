<?php

/**
 * 公告管理控制器
 */
namespace Admin\Controller;


class AppController extends CommonController{
	//系统
	private $app = null;
	
	//继承父类
	public function _initialize(){
		parent::_initialize();
		$this->app = D('App');
	}
	//app引导页
	
	public function index(){
		$data = $this->app->search();
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
			if($this->app->create(I('post.',1))){
				if($this->app->add()){
					$this->ajaxReturn(array('status'=>1));
					exit;
				}else{
					
					$this->ajaxReturn(array('status'=>1));
				}
			}
		}
		
		$this->display();
		
	}
	//
	public function edit(){
		
		
		
		$this->display();
	}
	//删除
	public function delete(){
		if($this->app->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->app->getError());
			$this->ajaxReturn(0);
		}
	}
	
}
