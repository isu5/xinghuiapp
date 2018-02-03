<?php
/**
 * 会员模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class UserModel extends BaseModel{

	/**
	* 后台调用方法 搜索
	*/
	public function search($pagesize=15){
		//搜索
		$where = array();
		$username = I('get.username');
		if ($username) {
			//按用户名，按手机号，公司主体搜索
			$where['_string'] = " (companyname like '%$username%')  OR ( username like '%$username%') OR ( phone like '%$username%')";
		}
		//按用户类型搜索
		$utype = I('get.utype');
		if($utype ==1)
			
			$where['type'] = array('eq',1);
		elseif($utype ==2)
			$where['type'] = array('eq',2);
		elseif($utype ==3)
			$where['level'] = array('eq',2);
		
		//按时间搜索
		$ctimes = I('get.ctime');
		$etimes = I('get.etime');
		$ctime = strtotime($ctimes);
		$etime = strtotime($etimes);
		/* p($ctime);
		p($etime); */
		if($ctime && $etime)
			$where['ctime'] = array('between', array($ctime, $etime));
		elseif($ctime)
			$where['ctime'] = array('egt', $ctime);
		elseif ($etime)
			$where['ctime'] = array('elt', $etime);  
		
		
		
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->where( $where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->select();
		//p($this->getLastSql());
		return $data;
	}


}