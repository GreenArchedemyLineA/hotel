<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zzkxekb89f"></script>
<style>
.container {
	color: black;
}
header{
	font-size: 30px;
	color: black;
}
.content {
	display: flex;
}

.navi {
	display: flex;
	flex: 1;
}

.main {
	display: flex;
	flex-direction: column;
	flex: 3;
}
.navi{
	display: flex;
	height: 100vh;
	justify-content: center;
}
.content{
	display: flex;
	height: 100vh;
}
.main--content {
	border: 2px solid black;
	width: 1200px;
	height: 600px;
	margin-left: 30px;
	margin-top: 30px;
}

.navi--bar {
	border: 2px solid black;
	margin-top: 30px;
	width: 200px;
	height: 400px;
		
}
li{
	list-style: none;
}
</style>

	<div class="content">
		<div class="navi">
			<div class="navi--bar">
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
		<div class="main">
			<header>여짝에 이제 리스트 들을 띄어줄 생각입니다</header>
			<div id="map" class="main--content">
			
			</div>
		</div>
	</div>

<!-- <div>
<div id="map" style="width:600px;height:400px;"></div>
<div class=""></div>
</div> -->
<script>
$(document).ready(function(){
var mapOptions = {
    center: new naver.maps.LatLng(35.1595148,129.0602424),
    zoom: 17
};
var map = new naver.maps.Map('map', mapOptions);

var map = new naver.maps.Map(document.getElementById('map'), {
    center: new naver.maps.LatLng(35.1595148,129.0602424),
    zoom: 17
});
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.1595148,129.0602424),
    map: map
});
let apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+'Busan'+"&appid="+"b1b7f03c32e5f5f4ac70fb27ed83b55d";

	



});
</script>

</body>
</html>
