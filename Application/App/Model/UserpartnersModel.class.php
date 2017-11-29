<?php
/**
*  合作伙伴
*/
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class UserpartnersModel extends BaseModel{
	//表名
	protected $tableName = 'user_partners';
	
	//列表
	public function searchUser(){
		$where = [];
		$where['conf_id'] = I('post.conf_id');
		
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况


		$total = $this->where($where)->count();	


		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }

		$data['data'] = $this
		->field('id,companyname,phone,email,address,logo,area,website,profile')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();

		return $data;	
	}
	
	//详情
	public function searchOneUser(){
		$where = [];
		$where['id'] = I('post.id');
		$data['data'] = $this
		->field('id,companyname,phone,email,address,logo,area,website,profile')
		->where($where)
		->order('id desc')
		->find();

		return $data;	
	}
	
	
	
	
	
	
}