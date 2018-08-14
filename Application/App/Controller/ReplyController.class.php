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
	
	//提交用户回复
	public function add(){
		
		
		
	}
	
	
	


}
