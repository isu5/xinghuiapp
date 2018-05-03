<?php

namespace Bpp\Controller;
use Think\Controller;
use Org\Nx\Response;

class CertifyController extends Controller{

	private $model = null;
	private $user = null;
	private $conf = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('Certify');
		$this->user = D('User');
		$this->conf = D('Conference');
		
	}
	
	//审核列表
	public function audit(){
		$data = $this->model->search(); 
		//p($data);

		$data = array(
			'result' => $data['data'],
			//'page' => $data['page']
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
	}
	
	//认证审核
	public function cert(){
		$id = I('post.id');
		$type = I('post.type');
		$stat = I('post.stat');
		$cert = $this->model->field('id,uid,company')->where('id='.$id)->find();
		$jpush = $this->user->where('id='.$cert['uid'])->find();
		//把is_cert的值更新 1为个人，2为企业，3个人发布
		if($stat == 1){
			if($type == 1){
				$status = $this->model->where('id='.$id)->setField('is_cert',1);
				
				if ($status) {
					$this->user->field('id,companyname')->where('id=' .$cert['uid'])->setField('companyname',$cert['company']);
					$this->user->field('id,type')->where('id=' .$cert['uid'])->setField('type',1);
					//企业新建会议时，举办单位自动获取，不可编辑
					$this->conf->field('id,uid,companyname')->where('id=' .$cert['uid'])->setField('companyname',$cert['company']);
					//审核通过，推送审核通过结果
					
					jgpushCert($jpush['jpush']);
					Response::show(200,'操作成功!');
				}
				
			}elseif($type == 2){
				$status = $this->model->where('id='.$id)->setField('is_cert',2);
				
				if ($status) {
					$this->user->field('id,companyname')->where('id=' .$cert['uid'])->setField('companyname',$cert['company']);
					$this->user->field('id,type')->where('id=' .$cert['uid'])->setField('type',2);
					//企业新建会议时，举办单位自动获取，不可编辑
					$this->conf->field('id,uid,companyname')->where('id=' .$cert['uid'])->setField('companyname',$cert['company']);
					//审核通过，推送审核通过结果
					
					jgpushCert($jpush['jpush']);
					Response::show(200,'操作成功!');
				}
				
			}elseif($type == 3){
				$status = $this->model->where('id='.$id)->setField('is_cert',3);
				//审核认证后的公司名称，保存到用户表中的公司名称字段中且不可更改
				if ($status) {
					$this->user->field('id,companyname')->where('id=' .$cert['uid'])->setField('companyname',$cert['company']);
					$this->user->field('id,type')->where('id=' .$cert['uid'])->setField('type',3);
					//企业新建会议时，举办单位自动获取，不可编辑
					$this->conf->field('id,uid,companyname')->where('id=' .$cert['uid'])->setField('companyname',$cert['company']);
					//审核通过，推送审核通过结果
					
					jgpushCert($jpush['jpush']);
					Response::show(200,'操作成功!');
				}
				
			}else{
				Response::show(401,'操作失败!');
			}
		}else{
				$status = $this->model->where('id='.$id)->setField('is_cert',4);
				//审核认证后的公司名称，保存到用户表中的公司名称字段中且不可更改
				
				if ($status) {
					$this->user->field('id,type')->where('id=' .$cert['uid'])->setField('type',1);
					//审核拒绝，推送审核通过结果
					
					backjgpushRefused($jpush['jpush']);
				}
			Response::show(200,'操作成功!');
		}
		
		
		
		
		
	}
	

	

	




	

}