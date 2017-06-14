<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.thumb {
		position: absolute;
		top: 200px;
		left: 50px;
	}
</style>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>
	
	
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<c:forEach var="i" begin="0" end="${photos.size()-1}">
    	<c:choose>
    	<c:when test="${i eq 0}">
    	<li data-target="#myCarousel" data-slide-to="${i}" class="active"></li>
    	</c:when>
    	<c:otherwise>
    	<li data-target="#myCarousel" data-slide-to="${i}"></li>
    	</c:otherwise>
    	</c:choose>
		</c:forEach>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<c:forEach var="i" begin="0" end="${photos.size()-1}">
    	<c:choose>
    	<c:when test="${i eq 0}">
    	<div class="item active">
    	</c:when>
    	<c:otherwise>
    	<div class="item">
    	</c:otherwise>
    	</c:choose>
<%--     	<c:if test="${i.index eq 0}"> --%>
<!--     	<div class="item active"> -->
<%--      	</c:if> --%>
<%--     	<c:if test="${i.index ne 0}"> --%>
<!--     	<div class="item"> -->
<%--      	</c:if> --%>
       		<img src="${photos[i]}" height="500px"/>
     	</div>
		</c:forEach>
   </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
	
	
	
	
	
	<div>
		<div>
			<a href="<c:out value="${ photo }"/>" onclick="window.open(this.href, '_blank'); return false;">
				<img class="thumb" src="<c:out value="${ photo }"/>" width="300px" height="400px"/>
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
			<h2>감독</h2>
			<c:forEach var="director" items="${ directors }">
				<img width="180" height="240" src="${ director.profile }"/><br>
				감독 <br>
				<c:out value="${ director.directorName }" /><br>
			</c:forEach>
			<hr>
			
			<h2>배우</h2>
			<a href="${pageContext.request.contextPath}/movie/DetailCast?id=<c:out value="${ movie.movieId }" />">> 더보기</a><br>
			<c:forEach var="actor" items="${ actors }">
				<img width="180" height="240" src="${ actor.profile }"/><br>
				<c:out value="${ actor.type }" /><br>
				<c:out value="${ actor.castName }" /><br>
				<c:out value="${ actor.actorName }" /><br>
			</c:forEach>
		</div>
	</div>
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>