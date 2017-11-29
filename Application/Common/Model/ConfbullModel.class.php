<?php
/**
*	会议
*/
namespace Common\Model;
use Common\Model\BaseModel;

class ConfbullModel extends BaseModel{

	protected $tableName = 'Conference_bull';
	/**
	 * 搜索数据
	 */
	public function searchFront($pagesize=15){
		
		//搜索
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
		$where['user_id'] = cookie(userid);
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field('a.*,b.title as conftitle')
		->join('
			LEFT JOIN __CONFERENCE__ b on b.id=a.conf_id
			')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}
	
	//
	
	public function _before_insert(&$data, $option){
		
		$data['user_id'] = cookie(userid);
		$data['addtime'] = time();
		$data['content'] = htmlspecialchars_decode($_POST['content']);

		
	}









}
?>