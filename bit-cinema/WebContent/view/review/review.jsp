<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>
		<div>
			<div>
				<c:out value="======여기에 영화포스터======" />
				<br>
				<c:out value="${ movie.movieName }" />
				<br>
				<fmt:formatDate value="${ movie.releaseDate }" pattern="yyyy-MM-dd" />
				<br>
				<c:out value="${ movie.genre }" />
				<br>
				<c:out value="${ movie.runtime }" />
				<br>
				<c:out value="${ movie.certificate }" />
				<br>
				<c:out value="${ movie.storyline }" />
				<br>
				<br>
				<button
					onclick="location.href='../reservation/selectArea?movieId=${movie.movieId}'">예매하기</button>
			</div>
			<br>
			<br>
			<div>
				<a
					href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }" />">주요정보</a>
				<a href="${pageContext.request.contextPath}">감독/배우</a> <a
					href="${pageContext.request.contextPath}">동영상</a> <a
					href="${pageContext.request.contextPath}">평점</a> <a
					href="${pageContext.request.contextPath}">리뷰</a>
			</div><br><br>
	
			<div>
				<!-- 여기에 내용 -->
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
						<th>추천수</th>
						<th>내용</th>
					</tr>
					<c:forEach var="review" items="${list }">
							<tr>
								<td><c:out value="${review.reviewNo }"/></td>
								<td><a href="${pageContext.request.contextPath}/review/Detail?reviewNo=${review.reviewNo}"> <c:out value="${review.title }"/></a></td>
								<td><c:out value="${review.memberId }"></c:out></td>
								<td><c:out value="${review.regDate }"></c:out></td>
								<td><c:out value="${review.recomCount }"></c:out></td>
								<td><c:out value="${review.content }"></c:out></td>
							</tr>	
				</c:forEach>

				</table>
				
				
				
			</div>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>



</body>
</html>