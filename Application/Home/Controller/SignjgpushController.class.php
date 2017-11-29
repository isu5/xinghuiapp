<?php
/**
* 个性化极光推送
*/
namespace Home\Controller;
use Org\Nx\Response;
class SignjgpushController extends PublicController{
	private $jgpush = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->jgpush = D('Signjgpush');
		
	}
	//推送单个信息
	public function signts(){
		if(IS_POST){
			if($this->jgpush->create(I('post.',1))){
				if($this->jgpush->add()){
					
				$this->success('保存成功',U('Conference/auditlist',array('id'=>I('get.id'))));
					exit;
					
				}else{
					$this->error('保存失败');
				
				}
			}else{
				$this->error($this->model->getError());
			}
		
			
		}
		
		$this->display();
	}

}