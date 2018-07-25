<?php
/**
*	会议
*/
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class ConferencedownModel extends BaseModel{

	protected $tableName = 'Conference_down';
	
	//会议资料统计
	public function downstats(){
		$where = [];
		
		$where['b.uid'] = I('post.uid');
		
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->join('left join __CONFERENCE__ b on b.id = a.conf_id')
		->where($where)->group('b.title')->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		$data['data'] = $this->alias('a')
		->field(array("count(a.filename)"=>"countstats",'b.title','a.conf_id'))
		->join('left join __CONFERENCE__ b on b.id = a.conf_id')	
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('b.id desc')
		->group('b.title')
		->select();
		//p($this->_Sql());
		//p($data);
		return $data;
		
		
	}
	//会议资料谁点击统计
	public function downstatswho(){
		
		/*
		select a.username,count(b.user_id) from tzht_user a 
		left join tzht_conference_stats b on b.pro_id = 26 where a.id in 
		(select user_id from tzht_conference_stats where pro_id = 26);

		*/
		
		$where = [];
		$where['conf_id'] = I('post.conf_id');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total =  $this->alias('a')->join('left join __USER__ b on b.id = a.user_id')
		->group('a.user_id')->where($where)->count();

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field(array('count(a.filename)'=>'links','b.username,b.id,b.phone,b.nickname,b.companyname,b.logo,c.is_cert'))
		->join('left join __USER__ b on b.id = a.user_id
			left join __CERTIFY__ c on c.uid = b.id
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->group('a.user_id')
		->select();
		//p($data);
		//print_r($this->_Sql());
		return $data;
	}





}
?>