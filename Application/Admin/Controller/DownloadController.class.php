<?php
/**
 * 企业资料下载统计 *
 */

namespace Admin\Controller;

class DownloadController extends CommonController{
	
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Downloadstats'); 
	}
	
	
	// 企业资料下载统计
	public function index(){
		$data = $this->model->search();
		//p($data);
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));

		$this->display();
		
	}
	
	//谁下载的
	public function downwho(){
		$data = $this->model->downwho();
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));

		$this->display();
	}
	
}
