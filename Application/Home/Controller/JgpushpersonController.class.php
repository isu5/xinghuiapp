<?php
/**
* 个性化极光推送
*/
namespace Home\Controller;
use Org\Nx\Response;
class JgpushpersonController extends PublicController{
	private $jgpush = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->jgpush = D('Jgpushperson');
	}
	//推送单个信息
	public function gexingts(){
		if(IS_POST){
			if($this->jgpush->create(I('post.',1))){
				if($this->jgpush->add()){
					$this->success('推送成功',U('Conference/auditlist',array('id'=>I('get.id'))));
				exit;
				}else{
					$this->error('推送失败');
				}
			}else{
				$this->error($this->jgpush->getError());
			}
		}
		
		$this->display();
	}
	
	//推送消息列表
	public function personlist(){
		$data = $this->jgpush->searchFront();
		//p($data);
    	/* p($this->jgpush->getlastsql());
    	
    	 */
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));


		$this->display();
		
	}
	
	//删除历史消息
	public function delete(){
		$id = I('get.id',0);
		if($this->jgpush->delete($id) !== FALSE){
			$code = array('status'=>'y','info'=>'删除成功');
		}else{
			$this->error($this->jgpush->getError());
			$code = array('status'=>'n','info'=>'删除失败');
		}
		$this->ajaxReturn($code);
	}
	

}