<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>BIT CINEMA</title>
  <meta charset="utf-8">
 
  <style>
	  hr { 
		  height: 30px; 
		  border-style: solid; 
		  border-color: #8c8b8b; 
		  border-width: 1px 0 0 0; 
		  border-radius: 20px; 
	}     

	.category{
		 font-weight: light;
	}

/* max-width: @screen-sm-max*/
   /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px ) {
    .carousel-caption {
      display: none; 
    }
  }
  
  </style>
</head>
<body>


	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>



<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<!-- <img src="http://i.imgur.com/01wULU2.jpg" alt="Image"> -->
			<img src="/bit-cinema/img/main/1-1.jpg" alt="Image">
			<div class="carousel-caption">
			<h3>불한당</h3>
			<p>범죄조직의 1인자를 노리는 재호와 세상 무서운 것 없는 패기 넘치는 신참 현수는 교도소에서 만나 서로에게 끌리고 끈끈한 의리를 다져간다.</p>
		</div>      
	</div>

    <div class="item">
       	<img src="http://i.imgur.com/XaIfdSN.jpg" alt="Image">
<!--         <img src="../../img/main/army.jpg" alt="Image"> -->
       	<div class="carousel-caption">
         <h3>대립군</h3>
         <p>1592년 임진왜란이 발발하자, 선조는 어린 ‘광해’(여진구)에게 조정을 나눈 ‘분조’를 맡기고 의주로 피란한다.  </p>
       </div>      
     </div>
   
  <div class="item">
       <img src="http://i.imgur.com/uQV6Si4.jpg" alt="Image">
       <div class="carousel-caption">
         <h3>캐리비안의 해적: 죽은 자는 말이 없다</h3>
         <p>전설적인 해적 캡틴 ‘잭 스패로우’의 눈 앞에 죽음마저 집어삼킨 바다의 학살자 
‘살라자르’(하비에르 바르뎀)가 복수를 위해 찾아온다. 둘 사이에 숨겨진 엄청난 비밀··· </p>
       </div>      
     </div>
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
  
  
  
  
  
  
<div class="container text-center">
<hr>    
<h3 class="category">[ 영화 랭킹 ]</h3><br>
	<div class="row">
		<div class="col-sm-3">
			<div class="btn-group btn-group-sm btn-block">
				<button type="button" class="btn btn-default col-sm-5" onclick="location.href='${pageContext.request.contextPath}/main/Main?chart=1'">박스오피스</button>
				<button type="button" class="btn btn-default col-sm-5" onclick="location.href='${pageContext.request.contextPath}/main/Main?chart=2'">예매순</button><br><br>
			</div>
	     
	      	<div class="well" style="text-align:left">
	      		<%-- <c:forEach var="movie" varStatus="status" items="${ chartMovie }"> --%>
	      		<c:forEach var="i" begin="3" end="${ chartMovie.size()-1 }">
					<p><c:out value="${ i+1 }위" />
					<a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ chartMovie[i].movieId }"/>">
						<c:out value="${ chartMovie[i].movieName }"/></a>
					</p>
				</c:forEach>
	      	</div>
	    </div>
    
    
    	<c:forEach var="i" begin="0" end="2">
	    <div class="col-sm-3"> 
	    	<p><strong>${i+1}위</strong></p>
			<a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ chartMovie[i].movieId }"/>">
			<img src="${ thumbnail[i] }" class="img-responsive" style="width:100%">
			<p><strong><c:out value="${ chartMovie[i].movieName }"/></strong></p>  </a> 
	    </div>
		</c:forEach>
  	</div>
  
  
  
	<div class="row">
		<button type="button" class="btn btn-default colBtn" data-toggle="collapse" data-target="#demo">
		<span class="glyphicon glyphicon-collapse-down"></span> 더보기 
		</button>
    
		<div id="demo" class="collapse">
		<c:forEach var="i" begin="3" end="${ chartMovie.size()-1 }">
			<div class="col-sm-3"> 
  				<p><strong>${i+1}위</strong></p>
  				<a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ chartMovie[i].movieId }"/>">
  				<img src="${ thumbnail[i] }" class="img-responsive" style="width:100%">
  				<p><strong><c:out value="${ chartMovie[i].movieName }"/></strong></p>  </a>  
			</div>
		</c:forEach>
		</div>
	</div>
</div><br>

   
   
   <br><br><br>
  <div class="container text-center">
   <hr>
    <h3 class="category">[ 예고편 ]</h3><br>
    <div class="row">
    <div class="col-sm-3">
     <iframe width="280" height="150" src="https://www.youtube.com/embed/5c-dva-4BMs" frameborder="0" allowfullscreen></iframe>
    </div>
    <div class="col-sm-3">
       <iframe width="280" height="150" src="https://www.youtube.com/embed/P7lmmnZ18VQ" frameborder="0" allowfullscreen></iframe>
    </div>
    <div class="col-sm-3">
       <iframe width="280" height="150" src="https://www.youtube.com/embed/SFGlghyeMuQ" frameborder="0" allowfullscreen></iframe>
    </div>
    <div class="col-sm-3">
       <iframe width="280" height="150" src="https://www.youtube.com/embed/RL-qYJFaF7E" frameborder="0" allowfullscreen></iframe>
    </div>  
    </div>
    </div>





	<br><br><br><br><br><br>
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>

<script>
$(document).ready(function(){
  $("#demo").on("hide.bs.collapse", function(){
    $(".colBtn").html('<span class="glyphicon glyphicon-collapse-down"></span> 더보기');
  });
  $("#demo").on("show.bs.collapse", function(){
    $(".colBtn").html('<span class="glyphicon glyphicon-collapse-up"></span> 닫기');
  });
});
</script>
</body>
</html>