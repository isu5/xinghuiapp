<?php
namespace App\Controller;
use Org\Nx\Response;
use Common\Third\RongCloud;

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
		$comiscert = $cert->field('company,certificate,certificateimg,certtime,type,is_cert,refusednote')->where(array('uid'=>$data['uid']))->find();
		
		//个人
		$personcert = $cert->field('uid,realname,idcard,front,back,certtime,type,is_cert,is_image,refusednote')->where(array('uid'=>$data['uid']))->find();
		//个人发布
		$publishcert = $cert->field('uid,realname,idcard,front,back,zhicard,certtime,type,is_cert,is_image,refusednote')->where(array('uid'=>$data['uid']))->find();
		
		//审核中数据
		$auditdata = $cert->where(array('uid'=>$data['uid']))->find();
		if(IS_POST){
			if($iscert['is_cert'] == 5){
				Response::show(401,'您的申请已提交，正在审核中，请耐心等待!',$auditdata);
				
			}elseif($iscert['is_cert'] == 2){
				Response::show(200,'恭喜您，您已通过企业认证审核!',$comiscert);
			}elseif($iscert['is_cert'] == 1){
				Response::show(201,'恭喜您，您已通过个人实名认证审核!',$personcert);
			}elseif($iscert['is_cert'] == 3){
				Response::show(201,'恭喜您，您已通过个人会议发布认证审核!',$publishcert);
			}elseif($iscert['is_cert'] == 4){
				
				Response::show(402,'您提交的审核信息不符合要求，请重新提交!',$iscert);
			}else{
				Response::show(403,'对不起，您查询的用户没有认证!');
			}
		}
		
		
		
	}
	
	//修改资料
	public function edit(){
		
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
		
		$data = $this->model->alias('a')->field('a.*,b.note')->
		join('left join tzht_conference_focus b on b.user_id=a.id')->where(array('id' => $id))->find();
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
	
	//企业资料下载返回企业名称
	public function companydownload(){
		if( IS_POST ){
			$res = $this->model->companydownload();
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
	
	//新增合作伙伴
	public function addPart(){
		$data['user_id'] = I('post.user_id');
		$data['conf_user_id'] = I('post.conf_user_id');
		$partid = $this->part->where(array('user_id'=>$data['user_id'],'conf_user_id'=>$data['conf_user_id']))->find();
		
		$mm = M('User')->field('id,type')->where(array('id'=>$data['user_id']))->find();
		
		//print_r($mm);die;
		if(IS_POST){
			if($partid)
				Response::show(401,'您添加的合作伙伴已存在，请勿重复添加!');
			
			if($mm['type'] != 2)
				Response::show(402,'您选择的用户为个人或二级账户，不能添加!');
			
			
			$this->part->add($data);
			Response::show(200,'添加成功!');
			
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
		$m = M('User');
		if(IS_POST){
			$user = $this->model->where(array('id'=>$data['id']))->find();
			if(!$user){
				Response::show(403,'没有该用户，请注册！');
			}else{
				if($m->where(array('id'=>$data['id']))->save($map)){
					Response::show(200,'密码修改成功!' );
				}else{
					Response::show(401,'输入的密码不能与原密码相同!' );
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
		$conf = D('Conferenceauditlist');
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
	
	//添加二级账户
	public function addAccount(){
		$user = M('User');
		$focus = M('Conference_focus');
		$data['username'] = I('post.username');
		$data['remark'] = I('post.remark');
		$data['phone'] = I('post.phone');
		$data['password'] = I('post.password');
		$data['pid'] = I('post.pid');  //上级账户（主账户）
		$data['ctime'] = time();
		$data['level'] = I('post.level');
		$arr = $user->field('id,pid,username')->where('pid='.$data['pid'])->select();
		$level = findson($arr,$data['pid']);  
		//查找所有pid下的子id
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
		$acc1 = $user->field('id,pid,username,phone,type,level')->where(array('phone'=>$data['phone']))->find();
		$z = M('User_account');
		if (IS_POST) {
			//判断用户名是否存在
				if($acc['username'] == $data['username']){
					Response::show(201,'对不起，您填写的用户名已存在' );
				
				//判断是否为已经注册过的企业手机号
				}elseif($acc1['type'] == 2){
					Response::show(202,'对不起，您填写的手机号为企业账户手机号，无法绑定！' );
					
				}elseif($acc1['type'] == 3){
					Response::show(202,'对不起，您填写的手机号为会议发布账户手机号，无法绑定！' );
					
				}elseif($acc1['phone'] == $data['phone'] && $acc1['type'] == 1 && $acc1['level'] ==2){
					Response::show(203,'对不起，您填写的手机号为二级账户手机号，无法绑定！' );
				}elseif($acc1['phone'] == $data['phone'] && $acc1['type'] == 1){
					$code = I('post.codetype');
					if( $code == 0){ //传入标识，以判断已注册手机号绑定时，弹框确认
						Response::show(205,'对不起，您填写的手机号为个人账户手机号，确定要绑定吗！' );
					}else{
						//判断手机号是否存在, 把原来的个人账号itype设为1（不允许登录）并保存到新字段值中
						$map = array('itype'=>1);
						$user-> where('id='.$acc1['id'])->setField($map);
						
						$result = $user->add($data);
						if ($result) {
							$id = $result;
						
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
							Response::show(200,'二级账户添加成功！' );
					
					
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
							Response::show(200,'二级账户添加成功！' );
							
						}else{
							Response::show(401,'二级账户添加失败！' );
							
							
						}
					}else{
						Response::show(204,'您添加的二级账户已达限额了，如需再添加账户请联系平台！客服电话：010-63942568' );
						
					}
					
				}
			}
		
		}
	}
}
	
	
	
	//二级账户修改绑定（密码）
	public function accountPwd(){
		
		$id = I('post.id');
		$user = M('User');
		$data['password'] = I('post.password');
		$data['remark'] = I('post.remark');
		$data['phone'] = I('post.phone');
		$pid = I('post.pid');
		$pwd = $user->field('id,username,remark,password,phone')->where('id=' .$id)->find();
		$iphone = $user->field('id,phone')->where('id ='.$pwd['id'])->find();
		//判断手机号是否存在
		$accph = $user->field('id,pid,username,phone,type,level')->where(array('phone'=>$data['phone']))->find();
		$acc1 = $user->alias('a')->field('a.id,a.pid,a.username,a.phone,a.type,a.itype,a.level,b.user_id')
		->join('LEFT JOIN tzht_user_account b on b.acc_id=a.id')->where(array('a.id'=>$iphone['id']))->find();
		$z = M('User_account');
		if(IS_POST){
			if($accph['phone'] == $data['phone'] && $accph['type'] == 2){
					Response::show(204,'对不起，您填写的手机号为企业账户手机号，无法绑定！' );
					//$code = array('status'=>5,'info'=>'对不起，您填写的手机号为企业账户手机号，无法绑定！');
			}elseif($accph['phone'] == $data['phone'] && $accph['type'] == 3){
					Response::show(202,'对不起，您填写的手机号为会议发布账户手机号，无法绑定！' );
					
			}elseif( $accph['phone'] == $data['phone'] && $acc1['type'] == 1 && $accph['level'] ==0){
				$code = I('post.codetype');
				if( $code == 0){ //传入标识，以判断已注册手机号绑定时，弹框确认
					Response::show(205,'对不起，您填写的手机号为个人账户手机号，确定要绑定吗！' );
				}else{
					$map = array(
					'user_id'=>$accph['id'],
					'acc_id'=>$id
					);
					$z->where('acc_id='.$acc1['id'])->setField($map); 
					if($acc1['user_id']){
						
						$map2 = array('itype'=>0);
						$user-> where('id='.$acc1['user_id'])->setField($map2);
					}
					//2把绑定的存在的新手机号的id itype 值为1
					$map3 = array('itype'=>1);
					
					$user-> where('id='.$accph['id'])->setField($map3);
					
					//3 更新当前绑定的二级账户信息
					$user->where('id='.$acc1['id'])->data($data)->save();
					Response::show(200,'绑定修改成功!' );
				}
				
				
			}elseif($accph['phone'] == $data['phone'] && $acc1['type'] == 1 && $accph['level']==2 ){
				Response::show(201,'对不起，您填写的手机号为二级账户手机号，无法绑定!' );
			}else{
				if($user->where(array('id'=>$id))->data($data)->save()){
					$map3 = array('itype'=>0);
					$user-> where('id='.$acc1['user_id'])->setField($map3);
					Response::show(200,'绑定修改成功!' );
					
				}else{
					Response::show(401,'绑定修改失败!' );
					
				}
			}
		}
		
		
		
		
	}
	
	//二级账户关注列表
	public function focuslist(){
		$res = $this->model->focusList();
		$data = array(
			'result' => $res['data']
		);
		
			
		if($data['result'] == null ){
			Response::show(401,'没有数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data );
			
		}
		
	}
	
	//删除二级账户
	public function delete(){
		
		$id = I('post.id', 0);
		$jpush = $this->model->where('id='.$id)->find();
		if($this->model->delete($id) !== FALSE){
			
			jgpushAccount($jpush['jpush']);
			Response::show(200,'二级账户删除成功!');
		
		}else{
			Response::show(401,'$this->model->getError()!',$data );
			
		}


	}
	
	
	//停用二级账户
	public function stopacc(){
		$id = I('post.id', 0);
		$map = array(
			'itype' => 1
		);
		$pack = $this->model->where(array('id'=>$id))->setField($map);
		if($pack){
			Response::show(401,'二级账户停用成功!');
		
		}else{
			Response::show(200,'二级账户停用失败!');
			
		}
		
	}
	//启用二级账户
	public function startacc(){
		$id = I('post.id', 0);
		$map = array(
			'itype' => 0
		);
		$pack = $this->model->where(array('id'=>$id))->setField($map);
		if($pack){
			Response::show(401,'二级账户停用成功!');
		
		}else{
			Response::show(200,'二级账户停用失败!');
			
		}
	}
	
	
	//分享名片
	public function enjoymember(){
		//发送用户id
		$fromUserId = I('post.fromUserId');
		$toUserId = I('post.toUserId');
		$objectName = "RC:ImgTextMsg";
		$shareid = I('post.shareid');
		//分享用户到多人 
		$toUserId = explode(',',$toUserId);
		
		$user = $this->model->field('id,companyname,username,logo')->where(array('id'=>$shareid))->find();
		
			$conf = array(
				'title' => '分享名片',
				'content'=>PHP_EOL .($user['companyname']?$user['companyname']:'') . PHP_EOL . ($user['username']?$user['username']:''),
				'imageUri' => 'https://xh.2188.com.cn'.$user['logo'],
				'user'=> array(
					'id'=> $user['id'],
					'name'=> $user['username'],
					'icon'=> 'https://xh.2188.com.cn'.$user['logo'],
				)
			);
		
		$content = json_encode($conf,JSON_UNESCAPED_UNICODE);
		//p($content);
		$key_secret=get_rong_key_secret();
		$rong = new RongCloud($key_secret['key'],$key_secret['secret']);
		foreach($toUserId as $v){
			$token = $rong->curl('/message/publish',array(
				'fromUserId'=>$fromUserId,
				'toUserId'=>$v,
				'objectName'=>$objectName,
				'content' => $content
			));
		}
		
		
		echo $token;
		
		
	}
	
	
	
	
	
	
	
	
	
}

?>