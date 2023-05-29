<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/managerHeader.jsp"%>
<!-- writer -->
<style>
.selected {
	display: flex;
	width: 500px;
	justify-content: space-between;
}
</style>
	<div class="content">
		<div class="main--content">
			<form action="/manager/reservation/update" method="post">
				<input type="hidden" name="id" value="${reservation.id}"> <input type="hidden" name="userId" value="${reservation.userId}"> <input type="hidden" name="startDate"
					value="${reservation.startDate}"> <input type="hidden" name="endDate" value="${reservation.endDate}"> <input type="hidden" name="numberOfp" value="${reservation.numberOfP}">
				<div>
					<div class="selected">
						<div class="reservation">예약자 이름</div>
						<div class="reservation">${reservation.user.name}</div>
					</div>
					<div class="selected">
						<div class="reservation">예약자 시작날짜</div>
						<div class="reservation">${reservation.startDate}</div>
					</div>
					<div class="selected">
						<div class="reservation">예약자 종료날짜</div>
						<div class="reservation">${reservation.endDate}</div>
					</div>
					<div class="selected">
						<div class="reservation">예약 인원 수</div>
						<div class="reservation">${reservation.numberOfP}</div>
					</div>
			
					<div class="selected">
						<div class="reservation">예약 방</div>
						<div class="reservation">
							<select name="roomId">
								<c:forEach var="room" items="${roomList}">
									<c:choose>
										<c:when test="${room.id == reservation.roomId}">
											<option value="${room.id}" selected>${room.id}-${room.roomType.name}</option>
										</c:when>
										<c:otherwise>
											<option value="${room.id}">${room.id}-${room.roomType.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
			
					<div class="selected">
						<div class="reservation">예약 식당</div>
						<div class="reservation">
							<select name="diningId">
								<option value=""></option>
								<c:forEach var="dining" items="${diningList}">
									<c:choose>
										<c:when test="${dining.id == reservation.diningId}">
											<option value="${dining.id}" selected>${dining.name}- ${dining.hours}</option>
										</c:when>
										<c:otherwise>
											<option value="${dining.id}">${dining.name}- ${dining.hours}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
			
					<div class="selected">
						<div class="reservation">예약 피트니스</div>
						<div class="reservation">
							<select name="fitnessId">
								<option value=""></option>
								<c:forEach var="fitness" items="${fitnessList}">
									<c:choose>
										<c:when test="${fitness.id == reservation.fitnessId}">
											<option value="${fitness.id}" selected>${fitness.hours}</option>
										</c:when>
										<c:otherwise>
											<option value="${fitness.id}">${fitness.hours}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
			
					<div class="selected">
						<div class="reservation">예약 수영장</div>
						<div class="reservation">
							<select name="poolId">
								<option value=""></option>
								<c:forEach var="pool" items="${poolList}">
									<c:choose>
										<c:when test="${pool.id == reservation.poolId}">
											<option value="${pool.id}" selected>${pool.hours}</option>
										</c:when>
										<c:otherwise>
											<option value="${pool.id}">${pool.hours}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
			
					<div class="selected">
						<div class="reservation">예약 스파</div>
						<div class="reservation">
							<select name="spaId">
								<option value=""></option>
								<c:forEach var="spa" items="${spaList}">
									<c:choose>
										<c:when test="${spa.id == reservation.spaId}">
											<option value="${spa.id}" selected>${spa.hours}</option>
										</c:when>
										<c:otherwise>
											<option value="${spa.id}">${spa.hours}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="selected">
						<div class="reservation">예약 패키지</div>
						<div class="reservation">
							<select name="packageId">
								<option value="" />
								<c:forEach var="pack" items="${packageList}">
									<c:choose>
										<c:when test="${reservation.packageId != null}">
											<c:when test="${pack.id == reservation.packageId}">
												<option value="${pack.id}" selected>${pack.name}</option>
											</c:when>
											<c:otherwise>
												<option value="${pack.id}">${pack.name}</option>
											</c:otherwise>
										</c:when>
										<c:otherwise>
											<option value="${pack.id}">${pack.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<input type="submit" value="수정">
			</form>
		</div>
	</div>
</main>

</body>
</html>