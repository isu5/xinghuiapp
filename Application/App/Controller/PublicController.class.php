<?php

namespace App\Controller;
use Think\Controller;
use Think\Controller\RestController;
class PublicController extends RestController{

	
	/**
	 * 处理未被路由的App模块下的Rest请求
	 */
	Public function rest()
	{
		exit('非法地址Rest请求');
	}
	

}