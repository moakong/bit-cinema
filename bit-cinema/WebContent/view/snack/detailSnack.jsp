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
			<form name="m" action="${pageContext.request.contextPath}/cart/InsertCart" method="post">
				<img width="300px" height="300px" src="<c:out value="${snack.img}"/>"/><br>
				<c:out value="${snack.name}" /><br>
				<c:out value="${snack.price}" />
				<br> <select name="count">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select><br>
				<c:out value="${snack.explan}" /><br>
				<input type="hidden" name="snackId" value="${snack.snackId}">
				<input type="hidden" id="gocart" name="gocart" value="">				
				유효기간 구매후 30일
				 <input type="submit" onclick="cart();" value="장바구니">
				 <button onclick="doAction()" type="button">구매</button>				 
			</form>
			<a href="${pageContext.request.contextPath}/snack/ListSnack?category=<c:out value='${snack.categoryId}'/>">목록</a>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
<script>
	function doAction() {
		var f = document.m;
		f.action = "../order/ListOrder";
		f.submit();
	}
	function cart() {
		var con = confirm('상품이 장바구니에 담겼습니다.\r\n장바구니로 이동하시겠습니까');
		var gocart = document.querySelector("#gocart");
		console.log(gocart);
		if(con){
			gocart.value = "go";
		}else{
			gocart.value = "no";
		}
	}
</script>
</body>
</html>