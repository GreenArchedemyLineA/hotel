<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/managerHeader.jsp"%>
<!-- writer -->
<form>
    <input type="text" name="name"/>
    <input type="submit" />
</form>
<table width="1200px">
    <thead>
        <tr>
            <th>예약자</th>
            <th>예약자-전화번호</th>
            <th>이용시작일</th>
            <th>이용종료일</th>
            <th>예약인원수</th>
            <th>방</th>
            <th>식당</th>
            <th>피트니스</th>
            <th>수영장</th>
            <th>스파</th>
            <th>패키지</th>
            <th>취소</th>
        </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${reservationList.size() != 0}">
            <c:forEach var="reservation" items="${reservationList}">
                <tr onclick="detailReservation(${reservation.id})" }>
                    <td>${reservation.user.name}</td>
                    <td>${reservation.user.tel}</td>
                    <td>${reservation.startDate}</td>
                    <td>${reservation.endDate}</td>
                    <td>${reservation.numberOfp}</td>
                    <td>${reservation.room.id != null ? reservation.id : ""} ${reservation.room != null ? "-" : ""} ${reservation.room.name != null ?  reservation.room.name : "❌"}</td>
                    <td>${reservation.dining.name != null ? reservation.dining.name : "❌"}</td>
                    <td>${reservation.fitnessId != null ? reservation.fitnessId : "❌"}</td>
                    <td>${reservation.poolId != null ? reservation.poolId : "❌"}</td>
                    <td>${reservation.spaId != null ? reservation.spaId : "❌"}</td>
                    <td>${reservation.h_package.name != null ? reservation.h_package.name : "❌"}</td>
                    <td><button onclick="deleteReservation(${reservation.id})">취소</button></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            예약리스트가 없습니다.
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<script>
    function detailReservation(id){
        let e = window.event;
        e.preventDefault();
        location.href = "/manager/reservation/" + id;
    }
    function deleteReservation(id){
        let e = window.event;
        e.cancelBubble = true;
        console.log(id)
        if(confirm("예약 삭제하시겠습니까? 복구 불가")){
            fetch("/manager/reservation/delete?id=" + id, ({
                method: "delete",
            }))
                .then(async (response) => {
                    let result = await response.json()
                    if(result.status_code == 200){
                        alert(result.msg)
                        location.href = result.redirect_uri;
                    }else{
                        alert(result.msg)
                    }
                })
        }
    }
</script>
</body>
</html>