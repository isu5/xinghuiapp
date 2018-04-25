<?php

namespace Home\Controller;
use Think\Controller;
class PublicController extends Controller{

	public function _initialize(){
		
		if(!$_COOKIE['userid']){
			$this->error("非法访问！正在跳转登录页面",U('Login/index'));
		}
		
		//判断当前登录会员是否已认证
		$cert = D('Certify');
		$uid = cookie(userid);
		$info = $cert->field('is_cert,uid,type')->where(array('uid'=>$uid))->select();
		//p($info);
		$this->assign('info',$info);
	}

	

}