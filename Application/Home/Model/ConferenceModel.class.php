<?php
/**
*	会议
*/
namespace Common\Model;
use Common\Model\BaseModel;

class ConferenceModel extends BaseModel{

	
	/**
	 * 前台所有数据
	 */
	public function searchFront($pagesize=10){
		
		//搜索
		$where = array();
		$where['a.uid'] = cookie(userid);

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
		->field('a.*,c.catename')
		->join('LEFT JOIN __USER__ b ON a.uid=b.id
			LEFT JOIN __CONFERENCE_CATE__ c on c.id=a.cid
			')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}
	/**
	 * 前台单条数据
	 */
	public function showOne(){
		
		//搜索
		$where = array();
		$where['a.uid'] = cookie(userid);

		$where['a.id'] = I('get.id');
		
		$data = $this->alias('a')
		->field('a.*,c.catename')
		->join('LEFT JOIN __USER__ b ON a.uid=b.id
			LEFT JOIN __CONFERENCE_CATE__ c on c.id=a.cid
			')
		->where($where)
		->order('id desc')
		->find();
		
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


	public function _before_insert(&$data, $option){
		
		$data['downfile'] = I('post.downfile');
		$data['companypic'] = '['.json_encode(I('post.companypic')).']';
		$data['uid'] = cookie(userid);
		$data['addtime'] = time();
		//处理ueditor 转义字符，正常插入数据库
		$data['brief'] = htmlspecialchars_decode($_POST['brief']);
		$data['agenda'] = htmlspecialchars_decode($_POST['agenda']);
		$data['guests'] = htmlspecialchars_decode($_POST['guests']);
		$data['guide'] = htmlspecialchars_decode($_POST['guide']);
		//p($data);die;
	}
	
	//修改数据
	public function updateConf(){
		$id = I('get.id');
		$title = I('post.title');
		$cid = I('post.cid');
		$is_private = I('post.is_private');
		$companyname = I('post.companyname');
		$address = I('post.address');
		$xxaddress = I('post.xxaddress');
		$contact = I('post.contact');
		$phone = I('post.phone');
		$scale = I('post.scale');
		$is_user = I('post.is_user');
		$brief = htmlspecialchars_decode(I('post.brief'));
		$agenda = htmlspecialchars_decode(I('post.agenda'));
		$guests = htmlspecialchars_decode(I('post.guests'));
		$guide = htmlspecialchars_decode(I('post.guide'));
		/* //如果修改时间的话，修改会议的状态
		$conf = M('Conference');
		$audit = M('Conference_audit');
		if($ctime || $etime || $qtime){
			$conf->where(array('id'=>$id))->setField('statuses',3);
			$audit->where(array('conf_id'=>$id))->setField('status',3);
		} */
		
		$this->where(array('id'=>$id))->save(array(
			'title'=>$title,
			'companyname'=>$companyname,
			'cid'=>$cid,
			'is_private'=>$is_private,
			'address'=>$address,
			'xxaddress'=>$xxaddress,
			'contact'=>$contact,
			'phone'=>$phone,
			'scale'=>$scale,
			'is_user'=>$is_user,
			'brief'=>$brief,
			'agenda'=>$agenda,
			'guests'=>$guests,
			'guide'=>$guide,
		));
		
		return true;
		
	}
	
	//修改前
	public function _before_update(&$data, $option){
		
		if($_POST['downfile']){
			$data['downfile'] = I('post.downfile');
		}
		if($_POST['companypic']){
			
			$data['companypic'] = '['.json_encode(I('post.companypic')).']';
		}
		//p($data);
		
	}



}
?>