<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style >
.img-thumbnail {
		position: relative;
		top: -200px;
		left: 50px;
	}
	
#revieww{
	margin: 20px;
}

#recontent{
display: inline-block;
 width: 600px;
  white-space: nowrap;
   overflow: hidden;
    text-overflow: ellipsis;
    
     /* 여러 줄 자르기 추가 스타일 */ 
     white-space: normal;
      line-height: 1.2;
       height: 2.3em;
       text-align: left;
        word-wrap: break-word;
        display: -webkit-box;
         -webkit-line-clamp: 2;
          -webkit-box-orient: vertical;
margin: 5px;

		
}
#retitle{
	font-size: 20px;
	color: lime;
}


</style>
</head>
<body>
	<div>
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
			<div>
				<a href="<c:out value="${ photo }"/>" onclick="window.open(this.href, '_blank'); return false;">
					<img class="img-thumbnail" src="<c:out value="${ photo }"/>" width="300px" height="400px"/>
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
				<button type="button" onclick="location.href='../reservation/selectArea?movieId=${movie.movieId}'" class="btn btn-primary">예매하기</button>
			</div>
				<br><br>
				
			<div class="btn-group btn-group-justified" >
		  <a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }" />" class="btn btn-primary">주요정보</a>
		  <a href="${pageContext.request.contextPath}/movie/DetailCast?id=<c:out value="${ movie.movieId }" />" class="btn btn-primary">감독  / 배우</a>
		  <a href="${pageContext.request.contextPath}/movie/DetailMedia?id=<c:out value="${ movie.movieId }" />" class="btn btn-primary">동영상 / 포토</a>
		  <a href="${pageContext.request.contextPath}/rating/Rating?id=<c:out value="${ movie.movieId }" />" class="btn btn-primary">평점</a>
		  <a href="${pageContext.request.contextPath}/review/Review?id=<c:out value="${ movie.movieId }"/>" class="btn btn-primary">리뷰</a>
		</div>	
		<br><br>

			<div id="revieww">
				<!-- 여기에 내용 -->
				<a href="${pageContext.request.contextPath}/writeform?mid=${ movie.movieId }">리뷰쓰기</a><br><br>
				
					<div id="reviewlist">
					
					<c:forEach var="review" items="${list }">
							
							<div>
							
								<span id="retitle"><a href="${pageContext.request.contextPath}/review/Detail?reviewNo=${review.reviewNo}&mmid=${review.memberId }"> <c:out value="${review.title }"/></a></span>
								<span><c:out value="${review.memberId }"></c:out></span>
								<span><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd" /></span>
								추천<span><c:out value="${review.recomCount }"></c:out></span>
								<div id="recontent"><a href="${pageContext.request.contextPath}/review/Detail?reviewNo=${review.reviewNo}&mmid=${review.memberId }"><c:out value="${review.content }"></c:out></a></div>
							</div>	
					</c:forEach>
					</div>
				
				
			</div>
		</div>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>



</body>
</html>