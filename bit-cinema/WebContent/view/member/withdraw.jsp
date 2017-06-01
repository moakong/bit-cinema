<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<p>그 동안 비트씨네마를 이용해주셔서 감사합니다</p>
		<a href="${pageContext.request.contextPath}/main/Main">메인으로 가기</a>
	</div>	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>