<?php
namespace App\Controller;
use Org\Nx\Response;
class UserController extends PublicController{

	
	private $model = null;
	private $part = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('User');
		$this->part = D('Userpartners');
		
	}
	
	/**
	*  会员中心
	*/
	public function index(){
		
		
		
	}
	//传登录后是个人还是企业认证
	public function iscerfity(){
		if( IS_POST ){
			$res = $this->model-> is_cert();
			$data = array(
				'result' => $res['data'],
			);
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!',$this->model->getError());
			
		}
	}
	
	
	//认证状态
	public function certStatus(){
		$data['uid'] = I('post.user_id');
		$cert = D('Certify');
		$iscert=$cert->where(array('uid'=>$data['uid']))->find();
		//企业
		$comiscert = $cert->field('company,certificate,certificateimg,certtime,type,is_cert')->where(array('uid'=>$data['uid']))->find();
		
		//个人
		$personcert = $cert->field('uid,realname,idcard,front,back,certtime,type,is_cert')->where(array('uid'=>$data['uid']))->find();
		if(IS_POST){
			if($iscert['is_cert'] == 3){
				Response::show(401,'您的申请已提交，正在审核中，请耐心等待!');
				
			}elseif($iscert['is_cert'] == 2){
				Response::show(200,'恭喜您，您已通过企业认证审核!',$comiscert);
			}elseif($iscert['is_cert'] == 1){
				Response::show(201,'恭喜您，您已通过个人实名认证审核!',$personcert);
			}elseif($iscert['is_cert'] == 4){
				
				Response::show(402,'您提交的审核信息不符合要求，请重新提交!',$iscert);
			}else{
				Response::show(403,'对不起，您查询的用户没有认证!');
			}
		}
		
		
		
	}
	
	//修改资料
	public function edit(){
		$id = I('post.id');
		
		
		if(IS_POST){
			if ($this->model->create(I('post.',2))) {
				
				if ($this->model->save() != FALSE) {
					
					Response::show(200,'修改成功');
				}else{
					
					Response::show(401,'修改失败');
				}
			}else{
				
				Response::show(402,$this->model->getError());
			}
		}
	}
	
	//企业基本资料
	public function info(){
		
		/*  p($_COOKIE);
		die;  */
		$id = I('post.id');
		
		$data = $this->model->where(array('id' => $id))->find();
		if(IS_POST){
			if($data){
				Response::show(200,'获取数据成功',$data);
			}else{
				Response::show(401,'获取数据失败');
			}
		}else{
			Response::show(402,'数据不合法',$this->model->getError());
		}
	}

	


	//企业产品
	public function companyProduct(){
		
		if( IS_POST ){
			$res = $this->model->product();
		
			$data = array(
				'result' => $res['data'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data );
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
		
		
	}
	//企业文档资料
	public function companyfile(){
		if( IS_POST ){
			$res = $this->model->downfile();
		
			$data = array(
				'result' => $res['data'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data );
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
	}
	
	//合作伙伴列表
	public function userpartners(){
		if( IS_POST ){
			$res = $this->part->searchUser();
		
			$data = array(
				'result' => $res['data'],
				//'page' => $res['page'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data );
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
	}
	//合作伙伴详情
	
	public function oneuserpartners(){
		
		if( IS_POST ){
			$res = $this->part->searchOneUser();
		
			$data = array(
				'result' => $res['data'],
				
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data );
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
		
	}
	
	
	//忘记密码
	public function recoveryPwd(){
		
		$data['phone'] = I('post.phone');
		
		$map['password'] = I('post.password');
		//p($data);
		if(IS_POST){
			$user = $this->model->where(array( 'phone'=> $data['phone']))->find();
			$info = array(
				'id'=>$user['id'],
				'token'=>$user['token'],
			);
			if(!$user){
				Response::show(403,'没有该用户，请注册！');
			}else{
				
				if($this->model->where(array( 'phone'=> $data['phone']))->save($map) !==false){
					Response::show(200,'密码修改成功!',$info );
				}else{
					Response::show(401,'修改失败!' );
				}
				
				
			}
		}
	}
	//修改密码
	public function resetPwd(){
		$data['id'] = I('post.id');
		$map['password'] = I('post.password');
		if(IS_POST){
			$user = $this->model->where(array('id'=>$data['id']))->find();
			if(!$user){
				Response::show(403,'没有该用户，请注册！');
			}else{
				if($this->model->create()){
					if($this->model->where(array('id'=>$data['id']))->save($map)){
						Response::show(200,'密码修改成功!' );
					}else{
						Response::show(401,'输入的密码不能与原密码相同!' );
					}
				}else{
					Response::show(402,'修改失败!' );
				}
				
			}
		}
	}
	
	
	//二级账户显示列表
	public function accountList(){
		$data = $this->model->account();
		if( IS_POST ){
			
			if($data == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data );
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
	}
	
	
	//二级账户的会议列表
	public function accountConfList(){
		$conf = D('Conference');
		$res = $conf->privateConfList();
		if( IS_POST ){
			$data = array(
				'result' => $res['data'],
				//'page'=> $res['page']
			);
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data );
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
	}
	
	
	//二级账户的会议列表删除一条会议
	public function delAccountConfOne(){
		$conf = D('Conference');
		$res = $conf->delAccountConfOne();
		if( IS_POST ){
			$data = array(
				'result' => $res['data'],
				//'page'=> $res['page']
			);
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data );
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
	}

	


	
}

?>