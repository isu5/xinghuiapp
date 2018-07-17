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
		$this->stats = D('Downloadstats');
	}
	
	/**
	* 企业产品列表
	*/
	public function index(){
		$data = $this->model->search();
		/* p($data);
    	p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));

		$this->display();
	} 
	
	
	
}

?>