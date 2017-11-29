<?php
/**
*  融云---讨论组
*/
namespace App\Model;
use Common\Model\BaseModel;

use Common\Third\AppPage;

class RongcloudimModel extends BaseModel{
	
	//是否存在讨论组
	public function rongim(){
		$where = [];
		$title = I('post.title');
		
		$where['title'] = $title; 
		
		$data['data'] = $this
		->where($where)
		->find();
		//p($this->_Sql());
		return $data;
		
	}
	
	//
	protected function _before_insert(&$data,$option){
		$data['addtime'] = time();
	}  
	
	
}