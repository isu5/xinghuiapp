<?php
/**
 * 公告模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class MessageModel extends BaseModel{
	
	
	
	public function search($pagesize=15){
		//搜索
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field('a.*,b.username,b.phone')
		->join('LEFT JOIN __USER__ b on a.user_id=b.id')
		->where($where)->limit($page->firstRow.','.$page->listRows)->order('a.id desc')->select();
		return $data;
	}
	
	


}