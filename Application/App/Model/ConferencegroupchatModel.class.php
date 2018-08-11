<?php
/**
 * 会议群组模型
 */
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class ConferencegroupchatModel extends BaseModel{

	protected $tableName = "Conference_groupchat";
	
	public function _before_insert(&$data,$option){
		$data['addtime'] = time();

	}

	//企业会议群组列表
	public function grouplist(){
		$where = [];
		$where['group_master'] = I('post.group_master');
		
		$showrow = 10; //一页显示的行数
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
		$total = $this->where($where)
		->count();	
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			//$data['page'] =  $page->myde_write();
		}
		$data['data'] = $this->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->select();
		//p($this->_Sql());
		return $data;
		
	}
	

}