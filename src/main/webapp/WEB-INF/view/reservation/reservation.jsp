<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style type="text/css">
	.calender--container {
		width: 100vh;
	    margin: 0 auto;
	    display: flex;
	    flex-direction: row-reverse;
	    justify-content: center;
	    align-items: center;
	    height: 1100px;
	}
	
	#calender {
		width: 1000px;
	    height: 50px;
	    border: none;
	    font-size: 30px;
	    text-align: center;
	}
	
	.flatpickr-calendar {
		width: 1100px;
    	height: 900px;
	}
	
	.flatpickr-months {
		width: 100%;
	} 
	
	.flatpickr-innerContainer {
		width: 100%;
	}
	
	.flatpickr-rContainer {
		width: 100%;
	}
	.flatpickr-days {
		width: 100%;
	}
	
	.dayContainer {
		width: 100%;
		min-width: 100%;
		max-width: 100%;
	}
	
	.flatpickr-day {
		width: 150px;
	    max-width: 150px;
	    height: 100px;
	}
	.search--button {
		margin-top: 50px;
		width: 100px;
		height: 40px;
	}
	.count--container {
		margin-top: 50px;
	}
</style>
</head>
<body>
	<div class="calender--container">
		<form action="/search" method="post">
		 <input type="text" class="dateSelector" id="calender" name="date">
		 <div class="count--container">
			성인 
			<select name="countPerson">
				<option value="1">1</option>
				<option value="2">2</option>
			</select> 
			어린이 
			<select name="countChild">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
			</select> 
			유아 
			<select name="countBaby">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
			</select>
		</div>
		 <button class="search--button">검색</button>
		</form>
	</div>
	 
<!-- 예약 달력 script -->
<script>
	let dateSelector = document.querySelector('.dateSelector')
	console.log(dateSelector);
	$(".dateSelector").flatpickr({
		enableTime : false,
		dateFormat : "Y-m-d",
		mode: "range",
	    minDate: "today",
	    inline: true
	});	
</script>
</body>
</html>