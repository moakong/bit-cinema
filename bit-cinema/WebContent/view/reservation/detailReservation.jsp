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

<!-- 
request.setAttribute("rInfo", r);
request.setAttribute("sList", sList);
-->
<div>
	<h1>상세 예매 내역</h1>
	<hr><br>
	<div>
	<strong>${rInfo.movieName}</strong><br>
	비트시네마 ${rInfo.screenName}<br>
	<fmt:formatDate value="${rInfo.startDate}" pattern="yyyy년 MM월 dd일" /><br>
	${rInfo.startTime} ~ ${rInfo.endTime}<br>
	<c:forEach var="seat" items="${sList}">
		[&#${seat.r + 64}-${seat.c}] 
	</c:forEach>
	<br><br>
	</div>
	
	<button onclick="location.href='cancel?reservationId=${rInfo.reservationId}'" >예매 취소</button><br><br>
	<button onclick="location.href='check'" >나의 예매내역</button>
</div>

</body>
</html>