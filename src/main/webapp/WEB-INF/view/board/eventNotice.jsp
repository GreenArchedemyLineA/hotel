<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
	<div class="content">
		<div class="main">
			<header>여짝에 리스트</header>		
			<div class="main--content">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">공지사항 작성</button>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">행사 제목</th>
							<th scope="col">행사 시작일</th>
							<th scope="col">행사 종료일</th>
							<th scope="col">행사 수정</th>
							<th scope="col">행사 삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${viewAll}" var="list">
							<tr>
								<td>${list.title}</td>
								<td>${list.startDate}</td>
								<td>${list.endDate}</td>
								<td><button onclick="eventDetail(${list.id})">수정</button></td>
								<td><button onclick="eventDelete(${list.id})">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="display: block; text-align: center;">
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
			</div>
		</div>
	</div>
	
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<div class="modal-header">
					<h4 class="modal-title">호텔 행사 일정을 작성하세요</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<div>
					<form action="/event/event-insert" method="post">
						<label>일정 시작 날짜</label> <input type="text" name="startDate" value="2015-10-13"> <br> <label>일정 종료 날짜</label> <input type="text" name="endDate" value="2015-10-13"> <br> <label>제목</label>
						<input type="text" name="title" value="asdsadasd"> <br> <label>내용</label> <input type="text" name="content" value="asdasdasdasd">
						<button type="submit" class="btn btn-primary">작성</button>
					</form>
				</div>
	
			</div>
		</div>
	</div>
</main>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/event/notice?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	function eventDetail(id){
		location.href = "/event/updateEventPage/"+id; 
	}
	function eventDelete(id){
		location.href = "/event/deleteEvent/"+id; 
	}
</script>

<%@ include file="../layout/footer.jsp"%>

