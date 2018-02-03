<?php
/**
* 个性推送
*/
namespace App\Model;
use Common\Model\BaseModel;

use Common\Third\AppPage;

class JgpushModel extends BaseModel{
	
	
	
	//极光推送信息列表
	public function search(){
		$where = [];
		$map['user_id'] = I('post.user_id');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			//$data['page'] =  $page->myde_write();
		}
		$sql = 'SELECT jp_id from tzht_del_jgpush where user_id='.$map['user_id'];
		$limit = ($curpage - 1) * $showrow.','.$showrow;
		
		$data['data'] = $this->query('SELECT * from tzht_jgpush where id not in ('.$sql.') ORDER BY id desc LIMIT '.$limit);
		//p($this->getLastSql());die;
		return $data;	
		
		
	}
	
	//插入前
	public function _before_insert(&$data,$option){
		$data['addtime'] = time();

	}
	
	
	
	
}