<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
	<main>
		<h2>FaQ page</h2>
		<br/>
		<c:forEach var="faqList" items="${faqList}">
			<div>
				${faqList.title}
				<br />
				${faqList.content}
			</div>
		</c:forEach>
	</main>
</body>
</html>