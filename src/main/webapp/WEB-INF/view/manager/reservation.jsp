<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/managerHeader.jsp"%>
<style>
.content {
	width: 100%; display : flex;
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
	width: 100px;
	height: 40px;
}
.form--container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.input--box {
	border: none;
	border-bottom: 2px solid #ebebeb;
	margin: 10px;
}

</style>
	<div class="content">
		<h2>예약 리스트</h2>
			<form class="form--box">
				<input type="text" name="name" placeholder="예약자 이름을 입력하세요" class="input--box"/> 
				<input type="submit" value="검색" class="sub-button"/>
			</form>
		<div class="main">
			<div class="main--content">
				<table class="table">
					<thead>
						<tr class="table--tr">
							<th scope="col">이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">체크인</th>
							<th scope="col">체크아웃</th>
							<th scope="col">예약인원</th>
							<th scope="col">룸 타입</th>
							<th scope="col">식당</th>
							<th scope="col">피트니스</th>
							<th scope="col">수영장</th>
							<th scope="col">스파</th>
							<th scope="col">취소</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${reservationList.size() != 0}">
								<c:forEach var="reservation" items="${reservationList}">
									<tr onclick="detailReservation(${reservation.id})" class="table-tr">
										<td>${reservation.user.name}</td>
										<td>${reservation.user.tel}</td>
										<td>${reservation.startDate}</td>
										<td>${reservation.endDate}</td>
										<td>${reservation.numberOfP}</td>
										<td>${reservation.room.id != null ? reservation.id : ""}${reservation.room != null ? "-" : ""}${reservation.room.roomType.name != null ?  reservation.room.roomType.name : "❌"}</td>
										<td>${reservation.dining.name != null ? reservation.dining.name : "❌"}</td>
										<td>${reservation.fitnessId != null ? reservation.fitnessId : "❌"}</td>
										<td>${reservation.poolId != null ? reservation.poolId : "❌"}</td>
										<td>${reservation.spaId != null ? reservation.spaId : "❌"}</td>
										<td><button onclick="deleteReservation(${reservation.id})" class="sub--button">취소</button></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="11" class="table-tr">예약리스트가 없습니다.</td>
								</tr>
					        </c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
	    function detailReservation(id){
	        let e = window.event;
	        e.preventDefault();
	        location.href = "/manager/reservation/" + id;
	    }
	    function deleteReservation(id){
	        let e = window.event;
	        e.cancelBubble = true;
	        console.log(id)
	        if(confirm("예약 삭제하시겠습니까? 복구 불가")){
	            fetch("/manager/reservation/delete?id=" + id, ({
	                method: "delete",
	            }))
	                .then(async (response) => {
	                    let result = await response.json()
	                    if(result.status_code == 200){
	                        alert(result.msg)
	                        location.href = result.redirect_uri;
	                    }else{
	                        alert(result.msg)
	                    }
	                })
	        }
	    }
	</script>
</body>
</html>
	