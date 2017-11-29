<?php
/**
*	会议
*/
namespace Common\Model;
use Common\Model\BaseModel;

class ConferenceModel extends BaseModel{

	
	
	/**
	 * 后台数据
	 */
	public function search($pagesize=15){

		//搜索
		$where = array();
		
		$title = I('get.title');
		if ($title) {
			$where['a.title'] = array('like',"%$title%");
		}
		//翻页
		$count = $this->alias('a')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field('a.*,b.username,c.catename')
		->join('LEFT JOIN __USER__ b ON a.uid=b.id
			LEFT JOIN __CONFERENCE_CATE__ c on c.id=a.cid
		')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}





}
?>