<?php
/**
*  企业资料
*/
namespace Home\Controller;

class DownloadController extends PublicController{

	
	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('Download');
	}
	
	/**
	* 企业资料列表
	*/
	public function index(){
		$data = $this->model->search();
		//p($data);
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));

		$this->display();
	} 
	
	/**
	* 添加企业资料
	*/
	public function add(){
		if(IS_POST){
			/* p($_FILES);
			p($_POST);
			die; */
			if($this->model->create(I('post.',1))){
				if($this->model->add()){
					$this->success('添加成功',U('Download/index'));
					exit;
				}else{
					$this->error('添加失败');
				}
			}else{
				$this->error($this->model->getError());
			}
		}
		
		$this->display();
	}
	
	//删除资料
	public function delete(){
		$id = I('get.id', 0);
		if($this->model->delete($id) !== FALSE){
			$code = array('status'=>'y','info'=>'删除成功');
		}else{
			$this->error($this->model->getError());
			$code = array('status'=>'n','info'=>'删除失败');
		}
		$this->ajaxReturn($code);
	}

	

	
	

	







	
}

?>