<?php
/**
 * 认证管理
 */
namespace App\Model;
use Common\Model\BaseModel;

class CertifyModel extends BaseModel{

	protected $_validate=array(

		array('company','require','手机号必须填写',1,'regex',4),
		array('idcard','','您填写的身份证号已经存在！',0,'unique',1), // 在新增的时候验证name字段是否唯一
		array('company','','您填写的公司名称已经存在！',0,'unique',1), // 在新增的时候验证name字段是否唯一
		array('certificate','','您填写的统一代码已经存在！',0,'unique',1), // 在新增的时候验证name字段是否唯一
		array('company','','您填写的公司名称已经存在！',0,'unique',2), // 在新增的时候验证name字段是否唯一
		array('certificate','','您填写的统一代码已经存在！',0,'unique',2), // 在新增的时候验证name字段是否唯一
	);
	/**
	 * [_before_insert 添加之前需要添加的数据]
	 * @param  [type] $data   [description]
	 * @param  [type] $option [description]
	 * @return [type]         [description]
	 */
	public function _before_insert(&$data, $option){
		
		
		$data['certtime'] = time();
		$data['uid'] = I('post.uid');
		$data['is_cert'] = 3;  // 状态为3时，为审核中 1为个人认证，2为企业认证
		
		
		//上传图片个人认证
		if (isset($_FILES['front']) && $_FILES['front']['error'] == 0) {
			$ret = uploadOne('front','Idcard',array());
			if($ret['ok'] == 1){
				$data['front'] = $ret['images'][0];
				$data['is_image'] = 1; //1为身份证
			}else{
				$this->error = $ret['error'];
				return FALSE;
			}
		}
		if (isset($_FILES['back']) && $_FILES['back']['error'] == 0) {
			$ret = uploadOne('back','Idcard',array());
			if($ret['ok'] == 1){
				$data['back'] = $ret['images'][0];
				$data['is_image'] = 2; //2为名片
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
		
		
		
	}
	
	//个人认证修改
	public function editp(){
		$uid = I('post.uid');
		$data = $this->field('back,front,is_image')->where('uid='.$uid)->find();
		//身份证
		if($data['is_image'] == 1){
			$front = I('post.front');
		}
		//名片
		if($data['is_image'] == 2){
			$back = I('post.back');
		}
		$realname = I('post.realname');
		$iscert = 3;
		$this->where(array('uid'=>$uid))->save(array('realname'=>$realname,'front'=>$front,'back'=>$back,'is_cert'=>$iscert));
		
		return true;
	}
	
	//企业认证修改
	public function editcom(){
		$uid = I('post.uid');
		$certificateimg = I('post.certificateimg');
		$certificate = I('post.certificate');
		$company = I('post.company');
		$iscert = 3;
		$this->where(array('uid'=>$uid))->save(array('certificateimg'=>$certificateimg,'certificate'=>$certificate,'company'=>$company,'is_cert'=>$iscert));
		
		return true;
	}
	
	public function _before_update(&$data, $option){
		$id = $option['where']['id'];
		//修改
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
		$oldLogo = $this->field('front,back')->find($id);
			deleteImage($oldLogo);
		
		
		
		if (isset($_FILES['certificateimg']) && $_FILES['certificateimg']['error'] == 0) {
			$ret = uploadOne('certificateimg','Certificate',array());
			if($ret['ok'] == 1){
				$data['certificateimg'] = $ret['images'][0];
			}else{
				$this->error = $ret['error'];
				return FALSE;
			}
		}
		$certimg = $this->field('certificateimg')->find($id);
			deleteImage($certimg);
		
		
	}
	
	






}
?>