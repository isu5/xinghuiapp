<?php
/**
* 系统设置控制器
*/
namespace Admin\Controller;

class SystemController extends CommonController {
    //系统默认模型
	private $sys = null;
	//继承父类
	public function _initialize(){
		parent::_initialize();
		
	 	$this->sys = D('System');
	 
	}
	//
	public function index(){
		if(IS_POST){
            if($this->sys->editData()){
                $this->ajaxReturn(1);
            }else{
                $this->ajaxReturn(0);
            }
        }else{
            $data=$this->sys->getAllData();
            $this->assign('data',$data);
            $this->display();           
        }
    }
	
}