<?php
/**
* 获取单条会议
*/
namespace Wap\Controller;
use Org\Nx\Response;
class ConferenceController extends PublicController{
	
	public function _initialize(){
		parent::_initialize();
		$this->conf = D('Conference'); 
		
	}
	//分享单条会议页面
	public function getOne(){
		$res = $this->conf->showOne();
		
		$this->assign('data',$res['data']);
		$this->display();
	}
	
	
	
	
}