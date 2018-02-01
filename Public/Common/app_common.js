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
	layer.tips('<img src="'+src+'" height="800" >', '#'+id, {
	  tips: [1, '#fff']
	});	

}
//前台会员证件预览
function f_img_preview(id, src){
	src = $('#'+id).attr('src');
	if(src == '') return;
	layer.open({
		type: 1,
		title: "点击图片以外透明处图片消失",
		closeBtn: 0,
		area: ['820px', '600px'],
		skin: 'layui-layer-nobg', //没有背景色
		shadeClose: true,
		content: '<img src="'+src+'" style="width:800px;height:720px" >'
	});
}
/*
layer.open({
  type: 1,
  title: false,
  closeBtn: 0,
  area: '516px',
  skin: 'layui-layer-nobg', //没有背景色
  shadeClose: true,
  content: $('#tong')
});
*/







//删除多文件上传
function remove_li(obj){
	 $(obj).parent().remove();
}