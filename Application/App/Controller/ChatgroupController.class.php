<?php
/**
 * 融云创建群组
 */

namespace App\Controller;
use Org\Nx\Response;
class ChatgroupController extends PublicController{
	
	private $chat = null;
	private $user = null;
	public function _initialize(){
		parent::_initialize();
		$this->chat = D('Chatgroup');
		$this->user = D('User');
	}
	//创建群组
	public function add(){
		
		if(IS_POST){
			if($this->chat->create(I('post.',1))){
				if($this->chat->add()){
					Response::show(200,'创建成功!');
				}else{
					Response::show(401,'创建失败!');
				}
			}	
		}
	}
	//更新创建群组
	public function addtest(){
		$chatgm = M('Chatgroup_member');
		//循环传入的群组成员id 保存到中间表中
		if(IS_POST){
			if($this->chat->create(I('post.',1))){
				if($id = $this->chat->add()){
					if($id){
						$s_id = explode(',',I('post.s_id'));
						$arr = [];
						foreach($s_id as $v){
							$arr['chat_id'] = $id;
							$arr['c_id'] = I('post.c_id');
							$arr['s_id'] = $v;
							$chatgm->add($arr);
						}
					}
					Response::show(200,'创建成功!');
				}else{
					Response::show(401,'创建失败!');
				}
			}	
		}
	}
	
	//检测 群组是否存在
	public function ischat(){
		$res = $this->chat->rongchat();
		$data = array(
				'result' => $res['data'],	
			);
		
		if($data['result'] == null ){
			Response::show(401,'讨论组未创建!');
			
		}else{
			Response::show(200,'讨论组已存在!',$data);
		}
	}
	
	//群组列表
	public function index(){
		$res = $this->chat->search();
		$data = array(
				'result' => $res['data'],	
				//'page' => $res['page'],	
			);
		
		if($data['result'] == null ){
			Response::show(401,'讨论组未创建!');
			
		}else{
			Response::show(200,'获取数据成功!',$data);
		}
	}
	
	//群组人员列表
	public function grouplist(){
		$res = $this->chat->grouplists();
		$data = array(
				'result' => $res['data'],	
				//'page' => $res['page'],	
			);
		
		if($data['result'] == null ){
			Response::show(401,'您查询的群组不存在!');
			
		}else{
			Response::show(200,'获取数据成功!',$data);
		}
		
	}
	//群组人员列表人数
	public function groupListCount(){
		$res = $this->chat->grouplistsCountTest();
		
		if($res === false ){
			Response::show(401,'没有查询到群组人数!');
			
		}else{
			Response::show(200,'获取数据成功!',$res);
		}
		
	}
	
	//删除群组
	public function delgroup(){
		$id = I('post.id',0);
		if(IS_POST){
			if($this->chat->delete($id) !== FALSE){
				Response::show(200,'群组删除成功!');
			}else{
				
				Response::show(200,'群组删除失败!');
			}
		}
	}
	
	//新增群组成员
	public function addGroupUser(){
		$res = $this->chat->addGroup();
		
		if($res){
			Response::show(200,'新增群组成员成功!');
		}else{
			Response::show(401,'新增群组成员失败!');
		}
		
	
		
		
	}
	
	//未拉取的群组列表
	public function noGroupList(){
		//$focus = D('Conferencefocus');
		$res = $this->user->nogrouplists();
		$data = array(
				'result' => $res['data'],	
				//'page' => $res['page'],	
			);
		//p($res);die;
		if($data['result'] == null ){
			Response::show(401,'没有可添加的好友了!');
			
		}else{
			Response::show(200,'获取数据成功!',$data);
		}
	}
	//更新未拉取的群组列表
	public function noGroupListTest(){
		//$focus = D('Conferencefocus');
		$res = $this->user->nogrouplistsTest();
		$data = array(
				'result' => $res['data'],	
				//'page' => $res['page'],	
			);
		//p($res);die;
		if($data['result'] == null ){
			Response::show(401,'没有可添加的好友了!');
			
		}else{
			Response::show(200,'获取数据成功!',$data);
		}
	}
	
	// 增加/修改 群组公告
	public function editbull(){
		$data['title'] = I('post.title');
		
		if(IS_POST){
			
			if($this->chat->where(array('title'=>$data['title']))->save()){
				Response::show(200,'修改成功!',$data );
			}else{
				Response::show(401,'修改失败' );
			}
			
		}
			
	}
	//移除群组成员
	public function delGroupman(){
		$rongid	= I('post.rongid');
		$uid = I('post.uid');
		$chat = M('Chatgroup');
		$map = $this->chat->field('id,s_id')->where(array('rongid'=>$rongid))->find();
		//print_r($map['s_id']);
		$sid = explode(',',$map['s_id']);
		
		$s_id = str_replace($uid,'',$sid);
		$str = implode(',',$s_id);
		$data = trim($str,',');
		
		if(IS_POST){
			
			$res = $chat->where(array('id'=>$map['id']))->setField('s_id',$data);
			
			if($res){
				
				Response::show(200,'移除成功!' );
			}else{
				Response::show(401,'移除失败!' );
			}
		} 
		
		
	}
	 //更新移除群组成员
	public function delGroupmantest(){
		$rongid	= I('post.rongid');
		$uid = I('post.uid');
		$map = $this->chat->field('id')->where(array('rongid'=>$rongid))->find();
		$chatgm = M('Chatgroup_member');
		$s_id = explode(',',$uid);
		
		$where = array(
			'id' => $map['id'],
			's_id'=>array('in',$s_id),
		);
		
		if(IS_POST){
			if($chatgm->where($where)->delete() ===false){
				
				Response::show(401,'移除失败!' );
			}else{
				Response::show(200,'移除成功!' );
			}
		} 
		
		
		
	}
	
	
	
	

}
