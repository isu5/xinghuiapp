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
					
				$this->success('保存成功',U('Signjgpush/index',array('conf_id'=>I('get.conf_id'),'user_id'=>I('get.user_id'))));
				
				}else{
					$this->error('保存失败');
				
				}
			}else{
				$this->error($this->model->getError());
			}
		
			
		}
		
		$this->display();
	}
	
	//签到推送列表
	public function index(){
		$id = I('get.conf_id');
		$uid = I('get.user_id');
		//如果已扫码签到就不能修改
		
		$sign = M('Conference_sign');
		$signOne = $sign->where(array('conf_id'=>$id,'user_id'=>$uid))->find();
		$data = $this->jgpush->where(array('user_id'=>$uid,'conf_id'=>$id))->order('addtime desc')->limit(1)->find();
		
		//p($data);
		$this->assign(array(
			'data'=>$data,
			'sign'=>$signOne
		));
		$this->display();
	}
	
	//签到推送列表编辑
	public function edit(){
		$id = I('get.conf_id');
		$uid = I('get.user_id');
		
		//如果已扫码签到就不能修改
		
		$sign = M('Conference_sign');
		$signOne = $sign->where(array('conf_id'=>$id,'user_id'=>$uid))->find();
		
		if(IS_POST){
			if($this->jgpush->create(I('post.',2))){
				//p($_POST);die;
				if($this->jgpush->save() !== FALSE){
					$this->success('修改成功');
					exit;
						
				}else{
					$this->jgpush->getLastSql();
					$this->error('修改失败');
				
				}
			}
		
		}
		
			$data = $this->jgpush->where(array('user_id'=>$uid,'conf_id'=>$id))->order('addtime desc')->limit(1)->find();
		
		//p($data);
		$this->assign(array(
			'data'=>$data,
			'sign'=>$signOne
		));
		$this->display();
	}

}