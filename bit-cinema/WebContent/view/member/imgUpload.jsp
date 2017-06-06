<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>등록할 프로필이미지를 선택해주세요</p>
	
	<c:if test="${ not empty img }">
		<img id="img" src="<c:out value="${pageContext.request.contextPath}/img/member/${ img }"/>" width="100" height="100"/>
	</c:if>
	
	<form action="${pageContext.request.contextPath}/member/ImgUpload" method="post" enctype="multipart/form-data">
			<input type="file" name="attachFile" id="file"/><br>
			<button>선택한 이미지 보기</button>
 	</form>
 	<button onClick="winClose();">이 이미지로 등록</button>
	<script>
		function winClose(){
			var id = document.querySelector("#img");
			var route = id.getAttribute("src");
			opener.doResult(route);
			self.close();
		}
	</script>
</body>
</html>