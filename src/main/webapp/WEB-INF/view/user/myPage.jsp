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
	</main>
</body>
</html>