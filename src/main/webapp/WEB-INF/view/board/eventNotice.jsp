<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp" %>
	
	<div class="container">
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    공지사항 작성
  </button>
	<div class="d-flex align-items-start">
	<div class="flex-grow-1">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">행사 제목</th>
					<th scope="col">행사 시작일</th>
					<th scope="col">행사 종료일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eventList" items= "${eventList}">
					<tr>
						<td>${eventList.title}</td>
						<td>${eventList.startDate}</td>
						<td>${eventList.endDate}</td>
						<td><button onclick="eventDetail(${eventList.id})">수정</button></td>
						<td><button onclick="eventDelete(${eventList.id})">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
			<label>일정 시작 날짜</label>
			<input type="text" name="startDate" value="2015-10-13">         
			<br>
			<label>일정 시작 날짜</label>
			<input type="text" name="endDate" value="2015-10-13">         
			<br>
			<label>제목</label>
			<input type="text" name="title" value="asdsadasd">         
			<br>
			<label>내용</label>
			<input type="text" name="content" value="asdasdasdasd">         
          <button type="submit" class="btn btn-primary">작성</button>
        </form>
        </div>
        
      </div>
    </div>
  </div>
  </div>
<script>
	function eventDetail(id){
		location.href = "/event/updateEventPage/"+id; 
	}
</script>
</body>
</html>