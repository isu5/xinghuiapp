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
	
	//会议资料统计
	public function downstats($pagesize=15){
		//翻页
		$count = $this->alias('a')->join('left join __CONFERENCE_DOWN__ b on b.conf_id = a.id')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$arr = $this->alias('a')
		->field(array("count(b.conf_id)"=>"countstats",'a.title','b.filename','b.user_id'=>'uid'))
		->join('left join __CONFERENCE_DOWN__ b on b.conf_id = a.id')	
		->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->order('a.addtime desc')
		->group('b.user_id')->buildSql();
		
		$data['data'] = M('User')->alias('c')
		->field(array('d.username','d.id','c.title','c.filename',"sum(c.countstats)"=>"counts"))
		->table($arr)
		->join('left join __USER__ d on d.id=c.uid')
		->group('c.uid')
		->select();
		
		return $data;
		
		
	}
	
	//会议产品统计
	public function countstats(){
		$where = [];
		//翻页
		/* 
SELECT d.username,d.id,c.title,c.conf_title,count(c.counts) AS `stats` from
(SELECT count(b.pro_id) AS `counts`,
a.title AS `conf_title`,p.title,b.user_id,p.conf_id
FROM tzht_conference a 
left join tzht_conference_stats b on b.conf_id = a.id
left join tzht_conference_pic p on p.id = b.pro_id
GROUP BY p.conf_id) c left join tzht_user d on d.id=c.user_id where c.conf_id = 115


SELECT count(b.pro_id) AS `counts`,
a.title AS `conf_title`,p.title,b.user_id,p.conf_id
FROM tzht_conference a 
left join tzht_conference_stats b on b.conf_id = a.id
left join tzht_conference_pic p on p.id = b.pro_id
GROUP BY p.conf_id

45 1  115
41 1  115
101 1  115
77  1  115



		*/
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$arr = $this->alias('a')
		->field(array("count(b.pro_id)"=>"countstats",'a.title'=>'conf_title','g.title','b.user_id'=>'uid'))
		->join('left join __CONFERENCE_STATS__ b on b.conf_id = a.id
			left join __CONFERENCE_PIC__ g on g.id = b.pro_id
		')	
		->where($where)->limit($page->firstRow.','.$page->listRows)->order('a.addtime desc')
		->group('g.title')->buildSql();
		
		$data['data'] = M('User')->alias('c')
		->field(array('d.username','d.id','c.title','c.conf_title',"sum(c.countstats)"=>"counts"))
		->table($arr)
		->join('left join __USER__ d on d.id=c.uid')
		->group('c.conf_title')->fetchSql(true)
		->select();
		//p($data);
		p($data['data']);
		//return $data;
	}




}
?>