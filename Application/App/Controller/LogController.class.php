<?php
/**
 * 登陆日志 *
 */

namespace App\Controller;
use Org\Nx\Response;
class LogController extends PublicController{
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Log'); 
	}
	
	
	//
	public function index(){
		$data = $this->model->search();
		//p($data);
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$data = array(
			'result' => $data['data'],
			'page' => $data['page']
			);
		Response::show(200,'数据返回成功',$data);
	}
	
	//登陆日志
	public function add(){
		
		if(IS_POST){
			//p($_POST);die;
			
			if($this->model->create(I('post.',1))){
				if ($this->model->add()) {
					Response::show(200,'添加成功!');
				}else{
					Response::show(401,'登录失败');
				}
			}else{
				Response::show(402,'数据不合法',$this->model->getError());
			}
			
		}
	}
	
	


}
