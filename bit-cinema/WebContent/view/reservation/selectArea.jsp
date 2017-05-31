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
		<c:forEach var="area" items="${areas}">
		<input type="radio" name="area" value="${area}" id="${area}" />
				<label for="${area}">${area}</label><br>
		</c:forEach>

		<br><br>
		<button>다음</button>
	</form>
	
</div>


</body>
</html>