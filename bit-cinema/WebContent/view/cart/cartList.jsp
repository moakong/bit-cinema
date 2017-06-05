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
				<c:import url="/view/include/mypageMenu.jsp" />
			</div>
			<div>
				전체 상품명 수량 단가 가격<br>
				<form action="order" method="post">
					<c:forEach var="cart" items="${list}">
						<input type="checkbox" id="check<c:out value='${cart.snackId}'/>"
							name="checkCart" value="<c:out value='${cart.snackId}'/>" />
						<label for="check<c:out value='${cart.snackId}'/>">
						<c:out value="${cart.name}" />
						<c:out value="${cart.price}" />						
						<c:out value="${cart.count}" />
						</label>
						<br>
					</c:forEach>
					<button>
						<a href="">선택주문</a>
					</button>
				</form>
			</div>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
</body>
</html>