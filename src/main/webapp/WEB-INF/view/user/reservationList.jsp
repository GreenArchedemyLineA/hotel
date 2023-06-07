<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/myPage.css" />
</head>
<body>
	<table class="table--container">
		<tr id="title--tr--container">
			<td>Check In</td>
			<td>Check Out</td>
			<td>Room</td>
			<td>Person</td>
			<td>Total Price</td>
			<td>Date</td>
			<td>Delete</td>
		</tr>
		<c:choose>
			<c:when test="${reservations == null}">
				<tr id="no--reservation">
					<td colspan="5"><h2>예약 내역이 없습니다.</h2></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${reservations}" var="list">
					<tr class="table--tr--container">
						<td>${list.startDate}</td>
						<td>${list.endDate}</td>
						<c:choose>
							<c:when test="${list.room.roomType.name ne null}">
								<td>${list.room.roomType.name}</td>
							</c:when>
							<c:otherwise>
								<td>${list.dining.name}</td>
							</c:otherwise>
						</c:choose>
						<td>${list.numberOfP}</td>
						<c:choose>
							<c:when test="${list.formatPrice() ne null}">
								<td>${list.formatPrice()}</td>
							</c:when>
							<c:otherwise>
								<td>현장결제</td>
							</c:otherwise>
						</c:choose>
						<td>${list.createdAt}</td>
						<td>
							<c:choose>
								<c:when test="">
									<form action="/pay/refund/${list.payTid}/${list.id}" method="post">
										<button type="submit">환불/ 예약 취소</button>
									</form>
								</c:when>
								<c:otherwise>
									<button type="button" id="dining--cancel" onclick="diningCancel(${list.id})">예약 취소</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1}">
			<a href="/myReservations?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="/myReservations?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/myReservations?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	<script type="text/javascript">
	    function deleteReservation(tid,totalPrice){
		    	location.href = "/pay/kakao/refund/"+tid+"/"+totalPrice; 
	    }
	    
	    function diningCancel(id) {
	    	fetch("/api/deleteDining?reservationId=" + id, ({
	    		method: "delete"
	    	})).then(async response => {
	    		let result = await response.json();
               	if(result.status_code == 200) {
                    alert(result.msg);
                } else {
                    alert(result.msg);
                }
                location.reload();
	    	});
	    }
	</script>
</body>
</html>
