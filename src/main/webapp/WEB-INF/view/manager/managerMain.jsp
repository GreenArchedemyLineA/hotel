<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Full Calendar -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.print.min.css" rel="stylesheet" media="print">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css">

<!-- fullcalendar 언어 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>
<style>
/* .content {
	background-image: url("http://localhost:8080/images/mainImage.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	opacity: 0.4;
} */ 
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
			<p>매니저님 반갑습니다</p>
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
							<c:forEach items="${viewAll}" var="list">
								<div id="title--box">${list.startDate} ${list.title}</div>
							</c:forEach>
						</div>
					</div>
					
					<div class="content--box" id="question--box">
						<b class="title--box">문의사항</b>
						<c:choose>
							<c:when test="${question != 0}">
								<span style="color: red; font-weight: bold;">new</span>
								<div class="question--count"><a href="">답변을 기다리는 문의가 ${question} 개 있습니다</a></div>														
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
								<div><span class="no">사용 불가</span> ${notAvailableRoom}개</div>														
							</c:when>
							<c:when test="${notAvailableRoom == 0}">
								<div><span class="ok">사용 가능</span> ${availableRoom}개</div>														
							</c:when>
							<c:otherwise>
								<div><span class="ok">사용 가능</span> ${availableRoom}개    <span class="no">사용 불가</span> ${notAvailableRoom}개</div>	
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
</body>
<script>
	window.onload = function() {
		let todayDate = document.getElementById('date');
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth()+1;
		let date = today.getDate();
		
		document.querySelector('#date').innerHTML = year + "년&nbsp" + month + "월&nbsp" + date + "일"
		//document.write("오늘은" + year + "년" + month + "월" + date + "일 입니다")
	}
	
	// 매출 차트
	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('number', 'X');
	      data.addColumn('number', 'Dogs');

	      data.addRows([
	        [0, 0],   [1, 10],  [2, 23],  [3, 17],  [4, 18],  [5, 9],
	        [6, 11],  [7, 27],  [8, 33],  [9, 40],  [10, 32], [11, 35],
	        [12, 30], [13, 40], [14, 42], [15, 47], [16, 44], [17, 48],
	        [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
	        [24, 60], [25, 50], [26, 52], [27, 51], [28, 49], [29, 53],
	        [30, 55], [31, 60], [32, 61], [33, 59], [34, 62], [35, 65],
	        [36, 62], [37, 58], [38, 55], [39, 61], [40, 64], [41, 65],
	        [42, 63], [43, 66], [44, 67], [45, 69], [46, 69], [47, 70],
	        [48, 72], [49, 68], [50, 66], [51, 65], [52, 67], [53, 70],
	        [54, 71], [55, 72], [56, 73], [57, 75], [58, 70], [59, 68],
	        [60, 64], [61, 60], [62, 65], [63, 67], [64, 68], [65, 69],
	        [66, 70], [67, 72], [68, 75], [69, 80]
	      ]);

	      var options = {
	        hAxis: {
	          title: 'Time'
	        },
	        vAxis: {
	          title: 'Popularity'
	        }
	      };

	      var chart = new google.visualization.LineChart(document.getElementById('revenue--chart'));

	      chart.draw(data, options);
	    }

	
	// 회원 차트
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawColColors);

	function drawColColors() {
	      var data = new google.visualization.DataTable();
	      data.addColumn('timeofday', 'Time of Day');
	      data.addColumn('number', 'Motivation Level');
	      data.addColumn('number', 'Energy Level');
	
	      data.addRows([
	        [{v: [8, 0, 0], f: '8 am'}, 1, .25],
	        [{v: [9, 0, 0], f: '9 am'}, 2, .5],
	        [{v: [10, 0, 0], f:'10 am'}, 3, 1],
	        [{v: [11, 0, 0], f: '11 am'}, 4, 2.25],
	        [{v: [12, 0, 0], f: '12 pm'}, 5, 2.25],
	        [{v: [13, 0, 0], f: '1 pm'}, 6, 3],
	        [{v: [14, 0, 0], f: '2 pm'}, 7, 4],
	        [{v: [15, 0, 0], f: '3 pm'}, 8, 5.25],
	        [{v: [16, 0, 0], f: '4 pm'}, 9, 7.5],
	        [{v: [17, 0, 0], f: '5 pm'}, 10, 10],
	      ]);
	
	      var options = {
	        title: 'Motivation and Energy Level Throughout the Day',
	        colors: ['#9575cd', '#33ac71'],
	        hAxis: {
	          title: 'Time of Day',
	          format: 'h:mm a',
	          viewWindow: {
	            min: [7, 30, 0],
	            max: [17, 30, 0]
	          }
	        },
	        vAxis: {
	          title: 'Rating (scale of 1-10)'
	        }
	      };
	
	      var chart = new google.visualization.ColumnChart(document.getElementById('join--chart'));
	      chart.draw(data, options);
	    }
	
	
	// 예약 달력
	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2016-12-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2016-12-01'
				},
				{
					title: 'Long Event',
					start: '2016-12-07',
					end: '2016-12-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-12-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-12-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2016-12-11',
					end: '2016-12-13'
				},
				{
					title: 'Meeting',
					start: '2016-12-12T10:30:00',
					end: '2016-12-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2016-12-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2016-12-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2016-12-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2016-12-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2016-12-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'https://google.com/',
					start: '2016-12-28'
				}
			]
		});
		
	});
</script>
</html>
