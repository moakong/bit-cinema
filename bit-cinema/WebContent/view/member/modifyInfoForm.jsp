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
				<div>
					<c:import url="/view/include/mypageMenu.jsp" />
				</div>
				<form action="ModifyInfo" method="post">
					아이디  <c:out value="${ member.memberId }"/><br>
					비밀번호  <input type="password" name="pass"/><br>
					비밀번호 확인 <input type="password" name="pass2"/><br>
					이름  <c:out value="${ member.name }"/><br>
					별명 <input type="text" name="nickname" value="${ member.nickname }"/><br>
					이메일  <input type="text" name="emailId" value="${ member.emailId }"/>@
					
					<select name="emailAddr">
						<option>naver.com</option>
						<option>daum.com</option>
						<option>gmail.com</option>
						<option>nate.com</option>
						<option>msn.com</option>
					</select><br>
					<input type="radio" id="aE1" name="agreeEmail"/>
					<label for="aE1">수신받기</label>
					<input type="radio" id="aE2" name="agreeEmail"/>
					<label for="aE2">수신받지 않음</label><br>					
					휴대전화 <input type="text" name="phone" value="${ member.phone }"/><br>
					
					<input type="radio" id="aP1" name="agreePhone"/>
					<label for="aP1">수신받기</label>
					<input type="radio" id="aP2" name="agreePhone" />
					<label for="aP2">수신받지 않음</label><br>	
					<button>수정</button>
					<input type="button" onclick="location.href='${pageContext.request.contextPath}/member/Withdraw'" value="회원탈퇴">
				</form>
			</div>	
			<div>
				<c:import url="/view/include/footer.jsp" />
			</div>	
		</div>
</body>
</html>