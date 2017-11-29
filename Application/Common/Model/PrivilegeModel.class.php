<?php
namespace Common\Model;
use Common\Model\BaseModel;

class PrivilegeModel extends BaseModel{
	
	protected $insertFields = array('pid','pri_name','name_url','icon','status');
	protected $updateFields = array('id','pid','pri_name','name_url','icon','status');

	/**
	 * [chkPri 检测权限链接]
	 * @return [type] [description]
	 */
	public function chkPri(){
		 $adminId = session('uid');

        // 如果是超级管理员直接返回 TRUE
        if($adminId == 1){
            return TRUE;
        }
        //查询数据库,根据管理员id查询角色，再根据角色id 查询权限id
        $arModel = D('admin_role');
        $has = $arModel->alias('a')->
        join('LEFT JOIN __PRI_ROLE__ b ON a.role_id=b.role_id
            LEFT JOIN __PRIVILEGE__ c ON b.pri_id=c.id
        ')
        ->where(array(
            'a.admin_id' => array('eq',$adminId),
            'c.name_url' => array('eq',CONTROLLER_NAME.'/'.ACTION_NAME),
            
        ))->count();

        return ($has > 0);
	}

	


}
?>