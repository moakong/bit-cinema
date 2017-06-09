<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>비트시네마</title>
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    hr { 
  height: 30px; 
  border-style: solid; 
  border-color: #8c8b8b; 
  border-width: 1px 0 0 0; 
  border-radius: 20px; 
}  

    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color: black;
    }
      .navbar-brand{
          font-weight: bold;
          color: white;
      }
      
      #nav-font li a{
          color: azure;
      }
      #brand{
          color: white;
      }
</style>
      
</head>

<nav class="navbar navbar-inverse navbar-fixed-top">
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
	        <li><a href="${pageContext.request.contextPath}/member/LoginForm"><span class="glyphicon glyphicon-log-in"></span>&nbsp; 로그인</a></li>
	      	</c:when> 			
			<c:otherwise>
	       	<li><a href="${pageContext.request.contextPath}/member/Logout"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
			</c:otherwise>
	 	</c:choose>
      </ul>
    </div>
  </div>
</nav>

</html>
