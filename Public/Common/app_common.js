/**
* app 公共js方法
*/

//上传附件
function app_upload_att(url){
	layer.open({
      type: 2,
      title: '上传附件',
      area: ['500px', '430px'],
      content: url
    });
}
//后台图片预览
function app_img_preview(id, src){
	if(src == '') return;
	layer.tips('<img src="'+src+'" height="200" >', '#'+id, {
	  tips: [1, '#fff']
	});	

}
//前台会员证件预览
function f_img_preview(id, src){
	src = $('#'+id).attr('src');
	if(src == '') return;
	layer.tips('<img src="'+src+'" height="300" >', '#'+id, {
	  tips: [1, '#fff']
	});	

}


//删除多文件上传
function remove_li(obj){
	 $(obj).parent().remove();
}