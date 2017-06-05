<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
 
<form action="${pageContext.request.contextPath}/write" method="post">
		<input type="hidden" name="mid" value="${mid }">
	제목<input type="text" name="title"><br>내용<br>
	<textarea cols="50" rows="20" name="content"></textarea><br>
	스포일러<input type="radio" name="spo" value="1" >있음
	<input type="radio" name="spo" value="0" checked="checked">없음<br>

	<button>글작성</button>
</form>		



</body>
</html>