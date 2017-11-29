<?php
/**
*  会议公告列表
*/
namespace App\Model;
use Common\Model\BaseModel;

use Common\Third\AppPage;

class ConferencebullModel extends BaseModel{
	//protected $tableName = 'conference_auditlist';
	protected $tableName = 'conference_bull';
	
	

	//企业会议公告
	public function companybulls(){
		$where = [];
		$where['conf_id'] = I('post.conf_id');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		$data['data'] = $this
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();
		//p($this->_Sql());
		return $data;
		
	}
	
	
	
}