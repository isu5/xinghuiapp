<?php
/**
 * 管理员控制器
 */
namespace Admin\Controller;

class AdminController extends CommonController{

	private $admin = null;
	private $role = null;
	private $ar = null;

	public function _initialize(){
		parent::_initialize();
		$this->admin = D('Admin');
		$this->role = D('Role');
		$this->ar = D('Admin_role');
	}

	//管理员列表
	public function index(){
		$data = $this->admin->search();
		//p($data);die;
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));

		$this->display();
	}

	//ajax 检测是否已有该注册名
	public function check_admin(){
		$name = $_POST['param'];
		
		$name = $this->admin->field('username')->where(array('username'=>$name))->find();
		if ($name) {
			$this->ajaxReturn(array('status'=>'n','info'=>"该用户已存在，请重新填写"));
			exit();
		}else{
			$this->ajaxReturn(array('status'=>'y','info'=>"该用户名可以放心使用"));
			exit();
		}
	}

	/**
	 * [add 添加管理员]
	 */
	public function add(){

		if (IS_POST) {
			
			if ($this->admin->create(I('post.',1))) {
				if ($this->admin->add()) {
					$this->ajaxReturn(array('status'=>1));
				}else{
					$this->error($this->admin->getError());
					$this->ajaxReturn(array('status'=>0));
				}


			}
		}
		//查询角色
		$roleData = $this->role->select();
		$this->assign('roleData',$roleData);

		$this->display();
	}

	/**
	 * [edit 编辑管理员]
	 * @return [type] [description]
	 */
	public function edit(){
		$id = I('get.id');
		if (IS_POST) {
			if ($this->admin->create(I('post.',2))) {
				if ($this->admin->save() !==FALSE) {
					$this->ajaxReturn(array('status'=>1));
				}else{
					$this->error($this->admin->getError());
					$this->ajaxReturn(array('status'=>0));
				}
			}
		}
		
		$data = $this->admin->where(array('id'=>$id))->find();
		//p($data);
		//获取角色
		$roleData = $this->role->select();
		//获取当前管理员的角色
		$roleId = $this->ar->field('role_id')->where(array('admin_id'=>$id))->find();
		
		$this->assign(array(
			'data' => $data,
			'roleData' => $roleData,
			'roleId' => $roleId['role_id']
			));
		$this->display();

	}

	/**
	 * [delete 删除管理员]
	 * @return [type] [description]
	 */
	public function delete(){
		
		if($this->admin->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->admin->getError());
			$this->ajaxReturn(0);
		}
	}

	/**
	 * [stop 禁用]
	 * @return [type] [description]
	 */
	public function stop(){
		$id = I('get.id');
		//把status 的值更新为0
		if($id == 1){
			$this->ajaxReturn(2);
		}
		$status = $this->admin->where('id='.$id)->setField('status',0);
		if ($status) {
			$this->ajaxReturn(1);
		}

	}

	public function start(){
		$id = I('get.id');
		//把status 的值更新为1
		$status = $this->admin->where('id='.$id)->setField('status',1);
		if ($status) {
			$this->ajaxReturn(1);
		}

	}
	
	
	//个人信息修改
	public function editAdmin(){
		$id = session('uid');
		$admin = M('Admin');
		$data['password'] = md5(I('post.password'));
		$map = $this->admin->field('id,username')->where(array('id'=>$id))->find();
		//p($map);
		if(IS_POST){
			
			if($admin->where(array('id'=>$id))->save($data)){
				
				$this->ajaxReturn(1);
			}else{
				$this->ajaxReturn(0);
			}
		}
		
		
		$this->assign(array(
			'id'=>$map['id'],
			'username'=>$map['username'],
			
		));
		
		$this->display();
		
		
	}
	
	
	



}