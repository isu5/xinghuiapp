<?php
/**
 * 企业产品统计
 */
namespace Common\Model;
use Common\Model\BaseModel;

class ProductModel extends BaseModel{
	
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
	
		$arr = $this->alias('a')
		->field(array("count(b.pro_id)"=>"countstats",'a.title','b.user_id'=>'uid'))
		->join('left join __PRODUCT_STATS__ b on b.pro_id = a.id')	
		->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->order('a.addtime desc')
		->group('b.user_id')->buildSql();
		
		$data['data'] = M('User')->alias('c')
		->field(array('d.username','d.id','c.title',"count(c.countstats)"=>"counts"))
		->table($arr)
		->join('left join __USER__ d on d.id=c.uid')
		->group('c.uid')
		->select();
		return $data;
	}

	public function _before_insert(&$data,$option){
		
		$data['pic'] = json_encode(I('post.pic'));
		
		$data['addtime'] = time();
		$data['uid'] = cookie(userid);

	}



}