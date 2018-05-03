<?php
/**
 * 认证管理
 */
namespace Common\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class CertifyModel extends BaseModel{

	/**
	 * 后台数据
	 */
	public function search($pagesize=15){

		
		//审核列表audit
		if(ACTION_NAME == "audit"){
			$where['a.is_cert'] = 5;
		}
		
		//翻页
		$where = array();
		$showrow = 1; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况
	
		
		$total = $this->alias('a')->where($where)->count();	
		
		
		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
		
		$data['data'] = $this->alias('a')
		->field('a.*,b.username')
		->join('LEFT JOIN __USER__ b ON a.uid=b.id 
			')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
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
		
		//个人会议发布认证图片
		if (isset($_FILES['zhicard']) && $_FILES['zhicard']['error'] == 0) {
			$ret = uploadOne('zhicard','Certificate',array());
			if($ret['ok'] == 1){
				$data['zhicard'] = $ret['images'][0];
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
		$data['is_cert'] = 5;  // 状态为5时，为审核中 1为个人认证，2为企业认证，3为个人会议发布认证
		
		//认证之前把公司名称添加到新建会议的表中
		$cert = D('Conference');
		$info = $cert->field('id,uid,companyname')->where(array( 'uid' =>$data['uid']))->find();
		//p($option['where']['id']);
		//p($info);die;
		//$data['company'] = $info['companyname'];
		
	}





}
?>