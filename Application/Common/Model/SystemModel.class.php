<?php
/******************************************************************
* 系统配置类型
*/
namespace Common\Model;
use Common\Model\BaseModel;

class SystemModel extends BaseModel{
	
	public function editData(){
        $data=I('post.');
        // p($data);die;
        foreach ($data as $k => $v) {
            $this->where(array('name'=>$k))->setField('value',$v);
            $data[$k]=htmlspecialchars_decode($v);
			//p($data);die;
        }
        $data['WEB_STATISTICS']=str_replace( "'",'"',$data['WEB_STATISTICS']);
        $str=<<<php
<?php
return array(
//此配置项为自动生成请勿直接修改；如需改动请在后台网站设置
//*************************************基本设置****************************************
    'WEB_STATUS'                =>  '{$data['WEB_STATUS']}',           //网站状态1:开启 0:关闭
    'WEB_CLOSE_WORD'            =>  '{$data['WEB_CLOSE_WORD']}',       //网站关闭时提示文字
	'WEB_URL'					=>	'{$data['WEB_URL']}',				//网站URL
	'WEB_NAME'                  =>  '{$data['WEB_NAME']}',             //网站名：
    'WEB_KEYWORDS'              =>  '{$data['WEB_KEYWORDS']}',         //网站关键字
    'WEB_DESCRIPTION'           =>  '{$data['WEB_DESCRIPTION']}',      //网站描述
	'COPYRIGHT_WORD'            =>  '{$data['COPYRIGHT_WORD']}',       //文章保留版权提示
    'WEB_ICP_NUMBER'            =>  '{$data['WEB_ICP_NUMBER']}',       // 网站ICP备案号
	'WEB_STATISTICS'            =>  '{$data['WEB_STATISTICS']}',       // 第三方统计代码

//***********************************邮箱设置***********************************************
    'EMAIL_SMTP'                =>  '{$data['EMAIL_SMTP']}',           //  SMTP服务器
    'EMAIL_USERNAME'            =>  '{$data['EMAIL_USERNAME']}',       //  邮箱用户名
    'EMAIL_PASSWORD'            =>  '{$data['EMAIL_PASSWORD']}',       //  邮箱密码
    'EMAIL_FROM_NAME'           =>  '{$data['EMAIL_FROM_NAME']}',      //  发件名
//***********************************评论管理***********************************************
    'COMMENT_REVIEW'            =>  '{$data['COMMENT_REVIEW']}',       // 评论审核1:开启 0:关闭
    'COMMENT_SEND_EMAIL'        =>  '{$data['COMMENT_SEND_EMAIL']}',   // 被评论邮件通知1:开启 0:关闭
    'EMAIL_RECEIVE'             =>  '{$data['EMAIL_RECEIVE']}',        // 接收评论通知邮箱
	
//***********************************APP管理************************************************
	'APP_VERSION'				=> '{$data['APP_VERSION']}',
	'APP_PHONE'  				=> '{$data['APP_PHONE']}',
	'APP_INFO'  				=> '{$data['APP_INFO']}',
	'APP_URL'  					=> '{$data['APP_URL']}',
	'APP_COMPANY' 				=> '{$data['APP_COMPANY']}',
	'APP_ADDRESS'  				=> '{$data['APP_ADDRESS']}',
//***********************************建立二级账户数量************************************************

	'ACCOUNT_NUM' => '{$data['ACCOUNT_NUM']}',	
//***********************************建立合作伙伴数量************************************************
	'PARTNERS_NUM'=> '{$data['PARTNERS_NUM']}',

//***********************************微信支付宝支付金额设置******************************************
	'PAY_ONE' => '{$data['PAY_ONE']}',
	'PAY_TWO' => '{$data['PAY_TWO']}',
	'PAY_THREE' => '{$data['PAY_THREE']}',
);

php;
        file_put_contents('./Application/Common/Conf/webconfig.php', $str);
        return true;
    }

    // 获取全部数据
    public function getAllData(){
        return $this->getField('name,value');
    }

	
	
	
	
	
}
?>