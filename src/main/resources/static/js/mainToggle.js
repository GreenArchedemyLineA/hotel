/**
 * 
 */
		let timer;
		$(document).ready(function() {
			$(".toggle--box--room").click(function() {
				if(timer){
					clearTimeout(timer)
				}
				timer = setTimeout(function(){
					$(".navi--bar--detail--room").slideToggle("slow");
				}, 200)
			});
		});

		$(document).ready(function() {
			$(".toggle--box--fac").click(function() {
				// javascript 쓰로틀링
				if(timer){
					clearTimeout(timer)
				}
				timer = setTimeout(function(){
					$(".navi--bar--detail--fac").slideToggle("slow");
				}, 200)
				
			});
		});
		$(document).ready(function() {
			$(".toggle--box--reserve").click(function() {
				if(timer){
					clearTimeout(timer)
				}
				timer = setTimeout(function(){
					$(".navi--bar--detail--reserve").slideToggle("slow");
				}, 200)
			});
		});
		$(document).ready(function() {
			$(".toggle--box--qna").click(function() {
				$(".navi--bar--detail--qna").slideToggle("slow");
			});
		});