<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	width: 200px;
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
	<h2>일정</h2>
			<div class="main--content">
				<table class="table">
					<thead>
						<tr class="table--tr">
							<th scope="col">일정</th>
							<th scope="col">시작일</th>
							<th scope="col">종료일</th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${viewAll}" var="list">
							<tr class="table-tr">
								<td id="title--box">${list.title}</td>
								<td>${list.startDate}</td>
								<td>${list.endDate}</td>
								<td><button onclick="eventDetail(${list.id})" class="sub--button">수정</button></td>
								<td><button onclick="eventDelete(${list.id})" class="sub--button">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div style="display: block; text-align: center;" class="paging">
					<c:if test="${paging.startPage != 1}">
						<a href="/event/notice?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage}">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.nowPage}">
								<a href="/event/notice?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/event/notice?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
				<div class="button--box">
					<button type="button" class="sub-button" data-toggle="modal" data-target="#myModal">공지사항 작성</button>
				</div>
			</div>
		</div>
	
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<div class="modal-header">
					<h4 class="modal-title">호텔 행사 일정 작성</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<div>
<<<<<<< HEAD
					<form action="/event/event-insert" method="post">
						<label>일정 시작 날짜</label>
						<input type="text" name="startDate" value="2015-10-13">
						<br> 
						<label>일정 종료 날짜</label> 
						<input type="text" name="endDate" value="2015-10-13"> 
						<br> 
						<label>제목</label>
						<input type="text" name="title"> 
						<br> 
						<label>내용</label> 
						<input type="text" name="content" value="asdasdasdasd">
						<button type="submit" class="btn btn-primary">작성</button>
=======
					<form action="/event/event-insert" method="post" class="form--container">
						<div>
							<label>제목</label>
							<input type="text" name="title" value="asdsadasd" class="input--box"> 
						</div>
						<div>
							<label>내용</label> 
							<input type="text" name="content" value="asdasdasdasd" class="input--box">
						</div>
						<div>
							<label>시작일</label> 
							<input type="text" name="startDate" value="2015-10-13" class="input--box"> 
						</div>
						<div>
							<label>종료일</label> 
							<input type="text" name="endDate" value="2015-10-13" class="input--box">
						</div>
						<button type="submit" class="sub--button">작성</button>
>>>>>>> 6d8f4a5185a849b29afaeaf9ade24cd89464f6c7
					</form>
				</div>
			</div>
		</div>
	</div>
<script>
	function eventDetail(id){
		location.href = "/event/updateEventPage/"+id; 
	}
	function eventDelete(id){
		location.href = "/event/deleteEvent/"+id; 
	}
</script>

</body>
</html>

