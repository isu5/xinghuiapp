<?php
echo md5('imm2030ow@');

//生成唯一标识符  
//sha1()函数， "安全散列算法（SHA1）"  
function create_unique() {  
$data = $_SERVER['HTTP_USER_AGENT'] . $_SERVER['REMOTE_ADDR']  
.time() . rand(); 
$data = md5($data);
$pro = base_convert($data, 8, 10);
return $pro;
//return md5(time().$data);  
//return $data;  
} 
echo "<pre>";

$newhash = create_unique();  
echo $newhash;  

echo "<hr>";



  //Author:铜豌豆
    //QQ:309581329
    //Email:bestphper@126.com
    //http://gongwen.sinaapp.com
    function getRandOnlyId() {
        //新时间截定义,基于世界未日2012-12-21的时间戳。
        $endtime=1356019200;//2012-12-21时间戳
        $curtime=time();//当前时间戳
        $newtime=$curtime-$endtime;//新时间戳
        $rand=rand(0,99);//两位随机
        $all=$rand.$newtime;
        $onlyid=base_convert($all,8,10);//把8进制转为10进制的唯一ID
        return $onlyid;
    }
    //得到随机唯一id
    echo getRandOnlyId();

    echo "<hr/>";

function uuid() {
	  if (function_exists ( 'com_create_guid' )) {
	    return com_create_guid ();
	  } else {
	    mt_srand ( ( double ) microtime () * 10000 ); //optional for php 4.2.0 and up.随便数播种，4.2.0以后不需要了。
	    $charid = strtoupper ( md5 ( uniqid ( rand (), true ) ) ); //根据当前时间（微秒计）生成唯一id.
	    $hyphen = chr ( 45 ); // "-"
	    $uuid = '' . //chr(123)// "{"
	substr ( $charid, 0, 8 ) . $hyphen . substr ( $charid, 8, 4 ) . $hyphen . substr ( $charid, 12, 4 ) . $hyphen . substr ( $charid, 16, 4 ) . $hyphen . substr ( $charid, 20, 12 );
	    //.chr(125);// "}"

		$uuid = base_convert($uuid,3,10);

	    return $uuid;
	  }
}

echo uuid();