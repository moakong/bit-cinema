<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비트시네마</title>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	

	<div>
		<h2>영화 선택</h2>
		<hr>
		
		<a href="selectMovie?order=name">이름순</a> 
		<a href="selectMovie?order=reservation">예매순</a> <br><br>
		<form action="selectArea">
			<c:forEach var="movie" items="${list}">
			<input type="radio" name="movieId" value="${movie.movieId}" id="${movie.movieId}" /><label for="${movie.movieId}">${movie.movieName}</label><br>
			</c:forEach>
			<br><br><button>다음</button>
		</form>
	</div>
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>











	<script type="text/javascript">
	
	
	
	
	</script>
	
	
</body>
</html>
















