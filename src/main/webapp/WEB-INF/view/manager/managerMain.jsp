<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zzkxekb89f"></script>




<div id="map" style="width:600px;height:400px;"></div>


<script>
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

</script>

</body>
</html>
