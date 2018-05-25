<?php
/**
*	会议
*/
namespace Common\Model;
use Common\Model\BaseModel;

class ConferencedownModel extends BaseModel{

	protected $tableName = 'Conference_down';
	
	//会议资料统计
	public function downstats($pagesize=15){
		$where = [];
		$title = I('get.title');
		if ($title) {
			//按标题，公司主体搜索
			$where['_string'] = " ( b.title like '%$title%') ";
		}
		//翻页
		$count = $this->alias('a')->join('left join __CONFERENCE__ b on b.id = a.conf_id')
		->where($where)->group('b.title')->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$data['data'] = $this->alias('a')
		->field(array("count(a.filename)"=>"countstats",'b.title','a.conf_id'))
		->join('left join __CONFERENCE__ b on b.id = a.conf_id')	
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('b.id desc')
		->group('b.title')
		->select();
		
		//p($data);
		return $data;
		
		
	}
	
	//会议产品谁点击统计
	public function downstatswho($pagesize=15){
		
		/*
		select a.username,count(b.user_id) from tzht_user a 
		left join tzht_conference_stats b on b.pro_id = 26 where a.id in 
		(select user_id from tzht_conference_stats where pro_id = 26);

		*/
		
		$where = [];
		$where['conf_id'] = I('get.conf_id');
		
		//翻页
		$count = $this->alias('a')->join('left join __USER__ b on b.id = a.user_id')
		->group('a.user_id')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field(array('count(a.filename)'=>'links','b.username'))
		->join('left join __USER__ b on b.id = a.user_id')
		->where($where)
		->group('a.user_id')
		->select();
		//p($data);
		//print_r($this->_Sql());
		return $data;
	}








}
?>