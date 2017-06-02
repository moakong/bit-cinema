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
	<h2>날짜 선택</h2>
	<hr>
	
	<form action="selectTime">
			<input type="hidden" name="year" value="${year}">
			<input type="hidden" name="theaterId" value="${theaterId}">
			<input type="hidden" name="movieId" value="${movieId}">
		<c:forEach var="date" items="${dayList}">
			<input type="radio" name="date" value="${date}" id="${date}" />
					<label for="${date}">${date}</label><br>
		</c:forEach>
	
		<br><br>
		<button>다음</button>
	</form>
	
</div>


</body>
</html>