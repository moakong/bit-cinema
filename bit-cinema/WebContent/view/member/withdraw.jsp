<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- sweet alert -->
<script src="../../lib/sweetalert.min.js"></script> 
<link rel="stylesheet" href="../../lib/sweetalert.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
p.center-block {
border-top: 1px solid black;
width: 80%;
background-color: silver;
/* padding-top: 5px;
padding-bottom: 5px; */

margin-top: 5px;
}
</style>
</head>
<body>
<div>
	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
		<div>
			<c:import url="/view/include/mypageMenu.jsp" />
		</div>
	<div class="container">
		<br><br>
		<div class="col-md-9" > 
		<h3 style="padding-bottom: 10px;">비밀번호 확인</h3>
<br>
		<p class="center-block">&nbsp;&nbsp; 고객님의 개인정보 보호를 위한 절차이오니, 로그인 시 사용하는 비밀번호를 입력해 주세요.</p>
		 <div class="form-horizontal">
		
		
		<div class="form-group">
  			<label class="col-md-5 control-label" for="textinput">Id</label>  
  			<div class="col-md-3">
  			<label class="control-label"><c:out value="${ user.memberId }" /></label>  
  		
  			</div>
	</div>
	
	<div class="form-group">
  <label class="col-md-5 control-label" for="textinput">Password</label>  
  <div class="col-md-3">
  <input id="pass" name="pass" maxlength="12" placeholder="Insert your Password" class="center-block " type="password"/>
				<div id="checkPass"></div>
  </div>
</div>
<p class="center-block"></p>
<br>
	<!-- Button -->
<!--  <div class="form-group"> -->
<!--   <label class="col-md-4 control-label" for="singlebutton"> </label> -->
<!--   <div class="col-md-8"> -->
    <input type="button" class="btn btn-primary center-block" onclick="withdraw();" value="회원탈퇴"/>
<!--     <input type="button" class="btn btn-primary right-block" onclick="withdraw(this.form);" value="회원탈퇴"/> -->
<!--    </div> -->
<!-- </div> -->

 	</div>	
	
	</div>
	</div>
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	
</div>

<script>
function withdraw(){
	console.log($("#pass").val());
	if($("#pass").val() == ""){
		sweetAlert("Oops!", "비밀번호를 입력하세요.", "error");
		$("#pass").focus();
		return false;
	}		
	/* else if(form.pwdCh.value == "0"){
		sweetAlert("Oops!", "비밀번호 형식에 맞춰 다시 입력해주세요.", "error");
		form.pass.value = "";
		form.pass2.value = "";
		form.pass.focus();
		return false;
	}form.pass.value != form.pass2.value){
		sweetAlert("Oops!", "비밀번호가 일치하지 않습니다.", "error");
		form.pass.value = "";
		form.pass2.value = "";
		form.pass.focus();
		return false;
	} */
	else{
		swal({
	
		  title: "Are you sure?",
		  text: "회원탈퇴를 계속 진행하시겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "Yes, delete it!",
		  closeOnConfirm: false
		},
		function(){
		  swal("Deleted!", "Your imaginary file has been deleted.", "success");
// 			location.href="${pageContext.request.contextPath}/member/Withdraw"
 			location.href="${pageContext.request.contextPath}/main/Main"

		});
		
		
	}
	/* var result = confirm("회원탈퇴를 계속 진행하시겠습니까?");
	
	if(result){
	}  */
}
</script>
</body>
</html>