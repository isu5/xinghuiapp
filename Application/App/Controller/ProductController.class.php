<?php
/****
** 产品统计
*/
namespace App\Controller;
use Org\Nx\Response;

class ProductController extends PublicController{

	
	private $model = null;
	
	//继承父类
	public function __construct(){
		parent::__construct();
		$this->model = D('Product');
	}
	
	//企业产品统计
	public function pstats(){
		
		if( IS_POST ){
			$res = $this->model->search();
		
			$data = array(
				'result' => $res['data'],
				//'page' => $res['page'],
				
			);
			//p($data['result']);die;
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
	}
	
	//企业产品谁点击的统计
	public function countwho(){
		
		if( IS_POST ){
			$res = $this->model->countwho();
		
			$data = array(
				'result' => $res['data'],
				//'page' => $res['page'],
				
			);
			//p($data['result']);die;
			if($data['result'] == null ){
				Response::show(401,'没有更多数据!');
				
			}else{
				Response::show(200,'数据获取成功!',$data);
				
			}
		}else{
			Response::show(402,'参数不合法!');
			
		}
		
	}

	

	
	

	







	
}

?>