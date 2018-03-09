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
		$data['pic']  =  json_encode(app_upload_image('/Uploads/Companybull'));
		//$data['pic']  =  '/Uploads/Companybull/2017-12-01/5a20ce89b28a2.jpg';
		$data['file'] = json_encode(app_upload_bull('/Uploads/Companybull/file'),JSON_UNESCAPED_UNICODE);
		
	}



}