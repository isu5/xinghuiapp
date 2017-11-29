<?php
namespace Common\Third;
/**
 * 融云 Server API PHP 客户端
 * create by kitName
 * create datetime : 2017-08-18
 * 
 * v2.0.1
 */
 //测试获取token值
/*
$p = new RongCloud('82hegw5u83l8x','3NHUMv9zRPrdA5');
$r = $p->getToken('11','22','33');
print_r($r);
*/
 
class RongCloud{
	private $appKey;                //appKey
    private $appSecret;             //secret
    const   SERVERAPIURL = 'https://api.cn.ronghub.com';    //请求服务地址
    private $format;                //数据格式 json/xml

		
	/**
     * 参数初始化
     * @param $appKey
     * @param $appSecret
     * @param string $format
     */
    public function __construct($appKey, $appSecret, $format = 'json') {
		$this->appKey = $appKey;
        $this->appSecret = $appSecret;
        $this->format = $format;
    }
	
	/**
	 * 获取 Token 方法 
	 * 
	 * @param  userId:用户 Id，最大长度 64 字节.是用户在 App 中的唯一标识码，必须保证在同一个 App 内不重复，重复的用户 Id 将被当作是同一用户。（必传）
	 * @param  name:用户名称，最大长度 128 字节.用来在 Push 推送时显示用户的名称.用户名称，最大长度 128 字节.用来在 Push 推送时显示用户的名称。（必传）
	 * @param  portraitUri:用户头像 URI，最大长度 1024 字节.用来在 Push 推送时显示用户的头像。（必传）
	 *
	 * @return $json
	 **/
	public function getToken($userId, $name, $portraitUri) {
    	try{
			if (empty($userId))
				//throw new \Exception('用户 Id 不能为空');
				
			if (empty($name))
				//throw new \Exception('用户名不能为空');
				
			if (empty($portraitUri))
				//throw new \Exception('用户头像 URI 不能为空');
				
	
    		$params = array (
    		'userId' => $userId,
    		'name' => $name,
    		'portraitUri' => $portraitUri
    		);
			
    		
    		 $ret = $this->curl('/user/getToken',array('userId'=>$userId,'name'=>$name,'portraitUri'=>$portraitUri));
    		if(empty($ret))
    			throw new \Exception('请求失败');
    		return $ret;
    		
    	}catch (Exception $e) {
    		print_r($e->getMessage());
    	}
	}
	
	/**
	 * 刷新用户信息方法 
	 * 
	 * @param  userId:用户 Id，最大长度 64 字节.是用户在 App 中的唯一标识码，必须保证在同一个 App 内不重复，重复的用户 Id 将被当作是同一用户。（必传）
	 * @param  name:用户名称，最大长度 128 字节。用来在 Push 推送时，显示用户的名称，刷新用户名称后 5 分钟内生效。（可选，提供即刷新，不提供忽略）
	 * @param  portraitUri:用户头像 URI，最大长度 1024 字节。用来在 Push 推送时显示。（可选，提供即刷新，不提供忽略）
	 *
	 * @return $json
	 **/
	public function userRefresh($userId, $name = '', $portraitUri = '') {
    	try{
			if (empty($userId))
				throw new \Exception('用户 Id 不能为空');
				
	
    		$params = array (
    		'userId' => $userId,
    		'name' => $name,
    		'portraitUri' => $portraitUri
    		);
    		
    		$ret = $this->curl('/user/refresh',array('userId'=>$userId,'name'=>$name,'portraitUri'=>$portraitUri));
    		if(empty($ret))
    			throw new \Exception('请求失败');
    		return $ret;
    		
    	}catch (Exception $e) {
    		print_r($e->getMessage());
    	}
	}
	
	/**
	 * 检查用户在线状态 方法 
	 * 
	 * @param  userId:用户 Id，最大长度 64 字节。是用户在 App 中的唯一标识码，必须保证在同一个 App 内不重复，重复的用户 Id 将被当作是同一用户。（必传）
	 *
	 * @return $json
	 **/
	public function checkOnline($userId) {
    	try{
			if (empty($userId))
				throw new \Exception('用户 Id 不能为空');
				
	
    		$params = array (
    		'userId' => $userId
    		);
    		
    		$ret = $this->curl('/user/checkOnline',array('userId'=>$userId));
    		if(empty($ret))
    			throw new \Exception('请求失败');
    		return $ret;
    		
    	}catch (Exception $e) {
    		print_r($e->getMessage());
    	}
	}
    
    
    /**
     * 创建http header参数
     * @param array $data
     * @return bool
     */
    private function createHttpHeader() {
        $nonce = mt_rand();
        $timeStamp = time();
        $sign = sha1($this->appSecret.$nonce.$timeStamp);
        return array(
            'RC-App-Key:'.$this->appKey,
            'RC-Nonce:'.$nonce,
            'RC-Timestamp:'.$timeStamp,
            'RC-Signature:'.$sign,
        );
    }

    /**
     * 重写实现 http_build_query 提交实现(同名key)key=val1&key=val2
     * @param array $formData 数据数组
     * @param string $numericPrefix 数字索引时附加的Key前缀
     * @param string $argSeparator 参数分隔符(默认为&)
     * @param string $prefixKey Key 数组参数，实现同名方式调用接口
     * @return string
     */
    private function build_query($formData, $numericPrefix = '', $argSeparator = '&', $prefixKey = '') {
        $str = '';
        foreach ($formData as $key => $val) {
            if (!is_array($val)) {
                $str .= $argSeparator;
                if ($prefixKey === '') {
                    if (is_int($key)) {
                        $str .= $numericPrefix;
                    }
                    $str .= urlencode($key) . '=' . urlencode($val);
                } else {
                    $str .= urlencode($prefixKey) . '=' . urlencode($val);
                }
            } else {
                if ($prefixKey == '') {
                    $prefixKey .= $key;
                }
                if (is_array($val[0])) {
                    $arr = array();
                    $arr[$key] = $val[0];
                    $str .= $argSeparator . http_build_query($arr);
                } else {
                    $str .= $argSeparator . $this->build_query($val, $numericPrefix, $argSeparator, $prefixKey);
                }
                $prefixKey = '';
            }
        }
        return substr($str, strlen($argSeparator));
    }

    

    /**
     * 发起 server 请求
     * @param $action
     * @param $params
     * @param $httpHeader
     * @return mixed
     */
    public function curl($action, $params) {
        
        $action = self::SERVERAPIURL.$action.'.'.$this->format;
            
        $httpHeader = $this->createHttpHeader();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $action);
        curl_setopt($ch, CURLOPT_POST,1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $this->build_query($params));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $httpHeader);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,false); //处理http证书问题
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_DNS_USE_GLOBAL_CACHE, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $ret = curl_exec($ch);
        if (false === $ret) {
            $ret =  curl_errno($ch);
        }
        curl_close($ch);
        return $ret;
    }
	
	
	
	
	
}