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
	<h2>지역 선택</h2>
	<hr>
	
	<form action="selectTheater">
		<input type="hidden" name="movieId" value="${movieId}">
		<c:forEach var="area" items="${list}">
		<input type="radio" name="area" value="${area.locationId}" id="${area.locationId}" />
				<label for="${area.locationId}">${area.locationName}</label><br>
		</c:forEach>

		<br><br>
		<button>다음</button>
	</form>
	
</div>


</body>
</html>