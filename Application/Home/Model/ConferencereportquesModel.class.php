<?php
/**
*  企业资料
*/
namespace Home\Model;
use Common\Model\BaseModel;

class ConferencereportquesModel extends BaseModel{
	
	protected $tableName = 'conference_reportques';
	
	
	
	public function search($pagesize=15){
		$where = array();
		
		$where['user_id'] = cookie(userid);
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}
	
	
	
}