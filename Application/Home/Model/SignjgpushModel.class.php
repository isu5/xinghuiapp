<?php
/**
*  我参加的待审核列表
*/
namespace Home\Model;
use Common\Model\BaseModel;

class SignjgpushModel extends BaseModel{
	
	
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
		$data['user_id'] =  I('get.uid');
		$data['conf_id'] =  I('get.id');
	
	}
	
	
	
	
}