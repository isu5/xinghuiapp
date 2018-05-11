<?php
/**
*	会议
*/
namespace App\Model;
use Think\Model\RelationModel;
use Org\Nx\Response;
use Common\Third\AppPage;

class ConferenceModel extends RelationModel{
	 protected $_link = array(
		'Conference' => array(
			'mapping_type'  => self::HAS_MANY,
			'class_name'    => 'Conference',
			'foreign_key'   => 'id',
			'mapping_name'  => 'certify',
			'mapping_order' => 'id desc',
			// 定义更多的关联属性
			
		),
		
	);
	
	//分页测试
	public function allconf(){
		//会议进行中的数据
		
		$where = array();
		$showrow = 1; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		
		$total = $this->alias('a')->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
		$data['data'] = $this->alias('a')
		->field('a.*,b.is_cert')
		->join('LEFT JOIN __CERTIFY__ b ON a.uid=b.uid
			')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('a.id desc')
		->select();
		
		return $data;
	}
	
	/***
	* 首页获取所有数据
	*
	*/
	public function hunt(){
		//会议进行中的数据
		$where['statuses'] = 0 ;
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		
		$total = $this->alias('a')->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
		$data['data'] = $this->alias('a')
		->field('a.*,b.is_cert')
		->join('LEFT JOIN __CERTIFY__ b ON a.uid=b.uid
			')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('a.id desc')
		->select();
		return $data;
	}
	
	/**
	 * 搜索数据
	 */
	public function searchFront(){
		
		//搜索
		$where = array();
		//$where['a.uid'] = I('post.uid');
		$where['statuses'] = 0;
		$where['is_private'] = 0;
		$title = I('post.title');
		if ( $title ) {
			$where['title'] = array('like',"%$title%");
		}else{
			return false;
		}
		
		$uid = I('post.uid');
		
		if($uid){
			//
			$where['uid'] =  array('neq',$uid);
		}
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况


		$total = $this->alias('a')->where($where)->count();	


		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
		
		$data['data'] = $this
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('ctime asc')
		->select();
		//p($this->_Sql());
		return $data;
	}
	//发布的会议
	public function sendConf(){
		
		//搜索
		$where = array();
		$where['uid'] = I('post.user_id');
		$where['statuses'] = I('post.state');
		$where['is_private'] = I('post.is_private');
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况


		$total = $this->alias('a')->where($where)->count();	


		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			//$data['page'] =  $page->myde_write();
		 }
		$data['data'] = $this->alias('a')
		->field('a.id,a.title,a.ctime,a.etime,a.qtime,a.address,a.xxaddress,a.companypic,a.is_user,a.is_private,a.click,c.catename,d.pic,d.bullurl')
		->join('LEFT JOIN __CONFERENCE_CATE__ c on c.id=a.cid
			LEFT JOIN __CONFERENCE_PIC__ d on d.conf_id=a.id
			')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('a.id desc')
		->group('a.id')
		->select();
		//p($this->_Sql());die;
		return $data;
	}
	
	
	/**
	 * 前台单条数据
	 */
	public function showOne(){
		
		//搜索
		$where = array();
		$m = M('Conference');
		$map['id'] = I('post.id');
		$m->where(array('id'=>$map['id']))->setInc('click'); // 用户的点击量加1
		
		$data['data'] = $this
		->where($map)
		->order('id desc')
		->find();
		
		//p($this->getLastSql());
		return $data;
	}
	//会议详情滚动图片
	public function qupic(){
		$pic = D('Conference_pic');
		$where = array();
		$where['conf_id'] = I('post.id');
		$data['data'] = $pic
		->field('id,title,bullurl,pic,addtime')
		->where($where)
		->order('id desc')
		->limit('0,3')
		->select();
		return $data;
	}
	
	/**
	 * 后台数据
	 */
	public function search($pagesize=15){

		//搜索
		$where = array();
		
		$title = I('get.title');
		if ($title) {
			$where['a.title'] = array('like',"%$title%");
		}
		//翻页
		$count = $this->alias('a')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field('a.*,b.username,c.catename')
		->join('LEFT JOIN __USER__ b ON a.uid=b.id
			LEFT JOIN __CONFERENCE_CATE__ c on c.id=a.cid
		')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}

	//插入前操作
	public function _before_insert(&$data, $option){
		
		$data['uid'] = I('post.uid');
		$data['addtime'] = time();
		//app 上传图片
		$data['companypic'] = json_encode(app_upload_image("/Uploads/Conference"));
		$down = json_encode(app_upload_bull('/Uploads/file'),JSON_UNESCAPED_UNICODE);
		$data['downfile'] = str_replace(',','###', str_replace('"','',str_replace('\\','',str_replace('"]','',str_replace('["','',$down)))))."###";
		
	}
	
	/* //修改之前
	public function _before_update(&$data, $option){
		//app 修改上传图片
		$data['companypic'] = json_encode(app_upload_image("/Uploads/Conference"));
		$down = json_encode(app_upload_bull('/Uploads/file'),JSON_UNESCAPED_UNICODE);
		$data['downfile'] = str_replace("\\/","/",trim($down,'[""]')).'###';
		
		//p($data);
	} */
	

	//编辑会议接口里上传文件
	public function editDownfiles(){
		$id = I('post.id');
		$down = json_encode(app_upload_bull('/Uploads/file'),JSON_UNESCAPED_UNICODE);
		$data['downfile']  = str_replace("\\/","/",trim($down,'[""]')).'###'; 
		
		return $this->where(array('id'=>$id))->save($data);
	}
	
	//编辑会议接口里上传图片
	
	public function editPic(){
		$id = I('post.id');
		$data['companypic'] = json_encode(app_upload_image('/Uploads/Conference'),JSON_UNESCAPED_UNICODE);
		
		return $this->where(array('id'=>$id))->save($data);
	}
	
	
	//筛选条件查询
	public function filterCert(){
		$where = array();
		$catename = I('post.catename');
		if($catename != 1){
			$where['cid'] =$catename;
		}
		$uid = I('post.uid');
		
		if($uid){
			//
			$where['uid'] =  array('neq',$uid);
		}
		$addId = I('post.addId');
		$t = time();
		$three = $t-3600*24*3; //三天
		$mouth = $t-3600*24*30; //一个月
		$mouth3 = $t-3600*24*30*3; //三个月
		switch ( $addId ) {
			case 1:
			$where['addtime'] =  array(array('elt' , $t ),array('egt' , $three ));
			break;  
			case 2:
			$where['addtime'] =  array(array('elt' , $t ),array('egt' , $mouth ));
			break;
			case 3:
			$where['addtime'] =  array(array('elt' , $t ),array('egt' , $mouth3 ));
			break;
			default:
			
			}
		
		
		$address = I('post.address');
		if($address ){
			$where['address'] =  array('like',"%$address%");
		}
		
		//状态为进行中
		$where['statuses'] = 0;
		//公开的会议
		$where['is_private'] = 0;
		
		$showrow = 10; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		$total = $this->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			//$data['page'] =  $page->myde_write();
		 }
		
		
		
		
		$data['data'] = $this
		->field('id,title,ctime,etime,qtime,address,xxaddress,is_user,is_private,companypic,click')
		/*
		->join('LEFT JOIN __CERTIFY__ b ON a.uid=b.uid 
				LEFT JOIN __CONFERENCE_CATE__ c ON c.id=a.cid 
			') */
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->where($where)
		->order('ctime asc')
		->select();
		
		//p($this->getLastSql());die;
	
		return $data;
		
	}
	
	
	//二级账户显示主账户的内部会议列表
	public function privateConfList(){
		$data['uid'] = I('post.uid');
		$user = D('User');
		$map = $user->field('id,pid')->where(array('id'=>$data['uid']))->find();
		//p($map);
		//内部私密会议
		$where['is_private'] = 1 ;
		//会议状态 0开始1结束
		$state = I('post.state');
		switch ( $state ) {
			case 1:
			$where["'statuses'"] =  array('eq',1);
			break;
			case 0:
			$where["'statuses'"] =  array('eq',0);
			break;
			default:
			
		}
		
		$where['uid'] = $map['pid'];
		
		
		$showrow = 10; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		$total = $this->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			//$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field('a.id,a.title,a.ctime,a.etime,a.qtime,a.companypic,a.address,a.xxaddress,a.is_user,a.is_private,a.click,e.status')
		->join('LEFT JOIN __CONFERENCE_CATE__ c on c.id=a.cid
			LEFT JOIN __CONFERENCE_PIC__ d on d.conf_id=a.id
			LEFT JOIN __CONFERENCE_AUDITLIST__ e on e.conf_id=a.id
			')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('a.ctime desc')
		->group('a.id')
		->select();
		return $data;
		/*
		
		//0 获取正在进行的
		if($state==0){
			$data['data'] = $this->alias('a')
			->field('a.id,a.title,a.ctime,a.etime,a.qtime,a.companypic,a.address,a.xxaddress,a.is_user,a.is_private,e.status')
			->join('
				LEFT JOIN __CONFERENCE_AUDITLIST__ e on e.conf_id=a.id
				
				')
			->where($where)
			->limit(($curpage - 1) * $showrow.','.$showrow)
			->order('a.id desc')
			->group('a.id')
			->select(); 
		}
		
		//如果为1怎结束，需要删除处理
		if($state==1){
			$sql = 'SELECT conf_id FROM tzht_conference_del WHERE user_id = '.$data['uid'];
			$limit = ($curpage - 1) * $showrow.','.$showrow;
			 $data['data'] = $this->query('SELECT a.status,b.id,b.title,b.ctime,b.etime,b.qtime,b.address,b.xxaddress,b.is_user,b.is_private,b.companypic FROM tzht_conference_auditlist a
 LEFT JOIN tzht_conference b on b.id=a.conf_id 
WHERE uid='.$where['uid'].' and is_private=1  and b.id not in ('.$sql.') GROUP BY b.id ORDER BY id desc LIMIT '.$limit);
		}
		
		/* 
		SELECT a.id,a.title,a.ctime,a.etime,a.qtime,a.companypic,a.address,a.xxaddress,a.is_user,a.is_private,e.status FROM tzht_conference a LEFT JOIN tzht_conference_cate c on c.id=a.cid

			LEFT JOIN tzht_conference_pic d on d.conf_id=a.id

			LEFT JOIN tzht_conference_auditlist e on e.conf_id=a.id

			  WHERE `is_private` = 1 AND `uid` = '4' and  e.conf_id not in (SELECT conf_id FROM tzht_conference_del WHERE user_id = 33) GROUP BY a.id ORDER BY a.id desc LIMIT 0,10
		
		$sql = 'SELECT conf_id FROM tzht_conference_del WHERE user_id = '.$data['uid'];
		$limit = ($curpage - 1) * $showrow.','.$showrow;
		
		/* $data['data'] = $this->query('SELECT e.status,a.id,a.title,a.ctime,a.etime,a.qtime,a.address,a.xxaddress,a.is_user,a.is_private,a.companypic,a.statuses FROM tzht_conference a 
		LEFT JOIN tzht_conference_cate c on c.id=a.cid 
		LEFT JOIN tzht_conference_pic d on d.conf_id=a.id
		LEFT JOIN tzht_conference_auditlist e on e.conf_id=a.id
WHERE uid='.$where['uid'].' and '.$state.'  and is_private ='.$where['is_private'].' and e.conf_id not in ('.$sql.') GROUP BY a.id ORDER BY id desc LIMIT '.$limit);
		
		 
		 $data['data'] = $this->query('SELECT a.status,b.id,b.title,b.ctime,b.etime,b.qtime,b.address,b.xxaddress,b.is_user,b.is_private,b.companypic FROM tzht_conference_auditlist a
 LEFT JOIN tzht_conference b on b.id=a.conf_id 
WHERE uid='.$where['uid'].' and is_private=1 ORDER BY id desc LIMIT '.$limit);
*/
		//p($this->_Sql());die;
		
		
		
	}
	
	//二级账户会议列表删除后的列表
	public function delAccountConfOne(){
		$data['uid'] = I('post.uid');
		$user = D('User');
		$map = $user->field('id,pid')->where(array('id'=>$data['uid']))->find();
		//p($map);
		//内部私密会议
		$where['is_private'] = 1 ;
		//会议状态 0开始1结束
		$state = I('post.state');
		switch ( $state ) {
			case 1:
			$where['statuses'] =  array('eq',1);
			break;  
			case 0:
			$where['statuses'] =  array('eq',0);
			break;		
			default:
			
		}
		
		$where['uid'] = $map['pid'];
		
		
		$showrow = 10; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		$total = $this->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$sql = 'SELECT conf_id FROM tzht_conference_del WHERE user_id = '.$data['uid'];
		$limit = ($curpage - 1) * $showrow.','.$showrow;
		$m= M();
		$data['data'] = $m->query('SELECT a.status,b.id,b.title,b.ctime,b.etime,b.qtime,b.address,b.xxaddress,b.is_user,b.is_private,b.companypic FROM tzht_conference_auditlist a
 LEFT JOIN tzht_conference b on b.id=a.conf_id 

WHERE uid='.$where['uid'].' and is_private =1 and  a.conf_id not in ('.$sql.') group by b.id ORDER BY id desc LIMIT '.$limit);
			
		//p($this->_Sql());die;
		return $data;
		
		
	}
	
	
	
	//融云会议讨论组：--根据标题查询会议id
	public function findMettingId(){
		$where = [];
		$title = I('post.title');
		$data = $this->field('id')->where(array('title'=>$title))->find();
		return $data;
	}
	
	//返回下载文件的公司名称
	public function getDownListCompany(){
		$where = [];
		$where['user_id'] = I('post.user_id');
		
		$showrow = 10; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		$total = $this->alias('a')->join('LEFT JOIN __CONFERENCE_DOWN__ b on b.conf_id=a.id')->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this->alias('a')
		->field('a.companyname,a.title,b.filename')
		->join('LEFT JOIN __CONFERENCE_DOWN__ b on b.conf_id=a.id')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('a.id desc')
		->select();
		return $data;
		
		
	}
	
	

}
?>