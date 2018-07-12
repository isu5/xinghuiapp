<?php
namespace Home\Controller;
use Org\Nx\Response;
class UserController extends PublicController{

	
	private $model = null;
	private $focus = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('User');
		$this->focus = M('Conference_focus');
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
			//p($_POST);die;
			if(!$this->model->updateDetails()){
				$this->error($this->model->getError());
			}else{
				
				$this->success('修改成功',U('User/details'));
				die;
			}
		}
		$data = $this->model->field('id,companyname,position,address,profile,website,landline,area')->where(array('id'=>$id))->find();
		
		$this->assign('data',$data);

		$this->display();
	}
	
	//添加二级账户
	public function addAccount(){
		$user = M('User');
		$focus = M('Conference_focus');
		$data['username'] = I('post.username');
		$data['remark'] = I('post.remark');
		$data['phone'] = I('post.phone');
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
		$info = $user->field('id,pid,username,companyname,catename,address,area')->where('id='.$data['pid'])->find();
		$data['companyname'] = $info['companyname'];
		$data['catename'] = $info['catename'];
		$data['address'] = $info['address'];
		$data['area'] = $info['area'];
		
		//判断用户名是否存在
		$acc = $user->field('id,pid,username,phone')->where(array('username'=>$data['username']))->find();
		//判断手机号是否存在
		$acc1 = $user->field('id,pid,username,phone,type')->where(array('phone'=>$data['phone']))->find();
		
		//将个人账户id，及添加的二级账户id保存到中间表
		$z = M('User_account');
		$var = session('check_code');
		if (IS_POST) {
			if($var != I('post.check_code')){
				$code = array('status'=>6,'info'=>'您填写的短信验证码不正确！请重新填写');
			}else{
				//判断用户名是否存在
				if($acc['username'] == $data['username']){
					$code = array('status'=>3,'info'=>'对不起，您填写的用户名已存在');
				//判断是否为已经注册过的企业手机号
				}elseif($acc1['phone'] == $data['phone'] && $acc1['type'] == 2){
					$code = array('status'=>5,'info'=>'对不起，您填写的手机号为企业账户手机号，无法绑定！');
				}elseif($acc1['phone'] == $data['phone'] && $acc1['type'] == 3){
					$code = array('status'=>5,'info'=>'对不起，您填写的手机号为会议发布账户手机号，无法绑定！');
				}elseif($acc1['phone'] == $data['phone'] && $acc1['type'] == 1 && $acc1['level'] ==2){
					$code = array('status'=>5,'info'=>'对不起，您填写的手机号为二级账户手机号，无法绑定！');
				}elseif($acc1['phone'] == $data['phone'] && $acc1['type'] == 1){
					//判断手机号是否存在, 把原来的个人账号itype设为1（不允许登录）并保存到新字段值中
					
					$map = array('itype'=>1);
					$user-> where('id='.$acc1['id'])->setField($map);
					
					if ($id = $user->add($data)) {
						//将个人账户id，及添加的二级账户id保存到中间表
						$por = array(
							'user_id'=>$acc1['id'],
							'acc_id'=>$id
						);
						$z->add($por);
						//创建的二级账户同时关注企业主账户
						$accountR = array(
							'conf_user_id' => $data['pid'],
							'user_id' => $id,
						);
						$focus->add($accountR);
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
						$code = array('status'=>4,'info'=>'您填写的手机号已是个人注册账号,确定要绑定吗!');
						}else{
							$code = array('status'=>0,'info'=>'二级账户添加失败！');
							
						}
					
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
							//表中没有用户名及手机号的，新添加的二级账户id，及用户id相同，保存到中间表
							$por = array(
								'user_id'=>$id,
								'acc_id'=>$id
							);
							
							$z->add($por);
							//创建的二级账户同时关注企业主账户
							$accountR = array(
								'conf_user_id' => $data['pid'],
								'user_id' => $id,
							);
							$focus->add($accountR);
							
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
			}
			$this->ajaxReturn($code);
			
		}

		$this->display();
	}
	
	
	//手机号验证
	public function checkphone(){
		
		$data['check_code'] = rand('1000','9999');
		$data['phone'] = I('post.phone');
		
		if(IS_POST){
			 /* print_r($_POST);
			print_r($data);die;  */
			if(yunsendSMS($data['check_code'],$data['phone'])){
				session('check_code',$data['check_code']);
				$this->ajaxReturn(1);  //发送成功
			}else{
				$this->ajaxReturn(0);
			}
		}
		//yunsendSMS('1236','13552832050');
	}
	//短信验证获取验证码
	public function checkcode(){
		$var = session('check_code');
		p($var);
	}

	//二级账户列表
	public function accountList(){

		$data = $this->model->accountAli();
		//p($data);
		$this->assign('data',$data);
		$this->display();
	}
	
	//二级账户修改密码
	public function accountPwd(){
		$id = I('get.id');
		$user = M('User');
		$data['password'] = strtoupper(sha1($_POST['password']));
		$data['remark'] = I('post.remark');
		$data['phone'] = I('post.phone');
		$pid = cookie(userid);
		$pwd = $user->field('id,username,remark,password,phone')->where('id=' .$id)->find();
		$iphone = $user->field('id,phone')->where('id ='.$pwd['id'])->find();
		//判断手机号是否存在
		$accph = $user->field('id,pid,username,phone,type,level')->where(array('phone'=>$data['phone']))->find();
		/* p($pwd);
		p($iphone);
		   */
		//$acc = $user->field('id,pid,username,phone,type,level')->where(array('phone'=>$data['phone']))->find();
		
		$acc1 = $user->alias('a')->field('a.id,a.pid,a.username,a.phone,a.type,a.itype,a.level,b.user_id')
		->join('LEFT JOIN tzht_user_account b on b.acc_id=a.id')->where(array('a.id'=>$iphone['id']))->find();
		/*  p($accph);
		p($acc1); */  
		
		//添加的二级账户id保存到中间表
		$z = M('User_account');
		$var = session('check_code');
		if (IS_POST) {
			if($var != I('post.check_code')){
				$code = array('status'=>6,'info'=>'您填写的短信验证码不正确！请重新填写');
			}else{
				//p($data);die;
				if($accph['phone'] == $data['phone'] && $accph['type'] == 2){
					$code = array('status'=>5,'info'=>'对不起，您填写的手机号为企业账户手机号，无法绑定！');
				}elseif($accph['phone'] == $data['phone'] && $accph['type'] == 3){
					$code = array('status'=>5,'info'=>'对不起，您填写的手机号为会议发布账户手机号，无法绑定！');
				}elseif( $accph['phone'] == $data['phone'] && $acc1['type'] == 1 && $accph['level'] ==0){
					/* //如果个人手机号存在，把该手机号的id保存在对应的中间表中*/
					
					$map = array(
						'user_id'=>$accph['id'],
						'acc_id'=>$id
					);
					$z->where('acc_id='.$acc1['id'])->setField($map); 
					//1把之前绑定的手机号的id账户，状态itype设置0（可能登录状态）
					if($acc1['user_id']){
						
						$map2 = array('itype'=>0);
						$user-> where('id='.$acc1['user_id'])->setField($map2);
					}
					//2把绑定的存在的新手机号的id itype 值为1
					$map3 = array('itype'=>1);
					
					$user-> where('id='.$accph['id'])->setField($map3);
					
					//3 更新当前绑定的二级账户信息
					$user->where('id='.$acc1['id'])->data($data)->save();
					
					
					$code = array('status'=>4,'info'=>'您填写的手机号已是个人注册账号,确定要绑定吗!');
					
				}elseif($accph['phone'] == $data['phone'] && $acc1['type'] == 1 && $accph['level']==2 ){
				//如果是二级账户不允许绑定
					$code = array('status'=>3,'info'=>'对不起，您填写的手机号为二级账户手机号，无法绑定！');
				}else{
					if($user->where(array('id'=>$id))->data($data)->save()){
						$map3 = array('itype'=>0);
						$user-> where('id='.$acc1['user_id'])->setField($map3);
						$code = array('status'=>1,'info'=>'绑定修改成功');
					}else{
						$code = array('status'=>0,'info'=>'绑定修改失败');
					}
				}
			}
			
				$this->ajaxReturn($code); 
		}
			
			
		$this->assign('data',$pwd);
		$this->display();
		
		
	}
	//二级账户关注的列表
	public function focus(){
		$res = $this->model->focusList();
		
			$this->assign(array(
				'data' => $res['data'],
				'page' => $res['page'],
				
			));
			//p($res['data']);
		//$this->assign('data',$data);
		$this->display();
	}
	
	
	//删除二级账户时，
	public function accountDel(){
		$id = I('get.id', 0);
		$jpush = $this->model->where('id='.$id)->find();
		if($this->model->delete($id) !== FALSE){
			
			jgpushAccount($jpush['jpush']);
			
			$code = array('status'=>'y','info'=>'二级账户删除成功');
		}else{
			$this->error($this->model->getError());
			$code = array('status'=>'n','info'=>'二级账户删除失败');
		}
		$this->ajaxReturn($code);
	}
	
	
	//停用二级账户
	public function stopacc(){
		$id = I('get.id', 0);
		$map = array(
			'itype' => 1,
			'phone'=>''
		);
		$pack = $this->model->where(array('id'=>$id))->setField($map);
		if($pack){
			$code = array('status'=>'y','info'=>'二级账户停用成功');
		}else{
			$code = array('status'=>'n','info'=>'二级账户停用失败');
		}
		$this->ajaxReturn($code);
	}
	//启用二级账户
	public function startacc(){
		$id = I('get.id', 0);
		$map = array(
			'itype' => 0
		);
		$pack = $this->model->where(array('id'=>$id))->setField($map);
		if($pack){
			$code = array('status'=>'y','info'=>'二级账户启用成功');
		}else{
			$code = array('status'=>'n','info'=>'二级账户启用失败');
		}
		$this->ajaxReturn($code);
	}
	
	
	
	
	
	
	
	

	







	
}

?>