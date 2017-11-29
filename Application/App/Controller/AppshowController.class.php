<?php
/**
 * 关于App*
 */

namespace App\Controller;
use Org\Nx\Response;
class AppshowController extends PublicController{
	
	//关于app
	public function index(){
		
		$info = array(
			'APP_VERSION'				=> C('APP_VERSION'),
			'APP_INFO'				    => C('APP_INFO'),
			'APP_PHONE'  				=> C('APP_PHONE'),
			'APP_URL'  					=> C('APP_URL'),
			'APP_COMPANY' 				=> C('APP_COMPANY'),
			'APP_ADDRESS'  				=> C('APP_ADDRESS'),
		);
		
		if($info){
			Response::show(200,'获取数据成功',$info);
		}else{
			Response::show(401,'没有数据');
		}
		
	}
	
	//引导页
	public function apptop(){
		
		$pic = D('App')->select();
		if($pic){
			Response::show(200,'获取数据成功',$pic);
		}else{
			Response::show(401,'没有数据');
		}
		
	}


}
