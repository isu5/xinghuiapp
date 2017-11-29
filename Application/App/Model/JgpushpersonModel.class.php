<?php
/**
*  个性推送
*/
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class JgpushpersonModel extends BaseModel{
	
	//极光推送信息列表
	public function search(){
		$where = [];
		$where['user_id'] = I('post.user_id');
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
 
		$data['data'] = $this
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();

		return $data;	
		
		
	}
}