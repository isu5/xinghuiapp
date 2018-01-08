<?php
/**
*  我发布的 人员审核列表
*/
namespace App\Model;
use Common\Model\BaseModel;

use Common\Third\AppPage;

class ConferenceauditModel extends BaseModel{
	//protected $tableName = 'conference_auditlist';
	protected $tableName = 'conference_audit';
	
	
	//我发布的参会人员列表
	public function myauditPartici(){
		$where = [];
		$where['conf_id'] = I('post.conf_id');
		$where['status'] = 3;
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
 
		$data['data'] = $this->alias('a')
		->field('a.*,b.*')
		->join('LEFT JOIN __USER__ b on b.id=a.user_id
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();

		return $data;	
		
		
	}
	
	//融云参会人员列表
	
	public function rongImAuditList(){
		$where = [];
		$where['conf_id'] = I('post.conf_id');
		$data['data'] = $this->alias('a')
		->field('a.conf_id,b.id,b.companyname,b.username,b.logo,b.type')
		->join('LEFT JOIN __USER__ b on b.id=a.user_id
		')
		->where($where)
		->order('id desc')
		->select();

		return $data;	
		
		
	}
	
	//检测当前用户是否参会
	public function attendConf(){
		$where = [];
		$where['conf_id'] = I('post.conf_id');
		$where['user_id'] = I('post.user_id');
		
		$data['data'] = $this->where($where)->find();
		return $data;
		
	}
	
	
	//已审核人员列表
	public function audited(){
		$condition = [];
		$condition['conf_id'] = I('post.conf_id');
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
		$condition['_string'] = 'status=1 OR status=4';
		$total = $this->alias('a')->where($condition)->count();	


		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }

		$data['data'] = $this->alias('a')
		->field('b.id,b.logo,b.companyname,b.username,b.phone,b.type')
		->join('LEFT JOIN __USER__ b on b.id=a.user_id
		')
		->where($condition)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->group('id')
		->select();
		//p($this->_Sql());die;
		return $data;	
	}
	
	
	
	
	
}