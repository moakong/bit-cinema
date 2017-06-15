<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

		<div>
			<c:import url="/view/include/topMenu.jsp" />
		</div>
 
<form action="${pageContext.request.contextPath}/write" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mid" value="${mid }">
	제목<input type="text" name="title"><br>내용<br>
	<textarea cols="50" rows="20" name="content"></textarea><br>
	스포일러<input type="radio" name="spo" value="1" >있음
	<input type="radio" name="spo" value="0" checked="checked">없음<br>
	첨부파일<input type="file" name="f">
	<button>글작성</button>
</form>		

		<div>
			<c:import url="/view/include/footer.jsp" />
		</div>

<script >



</script>

</body>
</html>