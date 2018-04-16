<?php
/**
*  个性推送
*/
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class JgpushpersonModel extends BaseModel{
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
		$data['user_id'] =  I('post.user_id');
		$data['conf_id'] =  I('post.conf_id');
		$data['title'] = I('post.title');
		$data['content'] = I('post.content');
	
	}
	
	//发布之后推送所有用户信息
	public function _after_insert($data,$option){
		//
		$uid = I('post.user_id');
		$jpush = D('User')->where('id='.$uid)->find();
		if(!jgpushgx($jpush['jpush'],$data['title'],$data['content'])){
			$this->error = '该用户没有登录app客户端，不能推送';
		}
		
		
	}
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
	//个人推送历史记录
	public function searchFront(){
		
		//搜索
		$where = array();
		$where['conf_id'] = I('post.conf_id');
		$where['user_id'] = I('post.user_id');
		
		//翻页
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
		//p($this->getLastSql());
		return $data;
	}



	
	
}