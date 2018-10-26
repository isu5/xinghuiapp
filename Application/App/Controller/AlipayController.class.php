<?php
/**
 * 支付宝支付*
 */
namespace App\Controller;
use Org\Nx\Response;
class AlipayController extends PublicController{
	public function _initialize(){
		parent::_initialize(); 
		$this->payment = D('User_alipay'); 
		$this->invoice = M('Payment_invoice'); 
		//p($info);	
	}
	
	
	//支付宝支付
	public function index(){
		require_once './alipay/aop/AopClient.php';
		require_once './alipay/aop/request/AlipayTradeAppPayRequest.php';
		$aop = new \AopClient;
		//p($aop);die;
		$aop->gatewayUrl = "https://openapi.alipay.com/gateway.do";
		$aop->appId = C('ALIPAY.appid');
		$aop->rsaPrivateKey = C('ALIPAY.privatekey');
		$aop->format = "json";
		$aop->charset = "UTF-8";
		$aop->signType = "RSA2";
		$aop->alipayrsaPublicKey = C('ALIPAY.publickey');
		
		/// 异步通知地址
        $notify_url = "https://xh.2188.com.cn/app/alipay/nofiy_url";
        // 订单标题
        $subject = '幸会年费';
        // 订单详情
        $body = '幸会年费-可使用调查问卷，团队管理，数据分析';
        // 价格
        //$total = I('post.total_amount');
        $total = 0.01;
        // 订单号，示例代码使用时间值作为唯一的订单ID号
        $out_trade_no = date('YmdHis', time());
		
		//实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
		$request = new \AlipayTradeAppPayRequest();
		//SDK已经封装掉了公共参数，这里只需要传入业务参数
		$bizcontent = "{\"body\":\"".$body."\","
            . "\"subject\": \"".$subject."\","
            . "\"out_trade_no\": \"".$out_trade_no."\","
            . "\"timeout_express\": \"30m\","
            . "\"total_amount\": \"".$total."\","
            . "\"product_code\":\"QUICK_MSECURITY_PAY\""
            . "}";
		$request->setNotifyUrl($notify_url);
        $request->setBizContent($bizcontent);
		//这里和普通的接口调用不同，使用的是sdkExecute
		$response = $aop->sdkExecute($request);
		
		//htmlspecialchars是为了输出到页面时防止被浏览器将关键参数html转义，实际打印到日志以及http传输不会有这个问题
		echo $response;//就是orderString 可以直接给客户端请求，无需再做处理。
		$data['user_id'] = I('post.user_id');
		$data['total_amount'] = $total;
		$data['invoice_address'] = I('post.invoice_address');
		$data['out_trade_no'] = $out_trade_no;
		$data['addtime'] = date('Y-m-d H:i:s', time());
		$data['paytype'] = I('post.paytype'); //选择付款的期限
		$m = M('Payment_invoice');
		$m->add($data);
	}
	
	//支付宝异步通知
	public function nofiy_url(){
		require_once("./alipay/config.php");
		require_once './alipay/wappay/service/AlipayTradeService.php';
		$arr=$_POST;
		$alipaySevice = new \AlipayTradeService($config); 
		$alipaySevice->writeLog(var_export($_POST,true));
		$result = $alipaySevice->check($arr);
		
		/* 实际验证过程建议商户添加以下校验。
		1、商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		4、验证app_id是否为该商户本身。
		*/
		if($result) {//验证成功
		
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代

			
			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			
			//获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表
			$data['gmt_create'] = $_POST['gmt_create'];
			$data['gmt_payment'] = $_POST['gmt_payment'];
			$data['notify_time'] = $_POST['notify_time'];
			$data['out_trade_no'] = $_POST['out_trade_no'];
			$data['trade_no'] = $_POST['trade_no'];
			$data['total_amount'] = $_POST['total_amount'];
			$data['trade_status'] = $_POST['trade_status'];
			$data['paychannel'] = 1; //为支付宝支付
			$data['state'] = 1; //成功说明已支付 0未支付，1为支付
			//付款日期
			$payment = $this->invoice->where(['out_trade_no'=>$data['out_trade_no']])->find();
			$data['paytype'] = $payment['paytype'];
			$data['user_id'] = $payment['user_id'];
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
			
			if($_POST['trade_status'] == 'TRADE_FINISHED') {
				
				$alipay->where(['out_trade_no'=>$data['out_trade_no']])->save($data['trade_status']);
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
				
				$this->payment->add($data);
			
				
			}
			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
			
			
			echo "success";		//请不要修改或删除
				
		}else {
			//验证失败
			
			echo "fail";	//请不要修改或删除

		}
	}
	
	//用户支付检测
	public function checkpay(){
		$user_id = I('post.user_id');
		
		//查询下发订单
		$order = $this->invoice->where(['user_id'=>$user_id])->order('addtime desc')->find();
		
		//查询是否支付
		$pay = $this->payment->where(['out_trade_no'=>$order['out_trade_no']])->order('id desc')->find();
		
		if($pay != null ){
			//支付宝支付
			if($pay['paychannel'] == 1){
				require_once("./alipay/config.php");
				require_once('./alipay/pcpay/pagepay/service/AlipayTradeService.php');
				require_once ('./alipay/pcpay/pagepay/buildermodel/AlipayTradeQueryContentBuilder.php');
				
				$RequestBuilder = new \AlipayTradeQueryContentBuilder();
			
				if($pay['state']==1){
					$RequestBuilder->setOutTradeNo($pay['out_trade_no']);
					$RequestBuilder->setTradeNo($pay['trade_no']);
					 //支付时间
					$starttime = strtotime($pay['gmt_create']);
					$endtime = strtotime($pay['endtime']);
				}
				$aop = new \AlipayTradeService($config);
				/**
				 * alipay.trade.query (统一收单线下交易查询)
				 * @param $builder 业务参数，使用buildmodel中的对象生成。
				 * @return $response 支付宝返回的信息
				 */
				$response = $aop->Query($RequestBuilder);
				//p($response);
				//p($pay);
				if( $pay['state']==1 && time() <= $starttime + 3600*24*365){
					
					if($response->code == 10000){
						Response::show(200,'您已支付!',$response);
					}else{
						Response::show(201,'您未支付');
					}
					
					
				/* elseif($pay['id']){
					$pay['state']=3;//设置为3，为过期
					$this->payment->where('id='.$pay['id'])->save($pay);
					Response::show(401,'您的年费到期了，请及时续费');	
					 */
				} elseif(time() == $pay['endtime']){
					if($pay['id']){
						$pay['state']=3;//设置为3，为过期
						$this->order->where('id='.$pay['id'])->save($pay);
						Response::show(401,'您的年费到期了，请及时续费'); //老订单作废
					}
				}else{
					Response::show(402,'没有该用户，请确保信息正确!');
				}
			}
			//微信支付
			
		}else{
			Response::show(403,'该用户还未支付！');
		}
		
		
		
	}
	
	//下发支付信息
	public function payinfo(){
		$data = [
			'total_amount'=>80,
			'subject' => '幸会服务年费',
			'body' => '幸会年费-可使用调查问卷，团队管理，数据分析'
		];
		if($data){
			Response::show(200,'成功',$data);
		}else{
			
			Response::show(401,'失败');
		}
	}
	
	
	
	
	
}