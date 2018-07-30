<?php
/**
*  会议调查报告
*/
namespace App\Model;
use Common\Model\BaseModel;

use Common\Third\AppPage;

class  extends BaseModel{
	//protected $tableName = 'conference_auditlist';
	protected $tableName = 'conference_userreport';
	
	
	// 自动完成
	protected $_auto = array (

		// 时间
		array('addtime','time',1,'function'),
		
	);
	//单条
	public function getone(){
		$where =[];
		$where['conf_id'] = I('conf_id');
		
		$data['data'] = $this->where($where)->find();
		return $data;
	}
	
	
}