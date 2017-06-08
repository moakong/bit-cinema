<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<a href="<c:out value="${ photo.link }"/>" onclick="window.open(this.href, '_blank'); return false;">
					<img src="<c:out value="${ photo.route }"/>" width="300px" height="400px"/>
				</a><br>
				<c:out value="${ movie.movieName }" /><br>
				<c:out value="${ movie.engTitle }" /><br>
				<fmt:formatDate value="${ movie.releaseDate }" pattern="yyyy-MM-dd"/><br>
				<c:forEach var="g" items="${ genre }">
					<c:out value="${ g }" /><br>
				</c:forEach>
				<c:out value="${ movie.runtime }" /><br>
				<c:out value="${ movie.certificate }" /><br>
				<c:out value="${ movie.story }" /><br><br>
				<button onclick="location.href='../reservation/selectArea?movieId=${movie.movieId}'" >예매하기</button>
			</div>
				<br><br>
			<div>
				<a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }" />">주요정보</a>
				<a href="${pageContext.request.contextPath}/movie/DetailCast?id=<c:out value="${ movie.movieId }" />">감독  / 배우</a>
				<a href="${pageContext.request.contextPath}/movie/DetailMedia?id=<c:out value="${ movie.movieId }" />">동영상 / 포토</a>
				<a href="${pageContext.request.contextPath}">평점</a>
				<a href="${pageContext.request.contextPath}/review/Review?id=<c:out value="${ movie.movieId }" />"/>리뷰</a>
			</div>
			
			<div>
				<c:forEach var="video" items="${ videos }">
					<c:out value="${ video.name }" /><br>
					<iframe width="320" height="240" src="${ video.route }" frameborder="0" allowfullscreen></iframe><br>
				</c:forEach>
				
				<c:forEach var="p" items="${ photos }">
					<img width="320" height="240" src="${ p }"/><br>
				</c:forEach>
				
			</div>
		</div>
		<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>