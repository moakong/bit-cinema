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
	<h2>인원 선택</h2>
	<hr>
	
	<form action="selectSeat">
		<input type="hidden" name="schNo" value="${schNo}" >
		<c:forEach  var="i" begin="1" end="10" >
			<input type="radio" name="people" value="${i}" id="${i}" />
				<label for="${i}">${i}</label><br>
		</c:forEach>

		<br><br>
		<button>다음</button>
	</form>
	
</div>

</body>
</html>