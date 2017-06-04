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
	<h2>예매 내역</h2>
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
	
	<button onclick="location.href='cancel'" >예매 취소</button><br><br>
	<button onclick="location.href='${pageContext.request.contextPath}'" >확인</button>

</div>

</body>
</html>