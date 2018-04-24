<?php
/**
 * 公告模型
 */
namespace Common\Model;
use Common\Model\BaseModel;

class AdvertModel extends BaseModel{

	private $insertFields = array('title','bullurl','pic','click','sort','status');
	private $updateFields = array('id','title','bullurl','pic','click','sort','status');

	/**
	 *  翻页
	 */
	
	public function search($pagesize=15){

		//搜索
		$where = array();
		$title = I('get.title');
		if ($title) {
			$where['title'] = array('like',"%$title%");
		}
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this->where($where)->limit($page->firstRow.','.$page->listRows)->order('id desc')->select();
		return $data;
	}
	
	public function _before_insert(&$data, $option){
		$data['addtime'] = time();
	}
	
	// 修改前
	protected function _before_update(&$data, $option)
	{
		if(isset($_FILES['pic']) && $_FILES['pic']['error'] == 0)
		{
			$ret = uploadOne('pic', 'Advert', array(
				
			));
			if($ret['ok'] == 1)
			{
				$data['pic'] = $ret['images'][0];
				
			}
			else 
			{
				$this->error = $ret['error'];
				return FALSE;
			}
			deleteImage(array(
				I('post.old_logo'),
				
			));
		}
	}

	/**
	 * [_before_delete 删除之前]
	 * @param  [type] $option [description]
	 * @return [type]         [description]
	 */
	protected function _before_delete($option)
	{
		if(is_array($option['where']['id']))
		{
			$this->error = '不支持批量删除';
			return FALSE;
		}
		$images = $this->field('pic')->find($option['where']['id']);
		deleteImage($images);
	}



}