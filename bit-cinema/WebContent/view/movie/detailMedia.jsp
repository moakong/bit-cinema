<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
				<!-- 여기에 내용 -->
				<video width="320" height="240" controls>
  					<source src="http://ent.cdn.videofarm.daum.net/vod/vdf9fMDMxk11KD41KMxV3hG/mp4_1280_720_2M/movie.mp4?px-time=1496637835&px-hash=dc0ea7e742ff38119ffc690bec601f30&px-bps=2761122&px-bufahead=10" type="video/mp4">
				</video><br>
				<video width="320" height="240" controls>
  					<source src="http://movie.daum.net/moviedb/video?id=89871" type="video/mp4">
				</video>
				
			</div>
		</div>
		<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>