<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><c:out value="${ msg }"/></p>
	<form action="${pageContext.request.contextPath}/member/IdCheck" method="post" >
			<input id="id" type="text" name="id" value="<c:out value="${ id }"/>"/>
			<button>중복확인</button>
 	</form><br>
 	<input type="hidden" id="idch" value="<c:out value="${ idch }"/>"/>
 	<button onclick="winClose();">이 아이디 사용하기</button>
	<script>
		function winClose(){
			var id = document.querySelector("#id");
			var idch = document.querySelector("#idch");

			if(idch.value == ""){
				alert("아이디를 입력하세요.");
				return false;
			}
			else if(idch.value == "false"){
				alert("아이디 중복확인 해주세요.");
				return false;
			}
				
			var value = id.getAttribute("value");
			opener.doResult(value, 1);
			self.close();
		}
	</script>
</body>
</html>