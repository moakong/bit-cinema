<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	.btn {
		border-radius: 1px solid blakc !important;
		background-color: skyblue !important;
	}
	
	.btn-group{
		margin-top : 30px;
		margin-left: 30px;
		width: 750px;
	}
</style>
<div class="btn-group btn-group-justified center-block" style="width 500px;">
	<a href="${pageContext.request.contextPath}/snack/ListSnack?category=5" class="btn btn-info">베스트</a>
	<a href="${pageContext.request.contextPath}/snack/ListSnack?category=3" class="btn btn-info">콤보</a>
	<a href="${pageContext.request.contextPath}/snack/ListSnack?category=1" class="btn btn-info">팝콘</a>
	<a href="${pageContext.request.contextPath}/snack/ListSnack?category=2" class="btn btn-info">음료</a>
	 <a href="${pageContext.request.contextPath}/snack/ListSnack?category=4" class="btn btn-info">스낵</a>
</div> 
