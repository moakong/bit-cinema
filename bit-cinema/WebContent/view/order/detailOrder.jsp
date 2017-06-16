<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr>th {
	font-size: 20px;
}

table {
	padding: 5px;
	width: 600px;
}

#count, #amount {
	text-align: center;
}

#when {
	font-size: 13px;
}

#total, #hot, #a2, .yes {
	text-align: right;
}

#a1, #a2 {
	font-size: 15px;
	margin-bottom: 2px;
}

.m {
	margin-bottom: 3px;
}

.name {
	width: 400px;
}

.count, .price {
	width: 100px;
}

.all {
	margin-top: 2px;
}

.count, .price {
	text-align: center;
}

.all>th {
	border-bottom: 1px solid black;
}

#a {
	border-top: 1px solid black;
}

#c8 {
	margin-top: 30px;
}
	td.yes {
    padding-top: 10px;
}

tbody tr td {
    padding-top: 10px;
}

#a2, #a1 {
    padding-bottom: 10px;
}

</style>
</head>
<body>
	<div>
		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>

			<div>
				<c:import url="/view/include/mypageMenu.jsp" />
			</div>
		<div class="container">
		<h1>상세내역</h1>
       <br>
		<hr style="border-top: 3px double #8c8b8b;"><br>
			<form action="${pageContext.request.contextPath}/order/DeleteOrder"
				method="post" name="order">

				<div>
					<table>
						<tr id="c8">
							<th colspan="1" id="a1">주문번호:<c:out value="${order.orderId}" /></th>
							<th colspan="2" id="a2">주문일자<fmt:formatDate
									value="${order.orderDate}" pattern="yyyy.MM.dd" /></th>
						</tr>
						<tr class="all">
							<th class="name">상품명</th>
							<th class="count">수량</th>
							<th class="price">가격</th>
						</tr>
						<c:forEach var="dlist" items="${dlist}">
							<tr class="m">
								<td id="name"><img width="100px" height="100px"
									src="<c:out value="${dlist.img}"/>" /> <c:out
										value="${dlist.name}" /> <c:out value="${dlist.price}" />원</td>
								<td id="count"><c:out value="${dlist.count}" />개</td>
								<td id="amount"><c:out value="${dlist.amount}" />원</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4" id="a">
								<h3 id="total">총 금액<c:out value="${order.amount}" />원</h3>
							</td>
						</tr>
						<tr>
							<td id="hot" colspan="4">주문하신 상품의 사용기한은 <fmt:formatDate
									value="${dlist[0].limitDate}" pattern="yyyy.MM.dd" /> 까지입니다.
							</td>
						</tr>
						<input type="hidden" value="${order.orderId}" name="orderId" />
						<td colspan="2"><input type="submit" class="btn btn-default"
							onclick="return confirm('구매를 취소하시겠습니까?')" value="환불하기" /></td>
						<td colspan="1" class="yes">
						<button class="btn btn-default" type="button" onclick="list();">확인</button>
						</td>
					</table>
				</div>
			</form>
		</div>

	</div>
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>
	<script>
		function list() {
			document.order.action = "../order/ListOrder";
			document.order.submit();
		}
	</script>
</body>
</html>