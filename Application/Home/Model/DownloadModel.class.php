<?php
/**
*  企业资料
*/
namespace Home\Model;
use Common\Model\BaseModel;

class DownloadModel extends BaseModel{
	

	
	public function search($pagesize=15){
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
		$where['user_id'] = cookie(userid);
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}
	
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
		$data['user_id'] = cookie(userid);
		$data['downfile'] = json_encode($_POST['downfile'],JSON_UNESCAPED_UNICODE);
		

	}
	
	
	
	

}