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
		top: -150px;
		left: 50px;
		border: 1px solid black;
	}
	.m-content {
		
		position: relative;
		top: -390px;
		left: 400px;
		/* border: 1px solid black; */
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
	
	.well {
    	border: 1px solid lightgray !important;
        background-color: white !important;
        box-shadow: 3px 3px 5px 1px #9b9ea0 !important;
       
        width: 700px;
        margin-left: 100px;
        margin-top: 20px;
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
	
<div class="well container">	
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
			<h1 class="m-title"><strong><c:out value="${ movie.movieName }" /></strong></h1>
			<p class="m-engTitle" style="color: gray;"><c:out value="${ movie.engTitle }" /></p>
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<strong>개봉일: </strong><fmt:formatDate value="${ movie.releaseDate }" pattern="yyyy-MM-dd"/><br>
						<strong>장르: </strong>
						<c:forEach var="g" items="${ genre }" varStatus="s">
							<c:out value="${ g }" />
							<c:if test="${!s.last}">
							<c:out value=" / "/>
							</c:if>
						</c:forEach><br>
						<strong>상영시간: </strong><c:out value="${ movie.runtime }" /><br>
						<c:out value="${ movie.certificate }" /><br><br>
					 	<strong>누적관객: </strong> <fmt:formatNumber value="${box.audience}" pattern="#,###"/>명
					 	(<fmt:formatDate value="${box.audienceDate}" pattern="yy.MM.dd"/> 기준) <br>
					</div>
					<div class="col-sm-4">					 	
					 	<div class='starability-result' data-rating='4' aria-describedby='rated-element'></div>
					 	<h3 style="margin-left:33px; margin-top:10px;">8.5 / 10<h3>
					 	<button style="margin-left:33px; " type="button" onclick="location.href='${pageContext.request.contextPath}/reservation/selectMovie" class="btn btn-info">예매하기</button>
<%-- 					 	<button style="margin-left:33px; margin-top:-20px;" type="button" onclick="location.href='../reservation/selectArea?movieId=${movie.movieId}'" class="btn btn-default">예매하기</button> --%>
					</div>
				</div>
			</div>
		 	
		 	<br>
		</div>
		<div class="m-content2" style="width:900px; margin: -50px auto;">
		<div class="btn-group btn-group-justified" >
		  <a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }" />" class="btn btn-default">주요정보</a>
		  <a href="${pageContext.request.contextPath}/movie/DetailCast?id=<c:out value="${ movie.movieId }" />" class="btn btn-default">감독  / 배우</a>
		  <a href="${pageContext.request.contextPath}/movie/DetailMedia?id=<c:out value="${ movie.movieId }" />" class="btn btn-default">동영상 / 포토</a>
		  <a href="${pageContext.request.contextPath}/rating/Rating?id=<c:out value="${ movie.movieId }" />" class="btn btn-default">평점</a>
		  <a href="${pageContext.request.contextPath}/review/Review?id=<c:out value="${ movie.movieId }"/>" class="btn btn-default">리뷰</a>
		</div><br><br>
			
<!-- 		</div> -->
		
		<!-- 평점 쓰기 -->
		
		<!-- 평점 쓰기 -->
				<!-- 여기에 내용 -->
		<!-- write rating div -->
		<!-- <input type="hidden" name="ratingNo" value="${rating.ratingNo}" />
		rating.ratingNo: <c:out value="${rating.ratingNo}" /> -->
	<div id="writeAlign">
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
		  
			 <textarea name="content" autofocus rows="4" cols="70" 
			 placeholder="140자 이내에서 입력해 주세요" maxlength="140"></textarea>
		</div>
		글자수 : <span id="totalChars">0</span>/140<br/>
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
				<textarea name="updateContent" rows="3" cols="60"><c:out value="${rating.content}" /></textarea>
					</div>
					<div>
					  <span>
					   <button name="updateBtn" type="button">수정</button>
					  	  <!-- <input type="submit" value="수정" />	 -->
					 </span>
					</div>
		</c:when>
			 	
			 
			
	
        
		<c:otherwise>
			
			
			
		<div id= "resultRatingList">
		
		<ul>
		<li>	
		
		<div class="row">
			<div class="col-sm-1">
			 	<div class='starability-result' data-rating='<c:out value="${rating.rating}"/>' aria-describedby='rated-element' ></div>
			</div>
			
			<div class="col-sm-2 col-sm-offset-2"> 
				 <c:if test="${rating.spoiler == 1}" >스포 있음</c:if>
				<c:if test="${rating.spoiler == 0}" >스포 없음</c:if>
				
			</div> 	
		</div>
		
			<div class="row">
				<div class="col-sm-7 col-sm-offset-3" id="contentList">
					<c:out value="${rating.content}" />
				</div>
				<div class="col-sm-7 col-sm-offset-3">
					 <span> <c:out value="${rating.nickname}"/> (<c:out value="${rating.memberId}"/>)</span> |
						 <span>	<fmt:formatDate var="regDate" value="${rating.regDate}" 
							                      pattern="yyyy-MM-dd HH:mm:ss" />
						  <c:out value="${regDate}" /></span>
				     
				 </div>
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