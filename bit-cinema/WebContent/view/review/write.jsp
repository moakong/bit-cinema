<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
 리뷰작성이 완료되었습니다.



	<a href="${pageContext.request.contextPath}/review/Review?id=<c:out value="${ mid }" />"/>리뷰 돌아가기</a>
</body>
</html>