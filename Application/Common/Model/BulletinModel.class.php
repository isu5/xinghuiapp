<?php
/**
 * 公告模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class BulletinModel extends BaseModel{

	private $insertFields = array('title','content','author','click','status');
	private $updateFields = array('id','title','content','author','click','status');

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
		$data['addtime'] = time();
		$data['content'] = htmlspecialchars_decode($_POST['content']);

	}



}