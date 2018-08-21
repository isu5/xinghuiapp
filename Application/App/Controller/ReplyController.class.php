<?php
/**
 * 用户回复调查问卷 *
 */

namespace App\Controller;
use Org\Nx\Response;
class ReplyController extends PublicController{
	
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Reply'); 
	}
	
	//检测当前用户是否已经答过此问卷
	public function checkuser(){
		$data['user_id'] = I('post.user_id');
		$data['conf_id'] = I('post.conf_id');
		$data['port_id'] = I('post.port_id');
		$info = $this->model->where(['user_id'=>$data['user_id'],'conf_id'=>$data['conf_id'],'port_id'=>$data['port_id']])->find();
		if(IS_POST){
			if($info){
				Response::show(200,'已经回答过此问卷了!');
			}else{
				Response::show(401,'未回答!');
			}
		}
	}
	
	

}
