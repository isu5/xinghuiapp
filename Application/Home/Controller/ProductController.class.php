<?php
namespace Home\Controller;

class ProductController extends PublicController{

	
	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('Product');
	}
	
	/**
	* 企业产品列表
	*/
	public function index(){
		$data = $this->model->searchFront();
		/* p($data);
    	p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));

		$this->display();
	} 
	
	/**
	* 添加企业产品
	*/
	public function add(){
		if(IS_POST){
			if($this->model->create(I('post.',1))){
				if($this->model->add()){
					$this->success('添加成功',U('Product/index'));
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
	
	//删除产品
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
	
	//企业产品统计
	public function pstats(){
		$pay = $this->checkpay();
		$data = $this->model->search();
		if($pay==1){
			$this->assign(array(
				'data' => $data['data'],
				'page' => $data['page'],
				'success' => true
			));
		}
		
		
		
		$this->display();
	}
	
	//企业产品谁点击的统计
	public function countwho(){
		$data = $this->model->countwho();
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
		));
        $this->display();
		
	}

	

	
	

	







	
}

?>