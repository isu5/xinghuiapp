<?php
/**
 * 广告上传窗口
 */
namespace Home\Controller;

class AttachmentController extends PublicController{

	public function _initialize(){
		parent::_initialize();
		

	}
	
	// 编辑器图片上传
	public function Weditor(){
		ajax_upload('/images/');
	}

	/**
	 * 会员头像上传
	 */
	public function avatar_upload(){
		ajax_upload('/avatar/');
	}

	 /**
	 *	百度（图片）上传
     *	webuploader 上传文件
     */
    public function ajax_upload(){
        // 根据自己的业务调整上传路径、允许的格式、文件大小
        ajax_upload('/image/');
    }

    /**
     * 百度文件上传
     */
    public function file_upload(){
    	file_upload('/file/');
    }
	
	//企业产品图片上传
	public function product_upload(){
		ajax_upload('/product/');
		
	}
	//会议详情图片上传
	public function conf_upload(){
		ajax_upload('/conference/');
		
	}
	
	//资料文件删除
	public function delFile(){
		$file = $_POST['downfile'];
		if(file_exists($file)){
			unlink($file);
		}
	}
}
?>