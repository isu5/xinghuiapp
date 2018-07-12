<?php
/**
* 获取单条会议
*/
namespace Wap\Controller;
use Org\Nx\Response;
class IndexController extends PublicController{
	
	public function _initialize(){
		parent::_initialize();
		$this->conf = D('Conference'); 
		$this->cate = M('Conference_cate'); 
		
	}
	
	//首页所有会议
	public function index(){
		$cate = $this->cate->select();
		$conf = $this->conf->field('id,cid,title,companypic,click,ctime,address')->where(array('statuses'=>0,'is_private'=>0))->order('ctime desc')->select();

		$this->assign([
			'cate'=>$cate,
			'conf'=>$conf,
			
		]);
		$this->display();
	}
	//点击分类
	public function cate(){
		
		$cid = I('get.cid');
		$cate = $this->cate->alias('a')->field('a.id,a.catename')
		->join('left join __CONFERENCE__ b on a.id=b.cid')->group('a.id')->select();
		$conf = $this->conf->field('id,cid,title,companypic,click,ctime,address')
		->where(array('cid'=>$cid,'statuses'=>0,'is_private'=>0))->order('ctime desc')->select();
		//p($this->conf->getLastSql());
		//p($cate);
		$this->assign([
			'cate'=>$cate,
			'conf'=>$conf,
		]);
		$this->display();
	}
	//分享单条会议页面
	public function getOne(){
		$res = $this->conf->showOne();
		//p($res);
		$this->assign('data',$res['data']);
		$this->display();
	}
	
	
	
	
}