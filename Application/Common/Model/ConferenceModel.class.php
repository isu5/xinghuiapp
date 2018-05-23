<?php
/**
*	会议
*/
namespace Common\Model;
use Common\Model\BaseModel;

class ConferenceModel extends BaseModel{

	
	/**
	 * 后台数据
	 */
	public function search($pagesize=15){
		//搜索
		$where = array();
		$title = I('get.title');
		if ($title) {
			//按标题，公司主体搜索
			$where['_string'] = " ( a.companyname like '%$title%')  OR ( title like '%$title%') ";
		}
		//按时间搜索
		$ctime = I('get.ctime');
		$etime = I('get.etime');
		/* p($ctime);
		p($etime); */
		if($ctime && $etime)
			$where['a.ctime'] = array('between', array($ctime, $etime));
		elseif($ctime)
			$where['a.ctime'] = array('egt', $ctime);
		elseif ($etime)
			$where['a.ctime'] = array('elt', $etime);  
		
		//按地址
		$address = I('get.addr');
		if($address){
			$where['a.address'] = array('eq',$address);
		}
		//按会议类型
		$utype = I('get.utype');
		//全部类型 id=1 ,其他栏目显示对应栏目
		if($utype ==1){
			$where = "1=1";
		}elseif($utype){
			$where['cid'] = $utype;
		}
		
		//翻页
		$count = $this->alias('a')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field('a.*,b.username,c.catename,c.id as cid')
		->join('LEFT JOIN __USER__ b ON a.uid=b.id
			LEFT JOIN __CONFERENCE_CATE__ c on c.id=a.cid
		')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		//p($this->getLastSql());
		return $data;
	}
	
	
	
	




}
?>