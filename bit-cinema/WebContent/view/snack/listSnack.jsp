<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div>
				<c:import url="/view/include/snackMenu.jsp"/>
			</div>
			<div>
				<c:forEach var="snack" items="${list}">
				<a href ="DetailSnack?snackId=<c:out value='${snack.snackId}'/>">
					<img width="200px" height="200px" src="<c:out value="${snack.img}"/>"/><br>
				</a>	
					<c:out value="${snack.name}"/><br>
					<c:out value="${snack.price}"/><br>
					<hr>
				</c:forEach>
			</div>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
</body>
</html>