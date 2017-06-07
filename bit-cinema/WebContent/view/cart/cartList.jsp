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
			<input type="checkbox" id="all" name="all" value="all"
			onclick="changeChk()" /> <label id="all" onclick="changeChk()"></label><br>
				전체 상품명 수량 단가 가격<br>
				<form action="DeleteCart" method="post">
					<c:forEach var="cart" items="${list}">
						<input type="checkbox" id="${cart.snackId}"
							name="checkCart" value="<c:out value='${cart.snackId}'/>" />
						<label for="${cart.snackId}">
						<c:out value="${cart.name}" />
						<c:out value="${cart.price}" />						
						<c:out value="${cart.count}" />
						</label>
						<br>
					</c:forEach>
					<button>삭제</button>
				</form>
			</div>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
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
</script>
</body>
</html>