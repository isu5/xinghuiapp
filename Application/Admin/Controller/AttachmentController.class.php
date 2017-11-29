<?php

/**
 * 附件管理控制器
 */
namespace Admin\Controller;


class AttachmentController extends CommonController{
	
	public function index(){
		
		$this->display();
	}
	
	public function upload_box(){
		$pid = isset($_GET['pid']) ? $_GET['pid'] : 'uploadfile';
		//$module = isset($_GET['module']) ? $_GET['module'] : '';
		$t = isset($_GET['t']) ? intval($_GET['t']) : 1; //上传类型，1为图片类型
		$n = isset($_GET['n']) ? 20 : 1;  //上传数量
		$s = round(C('UPLOAD_CONFIG.maxSize'));  //允许上传附件大小
		switch ($t){
			case 1:
			  $type = '*.jpg; *.jpeg; *.png; *.gif;';
			  break;  
			case 2:
			  $type = '*.zip; *.rar; *.doc; *.docx; *.xls; *.xlsx; *.ppt; *.pptx; *.pdf;';
			  break;
			//case 3:
			//  $type = '*.doc; *.docx; *.xls; *.xlsx; *.ppt; *.pptx; *.pdf; *.txt;';
			//  break;
			default:
			  $type = '*.jpg; *.jpeg; *.png; *.gif;';
		}


		$this->assign(array(
			'pid' => $pid,
			't' => $t,
			'n' => $n,
			's' => $s,
			'type' => $type,

			));

		$this->display();
	}
	
	
	
}