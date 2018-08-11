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
		$quest = $this->model->field(true)->where(I('get.rid'))->order('sort')->select();
		
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
		$uid = cookie(userid);
		$mprot = $this->model->where(array('uid'=>$uid))->find();
		$questionnaire = $this->report->field('id,type,title,description')->find(I('get.rid/d'));
		
		$this->assign([
			'questionnaire'=>$questionnaire,
			'mprot'=>$mprot
		]);
		if(IS_GET){ //访问页面
			/* 填充好当前默认排序 */
        	$question['sort'] = $this->model->where( I('get.') )->count('id') + 1;
        	$this->assign('question', $question);
			
			$this->display();
			exit;
		}else{ //表单提交
			if($data = $this->model->create()){
				$data['options'] = I('post.options', '', ''); //提交radio ，checkbox等选项
				
				$state = $this->model->add($data);
				if( $state===false ){
					//$this->error('问题编辑失败，错误信息：'.$questions->getDbError());
	        		$this->ajaxReturn(["status"=>0,'info'=>'问题编辑失败，错误信息：'.$this->model->getError()]); //失败
		        }else{
	        		//$this->success('问题编辑成功', U('Conferencereportques/index', array('id'=>I('get.id/d'),'rid'=>I('get.rid/d'))), 0);
					$this->ajaxReturn(["status"=>1,'info'=>'问题编辑成功']);
			   }	 
			}else{
				
				$this->_formBack(); //把不完整的表单数据反馈回去

	            $this->assign('errorNote', $this->model->getError());

				$this->display();
				
			}
			
		}
		
	}
	
	
	/* 把不完整的表单数据反馈回去 */
	private function _formBack()
	{
        $this->assign('question', I('post.'));

        if( $options = I('post.options', '', '') ){ //已配置好选项
			$this->assign('optionsList', json_decode($options, true));
			
			if( I('post.standard') != '' ){ //已配置好标准答案
			
				$isText = ( $options == '{"0":{"type":"text","text":""}}' ) ? true:false; //判断该题是否是文本输入型问题
				$this->assign('standardList', $this->model->getStandardList(I('post.standard'), $isText));
			}
        }
	}

	


}
?>