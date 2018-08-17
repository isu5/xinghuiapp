<?php
/**
 * 会议调查报告管理
 *
 */
namespace App\Controller;
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
				if($id = $this->report->add()){
					$info = $this->report->where(['id'=>$id])->find();
					if($info['conf_id']){
						$this->report->delete($id);
						Response::show(403,'该会议已存在调查问卷，不允许添加了');
						exit();
					}else{
						Response::show(200,'添加成功！');
					}
					//$this->ajaxReturn( ['status'=>1,'info'=>'添加成功！']);
					//exit;
					
				}else{
					//$this->ajaxReturn( ['status'=>0,'info'=>'添加失败！']);
					Response::show(401,'添加失败！');
				}
			}else{
				//$this->ajaxReturn( ['status'=>2,'info'=>$this->report->getError()]);
				Response::show(402,$this->report->getError());
			}
		}
		
		
	}
	
	
}