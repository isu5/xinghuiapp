<?php
/**
*  企业个人公告模型
*/
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class CompanybullModel extends BaseModel{
	
	protected $tableName = 'company_bull';
	
	public function search(){
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
		$where['user_id'] = I('post.user_id');
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		$data['data'] = $this
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();
		
		return $data;
	}
	
	
	//添加前
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
		$data['user_id'] = I('post.user_id');
		$data['pic'] = json_encode(app_upload_image('/Uploads/Companybull'));
		$data['file'] = json_encode(app_upload_file('/Uploads/Companybull/file'));
	}
	
	//
	public function _after_insert($data,$option){
		
		
	}
	
	
	
	
	
	
	
	
	
	

}