<?php
/**
*  会议公告列表
*/
namespace App\Model;
use Common\Model\BaseModel;

use Common\Third\AppPage;

class ConferencefocusModel extends BaseModel{
	
	protected $tableName = 'conference_focus';
	
	
	//未拉取的群组列表
	public function nogrouplists(){
		$where = [];
		$title = I('post.title');
		$c_id = I('post.c_id');
		
		// 查群组中s_id 有哪些用户，
		$str = D('Chatgroup')->where(array('title'=>$title))->find();
		
		
		
		//查通讯录中的用户->group('user_id')  二维数组转一维数组$names = array_column($msg, 'name');
		$tongxun = $this->field('conf_user_id')->where('user_id='.$c_id)->select();
		
		$txarr = array_column($tongxun, 'conf_user_id');
		$tx = implode(',',$txarr);
	
		//array(array('not in',$tx),array('in',$str['s_id']));
		if($str && $tongxun){
			$where['id'] = array(array('not in',$tx),array('in',$str['s_id']));
		}else{
			return false;
		}
		
		//翻页
		
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->join('LEFT JOIN __USER__ b on b.id=a.conf_user_id
				LEFT JOIN __CHATGROUP__ c on c.c_id=a.conf_user_id
		')
		->field('b.id,b.logo,b.companyname,b.username,b.phone')
		->where($where)->limit(($curpage - 1) * $showrow.','.$showrow)->order('id desc')
		
		->select();
		
		//p($this->_Sql());
		
		return $data;
	} 
	
	
	
}