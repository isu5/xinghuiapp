<?php
/**
 * 用户收藏会议 *
 */

namespace App\Controller;
use Org\Nx\Response;
class CollectionController extends PublicController{
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Collection'); 
	}
	
	
	//返回收藏状态
	public function collStatus(){
		$data['uid'] = I('post.uid');
		$data['cid'] = I('post.cid');
		
		$user = $this->model->where(array('uid'=>$data['uid'],'cid'=>$data['cid']))->find();
		if(IS_POST){
			if($user){
				$rest['is_att'] = 1;
				return Response::show(401,'您已收藏了该会议，请勿重复收藏!',$rest);
				
			}else{
				$rest['is_att'] = 0;
				return Response::show(200,'您未收藏该会议',$rest);
			}
		}
			
		
	}
	//收藏列表
	public function index(){
		$res = $this->model->search();
		//p($data);
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$data = array(
				'result' => $res['data'],
				
			);
		if( IS_POST ){	
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data );
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
	}
	
	//收藏会议
	public function add(){
		
		$conf = M('Conference');
		$data['uid'] = I('post.uid');
		$data['cid'] = I('post.cid');
		
		if(IS_POST){
			if($this->model->create()){
				$action = $this->model->where(array('uid'=>$data['uid'],'cid'=>$data['cid']))->find();
				if($action){
					return Response::show(401,'您已收藏了该会议，请勿重复收藏!');
					
				}else{
					if($this->model->add($data)){
				
					Response::show(200,'收藏成功!');
					
				
					}else{
						Response::show(201,'收藏失败!');
					}
				}
			}else{
				Response::show(402,$this->model->getError()); 
			}
		}
	}
	//取消收藏
	public function cancel(){
		
		$data['uid'] = I('post.uid');
		$data['cid'] = I('post.cid');
		if(IS_POST){
			if($this->model->create()){
				$user = $this->model->where(array('uid'=>$data['uid'],'cid'=>$data['cid']))->delete();
				if($user){
					return Response::show(200,'取消收藏成功!');
					
				}else{
					
					Response::show(401,'取消收藏失败!');
				}
			}else{
					
				Response::show(402,$this->model->getError()); 
			}
		}
		
	}
	
	


}
