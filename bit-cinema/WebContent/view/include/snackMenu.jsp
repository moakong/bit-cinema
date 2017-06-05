<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul>
	<li><a href="${pageContext.request.contextPath}/snack/ListSnack?category=5">베스트</a></li>
	<li><a href="${pageContext.request.contextPath}/snack/ListSnack?category=3">콤보</a></li>
	<li><a href="${pageContext.request.contextPath}/snack/ListSnack?category=1">팝콘</a></li>
	<li><a href="${pageContext.request.contextPath}/snack/ListSnack?category=2">음료</a></li>
	<li><a href="${pageContext.request.contextPath}/snack/ListSnack?category=4">스낵</a></li>
</ul>