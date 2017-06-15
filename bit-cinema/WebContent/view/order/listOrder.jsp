<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>
		
		<div>
			<div>
				<c:import url="/view/include/mypageMenu.jsp" />
			</div>
			<div>
				주문번호  상품명 주문날짜<br>
				<c:choose>
				<c:when test=" ${orderList.size()}==0">
					주문하신 상품이 없습니다.
				</c:when>
				<c:otherwise>
				<%-- <c:forEach var="i" begin="0" end="${ orderList.size() }" > --%>
				<c:forEach var="order" items="${ orderList }" varStatus="s">
					<c:out value="${order.orderId}"/>
					<img src="${img[s.index]}" width="50" height="50"/>
					<a href="${pageContext.request.contextPath}/order/DetailOrder?orderId=${order.orderId}">
					<c:out value="${title[s.index]}"/></a>
					<c:out value="${order.orderDate}"/>
					<br>
				</c:forEach>
				</c:otherwise>
				</c:choose>
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
		
	</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
</body>
</html>