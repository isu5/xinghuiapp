<?php
/**
 * 日志
 */
namespace Admin\Model;
use Common\Model\BaseModel;

class LogModel extends BaseModel{

	
	public function search($pagesize=15){

		//搜索
		$where = array();
		$title = I('get.username');
		if ($title) {
			$where['username'] = array('like',"%$username%");
		}
		//翻页
		$count = $this->alias('a')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$data['data'] = $this->alias('a')
		->field('a.*,b.username,b.phone,b.email')
		->join('LEFT JOIN __USER__ b ON a.user_id=b.id
		')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		return $data;
	}



}