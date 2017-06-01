<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




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





</body>
</html>