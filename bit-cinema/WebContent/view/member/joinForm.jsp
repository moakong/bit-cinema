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
			<form id="joinForm" action="Join" method="post" onsubmit="return check()">
				아이디  <input id="id" type="text" name="id"/>
				<input type="button" onclick="overlapCheck(this.form);" value="중복확인"/><br>
				<input type="hidden" id="idch" value=""/>
				비밀번호  <input type="password" name="pass" /><br>
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
	
	<script>
	function overlapCheck(form){
		if(form.id.value == ""){
			alert("아이디를 입력하세요.");
			form.id.focus();
			return false;
		}
		window.open(
			"${pageContext.request.contextPath}/member/IdCheck?id=" + form.id.value, 
			"아이디 중복확인",
			"width=400, height=300"
		);
	}
	
	function doResult(idValue, flag){
		var id = document.querySelector("#id");
		id.value = idValue;
		
		var idch = document.querySelector("#idch");
		idch.setAttribute("value", flag);
	}
	
	function check(){
		if(joinForm.id.value == ""){
			alert("아이디를 입력하세요.");
			joinForm.id.focus();
			return false;
		}
		else if(joinForm.idch.value != 1){
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		else if(joinForm.pass.value == ""){
			alert("비밀번호를 입력하세요.");
			joinForm.pass.focus();
			return false;
		}
		else if(joinForm.pass.value != joinForm.pass2.value){
			alert("비밀번호가 일치하지 않습니다.");
			joinForm.pass.value = "";
			joinForm.pass2.value = "";
			joinForm.pass.focus();
			return false;
		}
		else if(joinForm.name.value == ""){
			alert("이름을 입력하세요.");
			joinForm.name.focus();
			return false;
		}
		else if(joinForm.nickname.value == ""){
			alert("별명을 입력하세요.");
			joinForm.nickname.focus();
			return false;
		}
		else if(joinForm.email.value == ""){
			alert("이메일을 입력하세요.");
			joinForm.email.focus();
			return false;
		}
		else if(joinForm.phone.value == ""){
			alert("휴대전화를 입력하세요.");
			joinForm.phone.focus();
			return false;
		}
		else 
			return true;
	}
	</script>
	</body>
</html>