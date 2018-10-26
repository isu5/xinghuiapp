<?php
/**
 * 交易记录
 */
namespace Common\Model;
use Common\Model\BaseModel;

class PaymentModel extends BaseModel{
	
	protected $tableName = 'User_alipay';
	
	public function search($pagesize=15){

		//搜索
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
		//翻页
		$count = $this->alias('a')
		->join('left join __USER__ u on u.id=a.user_id ')
		->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')->field('a.*,u.username')
		->join('left join __USER__ u on u.id=a.user_id ')
		->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->select();
		return $data;
	}



}