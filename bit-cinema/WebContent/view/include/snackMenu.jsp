<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	.btn {
		background-color: #cdc197 !important;
		border-radius: 1px solid blakc !important;
		color: black !important;
	}
	.btn-group{
		margin-top : 30px;
		margin-left: 30px;
		width: 750px;
	}
</style>
<div class="btn-group btn-group-justified">
	<a href="${pageContext.request.contextPath}/snack/ListSnack?category=5" class="btn btn-primary">베스트</a>
	<a href="${pageContext.request.contextPath}/snack/ListSnack?category=3" class="btn btn-primary">콤보</a>
	<a href="${pageContext.request.contextPath}/snack/ListSnack?category=1" class="btn btn-primary">팝콘</a>
	<a href="${pageContext.request.contextPath}/snack/ListSnack?category=2" class="btn btn-primary">음료</a>
	 <a href="${pageContext.request.contextPath}/snack/ListSnack?category=4" class="btn btn-primary">스낵</a>
</div> 
<%-- <div class="btn-group">
	<button onclick="location.href='${pageContext.request.contextPath}/snack/ListSnack?category=5'" class="btn btn-primary">베스트</button>
	<button onclick="location.href='${pageContext.request.contextPath}/snack/ListSnack?category=3'" class="btn btn-primary">콤보</button>
	<button onclick="location.href='${pageContext.request.contextPath}/snack/ListSnack?category=1'" class="btn btn-primary">팝콘</button>
	<button onclick="location.href='${pageContext.request.contextPath}/snack/ListSnack?category=2'" class="btn btn-primary">음료</button>
	<button onclick="location.href='${pageContext.request.contextPath}/snack/ListSnack?category=4'" class="btn btn-primary">스낵</button>
</div> --%>
