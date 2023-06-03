<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<!-- Full Calendar -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.print.min.css" rel="stylesheet" media="print">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- fullcalendar 언어 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>
<style>
.content {
	background-image: url("http://localhost:8080/images/mainImage.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	opacity: 0.4;
}
#date {
	font-size: 40px;
	width: 100%;
	display: flex;
	justify-content: center;
	margin: 30px 0;
}

.main--container {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.content--container {
	display: flex;
	width: 100%;
	justify-content: center;
}

.event--box {
	display: flex;
	flex-direction: column;
	height: 100%;
	margin-top: 5px;
}

#event--box {
	width: 400px;
	height: 200px;
}

#title--box {
	margin: 3px;
}

.content--box {
	background-color: #ebebeb;
	margin: 10px;
	padding: 10px;
}

#question--box {
	height: 100px;
	margin-top: 20px;
}

#revenue {
	width: 700px;
	margin-top: 40px;
}

#reserve {
	width: 700px;
	height: 500px;
}

#join {
	margin-top: 20px;
}

.question--count {
	font-size: 20px;
	margin-top: 15px;
}

#question--count a:hover {
	text-decoration: none;
}

.dining, .fac, .room {
	display: flex;
	justify-content: space-between;
}

.check--box {
	color: black;
}

.check--box:hover {
	text-decoration: none;
	color: black;
}

.ok {
	color: #3366FF;
}

.no {
	color: #FF3E30;
}

.date--box {
	height: 500px;
}
</style>
<div class="main--container">
	<div id="date"></div>
	<div class="content--container">
		<div class="left--content">
			<div class="content--box" id="reserve">
				<b class="title--box">예약</b>
			</div>
			<div class="content--box" id="revenue">
				<b class="title--box">매출</b>
				<div id="revenue--chart"></div>
			</div>
		</div>
		<div class="center--content">
			<div class="content--box" id="event--box">
				<b class="title--box">일정</b>
				<div class="event--box">
					<c:forEach items="${event}" var="list">
						<div id="title--box">${list.startDate}${list.title}</div>
					</c:forEach>
				</div>
			</div>

			<div class="content--box" id="question--box">
				<b class="title--box">문의사항</b>
				<c:choose>
					<c:when test="${question != 0}">
						<span style="color: red; font-weight: bold;">new</span>
						<div class="question--count">
							<a href="">답변을 기다리는 문의가 ${question} 개 있습니다</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="question--count">답변을 기다리는 문의가 없습니다</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="content--box" id="join">
				<b class="title--box">가입</b>
				<div id="join--chart"></div>
			</div>

			<div class="content--box" id="">
				<b class="title--box">시설 상태 현황</b>
				<div class="room">
					<a href="" class="check--box">객실</a>
					<c:choose>
						<c:when test="${availableRoom == 0}">
							<div>
								<span class="no">사용 불가</span> ${notAvailableRoom}개
							</div>
						</c:when>
						<c:when test="${notAvailableRoom == 0}">
							<div>
								<span class="ok">사용 가능</span> ${availableRoom}개
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<span class="ok">사용 가능</span> ${availableRoom}개 <span class="no">사용 불가</span> ${notAvailableRoom}개
							</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="dining">
					<a href="" class="check--box">레스토랑</a>
					<c:choose>
						<c:when test="${restaurant == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="dining">
					<a href="" class="check--box">라운지 & 바</a>
					<c:choose>
						<c:when test="${bar == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="fac">
					<a href="" class="check--box">수영장</a>
					<c:choose>
						<c:when test="${pool == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="fac">
					<a href="" class="check--box">스파</a>
					<c:choose>
						<c:when test="${spa == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="fac">
					<a href="" class="check--box">피트니스</a>
					<c:choose>
						<c:when test="${fitness == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<script>
	window.onload = function() {
		let todayDate = document.getElementById('date');
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();

		document.querySelector('#date').innerHTML = year + "년&nbsp" + month
				+ "월&nbsp" + date + "일"
		//document.write("오늘은" + year + "년" + month + "월" + date + "일 입니다")
	}

	// 매출 차트
	 google.charts.load('current', {packages: ['corechart', 'bar']});
   google.charts.setOnLoadCallback(drawBasic);

   function drawBasic() {
    let data = new google.visualization.DataTable();
    data.addColumn('date', '날짜');
    data.addColumn('number', '매출 금액 (원)');
   /*  오늘 매출 : ${totalPrice} 원
	<c:forEach var="price" items="${price}" varStatus="status">
		<p> ${status.index+1}일전 매출 :${price}원</p>
	</c:forEach> */
	
    data.addRows([
     ['일', 10],
     ['월', 20],
     ['화', 3],
     ['수', 40],
     ['목', 5],
     ['금', 60],
     ['오늘', ${totalPrice}],
    ]);

    let options = {
     title: '매출 현황',
     hAxis: {
      title: '날짜',
      format: 'yyyy-mm-dd',
      viewWindow: {
       min: [7, 30, 0],
       max: [17, 30, 0]
      }
     },
     vAxis: {
      title: '매출'
     }
    };

    let chart = new google.visualization.ColumnChart(
    document.getElementById('revenue--chart'));

    chart.draw(data, options);
   } 


	// 회원 차트
	 google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	  var data = google.visualization.arrayToDataTable([
              ['Task', 'Hours per Day'],
              ['회원 가입', ${userTodayCount}],
              ['멤버쉽 가입', ${membershipTodayCount}]
            ]);

        var options = {
          title: '오늘 가입 회원'
        };

        var chart = new google.visualization.PieChart(document.getElementById('join--chart'));

        chart.draw(data, options);
      }
	
	// 예약 달력

</script>
<%@ include file="../layout/footer.jsp"%>
