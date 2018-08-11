<?php
/**
 * 会议群组模型
 */
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
use Common\Third\RongCloud;
class ConferencegroupchatcenterModel extends BaseModel{

	protected $tableName = "Conference_groupchat_center";
	
	
	//群组成员
	public function groupmember(){
		$showrow = 10; //一页显示的行数
		$where['a.group_id'] = I('post.group_id');
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		$total = $this->alias('a')->field('u.id,u.username,u.companyname,u.logo')
		->join('left join __USER__ u on u.id=a.user_id
			left join __CONFERENCE_GROUPCHAT__ g on g.group_id=a.group_id
			left join __USER__ c on c.id=g.user_id
		')->where($where)
		->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			//$data['page'] =  $page->myde_write();
		}
		$data['data']= $this->alias('a')
		->field('u.id,u.username,u.companyname,u.logo,u.type,u.level,u.nickname,c.is_cert')
		->join('left join __USER__ u on u.id=a.user_id
			left join __CONFERENCE_GROUPCHAT__ g on g.group_id=a.group_id
			left join  __CERTIFY__ c on c.uid=u.id
			
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->select();
		//print_r($this->_Sql());
		$data['totalsize']=$total;
		return $data;
		
	}
	
	
	public function _before_insert(&$data,$option){
		$data['addtime'] = time();

	}



}