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
	private $jgpush = null;
	private $signjgpush = null;
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Conference'); 
		$this->cert = D('Certify');
		$this->cate = D('Conferencecate');
		$this->user = D('User');
		$this->im = D('Rongcloudim');
		$this->jgpush = D('Jgpushperson');
		$this->signjgpush = D('Signjgpush');
	}

	
	
	
	//发布的会议列表
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
			//'page' => $data['page']
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
		
		//判断用户是否是二级账户
		
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
				if($id = $this->model->add()){
					$data = $this->model->field('title,ctime,qtime,brief,uid,is_private')->where(array('id'=>$id))->find();
					//判断会议为内部会议时，推送发布者下的二级账户会议消息
					if($data['is_private'] == 1){
						//查找所有pid下的子id
						$user = $this->user->field('id,pid,jpush')->where('pid='.$data['uid'])->select();
						foreach($user as $k=>$v){
							//推送二级账户消息
							jgpushInside($v['jpush'],$id,$data['title'],$data['brief']);
						}
					}
					Response::show(200,'添加成功!',$id);
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
				$rest['note'] = $user['note'];
				return Response::show(401,'您已关注该企业，请勿重复关注!',$rest);
				
			}else{
				$rest['is_att'] = 0;
				$rest['note'] = $user['note'];
				return Response::show(200,'您未关注该企业',$rest);
			}
		}
			
		
	}
	
	//修改用户备注名称
	public function remarkNote(){
		$data['user_id'] = I('post.user_id');
		$data['conf_user_id'] = I('post.conf_user_id');
		$map['note'] = I('post.note');
		$focus = D('Conference_focus');
		if(IS_POST){
			$id = $focus->where(array('user_id'=>$data['user_id'],'conf_user_id'=>$data['conf_user_id']))->save($map);
			if($id){
				Response::show(200,'备注成功!');
			}else{
				Response::show(401,'备注失败!');
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
					/* $userid = $this->user->where(array('id'=>$data['user_id'],'pid'=>$data['conf_user_id']))->find();
					if($userid){
						Response::show(202,'二级账户不能关注自己企业!');
					}else{ */
						if($focus->add($data)){
					
						Response::show(200,'关注成功!');
						
					
						}else{
							Response::show(201,'关注失败!');
						}
					/* } */
					
				
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
				//'page' => $res['page'],
				
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
	
	//被关注人员
	public function refocuslist(){
		if( IS_POST ){
			$res = $this->user->refocuslist();
		
			$data = array(
				'result' => $res['data'],
				//'page' => $res['page'],
				
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
				//'page' => $res['page'],
				
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
			//'page' => $res['page'],
			
		);
		//p($data);die;
		if($data['result'] == null ){
			Response::show(401,'没有数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
		
	}
	//删除公告
	public function delbull(){
		$data['id'] = I('post.id');
		if(IS_POST){
			$res = M('Company_bull')->where(array('id'=>$data['id']))->delete();
			if($res){
				Response::show(200,'删除成功');
			}else{
				Response::show(401,'删除失败');	
			}
		}
	}
	
	//会议修改
	public function edit(){
		$data['id'] = I('post.id');
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
	
	//会议修改上传文件接口
	public function editDownfile(){
		$data = $this->model->editDownfiles();
		if(IS_POST){
			if($data){
				Response::show(200,'修改成功');
			}else{
				Response::show(401,'修改失败');
			}
		}
	}
	//会议修改上传图片接口
	public function editpic(){
		$data = $this->model->editPic();
		if(IS_POST){
			if($data){
				Response::show(200,'修改成功');
			}else{
				Response::show(401,'修改失败');
			}
		}
	}
	
	
	//修改会议资料
	public function editFiles(){
		$data['id'] = I('post.id');
		$oldfile = I('post.oldfile'); //接收的文件路径
		$downfile = app_upload_file('/Uploads/file');  //上传文件
		
		$data['downfile'] = $downfile['pic']."###"; //新上传的文件 和数据库保持文件一致，加###
		$info = $this->model->field('downfile')->where(array('id'=>$data['id']))->find();
		
		$row = str_replace($oldfile,$data['downfile'],$info['downfile']);
		if(IS_POST){
			
			$res = M('Conference')->where(array('id'=>$data['id']))->setField('downfile',$row);
			
			if($res){
				Response::show(200,'替换成功',$row);
			}else{
				Response::show(401,'替换失败');	
			}
		
		}
		
	}
	//会议删除资料
	public function delFiles(){
		$data['id'] = I('post.id');
		$data['downfile'] = I('post.downfile');
		$info = $this->model->field('downfile')->where(array('id'=>$data['id']))->find();
		//$row['downfile'] = array_filter(explode('###', $info['downfile']));
		//p($info);
		//p($row);
		
		if(IS_POST){
			$row = str_replace($data['downfile'],'',$info['downfile']);
			$res = M('Conference')->where(array('id'=>$data['id']))->setField('downfile',$row);
			/* p($this->model->getLastSql());
			p($res);die; */
			if($res){
				Response::show(200,'删除成功',$row);
			}else{
				Response::show(401,'删除失败');	
			}
		}
		
	}
	
	
	
	//返回立即参会状态
	public function joinStatus(){
		$data['conf_id'] = I('post.id');
		$data['user_id'] = I('post.user_id');
		$join = D('Conferenceaudit');
		$user = $join->where(array('user_id'=>$data['user_id'],'conf_id'=>$data['conf_id']))->find();
		//获取该会议是不是需要审核人员
		$is_user = $this->model->where(array('id'=>$data['conf_id']))->find();
		
		//p($user);die;
		//当前时间
		$time = time();
		//会议报名截止时间
		$btime = strtotime($is_user['qtime']);
		
		if(IS_POST){
			//print_r($user);die;
		
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
			//需要审核，状态值为3，为审核中
			$data['status'] = 3;
		}else{
			//不需要审核，状态值为1，为参会中
			$data['status'] = 1;
		}
		$audits = $audit->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->find();
		$auditlists = $auditlist->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->find();
		if(IS_POST){
			if($audits && $auditlists){
					return Response::show(401,'您已参加会议，请勿重复提交!');
				}else{
					if($data['status'] ==3 || $data['status']==1 ){
						$audit->add($data);
						$auditlist->add($data);
						Response::show(200,'参加成功!');
						
					}else{
						Response::show(403,'参加失败!');
					}
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
			//极光推送拒绝提醒
			jgpushRefused($jpush['jpush']);
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
				//'page' => $res['page'],
				
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
				//'page' => $res['page'],
				
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
				//'page' => $res['page'],
				
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
	
	// 待审核人员列表
	public function myauditlist(){
		if( IS_POST ){
			$res = D('Conferenceaudit')-> myauditPartici();
			$data = array(
				'result' => $res['data'],
				//'page' => $res['page'],
				
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
		$id = I('post.conf_id');
		$myaudit = D('Conferenceaudit');
		$myauditlist = D('Conferenceauditlist');
		if(IS_POST){
			//修复app删除会议，审核表中还存在该会议id的bug
			if($this->model->delete($id) !== FALSE){
				$myaudit->where(array('conf_id'=>$id))->delete();
				$myauditlist->where(array('conf_id'=>$id))->delete();
				Response::show(200,'删除成功!');
			}else{
				Response::show(401,'删除失败!',$this->model->getError());
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
	
	//融云会议讨论组：--根据标题查询会议id
	public function findConfId(){
		$data = $this->model->findMettingId();
		//p($data);
		if($data == null ){
			Response::show(401,'没有数据');
			
		}else{
			Response::show(200,'获取成功',$data);
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
	
	//删除我参加的结束的会议
	public function  delEndConf(){
		$data['user_id'] = I('post.user_id');
		$data['conf_id'] = I('post.conf_id');
		$data['deltime'] = time();
		$jpush = M('Conference_del');
		if(IS_POST){
			if($jpush->add($data)){
				Response::show(200,'删除成功!');
			}else{
				Response::show(401,'删除失败!');
			}
		}else{
			Response::show(402,$jpush->getError());
		}
		
		
	}
	
	
	//会议资料下载存储
	public function confDown(){
		$data['user_id'] = I('post.user_id');
		$data['conf_id'] = I('post.conf_id');
		$data['filename'] = I('post.filename');
		$data['downtime'] = time();
		$m = M('Conference_down');
		if(IS_POST){
			if($m->add($data)){
				Response::show(200,'下载成功!');
			}else{
				Response::show(401,'下载失败!');
			}
		}else{
			Response::show(402,$m->getError());
		}
		
	}
	
	//返回下载文件的公司名称
	public function getDownCompany(){
		$res = $this->model->getDownListCompany();
		if(IS_POST){
			
			$data = array('result' => $res['data']);
			
			if($data['result'] == null ){
				Response::show(401,'获取失败!');
				
			}else{
				Response::show(200,'获取成功',$data);
			}
			
		}
	}
	
	
	
	//获取会议资料
	public function getDownfile(){
		$data['user_id'] = I('post.user_id');
		$data['conf_id'] = I('post.conf_id');
		$m = M('Conference_down');
		$file = $this->model->field('downfile')->where(array('id'=>$data['conf_id']))->find();
		//p($file['downfile']);die;
		$down = array_filter(explode('###',$file['downfile']));
		
		$info = $m->field('filename')->where(array('conf_id'=>$data['conf_id']))->find();
		/* print_r($down);
		print_r($info['filename']);
		 */
		
		$parm = array(
			'file' => '',
			'is_down' => ''
		);
		
		if(IS_POST){
			
			 foreach($down as $k=>$v){
				//if(strpos($v,$info['filename']) !==false ){
				if($v !==false){
					if(strpos($v,$info['filename']) !== false ){
						$parm['file'] = $v;
						$parm['is_down'] = 1;
						//echo $v;
						//return Response::show(200,'已下载!',$parm);
						//print_r($parm);
						//$code = json_encode($parm,JSON_UNESCAPED_UNICODE);
						
					}else{
						$parm['file'] = $v;
						$parm['is_down'] = 0;
						//print_r($parm);
						//$code = json_encode($parm,JSON_UNESCAPED_UNICODE);
						//return Response::show(401,'未下载!',$parm);
					}
					//print_r($parm);
				
				$resArr = json_encode($parm,JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
				echo $resArr;
					//return Response::show(401,'未下载!',$parm);
				}
				
			}
			//echo $code;
			
			
						
			/* $fileone = '/Uploads/file/20180319/1521440571/Android1_0_0-1.pdf';
			if(in_array($fileone,$down)){
				$pro['file'] = $fileone;
				$pro['is_down'] = 1;
				Response::show(200,'已下载!',$pro);
			}else{
				$pro['file'] = $down;
				$pro['is_down'] = 0;
				Response::show(401,'未下载!',$pro);
			}		 */
			
		}
	}
	
	
	//企业产品查看统计
	public function productStats(){
		$m = M('Product_stats');
		$data['user_id'] = I('post.user_id');
		$data['conf_user_id'] = I('post.conf_user_id');
		$data['pro_id'] = I('post.pro_id');
		$data['statstime'] = time();
		
		if(IS_POST){
			if($m->add($data)){
				Response::show(200,'添加成功!');
			}else{
				Response::show(401,'添加失败!');
			}
		}
		
		
		
	}
	
	//个性推送
	public function jgpushperson(){
		if(IS_POST){
			if($this->jgpush->create(I('post.',1))){
				if($this->jgpush->add()){
					Response::show(200,'推送成功!');
			
				}else{
					Response::show(401,'添加失败!');
				}
			}else{
				Response::show(402,$this->jgpush->getError());
				
			}
		}
		
	}
	//签到推送
	public function signjppush(){
		
		if(IS_POST){
			if($this->signjgpush->create(I('post.',1))){
				if($this->signjgpush->add()){
					
				Response::show(200,'保存成功!');
				
				}else{
					Response::show(401,'保存失败');
				
				}
			}else{
				Response::show(402,$this->signjgpush->getError());
			}
		
			
		}
		
		
	}
	
	//个人推送历史记录
	
	public function personlist(){
		$data = $this->jgpush->searchFront();
		//p($data);
    	/* p($this->jgpush->getlastsql());
    	
    	 */
		if(IS_POST){
			
			$data = array('result' => $data['data']);
		
			if($data['result'] == null ){
				Response::show(401,'获取失败!');
				
			}else{
				Response::show(200,'获取成功',$data);
			}
			
		}
		
		
	}
	
	//签到消息
	public function signlist(){
		$id = I('post.conf_id');
		$uid = I('post.user_id');
		$data = $this->signjgpush->where(array('user_id'=>$uid,'conf_id'=>$id))->order('addtime desc')->limit(1)->find();
		//p($data);
		if(IS_POST){
			if($data == null ){
				Response::show(401,'获取失败!');
				
			}else{
				Response::show(200,'获取成功',$data);
			}
		}
	}
	//编辑签到消息
	public function signjgpushedit(){
		
		if(IS_POST){
			if($this->signjgpush->create(I('post.',2))){
				//p($_POST);die;
				if($this->signjgpush->save() !== FALSE){
					Response::show(200,'修改成功');
						
				}else{
					Response::show(401,'修改失败!');
				
				}
			}
		
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




}