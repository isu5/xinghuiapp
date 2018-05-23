<?php
/**
* 会议管理
*/
namespace Admin\Controller;

class ConferenceController extends CommonController{
	private $cate = null;
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Conference');
		$this->cate = D('Conferencecate');
		$this->stats = D('Conferencestats');
		$this->down = D('Conferencedown');

	}
	//所有会议列表
	public function index(){
		$data = $this->model->search();
    	//p($data);
		$cate = $this->cate->select();
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page'],
			'cate' => $cate
			));


		$this->display();
	}
	
	//会议栏目
	public function cate(){
		
		$data = $this->cate->search();
    	//p($data);
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		//p($data);
		
		$this->display();
	}
	
	
	//添加栏目
	public function add(){
		if(IS_POST){
			if($this->cate->create(I('post.',1))){
				if($this->cate->add()){
					$code = 1; //添加成功
				}else{
					$code = 2; //添加失败
				}
			}else{
				$code = 0;//添加失败
			}
			$this->ajaxReturn($code); 
			exit;
		}
		$data = $this->cate->getTree();
		$this->assign('data',$data);
		$this->display();
	}
	
	//编辑栏目
	public function editCate(){
		$id = I('get.id', 0);
		
		if(IS_POST){
			p($_POST);die;
			if($this->cate->create(I('post.',2))){
				if($this->cate->save() !==FALSE){
					$this->ajaxReturn(1); //添加成功
				}else{
					$this->ajaxReturn(0); //添加失败
				}
			}else{
				$this->error($this->cate->getError());//添加失败
			}
			
		}
		$cate = $this->cate->getTree();
		$data = $this->cate->where(array('id'=>$id))->find();
		$this->assign(array(
			'data' => $data,
			'cate' => $cate,
			));
		$this->display();
	}
	//删除会议
	public function delete(){
		if($this->model->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->model->getError());
			$this->ajaxReturn(0);
		}
	}
	//删除栏目
	public function cateDelete(){
		if($this->cate->delete(I('get.id', 0)) !== FALSE){
			$this->ajaxReturn(1);
		}else{
			$this->error($this->cate->getError());
			$this->ajaxReturn(0);
		}
	}
	
	
	// 会议资料下载统计
	public function countdown(){
		$data = $this->down->downstats();
		//p($data);
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
		));
        $this->display();
	}
	// 会议资料下载统计
	public function countdownwho(){
		$data = $this->down->downstatswho();
		
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
		));
        $this->display();
	}
	
	
	
	//会议产品点击统计
	public function countstats(){
		$data = $this->stats->countstats();
		//p($data['data']);
		//p($data);
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
		));
        $this->display();
	}
	//会议产品谁点击统计
	
	public function countstatswho(){
		
		$data = $this->stats->countstatswho();
		//p($data['data']);
		//p($data);
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
		));
        $this->display();
	}
	
	
	
	
	
}