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
<div>
    <form>
        <label for="roomname">방 이름</label>
        <input type="text" name="roomname" id="roomname" value="${room.name}">
        <label for="roomprice">방 가격</label>
        <input type="text" name="roomprice" id="roomprice" value="${room.price}">
        <label for="roomavailability">방 사용 여부 가능</label>
        <input type="text" name="roomavailability" id="roomavailability" value="${room.availability}">
        <label for="description">방 내용</label>
        <input type="text" name="roomdescription" id="description" value="${room.description}">
        <label for="roomnumber_of_p">방 수용 인원</label>
        <input type="text" name="roomnumber_of_p" id="roomnumber_of_p" value="${room.numberOfp}">
        <button type="submit">수정</button>
    </form>
</div>

</body>
</html>