<?php
/**
 * 会员模型
 */
namespace Home\Model;
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
			$where['username'] = array('like',"%$username%");
		}
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->select();

		return $data;
	}
	
	 /**
     * 获取token值
     * @param  integer  $uid  用户id
     * @param  integer $type  类型
     * @return string         token值
     */
    public function getToken($uid){
        $map=array(
            'id'=>$uid,
            );
        $token=$this->where($map)->getField('token');
        return $token;
    }
	
	//添加前
	public function _before_insert(&$data, $option){
	
		$str = $_POST['email'];
		$data['username'] = cut_str($str,'@',0);
		$data['email_check_code'] = sha1(uniqid(rand()));
		$data['email_check_time'] = time();
		$data['ctime'] = time();
		
		
	
	}
	
	//修改基本信息
	public function updateInfo(){
		$id = $_COOKIE['userid'];
		$username = I('post.username');
		
		refreshRongcloud_token($id);
		$this->save(array('username'=>$username,'id'=>$id));
		//cookie('logo',$logo);
		return true;
		
	}
	//修改前
	protected function _before_update(&$data, $option){
		//p($option);die;
		$focus = D('Conference_focus');
		$focus->where(array('conf_user_id'=>$option['where']['id']))->setField('state',1);
		//修改头像
		if (isset($_FILES['logo']) && $_FILES['logo']['error'] == 0) {
			$ret = uploadOne('logo','Avatar',array());
			if($ret['ok'] == 1){
				$data['logo'] = $ret['images'][0];
			}else{
				$this->error = $ret['error'];
				return FALSE;
			}
			deleteImage(array(
				I('post.old_logo'),
				
			));
		}
		
	}
	
	//修改详情
	public function updateDetails(){
		$id = $_COOKIE['userid'];
		$companyname = I('post.companyname');
		$address = I('post.address');
		$profile = I('post.profile');
		$website = I('post.website');
		$landline = I('post.landline');
		$area = I('post.area');
		$position = I('post.position');
		
		$this->save(array(
			'companyname'=>$companyname,
			'address'=>$address,
			'area'=>$area,
			'website'=>$website,
			'landline'=>$landline,
			'profile'=>$profile,
			'position'=>$position,
			'id'=>$id
			));
		
		return true;
		
	}
	
	
	//验证邮箱

	protected function _after_insert($data,$option){
		//融云token
		 getRongcloudToken($data['id']);
		
		//极光用户别名
		$jpush = $data['id'] . '_' . 'xinghuiapp';
		$this->where(array('id'=>$data['id']))->setField(array('jpush'=>$jpush));
		$title = "幸会！您的专用会议APP！";
		$content = "欢迎加入幸会，请点击一下链接完成验证:<p><a href='http://xh.2188.com.cn/Register/email_check/code/{$data['email_check_code']}'>点击验证邮箱</a></p>";
		sendEmail($data['email'],$title,$content);
		
	}
	
	
	//审核人员列表
	public function auditPartici($pagesize=15){
		$where = [];
		$where['conf_id'] = I('get.id');
		
		 $uid = cookie(userid);
		/*if($uid){
			//
			$where['id'] =  array('neq',$uid);
		} */
		//翻页
		//根据会议id查出来当前会议参会人员人数
		$count = $this->alias('a')->where($where)->join('LEFT JOIN __CONFERENCE_AUDIT__ b on b.user_id=a.id
			LEFT JOIN __CONFERENCE__ c on c.id=b.conf_id
		')->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->alias('a')
		->field('a.id,a.logo,a.companyname,a.phone,a.username,b.status,c.is_user')
		->join('LEFT JOIN __CONFERENCE_AUDIT__ b on b.user_id=a.id
			LEFT JOIN __CONFERENCE__ c on c.id=b.conf_id
		')
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		//p($this->getLastSql());
		//p($count);
		return $data;
		
	}
	
	//二级账户
	public function accountAli(){
		$uid = cookie(userid);
		$user = $this->field('id,pid,username,remark,phone,ctime')->where()->select();
		$level = findson($user,$uid);  //查找所有pid下的子id
		return $level;

	}
	
	

}