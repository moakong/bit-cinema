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
			<form action="order" method="post">
				<h1>사거라</h1>
				<button>결제</button>
			</form>
		</div>
		
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
</body>
</html>