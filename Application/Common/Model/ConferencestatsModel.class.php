<?php
/**
*	会议
*/
namespace Common\Model;
use Common\Model\BaseModel;

class ConferencestatsModel extends BaseModel{

	protected $tableName = 'Conference_stats';
	
	//会议资料统计
	public function downstats($pagesize=15){
		/*
		select count(a.id),a.pro_id,b.title,c.title as ctitle from tzht_conference_stats a 
		left join tzht_conference_pic b on b.id = a.pro_id 
		left join tzht_conference c on c.id = a.conf_id group by a.pro_id;
		*/
		//翻页
		$count = $this->alias('a')->join('left join __CONFERENCE_DOWN__ b on b.conf_id = a.id')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$arr = $this->alias('a')
		->field(array("count(a.id)"=>"countstats",'a.title','b.filename','b.user_id'=>'uid'))
		->join('left join __CONFERENCE_DOWN__ b on b.conf_id = a.id')	
		->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->order('a.addtime desc')
		->group('b.user_id')->select();
		
		
		return $data;
		
		
	}
	
	
	//会议产品统计
	public function countstats($pagesize=15){
		$where = [];
		$title = I('get.title');
		if ($title) {
			//按标题，公司主体搜索
			$where['_string'] = "  ( c.title like '%$title%') ";
		}
		//翻页
		/* 
		select count(a.id),a.pro_id,b.title,c.title as ctitle from tzht_conference_stats a 
		left join tzht_conference_pic b on b.id = a.pro_id 
		left join tzht_conference c on c.id = a.conf_id group by a.pro_id;
		*/
		$count = $this->alias('a')->join('
			left join __CONFERENCE_PIC__ b on b.id = a.pro_id
			left join __CONFERENCE__ c on c.id = a.conf_id
		')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$data['data'] = $this->alias('a')
		->field(array("count(a.id)"=>"countstats",'a.pro_id','b.title','c.title'=>'ctitle'))
		->join('
			left join __CONFERENCE_PIC__ b on b.id = a.pro_id
			left join __CONFERENCE__ c on c.id = a.conf_id
		')	
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('b.addtime desc')
		->group('a.pro_id')
		->select();
		
		
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
		$where['a.pro_id'] = I('get.pro_id');
		$count = $this->alias('a')->join ('LEFT JOIN __USER__ b on b.id = a.user_id')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//翻页
		
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$data['data'] = $this->alias('a')
		->field(array('count(a.user_id)'=>'links','b.username'))
		->join ('LEFT JOIN __USER__ b on b.id = a.user_id')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
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