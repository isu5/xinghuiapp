<?php

/**
*
* 函数：获取用户信息
* @param  int $uid      用户ID。
* @param  string $name  数据列（如：'uid'、'uid,user'）
*
**/

function adminMember($uid,$field=false){
	$model = M('Admin');
	if($field){
		return $model->field($field)->where(array('uid'=>$uid))->find();
	} else {
		return $model->where(array('uid'=>$uid))->find();
	}
	
}