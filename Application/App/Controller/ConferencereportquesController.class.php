<?php

/**
 * 调查问卷问题管理
 */
namespace App\Controller;
use Org\Nx\Response;

class ConferencereportquesController extends PublicController{
	private $model = nulll;
	private $report = nulll;
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Conferencereportques');
		$this->report = D('Conferencereport');
		
	}
	
	/**
	 * 问题选项提交
	 */
	public function add(){
		if (IS_POST) {
			if($this->model->create($_POST)){
				if($this->model->add()){
					
					//$this->ajaxReturn( ['status'=>1,'info'=>'添加成功！']);
					//exit;
					Response::show(200,'添加成功！');
				}else{
					//$this->ajaxReturn( ['status'=>0,'info'=>'添加失败！']);
					Response::show(401,'添加失败！');
				}
			}else{
				//$this->ajaxReturn( ['status'=>2,'info'=>$this->report->getError()]);
				Response::show(402,$this->model->getError());
			}
		}
	}
	
	
	
	

	


}
?>