<%@ page contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<div>
				<c:import url="/view/include/topMenu.jsp" />
			</div>	
			<div>
				<p>회원가입이 완료되었습니다.</p>
				<a href="${pageContext.request.contextPath}/member/LoginForm">로그인 하기</a>
				<a href="${pageContext.request.contextPath}/main/Main">메인으로 가기</a>
			</div>	
			<div>
				<c:import url="/view/include/footer.jsp" />
			</div>	
		</div>
	</body>
</html>