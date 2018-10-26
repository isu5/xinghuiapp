<?php

namespace Home\Controller;
use Think\Controller;
use Common\Third\WxpayService;
class PublicController extends Controller{

	public function _initialize(){
		
		
		if(!$_COOKIE['userid']){
			$this->error("非法访问！正在跳转登录页面",U('Login/index'));
		}
		
		//判断当前登录会员是否已认证
		$cert = D('Certify');
		$this->user_id = cookie('userid');
		$info = $cert->field('is_cert,uid,type')->where(array('uid'=>$this->user_id))->select();
		//p($info);
		$this->assign('info',$info);
		
		$this->payment = M('Payment_invoice');
		$this->order = D('Useralipay');
		
	}
	
	
	
	//判断是否支付支付
	
	public function checkpay(){
		
		//$order = $this->payment->where(['user_id'=>$this->user_id])->order('addtime desc')->find();
		//查询是否支付
		//if($order['out_trade_no']){
			
		//$pay = $this->order->where(['out_trade_no'=>$order['out_trade_no']])->order('id desc')->find();
		
		/* p($order);
		p($pay); */ 
		$pay = $this->order->where(['user_id'=>$this->user_id])->order('id desc')->find();
		
		if($pay['paychannel'] == 1){
			require_once("./alipay/config.php");
			require_once('./alipay/pcpay/pagepay/service/AlipayTradeService.php');
			require_once ('./alipay/pcpay/pagepay/buildermodel/AlipayTradeQueryContentBuilder.php');
			
			$RequestBuilder = new \AlipayTradeQueryContentBuilder();
			
			$RequestBuilder->setOutTradeNo($pay['out_trade_no']);
			$RequestBuilder->setTradeNo($pay['trade_no']);
			 //支付时间
			$starttime = strtotime($pay['gmt_create']);
			$endtime = strtotime($pay['endtime']);
			
			$aop = new \AlipayTradeService($config);
			/**
			 * alipay.trade.query (统一收单线下交易查询)
			 * @param $builder 业务参数，使用buildmodel中的对象生成。
			 * @return $response 支付宝返回的信息
			 */
			$response = $aop->Query($RequestBuilder);
			//p($response);
			
			if( $pay['state']==1 && time() <= $starttime + 3600*24*365){
				if($response->code == 10000){ //支付成功
				
					return 1;
				}else{
					
					return 0;	
				}
			}elseif(time() == $pay['endtime']){
				if($pay['id']){
					$pay['state']=3;//设置为3，为过期
					$this->order->where('id='.$pay['id'])->save($pay);
					return 3; //老订单作废
				}
			}else{
				return 2;
				
			}
		}
		if($pay['paychannel'] == 2){
			//微信支付
			$mchid = C("WXPAY.mchid");          //微信支付商户号 PartnerID 通过微信支付商户资料审核后邮件发送
			$appid = C("WXPAY.appid");  //微信支付申请对应的公众号的APPID
			$apiKey = C("WXPAY.apiKey");   //https://pay.weixin.qq.com 帐户设置-安全设置-API安全-API密钥-设置API密钥
			$wxPay = new WxpayService($mchid,$appid,$apiKey);
			$order = $wxPay->orderquery($pay['out_trade_no']);
			//p($order);die;
			$starttime = strtotime($pay['gmt_create']);
			$endtime = strtotime($pay['endtime']);
			if( $pay['state']==1 && time() <= $starttime + 3600*24*365){
				if($order['code'] == 0){ //支付成功
				
					return 1;
				}else{
					
					return 0;	
				}
			}elseif(time() == $pay['endtime']){
				if($pay['id']){
					$pay['state']=3;//设置为3，为过期
					$this->order->where('id='.$pay['id'])->save($pay);
					return 3; //老订单作废
				}
			}else{
				return 2;
				
			}
		
		}
	}

	

}