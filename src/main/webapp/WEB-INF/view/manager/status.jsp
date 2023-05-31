<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
.content {
	width: 100%; 
	display : flex;
	height: 100%;
	justify-content: center;
	align-items: center;
}
.table--tr {
	background-color: #ebebeb;
	height: 20px;
}

.table--tr, .table-tr {
	text-align: center;
}

#title--box {
	width: 600px;
}

.sub--button {
	background-color: #FF9F8D;
	border: none;
	color: #fff;
	cursor: pointer;
	width: 60px;
	height: 30px;
}
.button--box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	width: 100%;
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
						<div class="room--box" onclick="statusDetail(${room.id})" style="${room.availability == true ? "border: 4px solid #9ACBF1" : "border: 4px solid #FF8D6B"}">		
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
						</div>
					</c:forEach>
				</div>
				
			</div>
	</main>
<script>
    function statusDetail(id){
        location.href = "/manager/roomStatusDetail?roomId="+id;
    }

checkStatus();
</script>
</body>
</html>