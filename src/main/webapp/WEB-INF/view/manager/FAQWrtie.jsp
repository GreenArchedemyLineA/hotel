<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
.content {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
}
.sub-button {
	background-color: #000;
	color: #fff;
	width: 100px;
	height: 40px;
	margin: 20px 10px;
}
.button--box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	width: 100%;
}
.form--container {
	display: flex;
	flex-direction: column;
	align-items: center;
}
.input--box {
	border: none;
	border-bottom: 2px solid #ebebeb;
	margin: 10px;
}
.content {
	width: 100%; 
	display : flex;
}
</style>
<body>
<div class="content">
	<h2>FAQ</h2>
	<div class="main--content">
		<form method="post" action="/manager/faq/write-proc" class="form--container">
		    <input type="text" name="title" value="${faq.title}" class="input--box" placeholder="일정 제목을 입력하세요">
		    <input type="text" name="content" value="${faq.content}" class="input--box" placeholder="일정 내용을 입력하세요">
		    <input type="submit" value="등록" class="sub-button">
		</form>
	</div>
	
	</div>
</body>
</html>