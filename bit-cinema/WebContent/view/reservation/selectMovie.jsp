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
	<form action="selectDate">
		<c:forEach var="movie" items="${list}">
		<input type="radio" name="movie" value="${movie}" id="1" /><label for="1">${movie}</label><br>
		</c:forEach>
		<br><br><button>다음</button>
	</form>
</div>





</body>
</html>