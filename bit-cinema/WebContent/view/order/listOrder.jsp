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
			<form action="payment" method="post">
			<img width="100px" height="100px" src="<c:out value="${snack.img}"/>"/>
			<input type="hidden" name="snackId" value="${snack.snackId}"/>
			<input type="hidden" name="count" value="${count}"/>
			<c:out value="${snack.name}"/>
			<c:out value="${count}"/>
			<c:out value="${price}"/>원<br>
			<input type="submit" onclick="return confirm('구매하시겠습니까?')" value="구매">
			<button><a href="../snack/DetailSnack?snackId=<c:out value='${snack.snackId}'/>">취소</a></button>
			</form>
		</div>
		
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
</body>
</html>