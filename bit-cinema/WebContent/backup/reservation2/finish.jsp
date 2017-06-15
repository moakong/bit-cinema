<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.container{
          padding-top: 50px;
          padding-bottom: 100px;
      }
</style>

</head>
<body>

<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	


<div class="container text-center">
	<div class="well">
		<h1>예매 완료</h1>
		<hr><br>
		<div>
		<strong>${rInfo.movieName}</strong><br>
		비트시네마 ${rInfo.screenName}<br>
		<fmt:formatDate value="${rInfo.startDate}" pattern="yyyy년 MM월 dd일" /><br>
		${rInfo.startTime} ~ ${rInfo.endTime}<br>
		<c:forEach var="seat" items="${sList}">
			[&#${seat.r + 64}-${seat.c}] 
		</c:forEach>
		<br><br>
		</div>
		
		<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}'" >메인페이지로 돌아가기</button>
	</div>
</div>



	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>



</body>
</html>