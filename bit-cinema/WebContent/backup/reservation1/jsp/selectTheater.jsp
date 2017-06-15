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
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	

	<div>
		<h2>극장 선택</h2>
		<hr>
		
		<form action="selectDate">
			<input type="hidden" name="movieId" value="${movieId}">
			<c:forEach var="theater" items="${list}">
			<input type="radio" name="theaterId" value="${theater.theaterId}" id="${theater.theaterId}" />
					<label for="${theater.theaterId}">${theater.theaterName}</label><br>
			</c:forEach>
	
			<br><br>
			<button>다음</button>
		</form>
		
	</div>
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>