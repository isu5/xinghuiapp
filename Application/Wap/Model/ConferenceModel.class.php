<?php
/**
*	会议
*/
namespace Wap\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;

class ConferenceModel extends BaseModel{
	 
	/***
	* 首页获取所有数据
	*
	*/
	public function hunt(){
		//会议进行中的数据
		$where['statuses'] = 0 ;
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		
		$total = $this->alias('a')->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
		$data['data'] = $this->alias('a')
		->field('a.*,b.is_cert')
		->join('LEFT JOIN __CERTIFY__ b ON a.uid=b.uid
			')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('a.id desc')
		->select();
		return $data;
	}
	//单条数据
	public function showOne(){
		
		//搜索
		$where = array();
		$m = M('Conference');
		$map['id'] = I('get.id');
		$m->where(array('id'=>$map['id']))->setInc('click'); // 用户的点击量加1
		
		$data['data'] = $this
		->where($map)
		->order('id desc')
		->find();
		
		//p($this->getLastSql());
		return $data;
	}

}
?>