<?php
/**
 * 企业个人公告详情 *
 */

namespace App\Controller;
use Org\Nx\Response;
class CompanybullController extends PublicController{
	private $model = null;
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Companybull'); 
		$this->zan = D('Companybullzan'); 
		
	}
	//公告列表
	public function index(){
		$data =$this->model->search();
		/*
		p($data);die; 
		p($this->model->getlastsql());
    	 */
		$data = array(
			'result' => $data['data'],
			//'page' => $data['page']
			);
			
		if($data['result'][0]['id'] != null){
			
			Response::show(200,'数据返回成功',$data);
		}else{
			Response::show(401,'没有数据');
		}
	}
	
	//添加公告
	public function add(){
		if (IS_POST) {
			
			if($this->model->create(I('post.',1))){
				if($this->model->add()){
					//p($_FILES);die;
					Response::show(200,'添加成功!');
					
				}else{
					Response::show(401,'添加失败!');
				}
			}else{
				Response::show(402,'添加数据不合法!',$this->model->getError());
			}

		}
	}
	
	//获取群组公告内容
	public function bullcont(){
		$data['title'] = I('post.title');
		$res = $this->model->field('content,bulltitle,pic,file')->where(array('title'=>$data['title']))->find();
		
		if(IS_POST){
			if($res !== null){
				Response::show(200,'获取数据成功!',$res);
			}else{
				Response::show(401,'没有公告!');
			}
			
		}
		
	}
	
	//公告点赞
	public function bullzan(){
		if (IS_POST) {
			
			if($this->zan->create(I('post.',1))){
				if($this->zan->add()){
					//p($_FILES);die;
					Response::show(200,'添加成功!');
					
				}else{
					Response::show(401,'添加失败!');
				}
			}else{
				Response::show(402,'添加数据不合法!',$this->zan->getError());
			}

		}
	}
	
	//点赞统计
	public function zanstats(){
		$data = $this->model->zanstats();
		if(IS_POST){
			if($data !== null){
				Response::show(200,'获取数据成功!',$data);
			}else{
				Response::show(401,'没有公告!');
			}
			
		}
	}
	
	


}
