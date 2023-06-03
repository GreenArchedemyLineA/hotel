<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
.content {
	width: 100%; 
	display : flex;
	height: 100%;
	justify-content: center;
	align-items: center;
}

.sub--button {
	background-color: #FF9F8D;
	border: none;
	color: #fff;
	cursor: pointer;
	width: 60px;
	height: 30px;
}

.sub-button {
	background-color: #000;
	color: #fff;
	width: 40px;
	height: 30px;
	margin-left: 5px;
}
.input--box {
	border: none;
	border-bottom: 2px solid #ebebeb;
	margin: 10px;
}
.input--box:focus {
	outline: none;
}
.room--box {
	/* border: 4px solid #ebebeb; */
	border-radius: 10px;
	width: 300px;
	height: 120px;
	margin: 10px 20px;
	display: flex;
	flex-direction: column;
	padding: 15px;
}

.room--box:hover {
	background-color: #FEFAF1;
	cursor: pointer;
}

.room--total {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	width: 1300px;
	height: 700px;
}
#room-name {
	font-size: 20px;
	font-weight: bold;
}
.room-title {
	display: flex;
	justify-content: space-between;
	height: 60px;
}
.room-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
}
.form--container {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	width: 1000px;
}
.modal-content {
	width: 600px;
	height: 500px;
}
</style>
		<div class="content">
			<h2 >객실</h2>
				<form class="form--container">
					<div>
						<select name="numberOfP" class="input--box">
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					<input type="text" name="price" placeholder="금액을 입력하세요" class="input--box">
					</div>
					<div>
						<input type="checkbox" name="roomStatus"> 사용가능 객실만 보기<input type="submit" value="검색" class="sub-button">
					</div>
				</form>
	
				<div class="room--total">
					<c:forEach  var="room" items="${roomList}">
						<div class="room--box" data-toggle="modal" data-target="#myModal" style="${room.availability == true ? "border: 4px solid #9ACBF1" : "border: 4px solid #FF8D6B"}">		
							<div class="room-title">
								<span style="color: gray;">${room.id}</span>
								<span id="room-name">${room.roomType.name}</span> 
								<span>${room.roomType.numberOfP}인</span>
							</div>
							<div class="room-content">
								<div>${room.roomType.price}</div>
								<div id="room--status">${room.availability == true ? "사용가능" : "사용불가"}</div>
								<div>${room.statusDesc}</div>
							</div>	
								<c:if test="${reservation.size() != 0}">
									<c:forEach var="reservation" items="${reservationList}">
										<div>${reservation.user.name}</div>
									</c:forEach>
								</c:if>
						</div>
					</c:forEach>
				</div>
				
			</div>
	</main>
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<div class="modal-header">
					<h4 class="modal-title">호텔 행사 일정 작성</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<div>
					<form action="/manager/roomStatus/${room.id}" method="post">
				<label for="roomname">이름</label> 
				<input type="text" name="name" id="name" value="${room.roomType.name}"> 
				<br>
				<label for="roomnumber_of_p">인원</label> 
				<input type="text" name="number_of_p" id="number_of_p" value="${room.roomType.numberOfP}">
				<br>
				<label for="roomprice">가격</label> 
				<input type="text" name="price" id="price" value="${room.roomType.price}">
				<br>
				<label for="roomavailability">사용여부</label>
				<input type="text" name="availability" id="availability" value="${room.availability}">
				<br>
				<label for="description">상태</label>
				<input type="text" name="description" id="description" value="${room.roomType.description}"> 
				<br>
				<button type="submit">수정</button>
			</form>
				</div>
	
			</div>
		</div>
	</div>
<script>
    function statusDetail(id){
        location.href = "/manager/roomStatusDetail?roomId="+id;
    }

checkStatus();
</script>
