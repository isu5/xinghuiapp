<?php
/**
 * 角色模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class RoleModel extends BaseModel{
	
	protected $insertFields = array('role_name','remark','status');
	protected $updateFields = array('id','role_name','remark','status');

	/**
	 * *********************************** 搜索方法 ************************************
	 * @param  integer $pageSize [description]
	 * @return [type]            [description]
	 */
	public function search($pageSize = 20){
		
		$where = array();
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count, $pageSize);
		//配置样式
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		/*************************** 取数据 ********************/
		$data['data'] = $this->alias('a')
		->field('a.*,GROUP_CONCAT(c.pri_name) pri_name')
		->join('LEFT JOIN __PRI_ROLE__ b ON a.id=b.role_id 
				LEFT JOIN __PRIVILEGE__ c ON  b.pri_id = c.id
				')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->group('a.id')
		->select();
		return $data;
	}


	//增加前在中间表插入权限id
	protected function _after_insert(&$data,$option){
		$pri_id = I('post.pri_id');
		$prModel = M('pri_role');
		foreach ($pri_id as $k => $v) {
			$prModel->add(array(
				'pri_id' => $v,
				'role_id' => $data['id']
				));
		}
	}

	//修改前 处理权限id
	protected function _before_update(&$data,$option){
		
		$pri_id = I('post.pri_id');
		$prModel = D('pri_role');
		$prModel->where(array('role_id'=>array('eq',$option['where']['id'])))->delete();
		foreach ($pri_id as $k => $v) {
			$prModel->add(array(
				'pri_id' => $v,
				'role_id' => $option['where']['id']
				));
		}
	}

	/**
	 * 删除之前
	 * @return [type] [description]
	 */
	protected function _before_delete($option){
		//如果该角色下还有管理员，则不允许删除，删除的话，先删除管理员

		if($option['where']['id'] == 1){
			$this->error = '原始超级管理员角色不允许删除';
			return false;
		}

		//从中间表把相关权限删除
		$pri_id = I('post.pri_id');
		$prModel = D('pri_role');
		$prModel->where(array('role_id'=>array('eq',$option['where']['id'])))->delete();
		$arModel = D('admin_role');
		$arModel->where(array(
		'role_id'=>array('eq',$option['where']['id'])
		))->delete();
	}



	
}
