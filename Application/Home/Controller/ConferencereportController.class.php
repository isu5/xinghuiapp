<?php
/**
 * 会议调查报告管理
 *
 */
namespace Home\Controller;
use Org\Nx\Response;
class ConferencereportController extends PublicController{
	private $model = null;
	private $report = null;
	public function _initialize(){
		parent::_initialize(); 
		$this->report = D('Conferencereport'); 
		//p($info);	
	}

	//调查报告列表
    public function index(){
        
    	$data = $this->report->search();
		//p($data);die;
    	/* p($this->model->getlastsql());
    	p($_COOKIE);die; */
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));
		$this->display();
    }

	//新建调查报告
	public function add(){
		
		if (IS_POST) {
			//p($_POST);die;
			
			if($this->report->create(I('post.',1))){
				if($this->report->add()){
					$this->ajaxReturn( ['status'=>1,'info'=>'添加成功！']);
					exit;
				}else{
					$this->ajaxReturn( ['status'=>0,'info'=>'添加失败！']);
				
				}
			}else{
				$this->ajaxReturn( ['status'=>2,'info'=>$this->report->getError()]);
				
			}
			
			
		}
		
		$this->display();
	}
	
	//删除
	public function delete(){
		$id = I('get.id');
		if($this->report->delete($id) !== FALSE){
			
			$code = array('status'=>'y','info'=>'删除成功');
		}else{
			
			$code = array('status'=>'n','info'=>$this->model->getError());
		}
		$this->ajaxReturn($code);
	}
	
	
}