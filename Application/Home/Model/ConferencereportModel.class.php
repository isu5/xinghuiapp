<?php
/**
*  ��ҵ����
*/
namespace Home\Model;
use Common\Model\BaseModel;

class ConferencereportModel extends BaseModel{
	
	protected $tableName = 'conference_report';
	
	protected $_auto = array ( 
		 array('addtime','time','','function'),
	);
	
	public function search($pagesize=15){
		$where = array();
		
		$where['user_id'] = cookie(userid);
		//��ҳ
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//���÷�ҳ
		$page->setConfig('prev', '��һҳ');
		$page->setConfig('next', '��һҳ');
		$data['page'] = $page->show();
		$data['data'] = $this
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}
	
	
	
}