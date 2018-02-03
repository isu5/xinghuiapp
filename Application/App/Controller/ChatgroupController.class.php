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
		$res = $this->chat->grouplistsCount();
		if($res == false ){
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
	
	// 增加/修改 群组公告
	public function editbull(){
		$data['title'] = I('post.title');
		$map['content'] = I('post.content');
		
		if(IS_POST){
			
			if($this->chat->create()){
				if($this->chat->where(array('title'=>$data['title']))->save($map)){
					Response::show(200,'修改成功!',$map );
				}else{
					Response::show(401,'修改失败' );
				}
			}	
		}
			
	}
	
	//获取群组公共内容
	public function bullcont(){
		$data['title'] = I('post.title');
		$res = $this->chat->field('content')->where(array('title'=>$data['title']))->find();
		
		if(IS_POST){
			if($res !== null){
				Response::show(200,'获取数据成功!',$res);
			}else{
				Response::show(401,'没有公告!');
			}
			
		}
		
	}
	
	
	

}
