<?php
/**
 * 会议管理
 *
 */

namespace Home\Controller;
use Org\Nx\Response;
class ConferenceController extends PublicController{
	private $cert = null;
	private $cate = null;
	private $user = null;
	private $jgpush = null;
	public function _initialize(){
		parent::_initialize();
		$this->model = D('Conference'); 
		$this->cert = D('Certify');
		$this->user = D('User');
		$this->cate = D('Conferencecate');
		//个人推送
		$this->jgpush = D('Jgpushperson');
		//p($info);	
		
		
		
		
		
	}

	//已参加会议
    public function index(){
        
    	$data = $this->model->searchFront();
		//p($data);
    	/* p($this->model->getlastsql());
    	
    	p($_COOKIE);die; */
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));


		$this->display();
    }

    //添加前置操作方法
    
	public function _before_add(){  
    
		$uid = cookie(userid);
		$info = $this->cert->field('is_cert,uid,type')->where(array('uid'=>$uid))->select();
		//p($info);
		//is_cert 为空，或者大于=3的时候，提示要实名认证
		if($info[0]['is_cert'] >= 3 || empty($info[0]['is_cert'])){
			$this->error('请先企业验证，认证审核通过后即可发布会议',U('Certify/index'));
		}
      }  
	
	//新建会议
	public function add(){
		
		$uid = cookie(userid);
		if (IS_POST) {
			
			//p($_POST);die;
			if($this->model->create(I('post.',1))){
				if($this->model->add()){

					$this->success('添加成功',U('Conference/index'));
					exit;
				}else{
					$this->error('添加失败');
				}
			}else{
				$this->error($this->model->getError());
			}

		}
		//获取栏目
		$cate = $this->cate->getTree();
		$this->assign('cate',$cate);
		//p($cate);
		
		//获取举办公司名称
		$cert = $this->cert->field('id,company')->where(array('uid'=>$uid))->find();
		//p($cert);
		$this->assign('cert',$cert);
		$this->display();
	}
	
	//编辑
	public function edit(){
		$id = I('get.id');
		$uid = cookie('userid');
		if(IS_POST){
			if($this->model->create(I('post.'), 2)){
				if(FALSE !== $this->model->updateConf()){
					$this->success('修改成功！', U('show', array('id' => $id)));
    				exit;
				}
				
			}
			$this->error($this->model->getError());
		
		}
		
		//获取栏目
		$cate = $this->cate->getTree();
		
		$data = $this->model->where(array('id'=>$id))->find();
		//p($data);
		//资料文档array_filter(explode(',', $data['downfile']));json_decode($data['downfile'],true)
		$row['downfile'] = json_decode($data['downfile'],true);
		$row['downfileArr'] = array_filter(explode('###', $row['downfile']));
		//p($row['downfileArr']);
		//p($row);
		//修改时，获取的认证公司
		$cert = D('Certify')->field('company')->where('uid='.$uid)->find();
		//p($cert);
		
		$this->assign(array(
			'cate'=>$cate,
			'row' =>$row,
			'data'=>$data,
			'cert'=>$cert
			)
		
		);
		//p($data);
		
		$this->display();
	}
	
	//审核人员：同意
	public function agreed(){
		$id = I('get.id');
		$uid = I('get.uid');
		$audit = D('Conference_audit');
		$audit2 = D('Conference_auditlist');
		$jpush = $this->user->where('id='.$uid)->find();
		$data =  $audit->where(array('conf_id'=>$id,'user_id'=>$uid))->setField('status',1);
		$auditlist =  $audit2->where(array('conf_id'=>$id,'user_id'=>$uid))->setField('status',1);
		
		if($data && $auditlist){
			//极光推送审核成功
			jgpushAgreed($jpush['jpush']);
			$code = array('status'=>'y','info'=>'您已同意');
		}else{
			$code = array('status'=>'n','info'=>'操作失败');
		}
		$this->ajaxReturn($code);
		
	}
	//审核人员：拒绝
	public function refused(){
		$id = I('get.id');
		$uid = I('get.uid');
		$audit = D('Conference_audit');
		$audit2 = D('Conference_auditlist');
		$data =  $audit->where(array('conf_id'=>$id,'user_id'=>$uid))->setField('status',2);
		$auditlist =  $audit2->where(array('conf_id'=>$id,'user_id'=>$uid))->setField('status',2);
		
		if($data && $auditlist){
			$code = array('status'=>'y','info'=>'您已拒绝');
		}else{
			$code = array('status'=>'n','info'=>'操作失败');
		}
		$this->ajaxReturn($code);
	}
	
	
	
	
	//删除会议
	public function delete(){
		$id = I('get.id', 0);
		//待审核表
		$auditlist = D('Conferenceauditlist');
		$audit = D('Conferenceaudit');
		
		if($this->model->delete($id) !== FALSE){
			//发布者删除会议时，也删除掉待审核表中的相对应的id
			$auditlist->where(array('conf_id'=>$id))->delete();
			$audit->where(array('conf_id'=>$id))->delete();
			$code = array('status'=>'y','info'=>'会议删除成功');
		}else{
			$this->error($this->model->getError());
			$code = array('status'=>'n','info'=>'会议删除失败');
		}
		$this->ajaxReturn($code);
	}
	
	//显示单条数据
	public function show(){
		
		$data = $this->model->showOne();
		//p($data);
		$this->assign('data',$data);
		
		$this->display();
	}
	
	//生成二维码
	public function dicaoliao($id){
		
		qrcode($id);
	}
	
	//审核人员列表
	public function auditlist(){
	
		$data = $this->user->auditPartici();
		//p($data);die;
		$this->assign(array(
			'data' => $data['data'],
			'page' => $data['page']
			));

		$this->display();
	}
	
	//我参加的 待审核列表
	public function myaudit(){
		
		$res = D('Conferenceauditlist')-> myauditlist();
		
		$this->assign(array(
			'data' => $res['data'],
			'page' => $res['page'],
			
		));
			
		
		$this->display();
		
	}




}