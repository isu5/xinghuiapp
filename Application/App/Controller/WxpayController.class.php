<?php
/**
 * 微信支付*
 */
namespace App\Controller;
use Common\Third\WxpayApp;
class WxpayController extends PublicController{
	
	//微信支付
	public function index(){
		
		header('Content-type:text/html; Charset=utf-8');
		$mchid = C("WXPAY.mchid");          //微信支付商户号 PartnerID 通过微信支付商户资料审核后邮件发送
		$appid = C("WXPAY.appid");  //微信支付申请对应的公众号的APPID
		$apiKey = C("WXPAY.apiKey");   //https://pay.weixin.qq.com 帐户设置-安全设置-API安全-API密钥-设置API密钥
		$notify_url = 'https://xh.2188.com.cn/App/Wxpay/notify';
		
		$wechatAppPay = new WxpayApp($appid, $mchid, $notify_url, $apiKey);
		$params['body'] = '商品描述';                       //商品描述
		$params['out_trade_no'] = date('YmdHis',time());    //自定义的订单号
		$params['total_fee'] = 1;                       //订单金额 只能为整数 单位为分
		$params['trade_type'] = 'APP';                      //交易类型 JSAPI | NATIVE | APP | WAP 
		$result = $wechatAppPay->unifiedOrder( $params );
		//print_r($result); // result中就是返回的各种信息信息，成功的情况下也包含很重要的prepay_id
		//2.创建APP端预支付参数
		/** @var TYPE_NAME $result */
		$data = @$wechatAppPay->getAppPayParams( $result['prepay_id'] );
			// 根据上行取得的支付参数请求支付即可
		echo json_encode($data);
	}
	
	//回调地址
		
	public function notify(){
		echo 1;
	}
	
}