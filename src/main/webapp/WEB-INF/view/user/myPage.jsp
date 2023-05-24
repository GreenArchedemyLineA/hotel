<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#user--grade--wrap{
		display: flex;
	}
	#grade--name {
		flex: 1;
	}
	#grade--info {
		flex: 3;
		display: flex;
		flex-direction: column;
	}
	.hidden {
		display: none;
	}
</style>
	<main>
		<div>
			<div id="user--grade--wrap">
				<div id="grade--name">
					<p>${responseGrade.grade.name}</p>
				</div>
				<div id="grade--info">
					<p>${responseGrade.grade.description}</p>
					<p>${responseGrade.user.name}</p>
				</div>
			</div>
		</div>
		
		<button type="button" onclick="" id="userUpdate">회원 정보 수정</button>
		<button type="button" onclick="" id="coupons">쿠폰함(${coupons.size()})</button>
		<button type="button" onclick="" id="reservations">예약 현황</button>
		<button type="button" onclick="" id="qandA">QnA</button>
		
		<div id="myInfoDiv"></div>
	</main>
	<script src="/js/myinfo.js">

	</script>

</body>
</html>