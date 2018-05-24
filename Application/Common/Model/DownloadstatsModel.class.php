<?php
/**
 * 企业产品统计
 */
namespace Common\Model;
use Common\Model\BaseModel;

class DownloadstatsModel extends BaseModel{

	protected $tableName = 'Download_stats';
	
	public function search($pagesize=15){

		//搜索
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
		//翻页
		$count = $this->alias('a')->join('left join __DOWNLOAD__ b on b.id = a.down_id')
		->where($where)->group('a.down_id')->count();
		$page = new \Think\Page($count,$pagesize);
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$data['data'] = $this->alias('a')
		->field(array("count(a.down_id)"=>"countstats",'b.title','a.down_id'))
		->join('left join __DOWNLOAD__ b on b.id = a.down_id')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('b.addtime desc')
		->group('a.down_id')
		->select();
		//p($this->_Sql());
		
		
		return $data;
	}
	
	//谁下载
	public function downwho($pagesize=15){
		$where = [];
		$where['down_id'] = I('get.down_id');
		//翻页
		$count = $this->alias('a')->join('left join __USER__ b on b.id=a.user_id')
		->where($where)->group('a.user_id')->count();
		$page = new \Think\Page($count,$pagesize);
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$data['data'] = $this->alias('a')
		->field(array('count(a.down_id)'=>'links','b.username'))
		->join('left join __USER__ b on b.id=a.user_id')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->group('a.user_id')
		->select();
		
		return $data;
		
	}



}