<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h2>시간 선택</h2>
	<hr>
	
	<form action="selectPeople">
		<c:forEach var="time" items="${list}">
		<input type="radio" name="time" value="${time.scheduleId}" id="${time.scheduleId}" />
				<label for="${time.scheduleId}">${time.screenName} : ${time.startTime} ~ ${time.endTime}</label><br>
		</c:forEach>
		
		<c:if test="${empty list}">
			해당 영화의 상영이 없습니다.
		</c:if>
		<br><br>
		<button>다음</button>
	</form>
	
</div>

</body>
</html>