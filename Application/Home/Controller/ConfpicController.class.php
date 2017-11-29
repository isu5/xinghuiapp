<?php
/**
 * 会议图片详情 *
 */

namespace Home\Controller;

class ConfpicController extends PublicController{
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Confpic'); 
	}
	
	
	//会议图片详情列表
	public function index(){
		$data = $this->model->searchFront();
		//p($data);die;
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}
	
	//添加会议图片详情
	public function add(){
		
		if(IS_POST){
			
			if($this->model->create(I('post.',1))){
				if($this->model->add()){

					$this->success('添加成功',U('Confpic/index'));
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
	
	//删除会议图片详情
	public function delete(){
		$id = I('get.id',0);
		if($this->model->delete($id) !== FALSE){
			$code = array('status'=>'y','info'=>'会议图片删除成功');
		}else{
			$this->error($this->model->getError());
			$code = array('status'=>'n','info'=>'会议图片删除失败');
		}
		$this->ajaxReturn($code);
	}

}
