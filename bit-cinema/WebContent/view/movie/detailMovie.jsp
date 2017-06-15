<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/starability-all.min.css">
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.img-thumbnail {
		position: relative;
		top: -170px;
		left: 50px;
		border: 1px solid black;
	}
	.m-content {
		
		position: relative;
		top: -390px;
		left: 400px;
		border: 1px solid black;
		/* display: inline;
		width: 500px; */
	}
	.m-content2 {
		position: relative;
		top: -300px;
		left: 0px;
	}
	/* .carousel-inner {
		width: 100%;
		height: 500px;
	} */
 	.item-img{
 		width: 100%; 
 		height: 500px !important; 
 		
 	} 
	.m-title{}
	.m-engTitle{font-family: "Times New Roman", Times, serif;}


	.container {
		width: 500px;
	}
</style>
</head>
<body>
<div >
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>
	
<div class="container">	
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
       		<img src="${photos[i]}" class="item-img"/>
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
		<div class="img-thumbnail">
			<a href="<c:out value="${ photo }"/>" onclick="window.open(this.href, '_blank'); return false;">
				<img src="<c:out value="${ photo }"/>" width="300px" height="400px"/></a>
			</div>
		<div class="m-content">
			<h1 class="m-title"><c:out value="${ movie.movieName }" /></h1>
			<p class="m-engTitle"><c:out value="${ movie.engTitle }" /></p>
			<fmt:formatDate value="${ movie.releaseDate }" pattern="yyyy-MM-dd"/><br>
			<c:forEach var="g" items="${ genre }" varStatus="s">
				<c:out value="${ g }" />
				<c:if test="${!s.last}">
				<c:out value=" / "/>
				</c:if>
			</c:forEach><br>
			<c:out value="${ movie.runtime }" /><br>
			<c:out value="${ movie.certificate }" /><br>
		 	누적관객 <fmt:formatNumber value="${box.audience}" pattern="#,###"/>명
		 	(<fmt:formatDate value="${box.audienceDate}" pattern="yy.MM.dd"/> 기준) <br>
		 	관람평점 
		 	<div class='starability-result' data-rating='4.5' aria-describedby='rated-element'></div>
		 	
		 	<br>
		</div>
		
		
		<div class="m-content2">
			<c:out value="${ movie.story }" /><br><br>
			
			<button type="button" onclick="location.href='../reservation/selectArea?movieId=${movie.movieId}'" class="btn btn-primary">예매하기</button>
		</div>
			
		
		<div class="btn-group btn-group-justified" >
		  <a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }" />" class="btn btn-primary">주요정보</a>
		  <a href="${pageContext.request.contextPath}/movie/DetailCast?id=<c:out value="${ movie.movieId }" />" class="btn btn-primary">감독  / 배우</a>
		  <a href="${pageContext.request.contextPath}/movie/DetailMedia?id=<c:out value="${ movie.movieId }" />" class="btn btn-primary">동영상 / 포토</a>
		  <a href="${pageContext.request.contextPath}/rating/Rating?id=<c:out value="${ movie.movieId }" />" class="btn btn-primary">평점</a>
		  <a href="${pageContext.request.contextPath}/review/Review?id=<c:out value="${ movie.movieId }"/>" class="btn btn-primary">리뷰</a>
		</div>	
		<br><br>
		
		
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

</div>
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>