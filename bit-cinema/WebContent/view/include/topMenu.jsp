<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/main/Main">BIT CINEMA</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="${pageContext.request.contextPath}/reservation/selectMovie">예매</a></li>
        <li><a href="${pageContext.request.contextPath}/snack/ListSnack">스토어</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
   	   <c:if test="${!empty user}">
			<img src="<c:out value="${user.profile}"/>" width="50" height="50"/>
			<a href="${pageContext.request.contextPath}/member/Mypage">
				<c:out value="${user.name}"/></a>님 환영합니다.
		</c:if>
		
      	<c:choose>
		 	<c:when test="${empty user}">
	        <li><a href="${pageContext.request.contextPath}/member/LoginForm"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	      	</c:when> 			
			<c:otherwise>
	       	<li><a href="${pageContext.request.contextPath}/member/Logout"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
			</c:otherwise>
	 	</c:choose>
      </ul>
    </div>
  </div>
</nav>

