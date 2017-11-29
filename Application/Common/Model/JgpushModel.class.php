<?php
/**
 * 公告模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class JgpushModel extends BaseModel{
	
	
	
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
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
	
	}
	
	//发布之后推送所有用户信息
	public function _after_insert($data,$option){
		//
		jgpushAll($data['title'],$data['content'],$type="1");
		
	}

}