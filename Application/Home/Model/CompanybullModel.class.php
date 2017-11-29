<?php
/**
*  我参加的待审核列表
*/
namespace Home\Model;
use Common\Model\BaseModel;

class CompanybullModel extends BaseModel{
	
	protected $tableName = 'company_bull';
	
	public function searchFront($pagesize=15){
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
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
	
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
		$data['user_id'] = cookie(userid);
		$data['content'] = htmlspecialchars_decode($_POST['content']);

	}
	
	
	
	

}