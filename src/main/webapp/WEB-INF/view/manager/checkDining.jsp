<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
	<div class="content">
		<form>
			<input type="date" name="date"> <input type="submit">
		</form>
		오늘 이용자: ${totalReservationNumOfP}명
		<div class="main--content">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>예약자이름</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dining" items="${diningList}">
						<tr>
							<td>${dining.id}</td>
							<td>${dining.startDate}</td>
							<td>${dining.dining.name}</td>
							<td>${dining.user.name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</main>
