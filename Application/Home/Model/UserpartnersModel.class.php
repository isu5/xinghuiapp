<?php
/**
*  合作伙伴
*/
namespace Home\Model;
use Common\Model\BaseModel;
use Common\Third\ajaxPage;

class UserpartnersModel extends BaseModel{
	//表名
	protected $tableName = 'user_partners';
	
	protected $_validate=array(
		
		array('phone','','手机号已经存在！请重新提交！',0,'unique',1), // 在新增的时候验证name字段是否唯一
		array('email','','邮箱已经存在!请重新提交！',0,'unique',1), // 在新增的时候验证name字段是否唯一
	
	);
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['ctime'] = time();
		$data['utime'] = time();
		
		$data['logo'] = I('post.logo');
	
	}
	
	//搜索合作伙伴
	public function search($pagesize=15){
		$where = array();
		$companyname = I('get.companyname');
		if ($companyname) {
			$where['companyname'] = array('like',"%$companyname%");
		}
		
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field('a.*,b.title')
		->join('
			LEFT JOIN __CONFERENCE__ b on b.id=a.conf_id
			')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}
	//搜索用户
	public function searchUser($pagesize=3){
		$user = D('User');
		$where = array();
		$companyname = I('get.companyname');
		if ($companyname) {
			$where['companyname'] = array('like',"%$companyname%");
		}
		//企业
		$where['type']=2;
		
		/* //翻页
		$showrow = 3; //一页显示的行数
		
		$curpage = I('get.page',1);; //当前的页,还应该处理非数字的情况
	
		$total = $user->where($where)->count();	
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 } */
		$total = $user->where($where)->count();
		$page = new ajaxPage($total,$pagesize);
		$data['page'] = $page->fpage();
		 
		$data['data'] = $user
		->field('id,companyname,phone,email,address,logo,area,website,profile')
		->where($where)
		->limit($page->limit)
		->order('id desc')
		->select();
		
		return $data;
	}
	
	
	
	
}