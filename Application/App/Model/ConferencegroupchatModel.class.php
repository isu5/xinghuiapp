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



}