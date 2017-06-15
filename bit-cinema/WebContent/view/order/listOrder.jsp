<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin-top: 100px;
		width: 600px;
	}
	tr > th{
		font-size: 15px;
	}
	tr.head > th {
		border-bottom: 1px solid black;
	}
	#name, #od ,.date{
		text-align: center;
	}
	
</style>
</head>
<body>

<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	<div class="container">
		<div>
			<c:import url="/view/include/mypageMenu.jsp" />
		</div>

		
		<div>
			<div>
				<table>
				<tr class="head">
				<th id="on">주문번호</th>
				<th id="name">상품명</th>
				<th id="od">주문날짜</th>
				</tr>
				<c:choose>
				<c:when test=" ${orderList.size()}==0">
				<tr>
				<td colspan="3">
				주문하신 상품이 없습니다.
				</td>
				</tr>
				</c:when>
				<c:otherwise>
				<%-- <c:forEach var="i" begin="0" end="${ orderList.size() }" > --%>
				<c:forEach var="order" items="${ orderList }" varStatus="s">
				<tr>
					<td><c:out value="${order.orderId}"/></td>
					<td>
					<img src="${img[s.index]}" width="50px" height="50px"/>
					<a href="${pageContext.request.contextPath}/order/DetailOrder?orderId=${order.orderId}">
					<c:out value="${title[s.index]}"/></a></td>
					<td class="date"><c:out value="${order.orderDate}"/></td>
				</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</table>
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