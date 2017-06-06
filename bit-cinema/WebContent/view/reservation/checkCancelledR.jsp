<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	
	<div>
		<h2>예매 취소 내역</h2>
		<a href="check">예매 내역</a>
		<hr><br>
		<div>
		<c:forEach var="rInfo" items="${list}">
			<p>
				예매번호 : ${rInfo.reservationId}<br><br>
				<strong>${rInfo.movieName}</strong><br>
				비트시네마 ${rInfo.screenName}<br>
				<fmt:formatDate value="${rInfo.startDate}" pattern="yyyy-MM-dd" /><br>
				${rInfo.startTime} ~ ${rInfo.endTime}<br>
				<button onclick="location.href='detailReservation?reservationId=${rInfo.reservationId}'" >상세 내역</button>
				<hr>
			</p>
		</c:forEach>
		</div>
		
		<br><br>
		<button onclick="location.href='${pageContext.request.contextPath}'" >메인 메뉴</button>
	</div>	
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>


<div>
	
</div>

</body>
</html>