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
				<form action="ModifyInfo" method="post">
					<img id="img" src="${ member.profile }" width="100" height="100"/><br>
					<button type="button" onclick="uploadProfile().doNotSubmit();" >이미지 변경</button><br>
					<input type="hidden" id="profile" name="profile" value="${ member.profile }"/>
					아이디 <c:out value="${ member.memberId }" /><br> 
					비밀번호 <input type="password" name="pass" /><br> 
					비밀번호 확인 <input type="password" name="pass2" /><br> 
					이름 <c:out value="${ member.name }" /><br> 
					별명 <input type="text" name="nickname" value="${ member.nickname }" /><br> 
					이메일 <input type="text" name="email" value="${ member.email }" /></br>
					휴대전화 <input type="text" name="phone" value="${ member.phone }" /><br>
					<button>수정</button>
					<input type="button" onclick="location.href='${pageContext.request.contextPath}/member/Withdraw'" value="회원탈퇴"/>
				</form>
			</div>
		</div>
		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>
	</div>
	<script>
		function uploadProfile() {
			window.open(
					"${pageContext.request.contextPath}/view/member/imgUpload.jsp", 
					"프로필 이미지 등록",
					"width=400, height=300"
			);
		}

		function doResult(route) {
			var img = document.querySelector("#img");
			var profile = document.querySelector("#profile");
			//console.log(route);
			img.setAttribute("src", route);
			profile.setAttribute("value", route);
		}
	</script>
</body>
</html>