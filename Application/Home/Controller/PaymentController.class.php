<?php
//
namespace Home\Controller;
use Common\Third\AlipayPc;
use Common\Third\AlipayReturn;
use Common\Third\AlipayNofity;
use Common\Third\WxpayService;

class PaymentController extends PublicController{
	
	
	public function index(){
		
		$this->display();
	}
	

	//支付宝支付
	public function alipay(){
		/*** 请填写以下配置信息 ***/
		$appid = C('ALIPAY.appid');			//https://open.alipay.com 账户中心->密钥管理->开放平台密钥，填写添加了电脑网站支付的应用的APPID
		$returnUrl = 'https://xh.2188.com.cn/Payment/returnUrl';     //付款成功后的同步回调地址
		$notifyUrl = 'https://xh.2188.com.cn/Payment/notify';     //付款成功后的异步回调地址
		$outTradeNo = date('YmdHis', time());     //你自己的商品订单号，不能重复
		$payAmount = 0.01;          //付款金额，单位:元
		$orderName = '支付测试';    //订单标题
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
		echo $sHtml;
	}
	
	//支付宝付款成功后的同步回调地址
	public function returnUrl(){
		header('Content-type:text/html; Charset=utf-8');
		//支付宝公钥，账户中心->密钥管理->开放平台密钥，找到添加了支付功能的应用，根据你的加密类型，查看支付宝公钥
		$alipayPublicKey = C('ALIPAY.publickey');

		$aliPay = new AlipayReturn($alipayPublicKey);
		
		//验证签名
		$result = $aliPay->rsaCheck($_GET,$_GET['sign_type']);
		
		if($result){
            // 下面写验证通过的逻辑 比如说更改订单状态等等 $_GET['out_trade_no'] 为订单号；

            $this->success('支付成功',U('Payment/orderlist'));
        }else{
            $this->success('支付失败',U('Payment/orderlist'));
        }
	}
	
	//支付宝付款成功后的异步回调地址
	public function notify(){
		
		require_once("./alipay/config.php");
		require_once './alipay/wappay/service/AlipayTradeService.php';
		$arr=$_POST;
		$alipaySevice = new \AlipayTradeService($config); 
		$alipaySevice->writeLog(var_export($_POST,true));
		$result = $alipaySevice->check($arr);
		
		if($result===true){
			echo 'success';
			//处理你的逻辑，例如获取订单号$_POST['out_trade_no']，订单金额$_POST['total_amount']等
			//程序执行完后必须打印输出“success”（不包含引号）。如果商户反馈给支付宝的字符不是success这7个字符，支付宝服务器会不断重发通知，直到超过24小时22分钟。一般情况下，25小时以内完成8次通知（通知的间隔频率一般是：4m,10m,10m,1h,2h,6h,15h）；
			//商户订单号
			$data['out_trade_no'] = $_POST['out_trade_no'];
			//支付宝交易号
			$data['trade_no'] = $_POST['trade_no'];
			//交易状态
			$data['trade_status'] = $_POST['trade_status'];
			
			$data['subject'] = $_POST['subject'];
			$data['gmt_create'] = $_POST['gmt_create'];
			$data['seller_email'] = $_POST['seller_email'];
			$data['gmt_payment'] = $_POST['gmt_payment'];
			$data['notify_time'] = $_POST['notify_time'];
			$data['total_amount'] = $_POST['total_amount'];
			$data['buyer_logon_id'] = $_POST['buyer_logon_id'];
			
			$ualipay = M('User_alipay');
			$ualipay->add($data);
			
			exit();
		}
		echo 'fail';exit();
				
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
		$payAmount = 0.01;          //付款金额，单位:元
		$orderName = '支付测试';    //订单标题
		$notifyUrl = 'https://xh.2188.com.cn/Payment/wechatnotify';     //付款成功后的异步回调地址(不要有问号)
		$returnUrl = 'https://xh.2188.com.cn/Payment/wechatreturn';     //付款成功后页面跳转的地址
		$payTime = time();      //付款时间
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
		
		$this->display();
		
		
	}
	//微信支付 notifyUrl
	public function wechatnotify(){
		
		// ↓↓↓下面的file_put_contents是用来简单查看异步发过来的数据 测试完可以删除；↓↓↓
		// 获取xml
		$xml=file_get_contents('php://input', 'r');
		//转成php数组 禁止引用外部xml实体
		libxml_disable_entity_loader(true);
		$data= json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA));
		file_put_contents('./data/notify.txt', $data);
		// ↑↑↑上面的file_put_contents是用来简单查看异步发过来的数据 测试完可以删除；↑↑↑
		// 导入微信支付sdk
		
		$mchid = C("WXPAY.mchid");          //微信支付商户号 PartnerID 通过微信支付商户资料审核后邮件发送
		$appid = C("WXPAY.appid");  //微信支付申请对应的公众号的APPID
		$apiKey = C("WXPAY.apiKey");   //https://pay.weixin.qq.com 帐户设置-安全设置-API安全-API密钥-设置API密钥
		$wxPay = new WxpayService($mchid,$appid,$apiKey);
		$result = $wxPay->notify();
		if($result){
			//完成你的逻辑
			//例如连接数据库，获取付款金额$result['cash_fee']，获取订单号$result['out_trade_no']，修改数据库中的订单状态等;
			$data['total_amount'] = $result['cash_fee'];
			$data['out_trade_no'] = $result['out_trade_no'];
			$data['trade_status'] =	$result["result_code"];
			
			if(array_key_exists("return_code", $result)&& array_key_exists("result_code", $result)&& $result["return_code"] == "SUCCESS"&& $result["result_code"] == "SUCCESS"){
				$file = './log.txt';//要写入文件的文件名（可以是任意文件名），如果文件不存在，将会创建一个
				$content = "支付成功".$result."\n"; //要写入的内容
				file_put_contents($file, $content);
				$pay = M('User_alipay');
				$pay->add($data);
				$file = './log.txt';//要写入文件的文件名（可以是任意文件名），如果文件不存在，将会创建一个
				$content = "支付成功".$bdata['total_fee']."\n"; //要写入的内容
			}else{
				echo 'pay error';
			}
		}
		
	}
	//微信同步地址
	public function wechatreturn(){
		$outTradeNo = I('get.outTradeNo');
		$mchid = C("WXPAY.mchid");          //微信支付商户号 PartnerID 通过微信支付商户资料审核后邮件发送
		$appid = C("WXPAY.appid");  //微信支付申请对应的公众号的APPID
		$apiKey = C("WXPAY.apiKey");   //https://pay.weixin.qq.com 帐户设置-安全设置-API安全-API密钥-设置API密钥
		$wxPay = new WxpayService($mchid,$appid,$apiKey);
		$data = $wxPay->orderquery($outTradeNo);
		p($data);
	}
	
	//支付订单
	public function orderlist(){
		
		
		
		$this->display();
	}
	
	
	
	
   
}