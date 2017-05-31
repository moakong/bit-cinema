<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	<div>
		<h2>로그인</h2>
		<hr>
		<p>${error}</p>
		<form action="Login" method="post">
			<input type="text" name="id" /><br>
			<input type="password" name="pass" /><br>
			<button>로그인</button>
		</form>
		<br>
		아이디. 비밀번호를 잊어버리셨나요? 나도몰라여
		<br>
		<p>
			비트씨네마 회원이 아니신가요? 
			<input type="button" onclick="location.href='${pageContext.request.contextPath}/member/JoinForm'" value='회원가입'/>
		</p>
	</div>	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>	
</body>
</html>











