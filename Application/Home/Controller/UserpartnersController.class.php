<?php
/**
* 合作伙伴
*/
namespace Home\Controller;
use Org\Nx\Response;
class UserpartnersController extends PublicController{
	private $part = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->part = D('Userpartners');
		$this->conf = D('Conference'); 
		$this->user = D('User'); 
		
	}
	//合作伙伴列表
	public function index(){
		$data = $this->part->search();
		//p($data);
    	//p($this->part->getlastsql());
    	
    	//p($_COOKIE);die;
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
	}
	//用合作伙伴中选取
	public function partList(){
		$data = $this->part->partList();
		//p($data);
    	//p($this->part->getlastsql());
    	
    	//p($_COOKIE);die;
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
		
	}
	
	
	
	//添加
	public function add(){
		
		
		$id = I('get.id');
		$count = $this->part->where(array('conf_id'=>$id))->count();

		if(IS_POST){
			
			if (C('PARTNERS_NUM') > $count) {
				if($this->part->create(I('post.',1))){
				
					if($this->part->add()){
						$code = array('status'=>1,'info'=>'添加成功');
					
					}else{
						$code = array('status'=>0,'info'=>'添加失败');
					
					}
				}else{
					$code = array('status'=>3,'info'=>$this->part->getError());
					
				}
				
			}else{
				$code = array('status'=>2,'info'=>'您添加的合作伙伴已达限额了，如需再添加请联系平台！客服电话：010-63942568');
					
			}	
			
			
			$this->ajaxReturn($code);
		}
		
		$this->display();
	}
	//搜索用户表中的用户
	public function searchUser(){
		if(IS_AJAX){
			$data = $this->part->searchUser();
			$code = array('data'=>$data['data'],'page'=>$data['page']);
			//p($data);
			echo json_encode($code);
		}
	}
	
	//搜索后的用户直接提交到数据库
	public function sendData(){
		$data['user_id'] = I('post.user_id');
		$data['conf_user_id'] = cookie(userid);
		
		$map = $this->part->where(array('user_id'=>$data['user_id'],'conf_user_id'=>cookie(userid)))->find();
		if(IS_POST){
			//p($data);
			if($map){
				$code = array('status'=>2,'info'=>'您已添加过该公司，请勿重复添加!');
			}else{
				
				if($this->part->create(I('post.',1))){
					
					if($this->part->add($data)){
						$code = array('status'=>1,'info'=>'添加成功');
					
					}else{
						$code = array('status'=>0,'info'=>'添加失败');
					
					}
				}else{
					$code = array('status'=>3,'info'=>$this->part->getError());
					
				}
			}
			$this->ajaxReturn($code);
		}
	}
	
	
	//删除
	public function delete(){
		$id = I('get.id',0);
		if($this->part->delete($id) !== FALSE){
			$code = array('status'=>'y','info'=>'删除成功');
		}else{
			$this->error($this->part->getError());
			$code = array('status'=>'n','info'=>'删除失败');
		}
		$this->ajaxReturn($code);
	}
	

}