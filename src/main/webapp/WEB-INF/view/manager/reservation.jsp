<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/managerHeader.jsp"%>
<!-- writer -->
<style>
.container {
	color: black;
}

header {
	font-size: 30px;
	color: red;
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

td, th, button {
	color: black;
}
</style>
<div class="content">
	<div class="navi">
		<div class="navi--bar">
			<ul>
				<li></li>
				<li></li>
			</ul>
		</div>
		</div>
		<div class="main">
			<header>여짝에 리스트</header>
			<div class="main--content">
				<form>
					<input type="text" name="name" /> 
					<input type="submit" />
				</form>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">예약자</th>
							<th scope="col">예약자-전화번호</th>
							<th scope="col">이용시작일</th>
							<th scope="col">이용종료일</th>
							<th scope="col">예약인원수</th>
							<th scope="col">방</th>
							<th scope="col">식당</th>
							<th scope="col">피트니스</th>
							<th scope="col">수영장</th>
							<th scope="col">스파</th>
							<th scope="col">패키지</th>
							<th scope="col">취소</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${reservationList.size() != 0}">
								<c:forEach var="reservation" items="${reservationList}">
									<tr onclick="detailReservation(${reservation.id})"}>
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
										<td>${reservation.h_package.name != null ? reservation.h_package.name : "❌"}</td>
										<td><button onclick="deleteReservation(${reservation.id})">취소</button></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
            예약리스트가 없습니다.
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