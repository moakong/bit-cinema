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
		<p>아이디와 비밀번호를 입력하고 로그인 버튼을 누르세요.</p>
		<hr>
		<p3>${error}</p3>
		<form id="loginForm" action="Login" method="post" onsubmit="return check()">
			<input type="text" name="id" value="${ id }" /><br>
			<input type="password" name="pass" /><br>
			<input id="id_check" type="checkbox" name="id_rem"
				<c:if test="${ not empty id}">
					checked="checked"
				</c:if>
			/>
			<label for="id_check">아이디 저장</label><br>
			<button>로그인</button>
		</form>
		<br>
		아이디, 비밀번호를 잊어버리셨나요?
		<a href="${pageContext.request.contextPath}/member/FindIdForm">> 아이디 찾기</a>
		<a href="${pageContext.request.contextPath}/member/FindPassForm">> 비밀번호 찾기</a>
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
<script>
	function check(){
		
		if(loginForm.id.value == ""){
			alert("아이디를 입력하세요.");
			loginForm.id.focus();
			return false;
		}
		else if(loginForm.pass.value == ""){
			alert("비밀번호를 입력하세요.");
			loginForm.pass.focus();
			return false;
		}
		else 
			return true;
	}
</script>
</body>
</html>











