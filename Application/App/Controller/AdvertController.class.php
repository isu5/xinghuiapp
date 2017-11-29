<?php
/**
 * 会议公告详情 *
 */

namespace App\Controller;
use Org\Nx\Response;
class AdvertController extends PublicController{
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Advert'); 
	}
	
	
	//公告列表
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
	
	


}
