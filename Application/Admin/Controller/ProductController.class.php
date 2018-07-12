<?php
/**
*  企业产品统计控制器
*/
namespace Admin\Controller;

class ProductController extends CommonController {
	
	//系统
	private $stats = null;
	
	//继承父类
	public function _initialize(){
		parent::_initialize();
		$this->pro = D('Product');
	}
	
	//产品统计
    public function index(){
		
		$data = $this->pro->search();
		//p($data);
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
		));
        $this->display();
    }
	
	//谁点击的统计
	public function countwho(){
		$data = $this->pro->countwho();
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
		));
        $this->display();
		
	}
	
}