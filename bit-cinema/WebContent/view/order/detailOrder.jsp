<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			
		<form action="${pageContext.request.contextPath}/order/DeleteOrder" method="post" name="order">
			주문 날짜 <fmt:formatDate value="${order.orderDate}" pattern="yyyy.MM.dd"/><br>
			상품명 갯수 가격 <br>
			<c:forEach var="dlist" items="${dlist}">
				<img width="100px" height="100px" src="<c:out value="${dlist.img}"/>" />
				<c:out value="${dlist.name}" />
				<c:out value="${dlist.count}" />개
				<c:out value="${dlist.price}" />원
				<c:out value="${dlist.amount}" />원
				<br>
			</c:forEach>
			<h3>총 금액<c:out value="${order.amount}"/>원</h3>
			<input type="hidden" value="${order.orderId}" name="orderId" />
			주문하신 상품의 사용기한은 <fmt:formatDate value="${dlist[0].limitDate}" pattern="yyyy.MM.dd"/> 까지입니다.
			<br><input type="submit" onclick="return confirm('구매를 취소하시겠습니까?')" value="환불하기"/>
			<button type="button" onclick="list();">확인</button>			
		</form>
		</div>
		
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
	<script>
	function list() {
		document.order.action ="../order/ListOrder";
		document.order.submit();
	}
	</script>
</body>
</html>