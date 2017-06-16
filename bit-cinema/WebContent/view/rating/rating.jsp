<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/starability-all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/rating.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/style/rating.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.img-thumbnail {
		position: relative;
		top: -200px;
		left: 50px;
	}
</style>
<script type="text/javascript">

</script>


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
			
		</div>
		
		<!-- 평점 쓰기 -->
		
		<!-- 평점 쓰기 -->
				<!-- 여기에 내용 -->
		<!-- write rating div -->
		<!-- <input type="hidden" name="ratingNo" value="${rating.ratingNo}" />
		rating.ratingNo: <c:out value="${rating.ratingNo}" /> -->
		<div>
		<form method="post" action="writeRating" name="writeForm">
			<input type="hidden" name="id" value="${movie.movieId}" />
		 <input type="hidden" name="memberId" value="${user.memberId}" />
		
	
	<!-- 별점 -->
	
		
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
		
		
		
		
		<div id="result">
		  글자수 : <span id="totalChars">0</span>/140<br/>
			 <textarea name="content" autofocus rows="4" cols="70" 
			 placeholder="140자 이내에서 입력해 주세요" maxlength="140"></textarea>
		</div>
		
		<div>
			<button id="wBtn" type="button">등록</button>
		
		</div>
		
		
				
		</form>
	</div>
	
	<!--  정렬 -->
	

<div>

	<nav id="primary_nav_wrap">
	<ul>
	  <!-- 
	 
	  <li><a href="Rating?id=${movie.movieId}&ratingNo=${rating.ratingNo}&type=new">최신순</a></li>
	  <li><a href="Rating?id=${movie.movieId}&ratingNo=${rating.ratingNo}&type=highRating">평점 높은 순</a></li>
	  <li><a href="Rating?id=${movie.movieId}&ratingNo=${rating.ratingNo}&type=lowRating">평점 낮은 순</a></li>
	 -->
	 
	  <li><a href="Rating?id=${movie.movieId}&type=new">최신순</a></li>
	  <li><a href="Rating?id=${movie.movieId}&type=highRating">평점 높은 순</a></li>
	  <li><a href="Rating?id=${movie.movieId}&type=lowRating">평점 낮은 순</a></li>
	 
	 
	</ul>
	</nav>
</div>


<!-- 
		<!-- form  update-->
<div>
	<form action="updateRating" method="post" name="updateForm">
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
					   <button name="updateBtn" type="button">수정</button>
					  	  <!-- <input type="submit" value="수정" />	 -->
					 </span>
					</div>
		</c:when>
			 	
			 
			
	
        
		<c:otherwise>
			
			<div class="row">
					<div class="col-sm-3">
		<div id= "resultRatingList">
		<ul>
		<li>
		
		 <div class='starability-result' data-rating='<c:out value="${rating.rating}"/>' aria-describedby='rated-element'></div>
				
			<div> <c:if test="${rating.spoiler == 1}" >스포 있음</c:if>
			<c:if test="${rating.spoiler == 0}" >스포 없음</c:if>
			 </div>
				 	
			<p><c:out value="${rating.content}" /></p>
			
			<div>
			 <span> <c:out value="${rating.nickname}"/> (<c:out value="${rating.memberId}"/>)</span> |
				 <span>	<fmt:formatDate var="regDate" value="${rating.regDate}" 
					                      pattern="yyyy-MM-dd HH:mm:ss" />
				  <c:out value="${regDate}" /></span>
					      
			 </div>
					  
					  <c:if test="${user.memberId == rating.memberId}">
				  <div id="edit">
				  <button name="dBtn" type="button" data-param="id=${rating.movieId}&ratingNo=${rating.ratingNo}">삭제</button>
				  <button name="uBtn" type="button" data-param="id=${rating.movieId}&ratingNo=${rating.ratingNo}">수정</button>
					  	<!-- 
					  	 <a href="deleteRating?id=${rating.movieId}&ratingNo=${rating.ratingNo}">삭제</a>
					  	  /	
					  	  <a href="Rating?id=${rating.movieId}&ratingNo=${rating.ratingNo}">수정</a>	
				-->
				</div> 
				</c:if>
					 </li>
					 </ul>
					 </div>		
					 </div>
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