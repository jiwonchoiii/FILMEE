$(function(){
	$(".poster > div").hover(function(){
		$(this).animate({
			bottom : '10px'
		},
		'fast');
	}, function(){
		$(this).animate({
			bottom : '0px'
		}, 
		'fast');
		});//poster > div.hover

});//jq