<?php
/**
*	会议
*/
namespace Common\Model;
use Common\Model\BaseModel;

class ConferencecateModel extends BaseModel{

	protected $tableName = 'Conference_cate';
	/**
	 * 搜索数据
	 */
	public function search($pagesize=15){
		
		//搜索
		$where = array();
		$title = I('get.catename');
		if ($title) {
			$where['catename'] = array('like',"%$catename%");
		}
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id asc')
		->select();
		
		return $data;
	}
	










}
?>