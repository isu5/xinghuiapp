<?php
/**
*	
* 网站首页
*
*/


namespace Home\Controller;
Vendor('JpushClient.autoload');
use JPush\Client as JPushClient;
use Think\Controller;
use Org\Nx\Response;
use Common\Third\WxpayService;
class IndexController extends Controller {
	//网站首页
	public function _initialize(){
		$this->userid=cookie('userid');
		//p($this->userid);
	}
    public function index(){
		
		$this->display();
	}
	//手机端app下载页面
	public function xhuiApp(){
		$this->display();
		
	}
	
	//文件上传
	public function ajax_upload(){
		ajax_upload('/Uploads/image/');
	}
	
	//生成二维码
	public function usercode($id){
		
		qrcode($id);
		//scQRcode($id);
		
	}
	//测试页面
	public function test(){
		echo rongyunrand();
		
	}
	public function sendmember(){
		
		$appkey = C('RONG_PRO_APP_KEY'); // 开发者平台分配的 App Secret。
		$nonce = rand(); // 获取随机数。
		$timestamp = time()*1000; // 获取时间戳（毫秒）
		header('App-Key:'.$appkey);  
		header('Nonce:'.$nonce);  
		header('Timestamp:'.$timestamp); 
		header('Signature:'.rongyunrand()); 
		//header('Content-Type: Application/x-www-form-urlencoded'); 
		
		
	}
	
	public function sms(){
		$data['dcode'] = rand('1000,9999');
		
		$ol = yunsendSMS($data['dcode'].',15','13717563627');
		if($ol){
			echo 'ok';
		}else{
			echo '0000';
		}
	}

	
	//app 用户指南页面显示
	public function guide(){
		//print_r(LOG_PATH);
		$this->display();
	}
	
	//微信异步
	 public function weixinnotify() {
        header('Content-Type:text/xml; charset=utf-8');
        $postStr = file_get_contents("php://input");
        $notifyInfo = (array) simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
		
        if ($notifyInfo['result_code'] == 'SUCCESS' && $notifyInfo['return_code'] == 'SUCCESS') {
			# 记录支付通知信息
			$data['total_amount'] = $notifyInfo['cash_fee']*0.01;
			$data['out_trade_no'] = $notifyInfo['out_trade_no'];
			$data['trade_status'] =	$notifyInfo["result_code"];
			$data['trade_no'] =	$notifyInfo["transaction_id"];
			$data['paychannel'] = 2; //支付类型
			$data['state'] = 1; //成功说明已支付 0未支付，1为支付
			$data['gmt_create'] =	date('Y-m-d H:i:s',time());
			//付款日期
			$payment = M('Payment_invoice')->where(['out_trade_no'=>$data['out_trade_no']])->find();
			$data['user_id'] = $payment['user_id'];
				if($payment){
					$data['paytype'] = $payment['paytype'];
					//一个月
					if($data['paytype'] == 1){
						$data['endtime'] = date('Y-m-d H:i:s',strtotime('+1month')); ///到期时间
					}
					//三个月
					if($data['paytype'] == 2){
						$data['endtime'] = date('Y-m-d H:i:s',strtotime('+6month')); ///到期时间
					}
					//一年
					if($data['paytype'] == 3){
						$data['endtime'] = date('Y-m-d H:i:s',strtotime('+1year')); ///到期时间
					}
				}
				
			$pay = M('User_alipay');
			$res = $pay->add($data);
            file_put_contents(LOG_PATH . 'pay_notify.log', var_export($notifyInfo, TRUE));
			
            # 所有操作成功，返回正常状态
           // return xml(['return_code' => 'SUCCESS', 'return_msg' => 'SAVE DATA SUCCESS']);
			//return sprintf("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>");
			echo exit('<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>');

        }
    }
	
	
}