<?php
/**
*  我参加的待审核列表
*/
namespace Home\Model;
use Common\Model\BaseModel;

class ConferenceauditlistModel extends BaseModel{
	//protected $tableName = 'conference_auditlist';
	protected $tableName = 'conference_auditlist';
	
	// 我要参加的 待审核列表 myauditlist
	
	public function myauditlist($pagesize = 15){
		$where = array();
		$where['user_id'] = cookie(userid); 
		$status = I('get.status');
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
		
		//p($this->_Sql());
		
		
		//翻页
		$count = $this->alias('a')->where($where)->join('LEFT JOIN __CONFERENCE__ b on b.id=a.conf_id
		') ->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();

		$data['data'] = $this ->alias('a')
		->field('a.*,b.*')
		->join('LEFT JOIN __CONFERENCE__ b on b.id=a.conf_id
		') 
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		//p($this->getLastSql());
		return $data;
	}
	
	
	
	
	
	
}