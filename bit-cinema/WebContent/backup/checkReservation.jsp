<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.well {
    	border: 1px solid gray !important;
        background-color: white !important;
        box-shadow: 3px 3px 5px 1px #9b9ea0 !important;
    }

</style>
</head>
<body>



	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	
	
<div>
	
<%-- 	<div class="container">
		<div>
			<c:import url="/view/include/mypageMenu.jsp" />
		</div>--%>
	<%--<div class="container text-center"> --%>
	
	
	
	
	<div class="container">
	
		<h1>예매 내역</h1>
		<!-- <a href="checkCancelledR">예매 취소 내역</a> -->
	        <p class="text-right">
		        <button class="btn btn-default text-center" onclick="location.href='checkCancelledR'" >예매 취소 내역</button>
             </p> 
       
		<hr style="border-top: 3px double #8c8b8b;"><br>
		
		
		<div>
			<style>
                .well{
                    width: 700px;
                    margin-left: 100px;
                }
            </style>
<%-- 		<c:set var="lastNo" value="0" /> --%>
		<c:forEach var="rInfo" items="${list}">
			<c:if test="${rInfo.reservationId != lastNo}" >
			<div class="well">
				예매번호 : ${rInfo.reservationId}<br><br>
				<strong>${rInfo.movieName}</strong><br>
				비트시네마 ${rInfo.screenName}<br>
				<fmt:formatDate value="${rInfo.startDate}" pattern="yyyy-MM-dd" /><br>
				${rInfo.startTime} ~ ${rInfo.endTime}<br>
				<button class="btn btn-default" onclick="location.href='detailReservation?reservationId=${rInfo.reservationId}'" >상세 내역</button>
			</div>
			<c:set var="lastNo" value="${rInfo.reservationId}" />
			</c:if>
		</c:forEach>
		</div>
		
		<br><br>
		<%-- <button class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}'" >메인 메뉴</button> --%>
	
	
	
	</div>
</div>
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>
		
</div>




</body>
</html>