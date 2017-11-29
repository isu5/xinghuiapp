<?php

/**
 * 实名认证
 */
namespace Home\Controller;

class CertifyController extends PublicController{
	private $model = nulll;
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Certify');
		
	}


	/**
	 * 企业认证
	 */
	public function index(){
		if(IS_POST){
			// p($_POST);die;
			/*p($_FILES);
			DIE; */
			if($this->model->create(I('post.',1))){
				if ($this->model->add()) {
					redirect('message');
				}else{
					$this->error($this->model->getError());
				}
			}
			//$this->ajaxReturn($code);
			exit;
		}

		$uid = cookie(userid);
		$cert = $this->model->where(array('uid'=>$uid))->find();
		
		$this->assign('cert',$cert);
		$this->display();
	}

	//个人认证
	public function person(){
		
		if(IS_POST){
			/* p($_POST);
			p($_FILES);
			DIE; */
			if($this->model->create(I('post.',1))){
				if ($this->model->add()) {
					redirect('message',3,'提交跳转中...');
				}else{
					$this->error($this->model->getError());
				}
			}
			//$this->ajaxReturn($code);
			exit;
			
		}
		$uid = cookie(userid);
		$cert = $this->model->where(array('uid'=>$uid))->find();
		
		$this->assign('cert',$cert);
		$this->display();
	}

	public function message(){
		$this->display();
	}
	
	
	
	




}
?>