<?php
/**
*  企业资料
*/
namespace Home\Model;
use Think\Model\RelationModel;

class ConferencereportquesModel extends RelationModel{
	
	protected $tableName = 'conference_reportques';
	protected $_validate = array(
		array('title', 'require', '请输入问题内容', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
		array('options', '/{.+}/', '请配置问题选项', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
		array('standard', 'require', '请配置标准答案', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
		array('sort', 'number', '问题排序必须配置为正整数', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
	);
	
	
	public function search($pagesize=15){
		$where = array();
		
		$where['user_id'] = cookie(userid);
		//翻页
		$count = $this->where($where)->count();
		$page = new \Think\Page($count,$pagesize);
		//配置分页
		$page->setConfig('prev', '上一页');
		$page->setConfig('next', '下一页');
		$data['page'] = $page->show();
		$data['data'] = $this
		->where($where)
		->limit($page->firstRow.','.$page->listRows)
		->order('id desc')
		->select();
		
		return $data;
	}
	
	/**
	 * 取得标准答案的关联数组
	 * @param string $standard  数据库中记录的标准答案字符串
	 * @param bool $isText  是否是输入文本型的问题
	 * @return 如果是文本型问题，直接返回答案字符串。如果是选项型问题，返回关联数组，键为选项号，值为空串(一般选项)或者文本(其他选项)
	 */
	public function getStandardList($standard, $isText)
	{
		if( $isText ){ //当前问题是一个文本输入型的问题
			return $standard;
		}else{
			$list = explode(',', $standard);

			foreach ($list as $value) {
				$sep = explode(':', $value);
				$key = $sep[0];
				$value = isset($sep[1]) ? $sep[1] : '';

				$standardList[$key] = $value;
			}

			return $standardList;
		}
	}
	
	
	
}