var cookiename = "pedaily.cn";
var bodyWidth = $(document.body).width();
/*do-cookie-start*/
var Cookies = {
    Decode: function(str) {
        var strArr = "ddd";
        var strRtn = "";
        if (str != null && str.indexOf("a") > 1) {
            strArr = str.split("a");
            for (var i = strArr.length - 1; i >= 0; i--) {
                strRtn += String.fromCharCode(eval(strArr[i]));
            }
            return strRtn;
        }
        return null;
    },
    Code: function(str) {
        var strRtn = "";
        for (var i = str.length - 1; i >= 0; i--) {
            strRtn += str.charCodeAt(i);
            if (i) strRtn += "a";
        }
        return strRtn;
    },
    Get: function(name, key) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg)) {
            if (!key)
                return unescape(decodeURI(arr[2]));
            var values = arr[2].split("&");
            for (var pair in values) {
                if (values[pair] != "undefined") {
                    var tmparr = values[pair].toString().split("=");
                    if (tmparr[0] == key) {
                        return unescape(decodeURI(tmparr[1]));
                    }
                }
            }
            return null;
        } else {
            return null;
        }
    },
    GetDetails: function(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg)) {
            return unescape(decodeURI(arr[2]));
        } else {
            return null;
        }
    },
    GetInt: function(name, key) {
        var value = Cookies.Get(name, key);
        if (value) {
            return parseInt(value, 10);
        }
        return 0;
    },
    GetF: function(fname, cname) {
        var arr, reg = new RegExp("(^| )" + fname + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg)) {
            var value = unescape(decodeURI(arr[2]));
            var value1 = value.substring(value.indexOf(cname + "=") + cname.length + 1);
            if (value1.indexOf("&") > -1) {
                return value1.substring(0, value1.indexOf("&"));
            }
            return value1.substring(0);
        } else {
            return null;
        }
    },
    Set: function(name, value, expires, path, domain) {
        //var exp = new Date();
        //exp.setTime(exp.getTime() + expires * 24 * 60 * 60 * 1000);
        document.cookie = name +
            "=" +
            encodeURI(value) +
            ((expires) ? "; expires=" + expires : "") +
            ((path) ? "; path=" + path : "") +
            ((domain) ? "; domain=" + domain : "");
    },
    Del: function(cookiesname, domain) {
        this.Set(cookiesname, "", "Fri, 27 Jun 2014 10:01:01 GMT", "/", domain);
    }
};

/*do-cookie-end*/
function extend(des, src, override) {
    if (src instanceof Array) {
        for (var i = 0, len = src.length; i < len; i++)
            extend(des, src[i], override);
    }
    for (var i in src) {
        if (override || !(i in des)) {
            des[i] = src[i];
        }
    }
    return des;
}

/*焦点图切换-start*/
var scollFocus = function($sobj) {
    var showPics = function(index, $sobj, dragX) { //普通切换
        var o_width = $sobj.width();
        var o_height = $sobj.find("ul").height();
        var nowLeft = -index * o_width; //根据index值计算ul元素的left值
        $sobj.find("ul").stop(true, false).animate({ "left": nowLeft }, 300); //通过animate()调整ul元素滚动到计算出的position
        //$("#focus .trans span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
        $sobj.find(".trans span")
            .stop(true, false)
            .animate({ "opacity": "0.4" }, 300)
            .eq(index)
            .stop(true, false)
            .animate({ "opacity": "1" }, 300); //为当前的按钮切换到选中的效果
    };
    var counter = function($sobj) {
        var len = $sobj.data("counts");
        if (len == "" || len == null || typeof (len) == "null") {
            len = $sobj.find("li").length;
        }
        return len;
    };

    return {
        //显示图片函数，根据接收的index值显示相应的内容
        init: function($sobj) {
            if ($sobj.length == 0) return;
            var o_width = $sobj.width();
            var o_height = $sobj.find("ul").height();
            var len = counter($sobj);
            var dragstartX = 1;
            var dragX = 1;
            if (len > 1) {
                if (!$sobj.data("counts")) {
                    $sobj.find("li").css("width", o_width);
                }

                var index = 0, picTimer, i;
                var pre_height = (o_height / 2 - 21);
                if ($sobj.children(".transBg").length == 0) $sobj.append("<div class=\"btnBg\"></div>");
                if ($sobj.children(".pre").length == 0) $sobj.append("<div class=\"preNext pre\"></div>");
                if ($sobj.children(".next").length == 0) $sobj.append("<div class=\"preNext next\"></div>");
                if ($sobj.children(".trans").length == 0) {
                    var trans = "<div class=\"trans\" style=\"margin-left:-" + ((len * 15) / 2) + "px\">";
                    for (i = 0; i < len; i++) {
                        trans += "<span></span>";
                    }
                    trans += "</div>";
                    $sobj.append(trans);
                }
                $sobj.find(".transBg").css("opacity", 0.5);
                //为小按钮添加鼠标滑入事件，以显示相应的内容
                var transs = $sobj.find(".trans span");
                transs.css("opacity", 0.4)
                    .mouseenter(function() {
                        index = transs.index(this);
                        showPics(index, $sobj);
                    })
                    .eq(0)
                    .trigger("mouseenter");
                //上一页、下一页按钮透明度处理
                $sobj.find(".preNext")
                    .css("opacity", 0.2)
                    .css("top", pre_height)
                    .hover(function() {
                            $(this).stop(true, false).animate({ "opacity": "0.5" }, 300);
                        },
                        function() {
                            $(this).stop(true, false).animate({ "opacity": "0.2" }, 300);
                        });
                //上一页按钮
                $sobj.find(".pre")
                    .click(function() {
                        index -= 1;
                        if (index == -1) {
                            index = len - 1;
                        }
                        showPics(index, $sobj);
                    });
                //下一页按钮
                $sobj.find(".next")
                    .click(function() {
                        index += 1;
                        if (index == len) {
                            index = 0;
                        }
                        showPics(index, $sobj);
                    });


                $sobj.bind("dragstart",
                    function(e) {
                        dragstartX = e.pageX || e.originalEvent.touches[0].pageX;
                    });

                $sobj.bind("drag",
                    function(e) {
                        dragX = (e.pageX || e.originalEvent.touches[0].pageX) - dragstartX;
                        var nowLeft = -index * o_width + dragX;
                        //console.log(nowLeft);
                        $sobj.find("ul").animate({ "left": nowLeft }, 0); //通过animate()调整ul元素滚动到计算出的position

                    });
                $sobj.bind("dragend",
                    function(e) {
                        var dragXX = dragX > 0 ? dragX : (-dragX);
                        //console.log(dragXX);

                        if (dragXX > (o_width / 2) - 50) {
                            if (dragX < 0) {
                                index += 1;
                                if (index == len) {
                                    index = 0;
                                }

                                showPics(index, $sobj, dragX);
                            } else {
                                index -= 1;
                                if (index == -1) {
                                    index = len - 1;
                                }
                                showPics(index, $sobj, dragX);
                            }
                        }

                    });
                //本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
                $sobj.find("ul").css("width", $sobj.width() * (len));
                //鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
                $sobj.hover(function() {
                            clearInterval(picTimer);
                        },
                        function() {
                            picTimer = setInterval(function() {
                                    showPics(index, $sobj);
                                    index++;
                                    if (index == len) {
                                        index = 0;
                                    }
                                },
                                $sobj.attr("interval") || 4000); //此4000代表自动播放的间隔，单位：毫秒
                        })
                    .trigger("mouseleave");

            }
        }
    };
}();
/*焦点图切换-end*/

var jsondata = "";
/*用户操作模板*/
var _User = (function() {
    var u = {};
    var __rootKey = "pedaily.cn";
    var __domain = "http://newseed.pedaily.cn";
    var _get = function(s) { return Cookies.Get(__rootKey, s); };
    var _getdetails = function(name) { return Cookies.GetDetails(name); };
    var isLogined = false;
    getUserInfo = function() {
        return {
            userid: _get("uid"),
            username: _get("username") || "",
            photo: _get("photo") || "http://pic.pedaily.cn/blog/1.gif",
            nickname: _get("hiname") || "新芽网友",
            roletype: _get("roletype"),
            email: _get("email"),
            ismobilevalidated: _get("ismobilevalidated"),
            isemailvalidated: _get("isemailvalidated"),
            isverified: _get("isverified"),
            isok: _get("isok")
        };
    };

    /*初始化*/
    u.init = function() {
        u = extend(u, getUserInfo(), true);
        u.isLogined = u.userid > 0;
        if (u.isLogined) {
            $("#login_v50")
                .html("<li class=\"dropdown dropdown-user\"><a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" data-hover=\"dropdown\" data-close-others=\"true\"><img alt=\"\" class=\"img-circle\" src=\"" + u.photo + "\"><span class=\"username username-hide-on-mobile\">" + u.nickname + "</span><i class=\"fa fa-angle-down\"></i></a><ul class=\"dropdown-menu dropdown-menu-default pull-right\"><li><a href=\"/v2017/list\"><i class=\"fa fa-book\"></i>参赛企业管理</a></li><li><a href=\"javascript:void(0)\" onclick=\"_User.logout();\"><i class=\"fa fa-sign-out\"></i> 退出 </a></li></ul></li>");
            /*登录后的状态*/
            $("#login").html(u.loginedhtml());
            /*
            if (u.email != "" && $("#login_v50").length < 1) {
                if (u.isemailvalidated == "False") {
                    if ($("#top_email_validate").length > 0) {
                        $("#top_email_validate").show();
                    } else {
                        $(".pre-header").before("<div id=\"top_email_validate\" class=\"top-head\"><p>欢迎来到新芽，您还没有验证邮箱，请您验证邮箱：" + u.email + " <a data-email=\"" + u.email + "\" id=\"vemail\" href=\"javascript:void(0)\" onclick=\"_EmailValidate.send(this,50);\">点击发送验证邮件</a><a onclick=\"_EmailValidate.Delete()\" href=\"javascript:void(0)\" style=\"color:#333\"><i class=\"fa fa-times\"></i></a></p></div>");
                    }
                } else {
                    _EmailValidate.Delete();
                }
            }
            */
            if (u.ismobilevalidated == "False") {
                var pvalidatetoday = _getdetails("pvalidatetoday");
                if (!pvalidatetoday) {
                    var date = new Date();
                    date.setTime(date.getTime() + (60 * 1000 * 60 * 24));
                    Cookies.Set("pvalidatetoday", "1", date, "/", cookiedomain);
                    _PhoneValidate.init(2);
                }
            } else {
                var top_phone_validate = $("#top_phone_validate");
                if (top_phone_validate.length > 0) {
                    top_phone_validate.remove();
                }
            }
        } else {
            /*未登录后状态*/

        }
    };
    u.logout = function() {
        $.ajax({
            type: "post",
            url: "/logout",
            data: {},
            dataType: "json",
            error: function() {},
            success: function(result) {
                if (result) {
                    if (result.code == 1) {
                        Cookies.Del(cookiename, result.domain);
                        ////                        var pedaily= Cookies.Get(cookiename);
                        //                        var cookies = result.SetCookie;
                        //                        var pedaily = getparam(cookiename, cookies), expires = getparam('expires', cookies), path = getparam('path', cookies), domain = getparam('domain', cookies);
                        //                        Cookies.Set(cookiename, pedaily, expires, path, domain);
                        window.location.reload();
                    }
                } else {
                    //console.log(result.msg);
                }
            }
        });
    };
    u.loginedhtml = function() {
        var homeurl = "/uc/startup";
        if (u.roletype == 1) {
            homeurl = "/uc/investor";
        } else {
            homeurl = "/uc/startup";
        }
        if ($("a.home").length > 0) $("a.home").attr("href", homeurl);
        var uinfo = "<li><a href=\"/UC/info\" target=\"_blank\"><i class=\"fa fa-user\"></i> 设置 </a></li>",
            news =
                "<li id=\"new_message_count\"><a href=\"/uc/message\" target=\"_blank\"><i class=\"fa fa-envelope\"></i> 消息 </li>",
            home = "<li><a href=\"" + homeurl + "\" target=\"_blank\"><i class=\"fa fa-home\"></i> 我的主页 </li>",
            uproject = "<li><a href=\"/uc/project\" target=\"_blank\"><i class=\"fa fa-rocket\"></i> 项目</a></li>",
            upspace = "<li><a href=\"/uc/newseedspace\" target=\"_blank\"><i class=\"fa fa-cloud\"></i> 空间</a></li>",
            upfund = "<li><a href=\"/uc/newseedfund\" target=\"_blank\"><i class=\"fa fa-inbox\"></i> 基金</a></li>",
            upv50 = "<li><a href=\"/v2017\" target=\"_blank\"><i class=\"fa fa-trophy\"></i> V50</a></li>",
            ulogout =
                "<li><a href=\"javascript:void(0)\" onclick=\"_User.logout();\"><i class=\"fa fa-unlock\"></i> 退出 </a></li>";
        var umenu = "<ul class=\"dropdown-menu dropdown-menu-default pull-right\">" +
            home +
            uproject +
            upspace +
            upfund +
            upv50 +
            news +
            uinfo +
            ulogout +
            "</ul>";
        return  "<li class=\"dropdown dropdown-user\"><a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" data-hover=\"dropdown\" data-close-others=\"true\"><img alt=\"\" class=\"img-circle\" src=\"" + u.photo + "\"><span class=\"username username-hide-on-mobile\">" + u.nickname + "</span><i class=\"fa fa-angle-down\"></i></a>" + umenu + "</li>";
    }; /*检查是否登录*/
    u.checkLogined = function() {
        if (!u.isLogined) {
            //if (navigator.platform.indexOf('Win32') != -1) {
            if ($(window).width() > 650) {
                u.openLoginPannel();
            } else {
                window.location.href = "/login?url=" + window.location.href;
            }
            return false;
        };
        return true;
    };
    /*打开登录对话框*/
    u.openLoginPannel = function() {
        /*打开登录窗口*/
        gDialog.fCreate({
                title: "用户登录",
                url: "/head/template/login.html",
                backdrop: "normal",
                css: "login",
                modalId: "win-login"
            })
            .show();
    };
    /*打开注册框*/
    u.openRegisterPannel = function() {
        /*打开登录窗口*/

        gDialog.fCreate({ title: "新芽账户注册", url: "/head/template/register.html", backdrop: "normal", css: "login" })
            .show();
        $("#btn-phonecode").attr("disabled", true);

        $("#password")
            .change(function() {
                $("#pass").val(hex_sha1($(this).val()));
            });
        $("#remember")
            .bind("click",
                function() {
                    if ($(this).is(":checked")) {
                        $(this).val("1");
                    } else {
                        $(this).val("");
                    }
                });
        $("#mobile")
            .blur(function() {
                validateMobileVcode(1);
            });
        $("#validcode")
            .blur(function() {
                validateMobileVcode(2);
            });
        setTimeout(function() {
                formValidate("form1");
            },
            2000);
        //手机号验证
        $("#btn-phonecode").bind("click", function() { _PhoneValidate.timer(this, 50); });
        /*注册提交处理*/
        $("#btn-register-submit")
            .click(function() {
            });
    };
    return u;
})();

//1:验证手机2：验证码
function validateMobileVcode(type) {
    var mobile = $.trim($("#mobile").val()), vcode = $.trim($("#validcode").val());
    return checkMobileVcode(mobile, vcode, type);
    //checkVcode(vcode);
}

function checkMobileVcode(mobile, vcode, type) {
    $("#btn-phonecode").attr("disabled", true);
    var mflag = false, vflag = false;
    $.ajax({
        type: "post",
        async: false,
        cache: false,
        url: "/check/mobile/",
        data: { mobile: mobile },
        success: function(data) {
            //if (result) {if (result.code == 1) { flag = true; }}
            if (data.code == 1) {
                mflag = true;
                addFormSuccess($("#mobile"));
                //_Form.showResult(data, $('#form_error'), '');
            }
            if (data.code == 0) {
                if (type == 1 || type == 3) {
                    addFormError($("#mobile"), data.msg);
                    //_Form.showResult(data, $('#form_error'), data.msg);
                }
                if (data.isOccupy == "1" && type == 3) {

                }
            }

            $.ajax({
                type: "post",
                async: false,
                cache: false,
                url: "/check/vcode/",
                data: { code: vcode },
                success: function(result) {
                    //if (result) {if (result.code == 1) { flag = true; }}
                    //data = result;
                    if (result.code == 1) {
                        vflag = true;
                        addFormSuccess($("#validcode"));
                        //_Form.showResult(result, $('#form_error'), '验证成功');
                    }
                    if (result.code == 0) {
                        flag = false;
                        if (type == 2 || type == 3) {
                            addFormError($("#validcode"), result.msg);
                            //_Form.showResult(result, $('#form_error'), '输入错误');
                        }
                    }
                },
                error: function() {},
                dataType: "json"
            });
        },
        error: function() {},
        dataType: "json"
    });
    if (mflag && vflag) {
        $("#btn-phonecode").attr("disabled", false);
        return true;
    } else {
        return false;
    }
}

function checkVcode(vcode) {
    var data = { "code": 0, "msg": "验证码输入有误" };
    $.ajax({
        type: "post",
        async: false,
        cache: false,
        url: "/Login/chkcode",
        data: { code: vcode },
        success: function(result) {
            //if (result) {if (result.code == 1) { flag = true; }}
            //data = result;
            if (result.code == 1) {
                addFormSuccess($("#validcode"));
            }
            if (result.code == 0) {
                addFormError($("#validcode"), result.msg);
            }
        },
        error: function() { addFormError($("#validcode"), "验证码输入有误"); },
        dataType: "json"
    });
    return data;
}

var timer = setInterval(adds, 5000);

function adds() {
    if (_User.isLogined) {
        $.ajax({
            type: "post",
            url: "/uc/getcount",
            data: {},
            dataType: "json",
            error: function() {},
            success: function(result) {
                if (!result) return;
                if (!result.data) return;
                if (result.code === -1) _User.isLogined = false;
                if (result.code === 1) {
                    if (result.data.msgcnt > 0 || result.data.syscnt > 0) {
                        var newsMsgCon = $("#new_message_count");
                        newsMsgCon.find("span").length < 1
                            ? newsMsgCon.find("a")
                            .append(String
                                .format("<span class=\"badge badge-danger\">{0}</span>",
                                    result.data.msgcnt + result.data.syscnt))
                            : newsMsgCon.find("a span").html(result.data.msgcnt + result.data.syscnt);
                    }
                    if (result.data.msgcnt > 0) {
                        if ($("#message").length > 0) {
                            $("#message").html("(" + result.data.msgcnt + ")");
                        }
                    }
                    if (result.data.syscnt > 0) {
                        if ($("#message_sys").length > 0) {
                            $("#message_sys").html("(" + result.data.syscnt + ")");
                        }
                    }
                    if (result.data.yuecnt > 0) {
                        if ($("#yuecnt").length > 0) {
                            $("#yuecnt").html("(" + result.data.yuecnt + ")");
                        }
                    }
                }
            }
        });
    }
}

var _GetNews = {
    init: function() {
        $(window).blur(function() { _GetNews.onBlur(); });
        $(window).focus(function() { _GetNews.onFocus(); });
    },
    onBlur: function() {
        clearInterval(timer);
    },
    onFocus: function() {
        clearInterval(timer);
        timer = setInterval(adds, 5000);
    }
};
var _loginform = {
    showResult: function(data, type, form_error) {
        if (data.code == 1) {
            var cookies = data.SetCookie;
            cookies.replace("\u0026", "&");
            var pedaily = getparam(cookiename, cookies),
                expires = getparam("expires", cookies),
                path = getparam("path", cookies),
                domain = getparam("domain", cookies);
            Cookies.Set(cookiename, pedaily, expires, path, domain);
            _User.init();
            if ($(".post-comment").length > 0) {
                _Comment.addcommBtn();
            }
            if (type == "loginpage") {
                var url = getparam("url", window.location.href) || "";
                window.location.href = url.length > 0 ? url : "/";
                //location.href = '/';
            }
            gDialog.fClose("win-login");
        } else {
            form_error.html(data.msg);
        }
    }
};
var _UserInfo = {
    init: function() {
        $(".educationadd")
            .bind("click",
                function() {
                    var id = $("input[name=\"school\"]").length + 1;
                    $("#edu")
                        .append($("<input class=\"form-control placeholder-no-fix margin-bottom-15\" type=\"text\" autocomplete=\"off\" placeholder=\"学校\" data-num=\"" + id + "\" id=\"school" + id + "\" name=\"school\"/>"));
                    $("#edu")
                        .append($("<input class=\"form-control placeholder-no-fix margin-bottom-15\" type=\"text\" autocomplete=\"off\" placeholder=\"学历\" data-num=\"" + id + "\" id=\"education" + id + "\" name=\"education\"/>"));
                });
        $(".workadd")
            .bind("click",
                function() {
                    var id = $("input[name=\"company\"]").length + 1;
                    $("#work")
                        .append($("<div class=\"input-group\"><input class=\"form-control placeholder-no-fix margin-bottom-15\"  type=\"text\" autocomplete=\"off\" placeholder=\"公司\" data-num=\"" + id + "\" id=\"company" + id + "\"  name=\"company\"/>"));
                    $("#work")
                        .append($("<input class=\"form-control placeholder-no-fix margin-bottom-15\"  type=\"text\" autocomplete=\"off\" placeholder=\"职位\" data-num=\"" + id + "\" id=\"job" + id + "\"  name=\"job\"/></div>"));
                });
    }
}; //投资人认证
var _InvestorCertify = {

}; /*项目认证*/
var _ClaimProject = {
    add: function($obj) {
        if (_User.checkLogined()) {
            var $obj = $($obj);
            var projectID = $obj.data("id"), projectName, visit_url, logo;
            //var projectName = '',projectType='';
            if (projectID > 0) {
                $.ajax({
                    type: "post",
                    url: "/uc/getprojectclaim",
                    data: "&projectid=" + projectID,
                    dataType: "json",
                    error: function() {},
                    success: function(result) {
                        if (result) {
                            if (result.code == 0) {
                                gDialog.fAlert(result.msg);
                                return false;
                            } else if (result.code == 1) {
                                gDialog.fCreate({
                                        title: "项目认证",
                                        url: "/head/template/claim-project.html",
                                        backdrop: "normal",
                                        css: "login"
                                    })
                                    .show();

                                $.ajax({
                                    type: "post",
                                    url: "/uc/getproject",
                                    data: "&projectid=" + projectID,
                                    dataType: "json",
                                    error: function() {},
                                    success: function(result) {
                                        if (result) {
                                            if (result.code == 1)
                                                if (result.dic != null) { //  
                                                    $(".project #img")
                                                        .html(String
                                                            .format("<a href=\"{0}\" target=\"_blank\"><img src=\"{1}\" alt=\"{2}\"></a>", result.dic.url, result.dic.logo, result.dic.name));
                                                    $(".project #info")
                                                        .html(String
                                                            .format("<a href=\"{0}\" target=\"_blank\" class=\"title\">{1}</a><p>{2}</p>", result.dic.url, result.dic.name, result.dic.industryNames));
                                                } else {
                                                    gDialog.fAlert(result.msg);
                                                }
                                        } else {
                                            gDialog.fAlert("认证失败");
                                        }
                                    }
                                });

                                $("#btn-claim")
                                    .bind("click",
                                        function() {
                                            var img = $(".fileinput .fileinput-preview").find("img");
                                            var contactname = $("#contactname"),
                                                contacttel = $("#contacttel"),
                                                namecard = $("input[name=\"namecard\"]:checked");
                                            if (_ClaimProject.checkInput(contactname, contacttel, img, namecard)) {
                                                //var data = String.format('&projectid={0}&contactname={1}&contacttel={2}&card={3}&roleid={4}', projectID, contactname.val(), contacttel.val(), img.attr('src'), namecard.val());
                                                $.ajax({
                                                    type: "post",
                                                    url: "/uc/addprojectclaim",
                                                    data: {
                                                        projectid: projectID,
                                                        contactname: contactname.val(),
                                                        contacttel: contacttel.val(),
                                                        card: img.attr("src"),
                                                        roleid: namecard.val()
                                                    },
                                                    dataType: "json",
                                                    error: function() {},
                                                    success: function(result) {
                                                        if (result) {
                                                            if (result.code == 1) {
                                                                gDialog.fClose();
                                                                gDialog.fAlert("收到您的申请资料，请等待审核...");
                                                            } else {
                                                                $("#form_error").html(result.msg);
                                                            }
                                                        } else {
                                                            $("#form_error").html(result.msg);
                                                        }
                                                    }
                                                });
                                            }
                                        });

                            }
                        }
                    }
                });

            } else {
                //gDialog.fAlert("项目不存在");
            }
        }
    },
    /*
    checkTxtInput: function (element,dtext,error,checkmethod) {
        if (validator.trim(element.val()) == '' || validator.trim(element.val()) == dtext) {
            addFormError(element, error);
            element.focus();
            return false;
        } else {
            addFormSuccess(element);
        }
    }
    */
    checkInput: function(contactname, contacttel, img, namecard) {
        var flag = true;
        if (validator.trim(contactname.val()) == "" || validator.trim(contactname.val()) == "姓名") {
            addFormError(contactname, "请填写姓名", "text", contactname.parent().parent());
            flag = false;
        } else {
            addFormSuccess(contactname, contactname.parent().parent());
        }
        if (validator.trim(contacttel.val()) == "" || validator.trim(contacttel.val()) == "电话") {
            //addFormError(contacttel, '请填写电话号码');
            if (!validator.mobile(contacttel.val())) {
                addFormError(contacttel, "请填写正确格式的电话号码", contacttel.parent().parent());
            }
            flag = false;
        } else {
            addFormSuccess(contacttel, contacttel.parent().parent());
        }
        if (img == null || img == undefined || img == "") {
            //addFormError(img, '请上传名片');
            $("#logo-error").html("请上传名片");
            flag = false;
        } else {
            $("#logo-error").html("");
            //addFormSuccess(img);
        }
        if (validator.trim(namecard.val()) == "") {
            //addFormError($('input[name="namecard"]'), '请选择角色类型');
            $("#namecard-error").html("请选择角色类型");
            flag = false;
        } else {
            $("#namecard-error").html("");
            //addFormSuccess($('input[name="namecard"]'));
        }
        return flag;
    }
};

function addFormError(element, error) {
    var icon = element.closest(".input-icon");
    if (icon.length > 0) {
        icon = icon.children("i");
    }
    var id = element.attr("id");
    if (icon.length > 0) {
        icon.removeClass("fa-check").addClass("fa-warning");
        icon.attr("data-original-title", error).tooltip({ 'container': "body" });
    }
    element.closest(".form-group").addClass("has-error");
    var errorContainer = $("#" + id + "_error");
    if (errorContainer.length > 0) {
        errorContainer.show();
        errorContainer.html(error).show();
    } else {
        if ($(element).parent().children().hasClass("input-group-addon")) {
            $(element)
                .closest(".form-group")
                .append(String.format("<span id=\"{0}_error\" class=\"font-red\">{1}</span>", id, error));
        } else {
            $(element)
                .parent()
                .append(String
                    .format("<span id=\"{0}_error\" class=\"font-red\">{1}</span>", id, error));
        }

    }
}

function addFormSuccess(_element) {
    var element = $(_element);
    var icon = element.parents(".input-icon");
    if (icon.length > 0) {
        icon = icon.children("i");
    }
    var id = element.attr("id");
    if (icon.length > 0) {
        icon.addClass("fa-check").removeClass("fa-warning");
        //icon.attr("data-original-title", error).tooltip({ 'container': 'body' });
        //console.log(icon.html());
    }
    element.parent().parent().removeClass("has-error").addClass("has-success");
    var errorContainer = $("#" + id + "_error");
    if (errorContainer.length > 0) {
        errorContainer.html("").hide();
    }
}


/*关注*/
var _Like = {
    init: function($obj, opt) {
        /*处理开始*/
        if (_User.checkLogined()) {
            var resid = $($obj).data("resid"), restypeid = $($obj).data("restypeid");
            var data = "&resid=" + resid + "&restypeid=" + restypeid + "&opt=" + opt;
            $.ajax({
                type: "post",
                url: "/uc/addlike",
                data: data,
                success: function(result) {
                    if (result) {
                        if (result.code == 1) {
                            if (opt <= 0) {
                                $obj.addClass("btn-follow-cancel");
                                $obj.removeClass("btn-follow-add");
                                $obj.html("- 已关注");
                                var project_pv = $("#view-favor-" + resid); //likecount
                                if (project_pv) {
                                    if (result.likecount > 0) project_pv.html(result.likecount);
                                }
                                _Like.adduser(restypeid);
                                $obj.unbind("click").bind("click", function() { _Like.init($(this), 1); });
                            } else {
                                $obj.addClass("btn-follow-add");
                                $obj.removeClass("btn-follow-cancel");
                                $obj.html("+ 加关注");
                                var project_pv = $("#view-favor-" + resid);
                                if (project_pv) {
                                    if (result.likecount >= 0) project_pv.html(result.likecount);
                                }
                                _Like.deluser(restypeid);
                                $obj.unbind("click").bind("click", function() { _Like.init($(this), 0); });
                            }
                        } else {
                            gDialog.fAlert(result.msg);
                        }
                    } else {
                        //gDialog.fAlert('关注失败');
                    }
                },
                error: function() {
                    //gDialog.fAlert('关注失败');
                },
                dataType: "json"
            });
        }
    },
    projecttitle: '<div class="portlet-title"><div class="caption">关注项目人</div></div><div class="already-people"></div>',
    usertitle: '<div class="portlet-title"><div class="caption">关注TA的人</div></div>',
    adduser: function(restypeid) {
        var projectuser = String
            .format('<a href="/user/{0}" target="_blank" class="icon-face user-over tooltips" data-id="{0}" data-container="body" data-placement="bottom" data-original-title="{1}"><img src="{2}" alt="{1}" />{1}</a>', _User.userid, _User.nickname, _User.photo);
        var user = String
            .format('<li><a href="/user/{0}" target="_blank" class="icon-face user-over tooltips" data-id="{0}" data-container="body" data-placement="bottom" data-original-title="{1}"><img src="{2}" alt="{1}" />{3}</a></li>', _User.userid, _User.nickname, _User.photo, _User.isverified == "True" ? "<em>V</em>" : "");
        if (restypeid == 5) {
            var projectfollowdiv = $(".project-follow");
            if (projectfollowdiv.length < 1) {
                var comment = $("#content-comment");
                if (comment.length > 0) {
                    comment
                        .before(String.format('<div class="portlet project-follow margin-top-30">{0}</div>',
                            this.projecttitle));
                }
            }
            projectfollowdiv = $(".project-follow .already-people");
            if (projectfollowdiv.length > 0) {
                projectfollowdiv.prepend(projectuser);
            }
        } else if (restypeid == 2) {
            var userfollowdiv = $(".user-follow");
            if (userfollowdiv.length < 1) {
                var contentleft = $(".about");
                if (contentleft.length > 0) {
                    contentleft.append(String
                        .format('<div class="portlet project-follow user-follow margin-top-30">{0}{1}</div>',
                            this.usertitle,
                            '<div class="usersmall-list"><ul></ul></div>'));
                }
            }
            userfollowdiv = $(".usersmall-list ul");
            if (userfollowdiv.length > 0) {
                userfollowdiv.prepend(user);
            }
        }
    },
    deluser: function(restypeid) {
        var user;
        if (restypeid == 5) {
            user = $(".project-follow .already-people").find(String.format('a[data-id="{0}"]', _User.userid));
            if (user.length > 0) {
                user.remove();
            }
        } else if (restypeid == 2) {
            user = $(".user-follow ul li").find(String.format('a[data-id="{0}"]', _User.userid));
            if (user.length > 0) {
                user.closest("li").remove();
            }
        }
    }
};

/*约*/
var _Yue = {
    listinit: function() {
        $(".yue-project .delete")
            .bind("click",
                function() {
                    //if()
                    var li = $(this).parents("li");
                    if (li != undefined && li != "") {
                        var userid = li.data("id"), id = li.data("id"), type = li.data("type");
                        if (userid <= 0) userid = _User.userid;
                        if (userid > 0 && id > 0) {
                            //ajax 在数据库删除
                            li.remove();
                        }
                    }
                });
        $(".yue-project .look")
            .bind("click",
                function() {
                    $.ajax({
                        type: "post",
                        url: "/uc/deleteyue",
                        data: { id: $($obj).data("id") },
                        success: function(result) {
                            if (result) {
                                if (result.code == 1) {
                                }
                            }
                        },
                        error: function() { flag = false; },
                        dataType: "json"
                    });
                });
    },
    add: function($obj) {
        /*处理开始*/
        if (_User.checkLogined()) {
            var t = $obj.data("restypeid");
            //var senderid = _User.userid;
            var receiverid = $obj.data("userid");
            //var r_roletype = $obj.data('roletype');
            var projectid = $obj.data("projectid"), projectname, content, direction = 3;
            if (receiverid == "NaN" || receiverid <= 0) {
                gDialog
                    .fAlert("该项目没有主人，您还不能约，<a href=\"javascript:void(0)\" onclick=\"gDialog.fClose();_ClaimProject.add(this);\" data-id=\"" + projectid + "\" class=\"font-red claim\" id=\"project_claim\">点击认证</a> 该项目的管理员");
                return;
            }
            gDialog.fCreate({ title: "约谈", url: "/head/template/yue.html", backdrop: "normal" }).show();
            /*约人,列出项目*/
            if (t == 2) {
                var data = "&id=" + receiverid;
                $.ajax({
                    type: "post",
                    url: "/uc/myproject/",
                    data: data,
                    success: function(result) {
                        if (result.code == 1) {
                            var projectlist = result.list;
                            if (projectlist == null || projectlist == undefined) {
                                //gDialog.fCreate({ title: '约谈', url: '/head/template/yue-project.html', backdrop: 'normal' }).show();
                                //$('#btn-project-create').bind('click', function () { window.open("/project/add"); });
                                //$('#btn-project-cancel').bind('click', function () { Close(); });
                            } else {
                                $("#box-yue-project").append("<div class=\"title\">选择您要约的项目</div>");
                                for (var i = 0; i < projectlist.length; i++) {
                                    if (projectlist[i].length == 2) {
                                        var pID = projectlist[i][0], pName = projectlist[i][1];
                                        if (pID > 0) {
                                            var label = $("<label></label>");
                                            var radio = $("<input type=\"radio\" data-name=" +
                                                    pName +
                                                    " name=\"project\">")
                                                .val(pID);
                                            label.append(radio).append(pName);
                                            $("#box-yue-project").append(label);
                                        }
                                    }
                                }
                            }
                        } else {
                            gDialog.fAlert(result.msg);
                        }
                    },
                    error: function() {
                        //gDialog.fAlert('约谈失败');
                    },
                    dataType: "json"
                });

            }
            $("#vcode")
                .blur(function() {
                    if (!CheckVcode(this)) {
                        $("#vcode_error").html("验证码填写有误~").show();
                    } else {
                        $("#vcode_error").html("").hide();
                    }
                });
            /*提交处理*/
            $("#btn-yue-submit")
                .click(function() {
                    var project = $("input[name='project']:checked");
                    if (_User.userid == receiverid) {
                        gDialog.fAlert("对不起，不能约谈自己");
                        return false;
                    }
                    if (project != undefined && project != "" && project.length > 0) {
                        projectid = project.val();
                        projectname = project.data("name");
                    } else {
                        projectid = $obj.data("projectid");
                        projectname = $obj.data("projectname");
                    }
                    content = $("#content").val();
                    if (validator.trim(content).length <= 0) {
                        addFormError($("#content"));
                        return;
                    }
                    var vcode = $("#vcode");
                    if (!CheckVcode(vcode)) {
                        $("#vcode_error").html("验证码填写有误~").show();
                        return false;
                    } else {
                        $("#vcode_error").html("").hide();
                    }
                    /*
                    var m_roletype = _User.roletype;
                    if (m_roletype == 2 && r_roletype == 1) {
                        direction = 1;
                    } else if (m_roletype == 1 && r_roletype == 2) {
                        direction = 2;
                    } else if (m_roletype == 2 && r_roletype == 2) {
                        direction = 3;
                    } else if (m_roletype == 1 && r_roletype == 1) {
                        direction = 4;
                    }
                    */
                    $.ajax({
                        type: "post",
                        url: "/uc/addyue/",
                        data: {
                            receiverid: receiverid,
                            projectid: projectid,
                            projectname: projectname,
                            content: content,
                            vcode: vcode.val()
                        },
                        success: function(result) {
                            if (result) {
                                if (result.code == 1) {
                                    var yue_pv = $("#view-yue-" + projectid);
                                    if (yue_pv) {
                                        yue_pv.html(result.yuecount);
                                    }
                                    gDialog.fClose();
                                    gDialog.fAlert("约谈成功！");
                                } else {
                                    gDialog.fAlert(result.msg);
                                }
                            }
                        },
                        error: function() { flag = false; },
                        dataType: "json"
                    });

                });
        }
    },
    Delete: function($obj) {
        if (_User.checkLogined()) {
            var ul = $($obj).closest("ul");
            var id = ul.data("yueid");
            var issender = ul.data("issender");
            //ajax删除收藏
            gDialog.fConfirm("提示",
                "确定要删除？",
                function(rs) {
                    if (!rs) {
                        return false;
                    }
                    $.ajax({
                        type: "post",
                        url: "/uc/deleteuseryue/",
                        data: { id: id, issender: issender },
                        success: function(result) {
                            if (result) {
                                if (result.code == 1) {
                                    var item = $("#yue_" + id);
                                    if (item.length > 0) {
                                        item.remove();
                                    }
                                } else {
                                    gDialog.fAlert(result.msg);
                                }
                            }
                        },
                        error: function() {},
                        dataType: "json"
                    });
                });
        }
    },
    operation: function($obj, yuestatus) { //type:用户操作：0：同意，1：拒绝
        $obj = $($obj);
        var ul = $($obj).closest("ul");
        var yueid = ul.data("yueid");
        var projectid = ul.data("projectid");
        var sendid = ul.data("sendid");
        $.ajax({
            type: "post",
            url: "/uc/agreeyueyesOrno",
            data: { yueid: yueid, projectid: projectid, sendid: sendid, yuestatus: yuestatus },
            error: function() { gDialog.fAlert("操作失败，请稍后再试..."); },
            dataType: "json",
            success: function(result) {
                if (result) {
                    if (result.code == 1) {
                        gDialog.fAlert(result.msg);
                    } else {
                        gDialog.fAlert(result.msg);
                    }
                }
            }
        });
    }
};

var _Write = {
    Delete: function($obj) {
        if (_User.checkLogined()) {
            var li = $($obj).closest("li");
            var id = li.data("id");
            //ajax删除个人信息
            gDialog.fConfirm("提示",
                "确定要删除？",
                function(rs) {
                    if (!rs) {
                        return false;
                    }
                    $.ajax({
                        type: "post",
                        url: "/uc/deletearticle",
                        data: { id: id },
                        success: function(result) {
                            if (result) {
                                if (result.code == 1) {
                                    if (li.length > 0) $(li).remove();
                                } else {
                                    gDialog.fAlert(result.msg);
                                }
                            }
                        },
                        error: function() {},
                        dataType: "json"
                    });
                });
        }
    }
};

function getValue(obj, dvalue) {
    if ($.trim(obj).length <= 0) {
        return dvalue;
    }
    return $.trim(obj);
}

/*消息*/
var _MessageReply = {
    init: function() {
        var reply_teleplate =
            "<li class=\"my-inform\"><div class=\"img\"><a href=\"/user/{0}\" target=\"_blank\"><img src=\"{1}\" class=\"circle\"></a></div><div class=\"info\"><a href=\"/user/{0}\" target=\"_blank\" class=\"tit\">我</a>说<div class=\"yue-word\"><p>{2}</p></div></div></li>";
        $("#btn_letter")
            .unbind("click")
            .bind("click",
                function() {
                    if (_User.checkLogined()) {
                        var form = $(this).closest("form");
                        var receiverid = form.data("receiverid");
                        var content = form.find("textarea");
                        if (content.val().length < 2 || content.val().length > 150) {
                            return false;
                        }
                        $.ajax({
                            type: "post",
                            url: "/uc/addusermessage/",
                            data: { receiverid: receiverid, content: content.val() },
                            success: function(result) {
                                if (result) {
                                    if (result.code == 1) {
                                        $(".yue-project")
                                            .prepend($(String
                                                .format(reply_teleplate, _User.userid, _User.photo, content.val())));
                                        content.val("");
                                    } else {
                                        gDialog.fAlert(result.msg);
                                    }
                                }
                            },
                            error: function() { gDialog.fAlert("回复失败，请稍后再试..."); },
                            dataType: "json"
                        });
                    }
                });
    },
    Delete: function(id, ischat) {
        if (_User.checkLogined()) {
            var li = $("#message_" + id);
            //ajax删除个人信息
            gDialog.fConfirm("提示",
                "确定要删除？",
                function(rs) {
                    if (!rs) {
                        return false;
                    }
                    $.ajax({
                        type: "post",
                        url: ischat == 1 ? "/uc/messagechat/del/" : "/uc/message/del",
                        data: { id: id },
                        success: function(result) {
                            if (result) {
                                if (result.code == 1) {
                                    if (li.length > 0) $(li).remove();
                                } else {
                                    gDialog.fAlert(result.msg);
                                }
                            }
                        },
                        error: function() {},
                        dataType: "json"
                    });
                });
        }
    }
};
var _Mshow = {
    Delete: function($obj) {
        if (_User.checkLogined()) {
            var li = $($obj).closest("li");
            var restypeid = li.data("restypeid");
            var resid = li.data("resid");
            //ajax删除Mshow
            gDialog.fConfirm("提示",
                "确定要删除？",
                function(rs) {
                    if (!rs) {
                        return false;
                    }
                    $.ajax({
                        type: "post",
                        url: "/uc/deletefavor/",
                        data: { resid: resid, restypeid: restypeid },
                        success: function(result) {
                            if (result) {
                                if (result.code == 1) {
                                    if (li.length > 0) $(li).remove();
                                } else {
                                    gDialog.fAlert(result.msg);
                                }
                            }
                        },
                        error: function() {},
                        dataType: "json"
                    });
                });
        }
    },
    showResult: function(data) {
        if (data.code == 1) {
            window.location.href = "/uc/mshow/";
            //console.log('succeed');
        } else {
            $("#result").html(data.msg);
            //console.log(data.msg);
        }
    }
}; /*私信*/
var _Letter = {
    add: function($obj) {
        /*处理开始*/
        if (_User.checkLogined()) {
            var receivername = $.trim($obj.data("username"));
            var receiverid = $.trim($obj.data("userid"));
            gDialog.fCreate({ title: "私信", url: "/head/template/letter.html", backdrop: "normal" }).show();
            $("#receiverid").val(receiverid);
            if (receivername != "" && receivername != undefined) {
                $("#uname").html("To：" + receivername);
            }
            $("#btn-letter")
                .click(function() {
                    var content = $("#content");
                    content.blur(function() {
                        _Letter.checkInput();
                    });
                    if (_Letter.checkInput()) {
                        $.ajax({
                            type: "post",
                            url: "/uc/addusermessage/",
                            data: {
                                receiverid: receiverid,
                                receivername: receivername,
                                content: $.trim(content
                                    .val())
                            },
                            error: function() {},
                            dataType: "json",
                            success: function(result) {
                                if (result) {
                                    if (result.code == 1) {
                                        gDialog.fClose();
                                        gDialog.fAlert("发送成功！");
                                    }
                                }
                            }
                        });
                    }
                });

        }
    },
    checkInput: function() {
        var content = $("#content");
        if (validator.trim(content.val()) == "") {
            addFormError(content, "内容不能为空");
            content.focus();
            return false;
        } else {
            addFormSuccess(content);
        }
        return true;
    },
    show: function() {

    },
    Delete: function($obj) {
        var id = $obj.data("mshowid"), userid = $obj.data("id");
        if (uid <= 0) {
            uid = _User.userid;
        }
        if (id > 0) {
            //在数据库软删除
            $obj.remove();
        }
    }
};
/*赞*/
var _Zan = {
    init: function($obj, opt) {
        if (_User.checkLogined()) {
            var resid = $obj.data("resid");
            var data = "&resid=" + resid + "&opt=" + opt;
            $.ajax({
                type: "post",
                url: "/uc/addzan/",
                data: data,
                success: function(result) {
                    if (result) {
                        if (result.code === 1) {
                            var zan = $(".view-zan-" + resid + ",#view-zan-" + resid);;
                            if (opt < 1) {
                                $obj.removeClass("btn-zan-add").addClass("btn-zan-cancel");
                                //var i = $obj.find('i');
                                //if (i.length > 0) i.removeClass('fa-heart-o').addClass('fa-heart');
                                $obj.html("<i class=\"fa fa-heart\"></i> 已赞");
                                $obj.attr("data-original-title", String.format("已有{0}位网友觉得很赞", result.zancount));
                                if (zan) {
                                    if (result.zancount > 0)
                                        zan.html(result.zancount);
                                    zan.closest(".already-people")
                                        .find(".usersmall-list")
                                        .prepend(String
                                            .format("<li data-id=\"{0}\"><a href=\"/user/{0}\" target=\"_blank\" class=\"icon-face\" data-container=\"body\" data-placement=\"bottom\" data-original-title=\"{1}\"><img src=\"{2}\">{3}</a></li>", _User.userid, _User.nickname, _User.photo, _User.isverified == 1 ? "<em>V</em>" : ""));
                                }
                                $obj.unbind("click").bind("click", function() { _Zan.init($(this), 1); });
                            } else {
                                $obj.removeClass("btn-zan-cancel").addClass("btn-zan-add");
                                //var i = $obj.find('i');
                                //if (i.length > 0) i.removeClass('fa-heart').addClass('fa-heart-o');
                                $obj.attr("data-original-title", String.format("已有{0}位网友觉得很赞", result.zancount));
                                $obj.html("<i class=\"fa fa-heart-o\"></i> 赞");
                                if (zan) {
                                    if (result.zancount >= 0)
                                        zan.html(result.zancount);
                                    var li = $('.already-people .usersmall-list li[data-id="' + _User.userid + '"]');
                                    if (li.length > 0) li.remove();
                                }
                                $obj.unbind("click").bind("click", function() { _Zan.init($(this), 0); });
                            }
                        } else {
                            gDialog.fAlert(result.msg);
                        }

                    } else {
                        //gDialog.fAlert('赞失败');
                    }
                },
                error: function() {
                    //gDialog.fAlert('赞失败');
                },
                dataType: "json"
            });
        }
    }
}; //收藏
var _Favor = {
    listinit: function() {

    },
    add: function($obj) {
        /*处理开始*/
        if (_User.checkLogined()) {
            var resid = $obj.data("resid"),
                restypeid = $obj.data("restypeid"),
                url = window.location.href,
                title = document.title;
            if (restypeid == 10) {
                var titpart = $obj.prev();
                if (titpart) {
                    title = titpart.text();
                    url = "http://" + window.location.hostname + titpart.attr("href");
                }
            }
            var data = "&resid=" + resid + "&restypeid=" + restypeid + "&title=" + title + "&url=" + url;
            $.ajax({
                type: "post",
                url: "/uc/addfavor",
                data: data,
                success:
                    function(result) {
                        if (result) {
                            if (result.code == 1) {
                                $obj.removeClass("favor-add").addClass("favor-cancel");
                                //$obj.attr('class', 'btn-favor-cancel');
                                $obj.html('<i class="fa fa-star"></i>已收藏');
                                var favcount = $("#view-favor-" + resid);
                                if (favcount) favcount.html(Number(favcount.html()) + 1);
                                $obj.unbind("click"); //.bind('click', function () { _Favor.cancel($(this)); });
                            }
                        } else {
                        }
                    },
                error: function() {
                    //console.log('error');
                },
                dataType: "json"
            });
        }
    },
    cancel: function($obj) {
        if (_User.checkLogined()) {
            //$obj.attr('class', 'btn-favor-add');
            $obj.removeClass("favor-cancel").addClass("favor-add");
            //$obj.text('收藏');
            $obj.html($obj.html().replace("已收藏", "收藏"));
            $obj.unbind("click").bind("click", function() { _Favor.add($(this)); });
            var id = "", userid = _User.userid;
            //................................
        }
    }
};

function addoptions(option, poption) {
    var pop = $("<option></option>");
    pop.val(option.id).text(option.text);
    if (option.hasOwnProperty("tags")) {
        var select = $("<select></select>");
        for (var o = 0; o < option.tags.length; o++) {
            var op = $("<option></option>");
            op.val(option.tags[o].id).text(option.tags[o].text);
            addoptions(option.tags[o]);
        }
    }
    $(poption).append(option);
}

function Close() {
    gDialog.fClose();
}

function CheckVcode($obj) {
    $obj = $($obj);
    var data = "&code=" + $obj.val();
    var flag = false;
    $.ajax({
        type: "post",
        async: false,
        cache: false,
        url: "/Login/chkcode/",
        data: data,
        success: function(result) {
            if (result) {
                if (result.code == 1) {
                    flag = true;
                }
            }
        },
        error: function() { flag = false; },
        dataType: "json"
    });
    return flag;
}

/*控件绑定事件*/
var _Control = {
    init: function() {
        /*点击登录*/
        $("#btn-login, .btn-login").unbind("click").on("click", function() { _User.openLoginPannel(); });
        $("#btn-register, .btn-register, .btn-join")
            .on("click",
                function() {
                    if ($(this).hasClass("btn-join")) {
                        if (_User.isLogined) {
                            window.location.href = "/uc/investorcertify";
                        } else {
                            _User.openRegisterPannel();
                        }
                    } else {
                        _User.openRegisterPannel();
                    }
                });
        /*关注*/
        $(".btn-follow-add").unbind("click").on("click", function() { _Like.init($(this), 0); });
        $(".btn-follow-cancel").unbind("click").on("click", function() { _Like.init($(this), 1); });
        /*约*/
        $(".btn-yue-add").unbind("click").bind("click", function() { _Yue.add($(this)); });
        /*私信*/
        $(".btn-letter").unbind("click").on("click", function() { _Letter.add($(this)); });
        /*赞*/
        $(".btn-zan-add").unbind("click").on("click", function() { _Zan.init($(this), 0); });
        $(".btn-zan-cancel").unbind("click").on("click", function() { _Zan.init($(this), 1); });
        /*收藏*/
        $(".favor-add").unbind("click").on("click", function() { _Favor.add($(this)); });
        //领域选择框
        $(".ind").unbind("click").on("click", function() { _Industry.init(this, "industry"); });
        //城市选择框
        $(".address").unbind("click").on("click", function() { _Address.init(this); });
        //手机验证
        $(".phonevalidate").unbind("click").on("click", function() { _PhoneValidate.init(this); });
        //项目创建
        $(".project-create").unbind("click").on("click", function() { _ProjectCreate.init(); });
        //_ProjectCreate.init($('.project-create'));
        //项目提交成功
        $(".project-submit").unbind("click").on("click", function() { _ProjectSubmit.init(this, "提交成功", 100); });
        //秒Show 
        //$('.Mshow').on('click', function () { _Mshow.init(this, "提交成功", 100); });
        //完善项目成功
        //$('.project-success').on('click', function () { _ProjectSuccess.init(this, "提交成功"); });
        //认证项目
        $(".claim").unbind("click").on("click", function() { _ClaimProject.add(this); });
        //列表页搜索框
        $("#searchbutton").unbind("click").click(function() { keywordSearch($("#keyword").val()); });
        //意见反馈
        $(".suggest").on("click", function() { _Suggest.add(); });
    }
};

var _Suggest = {
    add: function() {
        gDialog.fCreate({
                title: "意见反馈",
                url: "/head/template/suggest.html",
                backdrop: "normal",
                css: "suggest-tips",
                modalId: "win-suggest"
            })
            .show();
        this.initForm();
    },
    initForm: function() {
        $("#form_suggest")
            .formvalidate({
                btnmsg: "正在提交，请稍候...",
                errordiv: "suggest_error",
                beforesubmit: function () {
                    $("#suggest_error").html('');
                    var email = $("#email");
                    var emailv = $.trim(email.val());
                    var tel = $("#tel");
                    var telv = $.trim(tel.val());
                    if ($.trim(email.val()) === "" && $.trim(tel.val()) === "") {
                        $("#suggest_error").html("请留下您的电话或邮箱");
                        return false;
                    }
                    if (!validator.isemail(emailv) && emailv.length > 0) {
                       $("#suggest_error").html("请填写正确格式的邮箱！");
                       return false;
                   } 
                    if (!validator.mobile(telv) && !validator.tel(telv) && telv.length>0) {
                       $("#suggest_error").html("请填写正确格式的电话！");
                       return false;
                   }
                    return true;
                },
                aftersubmit: function(data) {
                    if (data.code === 1) {
                        gDialog.fClose("win-suggest");
                        gDialog.fAlert("提交成功！", 3);
                    }
                }
            });
    }
};
var _ProjectShow = {
    init: function(title, id) {
        gDialog.fCreate({ title: title, url: "/head/template/projectshow.html", backdrop: "normal", css: "login" })
            .show();
        $("#btn-project-details").bind("click", function() { window.location.href = "/uc/project" });
        $("#btn-project-cancel").bind("click", function() { gDialog.fClose(); });
    }
};
var _Projectsubmit = {
    init: function(projectid, title) {
        gDialog.fCreate({ title: title, url: "/head/template/projectshow.html", backdrop: "normal", css: "login" })
            .show();
        var id = "";
        $("#btn-project-cancel").unblind("click").bind("click", function() { gDialog.fClose(); });
        $("#btn-project-details")
            .unblind("click")
            .bind("click", function() { window.location.href = "/uc/project1/" + projectid });
    }
};
var _Button = {
    bindClick: function($obj, func, data) {
        $($obj).bind("click", function() { func(data); });
    }
};
var _ResetPwd = {
    showResult: function(data) {
        if (data.code == 1) {
            //console.log(true);
            $("#form_error").html("修改成功");
        } else {
            //console.log(data.msg);
            $("#form_error").html(data.msg);
        }
    }
};
var _UserCertify = {
    init: function() {
        var Rinvestorty = $.trim($("#Rinvestorty input[type='radio']:checked").val());
        if (Rinvestorty == 101) {
            $("div[rel=\"vc\"]").show();
        } else if (Rinvestorty == 100) {
            $("div[rel=\"vc\"]").hide();
        }
        $("input[name=\"investorty\"]")
            .bind("click",
                function() {
                    if ($(this).val() == 101) {
                        $("div[rel=\"vc\"]").show();
                    } else if ($(this).val() == 100) {
                        $("div[rel=\"vc\"]").hide();
                    }
                });

    },
    showResult: function(data) {
        if (data.code == 1) {
            //console.log(true);
        } else {
            //console.log(data.msg);
        }
    }
};
var _Project = {
    listinit: function() {
        $("ul.project li a.edit")
            .on("click",
                function() {
                    _Project.edit();
                });

        $("ul.project li a.delete")
            .on("click",
                function() {
                    _Project.Delete(this);
                });
    },
    details: function(id) {
        //console.log('项目' + id + '详情');
        window.location.href = "/Project/" + id;
        //..........................
    },
    edit: function(id) {
        window.location.href = "/uc/project1/" + id;
        //console.log('edit');
    },
    Delete: function($obj) {
        var li = $($obj).closest("li");
        var id = li.data("resid");
        if (id <= 0) {
            gDialog.fAlert("删除失败");
        }
        gDialog.fConfirm("提示",
            "确定要删除？",
            function(rs) {
                if (!rs) {
                    return false;
                }
                $.ajax({
                    type: "post",
                    url: "/uc/deleteproject/",
                    data: { projectid: id },
                    error: function() { gDialog.fAlert("删除失败"); },
                    dataType: "json",
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                $(li).remove();
                            } else {
                                gDialog.fAlert(result.msg);
                            }
                        } else {
                        }
                    }
                });
            });
    }
};
var _ProjectSubmit = {
    init: function($obj, title, id) { //projectsubmit
        gDialog.fCreate({ title: title, url: "head/template/projectsubmit.html", backdrop: "normal", css: "login" })
            .show();
        $("#btn-project-details").bind("click", function() { _ProjectSubmit.details(id); });
        $("#btn-project-cancel").bind("click", function() { _ProjectSubmit.close(); });
    },
    details: function(id) {
        gDialog.fClose();
        //打开项目详情页面
    },
    close: function() {
        gDialog.fClose();
    }
}; // Handles Bootstrap Tabs.
var handleTabs = function() {
    //activate tab if tab mshowid provided in the URL
    if (location.hash) {
        var tabid = location.hash.substr(1);
        $("a[href=\"#" + tabid + "\"]")
            .parents(".tab-pane:hidden")
            .each(function() {
                var tabid = $(this).attr("mshowid");
                $("a[href=\"#" + tabid + "\"]").click();
            });
        $("a[href=\"#" + tabid + "\"]").click();
    }
};
//$obj:控件自己  hiddentextID：被选择选择项隐藏域
var select2Api = function(placeholder, minimumInputLength, multiple, $obj, hiddentextID, posturl, postname) {
    //后台
    $($obj)
        .select2({
            placeholder: placeholder,
            minimumInputLength: minimumInputLength,
            multiple: multiple,
            allowClear: true,
            ajax: {
                url: posturl,
                dataType: "json",
                type: "POST",
                data: function(term) { return { projectname: term }; },
                results: function(data) {
                    return { results: data.dic };
                }
            },
            initSelection: function(element, callback) {
                var id = $(element).val();
                var q = "";
            },
            escapeMarkup: function(m) {
                var mv = m;
                if (mv != "") {
                    //mv=mv.replace('[NULL]','');
                }
                //$('#' + forObj).attr('value', mv);
                return m;

            } // we 
        });

    $($obj)
        .change(function() {
            var projectnames = "";
            $("#s2id_" + $($obj).attr("id") + " ul.select2-choices .select2-search-choice")
                .find("div")
                .each(function(i) {
                    if (i == 0) {
                        projectnames = $(this).text();
                    } else {
                        projectnames = projectnames + "|" + $(this).text();
                    }
                });
            $("#" + hiddentextID).val(projectnames);
            //$('#' + hiddentextID).val($('#s2id_' + $($obj).attr('id') + ' .select2-choice span.select2-chosen').html());
        });
}; // Handles custom checkboxes & radios using jQuery Uniform plugin
var handleUniform = function() {
    if (!$().uniform) {
        return;
    }
    var test =
        $("input[type=checkbox]:not(.toggle, .make-switch, .icheck), input[type=radio]:not(.toggle, .star, .make-switch, .icheck)");
    if (test.size() > 0) {
        test.each(function() {
            if ($(this).parents(".checker").size() == 0) {
                $(this).show();
                $(this).uniform();
            }
        });
    }
};

var _Address = {
    init: function($obj) {
        gDialog.fCreate({ title: "地区", url: "/head/template/city.html", backdrop: "normal", css: "login" }).show();
        $("#selectCity").val($obj.id);
        $(".tab-content .tab-pane li").bind("click", function() { _Address.add(this); });
        $(".tab-content .tab-pane.active").find("li").hide();
        $(".tab-content .tab-pane.active").find("li").slice(0, 25).show();
        $(".nav.nav-tabs li")
            .click(function() {

                var cur = $(this),
                    tabul = cur.parent(),
                    cont = cur.parent().parent(".tabbable").next(),
                    i = tabul.children().index(cur);
                tabul.children().removeClass("on");
                cur.addClass("on");
                cont.children().addClass("hide");
                cont.children().eq(i).removeClass("hide");
                $("#flip_cities2").hide();
                cont.children().data("pageindex", "1");
                cont.children().eq(i).find("li").hide();
                cont.children().eq(i).find("li").slice(0, 25).show();
                if (cont.children().eq(i).data("pagecount") > 1) {
                    $("#flip_cities2").show();
                    $("#pre").attr("disabled", true);
                }

            });

        $("#pre")
            .bind("click",
                function() {
                    var curul = $("#city .tab-pane.active");
                    var pageindex = Number(curul.data("pageindex")) - 1, pagecount = Number(curul.data("pagecount"));
                    if (pageindex >= 1) {
                        var maxli = 25 * pageindex, minli = 25 * (pageindex - 1);
                        //console.log('minli:' + minli + ' maxli:' + maxli + ' pageindex:' + pageindex);
                        curul.find("li").hide();
                        curul.find("li").slice(minli, maxli).show();
                        curul.data("pageindex", pageindex);
                        if (pageindex <= 1) {
                            $("#pre").attr("disabled", true);
                        }
                    }
                    $("#post").attr("disabled", false);
                });

        $("#post")
            .bind("click",
                function() {
                    var curul = $("#city .tab-pane.active");
                    var pageindex = Number(curul.data("pageindex")), pagecount = Number(curul.data("pagecount"));
                    if (pageindex < pagecount) {
                        var minli = 25 * pageindex, maxli = 25 * (Number(pageindex) + 1);
                        //console.log('minli:' + minli + ' maxli:' + maxli + ' pageindex:' + pageindex);
                        curul.find("li").hide();
                        curul.find("li").slice(minli, maxli).show();
                        curul.data("pageindex", pageindex + 1);
                        if (pageindex + 1 >= pagecount) {
                            $("#post").attr("disabled", true);
                        }
                    }
                    $("#pre").attr("disabled", false);
                });

    },
    add: function($obj) {
        $obj = $($obj);
        //console.log($obj.data('title') + $obj.data('id') + '|' + $('#selectCity').val());
        $("#" + $("#selectCity").val()).val($obj.data("title"));
        $("#" + $("#selectCity").val() + "ID").val($obj.data("id"));
        gDialog.fClose();
    }
};
var _PerfectInfo = {
    open: function() {
        gDialog.fCreate({
                title: "完善个人资料",
                url: "/head/template/perfectInfo.html",
                backdrop: "normal",
                css: "login",
                modalId: "win-perfectInfo"
            })
            .show();
        $("#btn-perfectInfo-cancel").unbind("click").bind("click", function() { gDialog.fClose("win-perfectInfo"); });
        $("#btn-perfectInfo-details").unbind("click").bind("click", function() { window.location.href = "/uc/info"; });
    }
};
var _ProjectCreate = {
    init: function(type) { //type为1时不检验信息是否完整
        if (_User.checkLogined()) {
            var isok = false;
            if (type == 1) {
                //ProjectAlert();
                window.location.href = "/uc/project_create";
            } else {
                if (_User.isok) {
                    if (_User.isok.toLowerCase() == "true") {
                        //gDialog.fCreate({ title: '创建项目', url: '/head/template/projectcreate.html', backdrop: 'normal', css: 'login' }).show();
                        //ProjectAlert();
                        window.location.href = "/uc/project_create";
                        isok = true;
                    }
                }
                if (!isok) {
                    _PerfectInfo.open();
                }
            }
        }
    }
};
var _Industry = {
    multiselect: true,
    init: function($obj, hiddenID) {
        gDialog.fCreate({ title: "领域", url: "/head/template/industry.html", backdrop: "normal", css: "login" }).show();
        $("#openId").val($obj.id);
        $("#hideId").val(hiddenID);
        if ($($obj).data("multiselect") == 0) {
            this.multiselect = false;
            $("#checkInd").closest(".item").remove();
            $(".form-actions").remove();
        }
        jsondata = dictionary.dictionary;
        var industry = "";
        $.each(jsondata,
            function(index, content) {
                if (content.t == "industry") {
                    industry = content;
                }
            });
        if (industry != "") {
            var checkedIndIDs = $("#" + $("#hideId").val()).val(),
                checkedIndTexts = $("#" + $("#openId").val()).val(),
                checkedIndIDList = "",
                checkedIndTextList = "";
            if (checkedIndIDs != undefined &&
                checkedIndIDs != "" &&
                checkedIndTexts != undefined &&
                checkedIndTexts != "") {
                checkedIndIDList = checkedIndIDs.split(","), checkedIndTextList = checkedIndTexts.split(",");
            }
            var arr = new Array(checkedIndIDList.length);
            if (checkedIndIDList.length > 0) {
                for (var i = 0; i < checkedIndIDList.length; i++) {
                    arr.push(checkedIndIDList[i]);
                }
            }

            $.each(industry.tags,
                function(index, content) {
                    var div = $("<div class=\"item\"></div>");
                    $("<b></b>").append(content.text).appendTo(div);
                    var div1 = $("<div class=\"data-item\"></div>");
                    div.append(div1);
                    if (content.hasOwnProperty("tags")) {
                        for (var i = 0; i < content.tags.length; i++) {
                            var a = $("<a href=\"javascript:void(0)\" class=\"\" data-value=\"" +
                                    content.tags[i].id +
                                    "\"></a>")
                                .text(content.tags[i].text)
                                .bind("click",
                                    function() {
                                        if (_Industry.multiselect) {
                                            _Industry.add(this);
                                        } else {
                                            _Industry.addsingle(this);
                                        }
                                    });
                            //$(div1).append(a);
                            a.appendTo(div1);
                            if (arr.indexOf(content.tags[i].id) > 0) {
                                if (_Industry.multiselect) {
                                    a.click();
                                } else {
                                    a.addClass("checked");
                                }
                            }
                        }
                    }
                    $("#module").append(div);
                });
        }

        $("#ind-submit")
            .bind("click",
                function() {
                    var Indtext = $("#openId").val();
                    var Indvalue = $("#hideId").val();
                    var industryValue = $("#industryValue").val();
                    var IndArray = industryValue.split(",");
                    for (var i = 0; i < IndArray.length; i++) {
                        var item = IndArray[i].split("|");
                        if (i == 0) {
                            $("#" + Indvalue).val(item[0]);
                            $("#" + Indtext).val(item[1]);
                        } else {
                            $("#" + Indvalue).val($("#" + Indvalue).val() + "," + item[0]);
                            $("#" + Indtext).val($("#" + Indtext).val() + "," + item[1]);
                        }
                    }
                    gDialog.fClose();
                });

        $("#ind-cancel")
            .bind("click",
                function() {
                    gDialog.fClose();
                });
    },
    remove: function($obj, $pobj) {
        $obj = $($obj);
        $pobj = $($pobj);
        $obj.remove();
        $pobj.removeClass("checked");
        var checkedInd = "";
        $("#checkInd")
            .find("a")
            .each(function(i) {
                if (i == 0) {
                    checkedInd = $(this).data("value") + "|" + $(this).data("text");
                } else {
                    checkedInd = checkedInd + "," + $(this).data("value") + "|" + $(this).data("text");
                }
            });
        $("#industryValue").val(checkedInd);
    },
    add: function($obj) {
        $obj = $($obj);
        if ($obj.hasClass("checked")) {
            return;
        }
        var checkContent = $("#checkInd");
        $obj.addClass("checked");
        $("<a title=\"取消\" href=\"javascript:void(0)\" data-text=\"" +
                $obj.text() +
                "\" data-value=\"" +
                $obj.data("value") +
                "\">" +
                $obj.text() +
                "<span>×</span></a>")
            .bind("click", function() { _Industry.remove(this, $obj) })
            .appendTo(checkContent);
        var checkedInd = $("#industryValue").val() + "," + $obj.data("value") + "|" + $obj.text();
        var values = "", texts = "";
        if ($("#industryValue").val() == "") {
            checkedInd = $obj.data("value") + "|" + $obj.text();
            values = $obj.data("value");
            texts = $obj.text();
        } else {
            checkedInd = $("#industryValue").val() + "," + $obj.data("value") + "|" + $obj.text();
            values = $("#openId").val() + $obj.data("value");
            texts = $("#industryText").val() + $obj.text();
        }
        $("#industryValue").val(checkedInd);
        //$('#industryText').val(texts);
        $("#openId").val();
    },
    IndustryManager: function($obj) {
        $obj = $($obj);
        if ($obj.hasClass("checked")) {
            _Industry.remove($obj);
        } else {
            _Industry.add($obj);
        }
    },
    //单选
    addsingle: function($obj) {
        $obj = $($obj);
        var Indtext = $("#openId").val();
        var Indvalue = $("#hideId").val();
        $("#" + Indvalue).val($obj.data("value"));
        $("#" + Indtext).val($obj.text());
        gDialog.fClose();
    }

};
var _PhoneValidate = {
    init: function(type) {
        gDialog.fCreate({
                title: "手机验证",
                url: "/head/template/phonevalidate.html",
                backdrop: "normal",
                css: "login",
                modalId: "win-phonevalidate"
            })
            .show();
        //手机号验证
        $("#btn-phonecode").bind("click", function() { _PhoneValidate.timer(this, 50, type); });

        $("#mobile")
            .blur(function() {
                _PhoneValidate.checkMobileVcode(this, $("#validcode"), 1);
            });
        $("#validcode")
            .blur(function() {
                _PhoneValidate.checkMobileVcode($("#mobile"), this, 2);
            });
        $("#pcode")
            .blur(function() {
                if (!validator.number($("#pcode").val())) {
                    addFormError($("#pcode"), "手机验证码输入有误");
                } else {
                    addFormSuccess($("#pcode"));
                }
            });
        $("#ismobilevalidated")
            .click(function() {
                if ($(this).is(":checked")) {
                    $("#validate_error").html("");
                } else {
                    $("#validate_error").html("请选择我要使用此号码");
                }
            });
        $("#btn_phonevalidate")
            .click(function() {
                if (_PhoneValidate.checkMobileVcode($("#mobile"), $("#validcode"), 3)) {
                    var ismobilevalidated = 0;
                    if ($("#validate").val() == "1") {
                        if (!$("input[name=\"ismobilevalidated\"]").is(":checked")) {
                            $("#validate_error").html("请选择我要使用此号码");
                            return false;
                        } else {
                            $("#validate_error").html("");
                            ismobilevalidated = 1;
                        }
                    }
                    if (!validator.number($("#pcode").val())) {
                        addFormError($("#pcode"), "手机验证码输入有误");
                        return false;
                    } else {
                        addFormSuccess($("#pcode"));
                    }
                    $(this).html("正在处理，请稍后...").removeAttr("disabled");

                    //return false;
                    $.ajax({
                        type: "post",
                        url: "/uc/phoneValidate",
                        data: {
                            mobile: $("#mobile").val(),
                            validcode: $("#validcode").val(),
                            pcode: $("#pcode").val(),
                            ismobilevalidated: ismobilevalidated
                        },
                        //contentType:'application/json; charset=utf-8',
                        success: function(data) {
                            $("#btn_phonevalidate").html("验证").removeAttr("disabled");
                            if (data.code == 1) {
                                if (data.SetCookie.length > 0) {
                                    _Form.setCookie(data);
                                }
                                gDialog.fClose("win-phonevalidate");
                                gDialog.fAlert(data.msg);
                            } else {
                                gDialog.fAlert(data.msg);
                            }
                        },
                        error: function() {
                            $("#btn_phonevalidate").html("验证").removeAttr("disabled");
                            gDialog.fAlert("认证失败，请稍后再试");
                        }
                    });
                }

            });
    },
    timer: function(o, wait, type) {
        if (wait == 50) {
            var mobile = $("#mobile").val(), vcode = $("#validcode").val();
            var flag = true;
            if ($.trim(mobile).length <= 5) {
                addFormError($("#mobile"), "手机号不正确");
                return;
            }
            if ($.trim(vcode).length <= 0) {
                addFormError($("#validcode"), "验证码不可为空");
                return;
            }
            if (flag) {
                var data = {};
                if (type == "2") {
                    data = { mobile: mobile, code: vcode, action: 2 };
                } else {
                    data = { mobile: mobile, code: vcode };
                }
                $.ajax({
                    type: "post",
                    url: "/handlers/sms.ashx",
                    data: data,
                    success:
                        function(result) {
                            if (result.code == 1) {
                                //_Form.showResult(result, $('#form_error'), '');
                            } else {
                                _Form.showResult(result, $("#form_error"), result.msg);
                            }
                        },
                    error: function(result) {
                        _Form.showResult(result, $("#form_error"), "手机验证码发送失败，请稍后再试...");
                    },
                    dataType: "json"
                });
            }
        }
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.value = "免费获取验证码";
            wait = 50;
            //$('#vcodeimg').click();
            //$('#validcode').val('');
        } else {
            //发送验证码到手机
            o.setAttribute("disabled", true);
            o.value = "重新发送(" + wait + ")";
            wait--;
            setTimeout(function() {
                    _PhoneValidate.timer(o, wait);
                },
                1000);
        }
    },
    hidemobileValidate: function() {
        $("#phonetip").html("");
        $("#mobilevalidated").hide();
        $("#ismobilevalidated").attr("checked", false);
        $("#ismobilevalidated").parent().removeClass("checked");
        $("#validate").val("0");
    },
    checkMobileVcode: function(mobile, vcode, type) {
        var result = false;
        mobile = $(mobile);
        vcode = $(vcode);
        $("#btn-phonecode").attr("disabled", true);
        var mflag = false, vflag = false;
        $.ajax({
            type: "post",
            async: false,
            cache: false,
            url: "/check/validateMobile/",
            data: { mobile: mobile.val() },
            success: function(data) {
                if (data.code == 1) {
                    mflag = true;
                    addFormSuccess(mobile);
                    if (data.ismobilevalidated == "1") {
                        $("#mobilevalidated").show();
                        $("#phonetip").html(data.msg);
                        $("#validate").val("1");
                    } else if (data.ismobilevalidated == "0") {
                        _PhoneValidate.hidemobileValidate();
                    }
                }
                if (data.code == 0) {
                    if (type == 1 || type == 3) {
                        addFormError(mobile, data.msg);
                    }
                }
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/check/vcode/",
                    data: { code: vcode.val() },
                    success: function(result) {
                        if (result.code == 1) {
                            vflag = true;
                            addFormSuccess(vcode);
                        }
                        if (result.code == 0) {
                            flag = false;
                            if (type == 2 || type == 3) {
                                addFormError(vcode, result.msg);
                            }
                        }
                    },
                    error: function() {},
                    dataType: "json"
                });
            },
            error: function() {},
            dataType: "json"
        });
        if (mflag && vflag) {
            $("#btn-phonecode").attr("disabled", false);
            result = true;
        }
        return result;
    }
};
var _EmailValidate = {
    send: function($obj, wait) {
        $obj = $($obj);
        var email = $obj.data("email");
        var data = "&email=" + email;
        var flag = false;
        if (wait == 50) {
            $.ajax({
                type: "post",
                async: false,
                cache: false,
                url: "/uc/Myemail/",
                data: data,
                success: function(result) {
                    if (result) {
                        if (result.code == 1) {
                            if (email == result.email) {
                                flag = true;
                            }
                        }
                    }
                },
                error: function() { flag = false; },
                dataType: "json"
            });
            if (flag == true) {
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/uc/Validatemail/",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                gDialog.fAlert("验证码已发送至邮箱，请到邮箱进行验证");
                            } else {
                                gDialog.fAlert(result.msg);
                                wait = 0;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
            } else {
                gDialog.fAlert("发送失败");
            }
        }
        if (wait == 0) { //wait=50
            //$obj.attr('disabled', false);
            $obj.attr("onclick", " _EmailValidate.send(this, 50)");
            //$obj.unbind('click').unbind('click').bind('click', function () { _EmailValidate.send($obj, 50) });
            $obj.html("邮箱认证");
            wait = 50;
        } else {
            //$obj.attr("disabled", true);
            $obj.attr("onclick", "return false");
            //$obj.unbind('click').bind('click', function () { return false;});
            $obj.html("重新发送(" + wait + ")");
            wait--;
            setTimeout(function() {
                    _EmailValidate.send($obj, wait);
                },
                1000);
        }
    },
    Delete: function() {
        var top_email_validate = $("#top_email_validate");
        if (top_email_validate.length > 0) {
            top_email_validate.remove();
        }
    }
};
var _Form = {
    init: function() {
        jsondata = dictionary;
        jsondata = jsondata.dictionary;
        //类型为dropdown控件
        var input = $("[mode=\"dropdown\"]");
        for (var i = 0; i < input.length; i++) {
            for (var j = 0; j < jsondata.length; j++) {
                if ($(input[i]).data("dic") == jsondata[j].t) {
                    var options = jsondata[j].tags;
                    for (var k = 0; k < options.length; k++) {
                        var option = $("<option></option>");
                        option.val(options[k].id).text(options[k].text);
                        //addoptions(options[k], $(input[i]));
                        if (options[k].hasOwnProperty("tags")) {

                            var select = $("<select></select>");

                            for (var o = 0; o < options[k].tags.length; o++) {
                                $("<option></option>")
                                    .val(options[k].tags[o].id)
                                    .text(options[k].tags[o].text)
                                    .appendTo(select);
                            }
                            option.append(select);
                        }
                        option.appendTo($(input[i]));
                    }
                }
            }
        }

        //类型为tags控件
        var tagjson = "";
        input = $("[mode=\"tags\"]");
        for (var i = 0; i < input.length; i++) {
            for (var j = 0; j < jsondata.length; j++) {
                if ($(input[i]).data("dic") == jsondata[j].t) {
                    var options = jsondata[j].tags;

                    for (var k = 0; k < options.length; k++) {
                        tagjson = tagjson + ",\"" + options[k].text + "\"";
                    }
                }
            }
        }
        if (tagjson.length > 0) {
            tagjson = "[" + tagjson.substr(1) + "]";

            select2Api("请输入", 0, true, input);
        }

        var tagjson = "";
        input = $("[mode=\"list\"]");
        //console.log(input.data('dshow'));
        for (var i = 0; i < input.length; i++) {
            var item = $(input[i]);
            var multiple = item.data("multiple");
            select2Api(item.data("dshow"),
                0,
                multiple,
                item,
                item.data("hidden"),
                item.data("posturl"),
                item.data("postname"));
        }


        _Form.handleSelect2();
        //类型为radio控件
        input = $("[mode=\"radio\"]");
        for (var i = 0; i < input.length; i++) {
            for (var j = 0; j < jsondata.length; j++) {
                if ($(input[i]).data("dic") == jsondata[j].t) {
                    var options = jsondata[j].tags;
                    var name = $(input[i]).attr("name");
                    for (var k = 0; k < options.length; k++) {
                        var label = $("<label></label>").text(options[k].text);
                        var div = $("<div class=\"radio\"></div>");
                        var span = $("<span class=\"checked\"></span>");
                        var radio = $("<input type=\"radio\" name=\"" + name + "\">").val(options[k].id);
                        span.append(radio);
                        div.append(span);
                        label.append(div);
                        $(input[i]).append(label);
                    }
                }
            }
        }
        //类型为checkbox控件
        input = $("[mode=\"checkbox\"]");
        for (var i = 0; i < input.length; i++) {
            for (var j = 0; j < jsondata.length; j++) {
                if ($(input[i]).data("dic") == jsondata[j].t) {
                    var options = jsondata[j].tags;
                    var name = $(input[i]).attr("name");
                    for (var k = 0; k < options.length; k++) {
                        var label = $("<label></label>");
                        var div = $("<div class=\"checker\"></div>");
                        var span = $("<span class=\"\"></span>");
                        var radio = $("<input type=\"checkbox\" name=\"" + name + "\">").val(options[k].id);
                        span.append(radio);
                        div.append(span);
                        label.append(div).append(options[k].text);
                        $(input[i]).append(label);
                    }
                }
            }
        }
        handleUniform();
        /*注册验证事件*/
        jQuery.validator.addMethod("checkEmail",
            function(value, element) {
                var data = "&email=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/index.php/Register/checkEmail/",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                flag = true;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
                return flag;
            },
            "对不起，这个邮箱已经被使用");

        jQuery.validator.addMethod("mobile",
            function(value, element) {
                var length = value.length;
                var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            },
            "请填写真实的手机号码！");

        jQuery.validator.addMethod("dateint",
            function(value, element) {
                var data = /^\d{6,8}$/;
                return this.optional(element) || (data.test($.trim(value)));
            },
            "请按正确的时间格式！");

        // 电话号码验证       
        jQuery.validator.addMethod("isTel",
            function(value, element) {
                var tel = /^\d{3,4}-?\d{7,9}$/; //电话号码格式010-12345678   
                return this.optional(element) || (tel.test(value));
            },
            "请正确填写您的电话号码");

        jQuery.validator.addMethod("checkUsername",
            function(value, element) {
                var data = "&username=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/check/username/",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                flag = true;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
                return flag;
            },
            "对不起，这个用户名已经被注册了，换一个吧");

        jQuery.validator.addMethod("abcor123",
            function(value, element) {
                var rules = /^[a-zA-Z0-9_]+$/;
                return /^[a-zA-Z0-9_]+$/.test(value);
                //............
            },
            "只能使用数字、字母和“_”");

        //验证码验证
        jQuery.validator.addMethod("checkValidcode",
            function(value, element) {
                var data = "&code=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/index.php/Login/chkcode",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                flag = true;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
                return flag;
            },
            "验证码输入有误!");

        jQuery.validator.addMethod("checkMobileVcode",
            function(value, element) {
                var data = "&code=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/check/mobile/",
                    data: { mobile: value },
                    success: function(result) {
                        //if (result) {if (result.code == 1) { flag = true; }}
                        if (result.code == 1) {
                            addFormSuccess($("#mobile"));
                            $.ajax({
                                type: "post",
                                async: false,
                                cache: false,
                                url: "/check/vcode/",
                                data: { code: $("#validcode").val() },
                                success: function(result) {
                                    //if (result) {if (result.code == 1) { flag = true; }}
                                    //data = result;
                                    if (result.code == 1) {
                                        addFormSuccess($("#validcode"));
                                        $("#btn-phonecode").attr("disabled", false);
                                    }
                                    if (result.code == 0) {
                                        addFormError($("#validcode"), result.msg);
                                        flag = true;
                                    }
                                },
                                error: function() { addFormError($("#validcode"), "验证码输入有误"); },
                                dataType: "json"
                            });
                        }
                        if (result.code == 0) {
                            addFormError($("#mobile"), result.msg);
                        }
                    },
                    error: function() { addFormError($("#mobile"), "手机号输入有误"); },
                    dataType: "json"
                });
                return flag;
            },
            "输入验证码或手机号有误!");

        //验证手机号是否被占用
        jQuery.validator.addMethod("checkMobile",
            function(value, element) {
                var data = "&mobile=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/check/mobile/",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                flag = true;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
                return flag;
            },
            "手机号已被占用!");

        // 联系电话(手机/电话皆可)验证
        jQuery.validator.addMethod("isPhone",
            function(value, element) {
                var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))\d{8})$/;
                var tel = /^\d{3,4}-?\d{7,9}$/;
                return (tel.test(value) || mobile.test(value));
            },
            "请正确填写您的联系电话");

        // 邮政编码验证       
        jQuery.validator.addMethod("isZipCode",
            function(value, element) {
                var tel = /^[0-9]{6}$/;
                return this.optional(element) || (tel.test(value));
            },
            "请正确填写您的邮政编码");

        // 字符验证       
        jQuery.validator.addMethod("stringCheck",
            function(value, element) {
                return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
            },
            "只能包括中文字、英文字母、数字和下划线");


        jQuery.validation.addMethod("checkEmail",
            function(value, element) {
                var data = "&email=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/index.php/Register/checkEmail/",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                flag = true;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
                return flag;
            });

        jQuery.validation.addMethod("dateint",
            function(value, element) {
                var data = /^\d{6,8}$/;
                return data.test($.trim(value));
            });


        //身份证验证
        jQuery.validation.addMethod("idcard",
            function(value, element) {
                var idcard = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                return idcard.test(value);
            });

        jQuery.validation.addMethod("passport",
            function(value, element) {
                var idcard = /^1[45][0-9]{7}|G[0-9]{8}|P[0-9]{7}|S[0-9]{7,8}|D[0-9]+$/;
                return idcard.test(value);
            });

        // 电话号码验证       
        jQuery.validation.addMethod("isTel",
            function(value, element) {
                var tel = /^\d{3,4}-?\d{7,9}$/; //电话号码格式010-12345678   
                return (tel.test(value));
            });

        // 电话号码验证       
        jQuery.validation.addMethod("mobile",
            function(value, element) {
                var tel = /^1\d{10}$/; //电话号码格式010-12345678   
                return (tel.test(value));
            });

        jQuery.validation.addMethod("checkUsername",
            function(value, element) {
                var data = "&username=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/check/username/",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                flag = true;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
                return flag;
            });

        jQuery.validation.addMethod("abcor123",
            function(value, element) {
                var rules = /^[a-zA-Z0-9_]+$/;
                return /^[a-zA-Z0-9_]+$/.test(value);
                //............
            });

        //验证码验证
        jQuery.validation.addMethod("checkValidcode",
            function(value, element) {
                var data = "&code=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/index.php/Login/chkcode",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                flag = true;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
                return flag;
            });

        jQuery.validation.addMethod("checkMobileVcode",
            function(value, element) {
                var data = "&code=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/check/mobile/",
                    data: { mobile: value },
                    success: function(result) {
                        //if (result) {if (result.code == 1) { flag = true; }}
                        if (result.code == 1) {
                            addFormSuccess($("#mobile"));
                            $.ajax({
                                type: "post",
                                async: false,
                                cache: false,
                                url: "/check/vcode/",
                                data: { code: $("#validcode").val() },
                                success: function(result) {
                                    //if (result) {if (result.code == 1) { flag = true; }}
                                    //data = result;
                                    if (result.code == 1) {
                                        addFormSuccess($("#validcode"));
                                        $("#btn-phonecode").attr("disabled", false);
                                    }
                                    if (result.code == 0) {
                                        addFormError($("#validcode"), result.msg);
                                        flag = true;
                                    }
                                },
                                error: function() { addFormError($("#validcode"), "验证码输入有误"); },
                                dataType: "json"
                            });
                        }
                        if (result.code == 0) {
                            addFormError($("#mobile"), result.msg);
                        }
                    },
                    error: function() { addFormError($("#mobile"), "手机号输入有误"); },
                    dataType: "json"
                });
                return flag;
            });

        //验证手机号是否被占用
        jQuery.validation.addMethod("checkMobile",
            function(value, element) {
                var data = "&mobile=" + value;
                var flag = false;
                $.ajax({
                    type: "post",
                    async: false,
                    cache: false,
                    url: "/check/mobile/",
                    data: data,
                    success: function(result) {
                        if (result) {
                            if (result.code == 1) {
                                flag = true;
                            }
                        }
                    },
                    error: function() { flag = false; },
                    dataType: "json"
                });
                return flag;
            });

        // 联系电话(手机/电话皆可)验证
        jQuery.validation.addMethod("isPhone",
            function(value, element) {
                var mobile = /^((1[0-9]{2})\d{8})$/;
                var tel = /^d{3,4}-?d{7,9}$/;
                return (tel.test(value) || mobile.test(value));
            });

        // 验证是否为数字     
        jQuery.validation.addMethod("number",
            function(value, element) {
                var num = /^\d+$/;
                return (num.test(value));
            });

        // 邮政编码验证       
        jQuery.validation.addMethod("isZipCode",
            function(value, element) {
                var tel = /^[0-9]{6}$/;
                return (tel.test(value));
            });

        // 字符验证       
        jQuery.validation.addMethod("stringCheck",
            function(value, element) {
                return /^[\u0391-\uFFE5\w]+$/.test(value);
            });


        jQuery.extend(jQuery.validator.messages,
        {
            required: "字段不能为空",
            remote: "请修正确字段",
            email: "请输入正确格式的电子邮件",
            url: "请输入合法的网址",
            date: "请输入合法的日期",
            dateISO: "请输入合法的日期 (ISO).",
            number: "请输入合法的数字",
            digits: "只能输入整数",
            creditcard: "请输入合法的信用卡号",
            equalTo: "请再次输入相同的值",
            accept: "请输入拥有合法后缀名的字符串",
            maxlength: jQuery.validator.format("请输入一个长度最多是 {0} 的字符串"),
            minlength: jQuery.validator.format("请输入一个长度最少是 {0} 的字符串"),
            rangelength: jQuery.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
            range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
            max: jQuery.validator.format("请输入一个最大为 {0} 的值"),
            min: jQuery.validator.format("请输入一个最小为 {0} 的值")
        });
        /*注册验证事件*/

        //表单提交
        $(".form-submit")
            .click(function() {
                var btn = $(this);
                var formid = $(this).data("postform");
                if (formid == undefined || formid == "") {
                    formid = "form1";
                }
                var form1 = $("#" + formid);
                var error2 = $(".alert-danger", form1);
                var success2 = $(".alert-success", form1);
                var rulesAll = "";
                var ruleJsons = "{";
                var errorJsons = "{  ";
                var flag = false;
                $("#" + formid + " input,select,textarea")
                    .each(function() {
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
                //console.log(errorJsons);
                //console.log(ruleJsons);
                if ($.trim(errorJsons).length <= 2) {
                    errorJsons = "";
                    ruleJsons = "";
                }
                //return false;
                form1.validate({
                    errorElement: "span", //default input error message container
                    errorClass: "help-block help-block-error", // default input error message class
                    focusInvalid: true, // do not focus the last invalid input
                    ignore: "",
                    debug: true,
                    rules: ruleJsons == "" ? {} : eval("(" + ruleJsons + ")"),
                    messages: errorJsons == "" ? {} : eval("(" + errorJsons + ")"),
                    invalidHandler: function(event, validator) { //display error alert on form submit              
                        //success2.hide();
                        //error2.show();
                        //Metronic.scrollTo(error2, -200);
                        return false;
                    },

                    errorPlacement: function(error, element) { // render error placement for each input type
                        var id = $(element).attr("id"), errorText = error.text();
                        var icon = $(element).parent(".input-icon").children("i");
                        icon.removeClass("fa-check").addClass("fa-warning");
                        icon.attr("data-original-title", error.text()).tooltip({ 'container': "body" });
                        var errorContainer = $("#" + id + "_error");
                        if (errorContainer.length > 0) {
                            errorContainer.show();
                            errorContainer.html(errorText).show();
                        } else {
                            var errormsg = String.format("<span id=\"{0}_error\" class=\"help-block-error\">{1}</span>",
                                id,
                                errorText);
                            if ($(element).parent().children().hasClass("input-group-addon")) {
                                $(element).closest(".form-group").append(errormsg);
                            } else {
                                $(element).parent().append(errormsg);
                            }
                        }
                        //注册验证手机添加
                        /*
                        if ($(element).data('validateadd') == 'validateMobile') {
                            validateMobileVcode();
                            //$('#btn-phonecode').attr("disabled", true);
                        }
                        */
                    },

                    highlight: function(element) { // hightlight error inputs
                        $(element)
                            .closest(".form-group")
                            .removeClass("has-success")
                            .addClass("has-error"); // set error class to the control group   
                    },

                    unhighlight: function(element) { // revert the change done by hightlight

                    },

                    success: function(label, element) {
                        var icon = $(element).parent(".input-icon").children("i");
                        var id = $(element).attr("id");
                        $(element).closest(".form-group").removeClass("has-error").addClass("has-success");
// set success class to the control group
                        icon.removeClass("fa-warning").addClass("fa-check");
                        var errorContainer = $("#" + id + "_error");
                        if (errorContainer.length > 0) {
                            errorContainer.html("").hide();
                        }
                        //注册验证手机添加
                        /*
                        if ($(element).data('validateadd') == 'validateMobile') {
                            $('#btn-phonecode').attr("disabled", false);
                        }
                        */
                    },
                    submitHandler: function(form) {
                        var datas = form1.serialize();
                        //var password = $('#password');
                        //if (password) {
                        //    datas= replaceParamVal(datas, 'password', hex_sha1(password.val()));
                        //}
                        var l_result = "";
                        var errorid = $.trim(form1.data("error_id"));
                        if (errorid == "" || errorid == undefined) {
                            errorid = "form_error";
                        }
                        l_result = $("#" + errorid);
                        l_result.html("");
                        var submittype = form1.data("submittype");
                        if (submittype == "sigup") {
                            if (!$("#remember").is(":checked")) {
                                if (l_result.length > 0) {
                                    l_result.html("请同意网站注册协议");
                                }
                            }
                        }
                        //投资人认证
                        if (submittype == "certify") {

                            var Rinvestorty = $("#Rinvestorty input[type='radio']:checked").val();
                            var comemail = $.trim($("#comemail").val());
                            //var vcid = $.trim($('#vcid').val());
                            var vcname = $.trim($("#vcname").val());
                            var duty = $.trim($("#duty").val());
                            var invplan = $.trim($("#invplan").val());
                            //var projectids =$.trim( $('#projectids').val());
                            var projects = $.trim($("#projects").val());

                            var img = $(".form-group .fileinput-preview").find("img"), logourl = "";
                            if (img == "" || img == undefined || img.attr("src") == "" || img.attr("src") == undefined
                            ) {
                                img = $(".thumbnail").find("img");
                            }
                            if (img) {
                                logourl = img.attr("src");
                            }
                            datas = {
                                namecard: logourl,
                                Rinvestorty: Rinvestorty,
                                comemail: comemail,
                                vcname: vcname,
                                duty: duty,
                                invplan: invplan,
                                projects: projects
                            };
                        }
                        if (submittype == "userinfo") {
                            var edu = "";
                            $("input[name=\"school\"]")
                                .each(function() {
                                    var num = $(this).data("num");
                                    if (num > 0) {
                                        var school = $(this).val(),
                                            education = $("#education" + num).val(),
                                            dataid = $("#eduid" + num),
                                            id = "";
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
                            $("input[name=\"company\"]")
                                .each(function() {
                                    var num = $(this).data("num");
                                    if (num > 0) {
                                        company = $(this).val(), job = $("#job" + num).val(), dataid =
                                            $("#careers" + num), id =
                                            "";
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
                            if (img == "" || img == undefined || img.attr("src") == "" || img.attr("src") == undefined
                            ) {
                                img = $(".fileinput .fileinput-new.thumbnail").find("img");
                            }
                            if (img) {
                                logourl = img.attr("src");
                            }
                            datas = {
                                logo: logourl,
                                name: $("#name").val(),
                                nickname: $("#nickname").val(),
                                address: $("#address").val(),
                                addressID: $("#addressID").val(),
                                industrynames: $("#industrynames").val(),
                                industry: $("#industry").val(),
                                content: $("#content").val(),
                                edu: edu,
                                work: work,
                                wechat: $("#wechat").val(),
                                qq: $("#qq").val(),
                                email: $("#email").val(),
                                comname: $("#comname").val(),
                                uduty: $("#uduty").val()
                            };
                        }

                        var btnmsg = $.trim(form1.data("btnmsg")), changbtnvalue = false;
                        if (btnmsg == undefined || btnmsg == "") {
                            btnmsg = btn.html() + "|正在提交，请稍后...";
                        }
                        btnmsg = btnmsg.split("|");
                        if (btnmsg.length == 2) {
                            btn.html(btnmsg[1]).attr("disabled", "disabled");
                            changbtnvalue = true;
                        }
                        //return false;
                        $.ajax({
                            type: "post",
                            url: form1.attr("action"),
                            data: datas,
                            //contentType:'application/json; charset=utf-8',
                            success: function(data) {
                                if (changbtnvalue) {
                                    btn.html(btnmsg[0]).removeAttr("disabled");
                                }
                                if (data) {
                                    if (submittype == "login" || submittype == "loginpage") {
                                        _loginform.showResult(data, submittype, l_result);
                                    } else if (submittype == "mshow") {
                                        _Mshow.showResult(data);
                                    } else if (submittype == "resetpwd") {
                                        _ResetPwd.showResult(data);
                                    } else if (submittype == "certify") {
                                        _Form.showResult(data, l_result, "提交成功");
                                    } else if (submittype == "sigup") {
                                        _Form.showResult(data, l_result, "注册成功");
                                        if (data.code == 1) {
                                            _Form.setCookie(data);
                                            window.location.href = "/reg-success.shtml";
                                        }
                                        gDialog.fClose();
                                    } else if (submittype == "userinfo") {
                                        if (data.code == 1) {
                                            _Form.setCookie(data);
                                            gDialog.fAlert("保存成功");
                                        } else {
                                            l_result.html(data.msg);
                                        }
                                    } else if (submittype == "write") {
                                        _Form.showResult(data, l_result, "提交成功");
                                        $("#" + formid + " input,select,textarea").val("");
                                    } else if (submittype == "baoming") {
                                        _BaoMing.showResult(data, l_result);
                                    } else {
                                        if (data.code == 1) {
                                            //_User.init();
                                            gDialog.fClose();
                                            gDialog.fAlert("执行成功");
                                            //if (l_result) l_result.html('成功');
                                        } else {
                                            l_result.html(data.msg);
                                        }
                                    }
                                } else {
                                    //console.log('1');
                                }
                            },
                            error: function() {
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
            });
    },
    showResult: function(data, l_result, success_msg) {
        if (l_result) {
            if (data.code == 1) {
                //l_result.html(success_msg)
                gDialog.fAlert(success_msg);
                //setTimeout( l_result.html(''), 30000);

            } else {
                l_result.html(data.msg); //setTimeout(l_result.html(''), 3000);
            }
        }
    },
    setCookie: function(data) {
        if (data.code == 1) {
            var cookies = data.SetCookie;
            cookies.replace("\u0026", "&");
            var pedaily = getparam(cookiename, cookies),
                expires = getparam("expires", cookies),
                path = getparam("path", cookies),
                domain = getparam("domain", cookies);
            Cookies.Set(cookiename, pedaily, expires, path, domain);
            _User.init();
        }
    },
    handleSelect2: function() {
        if ($().select2) {
            $(".select-search")
                .select2({
                    placeholder: "Select",
                    allowClear: true
                });
        }
    }
};

function getparam(key, obj) {
    var reg = new RegExp(String.format("{0}=([^;]+)", key), "i");
    var r = obj.match(reg);
    var value = "";
    if (r != null) value = r[1];
    return value;
}

function replaceParamVal(data, key, value) {
    var targeData = "";
    if ((data.charAt(data.length - 1) == "&") == false) {
        data += "&";
    }
    var reg = "(" + key + "=).*?(&)";
    targeData = data.replace(/(password=).*?(&)/, "$1" + value + "$2");
    return targeData;
}

/*加载更多-start*/
function getTotalPage() {
    var totalcount;
    totalcount = $("#loadmore").data("totalcount"), pagesize = $("#loadmore").data("pagesize");
    if (pagesize == undefined) {
        pagesize = 20;
    }
    if (totalcount > 0 && pagesize > 0) {
        totalPage = Math.ceil(totalcount / pagesize);
    } //console.log('totalcount:'+totalcount+'pagesize:'+pagesize+'totalPage:'+totalPage);
    return totalPage;
}

var loading = false;

function addpageIndex(search, pageIndex) {
    var reg = /([\/|-]p)\d+/;
    search = reg.test(search) ? search.replace(reg, "$1" + pageIndex) : (search + "-p" + pageIndex);
    return search;
    //console.log(search);
}

function getMoreData(p, totalPage) {
    var loadmore = $("#loadmore");
    var controlsid = loadmore.data("controlsid");
    var search = addpageIndex(loadmore.data("search"), p);
    if (loading) return;
    loadmore.html("玩命加载中，请稍候...");
    $.ajax({
        type: "post",
        url: search, //search
        dataType: "text",
        success: function(result) {
            var datalist;
            if (controlsid != undefined && controlsid != "") {
                datalist = $("#" + controlsid);
            } else {
                datalist = $("#newslist");
            }
            loadmore.data("pageindex", Number(p));
            datalist.data("pageindex", Number(p));
            if (Number(p) == totalPage) {
                loadmore.hide();
            }
            loadmore.html("加载更多");
            if (datalist) {
                //console.log(result);
                var html = datalist.html() + result;
                datalist.html(html);
                _Control.init();
				callBackFunc();
            }
        },
        error: function(textStatus) {
            //console.log(textStatus);
        }
    });
}

function callBackFunc() {
    changeTarget();
}

function changeTarget() {
    if (bodyWidth <= 800) {
        $("a").each(function() { $(this).attr("target", "_self"); });
    }
}

//添加广告
function addAdver() {
    var listads = $(".adver_show");
    var obj =
        "<span style=\"vertical-align:middle; text-align:center;  padding-left:20px; background:url(http://static.pedaily.cn/images/ajaxloader.gif)left center no-repeat;\">广告加载中...</span>";;
    listads.each(function() {
        if ($(this).html().indexOf("BAIDU_CLB_fillSlot") > -1) {
            $(this).html(obj);
        }
    });

    //jQuery.getScript("http://static.pedaily.cn/head/js/m.js")
    jQuery.getScript("http://cbjs.baidu.com/js/m.js")
        .done(function() {
            /*--广告图片投放--*/
            var listads = $(".adver_show");
            listads.each(function() {
                var objid = $(this).attr("id");
                if (objid) {
                    var adverid = objid.split("_")[2];
                    if (isExitsFunction("BAIDU_CLB_fillSlotAsync")) {
                        BAIDU_CLB_fillSlotAsync(adverid, objid);
                    } else {
                        var func = "BAIDU_CLB_fillSlotAsync(" + adverid + "," + objid + ")";
                        setTimeout(func, 2000);
                    }
                }
            });

        })
        .fail(function() {

        });
}

function isExitsFunction(funcName) {
    try {
        if (typeof (eval(funcName)) == "function") {
            return true;
        }
    } catch (e) {
    }
    return false;
}

//top search
function buildSearch() {
    //var search_list = $("#search_type"), search_dis = $("#searchselectdis"), search_type = "", search_items = { "资讯": "news", "融资大事记": "invest", "项目": "project", "公司": "company", "机构": "vc", "创业者": "startup", "投资人": "investor" }, search_html = "";
    //$.each(search_items, function(k, v) { search_html += "<option value=\"" + v + "\">" + k + "</option>"; });
    //search_list.html(search_html);
    var searchFunc = function() {
        var searchTxt = $("#search_key"), searchBtn = $("#search_btn");
        if (searchTxt && searchBtn) {
            var searchTxtval = $.trim(searchTxt.val());
            if (searchTxtval.length < 2) {
                window.location.href = "/search";
                return;
            }
            window.location.href = "/search/k" + searchTxtval;
        }
    };
    $("#search_btn").click(searchFunc);
    $("#search_key")
        .keypress(function(e) {
            if (e.which == 13) {
                searchFunc();
            }
        });
}

$(function() {
    //top search
    buildSearch();
    _GetNews.init();
    //添加广告
    addAdver();
    /*加载更多Start*/
    $("#searchbutton").click(function() { keywordSearch($("#keyword").val()); });
    var totalPage = $("#loadmore").data("totalpage");
    var pageIndex = $("#loadmore").data("pageindex");
    var loadmore = $("#loadmore");
    if (Number(totalPage) == Number(pageIndex)) {
        loadmore.hide();
    }
    $("#loadmore")
        .click(function() {
            loadmore = $("#loadmore");
            //totalPage = getTotalPage()
            totalPage = Number(loadmore.data("totalpage"));
            if (totalPage == 1) {
                loadmore.hide();
            }
            var p = loadmore.data("pageindex");
            if (p.length == 0) {
                p = 1;
            }
            if (p <= 1) {
                var reg = new RegExp("(^|&)p=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) var obj = unescape(r[2]);
                if (obj > 1) {
                    p = obj;
                }
            }
            if (p != "" && p < totalPage) {
                getMoreData(p + 1, totalPage);
            }
        });
    /*加载更多End*/
    /*自媒体背景图自动切换Start*/
    var n = parseInt(11 * Math.random()) + 1;
    if (n < 10) {
        n = "0" + n;
    }
    //alert(n);
    var banner = $("#ubanner");
    if (banner) {
        banner.css("background-image", "url(/head/images/banner/0" + n + ".jpg)").css("background-size", "100%");
    }
    /*自媒体背景图自动切换End*/
});

/*加载更多-end*/

function keywordSearch(keyword) {
    var param = location.pathname;
    var m = "";
    var reg = /-k|\/k([^\-]*)/ig;
    if (keyword != "") {
        keyword = $.trim(keyword.replace("+", "``"));
        if (reg.test(param)) {
            param = param.replace(/(-?k)([^\-]*)/ig, "$1" + keyword);
        } else {
            if (validator.trim(param, "/").indexOf("/") == -1) {
                param = (param + "/k" + keyword + "/").replace("//", "/");
            } else {
                var len = param.length;
                if (param.charAt(param.length - 1) == "/")
                    len--;
                param = param.substring(0, len) + "-k" + keyword;
            }
        }
    } else if (reg.test(param)) {
        return;
    } else {
        param = param.replace(/\-?k([^\/]*)/ig, "");
    }
    if (param[param.length - 1] != "/")
        param += "/";
    param = param.replace("//", "/");
    location.href = param;
}

var validator = {
    isemail: function(v) { return /^(\w)+([\.\-]?\w)+@[\w\-]+((\.[\w\-]{2,3}){1,3})$/i.test(v); },
    decimal: function(v) { return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(v); },
    decimal2: function(v) { return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d{1,2})?$/.test(v); },
    number: function(v) { return /^\d+$/.test(v); },
    date: function(v) { return /^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(v); },
    isbn: function(v) { return /^(?=.{13}$)\d{1,5}([-])\d{1,7}\1\d{1,6}\1(\d|X)$/.test(v); },
    mobile: function(v) { return /^0{0,1}1(3|5|8)[0-9]{9}$/.test(v); },
    nickname: function(v) { return /^[a-zA-Z0-9\u4E00-\u9FA5\-_]+$/.test(v); },
    trim: function(v, s) {
        if (!s) {
            s = " ";
        }
        var reg = new RegExp("^" + s + "+|" + s + "+$", "g");
        return (v || "").replace(reg, "");
    },
    min: function(a, b) { return a < b ? a : b; },
    max: function(a, b) { return a > b ? a : b; },
    tel: function (v) { return /^\d{3,4}-?\d{7,9}$/.test(v); },
    fax: function(v) { return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/.test(v); },
    cnword: function(v) { return /^[^u4E00-u9FA5]$/.test(v); },
    isnickname: function(v) { return /^[0-9a-zA-Z\u4e00-\u9fa5_]{2,10}$/ig.test(v); }
};

var _Common = {
    addFormSuccess: function(element) {
        element = $(element);
        this.clean(element);
        element.closest(".form-group").removeClass("has-error");
        //$parent.append('<span class="' + window['succeedclass'] + '">' + okMsg + '</span>');
    },
    addFormError: function(element, errormsg) {
        element = $(element);
        this.clean(element);
        element.closest(".form-group").addClass("has-error");
        var inputgroup = element.parent(".input-group");
        var error = "<span class=\"error-info\">" + errormsg + "</span>";
        if (inputgroup.length > 0) {
            inputgroup.parent().append(error);
        } else {
            element.parent().append(error);
        }
        //element.parent().append('<span class="' + window['errorclass'] + '">' + errormsg + '</span>');
    },
    clean: function(element) {
        if (!window["errorclass"]) window["errorclass"] = "error-info";
        if (!window["succeedclass"]) window["succeedclass"] = "success-info";
        var parent = $(element).closest(".form-group");
        parent.find("." + window["errorclass"]).remove();
        parent.find("." + window["succeedclass"]).remove();
    }
};
$(function() {
    _User.init();
    _Control.init();
    FormWizard.init();
    _Form.init();
    Metronic.init();
    scollFocus.init($("#index-focus"));
    scollFocus.init($("#album-focus"));
    scollFocus.init($("#case-scoll-focus"));
    scollFocus.init($("#project-focus"));
    scollFocus.init($("#project-img-focus"));
    scollFocus.init($("#news-relate-focus"));
    handleMobiToggler();
    //Layout.init();
    //Layout.initOWL();
    //RevoslvciderInit.initRevoSlvcider();
    //Layout.initTwitter();
    //Layout.initFixHeaderWithPreHeader(); /* Switch On Header Fixing (only if you have pre-header) */
    //Layout.initNavScrolling();
    $("#header-navigation").find("li.m-header").each(function() { $(this).removeClass("active"); });
    var curl = document.location.href;
    if (curl.indexOf("/news") > 10 || curl.indexOf("/news/") > 10 || $("body").hasClass("news-show")) {
        $(".m-news").addClass("active");
    } else if (curl.indexOf("/activity") > 10) {
        $(".m-activity").addClass("active");
    } else if (curl.indexOf("/invest") > 10 ||
        curl.indexOf("/project") > 10 ||
        curl.indexOf("/company") > 10 ||
        curl.indexOf("/startup") > 10 ||
        curl.indexOf("/investor") > 10 ||
        curl.indexOf("/user") > 10 ||
        curl.indexOf("/mshow") > 10 ||
        curl.indexOf("/vc") > 10) {
        $(".m-data").addClass("active");
    } else {
        $(".m-home").addClass("active");
    }
	 newseed_hide_download();
	 changeTarget();
});

/*--手机端下载提示条--*/
function newseed_hide_download(){
	if (bodyWidth < 800) {
		if (!Cookies.Get("newseed_hide_download")) {
			$(".app-download-bottom").show();
		};

		$(".app-download-bottom, .app-download-close")
			.click(function() {
				$(".app-download-bottom").hide();
				Cookies.Set("newseed_hide_download", 1, 1, "/", ".pedaily.cn");
		});
	}
}
/*--手机端下载提示条end--*/


function addSharecount(evt) {
    var url = evt.data.url;
    var re = /\d{8}(\d+)\.shtml/;
    if (re.test(url)) {
        var rid = RegExp.$1;
        $.getJSON("/handlers/handler.ashx?action=addSharecount&rid=" + rid, "");
    }
}

var jiathis_config = {
    data_track_clickback: "true",
    title: ($("h1").length > 0 ? "【" + $("h1").text() + "】" : ""),
    pic: $("sharpic").attr("src"),
    summary: $("meta[name=description]").attr("content"),
    appkey: { "tsina": "372732463" },
    ralateuid: { "tsina": "pedaily" },
    evt: { "share": "addSharecount" }
};

//打开二维码
function openQrCode() {
    var url = document.location.href;
    var re = /\d{8}(\d+)\.shtml/;
    if (!re.test(url)) return;
    $.ajax({
        url: "/handlers/handler.ashx?action=getqrcode",
        type: "post",
        dataType: "json",
        data: { url: url },
        error: {},
        success: function(json) {
            if (json.success) {
                gDialog.fCreate({
                        title: "分享到微信朋友圈",
                        content: '<div style="overflow:hidden;text-align:center;padding:25px;"><img src="' +
                            json.src +
                            '" style="margin:5px auto;"/></div><div id="btnlist" class="m_10 txt_center">打开微信，点击底部的“发现”，使用 “扫一扫” 即可将网页分享到我的朋友圈。</div>',
                        backdrop: "normal",
                        css: "weixin-winbox",
                        modalId: "win-weixin"
                    })
                    .show();
            }
        }
    });
}

function wxshare() {
    var ua = window.navigator.userAgent.toLowerCase();
    //if (ua.match(/micromessenger/i) != "micromessenger"){
    //    return false;
    //}
    var smallimage = $("meta[name=ogimage]").attr("content");
        var Share = {
            title: document.title,
            desc: $("meta[name=description]").attr("content"),
            link: location.href.split("#")[0],
            imgurl: smallimage == undefined ? "http://pic2.pedaily.cn/201703/20170320@192401.jpg" : $("meta[name=ogimage]").attr("content")
        };
        var urlstr = location.href;
        $.ajax({
            url: "/wxshare/share",
            type: "post",
            data: { urlstr: encodeURIComponent(urlstr) },
            success: function(data) {
                if (data.code === 1) {
                    wx.config({
                        debug: false,
                        appId: 'wx325a969f4680e3e4',
                        timestamp: data.data.timestamp,
                        nonceStr: data.data.nonceStr,
                        signature: data.data.signature,
                        jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ']
                    });
                } 
            }
        });
        wx.ready(function() {
            wx.onMenuShareTimeline({
                title: Share.title,
                link: Share.link,
                imgUrl: Share.imgurl,
                success: function() {
                },
                cancel: function() {
                },
            });

            wx.onMenuShareAppMessage({
                title: Share.title,
                desc: Share.desc,
                link: Share.link,
                imgUrl: Share.imgurl,
                type: 'link', // 分享类型,music、video或link，不填默认为link
                dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                success: function() {
                },
                cancel: function() {
                }
            });
        });

        wx.onMenuShareQQ({
            title: Share.title,
            desc: Share.desc,
            link: Share.link,
            imgUrl: Share.imgurl,
            success: function() {
            },
            cancel: function() {
            }
        });
    
}