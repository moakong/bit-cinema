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
		</div>
			<c:forEach var="order" items="${list}">
				<img width="100px" height="100px" src="<c:out value="${order.img}"/>"/>
				<c:out value="${order.name}"/>
				<c:out value="${order.count}"/>개
				<c:out value="${order.limitDate}"/>
				<input type="button" value="환불하기"/>
				
			</c:forEach>		
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
</body>
</html>