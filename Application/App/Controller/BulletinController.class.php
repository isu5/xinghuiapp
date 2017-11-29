<?php
/**
 * 会议公告详情 *
 */

namespace App\Controller;
use Org\Nx\Response;
class BulletinController extends PublicController{
	
	//公告列表
	public function index(){
		$data =D('Bulletin')->search();
		
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$data = array(
			'result' => $data['data'],
			'page' => $data['page']
			);
			//p($data);die;
		if($data['result'] !== null ){
			
			Response::show(200,'数据返回成功',$data);
		}else{
			Response::show(401,'数据返回失败');
		}
	}
	
	


}
