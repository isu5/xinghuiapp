<?php
/**
 * 会议公告 *
 */

namespace Home\Controller;

class CompanybullController extends PublicController{
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Companybull'); 
	}
	
	
	//公告列表
	public function index(){
		$data = $this->model->searchFront();
		//p($data);
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}
	
	//单个信息
	public function showOne(){
		$id = I('get.id');
		
		$data = $this->model->where('id='.$id)->find();
		$this->assign('data',$data);
		$this->display();
	}
	
	
	//添加公告
	public function add(){
		
		if(IS_POST){
			
			if($this->model->create(I('post.',1))){
				if($this->model->add()){

					$this->success('添加成功',U('Companybull/index'));
					exit;
				}else{
					$this->error('添加失败');
				}
			}else{
				$this->error($this->model->getError());
			}
		}
		$this->display();
	}
	
	//删除公告
	public function delete(){
		$id = I('get.id',0);
		if($this->model->delete($id) !== FALSE){
			$code = array('status'=>'y','info'=>'公告删除成功');
		}else{
			$this->error($this->model->getError());
			$code = array('status'=>'n','info'=>'公告删除失败');
		}
		$this->ajaxReturn($code);
	}


}
