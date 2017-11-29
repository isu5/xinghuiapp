$.fn.countTo = function(a) {
    a = a || {};
    return $(this).each(function() {
        var c = $.extend({},
        $.fn.countTo.defaults, {
            from: $(this).data("from"),
            to: $(this).data("to"),
            speed: $(this).data("speed"),
            refreshInterval: $(this).data("refresh-interval"),
            decimals: $(this).data("decimals")
        },
        a);
        var h = Math.ceil(c.speed / c.refreshInterval),
        i = (c.to - c.from) / h;
        var j = this,
        f = $(this),
        e = 0,
        g = c.from,
        d = f.data("countTo") || {};
        f.data("countTo", d);
        if (d.interval) {
            clearInterval(d.interval)
        }
        d.interval = setInterval(k, c.refreshInterval);
        b(g);
        function k() {
            g += i;
            e++;
            b(g);
            if (typeof(c.onUpdate) == "function") {
                c.onUpdate.call(j, g)
            }
            if (e >= h) {
                f.removeData("countTo");
                clearInterval(d.interval);
                g = c.to;
                if (typeof(c.onComplete) == "function") {
                    c.onComplete.call(j, g)
                }
            }
        }
        function b(m) {
            var l = c.formatter.call(j, m, c);
            f.html(l)
        }
    })
};
$.fn.countTo.defaults = {
    from: 0,
    to: 0,
    speed: 2500,
    refreshInterval: 100,
    decimals: 0,
    formatter: formatter,
    onUpdate: null,
    onComplete: null
};
function formatter(b, a) {
    return b.toFixed(0);
}
$("#count-number1").data("countToOptions", {
    formatter: function(b, a) {
        return b.toFixed(0).replace(/\B(?=(?:\d{3})+(?!\d))/g, ",")
    }
});
$("#count-number2").data("countToOptions", {
    formatter: function(b, a) {
        return b.toFixed(0).replace(/\B(?=(?:\d{3})+(?!\d))/g, ",")
    }
});
$("#count-number3").data("countToOptions", {
    formatter: function(b, a) {
        return b.toFixed(0).replace(/\B(?=(?:\d{3})+(?!\d))/g, ",")
    }
});

$(".count-title").each(count);
function count(a) {
    var b = $(this);
    a = $.extend({},
    a || {},
    b.data("countToOptions") || {});
    b.countTo(a)
};


$(document).ready(function(){
	$(window).bind("scroll", function(event){
		var fold = $(window).height() + $(window).scrollTop();
		var folds = $(document).scrollTop();
		$("#record").each(function(){			
			if( fold <= $(this).offset().top){			
				$(".count-title").each(count);
					function count(a) {
					    var b = $(this);
					    a = $.extend({},
					    a || {},
					    b.data("countToOptions") || {});
					    b.countTo(a)
					};						
			}
		});		
	});
	 
	$("#record").each(function(){
		if( $(window).height() > $(this).offset().top){		
			$(".count-title").each(count);
				function count(a) {
				    var b = $(this);
				    a = $.extend({},
				    a || {},
				    b.data("countToOptions") || {});
				    b.countTo(a)
				};			
		}	
	});
	
	//移动导航菜单
	$(".menu").find("i").click(function(){		

		$(".menu").find("i").addClass("active");
		$(".fixedpop").show();
		$(".menu div").show();
		$("#header #nav").show();
		$("#header #nav").animate({
			  	"right":'0px'
			},"slow");	
	});	
	
	$(".menu div").click(function(){
		$(".menu").find("i").removeClass("active");
		$(".fixedpop").hide();
		$(this).hide();
		$("#header #nav").animate({
			  	"right":'-75%'
		},"slow",function(){$("#header #nav").hide();});
	});
	
	$(".fixedpop").click(function(){
		$(".menu").find("i").removeClass("active");
		//$("#header #nav").hide();
		$(".fixedpop").hide();
		$(".menu div").hide();
		$("#header #nav").animate({
			  	right:'-999px'
		},"slow");

	});
	
	
	$("#nav li").find("i.icon").click(function(){
		if($(this).siblings("dl").is(":hidden")){
			$(this).html("&#xe632;");
			$(this).siblings("dl").slideDown(500).parents("li").siblings("li").find("dl").slideUp(500);
		}else{
			$(this).html("&#xe631;");
			$(this).siblings("dl").slideUp(500).parents("li").siblings("li").find("dl").slideDown(500);
		}
	});
	
});