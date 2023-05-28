<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<div class="content">
	<div class="main--content">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="faq" items="${faqList}">
					<tr onclick="detailFAQForm(${faq.id})">
						<td>${faq.id}</td>
						<td>${faq.title}</td>
						<td>${faq.content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
	<script>
    function detailFAQForm(id){
        location.href = "/manager/faq/"+id;
    }
</script>
</body>
</html>