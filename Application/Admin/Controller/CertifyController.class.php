<?php
/**
 * 后台认证管理
 */
namespace Admin\Controller;

class CertifyController extends CommonController{

	private $model = nulll;
	private $user = nulll;
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Certify');
		$this->user = D('User');
		$this->conf = D('Conference');
			
	}
	
	//审核列表
	public function audit(){
		$data = $this->model->search(); 
		//p($data);

		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}

	//个人认证列表
	public function person(){
		$data = $this->model->search(); 
		//p($data);

		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}
	//企业认证列表
	public function index(){
		$data = $this->model->search(); 
		//p($data);

		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}
	
	
	/**
	 * is_cert 1表示个人认证，2表示企业认证 3表示审核中，4表示未通过
	 * [stop 审核不通过]
	 * @return [type] [description]
	 */
	public function stop(){
		$id = I('get.id');
		$status = $this->model->where('id='.$id)->setField('is_cert',4);
		if ($status) {
			$this->ajaxReturn(1);
		}

	}
	//个人审核通过
	public function start(){
		$id = I('get.id');
		//把is_cert的值更新为1
		$status = $this->model->where('id='.$id)->setField('is_cert',1);
		if ($status) {
			$this->ajaxReturn(1);
		}

	}
	//企业审核通过
	public function companyCert(){
		$id = I('get.id');
		//把is_cert的值更新为1
		$status = $this->model->where('id='.$id)->setField('is_cert',2);
		//审核认证后的公司名称，保存到用户表中的公司名称字段中且不可更改
		$cert = $this->model->field('id,uid,company')->where('id='.$id)->find();
		$jpush = $this->user->where('id='.$cert['uid'])->find();
		if ($status) {
			$this->user->field('id,companyname')->where('id=' .$cert['uid'])->setField('companyname',$cert['company']);
			$this->user->field('id,type')->where('id=' .$cert['uid'])->setField('type',2);
			//企业新建会议时，举办单位自动获取，不可编辑
			$this->conf->field('id,uid,companyname')->where('id=' .$cert['uid'])->setField('companyname',$cert['company']);
			//审核通过，推送审核通过结果
			
			jgpushCert($jpush['jpush']);
			$this->ajaxReturn(2);
		}
		
		

	}
	//删除
	public function delete(){
		if($this->model->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->model->getError());
			$this->ajaxReturn(0);
		}
	}

}
