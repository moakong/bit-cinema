<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="container">
			<div>
				<c:import url="/view/include/mypageMenu.jsp" />
			</div>
			<div>
				<form id="modifyForm" name="modify" action="ModifyInfo" method="post" onsubmit="return check()">
					<img id="img" src="${ member.profile }" width="100" height="100"/><br>
					<button type="button" onclick="uploadProfile(1).doNotSubmit();" >이미지 변경</button>
					<button type="button" onclick="uploadProfile(0).doNotSubmit();" >기본 이미지로 변경</button><br>
					<input type="hidden" id="profile" name="profile" value="${ member.profile }"/>
					아이디 <c:out value="${ member.memberId }" /><br> 
					영문자와 숫자조합으로 8~12글자를 입력하세요.<br>
					비밀번호  <input type="password" id="pass" name="pass" maxlength="12" onkeydown="patternCheck();"/>
					<input id="pwdCh" type="hidden" value="0"/>
					<div id="checkPass" style=""></div>
					비밀번호 확인 <input type="password" id="pass2" name="pass2" maxlength="12" onkeyup="checkPass();"/>
					<div id="checkPassMsg" style=""></div>
					이름 <c:out value="${ member.name }" /><br> 
					별명 <input type="text" name="nickname" value="${ member.nickname }" /><br> 
					이메일 <input type="text" id="email" name="email" value="${ member.email }" /></br>
					<input id="emailCh"	type="hidden" value="1" />
					휴대전화 <input type="text" id="phone" name="phone" value="${ member.phone }" maxlength="11"/><br>
					<input id="phoneCh" type="hidden" value="1"/>
					<button>수정</button>
					<input type="button" onclick="withdraw(this.form);" value="회원탈퇴"/>
				</form>
			</div>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
	<script>
		var passFirst = false;
		var passKeyword = '';
		var loopSendPass = false;
		
		function patternCheck(){
			if(passFirst == false){
				setTimeout("sendPass();", 500);
				loopSendPass = true;
			}
			passFirst = true;
		}
		
		
		function sendPass(){
			if (loopSendPass == false) return;	  
			var keyword = document.modify.pass.value;
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
			   	} else {
			   	}
			}
			setTimeout("sendPass();", 500);
		}
		
		function checkPass(){
			var pw1 = document.modify.pass.value;
			var pw2 = document.modify.pass2.value;
			if(pw1!=pw2){
				document.getElementById("checkPassMsg").style.color = "red";
				$("#checkPassMsg").html("비밀번호가 일치하지 않습니다."); 		
			}else{
				document.getElementById("checkPassMsg").style.color = "blue";
				$("#checkPassMsg").html("비밀번호가 일치합니다."); 
			}
	 
		}
	
		function withdraw(form){
			if(form.pass.value == ""){
				alert("비밀번호를 입력하세요");
				form.pass.focus();
				return false;
			}		
			else if(form.pwdCh.value == "0"){
				alert("비밀번호 형식에 맞춰 다시 입력해주세요");
				form.pass.value = "";
				form.pass2.value = "";
				form.pass.focus();
				return false;
			}
			else if(/*form.pass.value != ||*/form.pass.value != form.pass2.value){
				alert("비밀번호가 일치하지 않습니다.");
				form.pass.value = "";
				form.pass2.value = "";
				form.pass.focus();
				return false;
			}
			var result = confirm("회원탈퇴를 계속 진행하시겠습니까?");
			if(result){
				location.href="${pageContext.request.contextPath}/member/Withdraw"
			} 
		}
		
		function uploadProfile(type) {
			
			switch(type){
			case 0:
				doResult("/bit-cinema/img/member/basicprofile.jpg");
				break;
			case 1:
				window.open(
						"${pageContext.request.contextPath}/view/member/imgUpload.jsp", 
						"프로필 이미지 등록",
						"width=400, height=500"
				);
				break;
			}
		}

		function doResult(route) {
			var img = document.querySelector("#img");
			var profile = document.querySelector("#profile");
			img.setAttribute("src", route);
			profile.setAttribute("value", route);
		}
		

		$("#email").on("keyup", function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/member/EmailCheck",
				type : "POST",
				data : "email=" + document.modify.email.value,
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
				data : "phone=" + document.modify.phone.value,
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
			if(modifyForm.pass.value == ""){
				alert("비밀번호를 입력하세요");
				modifyForm.pass.focus();
				return false;
			}
			else if(modifyForm.pwdCh.value == 0){
				alert("비밀번호 형식에 맞춰 다시 입력해주세요");
				modifyForm.pass.value = "";
				modifyForm.pass2.value = "";
				modifyForm.pass.focus();
				return false;
			}
			else if(modifyForm.pass.value != modifyForm.pass2.value){
				alert("비밀번호가 일치하지 않습니다.");
				modifyForm.pass.value = "";
				modifyForm.pass2.value = "";
				modifyForm.pass.focus();
				return false;
			}
			else if(modifyForm.nickname.value == ""){
				alert("별명을 입력하세요.");
				modifyForm.nickname.focus();
				return false;
			}
			else if(modifyForm.email.value == ""){
				alert("이메일을 입력하세요.");
				modifyForm.email.focus();
				return false;
			}
			else if(modifyForm.emailCh.value == 0){
				alert("이메일 형식이 맞지않습니다.");
				modifyForm.email.value = "";
				modifyForm.email.focus();
				return false;
			}
			else if(modifyForm.phone.value == ""){
				alert("휴대전화를 입력하세요.");
				modifyForm.phone.focus();
				return false;
			}
			else if(modifyForm.phoneCh.value == 0){
				alert("휴대전화가 올바르지 않습니다.");
				modifyForm.phone.value = "";
				modifyForm.phone.focus();
				return false;
			}
			else 
				return true;
		}
	</script>
</body>
</html>