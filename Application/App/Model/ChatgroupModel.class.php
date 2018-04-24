<?php
/**
 * 通讯录融云群组模型
 */
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class ChatgroupModel extends BaseModel{


	
	//是否存在讨论组
	public function rongchat(){
		$where = [];
		$rongid = I('post.rongid');
		
		$where['rongid'] = $rongid; 
		
		$data['data'] = $this
		->where($where)
		->find();
		//p($this->_Sql());
		return $data;
		
	}
	
	
	//分页返回对应用户所有群组集合
	public function search(){

		//搜索
		$where = array();
		$where['c_id'] = I('post.c_id');
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->where($where)->limit(($curpage - 1) * $showrow.','.$showrow)->order('id desc')->select();

		return $data;
	}

	public function _before_insert(&$data,$option){
		$data['addtime'] = time();
		
	}
	
	//群组人员列表
	public function grouplists(){
		$where = [];
		$rongid = I('post.rongid');
		$user = D('User');
		$str = $this->where(array('rongid'=>$rongid))->find();
		$where['b.chat_id'] = $str['id'];
		
		$uid = I('post.uid'); //传入当前用户id
		
		//屏蔽当前用户
		$where['b.s_id'] = array('neq',$uid);
		//翻页
		
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')
		->field('c.id,c.logo,c.companyname,c.username,c.phone,c.type,c.nickname,c.level')
		->join('left join __CHATGROUP_MEMBER__ b on b.chat_id=a.id
			left join __USER__ c on c.id = b.s_id
		')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field('c.id,c.logo,c.companyname,c.username,c.phone,c.type,c.nickname,c.level')
		->join('left join __CHATGROUP_MEMBER__ b on b.chat_id=a.id
			left join __USER__ c on c.id = b.s_id
		')
		->where($where)->limit(($curpage - 1) * $showrow.','.$showrow)->order('id desc')
		
		->select();
		
		//p($this->_Sql());
		
		return $data;	
		
	}
	//群组人员列表人数统计
	public function grouplistsCount(){
		$where = [];
		$rongid = I('post.rongid');
		$str = $this->where(array('rongid'=>$rongid))->find();
		//p($str);
		if($str){
			$where['id'] = array('in',$str['s_id']);
		}else{
			return false;
		}
		
		$total = D('User')->where($where)->count();	
		//p($total);
		p($this->_Sql());
		return $total;
	}
	//更新群组人员列表人数统计
	public function grouplistsCountTest(){
		$where = [];
		$rongid = I('post.rongid');
		$chatgm = M('Chatgroup_member');
		$str = $this->where(array('rongid'=>$rongid))->find();
		$s_id = $chatgm->where(array('chat_id'=>$str['id']))->select();
		$sids = array_column($s_id, 's_id');
		$sid = implode(',',$sids);
		$total = M('User')->where(array('id'=>array('in',$sid)))->count();	
		//print_r($total);
		//p($this->_Sql());
		return $total;
	}
	
	
	
	
	//新增群组成员
	public function addGroup(){
		
		$id = I('post.id');
		$chatgm = M('Chatgroup_member');
		//$data = $this->where(array('id'=>$id))->find();
		/* $sid = explode(',',$s_id);
		$sids = implode(',',$sid); */
		/* $group = array_unique($sid);
		$sids = array_merge($sid,$group);
		
		$condition=array();
		$condition['id']=1;
		$data=array();
		$data['a']=array('exp','a.123');
		M('tableName')->where($condition)->save($data);
		
		 */
		// p($sid);
		//update table set user=concat(user,$user) where xx=xxx; 
		
		//$this->query('update  tzht_chatgroup set s_id=concat(s_id,",'.$s_id.'") where id='.$id.'');
		/* $data=array();
		//保持原有数据不变，增加新值到字段里
		$data['s_id'] = array('exp','concat(s_id,",'.$s_id.'")');
		
		$this->where(array('id'=>$id))->save($data);
		//p($this->_Sql());
		return true; */
		$data = $this->where(array('id'=>$id))->find();
		if($data['id']){
			$s_id = explode(',',I('post.s_id'));
			$arr = [];
			foreach($s_id as $v){
				$arr['chat_id'] = $id;
				$arr['c_id'] = $data['c_id'];
				$arr['s_id'] = $v;
				$chatgm->add($arr);
			}
		}
		return true;
		
	}
	
	
	//未拉取的群组列表
	public function nogrouplists(){
		$where = [];
		$title = I('post.rongid');
		$c_id = I('post.c_id');
		
		// 查群组中s_id 有哪些用户，
		$str = $this->where(array('rongid'=>$title))->find();
		
		if($str){
			$where['id'] = array('in',$str['s_id']);
		}else{
			return false;
		}
		
		//查通讯录中的用户->group('user_id')  二维数组转一维数组$names = array_column($msg, 'name');
		$tongxun = D('Conference_focus')->field('conf_user_id')->where('user_id='.$c_id)->select();
		
		$txarr = array_column($tongxun, 'conf_user_id');
		$tx = implode(',',$txarr);
	
		if($tongxun){
			$where['id'] = array('not in',$tx);
		}else{
			return false;
		}
		
		//翻页
		
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = D('User')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = D('User')
		->field('id,logo,companyname,username,phone')
		->where($where)->limit(($curpage - 1) * $showrow.','.$showrow)->order('id desc')
		
		->select();
		
		//p($this->_Sql());
		
		return $data;
	} 



}