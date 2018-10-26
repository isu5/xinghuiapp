<?php
//
namespace Home\Controller;
use Common\Third\AlipayPc;
use Common\Third\AlipayReturn;
use Common\Third\AlipayNofity;
use Common\Third\WxpayService;

class PaymentController extends PublicController{
	
	public function __construct(){
		parent::__construct();
		$this->order = D('Useralipay');
		$this->payment = M('Payment_invoice');
		$this->user_id =  cookie('userid');
	}
	
	
	public function index(){
		$data = $this->checkpay();
		//p($data);
		if($data==1){
			$this->assign([
				'success'=>true
			]);
		}
		
		$this->display();
		
	}
	
	//支付宝支付
	public function alipay(){
		/*** 请填写以下配置信息 ***/
		$appid = C('ALIPAY.appid');			//https://open.alipay.com 账户中心->密钥管理->开放平台密钥，填写添加了电脑网站支付的应用的APPID
		$returnUrl = 'https://xh.2188.com.cn/Payment/ali_return_url';     //付款成功后的同步回调地址
		$notifyUrl = 'https://xh.2188.com.cn/Payment/ali_notify';     //付款成功后的异步回调地址
		$outTradeNo = date('YmdHis', time());     //你自己的商品订单号，不能重复
		if($_POST['paytype'] ==1){ //付款金额，单位:元
			$payAmount = C('PAY_ONE'); 
		}
		if($_POST['paytype'] ==2){
			$payAmount = C('PAY_TWO'); 
		}
		if($_POST['paytype'] ==3){
			$payAmount = C('PAY_THREE'); 
		}        
		$orderName = '幸会年费';    //订单标题
		$signType = 'RSA2';			//签名算法类型，支持RSA2和RSA，推荐使用RSA2
		$rsaPrivateKey=C('ALIPAY.privatekey');		//商户私钥，填写对应签名算法类型的私钥，如何生成密钥参考：https://docs.open.alipay.com/291/105971和https://docs.open.alipay.com/200/105310
		/*** 配置结束 ***/
		$aliPay = new AlipayPc();
		$aliPay->setAppid($appid);
		$aliPay->setReturnUrl($returnUrl);
		$aliPay->setNotifyUrl($notifyUrl);
		$aliPay->setRsaPrivateKey($rsaPrivateKey);
		$aliPay->setTotalFee($payAmount);
		$aliPay->setOutTradeNo($outTradeNo);
		$aliPay->setOrderName($orderName);
		
		$sHtml = $aliPay->doPay();
		//p(I('post.'));die;
		$data['user_id'] = $this->user_id;
		$data['total_amount'] = $payAmount;
		$data['invoice_address'] = I('post.invoice_address');
		$data['out_trade_no'] = $outTradeNo;
		$data['addtime'] = date('Y-m-d H:i:s', time());
		$data['paytype'] = I('post.paytype'); //选择付款的期限
		$this->payment->add($data);
		echo $sHtml;
		
	}
	
	//支付宝插件同步
	public function ali_return_url(){
		
		$alipayPublicKey=C('ALIPAY.publickey');

		$aliPay = new AlipayReturn($alipayPublicKey);
			//验证签名
			$result = $aliPay->rsaCheck($_GET,$_GET['sign_type']);
			if($result===true){
				//同步回调一般不处理业务逻辑，显示一个付款成功的页面，或者跳转到用户的财务记录页面即可。
				$data['user_id'] = $this->user_id;
				$data['gmt_create'] = htmlspecialchars($_GET['timestamp']); //完成时间
				$data['out_trade_no'] = htmlspecialchars($_GET['out_trade_no']);
				$data['trade_no'] = htmlspecialchars($_GET['trade_no']);
				$data['total_amount'] = htmlspecialchars($_GET['total_amount']);
				$data['paychannel'] = 1; //为支付宝支付
				$data['state'] = 1; //成功说明已支付 0未支付，1为支付
				
				//付款日期
				$payment = $this->payment->where(['out_trade_no'=>$data['out_trade_no']])->find();
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
					
				$this->order->add($data );
				$this->success('支付成功',U('Payment/orderlist'));
			}else{
				echo '不合法的请求';exit();
			}
				
	}
	//支付宝异步
	public function ali_notify(){
		header('Content-type:text/html; Charset=utf-8');
		//支付宝公钥，账户中心->密钥管理->开放平台密钥，找到添加了支付功能的应用，根据你的加密类型，查看支付宝公钥
		$alipayPublicKey=C('ALIPAY.publickey');

		$aliPay = new AlipayNofity($alipayPublicKey);
		//验证签名
		$result = $aliPay->rsaCheck($_POST,$_POST['sign_type']);
		if($result===true){
			
			//处理你的逻辑，例如获取订单号$_POST['out_trade_no']，订单金额$_POST['total_amount']等
			//程序执行完后必须打印输出“success”（不包含引号）。如果商户反馈给支付宝的字符不是success这7个字符，支付宝服务器会不断重发通知，直到超过24小时22分钟。一般情况下，25小时以内完成8次通知（通知的间隔频率一般是：4m,10m,10m,1h,2h,6h,15h）；
			if($_POST['trade_status'] == 'TRADE_FINISHED') {
		
		//判断该笔订单是否在商户网站中已经做过处理
			//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
			//请务必判断请求时的total_amount与通知时获取的total_fee为一致的
			//如果有做过处理，不执行商户的业务程序
				
		//注意：
		//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
			}
			else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//请务必判断请求时的total_amount与通知时获取的total_fee为一致的
					//如果有做过处理，不执行商户的业务程序			
				//注意：
				//付款完成后，支付宝系统发送该交易状态通知
				
				
			}
			
			echo 'success';
		}else{
			echo 'fail';
		}
		
	}
	
		
	//微信支付
	public function wechatpay(){
		header('Content-type:text/html; Charset=utf-8');
		$action = isset($_GET['action']) ? $_GET['action'] : '';
		$mchid = C("WXPAY.mchid");          //微信支付商户号 PartnerID 通过微信支付商户资料审核后邮件发送
		$appid = C("WXPAY.appid");  //微信支付申请对应的公众号的APPID
		$apiKey = C("WXPAY.apiKey");   //https://pay.weixin.qq.com 帐户设置-安全设置-API安全-API密钥-设置API密钥
		$wxPay = new WxpayService($mchid,$appid,$apiKey);
		$outTradeNo = date('YmdHis', time());     //你自己的商品订单号
		if($_POST['paytype'] ==1){ //付款金额，单位:元
			$payAmount = C('PAY_ONE'); 
		}
		if($_POST['paytype'] ==2){
			$payAmount = C('PAY_TWO'); 
		}
		if($_POST['paytype'] ==3){
			$payAmount = C('PAY_THREE'); 
		}      
			
		//$payAmount = I('post.total_amount');          //付款金额，单位:元
		$orderName = '支付测试';    //订单标题
		$notifyUrl = 'https://xh.2188.com.cn/Index/weixinnotify';     //付款成功后的异步回调地址(不要有问号)
		$returnUrl = 'https://xh.2188.com.cn/Payment/orderlist';     //付款成功后页面跳转的地址
		$payTime = time();      //付款时间
		//p($_POST);die;
		if($action=='queryorder'){
			$outTradeNo = $_GET['outTradeNo'];
			$result = $wxPay->orderquery($outTradeNo);
			echo json_encode($result);die;
		}
		
		$wxPay->setReturnUrl($returnUrl);
		$arr = $wxPay->createJsBizPackage($payAmount,$outTradeNo,$orderName,$notifyUrl,$payTime);
		$url = 'http://qr.liantu.com/api.php?text='.$arr['code_url'];
		$this->assign(array(
			'url' => $url,
			'outTradeNo' => $outTradeNo,
			'payAmount' => $payAmount,
			'returnUrl' => $returnUrl
		));
		$data['user_id'] = $this->user_id;
		$data['total_amount'] = $payAmount;
		$data['invoice_address'] = I('post.invoice_address');
		$data['out_trade_no'] = $outTradeNo;
		$data['addtime'] = date('Y-m-d H:i:s', time());
		$data['paytype'] = I('post.paytype'); //选择付款的期限
		$this->payment->add($data);
		$this->display();
		
		
	}
	//
	
	//支付订单
	public function orderlist(){
		
		$data = $this->order->orderlist();
		
		$this->assign(['data'=>$data['data'],'page'=>$data['page']]);
		//p($data);
		$this->display();
	}
	
	
	//删除订单
	public function delete(){
		$id = I('get.id',0);
		if($this->order->delete($id) !== FALSE){
			$code = array('status'=>'y','info'=>'删除成功');
		}else{
			$this->error($this->order->getError());
			$code = array('status'=>'n','info'=>'删除失败');
		}
		$this->ajaxReturn($code);
	}
	
   
}