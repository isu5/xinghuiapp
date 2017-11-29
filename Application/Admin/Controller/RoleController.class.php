<?php
/**
 * 角色控制器
 */
namespace Admin\Controller;

class RoleController extends CommonController{

	private $role = Null;

	/**
	 * 继承父类
	 * @return [type] [description]
	 */
   	public function _initialize(){
		parent::_initialize();
		
	 	$this->role = D('Role');
	 	$this->pri = D('Privilege');
	}


	/**
	 * 角色列表
	 * @return [type] [description]
	 */
	public function index(){

		$data = $this->role->search();
		// p($data);
		$this->assign(array(
    		'data' => $data['data'],
    		'page' => $data['page'],
    	));
		$this->display();
	}

	/**
	 * 添加角色
	 */
	public function add(){
		if(IS_POST){
			if($this->role->create(I('post.',1))){
				if($id = $this->role->add()){
					$this->ajaxReturn(1);
				}else{
					$this->ajaxReturn(0);
				}
			}
		}
		//获取全部权限
		$pri = $this->pri->field('id,pid,pri_name')->order('id desc')->select();
		$priData = $this->getMenu($pri);

		//p($priData);
		$this->assign('priData',$priData);

		$this->display();


	}

	/**
	 * 编辑角色
	 * @return [type] [description]
	 */
	public function edit(){
		$id = I('get.id');
		if(IS_POST){
			if ($this->role->create(I('post.',2))) {
				if($id=$this->role->save() !== FALSE){
				
					$this->ajaxReturn(1);
				}else{
					$this->error($this->role->getError());
					$this->ajaxReturn(0);
				}
			}
		}

		//获取角色
		$data = $this->role->find($id);

		//获取当前角色的权限
		$pri = $this->pri->field('id,pid,pri_name')->order('id asc')->select();
		$priData = $this->getMenu($pri);
		//p($priData);
		//取出当前管理所有的权限id
		$priModel = D('pri_role');
		$pr = $priModel->field('GROUP_CONCAT(pri_id) pri_id')->where(array(
			'role_id' => array('eq',$id)
			))->find();
		$this->assign(array(
			'data' => $data,
			'priData' => $priData,
			'pr' => $pr['pri_id']
			));
		$this->display();
	} 

	/**
	 * [delete 角色删除]
	 * @return [type] [description]
	 */
	public function delete(){
		$id = I('get.id',0);
		if($this->role->delete($id) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->role->getError());
			$this->ajaxReturn(0);
		}

	}





}

