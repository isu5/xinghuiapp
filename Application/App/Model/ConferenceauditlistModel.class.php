<?php
/**
*  我参加的待审核列表
*/
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;

class ConferenceauditlistModel extends BaseModel{
	//protected $tableName = 'conference_auditlist';
	protected $tableName = 'conference_auditlist';
	
	// 我要参加的 待审核列表 myauditlist
	
	public function myauditlist(){
		$where = array();
		$where['user_id'] = I('post.user_id'); 
		$status = I('post.status');
			switch ( $status ) {
			case 1:
			$where['status'] = 1;	//审核通过
			break;  
			case 2:
			$where['status'] = 2;	//审核拒绝
			break;
			case 3:
			$where['status'] = 3; 	//待审核（审核中）
			break;
			case 4:
			$where['status'] = 4;	//已扫码签到（参会中）
			break;
			case 5:
			$where['status'] = 5;	//会议已结束
			break;
			default:
			$where['status'] = 3;
		}
		
		
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}

		$data['data'] = $this ->alias('a')
		->field('a.*,b.*')
		->join('LEFT JOIN __CONFERENCE__ b on b.id=a.conf_id
		') 
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();
		//p($this->getLastSql());
		return $data;
	}
	
	
	
	
	
	
}