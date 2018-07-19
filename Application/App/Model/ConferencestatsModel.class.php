<?php
/**
*	会议
*/
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class ConferencestatsModel extends BaseModel{

	protected $tableName = 'Conference_stats';
	
	
	//会议产品统计
	public function countstats(){
		$where = [];
		
		$where['c.uid'] = I('post.uid');
		//翻页
		/* 
		select count(a.id),a.pro_id,b.title,c.title as ctitle from tzht_conference_stats a 
		left join tzht_conference_pic b on b.id = a.pro_id 
		left join tzht_conference c on c.id = a.conf_id group by a.pro_id;
		*/
		
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->join('
			left join __CONFERENCE_PIC__ b on b.id = a.pro_id
			left join __CONFERENCE__ c on c.id = a.conf_id
		')->where($where)->group('a.pro_id')->count();

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field(array("count(a.id)"=>"countstats",'a.pro_id','b.title','c.title'=>'ctitle'))
		->join('
			left join __CONFERENCE_PIC__ b on b.id = a.pro_id
			left join __CONFERENCE__ c on c.id = a.conf_id
		')	
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('b.addtime desc')
		->group('a.pro_id')
		->select();
		
		//p($this->_Sql());
		//p($data);
		
		return $data;
	}

	//会议产品谁点击统计
	public function countstatswho($pagesize=15){
		/*
		select a.username,count(b.user_id) from tzht_user a 
		left join tzht_conference_stats b on b.pro_id = 26 where a.id in 
		(select user_id from tzht_conference_stats where pro_id = 26);

		*/
		
		$where = [];
		$where['a.pro_id'] = I('post.pro_id');
		
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->join ('LEFT JOIN __USER__ b on b.id = a.user_id')->where($where)->group('a.user_id')->count();

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field(array('count(a.user_id)'=>'links','b.username'))
		->join ('LEFT JOIN __USER__ b on b.id = a.user_id')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->group('a.user_id')
		->select();
		/* $data['data'] = $this->query("select count(a.user_id) as links,b.username from 
		tzht_conference_stats a left join tzht_user b on b.id = a.user_id where a.pro_id = {$pro_id} group by a.user_id;
		)"); */
		
		//print_r($this->_Sql());
		return $data;
	}








}
?>