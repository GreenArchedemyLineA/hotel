<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://unpkg.com/mvp.css@1.12/mvp.css">
</head>
<body>
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
<script>
    function detailFAQForm(id){
        location.href = "/manager/faq/"+id;
    }
</script>
</body>
</html>