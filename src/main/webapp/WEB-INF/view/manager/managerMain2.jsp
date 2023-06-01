<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
		<div class="content">
			<p>여짝에 이제 리스트 들을 띄어줄 생각입니다</p>
			<div id="map" class="main--content"></div>
		</div>
	</main>

	<script>
		$(document).ready(function() {
			var mapOptions = {
				center : new naver.maps.LatLng(35.1595148,
						129.0602424),
				zoom : 17
			};
			var map = new naver.maps.Map('map', mapOptions);
			var map = new naver.maps.Map(document.getElementById('map'), 
					{center : new naver.maps.LatLng(35.1595148, 129.0602424), zoom : 17});
			var marker = new naver.maps.Marker({position : new naver.maps.LatLng(35.1595148,129.0602424), map : map});
			let apiURI = "http://api.openweathermap.org/data/2.5/weather?q=" + 'Busan' + "&appid=" + "b1b7f03c32e5f5f4ac70fb27ed83b55d";});
	</script>

</body>
</html>
