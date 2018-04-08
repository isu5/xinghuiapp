<?php
/**
 * 会员模型
 */
namespace App\Model;
use Common\Model\BaseModel;
use Common\Third\AppPage;
class UserModel extends BaseModel{

	
	protected $_validate=array(

		
		/* array('email','require','邮箱必须填写',1,'regex',3),
		array('email','email','邮箱格式不对',1,'regex',3), */
		array('phone','require','手机号必须填写',1,'regex',4),
		array('phone','','手机号已经存在！未保存，请重新提交！',0,'unique',1), // 在新增的时候验证name字段是否唯一
		array('phone','','手机号已经存在！修改未保存，请重新提交！',0,'unique',2), // 在新增的时候验证name字段是否唯一
		array('email','','邮箱已经存在！修改未保存，请重新提交！',0,'unique',2), // 在新增的时候验证name字段是否唯一
		//array('password','require','密码必须填写',1,'regex',1),
		//array('password','/^.{6,}$/','密码长度至少6位',1,'regex',1),
		
		// 编辑时候验证
		//array('password','/^.{6,}$/','密码长度至少6位',2,'regex',2),
		
	);
	// 自动完成
	protected $_auto = array (

		// 时间
		array('ctime','time',1,'function'),
		//array('login_time','time',1,'function'),
		//ip
		array('login_ip','_ip',1,'callback'),
		
	);
	

	// ip
	public function _ip(){
		return get_client_ip();
	}
	//生产二维码
	public function  gocode($id){
		qrcode($id);
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
	protected function _before_insert(&$data, $option){
		$data['username'] = hidephone(I('post.phone'));

	}
	
	//更新融云token值
	protected function _after_insert($data, $option){
		
		//$data['dimecode'] = qrcode($data['id']);
		
		getRongcloudToken($data['id']);
		$jpush = $data['id'] . '_' . 'xinghuiapp';
		$this->where(array('id'=>$data['id']))->setField(array('jpush'=>$jpush));
	}
	 //修改前
	protected function _before_update(&$data, $option){
		
		$focus = M('Conference_focus');
		$focus->where(array('conf_user_id'=>$option['where']['id']))->setField('state',1);
		$id = I('post.id');
		//修改头像，刷新融云用户
		refreshRongcloud_token($id);
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
	
	
	//参会人员列表
	
	public function auditPartici(){
		$where = [];
		$where['conf_id'] = I('post.conf_id');
		$companyname = I('post.companyname');
		$uid = I('post.uid');
		
		if($uid){
			//
			$where['id'] =  array('neq',$uid);
		}
		if (!empty($companyname)) {
			
			$where['_string'] = " (companyname like '%$companyname%') OR ( phone like '%$companyname%')";
		}
		
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况


		$total = $this->alias('a')->where($where)->count();	


		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }

		$data['data'] = $this->alias('a')
		->field('a.id,a.logo,a.companyname,a.username,a.phone,a.type,a.nickname,a.level')
		->join('LEFT JOIN __CONFERENCE_AUDIT__ b on b.user_id=a.id
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();

		return $data;	
	}
	
	
	
	
	
	//登录后是个人还是企业
	public function is_cert(){
		$where = [];
		$where['a.id'] = I('post.user_id');
		$data['data'] = $this->alias('a')
		->field('a.id,b.type,b.is_cert')
		->join('LEFT JOIN __CERTIFY__ b on b.uid=a.id
		')
		->where($where)
		->find();
		return $data;
	}
	
	
	
	
	
	
	//通讯录
	public function focus(){
		$where = [];
		$where['user_id'] = I('post.user_id');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况


		$total = $this->alias('a')->where($where)->join('LEFT JOIN __CONFERENCE_FOCUS__ b on b.conf_user_id=a.id
		')->count();	


		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
		
		
		$data['data'] = $this->alias('a')
		->field('a.id,a.username,a.logo,a.companyname,a.dimecode,a.type,a.nickname,a.level,b.state,b.note,c.is_cert')
		->join('LEFT JOIN __CONFERENCE_FOCUS__ b on b.conf_user_id=a.id
			LEFT JOIN __CERTIFY__ c on c.uid=a.id
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();
		
		
		
		return $data;	
		
		
	}
	
	//被关注人员
	public  function refocuslist(){
		
		$where = [];
		$where['conf_user_id'] = I('post.user_id');
		
		//翻页
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1);; //当前的页,还应该处理非数字的情况


		$total = $this->alias('a')->where($where)->count();	


		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }

		$data['data'] = $this->alias('a')
		->field('a.id,a.username,a.logo,a.companyname,a.dimecode,a.type,a.nickname,a.level,b.state,c.is_cert')
		->join('LEFT JOIN __CONFERENCE_FOCUS__ b on b.user_id=a.id
		LEFT JOIN __CERTIFY__ c on c.uid=a.id
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();
		
		return $data;	
		
		
	}
	
	
	
	//搜索通讯录
	public function searchFocus(){
		
		//搜索
		$where = array();
		$companyname = I('post.companyname');
		
		$where['user_id']  = I('post.user_id');
		
		
		if ( $companyname ) {
			
			$where['_string'] = " (companyname like '%$companyname%')  OR ( email like '%$companyname%') OR ( phone like '%$companyname%')";
		}else{
			return false;
		}
		
		
		//翻页
		$showrow = 15; //一页显示的行数
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
		$data['data'] = $this->alias('a')
		->field('a.id,a.username,a.logo,a.companyname,a.dimecode,a.type,a.nickname,a.level,b.state,b.note,c.is_cert')
		->join('LEFT JOIN __CONFERENCE_FOCUS__ b on b.conf_user_id=a.id
		LEFT JOIN __CERTIFY__ c on c.uid=a.id
		
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('a.id desc')
		->group('a.id')
		->select();
		//p($this->_Sql());
		return $data;
	}
	
	//搜索全部用户
	public function searchAll(){
		//搜索
		$where = array();
		$companyname = I('post.companyname');
		//不能搜索到自己
		$where['a.id']  = array('neq',I('post.user_id'));
		//$where['pid'] = 0;
		
		
		if ( $companyname ) {
			
			$where['_string'] = " (username like '%$companyname%')  OR ( companyname like '%$companyname%') OR ( phone like '%$companyname%')";
		}else{
			return false;
		}
		
		
		//翻页
		$showrow = 15; //一页显示的行数
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total = $this->alias('a')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		 }
		$data['data'] = $this->alias('a')
		->field('a.id,a.username,a.logo,a.companyname,a.type,a.phone,a.dimecode,a.nickname,a.level,c.is_cert')
		->join('LEFT JOIN __CERTIFY__ c on c.uid=a.id
		')
		->where($where)
		->limit(($curpage - 1) * $showrow.','.$showrow)
		->order('id desc')
		->select();
		//p($this->_Sql());
		return $data;
	}
	
	/**
	* 企业详情
	*/
	public function company(){
		
		$where = array();
		
		$where['id'] = I('post.conf_user_id') ;
		
		$data['data'] = $this/* ->alias('a')
		->field('a.*')
		->join('LEFT JOIN __CONFERENCE_FOCUS__ b on b.conf_user_id=a.id
		') */
		->where($where)
		->order('id desc')
		->find();
		//p($this->getLastSql());
		//点击会议详情，关注表state 置为0;表示已查看企业用户更新了
		$focus = D('Conference_focus');
		$focus->where(array('conf_user_id'=>$where['id'] ,'user_id'=>I('post.user_id')))->setField('state',0);
		
		return $data;
	}
	
	//企业产品
	public function product(){
		$pic = D('Product');
		$where = array();
		$where['uid'] = I('post.user_id');
		$data['data'] = $pic
		->where($where)
		->order('id desc')
		->limit('0,3')
		->select();
		return $data;
		
	}
	//企业文档资料
	public function downfile(){
		$pic = D('Download');
		$where = array();
		$where['user_id'] = I('post.user_id');
		$data['data'] = $pic
		->where($where)
		->order('id desc')
		->limit('0,3')
		->select();
		return $data;
	}
	
	////未拉取的群组列表
	public function nogrouplists(){
		$where = [];
		$rongid = I('post.rongid');
		$c_id = I('post.c_id');
		
		// 查群组中s_id 有哪些用户，
		$str = D('Chatgroup')->where(array('rongid'=>$rongid))->find();
		
		//查询不到自己
		if($c_id){
			$where['id'] = array('neq',$c_id);
		}
		
		//查通讯录中的用户->group('user_id')  二维数组转一维数组$names = array_column($msg, 'name');
		$tongxun = M('Conference_focus')->field('conf_user_id')->where(array('user_id'=>$c_id,'conf_user_id'=>array('not in',$str['s_id'])))->select();
		
		$user = array_column($tongxun, 'conf_user_id');
		//$userinfo = $this->field('id,logo,companyname,username,phone,type')->where(array('id'=>array('in',$user)))->select();
		//p($userinfo);
		//p($this->_Sql());die;
		
		
		//翻页
		
		$showrow = 15; //一页显示的行数
		
		$curpage = I('post.page',1); //当前的页,还应该处理非数字的情况

		$total =  $this->alias('a')->where($where)->count();	

		$page = new AppPage($total, $showrow);
		if ($total > $showrow) {
			$data['page'] =  $page->myde_write();
		}
		
		$data['data'] = $this
		 ->field('id,logo,companyname,username,phone,type,nickname')->where(array('id'=>array('in',$user)))
		 ->limit(($curpage - 1) * $showrow.','.$showrow)->order('id desc')
		 ->select();
		
		//p($this->_Sql());
		
		return $data;
	} 
	
	//二级账户显示
	public function account(){
		$uid = I('post.id');
		$type = I('post.type');
		if($type==0){
			$user = $this->field('id,pid,logo,username,nickname,remark,type,level')->where()->select();
			$level = findson($user,$uid);  //查找所有pid下的子id
		}else{
			$user = $this->field('pid')->where(array('id'=>$uid))->find();
			$where['id'] = array('neq',$uid);
			$mmp = $this->field('id,pid,logo,username,nickname,remark,type,level')->where($where)->select();
			if($uid){
				$level = findson($mmp,$user['pid']);
			}
			
			
		}
		
		return $level;
	}
	
	
	
	
	


}