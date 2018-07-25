<?php
/**
 * 企业资料统计
 */
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;

class DownloadstatsModel extends BaseModel{

	protected $tableName = 'Download_stats';
	
	public function search(){
		//搜索
		$where = array();
		$where['b.user_id'] = I('post.user_id');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->join('left join __DOWNLOAD__ b on b.id = a.down_id')
		->where($where)->group('a.down_id')->count();

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field(array("count(a.down_id)"=>"countstats",'b.title','a.down_id','c.companyname'))
		->join('left join __DOWNLOAD__ b on b.id = a.down_id
			left join __USER__ c on c.id = b.user_id
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('b.addtime desc')
		->group('a.down_id')
		->select();
		//p($data);
		//p($this->_Sql());
		
		return $data;
	}
	
	//谁下载
	public function downwho(){
		$where = [];
		$where['down_id'] = I('post.down_id');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->join('left join __USER__ b on b.id=a.user_id')
		->where($where)->group('a.user_id')->count();

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field(array('count(a.down_id)'=>'links','b.username,b.id,b.phone,b.nickname,b.companyname,b.logo'))
		->join('left join __USER__ b on b.id=a.user_id')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->group('a.user_id')
		->select();
		
		return $data;
		
	}



}