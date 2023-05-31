/**
 * 
 */
		let timer;
		$(document).ready(function() {
			$(".toggle--box--room").click(function() {
				if($(".navi--bar--detail--fac").show() || 
					$(".navi--bar--detail--reserve").show() ||
					$(".navi--bar--detail--qna").show()) {
						$(".navi--bar--detail--fac").hide();
						$(".navi--bar--detail--reserve").hide();
						$(".navi--bar--detail--qna").hide();
					}
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
				if($(".navi--bar--detail--room").show() || 
					$(".navi--bar--detail--reserve").show() ||
					$(".navi--bar--detail--qna").show()) {
						$(".navi--bar--detail--room").hide();
						$(".navi--bar--detail--reserve").hide();
						$(".navi--bar--detail--qna").hide();
					}
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
				if($(".navi--bar--detail--room").show() || 
					$(".navi--bar--detail--fac").show() ||
					$(".navi--bar--detail--qna").show()) {
						$(".navi--bar--detail--room").hide();
						$(".navi--bar--detail--fac").hide();
						$(".navi--bar--detail--qna").hide();
					}
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
				if($(".navi--bar--detail--room").show() || 
					$(".navi--bar--detail--fac").show() ||
					$(".navi--bar--detail--reserve").show()) {
						$(".navi--bar--detail--room").hide();
						$(".navi--bar--detail--fac").hide();
						$(".navi--bar--detail--reserve").hide();
					}
				if(timer){
					clearTimeout(timer)
				}
				timer = setTimeout(function(){
					$(".navi--bar--detail--qna").slideToggle("slow");
				}, 200)
			});
		});