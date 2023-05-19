<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<main>
		<div>
			<div>
				${responseGrade.grade.name}
				${responseGrade.grade.description}
				${responseGrade.user.name}
			</div>
		</div>
		<form action="/myPageProc" method="post">
			<input type="email" name="email" readonly="readonly" value="${responseUser.email}">
			<input type="password" name="password" value="${responseUser.password}">
			<input type="text" name="name" value="${responseUser.name}">
			<input type="text" name="gender" value="${responseUser.gender}">
			<input type="text" name="birth" value="${responseUser.birth}">
			<input type="text" name="tel" value="${responseUser.tel}">
			<input type="submit" value="update">
		</form>
		<div>
			<div>
			<h2>쿠폰 정보</h2>
			<c:forEach var="coupons" items="${coupons}">
				${coupons.name}
				${coupons.content}
				${coupons.startDate}
				${coupons.endDate}
			</c:forEach>
			</div>
		</div>
		<div>
			<h2>예약 정보</h2>
			<c:forEach var="list" items="${reservations}">
				${list.user.name}
				${list.startDate}
				${list.endDate}
				${list.numberOfP}
				${list.room.name}
				${list.room.price}
				${list.dining.name}
				${list.spa.name}
				${list.fitness.name}
				${list.h_package.name}
				${list.pool.name}
			</c:forEach>
		</div>
		<div>
			<h2>내가 한 질문 리스트</h2>
			<c:forEach var="qna" items="${qna}">
				<div>
					${qna.question.title}
					${qna.question.content}
					${qna.question.formatDate()}
					${qna.content}
					<br>
				</div>
			</c:forEach>
		</div>
	</main>
</body>
</html>