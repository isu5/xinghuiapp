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
	//公告点赞取消
	public function zancancel(){
		$data['user_id'] = I('post.user_id');
		$data['bull_id'] = I('post.bull_id');
		if(IS_POST){
			if($this->zan->create()){
				$user = $this->zan->where(array('user_id'=>$data['user_id'],'bull_id'=>$data['bull_id']))->delete();
				if($user){
					return Response::show(200,'取消收藏成功!');
					
				}else{
					
					Response::show(401,'取消收藏失败!');
				}
			}else{
					
				Response::show(402,$this->zan->getError()); 
			}
		}
	}
	
	//返回点赞状态
	public function zanStatus(){
		$data['user_id'] = I('post.user_id');
		$data['bull_id'] = I('post.bull_id');
		
		$user = $this->zan->where(array('user_id'=>$data['user_id'],'bull_id'=>$data['bull_id']))->find();
		$count = $this->zan->field(array("count(bull_id)"=>"zan"))->where(['bull_id'=>$data['bull_id']])->select();
		
		if(IS_POST){
			if($user){
				$rest['is_att'] = 1;
				$rest['count'] = $count;
				return Response::show(401,'您已点赞了该会议，请勿重复点赞!',$rest);
				
			}else{
				$rest['is_att'] = 0;
				$rest['count'] = $count;
				return Response::show(200,'您未点赞该会议',$rest);
			}
		}
			
		
	}
	
	


}
