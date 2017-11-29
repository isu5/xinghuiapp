<?php

/**
 * 广告管理控制器
 */
namespace Admin\Controller;


class AdvertController extends CommonController{

	//系统
	private $ad = null;
	
	//继承父类
	public function _initialize(){
		parent::_initialize();
		$this->ad = D('Advert');
	}


	/**
	 * [index 广告列表]
	 * @return [type] [description]
	 */
	public function index(){

		$data = $this->ad->search();
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}

	/**
	 * [add 添加广告]
	 */
	public function add(){
		if(IS_POST){
			// p($_POST);
			// p($_FILES);die;
			if($this->ad->create(I('post.',1))){
				if($this->ad->add()){
					$this->success('添加成功',U('index'));
					exit;
				}else{
					$this->error($this->ad->getError());
					
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
			if ($this->ad->create(I('post.',2))) {
				if ($this->ad->save() !==FALSE) {
					$this->success('修改成功',U('index'));
					exit;
				}else{
					$this->error($this->ad->getError());
					
				}
			}
		}

		$data = $this->ad->where(array('id' => $id))->find();
		$this->assign('data',$data);
		$this->display();
	}

	/**
	 * [delete 删除广告]
	 * @return [type] [description]
	 */
	public function delete(){
		if($this->ad->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->ad->getError());
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
		$status = $this->ad->where('id='.$id)->setField('status',0);
		if ($status) {
			$this->ajaxReturn(1);
		}

	}

	public function start(){
		$id = I('get.id');
		//把status 的值更新为1
		$status = $this->ad->where('id='.$id)->setField('status',1);
		if ($status) {
			$this->ajaxReturn(1);
		}

	}


}