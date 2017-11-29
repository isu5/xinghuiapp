<?php
/**
 * 会议管理
 *
 */

namespace App\Controller;
use Org\Nx\Response;
class ConferenceController extends PublicController{
	private $cert = null;
	private $cate = null;
	private $user = null;
	private $im = null;
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Conference'); 
		$this->cert = D('Certify');
		$this->cate = D('Conferencecate');
		$this->user = D('User');
		$this->im = D('Rongcloudim');
	}

	
	
	
	//发布的会议
    public function index(){
        
    	$data = $this->model->sendConf();
		
		/* p($data); */
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		/* $this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			)); */
		$data = array(
			'result' => $data['data'],
			'page' => $data['page']
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
		
    }

    //添加前置操作方法
    
	public function _before_add(){  
    
		$uid = I('post.uid');
		$info = $this->cert->field('is_cert,uid,type')->where(array('uid'=>$uid))->select();
		//p($info);
		//is_cert 为空，或者大于=3的时候，提示要实名认证
		if($info[0]['is_cert'] > 3 || empty($info[0]['is_cert'])){
			
			Response::show(401,'请先企业验证!');
		}
      }  
	
	//新建会议
	public function add(){
		
		
		if (IS_POST) {
			
			//p($_POST);die;
			if($this->model->create(I('post.',1))){
				if($this->model->add()){
					
					Response::show(200,'添加成功!');
					exit;
				}else{
					Response::show(401,'添加失败!');
				}
			}else{
				Response::show(402,'添加数据不合法!',$this->model->getError());
			}

		}
		/* //获取栏目
		$cate = $this->cate->getTree();
		Response::show(200,'获取数据成功!',$cate);
		//p($cate); */
		
		/* //获取举办公司名称
		$data = $this->model->field('id,companyname')->where(array('uid'=>$uid))->find();
		$this->assign('data',$data); */
		
	}
	
	
	
	
	//意见反馈
	public function message(){
	//p($_POST);die;
		$m = M('Message');
		$data['user_id'] = I('post.user_id');
		$data['content'] = I('post.content');
		$data['addtime'] = time();
		
		if(IS_POST){
			
			if($m->create()){
				
				if($m->add($data)){
					return Response::show(200,'意见反馈成功!',$data);
				}else{
					Response::show(401,'意见反馈失败!');
				}
			}else{
				Response::show(402,'数据不合法!',$m->getError());
			}
		}
		

	
	}
	
	//会议详情当条数据
	public function getOne(){
		
		if( IS_POST ){
			$res = $this->model->showOne();
		
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
		//p($data);
		
		
	}
	//会议详情滚动图片
	public function metpic(){
		if( IS_POST ){
			$res = $this->model->qupic();
		
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
	
	//返回关注状态
	public function focusStatus(){
		$data['user_id'] = I('post.user_id');
		$data['conf_user_id'] = I('post.conf_user_id');
		$focus = D('Conference_focus');
		$user = $focus->where(array('user_id'=>$data['user_id'],'conf_user_id'=>$data['conf_user_id']))->find();
		if(IS_POST){
			if($user){
				$rest['is_att'] = 1;
				return Response::show(401,'您已关注该企业，请勿重复关注!',$rest);
				
			}else{
				$rest['is_att'] = 0;
				return Response::show(200,'您未关注该企业',$rest);
			}
		}
			
		
	}
	
	
	
	
	//关注企业
	public function attention(){
		
		$focus = D('Conference_focus');
		$data['user_id'] = I('post.user_id');
		$data['conf_user_id'] = I('post.conf_user_id');
		
		if(IS_POST){
			if($focus->create()){
				$user = $focus->where(array('user_id'=>$data['user_id'],'conf_user_id'=>$data['conf_user_id']))->find();
				if($user){
					return Response::show(401,'您已关注该企业，请勿重复关注!');
					
				}else{
					$userid = $this->user->where(array('id'=>$data['user_id'],'pid'=>$data['conf_user_id']))->find();
					if($userid){
						Response::show(202,'二级账户不能关注自己企业!');
					}else{
						if($focus->add($data)){
					
						Response::show(200,'关注成功!');
						
					
						}else{
							Response::show(201,'关注失败!');
						}
					}
					
				
				}
			}else{
					
				Response::show(402,'数据不合法!',$focus->getError()); 
			}
		}
		
	}
	//取消关注
	public function cancel(){
		$focus = D('Conference_focus');
		$data['user_id'] = I('post.user_id');
		$data['conf_user_id'] = I('post.conf_user_id');
		if(IS_POST){
			if($focus->create()){
				$user = $focus->where(array('user_id'=>$data['user_id'],'conf_user_id'=>$data['conf_user_id']))->delete();
				if($user){
					return Response::show(200,'取消关注成功!');
					
				}else{
					
					Response::show(401,'取消关注失败!');
				}
			}else{
					
				Response::show(402,'数据不合法!',$focus->getError()); 
			}
		}
		
	}
	//通讯录列表
	public function focuslist(){
		if( IS_POST ){
			$res = $this->user->focus();
		
			$data = array(
				'result' => $res['data'],
				'page' => $res['page'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
		
	}
	//搜索通讯录
	public function searchFocuslist(){
		//p($_POST);
		if( IS_POST ){
			$res = $this->user->searchFocus();
		
			$data = array(
				'result' => $res['data'],
				'page' => $res['page'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
		
	}
	
	//搜索全部用户--关注
	public function searchAllUserlist(){
		if( IS_POST ){
			$res = $this->user->searchAll();
		
			$data = array(
				'result' => $res['data'],
				'page' => $res['page'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
	}
	
	/**
	* 企业详情
	*/
	public function companyqx(){
		if( IS_POST ){
			$res = $this->user->company();
		
			$data = array(
				'result' => $res['data'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
		
	}
	
	//企业会议公告
	
	public function companybull(){
		$bull = D('Conferencebull');
		
		$res = $bull->companybulls();
			
		$data = array(
			'result' => $res['data'],
			'page' => $res['page'],
			
		);
		//p($data);die;
		if($data['result'] == null ){
			Response::show(401,'没有数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
		
	}
	
	
	
	//返回立即参会状态
	public function joinStatus(){
		$data['conf_id'] = I('post.id');
		$data['user_id'] = I('post.user_id');
		$join = D('Conference_audit');
		$user = $join->where(array('user_id'=>$data['user_id'],'conf_id'=>$data['conf_id']))->find();
		//获取该会议是不是需要审核人员
		$is_user = $this->model->where(array('id'=>$data['conf_id']))->find();
		//print_r($is_user);die;
		
		//p($user);die;
		//当前时间
		$time = time();
		//会议报名截止时间
		$btime = strtotime($is_user['qtime']);
		
		if(IS_POST){
			
			if($user['status'] == 3){
				return Response::show(200,'审核中',$rest);
				
			}elseif($user['status'] == 1 ){
				return Response::show(201,'审核已通过，请按时签到参加会议');
			}elseif($user['status'] == 2){
				return Response::show(202,'您已被拒绝参会！');
			}elseif($user['status'] == 4){
				return Response::show(204,'您已扫码签到，请入场参会！参会中');
			}elseif($user['status'] == 5){
				return Response::show(203,'会议已结束');
			}else{
				/* if($time <= $btime){
					return Response::show(402,'报名已截止');
				} */
				return Response::show(401,'立即参加');
			}
		}
			
		
	}
	
	
	
	//立即参加会议
	public function joinUp(){
		
		$audit = D('Conference_audit');
		$auditlist = D('Conference_auditlist');
		$data['conf_id'] = I('post.conf_id');
		$data['user_id'] = I('post.user_id');
		//判断是否审核参会人员
		$is_user = $this->model->where(array('id'=>$data['conf_id']))->find();
		
		if($is_user['is_user'] == 1){
			$data['status'] = 3;
		}else{
			$data['status'] = 1;
		}
		
		if(IS_POST){
			if($audit->create() && $auditlist->create() ){
				$audits = $audit->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->find();
				$auditlists = $auditlist->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->find();
				if( $audits && $auditlists ){
					return Response::show(401,'您已参加会议，请勿重复提交!');
					
				}else{
					if($audit->add($data) && $auditlist->add($data) ){
					
						Response::show(200,'参加成功!');
						
					}else{
						Response::show(403,'参加失败!');
					}
				
				}
			}else{
					
				Response::show(402,'添加数据不合法!',$audit->getError()); 
			}
		}
	}
	
	
	
	
	
	//生成二维码
	public function dicaoliao($id){
		
		qrcode($id);
	}
	
	//参加会议后的人员审核  
	public function audit(){
		
		$audit = D('Conference_audit');
		$auditlist = D('Conference_auditlist');
		$data['conf_id'] = I('post.conf_id');
		$data['user_id'] = I('post.user_id');
		$jpush = $this->user->where('id='.$data['user_id'])->find();
		$users = $audit->where(array('user_id'=>$data['user_id']))->select();
		
		
		
		if(I('post.status') == 2){  //2 拒绝
			$audit->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->setField('status',2);
			$auditlist->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->setField('status',2);
			Response::show(200,'您已拒绝!');
		} 
		if(I('post.status') == 1){  //1 同意
			$audit->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->setField('status',1);
			$auditlist->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->setField('status',1);
			//p($audit->getLastSql());
			//极光推送审核成功
			jgpushAgreed($jpush['jpush']);
			Response::show(200,'您已同意!');
		} 
			
	}
	//参会人员列表
	public function auditlist(){
		if( IS_POST ){
			$res = $this->user->auditPartici();
		
			$data = array(
				'result' => $res['data'],
				'page' => $res['page'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!',$this->user->getError());
			
		}
	}
	
	//已审核人员列表
	public function auditedList(){
		$audit = D('Conferenceaudit');
		$res = $audit->audited();
		
		if( IS_POST ){
			
			$data = array(
				'result' => $res['data'],
				'page' => $res['page'],
				
			);
			//p($data);
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!',$this->user->getError());
			
		}
	}
	
	//我参加的 待审核列表
	public function myaudit(){
		if( IS_POST ){
			$res = D('Conferenceauditlist')-> myauditlist();
			$data = array(
				'result' => $res['data'],
				'page' => $res['page'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!',$this->model->getError());
			
		}
		
		
	}
	
	// 我发布的 参会人员列表
	public function myauditlist(){
		if( IS_POST ){
			$res = D('Conferenceaudit')-> myauditPartici();
			$data = array(
				'result' => $res['data'],
				'page' => $res['page'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!',$this->model->getError());
			
		}
	}
	//我发布的，所有参会人员列表 没有分页
	public function imauditlist(){
		if( IS_POST ){
			$res = D('Conferenceaudit')-> rongImAuditList();
			$data = array(
				'result' => $res['data'],
				
			);
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!',$this->model->getError());
			
		}
	}
	
	//删除我发布的会议
	public function myauditdel(){
		
		$data['conf_id'] = I('post.conf_id');
		
		$myaudit = D('Conferenceaudit');
		
		if(IS_POST){
			$post = $myaudit->where(array('conf_id'=>$data['conf_id']))->delete();
			$conf = $this->model->where(array('id'=>$data['conf_id']))->delete();
			
			if($post && $conf ){
				return Response::show(200,'删除成功!');
				
			}else{
				
				Response::show(401,'删除失败!');
			}
		}
	}
	
	//融云---创建会议讨论组
	
	public function rongCloudIm(){
		if(IS_POST){
			if($this->im->create(I('post.',1))){
				if($this->im->add()){
					Response::show(200,'创建成功!');
				}else{
					Response::show(401,'创建失败!');
				}
			}
		}
		
	}
	
	//查询是否存在讨论组
	public function isrongim(){
		$res = $this->im->rongim();
		$data = array(
				'result' => $res['data'],	
			);
		
		if($data['result'] == null ){
			Response::show(401,'讨论组未创建!');
			
		}else{
			Response::show(200,'讨论组已存在!',$data);
		}
		
	}
	
	//检测当前用户是否参会
	public function isAttendConf(){
		$m = D('Conferenceaudit');
		if(IS_POST){
			$res = $m->attendConf();
			$data = array('result' => $res['data'],);
			
			if($data['result'] == null ){
				Response::show(401,'还没有参会呢!');
				
			}else{
				Response::show(200,'您已参加会议了!');
			}
			
		}
		
	}
	
	
	
	
	
	
	
	




}