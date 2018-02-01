<?php
/******************************************************************
* [alicms] 阿里CMS
* @Copyright (C) 2014-2015  http://www.aliphp.cn   All rights reserved.
* @Team  ylnmp.com
* @Author: 竹永乐 QQ:396691677
* @Licence http://www.aliphp.cn/license.txt
*/
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think\Upload;


class CommonController extends AdminBaseController {

	public function _initialize(){
		parent::_initialize();
      
      
        /*************** 先取出当前管理员所拥有的所有的权限 ****************/
        $adminId = session('uid');
        if($adminId == 1){
            $priModel = D('Privilege');
            $priData = $priModel->order('sort desc')->select();
            
        }else{
            // 取出当前管理员所在角色 所拥有的权限
            $arModel = D('admin_role');
            $priData = $arModel->alias('a')
            ->field('DISTINCT c.id,c.pri_name,c.name_url,c.pid')
            ->join('LEFT JOIN __PRI_ROLE__ b ON a.role_id=b.role_id 
                    LEFT JOIN __PRIVILEGE__ c ON b.pri_id=c.id')
            ->where(array(
                'a.admin_id' => array('eq', $adminId),
            ))->order('c.sort desc')->select();
        }
        /*************** 从所有的权限中挑出前两级的 **********************/
        $btns = array();  // 前两级权限
        foreach ($priData as $k => $v){
            if($v['pid'] == 0){
                // 再找这个顶级的子级
                foreach ($priData as $k1 => $v1){
                    if($v1['pid'] == $v['id']){
                        $v['children'][] = $v1;
                    }
                }
                $btns[] = $v;
            }
        }

        $this->assign('btns',$btns);
		
		
	}
	//空控制器
	
	
	/**
     * 获取全部数据
     * @param  string $type  tree获取树形结构 level获取层级结构
     * @param  string $order 排序方式   
     * @return array         结构数据
     */
    protected function getMenu($items, $id = 'id', $pid = 'pid', $son = 'children'){
        $tree = array();
        $tmpMap = array();

        foreach ($items as $item) {
            $tmpMap[$item[$id]] = $item;
        }

        foreach ($items as $item) {
            if (isset($tmpMap[$item[$pid]])) {
                $tmpMap[$item[$pid]][$son][] = &$tmpMap[$item[$id]];
            } else {
                $tree[] = &$tmpMap[$item[$id]];
            }
        }
        return $tree;
    }
	
	//上传图片   uploadify插件
	
	public function uploadFile(){
     if (!empty($_FILES)) {  
            $upload = new Upload();  
            $upload->rootPath  = C('UPLOAD_CONFIG.rootPath');//根路径  
            $upload->savePath = date('Y').'/'.date('m').'/'.date('d').'/';//子路径，文件夹自动分级好点，不然文件太多了数量大了以后不好找图片  
            $upload->exts = C('UPLOAD_CONFIG.exts');//可以上传的文件类型  
            $upload->autoSub = false;  
            $upload->saveRule = uniqid; //上传规则，文件名会自动重新获取，这样保证文件不会被覆盖  
            $info = $upload->upload();  
            if(!$info){ 
                $arr = array(
                    'status' => 0,
                    'msg' => $upload->getError(),
                ); 
                echo json_encode($arr);//获取失败信息  
            } else {  
                //p($info);
                //成功  
                $fileArray = "";  

                foreach ($info as $file) {  
                    //返回文件在服务器上的路径  
                    $fileArray = '/'.$upload->rootPath . $file['savepath'] . $file['savename'];  
                }  
                $arr = array(
                    'status' => 1,
                    'msg' => $fileArray,
                    'filetype' => $info['Filedata']['ext']
                    ); 
                 echo json_encode($arr);
            }  
        }  
	}
	
	
	
	
	
	
	
}
?>