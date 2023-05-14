<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
	<main>
		<form action="/loginProc" method="post">
			<input type="email" name="email">
			<input type="password" name="password">
			<input type="submit" value="login">
		</form>
	</main>
</body>
</html>