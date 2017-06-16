<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- sweet alert -->
<script src="../lib/sweetalert.min.js"></script> 
<link rel="stylesheet" href="../lib/sweetalert.css">
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

		
		<br><br>
		
		
	<div class="col-md-6" >
		<!-- < <h2>Create Your Simple Registration Form</h2>  -->
        
        <form class="form-horizontal" id="modifyForm" name="modify" action="ModifyInfo" method="post" onsubmit="return check();">
		<fieldset>
<!-- 
			Form Name
		<legend>Register Here</legend>  -->

<!-- Text input-->
	<div class="form-group">
	<input type="hidden" id="profile" name="profile" value="${ member.profile }"/>
  			<label class="col-md-4 control-label" for="textinput">Id</label>  
  			<div class="col-md-7">
  			<label class="control-label"><c:out value="${ member.memberId }" /></label>  
  		
<!--   				<input id="id" name="id" onkeydown="checkId();" placeholder="Insert your Id" class="form-control input-md" type="text"/> -->
<!--   				<span class="help-block"></span>   -->
<!-- 		<input id="idCh" type="hidden" value="0"/> -->
<!-- 				<div id="checkIdMsg"></div> -->
  			</div>
	</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput"></label>  
  <div class="col-md-8">
 <span> 영문자와 숫자조합으로 8~12글자를 입력하세요.</span>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Password</label>  
  <div class="col-md-7">
  <input id="pass" name="pass" maxlength="12" onkeydown="patternCheck();" placeholder="Insert your Password" class="form-control input-md" type="password"/>
<!--   <span class="help-block"></span>   -->
<input id="pwdCh" type="hidden" value="0"/>
				<div id="checkPass"></div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Confirm Password</label>  
  <div class="col-md-7">
  <input id="pass2" name="pass2" maxlength="12" onkeyup="checkPass();" placeholder="Confirm your Password" class="form-control input-md" type="password" />
  <span class="help-block"></span>  
  <div id="checkPassMsg"></div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Name</label>  
  <div class="col-md-7">
  <label class="control-label"><c:out value="${ member.name }" /></label>
   <span class="help-block"></span>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Nickname</label>  
  <div class="col-md-7">
  <input name="nickname" value="${ member.nickname }" class="form-control input-md" type="text"/>
	<span class="help-block"></span> 
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Email</label>  
  <div class="col-md-7">
  <input id="email" name="email" value="${ member.email }" class="form-control input-md" type="text"/>
<span class="help-block"></span>
<input id="emailCh"	type="hidden" value="1" />
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Phone</label>  
  <div class="col-md-7">
  <input id="phone" name="phone" maxlength="11" value="${ member.phone }" class="form-control input-md" type="text"/>
<input id="phoneCh" type="hidden" value="1"/>
<span class="help-block"></span>   
  </div>
</div>


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"> </label>
  <div class="col-md-7">
    <button class="btn btn-primary center-block" style="width:50%;">변경</button>
<!--     <input type="button" class="btn btn-primary right-block" onclick="withdraw(this.form);" value="회원탈퇴"/> -->
   </div>
</div>

</fieldset>
</form>
  
	</div>
	
	
	<div class="col-md-3">
					<div class="col-md-8">
	<span class="help-block"></span> <img id="img" src="${ member.profile }" width="140" height="150"/><br>
<!-- 					</div> -->
					<div class="col-md-12"> 
					<span class="help-block"></span>   
					<button type="button" class="btn btn-primary"  onclick="uploadProfile(1).doNotSubmit();" >이미지 변경</button>
					<span class="help-block"></span>   
					<button type="button" class="btn btn-primary"  onclick="uploadProfile(0).doNotSubmit();" >기본 이미지</button><br>
					</div> 
	</div>
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
				sweetAlert("Oops!", "비밀번호를 입력하세요.", "error");
				modifyForm.pass.focus();
				return false;
			}
			else if(modifyForm.pwdCh.value == 0){
				sweetAlert("Oops!", "비밀번호 형식에 맞춰 다시 입력해주세요.", "error");
				modifyForm.pass.value = "";
				modifyForm.pass2.value = "";
				modifyForm.pass.focus();
				return false;
			}
			else if(modifyForm.pass.value != modifyForm.pass2.value){
				sweetAlert("Oops!", "비밀번호가 일치하지 않습니다.", "error");
				modifyForm.pass.value = "";
				modifyForm.pass2.value = "";
				modifyForm.pass.focus();
				return false;
			}
			else if(modifyForm.nickname.value == ""){
				sweetAlert("Oops!", "별명을 입력하세요.", "error");
				modifyForm.nickname.focus();
				return false;
			}
			else if(modifyForm.email.value == ""){
				sweetAlert("Oops!", "이메일을 입력하세요.", "error");
				alert("이메일을 입력하세요.");
				modifyForm.email.focus();
				return false;
			}
			else if(modifyForm.emailCh.value == 0){
				sweetAlert("Oops!", "이메일 형식이 맞지않습니다.", "error");
				modifyForm.email.value = "";
				modifyForm.email.focus();
				return false;
			}
			else if(modifyForm.phone.value == ""){
				sweetAlert("Oops!", "휴대전화를 입력하세요.", "error");
				modifyForm.phone.focus();
				return false;
			}
			else if(modifyForm.phoneCh.value == 0){
				sweetAlert("Oops!", "휴대전화가 올바르지 않습니다.", "error");
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