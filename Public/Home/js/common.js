function BAIDU_CLB_fillSlot(obj) {; }

var cookiedomain = ".pedaily.cn"; //'.pedaily.cn';
function openwindow(url, name, iWidth, iHeight) {
    var url;
    var name;
    var iWidth;
    var iHeight;
    var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
    var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
    window.open(url, name, "height=" + iHeight + ",innerHeight=" + iHeight + ",width=" + iWidth + ",innerWidth=" + iWidth + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no,menubar=no,scrollbars=auto,resizeable=no,status=no");
}

//合作网站登录
function sinalogin(c) {
    var url = "/passport/app/sinaapp.php";
    if (c) url += "?do=" + c;
    var win = openwindow(url, "loginwindow", 650, 450);
    return false;
}

function qqlogin(c) {
    var url = "/passport/app/qqapp.php";
    if (c) url += "?c=1";
    var win = openwindow(url, "loginwindow", 800, 660);
    return false;
}

function pengyoulogin(c) {
    var url = "/passport/app/pengyouapp.php";
    if (c) url += "?c=1";
    var win = openwindow(url, "loginwindow", 800, 660);
    return false;
}

function renrenlogin(c) {
    var url = "/passport/app/renrenapp.php";
    if (c) url += "?c=1";
    var win = openwindow(url, "loginwindow", 650, 450);
    return false;
}

function weixinlogin(c) {
    var url = "/passport/app/weixinapp.php";
    if (c) url += "?c=1";
    var win = openwindow(url, "loginwindow", 650, 450);
    return false;
}

function suggest() { win.show({ url: "/head/apply/suggest.html", btntype: "none" }); }

var ImportJs = function (url, before, cb, charset) {
    var s = document.createElement("script");
    s.src = url;
    if (charset) {
        s.charset = charset;
    }
    s.onload = function () {
        this.onload = this.onerror = null;
        this.parentNode.removeChild(this);
        if (cb) {
            cb(true);
        }
    };
    s.onerror = function () {
        this.onload = this.onerror = null;
        this.parentNode.removeChild(this);
        if (cb) {
            cb(false);
        }
    };
    if (before) {
        before();
    }
    $("head").append(s);
};

var handleMobiToggler = function () {
    $(".mobi-toggler").on("click", function (event) {
        event.preventDefault(); //the default action of the event will not be triggered

        $(".header").toggleClass("menuOpened");
        $(".header").find(".header-navigation").toggle(300);
    });
};

function formValidate(formid) {
    var form1 = $("#" + formid);
    var error2 = $(".alert-danger", form1);
    var success2 = $(".alert-success", form1);
    var rulesAll = "";
    var ruleJsons = "{";
    var errorJsons = "{  ";
    var flag = false;
    //console.log(form1.length)
    $("#" + formid + " input,select,textarea").each(function () {
        var obj = $(this);
        if (obj.is(":hidden")) return;
        //if (!obj.is(':hidden')) {
        //console.log(obj.attr('name')+':'+ obj.is(':hidden'));
        var rules = obj.attr("rules");
        var name = obj.attr("name");
        var errormsg = obj.attr("errormsg");
        var ruleJson, errorJson;
        if (rules != undefined && $.trim(rules) != "") {
            flag = true;
            if (rules == "*") {
                ruleJson = name + ":{required:true}";
                if (errormsg == "") {
                    errorJson = name + ":{required:\"必填字段，请按要求填写...\"}";
                } else {
                    errorJson = name + ":{" + errormsg + "}";
                }
            } else {
                ruleJson = name + ":{required:true," + rules + "}";
                errorJson = name + ":{" + errormsg + "}";
            }
            ruleJsons += ruleJson + ",";
            errorJsons += errorJson + ",";
        }
        // }
    });
    if (flag) {
        ruleJsons = ruleJsons.substr(0, ruleJsons.length - 1) + "}\n";
        errorJsons = errorJsons.substr(0, errorJsons.length - 1) + "}\n";
        errorJsons = errorJsons.replace(/&/gm, "\"");
    }
    if ($.trim(errorJsons).length <= 2) {
        errorJsons = "";
        ruleJsons = "";
    }

    form1.validate({
        errorElement: "span", //default input error message container
        errorClass: "help-block help-block-error", // default input error message class
        focusInvalid: true, // do not focus the last invalid input
        ignore: "",
        debug: true,
        rules: ruleJsons == "" ? {} : eval("(" + ruleJsons + ")"),
        messages: errorJsons == "" ? {} : eval("(" + errorJsons + ")"),
        invalidHandler: function (event, validator) { //display error alert on form submit              
            return false;
        },

        errorPlacement: function (error, element) { // render error placement for each input type
            var id = $(element).attr("id"), errorText = error.text();
            var icon = $(element).parent(".input-icon").children("i");
            icon.removeClass("fa-check").addClass("fa-warning");
            icon.attr("data-original-title", error.text()).tooltip({ 'container': "body" });
            var errorContainer = $("#" + id + "_error");
            if (errorContainer.length > 0) {
                errorContainer.show();
                errorContainer.html(errorText).show();
            } else {
                $(element).closest(".form-group").append(String.format("<span id=\"{0}_error\" class=\"help-block-error\">{1}</span>", id, errorText));
            }
            //注册验证手机添加
            if ($(element).data("validateadd") == "validateMobile") {
                $("#btn-phonecode").attr("disabled", true);
            }
        },
        highlight: function (element) { // hightlight error inputs
            $(element)
                .closest(".form-group").removeClass("has-success").addClass("has-error"); // set error class to the control group   
        },
        unhighlight: function (element) { },
        success: function (label, element) {
            var icon = $(element).parent(".input-icon").children("i");
            var id = $(element).attr("id");
            $(element).closest(".form-group").removeClass("has-error").addClass("has-success"); // set success class to the control group
            icon.removeClass("fa-warning").addClass("fa-check");
            var errorContainer = $("#" + id + "_error");
            if (errorContainer.length > 0) {
                errorContainer.html("").hide();
            }
            //注册验证手机添加
            if ($(element).data("validateadd") == "validateMobile") {
                $("#btn-phonecode").attr("disabled", false);
            }
        },
        submitHandler: function (form) {
            var datas = form1.serialize();
            var submittype = form1.data("submittype");

            //投资人认证
            if (submittype == "certify") {

                var Rinvestorty = $.trim($("#Rinvestorty input[type='radio']:checked").val());

                var comemail = $.trim($("#comemail").val());
                var vcid = $.trim($("#vcid").val());
                var vcname = $.trim($("#vcname").val());

                if (Rinvestorty == "100") {
                    comemail = "";
                    vcid = 0;
                    vcname = "";
                }
                var duty = $.trim($("#duty").val());
                var invplan = $.trim($("#invplan").val());
                var projectids = $.trim($("#projectids").val());
                var projects = $.trim($("#projects").val());

                var img = $(".form-group .fileinput-preview").find("img"), logourl = "";
                if (img == "" || img == undefined || img.attr("src") == "" || img.attr("src") == undefined) {
                    img = $(".fileinput-preview fileinput-exists thumbnail").find("img");
                }
                if (img) {
                    logourl = img.attr("src");
                }
                datas = { namecard: logourl, Rinvestorty: Rinvestorty, comemail: comemail, vcid: vcid, vcname: vcname, duty: duty, invplan: invplan, projectids: projectids, projects: projects };
            }
            if (submittype == "userinfo") {
                var edu = "";
                $("input[name=\"school\"]").each(function () {
                    var num = $(this).data("num");
                    if (num > 0) {
                        var school = $(this).val(), education = $("#education" + num).val(), dataid = $("#eduid" + num), id = "";
                        if ($.trim(school).length <= 0 && $.trim(education).length <= 0) {
                            return;
                        }
                        if (dataid != undefined || dataid != "") {
                            if (dataid.val() != undefined) id = dataid.val();
                        }
                        edu += "$" + school + "|" + education + "|" + id;
                    }
                });
                if (edu != "" && edu.length > 0) {
                    edu = edu.substr(1);
                }
                var work = "";
                $("input[name=\"company\"]").each(function () {
                    var num = $(this).data("num");
                    if (num > 0) {
                        company = $(this).val(), job = $("#job" + num).val(), dataid = $("#careers" + num), id = "";
                        if ($.trim(company).length <= 0 && $.trim(job).length <= 0) {
                            return;
                        }
                        if (dataid != undefined || dataid != "") {
                            if (dataid.val() != undefined) id = dataid.val();
                        }
                        work += "$" + company + "|" + job + "|" + id;
                    }
                });
                if (work != "" && work.length > 0) {
                    work = work.substr(1);
                }
                var img = $(".form-group .fileinput-preview").find("img"), logourl = "";
                if (img == "" || img == undefined || img.attr("src") == "" || img.attr("src") == undefined) {
                    img = $(".fileinput .fileinput-new.thumbnail").find("img");
                }
                if (img) {
                    logourl = img.attr("src");
                }
                datas = { logo: logourl, name: $("#name").val(), nickname: $("#nickname").val(), address: $("#address").val(), addressID: $("#addressID").val(), industrynames: $("#industrynames").val(), industry: $("#industry").val(), content: $("#content").val(), edu: edu, work: work, wechat: $("#wechat").val(), qq: $("#qq").val() };
            }

            var btnmsg = $.trim(form1.data("btnmsg")), changbtnvalue = false;
            if (btnmsg != undefined && btnmsg != "") {
                btnmsg = btnmsg.split("|");
                if (btnmsg.length == 2) {
                    btn.html(btnmsg[1]).attr("disabled", "disabled");
                    changbtnvalue = true;
                }
            }
            //return;
            $.ajax({
                type: "post",
                url: form1.attr("action"),
                data: datas,
                success: function (data) {
                    if (changbtnvalue) {
                        btn.html(btnmsg[0]).removeAttr("disabled");
                    }
                    if (data) {
                        var l_result = "";
                        var errorid = $.trim(form1.data("error_id"));
                        if (errorid == "" || errorid == undefined) {
                            errorid = "form_error";
                        }
                        l_result = $("#" + errorid);
                        if (submittype == "login" || submittype == "loginpage") {
                            _loginform.showResult(data, submittype, l_result);
                        } else if (submittype == "mshow") {
                            _Mshow.showResult(data);
                        } else if (submittype == "resetpwd") {
                            _ResetPwd.showResult(data);
                        } else if (submittype == "certify") {
                            _Form.showResult(data, l_result, "认证成功");
                        } else if (submittype == "sigup") {
                            _Form.showResult(data, l_result, "注册成功");
                            if (data.code == 1) {
                                _Form.setCookie(data);
                                window.location.href = "/reg-success.shtml";
                            }
                            gDialog.fClose();
                        } else {
                            if (data.code == 1) {
                                _User.init();
                                gDialog.fClose();
                                if (l_result) l_result.html("成功");
                            } else {
                                l_result.html(data.msg);
                            }
                        }
                    } else {
                        //console.log('1');
                    }
                },
                error: function () {
                    if (changbtnvalue) {
                        btn.html(btnmsg[0]).removeAttr("disabled");
                    }
                    //console.log('error');
                }
                //dataType: 'json'
            });
            return false;
        }
    }); //form1.validate
}

//function shareWbImg(id) {
//    if (id < 0) {
//        var url = evt.data.url;
//        var re = /\d{8}(\d+)\.shtml/;
//        id = RegExp.$1;
//    }
//    var onerr = function() { win.warn("出现错误，请稍后重试！"); };
//    $.ajax({
//        url: "/top/handler.ashx?action=getwbimg&id=" + id + "&t=" + t,
//        type: "GET",
//        dataType: "json",
//        beforeSend: win.wait,
//        error: onerr,
//        success: function(json) {
//            if (json.success) {
//                win.show({
//                    title: "分享长微博",
//                    content: "<div style=\"height:240px;overflow:auto;text-align:center;\"><a target=\"_blank\" href=\"" + json.src + "\"><img src=\"" + json.src + "\" style=\"margin:5px auto;\"/></a></div>",
//                    btntype: "diy",
//                    width: 600,
//                    btns: [],
//                    ready: function() {
//                        var a = $("<a href=\"javascript:void(0);\" class=\"sharesina\"></a>"),
//                            b = $("<a href=\"javascript:void(0);\" class=\"sharetengxun m_l_10\"></a>"),
//                            addlog = function(type) {
//                                $.getJSON("/top/handler.ashx?action=addsharelog&resid=" + res_id + "&type=" + type + "&_=" + new Date().getTime());
//                            };
//                        a.click(function() {
//                            toSina(json.src, "【" + $("h1").text() + "】" + $("meta[name=description]").attr("content"));
//                            addlog(1);
//                        });
//                        b.click(function() {
//                            toQweibo(json.src, "【" + $("h1").text() + "】" + $("meta[name=description]").attr("content"));
//                            addlog(2);
//                        });
//                        $("#btnlist").append(a).append(b);
//                    }
//                });
//            } else {
//                onerr();
//            }
//        }
//    });
//}
function shareWbImg(id) {
    if (id < 1) {
        var url = location.href;
        var re = /\d{8}(\d+)\.shtml/;
        var s = re.exec(url);
        if (s.length > 1) {
            id = s[1];
        }
        if (id < 1) {
            return;
        }
    }
    var onerr = function () { win.warn("出现错误，请稍后重试！"); };
    $.ajax({
        url: "/top/handler.ashx?action=getwbimg&id=" + id,
        type: "GET",
        dataType: "json",
        beforeSend: win.wait,
        error: onerr,
        success: function (json) {
            if (json.success) {
                win.show({
                    title: "分享长微博",
                    content: '<div style="height:240px;overflow:auto;text-align:center;"><a target="_blank" href="' +
                        json.src +
                        '"><img src="' +
                        json.src +
                        '" style="margin:5px auto;"/></a></div>',
                    btntype: "diy",
                    width: 600,
                    height: 600,
                    btns: [],
                    ready: function () {
                        var a = $('<a href="javascript:void(0);" class="btn sharesina">分享到新浪微博</a>'),
                            b = $('<a href="javascript:void(0);" class="btn sharetengxun">分享到腾讯微博</a>'),
                            addlog = function (type) {
                                $.getJSON("/top/handler.ashx?action=getwbimg&resid=" +
                                    id +
                                    "&type=" +
                                    type +
                                    "&_=" +
                                    new Date().getTime());
                            };
                        a.click(function () {
                            toSina(json.src, "【" + $("h1").text() + "】" + $("meta[name=description]").attr("content"));
                            addlog(1);
                        });
                        b.click(function () {
                            toQweibo(json
                                .src,
                                "【" + $("h1").text() + "】" + $("meta[name=description]").attr("content"));
                            addlog(2);
                        });
                        $("#btnlist").append(a).append(b);
                    }
                });
            } else {
                onerr();
            }
        }
    });
}
function toSina(pic, txt) { Share(pic, txt, "sina"); }

/*----*/
function toQweibo(pic, txt) { Share(pic, txt, "qwb"); }

/*----*/
function Share(pic, txt, type) {
    var s = screen,
        d = document,
        e = encodeURIComponent,
        r = "新芽",
        l = "http://www.newseed.pedaily.cn/",
        c = "utf-8",
        u = d.location;
    if (type == "sina") {
        var f = "http://v.t.sina.com.cn/share/share.php?appkey=372732463&",
            p = [
                "url=", e(u), "&title=", e(txt), "&source=", e(r), "&sourceUrl=", e(l), "&content=", c, "&pic=", e(pic)
            ].join("");

        function a() {
            if (!window.open([f, p].join(""),
                "mb",
                [
                    "toolbar=0,status=0,resizable=1,width=440,height=430,left=", (s.width - 440) / 2, ",top=",
                    (s.height - 430) / 2
            ].join(""))) u.href = [f, p].join("");
        };

        if (/Firefox/.test(navigator.userAgent)) setTimeout(a, 0);
        else a();
    } else if (type == "qwb") {
        var _u = "http://v.t.qq.com/share/share.php?title=" +
            e(txt) +
            "&url=" +
            e(u) +
            "&appkey=" +
            encodeURI("801005846") +
            "&site=" +
            l +
            "&pic=" +
            e(pic);
        window.open(_u,
            "",
            [
                "toolbar=0,status=0,resizable=1,width=612,height=446,left=", (s.width - 612) / 2, ",top=",
                (s.height - 446) / 2
            ].join(""));
    }
}
var _Alert = {
    tempDefault: "<div class=\"modal-body\"><div>{0}</div><div class=\"form-group\"><div class=\"row\"><div class=\"col-md-12\">{1}</div></div></div></div>",
    Show: function (note, jsonparam, id, title, width) {
        var btns = jsonparam.btns;
        width = width ? width : "400px";
        var array = new Array();
        var btnstr = "";
        if (btns) {
            var i;
            var o;
            var func;
            for (i = 0; i < btns.length; i++) {
                o = btns[i];
                var clas = o.clas ? o.clas : "btn blue btn-biglarge";
                var btnid = parseInt(10000000 * Math.random());
                var text = o.text;
                func = o.func ? o.func : _Alert.Close;
                btnstr += String.format("<button type=\"button\" class=\"{0}\" id=\"{1}\">{2}</button>", clas, btnid, text);
                if (!o.param) o.param = "";
                array.push({ id: btnid, func: func, param: o.param });
            };
            var content = String.format(this.tempDefault, note, btnstr);
            gDialog.fCreate({ title: title ? title : "提示", content: content, backdrop: "normal", css: "modal-tips", width: width, modalId: id }).show();
            for (i = 0; i < array.length; i++) {
                o = array[i];
                (function (o) {
                    var id1 = o.id;
                    var idcon = $("#" + id1); //_Common.getElementByID(id1);
                    if (idcon != null)
                        if (idcon.length > 0) {
                            idcon.bind("click", function () { o.func.call(this, o.param ? o.param : "") });
                        }

                })(o);
            }
        }
    },
    Close: function (id) {
        gDialog.fClose(id);
    }
};

function ProjectAlert() {
    _Alert.Show("<p>目前正在举办<第十届中国最具投资价值企业50强评选活动>，您可以上传评选项目并将项目同步到新芽！</p><p><a href=\"http://events.pedaily.cn/industry-summit/309/a.shtml\" target=\"_blank\" class=\"font-red margin-top-10\"><第十届中国最具投资价值企业50强评选活动>专题</a></p>", {
        btns: [{ text: "报名并上传项目", func: function () { window.location.href = "/v50/project1?type=2"; } }, {
            text: "只上传项目",
            func: function () {
                gDialog.fClose("win-down");
                window.location.href = "/uc/project_create";
            }
        }
        ]
    }, "win-down");
}

function UploadImage(posturl, fileid, imageid, saveid, imagetype) {
    var formdata = new FormData();
    formdata.append("imagetype", imagetype);
    var fileObj = document.getElementById(fileid).files;
    var $file = $("#" + fileid);
    for (var i = 0; i < fileObj.length; i++)
        formdata.append("file" + i, fileObj[i]);
    $.ajax({
        type: "Post",
        url: posturl,
        data: formdata,
        contentType: false,
        processData: false
    }).then(function (data) {
        if (data.code === 1) {
            $("#" + imageid).attr("src", data.dicimg.url).removeClass("hide");
            $("#" + saveid).val(data.dicimg.url);
        }
    }, function () {
    });
}


function setScollHeight() {
    var bodyWidth = $(document.body).width();
    var scollHeight = 100;
    if ($(window).scrollTop() >= scollHeight)//距离顶部多少高度显示按钮
    {
        if (bodyWidth > 639) {
            $('#backTop').slideDown(200);
        }

    } else {
        $('#backTop').slideUp(200);
    }
}
jQuery(document).ready(function () {
    $('#box-scoll').html('<a href="http://newseed.pedaily.cn/uc/write" class="submission" id=""><i class="icon-submission"></i>投稿</a><a href="mailto:yongchen@zero2ipo.com.cn" id=""><i class="icon-feedback"></i>提建议</a><a href="javascript:void(0)" id="backTop"><i class="icon-backtop" ></i>回顶部</a>');
    setScollHeight();
    $('#backTop').click(function () { $('body,html').animate({ scrollTop: 0 }, 300) });
})

$(window).scroll(function () {
    setScollHeight();
})