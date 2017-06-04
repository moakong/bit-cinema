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
		<p3>${error}</p3>
		<form action="FindPass" method="post">
			이름 <input type="text" name="name" /><br>
			아이디 <input type="text" name="id" /><br>
			이메일 <input type="text" name="email" /><br>
			<button>비밀번호 찾기</button>
		</form>
	</div>	
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>
</body>
</html>