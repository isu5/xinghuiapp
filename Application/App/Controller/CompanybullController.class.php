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
		
	}
	//公告列表
	public function index(){
		$data =$this->model->search();
		
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$data = array(
			'result' => $data['data'],
			'page' => $data['page']
			);
			//p($data);die;
		if(!empty($data['result'])){
			
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
	
	
	


}
