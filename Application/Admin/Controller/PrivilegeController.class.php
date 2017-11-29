<?php

/**
* 权限节点控制器
*/
namespace Admin\Controller;

class PrivilegeController extends CommonController {
   	private $pri = null;

   	//继承父类
   	public function _initialize(){
		parent::_initialize();
		
	 	$this->pri = D('Privilege');
	}
	//权限列表
    public function index(){
		$data = $this->pri->getTree();
		// p($data);
		$this->assign('data',$data);
        $this->display();
    }
	
	//添加权限
	public function add(){
		if (IS_POST) {
			if ($this->pri->create(I('post.',1))) {
				if ($this->pri->add()) {
					$this->ajaxReturn(1);
				}else{
					$this->ajaxReturn(0);
				}
			}
		}
		$parentData = $this->pri->getTree();
		//p($parentData);
		$this->assign('data',$parentData);

		$this->display();
	}

	//编辑权限
	public function edit(){
		$id = I('get.id');
		if(IS_POST){
			if($this->pri->create(I('post.',2))){
				if($id=$this->pri->save() !== FALSE){
				
					$this->ajaxReturn(1);
				}else{
					$this->error($this->pri->getError());
					$this->ajaxReturn(0);
				}
			}
		}
		$m = M('Privilege');
		$data = $m->find($id);
		$option = $this->pri->getTree();
		$this->assign(array(
			'option' => $option,
			'data' => $data
		));
		
		
		$this->display();



	}

	//删除权限
	public function delete(){
		$id = $_GET['id'] + 0;
		$pri = $this->pri->where('pid='.$id)->count();
		if($id){
			if($pri){
				$this->ajaxReturn(2);	//存在子类权限，不允许删除
			}else{
				$this->pri->where('id=' .$id)->delete();
			}
			$this->ajaxReturn(1); //删除成功
		}else{
			$this->error($this->pri->getError());
			$this->ajaxReturn(0);
		}
	}




}