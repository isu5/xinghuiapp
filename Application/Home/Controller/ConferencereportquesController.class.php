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
		//会议id
		$where['conf_id'] = I('get.id');
		$quest = $this->model->field(true)->where($where)->order('sort')->select();
		
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
		$this->assign('extendJs', 'questions-optionManager.js'); //改选extendJs文件
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
	        		$this->ajaxReturn(["status"=>0,'info'=>'问题添加失败，错误信息：'.$this->model->getError()]); //失败
		        }else{
	        		//$this->success('问题编辑成功', U('Conferencereportques/index', array('id'=>I('get.id/d'),'rid'=>I('get.rid/d'))), 0);
					$this->ajaxReturn(["status"=>1,'info'=>'问题添加成功']);
			   }	 
			}else{
				
				$this->_formBack(); //把不完整的表单数据反馈回去

	            $this->assign('errorNote', $this->model->getError());

				$this->display();
				
			}
			
		}
		
	}
	
	//修改
	public function edit(){
		$questionnaire = $this->report->field('id,type,title,description')->find(I('get.rid/d'));
		//p($questionnaire);
		$this->assign([
			'questionnaire'=>$questionnaire,
		]);
		$this->assign('extendJs', 'questions-optionManager.js'); //改选extendJs文件
		if( IS_GET ){ //访问页面
        	
        	$question = $this->model->field(true)->find(I('get.quest/d'));
			//p($question);
			$this->assign('question', $question);
			$this->assign('optionsList', json_decode($question['options'], true)); //选项列表
			$isText = ( $question['options'] == "[{'0':{'type':'text','text':''}}]" ) ? true:false; //判断该题是否是文本输入型问题
			$this->assign('standardList', $this->model->getStandardList($question['standard'], $isText)); //标准答案列表

			$this->display();
        }else{ //表单提交
	       
        	
        	if( $data = $this->model->create() ){
	        	$data['options'] = I('post.options', '', ''); //临时关闭I函数的过滤器，因为选项中包含特殊字符
	        	
	        	$state = $this->model->save($data);

		        if( $state===false ){
					//$this->error('问题编辑失败，错误信息：'.$questions->getDbError());
					$this->ajaxReturn(["status"=>0,'info'=>'问题编辑失败，错误信息：'.$this->model->getDbError()]); //失败
		        }else{
	        		//$this->success('问题编辑成功', U('Questions/index', array('questionnaire_id'=>I('get.questionnaire_id/d'))), 0);
					$this->ajaxReturn(["status"=>1,'info'=>'问题编辑成功']);
				}	        	
	        }else{ //表单提交不完整
	        	$this->_formBack(); //把不完整的表单数据反馈回去

	            $this->assign('errorNote', $questions->getError());

				$this->display();
	        }
        }
	}
	
	//删除
	public function delete(){
		$id = I('get.id',0);
		if($this->model->delete($id) !== FALSE){
			$code = array('status'=>'y','info'=>'删除成功');
		}else{
			$this->error($this->model->getError());
			$code = array('status'=>'n','info'=>'删除失败');
		}
		$this->ajaxReturn($code);
		
		
		
	}
	
	
	/* 把不完整的表单数据反馈回去 */
	private function _formBack()
	{
        $this->assign('question', I('post.'));

        if( $options = I('post.options', '', '') ){ //已配置好选项
			$this->assign('optionsList', json_decode($options, true));
			
			if( I('post.standard') != '' ){ //已配置好标准答案
			
				$isText = ( $options == "[{'0':{'type':'text','text':''}}]" )  ? true:false; //判断该题是否是文本输入型问题
				$this->assign('standardList', $this->model->getStandardList(I('post.standard'), $isText));
			}
        }
	}

	


}
?>