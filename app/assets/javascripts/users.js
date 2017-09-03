$(document).ready(function() {
	$("input").click(function(){
		$(this).css("box-shadow", "0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24)");
	});

	$(".js--scroll-to-sunday").click(function(event){
		event.preventDefault();
		$("html, body").animate({
			scrollTop: $(".section-about-market").offset().top
		}, "slow");
	});

	$(".js--scroll-to--testimonies").click(function(event){
		event.preventDefault();
		$("html, body").animate({
			scrollTop: $(".section-testimonies").offset().top
		}, "slow");
	});

});

