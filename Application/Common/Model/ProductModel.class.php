<?php
/**
 * 公告模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class ProductModel extends BaseModel{

	/**
	 *  翻页
	 */
	
	public function search($pagesize=15){

		//搜索
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
		$where['uid'] = cookie(userid);
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->select();
		return $data;
	}

	public function _before_insert(&$data,$option){
		
		$data['pic'] = json_encode(I('post.pic'));
		
		$data['addtime'] = time();
		$data['uid'] = cookie(userid);

	}



}