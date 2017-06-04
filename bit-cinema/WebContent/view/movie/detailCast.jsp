<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>
		<div>
			<div>
				<c:out value="======���⿡ ��ȭ������======" /><br>
				<c:out value="${ movie.movieName }" /><br>
				<fmt:formatDate value="${ movie.releaseDate }" pattern="yyyy-MM-dd"/><br>
				<c:out value="${ movie.genre }" /><br>
				<c:out value="${ movie.runtime }" /><br>
				<c:out value="${ movie.certificate }" /><br>
				<c:out value="${ movie.storyline }" /><br><br>
				<button onclick="location.href='../reservation/selectArea?movieId=${movie.movieId}'" >�����ϱ�</button>
			</div>
				<br><br>
			<div>
				<a href="${pageContext.request.contextPath}/movie/DetailMovie?id=<c:out value="${ movie.movieId }" />">�ֿ�����</a>
				<a href="${pageContext.request.contextPath}/movie/DetailCast?id=<c:out value="${ movie.movieId }" />">����  / ���</a>
				<a href="${pageContext.request.contextPath}/movie/DetailMedia?id=<c:out value="${ movie.movieId }" />">������ / ����</a>
				<a href="${pageContext.request.contextPath}">����</a>
				<a href="${pageContext.request.contextPath}/review/Review?id=<c:out value="${ movie.movieId }" />"/>����</a>
			</div>
			
			<div>
				<h2>����</h2>
				<c:forEach var="director" items="${ directors }">
					<c:out value="======�������̹���======" /><br>
					���� <br>
					<c:out value="${ director.directorName }" /><br>
				</c:forEach>
				<hr>
				
				<h2>���</h2>
				<c:forEach var="actor" items="${ actors }">
					<img width="320" height="240" src="http://t1.search.daumcdn.net/thumb/R438x0.q85/?fname=http%3A%2F%2Fcfile79.uf.daum.net%2Fimage%2F273B565051A55DDB2E41A6"/><br>
					<c:out value="${ actor.type }" /><br>
					<c:out value="${ actor.castName }" /><br>
					<c:out value="${ actor.actorName }" /><br>
				</c:forEach>
			</div>
		</div>
		<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>