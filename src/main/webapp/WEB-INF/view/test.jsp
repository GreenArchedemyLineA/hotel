<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<form action="/managerSignInProc" method="post">
	<label>매니저 아이디 : </label>
	<input type="text" id="username" name="username" value="dodam@manager.com">
	<label>매니저 비밀번호 : </label>
	<input type="text" id="password" name="password" value="dodam1234">
	<button type="submit">login </button>

</form>
</body>
</html>