<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/review/update" method="post">
	<input type="hidden" name="no" value="${reviewNo }" >
	<input type="hidden" name="id" value="${id }"> 
	
	수정할 제목 <input type="text" name="title" value="${review.title }"><br><br>
	수정할 내용 <br><textarea rows="30" cols="50" name="content"  >${review.content }</textarea> <br>
	<button>수정</button>
	</form>
</body>
</html>