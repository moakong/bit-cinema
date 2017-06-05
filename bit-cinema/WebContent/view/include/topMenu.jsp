<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a href="${pageContext.request.contextPath}/main/Main"><h1>BIT Cinema</h1></a>

<ul>
	<li>
		<a href="${pageContext.request.contextPath}/reservation/selectMovie">예매</a>
	</li>
	<li>
		<a href="${pageContext.request.contextPath}/snack/Snack">스토어</a>
	</li>
	<c:choose>
	 	<c:when test="${empty user}">
			<li><a href="${pageContext.request.contextPath}/member/LoginForm">로그인</a></li>
		</c:when> 			
		<c:otherwise>
			<li><a href="${pageContext.request.contextPath}/member/Logout">로그아웃</a></li>
		</c:otherwise>
	 </c:choose>
</ul>
<hr>