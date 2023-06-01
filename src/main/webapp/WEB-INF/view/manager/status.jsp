<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
		<div class="content">
			<div class="main--content">
				<button type="button" onclick="location.href='/manager/userList'">돌아가기</button>
				<form>
					<h3>option</h3>
					<input type="checkbox" name="roomStatus">
					<input type="number" name="numberOfP" max="10" value="5"> 
					<input type="number" name="price"> 
					<input type="submit">
				</form>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">방 이름</th>
							<th scope="col">방 가격</th>
							<th scope="col">방 사용유무</th>
							<th scope="col">방 상태</th>
							<th scope="col">방 수용 인원</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="room" items="${roomList}">
							<tr onclick="statusDetail(${room.id})">
								<td>${room.roomType.name}</td>
								<td>${room.roomType.price}</td>
								<td>${room.availability == true ? "사용가능" : "사용불가"}</td>
								<td>${room.statusDesc}</td>
								<td>${room.roomType.numberOfP}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="display: block; text-align: center;">
					<c:if test="${paging.startPage != 1}">
						<a href="/manager/roomStatus?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage}">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.nowPage}">
								<a href="/manager/roomStatus?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/manager/roomStatus?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</main>
<script>
    function statusDetail(id){
        location.href = "/manager/roomStatusDetail?roomId="+id;
    }
</script>
<%@ include file="../layout/footer.jsp"%>
