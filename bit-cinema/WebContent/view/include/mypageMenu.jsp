<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul>
	<li>
		<a href="">예매내역</a>
	</li>
	<li>
		<a href="${pageContext.request.contextPath}/cart/ListCart">스토어 장바구니</a>
	</li>
	<li>
		<a href="${pageContext.request.contextPath}/order/detailOrder">스토어 구매내역</a>
	</li>
	<li>
		<a href="${pageContext.request.contextPath}/member/ModifyInfoForm">개인정보변경</a>
	</li>
</ul>