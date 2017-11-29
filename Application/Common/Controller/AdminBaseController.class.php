<?php
/******************************************************************
*  后台基类控制器
*
*/
namespace Common\Controller;
use Common\Controller\BaseController;
use Think\Auth;

class AdminBaseController extends BaseController{
	
	
	public function _initialize(){
		
		if(!$_SESSION['uid']){
			$this->error("非法访问！正在跳转登录页面",U('Login/index'));
		}
		// 所有管理员都可以进入后台的首页
		if(CONTROLLER_NAME == 'Index')
			return TRUE;
		$priModel = D('Privilege');
		if(!$priModel->chkPri())
			$this->error('无权访问！',U('Index/welcome'));
		/*==================================
		$auth = new Auth();
		$result_name = MODULE_NAME .'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
		$result = $auth->check($result_name,$_SESSION['uid']);
		if(!$result){
			$this->error('无权访问！');
		} 
		 */
	}
	
	
	
	
}
?>