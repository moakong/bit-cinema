<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- sweet alert -->
<script src="../lib/sweetalert.min.js"></script> 
<link rel="stylesheet" href="../lib/sweetalert.css">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{
  /*border:1px solid white;*/
  width: 600px;
  height: 350px;
  position: relative;
/*    top:50%;  */
   left:50%; 
   transform: translate(-50%, 0%); 
  display: inline-flex; 
}
.backbox{  
  background-color: #404040;
  width: 70%;
  height: 80%;
  position: absolute;
   transform: translate(0,-50%); 
   top:50%; 
    left:18%;
  display: inline-flex;
}

.frontbox{
border: 1px solid black;
  background-color: white;
  border-radius: 20px;
  height: 100%;
  width: 30%;
   z-index: 10; 
  position: absolute;
/*    left:300px;  */
  right:0;
  left:53%;
  margin-right: 3%;
  margin-left: 3%;
  transition-property: right,left;
  transition-duration: .8s; 
  transition-timing-function: ease-in-out;
}

.moving{
  right:45%;
   left:17%;
}

.loginMsg, .signupMsg{
  width: 50%;
  height: 100%;
  font-size: 15px;
  box-sizing: border-box;
}

.loginMsg .title,
.signupMsg .title{
padding-bottom:10px;
  font-weight: 300;
  font-size: 23px;
}

.loginMsg p,
.signupMsg p {
  font-weight: 100;
}

.textcontent{
  color:white;
  margin-top:65px;
  margin-left: 12%;
}

.loginMsg button,
.signupMsg button {
  background-color: #404040;
  border: 2px solid white;
  border-radius: 10px;
  color:white;
  font-size: 12px;
  box-sizing: content-box;
  font-weight: 300;
  padding:10px;
  margin-top: 20px;
}

/* front box content*/
.login, .signup{
  padding: 20px;
  text-align: center;
}

.login h2,
.signup h2 {
padding-bottom:15px;
/*   color: #35B729; */
  color: rgb(104, 145, 162);
  font-size:22px;
}

.inputbox{
  margin-top:10px; 
}
.login input, 
.signup input {
  display: block;
  width: 100%;
  height: 40px;
  background-color: #f2f2f2;
  border: none;
  margin-bottom:20px;
  font-size: 12px;
}

.login button,
.signup button{
/*   background-color: #35B729; */
  background-color: rgb(104, 145, 162);
  border: none;
  color:white;
  font-size: 12px;
  font-weight: 300;
  box-sizing: content-box;
  padding:10px;
  border-radius: 10px;
  width: 60px;
  position: absolute;
  right:30px;
  bottom: 30px;
  cursor: pointer;
}

/* Fade In & Out*/
.login p {
  cursor: pointer;
  color:#404040;
  font-size:15px;
}

.loginMsg, .signupMsg{
  /*opacity: 1;*/
  transition: opacity .8s ease-in-out;
}

.visibility{
  opacity: 0;
}

.hide{
  display: none;
}
</style>
</head>
<body>

	<div>
		<c:import url="/view/include/topMenu.jsp" />
	</div>	
	<br><br><br>
		
	<div class="container">
    <div class="backbox">
      <div class="loginMsg">
        <div class="textcontent">
          <p class="title">Forgot the PASSWORD?</p>
          <p>비밀번호를 잊어버리셨나요?</p>
          <button id="switch1">FIND PWD</button>
        </div>
      </div>
      <div class="signupMsg visibility">
        <div class="textcontent">
          <p class="title">Forgot the ID?</p>
          <p>아이디를 잊어버리셨나요?</p>
          <button id="switch2">FIND ID</button>
        </div>
      </div>
    </div>
    <!-- backbox -->



    <div class="frontbox">
	      <div class="login">
<!-- 	      <form action="FindId" method="post"> -->
	        <div class="inputbox">
	        <h2>Find Id</h2>
	        <input type="text" id="iname" placeholder="  NAME">
	          <input type="text" id="iemail" placeholder="  EMAIL">
	         <p>&nbsp;</p> 
	        <button id="findId">FIND ID</button>
	        </div>
<!-- 	        </form> -->
	      </div>
	
	      <div class="signup hide">
	        
<!-- 	        <form action="FindPass" method="post"> -->
	        <div class="inputbox">
	        <h2>Find Password</h2>
	           <input type="text" id="pname" placeholder="  NAME">
	           <input type="text" id="passId" placeholder="  ID">
	          <input type="text" id="pemail" placeholder="  EMAIL">
	        <button id="findPass">FIND PWD</button>
	        </div>
<!-- 	        </form> -->
	      </div>

    </div>
    <!-- frontbox -->
  </div>
		
		
		<br><br><br><br><br>
		
	
	
	<div>
		<c:import url="/view/include/footer.jsp" />
	</div>	

<script>

var $loginMsg = $('.loginMsg'),
$login = $('.login'),
$signupMsg = $('.signupMsg'),
$signup = $('.signup'),
$frontbox = $('.frontbox');

$('#switch1').on('click', function() {
$loginMsg.toggleClass("visibility");
$frontbox.addClass("moving");
$signupMsg.toggleClass("visibility");

$signup.toggleClass('hide');
$login.toggleClass('hide');
})

$('#switch2').on('click', function() {
$loginMsg.toggleClass("visibility");
$frontbox.removeClass("moving");
$signupMsg.toggleClass("visibility");

$signup.toggleClass('hide');
$login.toggleClass('hide');
})


$("#findId").on('click',function(){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/member/FindId",
		type : "POST",
		data : "name="+ $("#iname").val() +"&email="+$("#iemail").val(),
		success : function(data){
			$("#iname").val("");
			$("#iemail").val("");
			if(data.indexOf("없습니다.") == -1){
				swal("찾으시는 아이디는 \r\n"+data+"입니다.");
			}else{
				sweetAlert("Oops...", "입력하신 정보가 없습니다.", "error");			
			}
		}
	});
});


$("#findPass").on('click',function(){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/member/FindPass",
		type : "POST",
		data : "name="+$("#pname").val()+"&passId="+ $("#passId").val() +"&email="+$("#pemail").val(),
		success : function(data){
			$("#pname").val("");
			$("#passId").val("");
			$("#pemail").val("");
			if(data.indexOf("없습니다.") == -1){
				swal("찾으시는 비밀번호는\r\n"+data+"입니다.");
			}else{
				sweetAlert("Oops...", "입력하신 정보가 없습니다.", "error");			
			}
		}
	});
});

// setTimeout(function(){
// $('#switch1').click()
// },1000)

// setTimeout(function(){
// $('#switch2').click()
// },1000)

</script>
</body>
</html>