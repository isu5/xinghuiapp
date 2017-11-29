<?php
/**
*  极光个性会议推送 type=3
*/
namespace Home\Model;
use Common\Model\BaseModel;

class JgpushpersonModel extends BaseModel{
	
	
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
		$data['user_id'] =  I('get.uid');
	
	}
	
	//发布之后推送所有用户信息
	public function _after_insert($data,$option){
		//
		$uid = I('get.uid');
		$jpush = D('User')->where('id='.$uid)->find();
		if(!jgpushgx($jpush['jpush'],$data['title'],$data['content'])){
			$this->error = '该用户没有登录app客户端，不能推送';
		}
		
		
	}
	
}