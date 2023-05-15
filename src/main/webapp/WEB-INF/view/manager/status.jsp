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
        <tr>
            <th>방 이름</th>
            <th>방 가격</th>
            <th>방 사용 여부 가능</th>
            <th>방 내용</th>
            <th>방 상태 내용</th>
            <th>방 수용 인원</th>
        </tr>
        <c:forEach var="room" items="${roomList}">
            <tr onclick="statusDetail(${room.id})">
                <td>${room.name}</td>
                <td>${room.price}</td>
                <td>${room.availability}</td>
                <td>${room.description}</td>
                <td>${room.statusDesc}</td>
                <td>${room.numberOfp}</td>
            </tr>
        </c:forEach>
    </table>
<form>
    <h3>option</h3>
    <input type="checkbox" name="roomStatus">
    <input type="number" name="numberOfp" max="10" value="5">
    <input type="number" name="price">
    <input type="submit">
</form>
<script>
    function statusDetail(id){
        location.href = "/manager/roomStatusDetail?roomId="+id;
    }
</script>
</body>
</html>