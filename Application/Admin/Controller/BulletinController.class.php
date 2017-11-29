<?php

/**
 * 公告管理控制器
 */
namespace Admin\Controller;


class BulletinController extends CommonController{

	//系统
	private $bull = null;
	
	//继承父类
	public function _initialize(){
		parent::_initialize();
		$this->bull = D('Bulletin');
	}


	/**
	 * [index 公告列表]
	 * @return [type] [description]
	 */
	public function index(){

		$data = $this->bull->search();
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}

	/**
	 * [add 添加公告]
	 */
	public function add(){
		if(IS_POST){
			if($this->bull->create(I('post.',1))){
				if($this->bull->add()){
					$this->ajaxReturn(array('status'=>1));
				}else{
					$this->ajaxReturn(array('status'=>0));
				}
			}
		}

		$this->display();
	}

	/**
	 * [edit 编辑公告]
	 * @return [type] [description]
	 */
	public function edit(){
		$id = I('get.id');
		if (IS_POST) {
			if ($this->bull->create(I('post.',2))) {
				if ($this->bull->save() !==FALSE) {
					$this->ajaxReturn(array('status'=>1));
				}else{
					$this->error($this->bull->getError());
					$this->ajaxReturn(array('status'=>0));
				}
			}
		}

		$data = $this->bull->where(array('id' => $id))->find();
		$this->assign('data',$data);
		$this->display();
	}

	/**
	 * [delete 删除公告]
	 * @return [type] [description]
	 */
	public function delete(){
		if($this->bull->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->bull->getError());
			$this->ajaxReturn(0);
		}
	}

	/**
	 * [stop 下架公告]
	 * @return [type] [description]
	 */
	public function stop(){
		$id = I('get.id');
		//把status 的值更新为0
		$status = $this->bull->where('id='.$id)->setField('status',0);
		if ($status) {
			$this->ajaxReturn(1);
		}

	}

	public function start(){
		$id = I('get.id');
		//把status 的值更新为1
		$status = $this->bull->where('id='.$id)->setField('status',1);
		if ($status) {
			$this->ajaxReturn(1);
		}

	}


}