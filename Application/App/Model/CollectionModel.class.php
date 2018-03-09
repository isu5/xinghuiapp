<?php
/**
 * 收藏模型
 */
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class CollectionModel extends BaseModel{

	
	public function search(){
		
		$where = [];
		$where['a.uid']= I('post.uid');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况


		$total = $this->alias('a')->where($where)->count();	


		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }

		$data['data'] = $this->alias('a')
		->field('b.id,b.title,b.ctime,b.qtime,b.etime,b.address,b.xxaddress,b.is_user,b.is_private,b.click,b.companypic')
		->join('LEFT JOIN __CONFERENCE__ b on b.id=a.cid
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();
		
		//p($this->_Sql());
		return $data;
	}

	public function _before_insert(&$data,$option){
		$data['addtime'] = time();

	}



}