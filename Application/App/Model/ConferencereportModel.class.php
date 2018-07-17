<?php
/**
*  会议调查报告
*/
namespace App\Model;
use Common\Model\BaseModel;

use Common\Third\AppPage;

class ConferencereportModel extends BaseModel{
	//protected $tableName = 'conference_auditlist';
	protected $tableName = 'conference_report';
	
	
	
	//单条
	public function getone(){
		$where =[];
		$where['conf_id'] = I('conf_id');
		
		$data['data'] = $this->where($where)->find();
		return $data;
	}
	
	
}