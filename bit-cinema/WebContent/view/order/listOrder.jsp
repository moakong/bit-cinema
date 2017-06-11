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
			<div>
				<c:import url="/view/include/mypageMenu.jsp" />
			</div>
			<div>
				주문번호 주문날짜<br>
				<c:forEach var="order" items="${orderList}">
					<c:out value="${order.orderId}"/>
					<c:out value="${order.orderDate}"/>
					<%-- <a href="${pageContext.request.contextPath}/order/DetailOrder?id=<c:out value="${cart.snackId}"/>">
						<img width="50px" height="50px" src="<c:out value="${cart.img}"/>"/></a>
					<c:out value="${cart.price}" />						
					<c:out value="${cart.count}" />
					<c:out value="${cart.amount}" /> --%>
					<br>
				</c:forEach>
				<hr>
					
			</div>
		
		
		
		
		
		<%-- 	<form action="payment" method="post">
			<img width="100px" height="100px" src="<c:out value="${snack.img}"/>"/>
			<input type="hidden" name="snackId" value="${snack.snackId}"/>
			<input type="hidden" name="count" value="${count}"/>
			<c:out value="${snack.name}"/>
			<c:out value="${count}"/>
			<c:out value="${price}"/>원<br>
			<input type="submit" onclick="return confirm('구매하시겠습니까?')" value="구매">
			<button><a href="../snack/DetailSnack?snackId=<c:out value='${snack.snackId}'/>">취소</a></button>
			</form> --%>
		</div>
		
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
</body>
</html>