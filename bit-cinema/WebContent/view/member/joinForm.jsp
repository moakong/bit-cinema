<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<form action="Join" method="post">
					아이디  <input type="text" name="id"/>
					<input type="button" onclick="" value="중복확인"/><br>
					비밀번호  <input type="password" name="pass"/><br>
					비밀번호 확인 <input type="password" name="pass2"/><br>
					이름  <input type="text" name="name"/><br>
					별명 <input type="text" name="nickname"/><br>
					이메일  <input type="text" name="email"/><br>
					휴대전화 <input type="text" name="phone"/><br>
					<button>회원가입</button>
				</form>
			</div>	
			<div>
				<c:import url="/view/include/footer.jsp" />
			</div>	
		</div>
	</body>
</html>