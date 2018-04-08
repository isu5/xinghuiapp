<?php
/**
*  签到推送
*/
namespace Home\Model;
use Common\Model\BaseModel;

class SignjgpushModel extends BaseModel{
	
	
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
		$data['user_id'] =  I('get.user_id');
		$data['conf_id'] =  I('get.conf_id');
	
	}
	
	
	
	
	
}