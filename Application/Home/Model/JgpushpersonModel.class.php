<?php
/**
*  极光个性会议推送 type=3
*/
namespace Home\Model;
use Common\Model\BaseModel;

class JgpushpersonModel extends BaseModel{
	
	
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
		$data['user_id'] =  I('get.user_id');
		$data['conf_id'] =  I('get.conf_id');
	
	}
	
	//发布之后推送所有用户信息
	public function _after_insert($data,$option){
		//
		$uid = I('get.user_id');
		$jpush = D('User')->where('id='.$uid)->find();
		if(!jgpushgx($jpush['jpush'],$data['title'],$data['content'])){
			$this->error = '该用户没有登录app客户端，不能推送';
		}
		
		
	}
	
	/**
	 * 所有数据
	 */
	public function searchFront($pagesize=10){
		
		//搜索
		$where = array();
		$where['conf_id'] = I('get.conf_id');
		$where['user_id'] = I('get.user_id');
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
		$data['data'] = $this		
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		//p($this->getLastSql());
		return $data;
	}
	
	
	
}