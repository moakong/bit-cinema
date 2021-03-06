<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.a>th {
	border-bottom: 1px solid black;
	text-align: center;
	width: 700px;
	font-size: 20px;
}

#name {
	width: 250px;
}

#count, #price {
	width: 100px;
}

#total {
	width: 150px;
}

#ck {
	width: 50px;
	text-align: center;
	font-size: 10px;	
}

#tt {
	text-align: right;
}

#bt {
	text-align: right;
}
.no {
	text-align: center;
	font-size: 15px;
}
.bt {
	border-top: 1px solid black;
}

tr.a > th {
	padding-bottom: 5px;
}

td.no {
    padding-top: 20px;
}
tr.bt td {
    padding-top: 10px;
}

</style>
</head>
<body>

	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>
		<div>
			<c:import url="/view/include/mypageMenu.jsp" />
		</div>
	<div class="container">
		<h1>장바구니</h1>
       <br>
		<hr style="border-top: 3px double #8c8b8b;"><br>
		<div class="row">
		<div class="row">
		
			<div >
				<table>
					<tr class="a">
						<th id="ck">
						<input type="checkbox" id="all" name="all"
							value="all" onclick="changeChk()" /> <label for="all"
							onclick="changeChk()">전체</label><br>
						</th>
						<th id="name">상품명</th>
						<th id="count">수량</th>
						<th id="price">단가</th>
						<th id="total">가격</th>
					</tr>
					<c:choose>
						<c:when test="${list.size() == 0}">
							<tr>
								<td colspan="5" class="no">장바구니에 담긴 상품이 없습니다.</td>
							</tr>
						</table>
						</c:when>
						<c:otherwise>
								<c:forEach var="cart" items="${list}" varStatus="s">
						<tr class="list">
							<form action="DeleteCart" method="post" name="cart">
										<td id="ck"><input type="checkbox" name="checkCart"
											value="${cart.snackId}" id="${s.index}" /></td>
										
										<td><a
											href="${pageContext.request.contextPath}/snack/DetailSnack?snackId=<c:out value="${cart.snackId}"/>">
												<img width="50px" height="50px"
												src="<c:out value="${cart.img}"/>" />
										</a> <c:out value="${cart.name}" /></td>
											<td id="tt"><c:out value="${cart.price}" />원</td>
											<td id="tt"><c:out value="${cart.count}" />개</td>
											<td id="tt">총&nbsp;<c:out
													value="${cart.price * cart.count}" />원
										</td>
						</tr>
								</c:forEach>
								<tr class="bt">
									<td colspan="4"><input type="submit" class="btn btn-default"
										onclick="return confirm('삭제하시겠습니까?')" value="삭제" /></td>
									<td id="bt"><button class="btn btn-default" type="submit" onclick="buy()">구매</button></td>
								</tr>
				</table>
				</form>
				</c:otherwise>
				</c:choose>
				<hr>
			</div>
			</div>
		</div>
	</div>
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>
	<script>
		function changeChk() {
			var allCk = document.querySelector("#all");
			var menus = document.querySelectorAll("input[name=checkCart]");
			for (var i = 0; i < menus.length; i++) {
				menus[i].checked = allCk.checked;
			}
		}

		function buy() {
			document.cart.action = "${pageContext.request.contextPath}/order/PaySnack";
			document.cart.submit();
		}
	</script>
</body>
</html>