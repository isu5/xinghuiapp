<?php
/**
* 会议群组接口
*/
namespace App\Controller;
use Org\Nx\Response;
use Common\Third\RongCloud;

class ConferencegroupchatController extends PublicController{
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->chat = D('Conferencegroupchat');
		$this->center = D('Conferencegroupchatcenter');
		
	}
	
	
	
	//创建群组
	public function createchat(){
		/* $where = [];
		$where['user_id'] = I('post.user_id');
		$where['group_id'] = I('post.group_id');
		$where['title'] = I('post.group_name');
		
		$key_secret=get_rong_key_secret();
		$rong = new RongCloud($key_secret['key'],$key_secret['secret']);
		
		//创建群组
		$chat = $rong->groupCreate($where['user_id'],$where['group_id'],$where['title']);
		if($chat){
			if(IS_POST){
				if ($this->chat->create(I('post.',1))){
					if($this->chat->add($where)){
						Response::show(200,'创建成功');
					}else{
						Response::show(401,'创建失败');
					}
				}else{
				
				Response::show(402,$this->model->getError());
				}
			}
		} */
		//现在创建会议时添加，发布者为群主，用户id用群主，群组id为该发布会议，群组名称为会议标题
		
		
	}
	
	//加入群组
	public function joinchat(){
		$where = [];
		$data['user_id'] = I('post.user_id');
		$data['group_id'] = I('post.group_id');
		$where['title'] = I('post.group_name');
		
		//检测是否存在
		$center = $this->center->where(array('user_id'=>$data['user_id'],'group_id'=>$data['group_id']))->find();
		if($center > 1){
			Response::show(401,'该群组已存在');
			exit;
		}
		$key_secret=get_rong_key_secret();
		$rong = new RongCloud($key_secret['key'],$key_secret['secret']);
		//创建群组
		$chat = $rong->groupCreate($data['user_id'],$data['group_id'],$where['title']);
		
		if($chat){
			
			if(IS_POST){
				if ($this->center->create(I('post.',1))){
					if($this->center->add($data)){
						Response::show(200,'加入成功');
					}else{
						
						Response::show(401,'加入失败');
					}
				}else{
				
				Response::show(402,$this->model->getError());
				}
			}
		}
	}
	
	//检测群组
	public function checkchat(){
		$where['group_id'] = I('post.group_id');
		$data = $this->chat->where($where)->find();
		//p($this->chat->getLastSql());
		if($data){
			Response::show(200,'该群组已存在',$data);
		}else{
			Response::show(401,'该群组不存在');
		}
		
	}
	
	//会议群组成员
	public function chatmember(){
		$data = $this->center->groupmember();
		
		$data = array(
			'result' => $data['data'],
			'totalsize' => $data['totalsize'],
			//'page' => $data['page']
			);
			
		if($data['result'] != null){
			
			Response::show(200,'数据返回成功',$data);
		}else{
			Response::show(401,'没有数据');
		}
	}
	
	
	//企业会议群组列表
	public function grouplist(){
		$data = $this->chat->grouplist();
		
		$data = array(
			'result'=> $data['data'],
			//'page'=> $data['page'],
		);
		
		if($data['result'] != null){
			
			Response::show(200,'数据返回成功',$data);
		}else{
			Response::show(401,'没有数据');
		}
	}
	
	//解散群组
	public function dissolvedgroup(){
		$where = [];
		$data['user_id'] = I('post.user_id');
		$data['group_id'] = I('post.group_id');
		
		$key_secret=get_rong_key_secret();
		$rong = new RongCloud($key_secret['key'],$key_secret['secret']);
		//解散群组
		$chat = $rong->groupDismiss($data['user_id'],$data['group_id']);
		
		//更新群组列表，即删除，群组表中相对应的数据
		if($chat){
			$res = $this->chat->where($data)->delete(); //主表
			
			if($res){
				$res2 = $this->center->where(['group_id'=>$data['group_id']])->delete(); //附表
				if($res2)
				Response::show(200,'解散成功');
			}else{
				Response::show(401,'解散失败');
			}
		}
		
	}
	
	//
	
	
	
	
	
	
}