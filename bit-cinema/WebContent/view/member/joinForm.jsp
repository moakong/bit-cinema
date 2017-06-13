<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	<script src="../js/library.js"></script>
	</head>
	<body>
	<div>
		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>	
		<div>
			<form id="joinForm" name="join" action="Join" method="post" onsubmit="return check()">
				아이디  <input id="id" type="text" name="id" onkeydown="checkId();" />
				<input id="idCh" type="hidden" value="0"/>
				<div id="checkIdMsg"></div>
				영문자와 숫자조합으로 8~12글자를 입력하세요.<br>
				비밀번호  <input type="password" id="pass" name="pass" maxlength="12" onkeydown="patternCheck();"/>
				<input id="pwdCh" type="hidden" value="0"/>
				<div id="checkPass"></div>
				비밀번호 확인 <input type="password" id="pass2" name="pass2" maxlength="12" onkeyup="checkPass();"/>
				<div id="checkPassMsg"></div>
				이름  <input type="text" name="name"/><br>
				별명 <input type="text" name="nickname"/><br>
				이메일  <input type="text" id="email" name="email"/><br>
				<input id="emailCh"	type="hidden" value="0" />
				휴대전화 <input type="text" id="phone" name="phone" maxlength="11"/><br>
				<input id="phoneCh" type="hidden" value="0"/>
				<button>회원가입</button>
			</form>
		</div>	
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>	
	</div>
	
	<script>
	var idFirst = false;
	var passFirst = false;
	var idKeyword = '';
	var passKeyword = '';
	var loopSendId = false;
	var loopSendPass = false;
	function checkId(){
		if(idFirst == false){
			setTimeout("sendId();", 100);
			loopSendId = true;
		}
		idFirst = true;
	}
	
	function sendId(){
		if (loopSendId == false) return;	  
		var keyword = document.join.id.value;
		if (keyword != idKeyword) {
			idKeyword = keyword;
		   
		   	if (keyword != '') {
		   		$.ajax({
					url : "${pageContext.request.contextPath}/member/IdCheck",
					type : "POST",
					data : "id=" + keyword,
					success : function(data){
						if(data.indexOf("가능") != -1){
							document.getElementById("checkIdMsg").style.color = "blue";
// 							document.getElementById("idCh").value = 1;
 							$("#idCh").val(1);
							console.log(document.join.idCh.value);
// 							$("#").val(1);
						}
						else {
							document.getElementById("checkIdMsg").style.color = "red";
// 							document.getElementById("idCh").value = 0;
 							$("#idCh").val(0);
							console.log(document.join.idCh.value);
// 							$("#idCh").val(0);
						}
						$("#checkIdMsg").html(data);
						console.log($("#idCh").val());
					}
				});
		   	} else {
		   	}
		}
		setTimeout("sendId();", 100);		
	}
	

	function patternCheck(){
		if(passFirst == false){
			setTimeout("sendPass();", 100);
			loopSendPass = true;
		}
		passFirst = true;
	}
	
	
	function sendPass(){
		if (loopSendPass == false) return;	  
		var keyword = document.join.pass.value;
		if (keyword != passKeyword) {
			passKeyword = keyword;
		   
		   	if (keyword != '') {
		   		$.ajax({
					url : "${pageContext.request.contextPath}/member/PwdCheck",
					type : "POST",
					data : "pass=" + keyword,
					success : function(data){
						if(data.indexOf("확인") != -1){
							document.getElementById("checkPass").style.color = "blue";
							$("#pwdCh").val(1);
						}
						else {
							document.getElementById("checkPass").style.color = "red";
							$("#pwdCh").val(0);
						}
						$("#checkPass").html(data);
					}
				});
		   		console.log($("#pwdCh").val());
		   	} else {
		   	}
		}
		setTimeout("sendPass();", 100);
	}
	
	function checkPass(){
		var pw1 = document.join.pass.value;
		var pw2 = document.join.pass2.value;
		if(pw1!=pw2){
			document.getElementById("checkPassMsg").style.color = "red";
			$("#checkPassMsg").html("비밀번호가 일치하지 않습니다."); 		
		}else{
			document.getElementById("checkPassMsg").style.color = "blue";
			$("#checkPassMsg").html("비밀번호가 일치합니다."); 
		}
 
	}
	
	
	$("#email").on("keyup", function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/member/EmailCheck",
			type : "POST",
			data : "email=" + document.join.email.value,
			success : function(data){
				if(data.indexOf("o") != -1){
					$("#emailCh").val(1);
				}
				else {
 					$("#emailCh").val(0);
				}
			}
		});
	});
	
	$("#phone").on("keyup", function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/member/PhoneCheck",
			type : "POST",
			data : "phone=" + document.join.phone.value,
			success : function(data){
				if(data.indexOf("x") == -1){
					$("#phoneCh").val(1);
				}
				else {
					$("#phoneCh").val(0);
				}
			}
		});
	});
	
	
	function check(){
		if(joinForm.id.value == ""){
			alert("아이디를 입력하세요.");
			joinForm.id.focus();
			return false;
		}
		else if(joinForm.idCh.value == 0){
			alert("아이디가 중복됩니다.\r\n다시 입력해주세요");
			joinForm.id.value = "";
			joinForm.id.focus();
			return false;
		}
		else if(joinForm.pass.value == ""){
			alert("비밀번호를 입력하세요.");
			joinForm.pass.focus();
			return false;
		}
		else if(joinForm.pwdCh.value == 0){
			alert("비밀번호 형식에 맞춰 다시 입력해주세요");
			joinForm.pass.value = "";
			joinForm.pass2.value = "";
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
		else if(joinForm.emailCh.value == 0){
			alert("이메일 형식이 맞지않습니다.");
			joinForm.email.value = "";
			joinForm.email.focus();
			return false;
		}
		else if(joinForm.phone.value == ""){
			alert("휴대전화를 입력하세요.");
			joinForm.phone.focus();
			return false;
		}
		else if(joinForm.phoneCh.value == 0){
			alert("휴대전화가 올바르지 않습니다.");
			joinForm.phone.value = "";
			joinForm.phone.focus();
			return false;
		}
		else 
			return true;
	}
	</script>
	</body>
</html>