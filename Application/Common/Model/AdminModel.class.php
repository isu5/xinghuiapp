<?php
/**
 * 管理员模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class AdminModel extends BaseModel{

	protected $insertFields = array('username','password','password2','email','remark','status','last_login_ip','last_login_time','login_count','role_id');

	protected $updateFields = array('id','username','password','password2','email','remark','status','last_login_ip','last_login_time','login_count','role_id');

	/**
	 * [serach 搜索]
	 * @return [type] [description]
	*/
	public function search($pagesize=15){
		//搜索
		$where = array();
		$username = I('get.name');
		if ($username) {
			$where['a.username'] = array('like',"%$username%");
		}
		//翻页
		$count = $this->alias('a')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		//取数据
		$data['data'] = $this->alias('a')
		->field('a.*,GROUP_CONCAT(c.role_name) role_name')
		->join('LEFT JOIN __ADMIN_ROLE__ b on a.id=b.admin_id
				LEFT JOIN __ROLE__ c on b.role_id = c.id
			')
		->where($where)
		->group('a.id')
		->limit($page->firstRow.','.$page->listRows)
		->select();
		p($this->getLastSql());
		return $data;
	} 

	/**
	 * 添加前 插入加密后的密码，登录时间，登录ip，登录次数
	 * @param  [type] $data   [description]
	 * @param  [type] $option [description]
	 * @return [type]         [description]
	 */
	protected function _before_insert(&$data, $option){
		$data['password'] = md5($data['password']);
		$data['last_login_time'] = time;
		$data['last_login_ip'] = get_client_ip();
		$data['login_count'] = $data['login_count'] + 1;
		
	}
	/**
	 * [_after_insert 添加角色id]
	 * @param  [type] $data   [description]
	 * @param  [type] $option [description]
	 * @return [type]         [description]
	 */
	protected function _after_insert($data,$option){
		$role_id = I('post.role_id');
		$roleModel = D('Admin_role');
		foreach ($role_id as $k => $v) {
			$roleModel->add(array(
				'admin_id'=> $data['id'],
				'role_id' => $v
				));
		}
	}

	/**
	 * [_before_update 修改之前]
	 * @param  [type] $data   [description]
	 * @param  [type] $option [description]
	 * @return [type]         [description]
	 */
	protected function _before_update(&$data,$option){
		//如果填写密码，则加密
		if($data['password']){
			$data['password'] = md5($data['password']);
		}else{
			//如果密码不填表示不修改密码
			unset($data['password']);   // 从表单中删除这个字段就不会修改这个字段了！！
		}
		
		//如果更改管理员角色
		$role_id = I('post.role_id');
		$arModel = D('Admin_role');
		//删除之前的角色id
		$arModel->where(array('admin_id'=>$option['where']['id']))->delete();

		foreach ($role_id as $v) {
			$arModel->add(array(
				'admin_id' => $option['where']['id'],
				'role_id' => $v 
			));
		}
	}

	/**
	 * 删除之前
	 * @param  [type] $option [description]
	 * @return [type]         [description]
	 */
	protected function _before_delete($option){
		//id 为1的不允许删除
		if($option['where']['id'] ==1){
			$this->error = '原始超级管理员不允许删除';
			return false;
		}
		$arModel = D('admin_role');
		//删除之前的角色id
		$arModel->where(array('admin_id' => $option['where']['id']))->delete();
		
	}


	








}