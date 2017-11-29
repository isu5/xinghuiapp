<?php
namespace Home\Controller;
use Org\Nx\Response;
class UserController extends PublicController{

	
	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('User');
	}
	

	/**
	*  会员中心
	*/
	public function index(){
		
		
		$this->display();	
	}
	
	//企业基本资料
	public function info(){
		
		$id = $_COOKIE['userid'];
		if (IS_POST) {
			/* p($_POST);
			p($_FILES); */
			if(!$this->model->updateInfo()){
				$this->error($this->model->getError());
			}else{
				$this->success('修改成功',U('User/info'));
				die;
			}
			
		}
		$data = $this->model->where(array('id' => $id))->find();
		$this->assign('data',$data);
		$this->display();
	}

	//修改密码
	public function password(){
		$id = $_COOKIE['userid'];
		if (IS_POST) {
			$data['password'] = strtoupper(sha1($_POST['password']));
			//p($data);die;
			if($this->model->create()){
				
				if($this->model->where(array('id'=>$id))->save($data)){
					$this->error('密码修改成功',U('password'),3);
				}else{
					$this->error('密码不能与原密码相同');
				}
			}else{
				$this->error($this->model->getError());
			}
			
			
		}
		$this->display();
	}

	//详情修改
	public function details(){
		$id = $_COOKIE['userid'];
		if (IS_POST) {
			if(!$this->model->updateDetails()){
				$this->error($this->model->getError());
			}else{
				
				$this->success('修改成功',U('User/details'));
				die;
			}
		}
		$data = $this->model->field('id,companyname,position,address,profile,area')->where(array('id'=>$id))->find();
		
		$this->assign('data',$data);

		$this->display();
	}
	
	//添加二级账户
	public function addAccount(){
		$user = M('User');
		$data['username'] = I('post.username');
		$data['remark'] = I('post.remark');
		$data['password'] = strtoupper(sha1(I('post.password')));
		$data['pid'] = cookie(userid);  //上级账户（主账户）
		$data['ctime'] = time();
		$data['level'] = I('post.level');
		$arr = $user->field('id,pid,username')->where('pid='.$data['pid'])->select();
		
		//p($user->getLastSql());
		///p($arr);
		$level = findson($arr,$data['pid']);  //查找所有pid下的子id
		$count = $user->where(array('pid'=>$level[0]['pid']))->count();
		//把主账户的公司名称保存到自账号的companyname 字段里
		$info = $user->field('id,pid,username,companyname')->where('id='.$data['pid'])->find();
		$data['companyname'] = $info['companyname'];
		//判断用户名是否存在
		
		$acc = $user->field('id,pid,username')->where(array('username'=>$data['username']))->find();
		
		
		if (IS_POST) {
			
			if($acc['username'] == $data['username']){
				$code = array('status'=>3,'info'=>'对不起，您填写的用户名已存在');
				//$this->error('对不起，您填写的用户名已存在！');
				
				
			}else{
				
				if (C('ACCOUNT_NUM') > $count) {
					$result = $user->add($data);
					if ($result) {
						$id = $result;
						//融云token值
						getRongcloudToken($id);
						
						//生产二维码链接
						$dimecode = U('/Home/Index/usercode',array('id'=>$id));
						//$dimecode = scQRcode($id);
						//极光推送别名
						$jpush = $id . '_' . 'xinghuiapp';
						
						//p($dimecode);die;
						//更新别名，及二维码链接到数据库字段
						$this->model->where(array('id'=>$id))->setField('dimecode',$dimecode);
						$this->model->where(array('id'=>$id))->setField('jpush',$jpush);
						
						$code = array('status'=>1,'info'=>'二级账户添加成功！');
					}else{
						$code = array('status'=>0,'info'=>'二级账户添加失败！');
						
					}
				}else{
					$code = array('status'=>2,'info'=>'您添加的二级账户已达限额了，如需再添加账户请联系平台！客服电话：010-63942568');
					
				}
			}
			$this->ajaxReturn($code);
			
		}

		$this->display();
	}
	
	
	

	//二级账户列表
	public function accountList(){

		$data = $this->model->accountAli();
		$this->assign('data',$data);
		$this->display();
	}
	
	//二级账户修改密码
	public function accountPwd(){
		$id = I('get.id');
		
		if (IS_POST) {
			$data['password'] = strtoupper(sha1($_POST['password']));
			$data['remark'] = I('post.remark');
			//p($data);die;
			if($this->model->create()){
				
				if($this->model->where(array('id'=>$id))->save($data)){
					$code = array('status'=>'1','info'=>'密码修改成功');
				}else{
					$code = array('status'=>'0','info'=>'密码修改失败');
				}
			}else{
				$this->error($this->model->getError());
			}
			$this->ajaxReturn($code);
			
		}
		$pwd = $this->model->field('id,username,remark,password')->where('id=' .$id)->find();
		
		$this->assign('data',$pwd);
		$this->display();
		
		
	}
	
	
	//删除二级账户
	public function accountDel(){
		$id = I('get.id', 0);
		if($this->model->delete($id) !== FALSE){
			$code = array('status'=>'y','info'=>'二级账户删除成功');
		}else{
			$this->error($this->model->getError());
			$code = array('status'=>'n','info'=>'二级账户删除失败');
		}
		$this->ajaxReturn($code);
	}
	
	
	
	
	
	
	
	

	







	
}

?>