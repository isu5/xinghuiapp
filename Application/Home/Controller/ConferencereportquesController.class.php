<?php

/**
 * 调查问卷问题管理
 */
namespace Home\Controller;

class ConferencereportquesController extends PublicController{
	private $model = nulll;
	private $report = nulll;
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Conferencereportques');
		$this->report = D('Conferencereport');
		
	}
	
	public function index(){
		//输出顶部该问卷的概要信息
        $report = $this->report->field('id,title,description')->find(I('get.rid'));
		//问题列表
		$quest = $this->model->field(true)->where(I('get.'))->order('sort')->select();
		$this->assign([
			'reprot'=> $report,
			'quest' => $quest
		]);
		$this->display();
	}
	

	/**
	 * 问题选项提交
	 */
	public function add(){
		if(IS_POST){
			// p($_POST);die;
			/*p($_FILES);
			DIE; */
			if($this->model->create(I('post.',1))){
				if ($this->model->add()) {
					
				}else{
					$this->error($this->model->getError());
				}
			}
			//$this->ajaxReturn($code);
			exit;
		}

		$uid = cookie(userid);
		$mprot = $this->model->where(array('uid'=>$uid))->find();
		$questionnaire = $this->report->field('id,title,description')->find(I('get.rid'));
		$this->assign([
			'questionnaire'=>$questionnaire,
			'mprot'=>$mprot
		]);
		p($questionnaire);
		
		$this->display();
	}

	


}
?>