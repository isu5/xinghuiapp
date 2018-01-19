<?php

/**
 * 实名认证
 */
namespace App\Controller;
use Org\Nx\Response;

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
			//p($_POST);die;
			/*p($_FILES);
			DIE; */
			if($this->model->create(I('post.',1))){
				if ($this->model->add()) {
					
					Response::show(200,'提交成功，请等待审核!');
				}else{
					Response::show(401,'认证失败');
				}
			}else{
				Response::show(402,$this->model->getError());
			}
			
		}

		/* $uid = I('post.id');
		$cert = $this->model->where(array('uid'=>$uid))->find();
		Response::show(200,'数据获取成功',$cert); */
		
	}

	//个人认证
	public function person(){
		
		if(IS_POST){
			/* p($_POST);
			p($_FILES);
			DIE; */
			if($this->model->create(I('post.',1))){
				if ($this->model->add()) {
					Response::show(200,'提交成功，请等待审核!');
				}else{
					Response::show(401,'认证失败',$this->model->getError());
				}
			}else{
				Response::show(402,$this->model->getError());
			}
			
		}
		/* $uid = cookie(userid);
		$cert = $this->model->where(array('uid'=>$uid))->find();
		
		$this->assign('cert',$cert);
		$this->display(); */
	}

	
	
	//个人认证修改
	public function editperson(){
		
		if(IS_POST){
			
			if(!$this->model->editp()){
				Response::show(401,'修改失败',$this->model->getError());
			}else{
				Response::show(200,'修改成功');
			}
		}
		
	}
	//企业认证修改
	public function editindex(){
		
		
		if(IS_POST){
			if(!$this->model->editcom()){
				Response::show(401,'修改失败',$this->model->getError());
			}else{
				Response::show(200,'修改成功');
			}
		}
		
		
	}
	
	
	
	




}
?>