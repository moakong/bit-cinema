<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/starability-all.min.css">
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="../lib/sweetalert.min.js"></script> 
<link rel="stylesheet" href="../lib/sweetalert.css">

<style >
.img-thumbnail {
		position: relative;
		top: -150px;
		left: 50px;
		border: 1px solid black;
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

			<div id="revieww">
				<!-- 여기에 내용 -->
<%-- 				<a id="returnuser" href="${pageContext.request.contextPath}/writeform?mid=${ movie.movieId }">리뷰쓰기</a> --%>
				
					<hr>
				<button type="button" id="buttonn">리뷰쓰기</button><br><br>
				
					<div id="reviewlist">
					<c:forEach var="review" items="${list }">
							
							<div >
							
								<span id="retitle"><a href="${pageContext.request.contextPath}/review/Detail?reviewNo=${review.reviewNo}&mmid=${review.memberId }"> <c:out value="${review.title }"/></a></span>
								<span>:<c:out value="${review.memberId }"></c:out></span>
								<span><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd" /></span>
								조회수<span><c:out value="${review.recomCount }"></c:out></span>
								<div id="recontent"><a  href="${pageContext.request.contextPath}/review/Detail?reviewNo=${review.reviewNo}&mmid=${review.memberId }"><c:out  value="${review.content }"></c:out></a></div>
								<hr>
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

<script >

// 	var userId = '${user.memberId}';
// 	console.log("userId", userId);
// 	$("#returnuser").on("click", function(){
// 		if (!userId) {
// 			alert("로그인 해주세요");
// 			return false;
// 		}
// 	});
var userr = '${user}';
console.log("userr", userr);
// $("#returnuser").on("click", function(){
// 	if (!userr) {
// 		alert("로그인 해주세요");
// // 		document.location.href="${pageContext.request.contextPath}/member/LoginForm";
// 		return false;
// 	}
// });

$("#buttonn").on("click", function(){
	if (!userr) {
		
		swal({
			  title: " 로그인 하세요 "
			},
			function(){
				location.href="${pageContext.request.contextPath}/member/LoginForm";
			});

// 		swal("Here's a message!", function(){
// 			location.href="${pageContext.request.contextPath}/member/LoginForm";
// 		});
// 		alert( "로그인 해주세요" );
		
	}
	else{
		location.href="${pageContext.request.contextPath}/writeform?mid=${ movie.movieId }"
	}
});
</script>

</body>
</html>