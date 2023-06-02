<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
.content {
	width: 100%; display : flex;
	justify-content: center;
	align-items: center;
}
.title--container {
	display: flex;
}
.table--tr {
	background-color: #ebebeb;
	height: 20px;
	text-align: center;
}

.table-tr {
	text-align: center;
	font-size: 20px;
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
	width: 60px;
	height: 30px;
}
.input--box {
	border: none;
	border-bottom: 2px solid #ebebeb;
	margin: 10px;
}
.search--container {
	display: flex;
	justify-content: flex-end;
}
.title--button {
	margin-top: 6px;
	margin-left: 20px;
}
.modal-content {
	width: 700px;
	height: 300px;
}
</style>
		<div class="content">
			<div class="title--container">
				<h2>회원 리스트</h2>
				<button class="sub-button title--button" data-toggle="modal" data-target="#myModal">차트</button>
			</div>
			<div class="main--content">
				<div class="search--container">
					<div>
						<form action="/manager/userNameList" method="get">
							<input type="text" name="name" class="input--box" placeholder="이름을 입력해주세요">
							<button type="submit" class="sub--button">검색</button>
						</form>
					</div>
				<div>
					<form action="/manager/userGradeList" method="get">
						<select name="gradeId" class="input--box">
							<option value="1">브라운</option>
							<option value="2">골드</option>
							<option value="3">다이아</option>
						</select>
						<button type="submit" class="sub--button">조회</button>
					</form>
				</div>
				</div>
				<div id="grade--chart"></div>
				<table class="table">
					<thead>
						<tr class="table--tr">
							<th scope="col">이름</th>
							<th scope="col">이메일</th>
							<th scope="col">전화번호</th>
							<th scope="col">생년월일</th>
							<th scope="col">정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${viewAll}">
							<tr>
								<td>${user.name}</td>
								<td>${user.email}</td>
								<td>${user.tel}</td>
								<td>${user.birth}</td>
								<td><button onclick="userDetail(${user.id})" class="sub-button">상세</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<div style="display: block; text-align: center;">
					<c:if test="${paging.startPage != 1}">
						<a href="/manager/userList?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage}">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.nowPage}">
								<a href="/manager/userList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/manager/userList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</main>
		<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<div class="modal-header">
					<h4 class="modal-title">회원 차트</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<div>	
					<div>
						<c:choose>
							<c:when test="${userTodayCount != null}">
								<div id="title--box">오늘 회원 가입 고객 ${userTodayCount}명</div>
							</c:when>
							<c:otherwise>
								<div id="title--box">오늘 회원 가입 고객이 없습니다</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<c:choose>
							<c:when test="${membershipTodayCount != null}">
								<div id="title--box">오늘 멤버쉽 가입 고객 ${membershipTodayCount}명</div>
							</c:when>
							<c:otherwise>
								<div id="title--box">오늘 멤버쉽 가입 고객이 없습니다</div>
							</c:otherwise>
						</c:choose>
							
					</div>

				</div>
			
			</div>
		</div>
	</div>
<script>
	function userDetail(id){
		// 유저 정보 확인과 등급 수정 할수 있는 페이지로
		location.href = "/manager/userDetail/"+id; 
	}
	
	let searchBtn = document.getElementById("search--btn");
	
	searchBtn.addEventListener("click", function() {
		let nameBoxValue = document.getElementById("name--search--box").value
		window.location.href="/manager/userNameList?name=" + nameBoxValue;
	});
	
	 google.charts.load('current', {'packages':['corechart']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {

       var data = google.visualization.arrayToDataTable([
         ['Task', 'Hours per Day'],
         ['Work',     11],
         ['Eat',      2],
         ['Commute',  2],
         ['Watch TV', 2],
         ['Sleep',    7]
       ]);

       var options = {
         title: 'My Daily Activities'
       };

       var chart = new google.visualization.PieChart(document.getElementById('grade--chart'));

       chart.draw(data, options);
     }
	
</script>
<%@ include file="../layout/footer.jsp"%>
