<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>
		<div>
			<div>
				<c:out value="======여기에 영화포스터======" /><br>
				<c:out value="${ movie.movieName }" /><br>
				<fmt:formatDate value="${ movie.releaseDate }" pattern="yyyy-MM-dd"/><br>
				<c:out value="${ movie.genre }" /><br>
				<c:out value="${ movie.runtime }" /><br>
				<c:out value="${ movie.certificate }" /><br>
				<c:out value="${ movie.storyline }" /><br><br>
				<button>예매하기</button>
			</div>
				<br><br>
			<div>
				<a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }" />">주요정보</a>
				<a href="${pageContext.request.contextPath}">감독/배우</a>
				<a href="${pageContext.request.contextPath}">동영상</a>
				<a href="${pageContext.request.contextPath}">평점</a>
				<a href="${pageContext.request.contextPath}">리뷰</a>
			</div>
			
			<div>
				<!-- 여기에 내용 -->
			</div>
		</div>
		<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>