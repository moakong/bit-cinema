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
			<input type="checkbox" id="all" name="all" value="all"onclick="changeChk()" /><label for="all" onclick="changeChk()"> 전체선택</label><br>
				전체 상품명 수량 단가 가격<br>
				<form action="DeleteCart" method="post" name="cart" >
					<c:forEach var="cart" items="${list}" varStatus="s">
						<input type="checkbox" name="checkCart" value="${cart.snackId}" id="${s.index}"/>
						<a href="${pageContext.request.contextPath}/snack/DetailSnack?snackId=<c:out value="${cart.snackId}"/>">
							<img width="50px" height="50px" src="<c:out value="${cart.img}"/>"/></a>
						<label for="${s.index}">
						<c:out value="${cart.name}" />
						<c:out value="${cart.price}" />						
						<c:out value="${cart.count}" />
						</label>
						<br>
					</c:forEach>
					<input type="submit" onclick="return confirm('삭제하시겠습니까?')" value="삭제"/>	
					<button type="submit" onclick="buy()">구매</button>
				</form>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
			</div>
		</div>
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