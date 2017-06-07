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
			<form name="m" action="../cart/ListCart" method="post">
				<c:out value="${snack.name}" /><br>
				<c:out value="${snack.price}" />
				<br> <select name="count">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select><br>
				<c:out value="${snack.explan}" /><br>
				<input type="hidden" name="snackId" value="${snack.snackId}">
				유효기간 구매후 30일
				 <input type="submit" onclick="return confirm('장바구니에 담겠습니까?')" value="장바구니">
				 <button onclick="doAction()" type="button">구매</button>
			</form>
			<a href="Snack?category=<c:out value='${snack.categoryId}'/>">목록</a>
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
</script>
</body>
</html>