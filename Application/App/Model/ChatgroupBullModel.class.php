<?php
/**
 * 通讯录融云群组模型
 */
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class ChatgroupBullModel extends BaseModel{
	protected $tableName = 'Chatgroup_bull';
	
	//添加前
	public function _before_insert(&$data, $option){
		
		$data['addtime'] = time();
		$data['title'] = I('post.title');
		$data['bulltitle'] = I('post.bulltitle');
		$data['user_id'] = I('post.user_id');
		$data['rongid'] = I('post.rongid');
		$data['pic']  =  json_encode(app_upload_image('/Uploads/Companybull'));
		//$data['pic']  =  '/Uploads/Companybull/2017-12-01/5a20ce89b28a2.jpg';
		$data['file'] = json_encode(app_upload_bull('/Uploads/Companybull/file'),JSON_UNESCAPED_UNICODE);
		
	}
	
	//获取列表
	public function chatList(){
		$where = array();
		$where['rongid'] = I('post.rongid');
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


}