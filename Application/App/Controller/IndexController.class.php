<?php
namespace App\Controller;
use Think\Controller;
use Org\Nx\Response;
use Common\Third\ApiPage;
class IndexController extends Controller {
	protected $conf=null;
	protected $sign=null;
	
	public function __construct(){
		parent::__construct();
		$this->conf = D('Conference');
		$this->sign = D('Conference_sign');
		
	}
	
	//生产二维码链接
	public function usercode($id){
		qrcode($id);
	}
	
	//分页测试
	public function pagetest(){
		$data = $this->conf->allconf();
		
		$data = array(
			'result' => $data['data'],
			'page' => $data['page']
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
	}
	
	//获取所有会议数据
    public function index(){
		
		$data = $this->conf->hunt();
		
		$data = array(
			'result' => $data['data'],
			
			'page' => $data['page'],
			
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
		
		
	}
	//筛选条件
	public function filter(){
		
		$data = $this->conf->filterCert();
		$data = array(
			'result' => $data['data'],
			
			//'page' => $data['page']
		);
		
		if(!$data['result']){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
		}
	
	}
	//分类借口
	public function category(){
		$data = D('Conference_cate')->field('id,catename,pid')->select();
		if($data){
			Response::show(200,'数据获取成功!',$data);
		}else{
			Response::show(401,'没有更多数据!');
		}
	}
	
	//搜索数据
	public function search(){

		$data = $this->conf->searchFront();
		$data = array(
			'result' => $data['data'],
			//'page' => $data['page']
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
		
		
	}
	
	//扫码签到
	public function saoma(){
		$data['conf_id'] = I('post.conf_id');
		$data['user_id'] = I('post.user_id');
		$user = D('User');
		$jpush = $user->where('id='.$data['user_id'])->find();
		//p($jpush['jpush']);die;
		//审核中
		$status = D('Conferenceaudit')->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->find();
		
		//判断是否签到，签到就推送到签到人的所保存的信息
		$sign = M('Conference_sign');
		
		//查询要推送的标题，内容
		$info = D('Signjgpush')->field('id,title,content,addtime')->where(array('user_id'=>$data['user_id']))->order('addtime desc')->find();
		
		
		if(IS_POST ){
			
			if($status['status'] ==1 ){
				if($this->sign->create()){
					
					if($this->sign->add($data)){
						jgpushPerson($jpush['jpush'],$data['conf_id'],$type); //签到成功
						
						//扫码签到成功，参会按钮返回 参会中（您已扫码签到，请入场参会！参会中），
						D('Conferenceaudit')->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->setField('status',4);
						D('Conferenceauditlist')->where(array('conf_id'=>$data['conf_id'],'user_id'=>$data['user_id']))->setField('status',4);
						//检测是否存在签到推送内容
						if($info){
							signJgpush($jpush['jpush'],$info['title'],$info['content']);//签到成功后自动推送的信息
						}else{
							Response::show(403,'没有推送内容，请先保存推送内容!');
						}
						Response::show(200,'签到成功!');
						
					}else{
						Response::show(401,'签到失败!');
					}
				}else{
					Response::show(402,'添加数据不合法!',$this->sign->getError());
				}
				
			}elseif($status['status'] == 2 ){
				Response::show(403,'未审核通过,不能参加此会议!');
			}elseif($status['status'] == 3 ){
				Response::show(405,'审核中,请耐心等待审核结果通知!');
			}elseif($status['status'] == 4 ){
				//签到成功后，更改审核表中的status为4
				Response::show(406,'参会中！');
			}elseif($status['status'] == 5 ){
				//根据当前时间-会议结束时间>0 
				Response::show(407,'会议已结束！');
			}
			if(!$status){
			Response::show(408,'对不起，您还没有参加会议，不能签到!');
				exit;
			}
			
		}
		
	}
	//极光推送消息列表
	public function jgpush(){
		
		$data = D('Jgpush')->search();
		$data = array(
			'result' => $data['data'],
			//'page' => $data['page']
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
		
	}
	//个人定制化推送消息
	public function jgpushperson(){
		$data = D('Jgpushperson')->search();
		$data = array(
			'result' => $data['data'],
			'page' => $data['page']
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
	}
	//签到后的推送消息
	public function signjgpush(){
		$data = D('Signjgpush')->search();
		$data = array(
			'result' => $data['data'],
			'page' => $data['page']
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
	}
	
	
	//签到消息与个人推送合并接口
	public function jgpushMerge(){
		$data = D('Signjgpush')->msgMerge();
		$data = array(
			'result' => $data['data'],
			//'page' => $data['page']
		);
		if($data['result'] == null ){
			Response::show(401,'没有更多数据!');
			
		}else{
			Response::show(200,'数据获取成功!',$data);
			
		}
		
	}
	//签到消息与个人推送删除接口
	public function deljgpushMerge(){
		$data['id'] = I('post.id');
		$data['type'] = I('post.type');
		$jgpush = M('Jgpushperson');
		$sign = M('Signjgpush');
		if(IS_POST){
			if($data['type']==0){
				$post1 = $jgpush->where(array('id'=>$data['id']))->delete();
				if($post1){
					Response::show(200,'删除成功!');
				}else{
					Response::show(401,'删除失败!');
				}
			}else{
				$post2 = $sign->where(array('id'=>$data['id']))->delete();
				if($post2){
					Response::show(200,'删除成功!');
				}else{
					Response::show(401,'删除失败!');
				}
			}
			
			
		}
	}
	
	
	//删除平台消息
	public function deljgMsg(){
		$data['user_id'] = I('post.user_id');
		$data['jp_id'] = I('post.jp_id');
		$data['deltime'] = time();
		$jpush = M('Del_jgpush');
		
		if($jpush->add($data)){
			Response::show(200,'删除成功!');
		}else{
			Response::show(401,'删除失败!');
		}
			
		
	}
	
	//小程序接口 获取首页的所有会议列表
	public function xcxconflist(){
		$data = $this->conf->xcxconflist();
		
		//p($data['data']);
		/* foreach($data['data'] as $k=>&$v){
			$pic = json_decode($v['companypic']);
			$d = implode(' ',$pic);
		}
	 */
		$str=json_encode($data,JSON_UNESCAPED_UNICODE);
		$str = str_replace('[\\"','',$str);
		$str = str_replace('\"]','',str_replace('["','',$str));
		echo $str;
	}
	
	
	
	
}