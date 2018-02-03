<?php

//判断会议结束的行为
namespace Behaviors;
//use Think\Behaviors;

class ConfendBehavior{
	function run(){
		
		//判断当前时间 >= 会议结束时间，说明会议已经结束
		$conf = M('Conference');
		$audit = M('Conference_audit');
		$auditlist = M('Conference_auditlist');
		
		
		$uid = $_COOKIE['userid'];
		
		$t = time(); //当前时间
		
		
		$data = $conf->field('id,etime')->select();
		$i = 0;
		for($i=0;$i<count($data);$i++){
			$etime = strtotime($data[$i]['etime']);
			if($t >= $etime){
				$conf->where(array('id'=>$data[$i]['id']))->setField('statuses',1);
				$audit->where(array('conf_id'=>$data[$i]['id']))->setField('status',5);
				$auditlist->where(array('conf_id'=>$data[$i]['id']))->setField('status',5);
			}
			
			
		}
		
		
	}
	
	
	
	
	
}