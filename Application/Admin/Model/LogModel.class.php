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
		$page->lastSuffix=false;
		$page->setConfig('header','<ul><li class="rows">共<b>%TOTAL_ROW%</b>条记录&nbsp;&nbsp;每页<b>15</b>条&nbsp;&nbsp;第<b>%NOW_PAGE%</b>页/共<b>%TOTAL_PAGE%</b>页</li></ul>');
		$page->setConfig('prev','上一页');
		$page->setConfig('next','下一页');
		$page->setConfig('last','末页');
		$page->setConfig('first','首页');
		$page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
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