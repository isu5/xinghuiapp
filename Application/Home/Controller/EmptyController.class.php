<?php
/**空控制器
 *
 */
namespace Home\Controller;

class EmptyController extends PublicController{


	/**
	 * [_empty 空操作]
	 * @return [type] [description]
	 */
	public function _empty()
	{
		$this->error('页面不存在');
	}
}