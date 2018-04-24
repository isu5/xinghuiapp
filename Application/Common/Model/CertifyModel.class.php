<?php
/**
 * 认证管理
 */
namespace Common\Model;
use Common\Model\BaseModel;

class CertifyModel extends BaseModel{

	/**
	 * 后台数据
	 */
	public function search($pagesize=15){

		//搜索
		$where = array();
		
		$realname = I('get.realname');
		if ($realname) {
			$where['a.realname'] = array('like',"%$realname%");
		}
		//审核列表audit
		if(ACTION_NAME == "audit"){
			$where['a.is_cert'] = 5;
		}
		//个人认证
		if(ACTION_NAME == "person"){
			$where['a.is_cert'] = 1;
		}
		//企业认证
		if(ACTION_NAME == "index"){
			$where['a.is_cert'] = 2;
		}
		//个人发布认证
		if(ACTION_NAME == "publish"){
			$where['a.is_cert'] = 3;
		}
		//翻页
		$count = $this->alias('a')->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		
		$data['data'] = $this->alias('a')
		->field('a.*,b.username')
		->join('LEFT JOIN __USER__ b ON a.uid=b.id 
			')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}



	/**
	 * [_before_insert 添加之前需要添加的数据]
	 * @param  [type] $data   [description]
	 * @param  [type] $option [description]
	 * @return [type]         [description]
	 */
	public function _before_insert(&$data, $option){
		//上传图片个人认证
		if (isset($_FILES['front']) && $_FILES['front']['error'] == 0) {
			$ret = uploadOne('front','Idcard',array());
			if($ret['ok'] == 1){
				$data['front'] = $ret['images'][0];
			}else{
				$this->error = $ret['error'];
				return FALSE;
			}
		}
		if (isset($_FILES['back']) && $_FILES['back']['error'] == 0) {
			$ret = uploadOne('back','Idcard',array());
			if($ret['ok'] == 1){
				$data['back'] = $ret['images'][0];
			}else{
				$this->error = $ret['error'];
				return FALSE;
			}
		}
		
		//企业认证图片
		if (isset($_FILES['certificateimg']) && $_FILES['certificateimg']['error'] == 0) {
			$ret = uploadOne('certificateimg','Certificate',array());
			if($ret['ok'] == 1){
				$data['certificateimg'] = $ret['images'][0];
			}else{
				$this->error = $ret['error'];
				return FALSE;
			}
		}
		
		$data['certtime'] = time();
		$data['uid'] = cookie(userid);
		$data['is_cert'] = 3;  // 状态为3时，为审核中 1为个人认证，2为企业认证
		
		//认证之前把公司名称添加到新建会议的表中
		$cert = D('Conference');
		$info = $cert->field('id,uid,companyname')->where(array( 'uid' =>$data['uid']))->find();
		//p($option['where']['id']);
		//p($info);die;
		//$data['company'] = $info['companyname'];
		
	}





}
?>