<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/starability-all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/rating.css">
<!--  <script type="text/javascript" src="${pageContext.request.contextPath}/style/rating.js"></script>-->
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
				<a href='${pageContext.request.contextPath}/rating/Rating?id=<c:out value="${ movie.movieId }" />'>평점</a>
				<a href="${pageContext.request.contextPath}/review/Review?id=<c:out value="${ movie.movieId }" />">리뷰</a>
			</div>
			
			<div>
				<h2>감독</h2>
				<c:forEach var="director" items="${ directors }">
					<c:out value="======프로필이미지======" /><br>
					감독 <br>
					<c:out value="${ director.directorName }" /><br>
				</c:forEach>
				<hr>
				
				<h2>배우</h2>
				<a href="${pageContext.request.contextPath}/movie/DetailCast?id=<c:out value="${ movie.movieId }" />">> 더보기</a><br>
				<c:forEach var="actor" items="${ actors }">
					<img width="320" height="240" src="http://t1.search.daumcdn.net/thumb/R438x0.q85/?fname=http%3A%2F%2Fcfile79.uf.daum.net%2Fimage%2F273B565051A55DDB2E41A6"/><br>
					<c:out value="${ actor.type }" /><br>
					<c:out value="${ actor.castName }" /><br>
					<c:out value="${ actor.actorName }" /><br>
				</c:forEach>
			</div>
		</div>
		
		<!-- 평점 쓰기 -->
		
		<!-- 평점 쓰기 -->
				<!-- 여기에 내용 -->
		<!-- write rating div -->
		<!-- <input type="hidden" name="ratingNo" value="${rating.ratingNo}" />
		rating.ratingNo: <c:out value="${rating.ratingNo}" /> -->
		<div>
		<form method="post" action="writeRating">
			<input type="hidden" name="id" value="${movie.movieId}" />
		 <!-- <input type="hidden" name="memberId" value="${user.memberId}" /> -->
		
	
	<!-- 별점 -->
	
		
		<div>
	
		<div>
			<fieldset class="starability-basic">
			 <!-- <legend>Second rating:</legend> -->
			 <p>평점 : </p>
			  <input type="radio" id="second-rate5" name="rating" value="5" />
			  <label for="second-rate5" title="Amazing">5 stars</label>
			  <input type="radio" id="second-rate4" name="rating" value="4" />
			  <label for="second-rate4" title="Very good">4 stars</label>
			  <input type="radio" id="second-rate3" name="rating" value="3" />
			  <label for="second-rate3" title="Average">3 stars</label>
			  <input type="radio" id="second-rate2" name="rating" value="2" />
			  <label for="second-rate2" title="Not good">2 stars</label>
			  <input type="radio" id="second-rate1" name="rating" value="1" />
			  <label for="second-rate1" title="Terrible">1 star</label>
			</fieldset>
		</div>
	
		
		
	   
		  <!-- 스포일러 선택 -->
		  <div>
		  <input type="checkbox" name="spoiler" value="1"/>
		  <label for="spoiler">스포일러</label>
		</div>
		<div>
			 <textarea name="content" autofocus rows="4" cols="70" 
			 placeholder="140자 이내에서 입력해 주세요" maxlength="140"></textarea>
		</div>
		
		<div>
			<button>등록</button>
		
		</div>
		
		</div>
				
		</form>
	</div>
	
<!-- 
		<!-- form  update-->
<div>
	<form action="updateRating" method="post">
			<input type="hidden" name="id" value="${movie.movieId}" />
			<input type="hidden" name="ratingNo" value="${ratingNo}" />
		
	
		<div id="listRating">
		  <!--  <table width='90%' border='1'>-->
		
	  
					
	
	
			<c:forEach var="rating" items="${listRating}">
			<c:choose>
		  	<c:when test="${ratingNo eq rating.ratingNo}">	
			
			<input type="hidden" name="updateRating" value="${rating.rating}" />
		<div class='starability-result' data-rating='<c:out value="${rating.rating}"/>' aria-describedby='rated-element'></div>
		<div> 
				
		<input type="checkbox" name="updateSpoiler" 
			   <c:if test="${rating.spoiler == 1}" >
			   checked
			   </c:if>	
		       value="1"/>
		  <label for="updateSpoiler">스포일러</label>
		  </div>
		  <div>
					  	<textarea name="updateContent" rows="2" cols="60"><c:out value="${rating.content}" /></textarea>
					</div>
					<div>
					  <span>
					  	  <input type="submit" value="수정" />	
					 </span>
					</div>
		</c:when>
			 	
			 
			
		<c:otherwise>
			
		<div>
		<ul>
		<li>
		
		  <div class='starability-result' data-rating='<c:out value="${rating.rating}"/>' aria-describedby='rated-element'></div>
				
			<div> <c:out value="${rating.spoiler}" /></div>
				 	
			<p><c:out value="${rating.content}" /></p>
			
			<div>
			 <span> <c:out value="${rating.nickname}"/> (<c:out value="${rating.memberId}"/>)</span> |
				 <span>	<fmt:formatDate var="regDate" value="${rating.regDate}" 
					                      pattern="yyyy-MM-dd HH:mm:ss" />
				  <c:out value="${regDate}" /></span>
					      
			 </div>
					  
				  
					  	 <a href="deleteRating?id=${rating.movieId}&ratingNo=${rating.ratingNo}">삭제</a>
					  	  /	
					  	  <a href="Rating?id=${rating.movieId}&ratingNo=${rating.ratingNo}">수정</a>	
				
					 </li>
					 </ul>
					 </div>		
			 	</c:otherwise>
			 </c:choose>	
			 </c:forEach>
			 <c:if test="${empty listRating}">
			 
			    <span>댓글이 존재하지 않습니다.</span>
			
		 	</c:if>
		
		</div>
	
</form> 
	</div>	 
	</div>		
		
		 	

	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	

</body>
</html>