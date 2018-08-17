<?php
/**
*  调查问卷下的配题表
*/
namespace App\Model;
use Common\Model\BaseModel;

class ConferencereportquesModel extends BaseModel{
	
	protected $tableName = 'conference_reportques';
	
	
	//获取某个调查问卷下的所有配题
	public function getTques(){
		$where =[];
		$where['conf_id'] = I('conf_id');
		
		$data['data'] = $this->where($where)->select();
		
		$data['meet'] = D('Conferencereport')->field('title,description,expire_date')->where($where)->find();
		return $data;
	}
	
	
	
}