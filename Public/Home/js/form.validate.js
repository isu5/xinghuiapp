$.extend($.fn, {
    fromvalidate: function (options) {
        var validation = new $.validation(options, this[0]);
        return validation;
    },
    checkUInput: function () {
        return $.validation.check();
    }
});
var submiting = false;
$.validation = function (options, form) {
    this.init(options, form);
};
$.extend($.validation, {
    bind: function (options, form) {
        $.validation.currentForm = $(form);
        $.validation.submitbtn = $.validation.currentForm.find(".submit");
        $.validation.errorclass = options.errorclass ? options.errorclass : "error-info";
        $.validation.succeedclass = options.succeedclass ? options.succeedclass : "success-info";
        $.validation.errordiv = options.errordiv ? options.errordiv : "error_div";
        $.validation.btnmsg = options.btnmsg ? options.btnmsg : "正在执行，请稍候...";
        $.validation.beforesubmit = options.beforesubmit;
    },
    check: function () {
        var form = this.currentForm;
        var errorclass = this.errorclass;
        form.find(":input.required, select.required, textarea.required").trigger("blur");
        if (form.find("." + errorclass).length > 0) {
            var scrollOffset = form.find("." + errorclass).eq(0).closest(".form-group").offset().top;
            $("body,html")
                .animate({
                    scrollTop: scrollOffset //让body的scrollTop等于pos的top，就实现了滚动  
                },
                    500);
            return false;
        }
        if (form.find("." + errorclass).length < 1) {
            if (this.beforesubmit) {
                if (!this.beforesubmit.call(this, form)) {
                    return false;
                }
            }
        }
        return form.find("." + errorclass).length <= 0;
    },
    optional: function (element) {
        var val = this.elementValue(element);
        return !$.validation.methods.required.call(this, val, element) && "dependency-mismatch";
    },
    elementValue: function (element) {
        var val,
            $element = $(element),
            type = element.type;

        if (type === "radio" || type === "checkbox") {
                return this.findByName(element.name).filter(":checked").val();
        }
        else if (type === "number" && typeof element.validity !== "undefined") {
            return element.validity.badInput ? false : $element.val();
        }

        val = $element.val();
        if (typeof val === "string") {
            return val.replace(/\r/g, "");
        }
        return val;
    },
    depend: function (param, element) {
        return this.dependTypes[typeof param] ? this.dependTypes[typeof param](param, element) : true;
    },
    dependTypes: {
        "boolean": function (param) {
            return param;
        },
        "string": function (param, element) {
            return !!$(param, element.form).length;
        },
        "function": function (param, element) {
            return param(element);
        }
    },
    checkable: function (element) {
        return (/radio|checkbox/i).test(element.type);
    },
    getLength: function (value, element) {
        switch (element.nodeName.toLowerCase()) {
            case "select":
                return $("option:selected", element).length;
            case "input":
                if (this.checkable(element)) {
                    return this.findByName(element.name).filter(":checked").length;
                }
        }
        return value.length;
    },
    findByName: function (name) {
        return $(this.currentForm).find("[name='" + name + "']");
    },
    HtmlStrip: function (html) {
        return html.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/'/g, "&#39;").replace(/"/g, "&quot;");
    },
    addMethod: function (name, method) {
        $.validation.methods[name] = method;
    },
    methods: {
        required: function (value, element, param) {
            if (element.nodeName.toLowerCase() === "select") {
                // could be an array for select-multiple or a string, both are fine this way
                var val = $(element).val();
                return val && val.length > 0;
            }
            if ($.validation.checkable(element)) {
                return $.validation.getLength(value, element) > 0;
            }
            return value.length > 0;
        },
        email: function (value) {
            value = $.trim(value);
            return /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/.test(value);
        },
        minlength: function (value, element, param) {
            value = $.trim(value);
            var e = $.isArray(value) ? value.length : $.validation.getLength($.trim(value), element);
            var r = $.validation.optional(element);
            return e >= param;
        },
        maxlength: function (value, element, param) {
            value = $.trim(value);
            var e = $.isArray(value) ? value.length : $.validation.getLength($.trim(value), element);
            return e <= param;
        },
        rangelength: function (b, c, d) {
            b = $.trim(b);
            var e = $.isArray(b) ? b.length : $.validation.getLength($.trim(b), c);
            d = eval(d);
            //console.log(d[0]);
            return e >= d[0] && e <= d[1];
        },
        url: function (a, b) {
            a = $.trim(a);
            return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(a);
        },
        date: function (a, b) {
            a = $.trim(a);
            return !/Invalid|NaN/.test(new Date(a).toString());
        },
        min: function (a, b, c) {
            return a >= c;
        },
        max: function (a, b, c) {
            return c >= a;
        },
        range: function (a, b, c) {
            c = eval(c);
            return a >= c[0] && a <= c[1];
        },
        equalTo: function (b, c, d) {
            var e = $(d);
            return b == $.trim(e.val());
        },
        mobile: function (value, b) {
            a = $.trim(value);
            return /^1\d{10}$/.test(value);
        },
        mobileorphone: function (value) {
            var mobile = /^1\d{10}$/;
            var tel = /^\d{3,4}-?\d{7,9}$/;
            return (tel.test(value) || mobile.test(value));
        },
        telephone: function (value) {
            var tel = /^\d{3,4}-?\d{7,9}(-\d{3,4})?$/;
            return tel.test(value);
        },
        vint: function (value) {
            var reg = /^\d+$/;
            return reg.test(value);
        },
        decimal: function (value) {
            var reg = /^(([1-9][1-9]*)(\.\d{1,2})?)|(0\.([1-9]\d)|(\d[1-9])|[1-9])$/;
            return reg.test(value);
        }

    },
    submit: function (options) {
        var currentForm = this.currentForm;
        //var currentForm = $.validation.currentForm;
        var errordiv = this.errordiv;
        var btn = this.submitbtn;
        var btndfault = btn.val();
        btn.val(options.btnmsg).attr("disabled", "disabled");
        var errordivcon = currentForm.find("#" + errordiv);
        if (errordivcon) errordivcon.html("");
        if (submiting) return false;
        submiting = true;
        $.ajax({
            type: "post",
            url: currentForm.attr("action"),
            data: currentForm.serialize().replace(/%3C/g, "%26lt%3B").replace(/%3E/g, "%26gt%3B"),
            success: function (data) {
                btn.val(btndfault).removeAttr("disabled");
                $.validation.showResult(data, errordivcon);
                if (options.aftersubmit) {
                    if (!options.aftersubmit.call(this, data)) {
                        submiting = false;
                        return false;
                    }
                }
                submiting = false;
            },
            error: function () {
                btn.val(btndfault).removeAttr("disabled");
                submiting = false;
            }
        });
    },
    showResult: function (data, lResult) {
        if (lResult) {
            if (data.code == 1) {
                //lResult.html(data.msg);
                //gDialog.fAlert(data.msg);
            } else {
                lResult.html("<i class=\"fa fa-exclamation-triangle\"></i> " + data.msg);
            }
        }
    },
    adderror: function (element, errorcontent) {
        element = $(element);
        this.clean(element);
        var errorclass = this.errorclass;
        element.closest(".form-group").addClass("has-error");
        var inputgroup = element.parent(".input-group");
        var error = "<span class=\"" + errorclass + "\">" + errorcontent + "</span>";
        if (inputgroup.length > 0) {
            inputgroup.parent().append(error);
        } else {
            element.parent().append(error);
        }
    },
    addsucceed: function (element) {
        this.clean(element);
        $(element).closest(".form-group").removeClass("has-error");
    },
    clean: function (element) {
        var errorclass = $.validation.errorclass;
        var succeedclass = $.validation.succeedclass;
        var $parent = $(element).closest(".form-group");
        $parent.find("." + errorclass).remove();
        $parent.find("." + succeedclass).remove();
    },
    prototype: {
        init: function (options, form) {
            $.validation.bind(options, form);
            var validator = this;
            form = $.validation.currentForm;
            var inputlist = form.find(":input.required, select.required, textarea.required"); //$('#'+ formid + " :input.required");
            inputlist.unbind("blur").unbind("keyup").unbind("focus");
            inputlist.blur(function () {
                var errordivcon = form.find("#" + $.validation.errordiv);
                if (errordivcon) errordivcon.html("");
                var tip = $(this).closest("form-group").find("help-block");
                if (tip)
                    if (tip.length > 0) {
                        tip.addClass("hide");
                    }
                var element = $(this);
                var rules = validator.getrules(this);
                var errors = validator.geterrors(this);
                var d, g;
                if (!!rules) {
                    for (var i = 0; i < rules.length; i++) {
                        var val = $.validation.elementValue(element);
                        d = rules[i].replace("\"", "").split(":")[0];
                        g = rules[i].replace("\"", "").split(":")[1];
                        var errorcontent = errors[i].split(":")[1];
                        try {
                            if ($.validation.methods[d].call(this, val, element[0], g)) {
                                $.validation.addsucceed(element);
                            } else {
                                $.validation.adderror(element, errorcontent);
                                break;
                            }
                        } catch (j) {
                            //console.log(j.message);
                        }
                    }
                }
            }).focus(function () {
                $.validation.addsucceed(this);
                var tip = $(this).closest("form-group").find("help-block");
                if (tip)
                    if (tip.length > 0) {
                        tip.removeClass("hide");
                    }
                //$(this).triggerHandler("blur");
            }); //end blur

            var $submit = form.find(".submit"); //$(formid + " .submit");
            var $reset = form.find(".reset"); //$(formid + " .reset");
            if ($submit.length > 0) {
                $submit.unbind('click').click(function () {
                    if ($.validation.check()) {
                        $.validation.bind(options, form);
                        $.validation.submit(options);
                    }
                });
            }
            if ($reset.length > 0) {
                //重置
                $reset.click(function () {
                    $(".formtips").remove();
                    form.find("input, select textarea").val("");
                });
            }
        },
        getrules: function (element) {
            try {
                if (element) return $(element).data("rules").split("$");
            }
            catch (exception) {
                console.log(element.id);
            }
        },
        geterrors: function (element) {
            try {
                if (element) return $(element).data("errors").split("$");
            }
            catch (exception) {
                console.log(element.id);
            }
        }
    }
});