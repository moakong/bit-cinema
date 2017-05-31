<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<p>
			<c:if test="${!empty user}">
				<a href="${pageContext.request.contextPath}/member/Mypage">
					<c:out value="${user.name}"/></a>님 환영합니다.
			</c:if>
		</p>
		<h1>페이지 정보 출력부분</h1>
	</div>	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>










