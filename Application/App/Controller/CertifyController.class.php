<?php

/**
 * 实名认证
 */
namespace App\Controller;
use Org\Nx\Response;

class CertifyController extends PublicController{
	private $model = nulll;
	private $admin = nulll;
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Certify');
		$this->admin = D('Admin');
		
	}
	//当有人认证时，查询管理员jpush标识审核端提醒
	public function pushTest(){
		$manage = $this->admin->alias('a')->join('left join __ADMIN_ROLE__ b on b.admin_id=a.id')->where('b.role_id=4')->find();
		return $manage;
	} 
	
	/**
	 * 企业认证
	 */
	public function index(){
		$jg = $this->pushTest();
		if(IS_POST){
			//p($_POST);die;
			/*p($_FILES);
			DIE; */
			if($this->model->create(I('post.',1))){
				if ($id = $this->model->add()) {
					if($id){
						manageJgpush($jg['jpush']);
						Response::show(200,'提交成功，审核需要1-2个工作日，请等待审核!');
					}
					
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
		//$manage = $this->admin->alias('a')->join('left join __ADMIN_ROLE__ b on b.admin_id=a.id')->where('b.role_id=4')->find();
		$jg = $this->pushTest();
		if(IS_POST){
			/* p($_POST);
			p($_FILES);
			DIE; */
			if($this->model->create(I('post.',1))){
				if ($id = $this->model->add()) {
					if($id){
						manageJgpush($jg['jpush']);
						Response::show(200,'提交成功，审核需要1-2个工作日，请等待审核!');
					}
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
	
	//个人发布会议认证
	public function publishcert(){
		$jg = $this->pushTest();
		if(IS_POST){
			/* p($_POST);
			p($_FILES);
			DIE; */
			if($this->model->create(I('post.',1))){
				if ($id = $this->model->add()) {
					if($id){
						manageJgpush($jg['jpush']);
						Response::show(200,'提交成功，审核需要1-2个工作日，请等待审核!');
					}
				}else{
					Response::show(401,$this->model->getError());
				}
			}else{
				Response::show(402,$this->model->getError());
			}
			
		}
	}
	
	
	//个人认证修改
	public function editperson(){
		$jg = $this->pushTest();
		if(IS_POST){
			
			if(!$this->model->editp()){
				Response::show(401,'修改失败',$this->model->getError());
			}else{
				manageJgpush($jg['jpush']);
				Response::show(200,'修改成功');
			}
		}
		
	}
	//企业认证修改
	public function editindex(){
		$jg = $this->pushTest();
		if(IS_POST){
			if(!$this->model->editcom()){
				Response::show(401,'修改失败',$this->model->getError());
			}else{
				manageJgpush($jg['jpush']);
				Response::show(200,'修改成功');
			}
		}
	}
	//个人发布会议认证修改
	public function editpublish(){
		$jg = $this->pushTest();
		if(IS_POST){
			if(!$this->model->editpublish()){
				Response::show(401,'修改失败',$this->model->getError());
			}else{
				manageJgpush($jg['jpush']);
				Response::show(200,'修改成功');
			}
		}
	}
	
	
	




}
?>