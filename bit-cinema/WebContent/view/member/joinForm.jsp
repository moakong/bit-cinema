<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	<!-- <script src="../view/js/library.js"></script>
 -->

	</head>
	<body>
	<div>
		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>	
		
		
<div class="container">
	<div class="row">
		<!-- < <h2>Create Your Simple Registration Form</h2>  -->
        
        <form class="form-horizontal" id="joinForm" name="join" action="Join" method="post" onsubmit="return check();">
		<fieldset>
<!-- 
			Form Name
		<legend>Register Here</legend>  -->

<!-- Text input-->
	<div class="form-group">
  			<label class="col-md-4 control-label" for="textinput">Id</label>  
  			<div class="col-md-4">
  				<input id="id" name="id" onkeydown="checkId();" placeholder="Insert your Id" class="form-control input-md" type="text"/>
<!--   				<span class="help-block"></span>   -->
		<input id="idCh" type="hidden" value="0"/>
				<div id="checkIdMsg"></div>
  			</div>
	</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput"></label>  
  <div class="col-md-4">
 <span> 영문자와 숫자조합으로 8~12글자를 입력하세요.</span>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Password</label>  
  <div class="col-md-4">
  <input id="pass" name="pass" maxlength="12" onkeydown="patternCheck();" placeholder="Insert your Password" class="form-control input-md" type="password"/>
<!--   <span class="help-block"></span>   -->
<input id="pwdCh" type="hidden" value="0"/>
				<div id="checkPass"></div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Confirm Password</label>  
  <div class="col-md-4">
  <input id="pass2" name="pass2" maxlength="12" onkeyup="checkPass();" placeholder="Confirm your Password" class="form-control input-md" type="password" />
  <span class="help-block"></span>  
  <div id="checkPassMsg"></div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Name</label>  
  <div class="col-md-4">
  <input name="name" placeholder="Insert your Name" class="form-control input-md" type="text"/>
   <span class="help-block"></span>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Nickname</label>  
  <div class="col-md-4">
  <input name="nickname" placeholder="Insert your Nickname" class="form-control input-md" type="text"/>
	<span class="help-block"></span> 
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Email</label>  
  <div class="col-md-4">
  <input id="email" name="email" placeholder="Insert your Email" class="form-control input-md" type="text"/>
<span class="help-block"></span>
<input id="emailCh"	type="hidden" value="0" />
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Phone</label>  
  <div class="col-md-4">
  <input id="phone" name="phone" maxlength="11" placeholder="Insert your Phone" class="form-control input-md" type="text"/>
<input id="phoneCh" type="hidden" value="0"/>
<span class="help-block"></span>   
  </div>
</div>


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"> </label>
  <div class="col-md-4">
    <button class="btn btn-primary btn-block">Submit</button>
  </div>
</div>

</fieldset>
</form>
  
	</div>
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
			setTimeout("sendId();", 500);
			loopSendId = true;
		}
		idFirst = true;
	}
	
	function sendId(){
		if (loopSendId == false) return;	  
		var keyword = joinForm.id.value;
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
							//console.log(document.join.idCh.value);
// 							$("#").val(1);
						}
						else {
							document.getElementById("checkIdMsg").style.color = "red";
// 							document.getElementById("idCh").value = 0;
 							$("#idCh").val(0);
							//console.log(document.join.idCh.value);
// 							$("#idCh").val(0);
						}
						$("#checkIdMsg").html(data);
						console.log($("#idCh").val());
					}
				});
		   	} else {
		   	}
		}
		console.log("?");
		setTimeout("sendId();", 500);		
	}
	

	function patternCheck(){
		if(passFirst == false){
			setTimeout("sendPass();", 500);
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
		setTimeout("sendPass();", 500);
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