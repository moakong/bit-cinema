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
			<ul>
				<li><a href="Snack?category=5">베스트</a></li>
				<li><a href="Snack?category=3">콤보</a></li>
				<li><a href="Snack?category=1">팝콘</a></li>
				<li><a href="Snack?category=2">음료</a></li>
				<li><a href="Snack?category=4">스낵</a></li>
			</ul>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
</body>
</html>