<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div>
				<c:import url="/view/include/mypageMenu.jsp" />
			</div>
			<div>
				<form id="modifyForm" action="ModifyInfo" method="post" onsubmit="return check()">
					<img id="img" src="${ member.profile }" width="100" height="100"/><br>
					<button type="button" onclick="uploadProfile(1).doNotSubmit();" >이미지 변경</button>
					<button type="button" onclick="uploadProfile(0).doNotSubmit();" >기본 이미지로 변경</button><br>
					<input type="hidden" id="profile" name="profile" value="${ member.profile }"/>
					아이디 <c:out value="${ member.memberId }" /><br> 
					비밀번호 <input type="password" name="pass" /><br> 
					비밀번호 확인 <input type="password" name="pass2" /><br> 
					이름 <c:out value="${ member.name }" /><br> 
					별명 <input type="text" name="nickname" value="${ member.nickname }" /><br> 
					이메일 <input type="text" name="email" value="${ member.email }" /></br>
					휴대전화 <input type="text" name="phone" value="${ member.phone }" /><br>
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
		function withdraw(form){
			if(form.pass.value == ""){
				alert("비밀번호를 입력하세요");
				form.pass.focus();
				return false;
			}else if(/*form.pass.value != ||*/form.pass.value != form.pass2.value){
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
		
		function check(){
			if(modifyForm.pass.value == ""){
				alert("비밀번호를 입력하세요");
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
			else if(modifyForm.phone.value == ""){
				alert("휴대전화를 입력하세요.");
				modifyForm.phone.focus();
				return false;
			}
			else 
				return true;
		}
	</script>
</body>
</html>