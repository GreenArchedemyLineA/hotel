
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zzkxekb89f"></script>
<style>
.container {
	color: black;
}

header {
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

.navi {
	display: flex;
	height: 100vh;
	justify-content: center;
}

.content {
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

li {
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
			<div>
				<form action="/manager/roomStatus/${room.id}" method="post">
					<label for="roomname">방 이름</label> 
					<input type="text" name="name" id="name" value="${room.roomType.name}"> 
					<br>
					<label for="roomprice">방 가격</label> 
					<input type="text" name="price" id="price" value="${room.roomType.price}">
					<br>
					<label for="roomavailability">방 사용 여부 가능</label>
					<input type="text" name="availability" id="availability" value="${room.availability}">
					<br>
					<label for="description">방 내용</label>
					<input type="text" name="description" id="description" value="${room.roomType.description}"> 
					<br>
					<label for="roomnumber_of_p">방 수용 인원</label> 
					<input type="text" name="number_of_p" id="number_of_p" value="${room.roomType.numberOfP}">
					<br>
					<button type="submit">수정</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>

