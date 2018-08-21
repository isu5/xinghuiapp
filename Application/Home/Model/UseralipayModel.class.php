<?php
/**
 * 订单模型
 */
namespace Home\Model;
use Common\Model\BaseModel;

class UseralipayModel extends BaseModel{
	protected $tableName = 'User_alipay';
	
	//订单
	public function orderlist($pagesize=10){
		//搜索
		$where = array();
		$where['a.user_id'] = cookie(userid);

		$title = I('get.title');
		if ($title) {
			$where['a.title'] = array('like',"%$title%");
		}
		//翻页
		$count = $this->alias('a')->join('LEFT JOIN __USER__ b ON b.id=a.user_id
			')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field('a.*,b.username')
		->join('LEFT JOIN __USER__ b ON b.id=a.user_id
			')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}
}