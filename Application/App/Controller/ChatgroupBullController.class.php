<?php
/**
 * 融云创建群组
 */

namespace App\Controller;
use Org\Nx\Response;

class ChatgroupBullController extends PublicController{
	
	private $model = null;
	private $user = null;
	public function _initialize(){
		parent::_initialize();
		$this->model = D('ChatgroupBull');
		$this->user = D('User');
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
				Response::show(402,$this->model->getError());
			}
		}
	}
	
	//获取群组公告内容
	public function bullcont(){
		$data['bulltitle'] = I('post.title');
		$res = $this->model->field('content,title,bulltitle,pic,file')->where(array('bulltitle'=>$data['bulltitle']))->find();
		
		if(IS_POST){
			if($res !== null){
				Response::show(200,'获取数据成功!',$res);
			}else{
				Response::show(401,'没有公告!');
			}
			
		}
		
	}
	
	

}
