
$(function() {     

	$("#registerform").Validform({
		tiptype:2,
		datatype:{//传入自定义datatype类型【方式二】;
			"idcard":function(gets,obj,curform,datatype){
				//该方法由佚名网友提供;
			
				var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子;
				var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值，10代表X;
			
				if (gets.length == 15) {   
					return isValidityBrithBy15IdCard(gets);   
				}else if (gets.length == 18){   
					var a_idCard = gets.split("");// 得到身份证数组   
					if (isValidityBrithBy18IdCard(gets)&&isTrueValidateCodeBy18IdCard(a_idCard)) {   
						return true;   
					}   
					return false;
				}
				return false;
				
				function isTrueValidateCodeBy18IdCard(a_idCard) {   
					var sum = 0; // 声明加权求和变量   
					if (a_idCard[17].toLowerCase() == 'x') {   
						a_idCard[17] = 10;// 将最后位为x的验证码替换为10方便后续操作   
					}   
					for ( var i = 0; i < 17; i++) {   
						sum += Wi[i] * a_idCard[i];// 加权求和   
					}   
					valCodePosition = sum % 11;// 得到验证码所位置   
					if (a_idCard[17] == ValideCode[valCodePosition]) {   
						return true;   
					}
					return false;   
				}
				
				function isValidityBrithBy18IdCard(idCard18){   
					var year = idCard18.substring(6,10);   
					var month = idCard18.substring(10,12);   
					var day = idCard18.substring(12,14);   
					var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
					// 这里用getFullYear()获取年份，避免千年虫问题   
					if(temp_date.getFullYear()!=parseFloat(year) || temp_date.getMonth()!=parseFloat(month)-1 || temp_date.getDate()!=parseFloat(day)){   
						return false;   
					}
					return true;   
				}
				
				function isValidityBrithBy15IdCard(idCard15){   
					var year =  idCard15.substring(6,8);   
					var month = idCard15.substring(8,10);   
					var day = idCard15.substring(10,12);
					var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
					// 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法   
					if(temp_date.getYear()!=parseFloat(year) || temp_date.getMonth()!=parseFloat(month)-1 || temp_date.getDate()!=parseFloat(day)){   
						return false;   
					}
					return true;
				}
				
			}
			
		}
	});
})
//表单ajax提交

function YunForm(obj,url,text,Title,Frame){
 $(obj).Validform({
	  ajaxPost:true,
	  postonce: true,
	  tiptype: function (msg, o, cssctl) {
		 $("#save").html("<i class=\"fa fa-spinner\"></i> "+text);
		 $("#save").attr("disabled", true); 
		 $('.alert-danger').hide();
		 
		 if (o.type == 3) {
			//toastr.error(msg);
		  }
		},
		callback:function(data){
			if(data.status=='thispage'){
				layer.msg(data.info);
				window.setTimeout(reloadpage,2000); 
			}
			//采集专用
			if(data.status=='caiji'){

			   if(data.info=='nologin'){
				  Frmeboxbnt("阿里妈妈 (选择复制窗体内json数据)","800","400",data.url,"下一步");
			   }

			}
		   if(data.status=='y'){
			    if(url!=''){ 
					 //判断是不是pop浮动窗口
					 if(data.windows=='pop'){
						 window.parent.WindowsPop(url);
					 }else if(data.windows=='itemspop'){
						   parent.layer.msg(data.info);
						 window.setTimeout(timeout,2000); 
					 }else{
						 
						 window.location.href=url;
					 }
				}
				
				if(Frame=='Frame'){
				  parent.layer.msg(data.info);
				  if(data.refurbish=='y'){
					  window.parent.refurbish(); 
				  }
				  var index = F.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                  parent.layer.close(index);
				}
			   
		   }else if(data.status=='n'){
			   
			$('.alert-danger').show();
		    $('.alert-danger_txt').html(data.info);
			window.setTimeout(CloseError,3000); 
		   }
		
		   
		   $("#save").removeAttr("disabled");
		   $("#save").html(Title);
		}
		
		 
	}); 
}


function timeout(){
 var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
 parent.layer.close(index); //再执行关闭   
}						

function CloseError(){
 $('.alert-danger').hide();
}

//同意
function agreealert(Info,Title,url,btn){
	if(btn){
	  btnname=btn;	
	}else{
	  btnname="确认同意";	
	}
    bootbox.dialog({
        message: Title,
        title: Info,
        buttons: {
           
            danger: {
                label: btnname,
                className: "red",
                callback: function() {
                  ajaxget(url);
                }
            },
			 success: {
                label: "取消操作",
                className: "green",
                callback: function() {
                   // alert("great success");
                }
            }
        }
    });
}
//拒绝
function refusedalert(Info,Title,url,btn){
	if(btn){
	  btnname=btn;	
	}else{
	  btnname="确认拒绝";	
	}
    bootbox.dialog({
        message: Title,
        title: Info,
        buttons: {
           
            danger: {
                label: btnname,
                className: "red",
                callback: function() {
                  ajaxget(url);
                }
            },
			 success: {
                label: "取消操作",
                className: "green",
                callback: function() {
                   // alert("great success");
                }
            }
        }
    });
}
//end #demo_7
///删除
function showalert(Info,Title,url,btn){
	if(btn){
	  btnname=btn;	
	}else{
	  btnname="确认删除";	
	}
    bootbox.dialog({
        message: Title,
        title: Info,
        buttons: {
           
            danger: {
                label: btnname,
                className: "red",
                callback: function() {
                  ajaxget(url);
                }
            },
			 success: {
                label: "取消操作",
                className: "green",
                callback: function() {
                   // alert("great success");
                }
            }
        }
    });
}


//ajax get 方式
function ajaxget(url){
 layer.msg('正在执行您的请求', {icon: 16});
$(".ajaxbt").attr("disabled", true); 
 $.ajax({
         url: url,
         type: 'GET',
         dataType: 'json',
         success: function(data){
			  if(data.status=='n'){
				  layer.msg(data.info, function(){});;
				  $(".ajaxbt").removeAttr("disabled");
				  return false;
			  }else if(data.status=='y'){
				   layer.msg(data.info);
				   window.setTimeout("reloadpage()",3000);
				   $(".ajaxbt").removeAttr("disabled");
			  }else if(data.status=='indexpage'){
				   layer.msg(data.info);
				   $(".ajaxbt").removeAttr("disabled");
			  }
			 
		 }
   });	
	
}

function reloadpage(){
	 location.reload(); 
}
function locpage(){
 window.location.href='index.php?r=system/Finance/orderlist';	
}

 function OpenApp(title,url){
	 layer.open({
	  type: 2,
	  title: title,
	  shadeClose: false,
	  shade: 0.8,
	  area: ['80%', '80%'],
	  content: url, //iframe的url
	}); 
	 
 }
function  FrameBox(obj,w,h,url){
   layer.open({
            type: 2,
            title:obj,
			 shift: 0,
            shadeClose: false,
            shade: false,
            maxmin: false, //开启最大化最小化按钮
            area: [w+'px', h+'px'],
			shade: [0.8, '#393D49'],
			scrollbar: true,
            content: url
			
        });	

}



  