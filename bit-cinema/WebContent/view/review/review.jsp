<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<a href="<c:out value="${ photo }"/>" onclick="window.open(this.href, '_blank'); return false;">
					<img src="<c:out value="${ photo }"/>" width="300px" height="400px"/>
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
				<button onclick="location.href='../reservation/selectArea?movieId=${movie.movieId}'" >예매하기</button>
			</div>
				<br><br>
			<div>
				<a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }" />">주요정보</a>
				<a href="${pageContext.request.contextPath}/movie/DetailCast?id=<c:out value="${ movie.movieId }" />">감독  / 배우</a>
				<a href="${pageContext.request.contextPath}/movie/DetailMedia?id=<c:out value="${ movie.movieId }" />">동영상 / 포토</a>
				<a href="${pageContext.request.contextPath}">평점</a>
				<a href="${pageContext.request.contextPath}/review/Review?id=<c:out value="${ movie.movieId }" />"/>리뷰</a>
			</div>

			<div>
				<!-- 여기에 내용 -->
				<a href="${pageContext.request.contextPath}/writeform?mid=${ movie.movieId }">리뷰쓰기</a>
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
								<td><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd" /></td>
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