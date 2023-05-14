<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<main>
		<form action="/myPage" method="post">
			<input type="email" name="email" readonly="readonly" value="${responseDto.email}">
			<input type="password" name="password" value="${responseDto.password}">
			<input type="text" name="name" readonly="readonly" value="${responseDto.name}">
			<input type="text" name="gender" readonly="readonly" value="${responseDto.gender}">
			<input type="text" name="birth" readonly="readonly" value="${responseDto.birth}">
			<input type="text" name="tel" value="${responseDto.tel}">
			<input type="submit" value="update">
		</form>
	</main>
</body>
</html>