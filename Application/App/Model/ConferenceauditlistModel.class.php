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
		//所有的公开会议
		$where['is_private'] = 0;
		
		//$status = I('post.status');
			//$data = $this->where(array('user_id'=>$where['user_id']))->select();
			//p($data['status']);
			/* switch ( $data['status'] ) {
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
		} */
		
		 
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			//$data['page'] =  $page->myde_write();
		}
		
		/*
		 
		$sql = $m->where(array('user_id'=>$where['user_id']))->buildSql(); ;
		$data['data'] = $this ->alias('a')
		->field('a.status,b.id,b.title,b.ctime,b.etime,b.qtime,b.address,b.xxaddress,b.is_user,b.is_private,b.companypic')
		->join('LEFT JOIN __CONFERENCE__ b on b.id=a.conf_id
		') 
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')->table($sql)
		->select();
		*/
		$sql = 'SELECT conf_id FROM tzht_conference_del WHERE user_id = '.$where['user_id'];
		$limit = ($curpage - 1) * $showrow.','.$showrow;
		$data['data'] = $this->query('SELECT a.status,b.id,b.title,b.ctime,b.etime,b.qtime,b.address,b.xxaddress,b.is_user,b.is_private,b.companypic FROM tzht_conference_auditlist a
 LEFT JOIN tzht_conference b on b.id=a.conf_id 
WHERE user_id='.$where['user_id'].' and is_private ='.$where['is_private'].' and  a.conf_id not in ('.$sql.') ORDER BY id desc LIMIT '.$limit);
		
		//p($this->_Sql());die;
		return $data;
	}
	
	
	//二级账户显示主账户的内部会议列表
	public function privateConfList(){
		$data['uid'] = I('post.uid');
		$user = D('User');
		$map = $user->field('id,pid')->where(array('id'=>$data['uid']))->find();
		//p($map);
		//内部私密会议
		$where['is_private'] = 1 ;
		//会议状态 0开始1结束
		$state = I('post.state');
		switch ( $state ) {
			case 1:
			$where['statuses'] =  array('eq',1);
			break;  
			case 0:
			$where['statuses'] =  array('eq',0);
			break;		
			default:
			
		}
		
		$where['uid'] = $map['pid'];
		
		
		$showrow = 10; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		$total = $this->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			//$data['page'] =  $page->myde_write();
		}
		
		$sql = 'SELECT conf_id FROM tzht_conference_del WHERE user_id = '.$data['uid'];
		$limit = ($curpage - 1) * $showrow.','.$showrow;
			
		$data['data'] = $this->query('SELECT a.status,b.id,b.title,b.ctime,b.etime,b.qtime,b.address,b.xxaddress,b.is_user,b.is_private,b.companypic FROM tzht_conference_auditlist a
 LEFT JOIN tzht_conference b on b.id=a.conf_id 
WHERE uid='.$where['uid'].' and is_private =1 and  a.conf_id not in ('.$sql.') ORDER BY id desc LIMIT '.$limit);
			
		//p($this->_Sql());die;
		return $data;
		
		
	}
	
	
	
	
	
}