<?php
/**
 * 企业产品统计
 */
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class ProductModel extends BaseModel{
	
	public function search(){

		//搜索
		$where = array();
		
		$where['a.uid'] = I('post.uid') ;
	
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->join('left join __PRODUCT_STATS__ b on b.pro_id = a.id left join __USER__ c on c.id = a.uid')
		->where($where)->group('b.pro_id')->count();

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field(array("count(b.pro_id)"=>"countstats",'a.title','b.pro_id','c.companyname'))
		->join('left join __PRODUCT_STATS__ b on b.pro_id = a.id
			left join __USER__ c on c.id = a.uid
		')	
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('a.id desc')
		->group('b.pro_id')
		->select();
		//p($this->_Sql());
		
		return $data;
	}
	
	//谁点击的统计
	public function countwho($pagesize=15){
		
		$where = [];
		$where['pro_id'] = I('post.pro_id');
		$m = M('Product_stats');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $m->alias('a')->join('left join __USER__ b on b.id=a.user_id')
		->where($where)->group('a.user_id')->count();

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $m->alias('a')
		->field(array('count(a.pro_id)'=>'links','b.username,b.id,b.phone,b.nickname,b.companyname,b.logo'))
		->join('left join __USER__ b on b.id=a.user_id')
		->where($where)
		->group('a.user_id')
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->select();
		//p($this->_Sql());
		return $data;
		
		
		
	}
}