<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/starability-all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.star{
display: inline;
}
tabel,tr,td {
border: 1px solid black;
}
tr, td {
height: 20px;
margin: 10px;
padding: 20px;
}


.well {
    	border: 1px solid gray !important;
        background-color: white !important;
        box-shadow: 3px 3px 5px 1px #9b9ea0 !important;
       
        width: 100%;
        height: 120px;
        margin: auto;
    }


</style>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
		<div>
			<c:import url="/view/include/mypageMenu.jsp" />
		</div>
	<div class="container">
<!-- 		<div> -->
<!-- 			<p>마이페이지 메인화면입니다</p> -->
<!-- 		</div> -->
<!-- 			<h3>내가 예매한 영화</h3> -->
<!-- 		<div> -->
<!-- 			<div class="well" style="height:150px;"> -->
<%-- 			<c:forEach var="rInfo" items="${reservations}"> --%>
<!-- 			<div class="col-sm-4"> -->
<%-- 					<strong>${rInfo.movieName}</strong><br> --%>
<%-- 					비트시네마 ${rInfo.screenName}<br> --%>
<%-- 					<fmt:formatDate value="${rInfo.startDate}" pattern="yyyy-MM-dd" /><br> --%>
<%-- 					${rInfo.startTime} ~ ${rInfo.endTime}<br> --%>
<!-- 					</div> -->
<%-- 					</c:forEach> --%>
<!-- 			</div>		 -->
					
			<br>
			<h3>내가 쓴 평점</h3>
		<div>
			<div class="well" style="min-height:150px;">
<!-- 			style="margin-top:-5px;" -->
			<ul>
			<c:forEach var="r" items="${ratings}" varStatus="v">
			<div class="row" style=" width:100%; height:25px;">
			
<!--  			<div class="col-sm-10"> -->
			<li >	<c:out value="${ratingMovie[v.index].movieName}"/>
<%-- 				<td style="width:200px;"><div class='star starability-result' data-rating='${r.rating}' aria-describedby='rated-element'></div></td> --%>
				<c:out value="${r.content}"/>
				<fmt:formatDate value="${r.regDate}" pattern="yyyy-MM-dd" />
<!-- 				</div> -->
</li>			
 			</div>
			</c:forEach>
		</ul>
			</div>
			<br>
		</div>
			<h3>내가 쓴 리뷰</h3>
		<div>
			<div class="well" style="min-height:150px;">
<ul>
			<c:forEach var="r" items="${reviews}" varStatus="v">
			<div class="row" style="width:100%; height:25px;">
			<div class="col-sm-10">
			<li>	<c:out value="${rivewMovie[v.index].movieName}"/>
				<c:out value="${r.title}"/>
				<fmt:formatDate value="${r.regDate}" pattern="yyyy-MM-dd" />
			</li>
			</div>
			</div>
			</c:forEach>
</ul>			
			</div>
		</div>
	</div>	
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>