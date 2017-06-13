<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style >

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
		<div>
			<div>
				<a href="<c:out value="${ photo }"/>" onclick="window.open(this.href, '_blank'); return false;">
					<img src="<c:out value="${ photo }"/>" width="300px" height="400px"/>
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

			<div id="revieww">
				<!-- 여기에 내용 -->
				<a href="${pageContext.request.contextPath}/writeform?mid=${ movie.movieId }">리뷰쓰기</a><br><br>
				
					<div id="reviewlist">
					
					<c:forEach var="review" items="${list }">
							
							<div>
							
								<span id="retitle"><a href="${pageContext.request.contextPath}/review/Detail?reviewNo=${review.reviewNo}"> <c:out value="${review.title }"/></a></span>
								<span><c:out value="${review.memberId }"></c:out></span>
								<span><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd" /></span>
								추천<span><c:out value="${review.recomCount }"></c:out></span>
								<div id="recontent"><a href="${pageContext.request.contextPath}/review/Detail?reviewNo=${review.reviewNo}"><c:out value="${review.content }"></c:out></a></div>
							</div>	
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