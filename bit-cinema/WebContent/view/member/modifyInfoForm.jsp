<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
			<div>
				<c:import url="/view/include/topMenu.jsp" />
			</div>	
			<div>
				<div>
					<c:import url="/view/include/mypageMenu.jsp" />
				</div>
				<div>
					<form action="ModifyInfo" method="post">
						아이디  <c:out value="${ member.memberId }"/><br>
						비밀번호  <input type="password" name="pass"/><br>
						비밀번호 확인 <input type="password" name="pass2"/><br>
						이름  <c:out value="${ member.name }"/><br>
						별명 <input type="text" name="nickname" value="${ member.nickname }"/><br>
						이메일  <input type="text" name="email" value="${ member.email }"/>
						휴대전화 <input type="text" name="phone" value="${ member.phone }"/><br>
						<button>수정</button>
						<input type="button" onclick="location.href='${pageContext.request.contextPath}/member/Withdraw'" value="회원탈퇴">
					</form>
				</div>
			</div>	
			<div>
				<c:import url="/view/include/footer.jsp" />
			</div>	
		</div>
</body>
</html>