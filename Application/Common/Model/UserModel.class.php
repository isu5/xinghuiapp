<?php
/**
 * 会员模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class UserModel extends BaseModel{

	/**
	* 后台调用方法 搜索
	*/
	public function search($pagesize=15){
		//搜索
		$where = array();
		$username = I('get.username');
		if ($username) {
			$where['username'] = array('like',"%$username%");
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


}