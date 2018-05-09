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
		$where['b.conf_id'] = I('post.conf_id');
		$part_id = M('Conference')->where(array('id'=>I('post.conf_id')))->getField('part_id');
		if($part_id){
			$where['a.id'] = array('in' , $part_id);
		}
		
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->join('
			left join __USER_PART__ b on b.user_id = a.conf_user_id
			LEFT JOIN __USER__ c on c.id=a.user_id
			')->where($where)->count();

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
			
		$data['data'] = $this->alias('a')
		->field('a.*,b.conf_id,c.companyname as company,c.phone as iphone,c.address as dizhi,c.area as xxdizhi,c.email,c.logo as userlogo,c.website,c.profile,c.type')
		->join('
			left join __USER_PART__ b on b.user_id = a.conf_user_id
			LEFT JOIN __USER__ c on c.id=a.user_id
			')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();
		//print_r($this->_Sql());
		return $data;	
	}
	
	//详情
	public function searchOneUser(){
		$where = [];
		$where['id'] = I('post.id');
		$data['data'] = $this
		->field('id,companyname,phone,email,address,logo,area,website,profile,type')
		->where($where)
		->order('id desc')
		->find();

		return $data;	
	}
	
	
	
	
	
	
}