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
		<div>
			<a href="${pageContext.request.contextPath}/main/Main?chart=1">박스오피스</a>
			<a href="${pageContext.request.contextPath}/main/Main?chart=2">예매순</a><br>
			
			<c:forEach var="movie" varStatus="status" items="${ chartMovie }">
				<c:out value="${ status.index +1 }" />
				<a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }"/>">
					<c:out value="${ movie.movieName }"/>
				</a><br>
			</c:forEach>
		</div>
	</div>	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>










